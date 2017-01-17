require './lib/setToApi.rb'

def setSla(mId,id)
    output = setToApi('/api/v1/sla_domain/' + id + '/assign_sync',{ "managedIds" => ["#{mId}"]})
    return output
end
