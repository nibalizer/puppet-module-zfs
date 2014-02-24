# A class to manage ZFS on ubuntu hosts
class zfs(
  $fuse = false,
){

  if $fuse { 

    package { 'zfs-fuse':
      ensure => present,
    }

  } else {

    include apt
    package {'python-software-properties':
      ensure => present,
    }

    apt::ppa { 'ppa:zfs-native/stable/ubuntu': 
      require => Package['python-software-properties'], 
    }

    package {'ubuntu-zfs':
      ensure => latest,
    }
    package {'zfs-auto-snapshot':
      ensure => latest,
    }
  }
}
