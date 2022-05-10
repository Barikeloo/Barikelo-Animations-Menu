RegisterCommand('openemote', function(source, args)
    SetNuiFocus(true, true)

    local Table = {
        { label = 'Gestos', sub = GetEmoteTable(DP.Emotes, 'e') }, 
        { label = 'Formas de caminar', sub = GetEmoteTable(DP.Walks, 'walk') },   
        { label = 'Compartidas', sub = GetEmoteTable(DP.Shared, 'nearby') }, 
        { label = 'Bailes', sub = GetEmoteTable(DP.Dances, 'e') }, 
        { label = 'Objetos', sub = GetEmoteTable(DP.PropEmotes, 'e') }, 
    }

    SendNUIMessage({
        action = 'open', 
        list = Table 
    })
end)

RegisterNUICallback("close", function()
    SendNUIMessage({
        action = "HideEmotes",
    })
    SetNuiFocus(false,false)
    print('close')
end)
RegisterNUICallback("exit" , function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'exit'
    })
end)

function GetEmoteTable(Table, Prefix)
    local Emotes = {}

    if Prefix ~= 'walk' then 
        for i,v in pairs(Table) do 
            table.insert(Emotes, { label = v[3], value = i, prefix = Prefix })
        end
    else
        for i,v in pairs(Table) do 
            table.insert(Emotes, { label = i, value = i, prefix = Prefix })
        end
    end

    return Emotes
end 

RegisterNUICallback('execute', function(data) 
    ExecuteCommand(data.anim.prefix..' '..data.anim.value)
end)

RegisterKeyMapping('openemote', 'animaciones', 'keyboard', 'U')