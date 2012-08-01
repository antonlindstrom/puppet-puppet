class puppet::cron($ensure='present') {

  # Random Backoff, may cause bug #8814 in tests
  $minute = fqdn_rand(30)

  # Puppet runonce components
  $binary = '/usr/sbin/puppetd'
  $option = '--onetime --no-daemonize --logdest syslog'
  $quiet  = '> /dev/null 2>&1'

  cron { 'manual-puppet':
    ensure  => $ensure,
    user    => 'root',
    command => "$binary $option $quiet",
    minute  => $minute,
  }

}
