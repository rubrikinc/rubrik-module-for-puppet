
require './lib/getVm.rb'
require './lib/getSlaHash.rb'
require './lib/setSla.rb'

# usage setSla.rb [vmname] [desiredSlaName]

(machineName,desiredSla)=ARGV
if machineName.nil? || desiredSla.nil?
  Kernel.abort("\n ----------------------------------------------------\n
  Use this in order to confirm/change Rubrik SLA Domain for a vm_name. \n
  The script will confirm current subscription, if it exists, and act accordingly
  \t\t If SLA Domain is already set to desired name:
  \t\t\t * Rubrik SLA Domain already set properly
  \t\t If SLA Domain does not exist:
  \t\t\t * Rubrik SLA Domain not set properly
  \t\t\t * Rubrik SLA Domain does NOT exist, cannot comply
  \t\t If SLA Domain exists and is VM is reassigned
  \t\t\t * Rubrik SLA Domain not set properly
  \t\t\t * Rubrik SLA Domain Exists, setting vm_name to use it
  \t\t\t * Rubrik SLA Domain Set to sla_name
  \tUsage : rubrikSetSla [vm_name] [sla_name]
  \n ----------------------------------------------------")
end

sla_hash = getSlaHash()

if desiredSla == sla_hash[findVmItem(machineName,'effectiveSlaDomainId')]
  puts "Rubrik SLA Domain already set properly"
else
  puts "Rubrik SLA Domain not set properly"
  if sla_hash.invert[desiredSla]
    puts "Rubrik SLA Domain Exists, setting #{machineName} to use it"
    out = setSla(findVmItem(machineName,'managedId'),sla_hash.invert[desiredSla])
    if !out.nil?
      puts out
    else
      puts "Rubrik SLA Domain Set to #{desiredSla}"
    end
  else
    puts "Rubrik SLA Domain does NOT exist, cannot comply"
  end
end
