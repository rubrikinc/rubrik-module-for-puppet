require 'json'

# Simple Parser for Credential File, normally ~/.rubrik/creds.json
# Format of creds.json :
# {
#        "server": "[cluster_address]",
#        "username": "[username]",
#        "password": "[password]"
#}

def getCreds
	return JSON.parse(File.read(File.join(ENV['HOME'], '/.rubrik/creds.json')))
end
