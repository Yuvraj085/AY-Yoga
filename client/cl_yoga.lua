local QBCore = exports['qb-core']:GetCoreObject()

-- Net Events
RegisterNetEvent('relaxing-yoga:s1', function()
    local plyPed = PlayerPedId()
    SetEntityCoords(plyPed, Config.YogaPlads1)
    FreezeEntityPosition(plyPed, true)
    QBCore.Functions.Progressbar('yoga1', 'Finding Inner Peace...', 22900, false, true,
        { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'amb@world_human_yoga@male@base',
            anim = 'base_b',
            flags = 42,
        }, {}, {}, function() -- Play When Done
            local plyPed = PlayerPedId()
            FreezeEntityPosition(plyPed, false)
            TriggerServerEvent('hud:server:RelieveStress', math.random(10, 25))
            Wait(500)
            QBCore.Functions.Notify('You Feel More Relaxed After Doing Yoga', 'success')
        end, function() -- Play When Cancel
            local plyPed = PlayerPedId()
            FreezeEntityPosition(plyPed, false)
        end)
end)

RegisterNetEvent('relaxing-yoga:s2', function()
    local plyPed = PlayerPedId()
    SetEntityCoords(plyPed, Config.YogaPlads2)
    FreezeEntityPosition(plyPed, true)
    QBCore.Functions.Progressbar('yoga2', 'Finding Inner Peace...', 22900, false, true,
        { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'amb@world_human_yoga@male@base',
            anim = 'base_b',
            flags = 42,
        }, {}, {}, function() -- Play When Done
            local plyPed = PlayerPedId()
            FreezeEntityPosition(plyPed, false)
            TriggerServerEvent('hud:server:RelieveStress', math.random(10, 25))
            Wait(500)
            QBCore.Functions.Notify('You Feel More Relaxed After Doing Yoga', 'success')
        end, function() -- Play When Cancel
            local plyPed = PlayerPedId()
            FreezeEntityPosition(plyPed, false)
        end)
end)

RegisterNetEvent('relaxing-yoga:s3', function()
    local plyPed = PlayerPedId()
    SetEntityCoords(plyPed, Config.YogaPlads3)
    FreezeEntityPosition(plyPed, true)
    QBCore.Functions.Progressbar('yoga3', 'Finding Inner Peace...', 22900, false, true,
        { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'amb@world_human_yoga@male@base',
            anim = 'base_b',
            flags = 42,
        }, {}, {}, function() -- Play When Done
            local plyPed = PlayerPedId()
            FreezeEntityPosition(plyPed, false)
            TriggerServerEvent('hud:server:RelieveStress', math.random(10, 25))
            Wait(500)
            QBCore.Functions.Notify('You Feel More Relaxed After Doing Yoga', 'success')
        end, function() -- Play When Cancel
            local plyPed = PlayerPedId()
            FreezeEntityPosition(plyPed, false)
        end)
end)

RegisterNetEvent('relaxing-yoga:s4', function()
    local plyPed = PlayerPedId()
    SetEntityCoords(plyPed, Config.YogaPlads4)
    FreezeEntityPosition(plyPed, true)
    QBCore.Functions.Progressbar('yoga4', 'Finding Inner Peace...', 22900, false, true,
        { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'amb@world_human_yoga@male@base',
            anim = 'base_b',
            flags = 42,
        }, {}, {}, function() -- Play When Done
            local plyPed = PlayerPedId()
            FreezeEntityPosition(plyPed, false)
            TriggerServerEvent('hud:server:RelieveStress', math.random(10, 25))
            Wait(500)
            QBCore.Functions.Notify('You Feel More Relaxed After Doing Yoga', 'success')
        end, function() -- Play When Cancel
            local plyPed = PlayerPedId()
            FreezeEntityPosition(plyPed, false)
        end)
end)

--! Old Code We Never Use
--? Old Code For DrawText3Ds Now We Are Using QBCore Draw Text

-- local function DrawText3Ds(x, y, z, text)
--     SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry('STRING')
--     SetTextCentre(true)
--     AddTextComponentString(text)
--     SetDrawOrigin(x, y, z, 0)
--     DrawText(0.0, 0.0)
--     local factor = (string.len(text)) / 370
--     DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
--     ClearDrawOrigin()
-- end


