require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ] - for when we get windwos in the loop.
  setcode do
  # begin
  #
  ruby = '/opt/puppetlabs/puppet/bin/ruby'
  cmd = File.join(File.dirname(__FILE__), 'ruby-bits/rubrikGetSla.rb')
   ruby + ' ' + cmd + ' se-pmilanes-pc01'
  #Facter::Util::Resolution.exec("${ruby} S{cmd} se-pmilanes-pc01")
  #  'did not timeout!'
  # rescue Facter::Core::Execution::ExecutionFailure
  #  'timeout!'
  #  end
  end
end
