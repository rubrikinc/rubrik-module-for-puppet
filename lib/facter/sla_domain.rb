require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ] - for when we get windwos in the loop.
  setcode do
    # Here we want to call the underlying ruby to find the current sla_domain.
    'We should set the sladomain via :hostname'
  end
end
