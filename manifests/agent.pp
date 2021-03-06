class puppet::agent(
  $ensure     ='present',
  $pluginsync = true,
  $report     = false,
  $reports    = ''
) {

  $ensure_file = $ensure ? {
    latest  => 'present',
    default => $ensure,
  }

  package { 'puppet':
    ensure => $ensure,
  }

  package { 'facter':
    ensure => $ensure,
  }

  file { '/etc/puppet/puppet.conf':
    ensure  => $ensure_file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('puppet/puppet.conf.client.erb'),
    require => Package['puppet'],
  }

}
