# Set Lib Path Addition

$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
puts $LOAD_PATH
require 'getVm.rb'
require 'getSlaHash.rb'
require 'setSla.rb'
# usage setSla.rb [vmname] [desiredSlaName]

puts __dir__
machineName=ARGV[0]
if machineName.nil?
  Kernel.abort("Need Hostname")
end

sla_hash = getSlaHash()

effectiveSla = sla_hash[findVmItem(machineName, 'effectiveSlaDomainId')]
puts effectiveSla
