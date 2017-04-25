require 'spec_helper'

describe 'rubrik' do
  let(:node) { 'se-pmilanes-pc01' }
  let(:facts) { {:operatingsystem => 'RedHat', :ipaddress => '192.168.0.1', :kernel => 'Linux'} }
  let(:params) { {:rubriknode => '1.2.3.4', :rubrikuser => 'user', :rubrikpass => 'password'} }
  it { is_expected.to compile }
  it { is_expected.to contain_file('/root/.rubrik/creds.json') }
end
