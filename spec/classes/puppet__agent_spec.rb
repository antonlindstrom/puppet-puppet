require 'spec_helper'

describe 'puppet::agent', :type => :class do

  describe 'should be present' do
    let(:params) do
      { :ensure => 'present', :pluginsync => 'true' }
    end

    describe 'packages' do
      it { should contain_package('puppet').with_ensure('present') }
      it { should contain_package('facter').with_ensure('present') }
    end

    describe 'files' do
      it do should contain_file('/etc/puppet/puppet.conf').with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
      ) end
    end
  end

  describe 'should be latest' do
    let(:params) do
      { :ensure => 'latest', :pluginsync => 'true' }
    end

    describe 'packages' do
      it { should contain_package('puppet').with_ensure('latest') }
      it { should contain_package('facter').with_ensure('latest') }
    end

    describe 'files' do
      it do should contain_file('/etc/puppet/puppet.conf').with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
      ) end
    end
  end

  describe 'should be absent' do
    let(:params) do
      { :ensure => 'absent', :pluginsync => 'true' }
    end

    describe 'packages' do
      it { should contain_package('puppet').with_ensure('absent') }
      it { should contain_package('facter').with_ensure('absent') }
    end

    describe 'files' do
      it do should contain_file('/etc/puppet/puppet.conf').with(
        'ensure'  => 'absent',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
      ) end
    end
  end
  
  describe 'template content reports undefined' do
    let(:params) do
      { 
        :ensure     => 'present', 
        :pluginsync => 'true',
        :report     => 'true'
      }
    end

    it 'should contain passed variables in puppet.conf' do
      content = catalogue.resource('file', '/etc/puppet/puppet.conf').send(:parameters)[:content]
      content.should match /pluginsync=true/
      content.should match /report=true/
      content.should_not match /reports=/
    end

  end

  describe 'template content reports defined' do
    let(:params) do
      { 
        :ensure     => 'present', 
        :pluginsync => 'true',
        :report     => 'true',
        :reports    => 'log, foreman'
      }
    end

    it 'should contain passed variables in puppet.conf' do
      content = catalogue.resource('file', '/etc/puppet/puppet.conf').send(:parameters)[:content]
      content.should match /pluginsync=true/
      content.should match /report=true/
      content.should match /reports=log, foreman/
    end

  end
    
end
