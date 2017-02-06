require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ] - for when we get windwos in the loop.
  setcode do
  # begin
  #
  ruby = '/opt/puppetlabs/puppet/bin/ruby'
  cmd = File.join(File.dirname(__FILE__), 'ruby-bits/rubrikGetSla.rb')
  run = ruby + ' ' + cmd + ' se-pmilanes-pc01'
  puts run
  #Facter::Util::Resolution.exec("${run}")
  #  'did not timeout!'
  # rescue Facter::Core::Execution::ExecutionFailure
  #  'timeout!'
  #  end
  end
end
