local QBCore = exports['qb-core']:GetCoreObject()

if Config.MenuUI ~= "OX" then
    return
end

local function convertToOx(data)
    local qbmenuID = 'qbmenu_convert'
    local oxData = {
        id = qbmenuID,
        title = nil,
        onExit = function()
            if curCB then
                curCB(nil)
                curCB = nil
            end
        end,
        options = nil
    }
    local options = {}
    for _, v in ipairs(data) do
        -- Formmating conversion
        if v.hidden then goto continue end
        if v.isMenuHeader and not oxData.title and not v.txt then
            oxData.title = v.header
        elseif v.isMenuHeader then
            options[#options + 1] = {
                title = v.header,
                description = v.txt,
            }
        else
            options[#options + 1] = {
                title = v.header,
                icon = v.icon,
                description = v.txt,
                disabled = v.disabled,
                metadata =  v.image,
                image =  v.image,
                onSelect = function()
                    if v.params.isServer then
                        TriggerServerEvent(v.params.event, v.params.args)
                    else
                        TriggerEvent(v.params.event, v.params.args)
                    end
                end
            }
        end
        ::continue::
    end
    if not oxData.title then
        oxData.title = 'Menu'
    end
    oxData.options = options
    lib.registerContext(oxData)     
    lib.showContext(qbmenuID)
    return oxData
end

-- Events

RegisterNetEvent('qb-menu:client:openMenu', function(data)
    --openMenu(data)
    convertToOx(data)
end)

RegisterNetEvent('qb-menu:client:closeMenu', function()
    closeMenu()
end)

-- NUI Callbacks

RegisterNUICallback('clickedButton', function(option)
    if headerShown then headerShown = false end
    PlaySoundFrontend(-1, 'Highlight_Cancel', 'DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SetNuiFocus(false)
    if sendData then
        local data = sendData[tonumber(option)]
        sendData = nil
        if data then
            if data.params.event then
                if data.params.isServer then
                    TriggerServerEvent(data.params.event, data.params.args)
                elseif data.params.isCommand then
                    ExecuteCommand(data.params.event)
                elseif data.params.isQBCommand then
                    TriggerServerEvent('QBCore:CallCommand', data.params.event, data.params.args)
                elseif data.params.isAction then
                    data.params.event(data.params.args)
                else
                    TriggerEvent(data.params.event, data.params.args)
                end
            end
        end
    end
end)

RegisterNUICallback('closeMenu', function()
    headerShown = false
    sendData = nil
    SetNuiFocus(false)
end)

-- Command and Keymapping

RegisterCommand('playerfocus', function()
    if headerShown then
        SetNuiFocus(true, true)
    end
end)

RegisterKeyMapping('playerFocus', 'Give Menu Focus', 'keyboard', 'LMENU')

-- Exports

--exports('openMenu', openMenu)
exports('openMenu', convertToOx)
exports('closeMenu', closeMenu)
exports('showHeader', showHeader)