# A class to manage ZFS on ubuntu hosts
class zfs(
  $fuse = false,
){

  if $fuse { 

    package { 'zfs-fuse':
      ensure => present,
    }

  } else {

    apt::ppa { 'ppa:zfs-native/stable': }

    package {'ubuntu-zfs':
      ensure => latest,
    }
    package {'zfs-auto-snapshot':
      ensure => latest,
    }
  }


}
