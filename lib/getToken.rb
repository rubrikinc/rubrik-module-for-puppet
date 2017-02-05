# Establish Token for subsequent requests during this run
# No arguments needed

require 'getCreds.rb'
require 'net/https'
require 'uri'

def get_token()
  rh = getCreds
  s = rh['server']
  u = rh['username']
  p = rh['password']
    url = 'https://' + s + '/'
    uri = URI.parse(url)
    h = Net::HTTP.new(uri.host, uri.port)
    h.use_ssl = true
    h.verify_mode = OpenSSL::SSL::VERIFY_NONE
    r = Net::HTTP::Post.new('/api/v1/login')
    r.add_field('Content-Type', 'application/json')
    r.body = { 'username' => u, 'password' => p }.to_json
    i = h.request(r)
    o = JSON.parse(i.body)
    return o['token'],s
end
