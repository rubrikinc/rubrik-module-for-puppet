require './lib/getFromApi.rb'
require 'pp'

       h = Hash[getFromApi('/api/v1/vmware/vm?search_value=SE-PMILANES-LINUX')]
	pp h
