require 'omniauth-idq'
module OpenProject
  module AuthIdq
    class Engine < ::Rails::Engine
      engine_name :openproject_auth_idq

      include OpenProject::Plugins::ActsAsOpEngine
      extend OpenProject::Plugins::AuthPlugin

      register 'openproject-auth_idq',
               author_url: 'https://github.com/inbaytech/openproject-auth_idq',
               requires_openproject: '>= 7.4.0'

      assets %w(
        auth_idq/**
      )

      config.after_initialize do
        # Automatically update the openproject user whenever their info change in the upstream identity provider
        OpenProject::OmniAuth::Authorization.after_login do |user, auth_hash, context|
          # see https://github.com/opf/openproject/blob/caa07c5dd470f82e1a76d2bd72d3d55b9d2b0b83/app/controllers/concerns/omniauth_login.rb#L148
          user.update_attributes context.send(:omniauth_hash_to_user_attributes, auth_hash)
        end
      end

      register_auth_providers do
        settings = Rails.root.join('config', 'plugins', 'auth_idq', 'settings.yml')
        if settings.exist?
          providers = YAML::load(File.open(settings)).symbolize_keys
          strategy :idq do
            providers.values.map do |h|
              h[:openproject_attribute_map] = Proc.new do |auth|
                {
                  login: auth[:uid],
                  admin: (auth.info['admin'].to_s.downcase == "true")
                }
              end
              h.symbolize_keys
            end
          end
        else
          Rails.logger.warn("[auth_idq] Missing settings from '#{settings}', skipping omniauth registration.")
        end
      end
    end
  end
end
