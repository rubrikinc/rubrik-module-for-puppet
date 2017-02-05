require 'setToApi.rb'

def setSla(mId,id)
    o = setToApi('/api/v1/sla_domain/' + id + '/assign_sync',{ "managedIds" => ["#{mId}"]})
    return o
end
