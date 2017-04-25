require 'spec_helper'

describe 'rubrik' do
  let(:node) { 'se-pmilanes-pc01' }
  let(:params) { {:rubriknode => '1.2.3.4', :rubrikuser => 'user', :rubrikpass => 'password'} }
  let(:facts) { {:operatingsystem => 'Windows', :ipaddress => '192.168.0.1', :kernel => 'Windows'} }
  it { is_expected.to compile }
end
