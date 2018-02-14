# OpenProject OmniAuth idQ Trust as a Service

This plugin provides the [OmniAuth idQ strategy](https://github.com/inbaytech/omniauth-idq) into OpenProject.

## Requirements

* [OpenProject](https://www.openproject.org) >= 7.4
* [omniauth-idq gem](https://github.com/inbaytech/omniauth-idq) >= 1.0.0
* [openproject-auth_plugins](https://github.com/opf/openproject-auth_plugins) >= 7.4 which is now included by default with OpenProject.

## Installation

For OpenProject 7.4, add the following entries to your `Gemfile.plugins` in your OpenProject root directory:

```
  gem "omniauth-idq"
  gem "openproject-auth_idq", git: 'https://github.com/inbaytech/openproject-auth_idq'
```

When adding new plugins, it's a good idea to run

```
$ openproject run bundle install --no-deployment
$ openproject run rake assets:precompile
```


## Configuration

Create a `settings.yml` file relative to your OpenProject root directory, for example if your root directory is `/opt/openproject`, create `/opt/openproject/config/plugins/auth_idq/settings.yml`.

At a minimum you need to specify `client_id` and `client_secret` values. Here is an example `settings.yml` file:

```
idq-taas:
  name: "idq-taas"
  display_name: "Login with idQ TaaS"
  client_id: "72574d42c34e2d4190c171f8fae61f71"
  client_secret: "6da274e446dac916b9ec5458936b9313"
```

You can obtain your own OAuth credentials from the [idQ TaaS Account Portal](https://idquanta.com/account). Make sure to specify the callback URL correctly! With the `settings.yml` configuration above, the callback URL would be:

```
https://your.openproject.host.com/auth/idq-taas/callback
```


See [their configuration documentation](https://github.com/inbaytech/omniauth-idq) for further details.

### Custom Provider Icon

To add a custom icon to be rendered as your omniauth provider icon, add an
image asset to OpenProject and reference it in your `settings.yml`:

	icon: "my/asset/path/to/icon.png"

## Copyrights & License

OpenProject idQ Auth is completely free and open source and released under the [MIT License](https://github.com/inbaytech/openproject-auth_idq/blob/dev/LICENSE).

Copyright (c) 2018 inBay Technologies Inc.

The default provider icon is a combination of icons from [Font Awesome by Dave Gandy](http://fontawesome.io).
