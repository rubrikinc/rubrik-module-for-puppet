require 'facter'
Facter.add(:sla_domain) do
  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ]
  setcode do
    answer = Facter::Util::Resolution.exec("/bin/echo 'here it is!''").chomp
  end
end
