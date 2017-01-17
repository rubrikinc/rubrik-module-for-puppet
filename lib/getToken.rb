# Establish Token for subsequent requests during this run
# No arguments needed

require './lib/getCreds.rb'
require 'net/https'
require 'uri'

def get_token()
  rubrik_hash = getCreds
  server = rubrik_hash['server']
  user = rubrik_hash['username']
  pass = rubrik_hash['password']
    url = 'https://' + server + '/'
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new('/api/v1/login')
    request.add_field('Content-Type', 'application/json')
    request.body = { 'username' => user, 'password' => pass }.to_json
    response = http.request(request)
    output = JSON.parse(response.body)
    return output['token'],server
end
