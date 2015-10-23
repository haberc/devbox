class nfs::server {
  package {"nfs-common":
    ensure => "installed"
  }
  package {"nfs-kernel-server":
    ensure => "installed"
  }

  service{ 'nfs-kernel-server':
    require => Package['nfs-kernel-server'],
    ensure => "running"
  }

  $nfs_entry='/home/vagrant 0.0.0.0/0.0.0.0(rw,sync,no_subtree_check,insecure,all_squash,anonuid=1000,anongid=1000)'

  file {"/etc/exports":
    owner => "root",
    group => "root",
    mode => 600,
    content => "${nfs_entry}\n",
    require => Package['nfs-kernel-server'],
    notify => Service['nfs-kernel-server']
  }
}
