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

      register_auth_providers do
        settings = Rails.root.join('config', 'plugins', 'auth_idq', 'settings.yml')
        if settings.exist?
          providers = YAML::load(File.open(settings)).symbolize_keys
          strategy :idq do
            providers.values.map do |h|
              h[:openproject_attribute_map] = Proc.new do |auth|
                {
                  login: auth[:uid]
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
