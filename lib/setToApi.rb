require 'net/https'
require 'uri'

def setToApi(path,post)
    (token,server) = get_token
    puts path
    url = 'https://' + server + '/'
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(path)
    request.add_field('Content-Type', 'application/json')
    request.basic_auth(token, '')
    request.body = post.to_json
    response = http.request(request)
    puts post.to_json
    output = response.body
    return output
end
