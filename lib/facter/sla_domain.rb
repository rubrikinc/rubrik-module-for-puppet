require 'facter'
Facter.add("rubrik.sla_domain") do
  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ]
  setcode do
    system('touch /tmp/didit')
    Facter::Util::Resolution.exec("/bin/echo 'here it is!''").chomp
  end
end
