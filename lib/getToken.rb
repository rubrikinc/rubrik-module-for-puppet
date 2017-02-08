# Establish Token for subsequent requests during this run
# No arguments needed

require 'json'
require 'net/https'
require 'uri'

def get_token()
  if @options.s? then
    sv=@options.s
    un=@options.u
    pw=@options.p
  else
    require 'getCreds.rb'
    rh = getCreds
    sv = rh['server']
    un = rh['username']
    pw = rh['password']
  end
  url = 'https://' + sv + '/'
  uri = URI.parse(url)
  h = Net::HTTP.new(uri.host, uri.port)
  h.use_ssl = true
  h.verify_mode = OpenSSL::SSL::VERIFY_NONE
  r = Net::HTTP::Post.new('/api/v1/login')
  r.add_field('Content-Type', 'application/json')
  r.body = { 'username' => un, 'password' => pw }.to_json
  i = h.request(r)
  o = JSON.parse(i.body)
  return o['token'],sv
end
