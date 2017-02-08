# Set Lib Path Addition

$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
require 'getVm.rb'
require 'getSlaHash.rb'

machineName=ARGV[0]
if defined? ARGV[1] then
  @s=ARGV[1]
end
if defined? ARGV[1] then
  @u=ARGV[2]
end
if defined? ARGV[1] then
  @p=ARGV[3]
end

if machineName.nil?
  Kernel.abort("Need Hostname")
end

sla_hash = getSlaHash()

effectiveSla = sla_hash[findVmItem(machineName, 'effectiveSlaDomainId')]
puts effectiveSla
