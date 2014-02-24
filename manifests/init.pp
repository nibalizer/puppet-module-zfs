# A class to manage ZFS on ubuntu hosts
class zfs(
  $fuse = false,
){

  if $fuse { 

    package { 'zfs-fuse':
      ensure => present,
    }

  } else {

    stage { 'ppa':
      before => Stage['main'],
    }
    
    # install the ppa repos
    class {'repo':
      stage => ppa,
    }->
    package {'ubuntu-zfs':
      ensure => latest,
    }->
    package {'zfs-auto-snapshot':
      ensure => latest,
    }
  }
}