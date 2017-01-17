
require './lib/lookupVm.rb'

#findVmItem usage
# Search the vm list for any output field by ip and output the result
# findVmItem('[vm_name]','[field_key]')

puts findVmItem('se-pmilanes-cs01', 'effectiveSlaDomainName')
