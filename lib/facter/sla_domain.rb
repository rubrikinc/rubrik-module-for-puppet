require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ] - for when we get windwos in the loop.
  setcode do
  # begin
   pth = File.join(File.dirname(__FILE__), 'ruby-bits/rubrikGetSla.rb')
   Facter::Util::Resolution.exec(pth)
  #Facter::Util::Resolution.exec('opt/puppetlabs/puppet/binruby ' + File.join(File.dirname(__FILE__), './ruby-bits/rubrikGetSla.rb') + ' se-pmilanes-pc01')
  #  'did not timeout!'
  # rescue Facter::Core::Execution::ExecutionFailure
  #  'timeout!'
  #  end
  end
end
