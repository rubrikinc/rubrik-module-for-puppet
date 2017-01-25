require 'spec_helper'
describe 'rubrik' do
  context 'with default values for all parameters' do
    it { should contain_class('rubrik') }
  end
end
