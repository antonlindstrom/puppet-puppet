# Puppet module

This is a module for managing puppet via puppet

### Usage

##### Puppet master

    class { 'puppet::master': 
      ensure => present,
    }

`ensure` can be either present, latest or absent.

##### Puppet agent

    class { 'puppet::agent' 
      ensure      => present,
      pluginsync  => true,
    }

`ensure` can be either present, latest or absent.

`pluginsync` must be set to either `true` or `false`.

##### Running puppet via cron

    class { 'puppet::cron':
      ensure => present,
    }

`ensure` can be either present or absent.

## Testing

    gem install bundler
    bundle install
    bundle exec rake

Run noop-tests:

    puppet apply --noop --verbose --modulepath=spec/fixtures/modules tests/agent.pp

## Contribute

Send pull request and add tests. Make sure all tests pass (modify if you need) and make sure it's style-guide compliant.
