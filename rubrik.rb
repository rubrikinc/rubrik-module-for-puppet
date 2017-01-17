require 'net/http'
require 'net/https'
require 'uri'
require 'json'
require 'pp'

# Simple ruby to authenticate and grab some info., looking to drop auth vars into a . file shortly
rubrik_hash = JSON.parse(File.read('.rubrik/creds.json'))

server = rubrik_hash['server']
user = rubrik_hash['username']
pass = rubrik_hash['password']

def get_token(ip, u, p)
    url = 'https://' + ip + '/'
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new('/api/v1/login')
    request.add_field('Content-Type', 'application/json')
    request.body = { 'username' => u, 'password' => p }.to_json
    response = http.request(request)
    output = JSON.parse(response.body)
    return output['token']
end

def lookupVmDetail(server, user, pass, path)
    # Decided to make one standard call to check/refresh token
    token = check_auth(server, user, pass)
    url = 'https://' + server
    puts "Calling api at #{url}#{path} with token #{token}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(path)
    request.basic_auth(token, '')
    response = http.request(request)
    return JSON.parse(response.body)
end

def findVmItem(server, user, pass, base, t, item)
	t = t.upcase
	hash = Hash[lookupVmDetail(server, user, pass, '/api/v1/vmware/vm?search_value='+t)]
	return hash['data'][0][item]
end

# Get a token if needed
def check_auth(server, user, pass)
    unless defined? token
        # Need to secure this stuff!
        token = get_token(server, user, pass)
    end
    return token
end

# Get the vm hash from rubrik


# Search the vm list for any output field by ip and output the result
puts findVmItem(server, user, pass, 'data', 'se-pmilanes-cs01', 'effectiveSlaDomainName')
