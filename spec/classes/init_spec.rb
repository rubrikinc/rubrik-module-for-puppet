require 'spec_helper'

describe 'init' do
  # Check whether puppet can compile the catalog for the 'mymodule' class
  it { should.compile }
end
