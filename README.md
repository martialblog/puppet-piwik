[![Build Status](https://travis-ci.org/martialblog/puppet-piwik.svg?branch=master)](https://travis-ci.org/martialblog/puppet-piwik)

# piwik

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with piwik](#setup)
    * [Beginning with piwik](#beginning-with-piwik)
    1. [Usage - Configuration options and additional functionality](#usage)
    1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    1. [Limitations - OS compatibility, etc.](#limitations)
    1. [Development - Guide for contributing to the module](#development)

## Description

A Puppet module to easily deploy Piwik.
This module only downloads the latest Piwik archive and extracts it to a given path.

You have to install `php5` and configure your own SQL/web server.

## Usage

A basic example using both webserver and database
```puppet
  class { 'piwik':
    path => "/srv/piwik",
    user => "www-data",
  }
```

*Please note:* After the first installation you have to initialize
 Piwik by bootstrapping the database. For this use the setup gui in
 your browser according to the Piwik installation manual.

### Additional Informations

1. First I install the
   [nodes/php](https://forge.puppetlabs.com/nodes/php) module.

```puppet
puppet module install nodes/php
```

2. Using this module I install the necessary php packages. For serving
   php I use php-fpm with nginx.

```puppet
class { 'php::extension::mysql': }
class { 'php::extension::mcrypt': }
class { 'php::extension::gd': }
class { 'php::fpm::daemon':
  ensure => running
}
```

3. Then install Piwik. See [[Usage]].

4. At last you may set up your vhost. This is depending on the server module you are using.

## Reference

## Classes

#### Public classes

* [`piwik::init`]: Downloads the Piwik code from piwik.org
* [`piwik::plugins::loginldap`]: Downloads the LoginLdap Plugin from piwik.org

For details on parameters see manifests

## Limitations

This module has been tested on:
* Debian 7, 8
* CentOS 7

## Plugins

### LoginLdap

LoginLdap is a plugin to enable LDAP authentication.

Just make sure you have `php-ldap` installed. Either via a Puppet
module like `nodes/php` or via the package resource.

```puppet
  class { 'piwik::plugins::loginldap': }
```

## Development

For further details see CONTRIBUTING.md

## Authors

This is a fork of Arthur Leonard Andersen's Module: https://github.com/velaluqa/puppet-piwik

Since there was no further development on the original repository.

