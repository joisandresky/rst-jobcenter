local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("rst-jobcenter:server:takeJob")
AddEventHandler("rst-jobcenter:server:takeJob", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    print(data.jobName)
    Player.Functions.SetJob(data.jobName, 0)
    TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, "You changed your job to " .. data.jobLabel)
end)