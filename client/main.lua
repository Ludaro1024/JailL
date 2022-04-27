Config = {}
Config.Command = "jail"
Config.Contextmenu = false
Config.Waittime = "3" -- NUR WENN CONTEXTMENU = TRUE
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterCommand(Config.Command, function(source, args, rawCommand)
    ESX.TriggerServerCallback('jail:getjob', function(jobb)
    if jobb == "police" and not Config.Contextmenu then
        local closestPlayer, playerDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 then
        ESX.ShowNotification('Es ist kein Spieler in deiner Nähe!')
        else
    local oldcoords = GetEntityCoords(ESX.Game.GetClosestPlayer)
    SetEntityCoords(closestPlayer, 319.7076, -1375.3698, 31.9085 - 1 ) -- HIER DIE KOORDINATEN EINTRAGEN UND -1 BITTE BELASSEN IST DAMIT MAN NICHT IM BODEN BUGGT!
    Wait(args[1] * 1000)
    SetEntityCoords(closestPlayer, oldcoords.x, oldcoords.y, oldcoords.z)
        end
else
    ECM:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
        if IsPedAPlayer(hitEntity) then
            local jail = ECM:AddItem(0, Locale.AttackPerson, function()
                local oldcoords = GetEntityCoords(hitEntity)
                SetEntityCoords(hitEntity, 319.7076, -1375.3698, 31.9085 - 1)
                Wait(Config.WaitTime * 1000)
                SetEntityCoords(closestPlayer, oldcoords.x, oldcoords.y, oldcoords.z)
            end)
        end
    end)
end
end, false)
end)