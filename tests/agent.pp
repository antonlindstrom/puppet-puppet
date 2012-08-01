node default {
  class { 'puppet::agent':
    ensure      => present,
    pluginsync  => true,
  }
}
