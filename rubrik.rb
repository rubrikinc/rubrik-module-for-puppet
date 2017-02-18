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

if @options.dr then
    require 'getVm.rb'
    require 'uri'
    require 'json'
    require 'setToApi.rb'
    #Get Cluster ID
    clusterInfo=getFromApi("/api/v1/cluster/me")
    id=findVmItem(@options.vm,'id')
    #Get Latest Snapshot
    h=getFromApi("/api/v1/vmware/vm/#{id}/snapshot")
    latestSnapshot =  h['data'][0]['id']
    #Get vmWare Hosts for the Cluster
    vmwareHosts=getFromApi("/api/v1/vmware/host")
    hostList = Array.new
    vmwareHosts["data"].each do |vmwareHosts|
	hostList.push(vmwareHosts["id"]) if vmwareHosts["primaryClusterUuid"] === clusterInfo["id"]
    end
    puts '/api/v1/vmware/vm/snapshot/' + latestSnapshot + '/instant_recover'
    o = setToApi('/api/v1/vmware/vm/snapshot/' + latestSnapshot + '/instant_recover',{ "snapshotId" => "#{latestSnapshot}","vmName" => "#{@options.vm}","hostId" => "#{hostList[0]}","removeNetworkDevices" => true})
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
