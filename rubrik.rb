#!/opt/puppetlabs/puppet/bin/ruby
$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
require 'parseoptions.rb'

# Global options
@options = OptparseExample.parse(ARGV)

# Grab the SLAHash to make pretty names

if @options.file then
  if @options.assure then
    require 'getVm.rb'
    require 'uri'
    # do some file workflow
    ss = URI.encode(@options.assure.to_s)
    managedId=findVmItem(@options.vm,'managedId')
    h=getFromApi("/api/v1/search?managed_id=#{managedId}&query_string=#{ss}")
    h['data'].each do |s|
      puts s['path']
    end
  end
end

if @options.sla then
  require 'getSlaHash.rb'
  require 'getVm.rb'
  sla_hash = getSlaHash()
  if @options.get then
  # Get the SLA Domain for node
  effectiveSla = sla_hash[findVmItem(@options.vm, 'effectiveSlaDomainId')]
  puts effectiveSla
  end
  if @options.assure then
    require 'setSla.rb'
    if @options.assure == sla_hash[findVmItem(@options.vm, 'effectiveSlaDomainId')]
    else
      if sla_hash.invert[@options.assure]
        out = setSla(findVmItem(@options.vm, 'managedId'), sla_hash.invert[@options.assure])
        if !out.nil?
          puts out
        end
      else
        puts "Rubrik SLA Domain does NOT exist, cannot comply"
      end
    end
  end
end
