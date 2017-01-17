
require './lib/getVm.rb'
require './lib/getSlaHash.rb'

#getSlaHash usage
# Dumps slaID and slaName to a hash
sla_hash = getSlaHash()

#findVmItem usage
# Search the vm list for any output field by ip and output the result
# findVmItem('[vm_name]','[field_key]')

puts sla_hash[findVmItem('se-pmilanes-cs01','effectiveSlaDomainId')]
