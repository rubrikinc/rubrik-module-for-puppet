require 'getFromApi.rb'

# outputs all of the dump, still needs work.

ip = "172.17.60.103"
offset = "200"

# Grab Requested [item] from hash and return ony that value
def getVmFromApiByIp(ip,offset)
	@h = Hash[getFromApi('/api/v1/vmware/vm?limit=100&offset='+offset)]
  @h.select {|h| h['ipAddress'] == ip}
  puts @h
end

getVmFromApiByIp(ip,offset)
