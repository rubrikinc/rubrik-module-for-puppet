# Establish Token for subsequent requests during this run
# No arguments needed

require 'base64'
require 'json'
require 'faraday'

def get_token()
  # Ensure Options are set to login
  sv=@options.n
  un=@options.u
  pw=@options.p

  conn = Faraday.new(:url => 'https://' + sv) 
  conn.basic_auth(un, pw)    
  conn.ssl.verify = false
  response = conn.post '/api/v1/session'
  if response.status != 200 
    # Raise error for failed login
     msg = JSON.parse(response.body)['message']
     raise "Rubrik - Unable to authenticate (#{msg})" 
  else
    token = JSON.parse(response.body)['token']
    return token,sv
    # Logged in and returning token
  end
end




 # Grab the result and return the token

