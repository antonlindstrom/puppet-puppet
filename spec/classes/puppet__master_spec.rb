require 'spec_helper'

describe 'puppet::master', :type => :class do

  describe 'services' do
    describe 'should be master' do
      let(:params) { { :ensure => 'present' } }

      it do should contain_service('puppetmaster').with(
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasstatus'  => 'true',
        'hasrestart' => 'true'
      ) end
    end

    describe 'should be master with latest package' do
      let(:params) { { :ensure => 'latest' } }
      it { should contain_service('puppetmaster').with_ensure('running') }
    end

    describe 'should _not_ be master' do
      let(:params) { { :ensure => 'absent' } }

      it do should contain_service('puppetmaster').with(
        'ensure'     => 'stopped',
        'enable'     => 'true',
        'hasstatus'  => 'true',
        'hasrestart' => 'true'
      ) end
    end
  end

  describe 'packages' do
    describe 'should be master' do
      let(:params) { { :ensure => 'present' } }
      it { should contain_package('puppetmaster').with_ensure('present') }
    end

    describe 'should be master with latest package' do
      let(:params) { { :ensure => 'latest' } }
      it { should contain_package('puppetmaster').with_ensure('latest') }
    end

    describe 'should _not_ be master' do
      let(:params) { { :ensure => 'absent' } }
      it { should contain_package('puppetmaster').with_ensure('absent') }
    end
  end

end
