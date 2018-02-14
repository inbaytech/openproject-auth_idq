# encoding: UTF-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'open_project/auth_idq/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'openproject-auth_idq'
  s.version     = OpenProject::AuthIdq::VERSION
  s.authors     = 'inBay Technologies Inc.'
  s.email       = 'support@inbaytech.com'
  s.homepage    = 'https://github.com/inbaytech/openproject-auth_idq'
  s.summary     = 'OmniAuth idQ Trust as a Service Login'
  s.description = 'Adds the OmniAuth idQ provider to OpenProject'
  s.license     = 'MIT'

  s.files = Dir['{app,lib}/**/*'] + %w(README.md)

  s.add_dependency 'omniauth-idq', '~> 1.0'
end
