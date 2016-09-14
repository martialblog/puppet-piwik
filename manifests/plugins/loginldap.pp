# == Class: piwik::plugins::loginldap
#
class piwik::plugins::loginldap (

  $package_url = 'https://plugins.piwik.org/api/2.0/plugins/LoginLdap/download/3.3.1',
  $user        = $piwik::user,
  $path        = $piwik::path,

) {

  if !defined(Package['unzip']) {
    package { 'unzip': }
  }

  exec { 'piwik-plugin-loginldap-download':
    path    => '/bin:/usr/bin',
    creates => "${path}/plugins/LoginLdap",
    command => "bash -c 'wget --no-check-certificate -O/tmp/loginldap.zip ${package_url}'",
    user    => $user,
    require => Class['piwik'],
  }

  exec { 'piwik-plugin-loginldap-extract':
    path    => '/bin:/usr/bin',
    creates => "${path}/plugins/LoginLdap",
    command => "bash -c 'unzip /tmp/loginldap.zip -d ${path}/plugins/'",
    user    => $user,
    require => [ Class['piwik'], Exec['piwik-plugin-loginldap-download'], Package['unzip'] ],
  }

  file { '/tmp/loginldap.zip':
    ensure  => absent,
    require => Exec['piwik-plugin-loginldap-extract'],
  }

}
