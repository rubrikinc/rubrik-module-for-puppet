require './lib/getToken.rb'


# Produce hash of VM Details based on search
def getFromApi(path)
    (token,server) = get_token
    url = 'https://' + server
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(path)
    request.basic_auth(token, '')
    response = http.request(request)
    return JSON.parse(response.body)
end
