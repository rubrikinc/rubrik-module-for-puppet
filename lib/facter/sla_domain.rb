require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ] - for when we get windwos in the loop.
  setcode do
  # begin
    Facter::Util::Resolution.exec(File.join(File.dirname(__FILE__),'/opt/puppetlabs/puppet/bin/ruby ./ruby-bits/rubrikGetSla.rb se-pmilanes-pc01')
  #  'did not timeout!'
  # rescue Facter::Core::Execution::ExecutionFailure
  #  'timeout!'
  #  end
  end
end
