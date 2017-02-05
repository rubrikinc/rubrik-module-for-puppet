require 'getVm.rb'
require 'pp'

def getFilesetByHostName (machineName)
    #managedId = findVmItem(machineName,'managedId')
    p = '/api/v1/fileset?search_value=' + machineName
    puts "Looking up #{p}"
    o = getFromApi(p)
    pp o
end
