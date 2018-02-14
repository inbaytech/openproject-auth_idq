# OpenProject OmniAuth idQ Trust as a Service

This plugin provides the [OmniAuth idQ strategy](https://github.com/inbaytech/omniauth-idq) into OpenProject.

## Installation

Add the following entries to your `Gemfile.plugins` in your OpenProject root directory:

    gem 'openproject-auth_plugins', git: 'https://github.com/opf/openproject-auth_plugins', branch: 'release/7.4'
    gem "openproject-auth_idq", git: 'https://github.com/inbaytech/openproject-auth_idq'

## Requirements

* [omniauth-idq gem](https://github.com/inbaytech/omniauth-idq) >= 1.0.0
* [OpenProject](https://www.openproject.org) >= 7.4
* [openproject-auth_plugins](https://github.com/opf/openproject-auth_plugins) >= 7.4

## Configuration

See [their configuration documentation](https://github.com/inbaytech/omniauth-idq) for further details.

### Custom Provider Icon

To add a custom icon to be rendered as your omniauth provider icon, add an
image asset to OpenProject and reference it in your `settings.yml`:

	icon: "my/asset/path/to/icon.png"

## Copyrights & License

OpenProject idQ Auth is completely free and open source and released under the [MIT License](https://github.com/inbaytech/openproject-auth_idq/blob/dev/LICENSE).

Copyright (c) 2018 inBay Technologies Inc.

The default provider icon is a combination of icons from [Font Awesome by Dave Gandy](http://fontawesome.io).
