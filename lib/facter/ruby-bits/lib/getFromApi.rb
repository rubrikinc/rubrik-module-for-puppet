$LOAD_PATH.unshift File.expand_path('./', __FILE__)
require 'getToken.rb'


# Produce hash of VM Details based on search
def getFromApi(p)
  (t,sv) = get_token
  conn = Faraday.new(:url => 'https://' + sv)
  conn.ssl.verify = false
  conn.authorization :Bearer, t 
  #conn.response :logger
  response = conn.get p
  if response.status != 200
    # Raise error for failed login
     msg = JSON.parse(response.body)['message']
     raise "Rubrik - Error (#{msg})"
  else
    o = JSON.parse(response.body)
    return o
    # Logged in and returning token
  end
end

