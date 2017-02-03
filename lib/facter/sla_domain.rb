require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ] - for when we get windwos in the loop.
  setcode do
    # Here we want to call the underlying ruby to find the current sla_domain.
    Facter::Core::Execution.exec('ruby ruby-bits/rubrikGetSla.rb $::hostname')
  end
end
Facter.add(:rubypath) do
setcode 'which ruby'
end
