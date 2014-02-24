# == Class zfs::repo
# Need to put ppa's in a seperate stage due to
# having to initiate the add-apt-repo before using the package.
class zfs::repo {
    include apt
    package {'python-software-properties':
      ensure => present,
    }

    apt::ppa { 'ppa:zfs-native/stable': 
      require => Package['python-software-properties'], 
    }
}