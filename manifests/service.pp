class puppet::service($ensure='running') {

  service { 'puppet':
    ensure      => $ensure,
    hasrestart  => true,
    hasstatus   => true,
  }

}