local flag = false
local function printThread(k, data, bool)
    if not flag then
        flag = bool
        PlayerData = QBCore.Functions.GetPlayerData()
        CreateThread(function()
            while flag do
                Wait(0)
                local plyCoords = GetEntityCoords(PlayerPedId(), 0)
                local distance = #(vector3(data.x, data.y, data.z) - plyCoords)

                if distance < 1.4 then
                    -- DrawText3Ds(data.x, data.y, data.z, '~g~[E]~w~ Do Yoga')
                    if Config.EnableTextDraw then
                        exports['qb-core']:DrawText(Config.DrawTextYoga, "left")
                    end
                    DisableControlAction(0, 57, true)
                    if IsDisabledControlJustReleased(0, 54) then
                        TriggerEvent(k)
                    end
                else
                    flag = false
                    exports['qb-core']:HideText()
                end
            end
        end)
    end
end

CreateThread(function()
    if not Config.YogaTarget then
        while true do
            if LocalPlayer.state.isLoggedIn then
                local plyCoords = GetEntityCoords(PlayerPedId(), 0)
                if not IsPedInAnyVehicle(PlayerPedId(), true) then
                    local distance1 = #(vector3(Config.YogaPlads1.x, Config.YogaPlads1.y, Config.YogaPlads1.z) - plyCoords)
                    if distance1 < 1.5 then
                        printThread('relaxing-yoga:s1', Config.YogaPlads1, true)
                    end
                    local distance2 = #(vector3(Config.YogaPlads2.x, Config.YogaPlads2.y, Config.YogaPlads2.z) - plyCoords)
                    if distance2 < 1.5 then
                        printThread('relaxing-yoga:s2', Config.YogaPlads2, true)
                    end
                    local distance3 = #(vector3(Config.YogaPlads3.x, Config.YogaPlads3.y, Config.YogaPlads3.z) - plyCoords)
                    if distance3 < 1.5 then
                        printThread('relaxing-yoga:s3', Config.YogaPlads3, true)
                    end
                    local distance4 = #(vector3(Config.YogaPlads4.x, Config.YogaPlads4.y, Config.YogaPlads4.z) - plyCoords)
                    if distance4 < 1.5 then
                        printThread('relaxing-yoga:s4', Config.YogaPlads4, true)
                    end
                end
            end
            Wait(2000)
        end
    else
        --* 1
        -- Eye exports
        exports['qb-target']:AddCircleZone('Yoga_1', Config.YogaPlads1, 0.15, {
            name = 'Yoga_1',
            -- heading = 90.0,
            useZ = true,
            debugPoly = Config.YogaDebugPoly,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'relaxing-yoga:s1',
                    icon = 'fas fa-sign-in-alt',
                    label = 'Do Yoga!!',
                },
            },
            distance = 1.5
        })
        --* 2
        exports['qb-target']:AddCircleZone('Yoga_2', Config.YogaPlads2, 0.15, {
            name = 'Yoga_2',
            -- heading = 90.0,
            useZ = true,
            debugPoly = Config.YogaDebugPoly,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'relaxing-yoga:s2',
                    icon = 'fas fa-sign-in-alt',
                    label = 'Do Yoga!!',
                },
            },
            distance = 1.5
        })
        --* 3
        exports['qb-target']:AddCircleZone('Yoga_3', Config.YogaPlads3, 0.15, {
            name = 'Yoga_3',
            -- heading = 90.0,
            useZ = true,
            debugPoly = Config.YogaDebugPoly,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'relaxing-yoga:s3',
                    icon = 'fas fa-sign-in-alt',
                    label = 'Do Yoga!!',
                },
            },
            distance = 1.5
        })
        --* 4
        exports['qb-target']:AddCircleZone('Yoga_4', Config.YogaPlads4, 0.15, {
            name = 'Yoga_4',
            -- heading = 90.0,
            useZ = true,
            debugPoly = Config.YogaDebugPoly,
        }, {
            options = {
                {
                    type = 'client',
                    event = 'relaxing-yoga:s4',
                    icon = 'fas fa-hand-spock',
                    label = 'Do Yoga!!',
                },
            },
            distance = 1.5
        })
    end
end)

--? BLip
if Config.YogaBlips then
    local yoga = AddBlipForCoord(Config.YogaBlipsLocation)
    SetBlipSprite(yoga, 197)
    SetBlipDisplay(yoga, 4)
    SetBlipScale(yoga, 0.7)
    SetBlipColour(yoga, 0)
    SetBlipAsShortRange(yoga, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Yoga Center')
    EndTextCommandSetBlipName(yoga)
end