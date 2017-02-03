require 'facter'
Facter.add(:sladomain) do
  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ]
  setcode do
    answer = Facter::Util::Resolution.exec("/bin/echo hereitis").chomp
  end
end
