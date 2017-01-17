
require './lib/getVm.rb'
require './lib/getSlaHash.rb'
require './lib/setSla.rb'
require 'pp'

# usage setSla.rb [vmname] [desiredSlaName]

(machineName,desiredSla)=ARGV

#getSlaHash usage
# Dumps slaID and slaName to a hash
sla_hash = getSlaHash()

if desiredSla == sla_hash[findVmItem(machineName,'effectiveSlaDomainId')]
  puts "Rubrik SLA Domain already set properly"
else
  puts "Rubrik SLA Domain not set properly"
  if sla_hash.invert[desiredSla]
    puts "Rubrik SLA Domain Exists, setting #{machineName} to use it"
    out = setSla(findVmItem(machineName,'id'),sla_hash.invert[desiredSla])
    pp out
  else
    puts "Rubrik SLA Domain does NOT exist, cannot comply"
  end
end

#findVmItem usage
# Search the vm list for any output field by ip and output the result
# findVmItem('[vm_name]','[field_key]')

# Expect machine name and desired SLA from command line, set if not set properly


#currentSLA = sla_hash[findVmItem('se-pmilanes-cs01','effectiveSlaDomainId')
#desiredSLA =
