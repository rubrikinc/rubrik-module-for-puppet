# Simple Parser for Credential File, normally ~/.rubrik/creds.json
# Format of creds.json :
# {
#        "server": "[cluster_address]",
#        "username": "[username]",
#        "password": "[password]"
#}
# Most routines will accept login info as arguments (arg1 arg2 node username password)

def getCreds
	return JSON.parse(File.read(ENV['HOME']+'/.rubrik/creds.json'))
end
