$LOAD_PATH.unshift File.expand_path('../lib/', __FILE__)
require   './lib/getVm.rb'
require   './lib/getFromApi.rb'
require   'pp'

managedId=findVmItem(ARGV[0],'managedId')
pp managedId
output=getFromApi("/api/v1/vmware/vm/#{managedId}/snapshot")
pp output
