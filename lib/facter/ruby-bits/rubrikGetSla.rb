require './lib/getVm.rb'
require './lib/getSlaHash.rb'
require './lib/setSla.rb'

# usage setSla.rb [vmname] [desiredSlaName]

(machineName)=ARGV
if machineName.nil?
  Kernel.abort("Need Hostname")
end

sla_hash = getSlaHash()

if effectiveSla == sla_hash[findVmItem(machineName, 'effectiveSlaDomainId')]
  puts effectiveSla
else
  puts "UNAVAILABLE"
end
