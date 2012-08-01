node default {
  class { 'puppet::master':
    ensure => present,
  }
}
