require 'facter'
Facter.add(:sladomain) do
#  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ]
  setcode do
    #Facter::Core::Execution.exec(‘/bin/echo HELP’)
    'We should set the sladomain'
  end
end
