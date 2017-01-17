require './lib/getFromApi.rb'

# Grab Requested [item] from hash and return ony that value
def findVmItem(t, item)
	t = t.upcase
	hash = Hash[getFromApi('/api/v1/vmware/vm?search_value='+t)]
	return hash['data'][0][item]
end
