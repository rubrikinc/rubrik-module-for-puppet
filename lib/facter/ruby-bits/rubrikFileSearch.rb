require   './lib/getVm.rb'
require   './lib/getFromApi.rb'
require   'pp'

managedId=findVmItem(ARGV[0],'managedId')
pp managedId
output=getFromApi("/api/v1/search?managed_id=#{managedId}&query_string=#{ARGV[1]}")
pp output
