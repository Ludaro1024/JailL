ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ESX.RegisterServerCallback('jail:getjob', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.job.name
    print(job)
    cb(job)
    
    end)