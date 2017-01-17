require 'json'

# Simple Parser for Credential File, normally ~/.rubrik/creds.json
# Format of creds.json :
# {
#        "server": "[cluster_address]",
#        "username": "[username]",
#        "password": "[password]"
#}

def getCreds
	return rubrik_hash = JSON.parse(File.read('/Users/petermilanese/.rubrik/creds.json'))
end
