# Set Lib Path Addition

$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
require 'parseoptions.rb'

# Global options
@options = OptparseExample.parse(ARGV)
if @options.vm.nil?
  Kernel.abort("Need Hostname")
end

# Grab the SLAHash to make pretty names



if @options.sla then
  require 'getSlaHash.rb'
  require 'getVm.rb'
  sla_hash = getSlaHash()
  if @options.get then
  # Get the SLA Domain for node
  effectiveSla = sla_hash[findVmItem(@options.vm, 'effectiveSlaDomainId')]
  puts effectiveSla
  end
  if @options.set then
    require 'setSla.rb'
    if @options.sladomain == sla_hash[findVmItem(@options.vm, 'effectiveSlaDomainId')]
    else
      if sla_hash.invert[@options.sladomain]
        out = setSla(findVmItem(@options.vm, 'managedId'), sla_hash.invert[@options.sladomain])
        if !out.nil?
          puts out
        else
          puts "Rubrik SLA Domain Set to #{@options.sladomain}"
        end
      else
        puts "Rubrik SLA Domain does NOT exist, cannot comply"
      end
    end
  end
end
