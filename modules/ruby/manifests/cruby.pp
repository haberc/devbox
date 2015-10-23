class ruby::cruby {

  package {"ruby2.0":
    ensure => "installed"
  }

  file { '/usr/bin/ruby':
    ensure => 'link',
    target => '/usr/bin/ruby2.0',
    require => Package['ruby2.0']
  }

  package { 'bundler':
    ensure   => 'installed',
    provider => 'gem',
    require => Package['ruby2.0']
  }
}
