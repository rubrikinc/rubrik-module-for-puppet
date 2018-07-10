#$LOAD_PATH.unshift File.expand_path('./', __FILE__)
require 'getFromApi.rb'

# Grab Requested [item] from hash and return ony that value
def findVmItem(t, item)
	t = t.upcase
	h = Hash[getFromApi('/api/v1/vmware/vm?name='+t+'&primary_cluster_id=local')]
	return h['data'][0][item]
end
