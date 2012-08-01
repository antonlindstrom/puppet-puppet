class puppet::master($ensure='present') {

  $service_status = $ensure ? {
    absent  => 'stopped',
    present => 'running',
    latest  => 'running',
    default => fail('Ensure needs to be absent, present or latest'),
  }

  package { 'puppetmaster':
    ensure => $ensure,
  }

  service { 'puppetmaster':
    ensure      => $service_status,
    enable      => true,
    hasrestart  => true,
    hasstatus   => true,
    require     => Package['puppetmaster'],
  }

}
