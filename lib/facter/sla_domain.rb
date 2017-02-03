require 'facter'
Facter.add("rubrik.sla_domain") do
  confine :kernel => [ 'Linux' , 'SunOS' , 'FreeBSD' , 'Darwin' ]
  setcode do
    Facter::Util::Resolution.exec("echo 'here it is!'")
  end
end
