node default {
  class { 'puppet::cron':
    ensure => present,
  }
}
