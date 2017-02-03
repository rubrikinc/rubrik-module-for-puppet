require './lib/getFromApi.rb'

# Grab Requested [item] from hash and return ony that value
def findVmItem(t, item)
	puts "Grabbing #{item} for #{t}"
	t = t.upcase
	h = Hash[getFromApi('/api/v1/vmware/vm?search_value='+t)]
	pp h
	return h['data'][0][item]
end
