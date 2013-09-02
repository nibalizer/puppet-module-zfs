# A class to manage ZFS on ubuntu hosts
class zfs(
){

  apt::ppa { 'ppa:zfs-native/stable': }

  package {'ubuntu-zfs':
    ensure => latest,
  }
  package {'zfs-auto-snapshot':
    ensure => latest,
  }


}
