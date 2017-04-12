require 'setToApi.rb'

def setSla(mId,id)
    o = setToApi('/api/v1/vmware/vm/' + mId ,{ "configuredSlaDomainId" => "#{id}"},"patch")
    return o
end
