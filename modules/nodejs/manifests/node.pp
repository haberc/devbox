class nodejs::node {
  package {"nodejs":
    ensure => "installed"
  }

  package {"npm":
    ensure => "installed",
    require => Package['nodejs']
  }

  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
    require => Package['nodejs']
  }
}
