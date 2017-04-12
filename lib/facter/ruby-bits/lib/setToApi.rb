require 'net/https'
require 'pp'
require 'uri'

def setToApi(endpoint,l,type)
  endpoint = URI.encode(endpoint)
  (t,sv) = get_token
  conn = Faraday.new(:url => 'https://' + sv)
  conn.ssl.verify = false
  conn.authorization :Bearer, t
#  conn.response :logger
  response = conn.public_send(type) do |req|
    req.url endpoint 
    req.headers['Content-Type'] = 'application/json'
    req.body  = l.to_json
  end
  if response.status !~ /20/
    #Raise error for failed login
    if msg = JSON.parse(response.body).message do
      raise "Rubrik - Error (#{msg})"
    end
  else
  return response.body
  end
end
