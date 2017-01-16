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
    output['token']
end

def call_api(server, user, pass, path)
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
    JSON.parse(response.body)
end

def find_item_by_ip(hash, base, ip, item)
    hash[base].select { |h1| h1['ipAddress'] == ip }.first[item]
end

# Get a token if needed
def check_auth(server, user, pass)
    unless defined? token
        # Need to secure this stuff!
        token = get_token(server, user, pass)
    end
    token
end
# Get the vm hash from rubrik
vm_list = call_api(server, user, pass, '/api/v1/vmware/vm')

# Search the vm list for any output field by ip and output the result
puts find_item_by_ip(vm_list, 'data', '172.17.60.97', 'effectiveSlaDomainId')
puts find_item_by_ip(vm_list, 'data', '172.17.60.97', 'effectiveSlaDomainName')
