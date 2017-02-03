require __dir__ + '/lib/getVm.rb'
require __dir__ + '/lib/getSlaHash.rb'
require __dir__ + '/lib/setSla.rb'
# usage setSla.rb [vmname] [desiredSlaName]

puts __dir__
machineName=ARGV[0]
if machineName.nil?
  Kernel.abort("Need Hostname")
end

sla_hash = getSlaHash()

effectiveSla = sla_hash[findVmItem(machineName, 'effectiveSlaDomainId')]
puts effectiveSla
