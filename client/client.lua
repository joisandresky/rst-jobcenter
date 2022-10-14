local QBCore = exports['qb-core']:GetCoreObject()
local pedSpawned = false
local JobPed = nil
local JobCenterZone = nil

local PlayerJob = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job end)
    SetupJobCenter()
end)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    deletePed()
    table.wipe(PlayerJob)
end)
AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job end)
    SetupJobCenter()
end)

local function createBlip()
    if pedSpawned then return end
    
    local JobCenterBlip = AddBlipForCoord(Config.Location["x"], Config.Location["y"], Config.Location["z"])
    SetBlipSprite(JobCenterBlip, 457)
    SetBlipScale(JobCenterBlip, 0.8)
    SetBlipDisplay(JobCenterBlip, 4)
    SetBlipColour(JobCenterBlip, 0)
    SetBlipAsShortRange(JobCenterBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Job Center")
    EndTextCommandSetBlipName(JobCenterBlip)
end

local function createPed()
    if pedSpawned then return end

    local current = "a_m_y_smartcaspat_01"

    RequestModel(current)
    while not HasModelLoaded(current) do
        Wait(0)
    end

    JobCenterPed = CreatePed(0, current, Config.Location.x, Config.Location.y, Config.Location.z-1, Config.Location.w, false, false)
    TaskStartScenarioInPlace(JobCenterPed, "WORLD_HUMAN_STAND_MOBILE", 0, true)
    FreezeEntityPosition(JobCenterPed, true)
    SetEntityInvincible(JobCenterPed, true)
    SetBlockingOfNonTemporaryEvents(JobCenterPed, true)

    exports['qb-target']:AddTargetEntity(JobCenterPed, {
        options = {
            {
                type = "client",
                event = "rst-jobcenter:client:openJobCenter",
                icon = 'fas fa-certificate',
                label = 'Open Job Center'
            }
        },
        distance = 2.0
    })

    pedSpawned = true
end

local function deletePed()
    DeletePed(JobPed)
end


function SetupJobCenter()
    createBlip()
    createPed()
end

CreateThread(function()
    JobCenterZone = CircleZone:Create(vector3(Config.Location["x"], Config.Location["y"], Config.Location["z"]), 2.0, {
        useZ = true,
        debugPoly = false,
        name = "job_center",
    })
end)

RegisterNetEvent('rst-jobcenter:client:openJobCenter', function()
    exports['qb-menu']:openMenu(Config.JobMenus)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    deletePed()
end)
