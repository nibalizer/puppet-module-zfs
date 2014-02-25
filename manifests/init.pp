# A class to manage ZFS on ubuntu hosts
class zfs(
  $fuse = false,
){
  case $::operatingsystem {
    ubuntu : {
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
        }
        #ubuntu 13.10 does not have this package!
        case $::lsbdistrelease {
          10.04,12.04,12.10,13.04 : {
            package {'zfs-auto-snapshot':
              ensure  => latest,
              require => Package['ubuntu-zfs'],
            }
          }
        }
      }
    }
    default : {
      fail("zfs is not currently supported on ${::operatingsystem}")
    }
  }
}