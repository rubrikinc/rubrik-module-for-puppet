# Set Lib Path Addition

$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
require 'getVm.rb'
require 'getSlaHash.rb'

machineName=ARGV[0]
if machineName.nil?
  Kernel.abort("Need Hostname")
end

sla_hash = getSlaHash()

effectiveSla = sla_hash[findVmItem(machineName, 'effectiveSlaDomainId')]
puts effectiveSla
