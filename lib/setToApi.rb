require 'net/https'
require 'uri'

def setToApi(p,l)
    puts l.to_json
    (token,server) = get_token
    url = 'https://' + server + '/'
    uri = URI.parse(url)
    h = Net::HTTP.new(uri.host, uri.port)
    h.use_ssl = true
    h.verify_mode = OpenSSL::SSL::VERIFY_NONE
    r = Net::HTTP::Post.new(p)
    r.add_field('Content-Type', 'application/json')
    r.basic_auth(token, '')
    r.body = l.to_json
    i = h.request(r)
    o = i.body
    return o
end
