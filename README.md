[![Build Status](https://travis-ci.org/martialblog/puppet-piwik.svg?branch=master)](https://travis-ci.org/martialblog/puppet-piwik)

# piwik

A puppet module to easily deploy Piwik. This module only downloads the latest Piwik archive and extracts it to a given path.

You have to install `php5` nd configure your own SQL/web server.

## Suggested Preparation

This module is as simple as possible. You should be able to choose
your own php installation.

1. First I install the
   [nodes/php](https://forge.puppetlabs.com/nodes/php) module.

```
puppet module install nodes/php
```

2. Using this module I install the necessary php packages. For serving
   php I use php-fpm with nginx.

```
class { 'php::extension::mysql': }
class { 'php::extension::mcrypt': }
class { 'php::extension::gd': }
class { 'php::fpm::daemon':
  ensure => running
}
```

3. Then install Piwik. See [[Usage]].

4. At last you may set up your vhost. This is depending on the server module you are using.

## Usage

```
  class { 'piwik':
    path => "/srv/piwik",
    user => "www-data",
  }
```

*Please note:* After the first installation you have to initialize
 Piwik by bootstrapping the database. For this use the setup gui in
 your browser according to the Piwik installation manual.

## Plugins

### LoginLdap

LoginLdap is a plugin to enable LDAP authentication.

Just make sure you have `php-ldap` installed. Either via a puppet
module like `nodes/php` or via the package resource.

Then use:

```
  class { 'piwik::plugins::loginldap': }
```

## Contribute

This is a fork of Arthur Leonard Andersen's Module https://github.com/velaluqa/puppet-piwik
Since there was no further development on the original repository.

Pull requests are welcome
