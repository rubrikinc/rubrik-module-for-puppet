require './lib/getToken.rb'


# Produce hash of VM Details based on search
def getFromApi(p)
    (t,s) = get_token
    url = 'https://' + s
    uri = URI.parse(url)
    h = Net::HTTP.new(uri.host, uri.port)
    h.use_ssl = true
    h.verify_mode = OpenSSL::SSL::VERIFY_NONE
    r = Net::HTTP::Get.new(p)
    r.basic_auth(t, '')
    i = h.request(r)
    return JSON.parse(i.body)
end
