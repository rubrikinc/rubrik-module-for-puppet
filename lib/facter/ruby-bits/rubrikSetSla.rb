$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
require 'getVm.rb'
require 'getSlaHash.rb'
require 'setSla.rb'
require 'parseoptions.rb'

# Global options
@options = OptparseExample.parse(ARGV)
if @options.vm.nil?
  Kernel.abort("Need Hostname")
end

sla_hash = getSlaHash()

if @options.sla == sla_hash[findVmItem(@options.vm, 'effectiveSlaDomainId')]
else
  if sla_hash.invert[@options.sla]
    out = setSla(findVmItem(@options.vm, 'managedId'), sla_hash.invert[@options.sla])
    if !out.nil?
      puts out
    else
      puts "Rubrik SLA Domain Set to #{@options.sla}"
    end
  else
    puts "Rubrik SLA Domain does NOT exist, cannot comply"
  end
end
