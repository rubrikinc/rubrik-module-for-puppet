#!/opt/puppetlabs/puppet/bin/ruby
$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
require 'parseoptions.rb'

# Global options
@options = OptparseExample.parse(ARGV)

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
    puts @options.sladomain
    require 'setSla.rb'
    if @options.sladomain == sla_hash[findVmItem(@options.vm, 'effectiveSlaDomainId')]
    else
      if sla_hash.invert[@options.sladomain]
        out = setSla(findVmItem(@options.vm, 'managedId'), sla_hash.invert[@options.sladomain])
        if !out.nil?
          puts out
        end
      else
        puts "Rubrik SLA Domain does NOT exist, cannot comply"
      end
    end
  end
end
