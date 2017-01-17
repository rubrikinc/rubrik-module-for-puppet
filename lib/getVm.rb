require './lib/getToken.rb'


def lookupVmDetail(path)
    (token,server) = get_token
    url = 'https://' + server
    puts "Calling api at #{url}#{path} with token #{token}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(path)
    request.basic_auth(token, '')
    response = http.request(request)
    return JSON.parse(response.body)
end

def findVmItem(t, item)
	t = t.upcase
	hash = Hash[lookupVmDetail('/api/v1/vmware/vm?search_value='+t)]
	return hash['data'][0][item]
end
