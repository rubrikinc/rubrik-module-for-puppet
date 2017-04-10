require 'net/https'
require 'pp'
require 'uri'

def setToApi(p,l)
  p = URI.encode(p)
  (t,sv) = get_token
  conn = Faraday.new(:url => 'https://' + sv)
  conn.ssl.verify = false
  conn.authorization :Bearer, t
#  conn.response :logger
  response = conn.patch do |req|
    req.url p 
    req.headers['Content-Type'] = 'application/json'
    req.body  = l.to_json
  end
  if response.status != 200
    #Raise error for failed login
    msg = JSON.parse(response.body).message
    raise "Rubrik - Error (#{msg})"
  else
  return response.body
  end
end
