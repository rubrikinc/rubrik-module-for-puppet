require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ] - for when we get windwos in the loop.
  setcode do
    # Here we want to call the underlying ruby to find the current sla_domain.
    Facter::Core::Execution.exec('/opt/puppetlabs/puppet/bin/ruby ruby-bits/rubrikGetSla.rb se-pmilanes-pc01')
  end
end
