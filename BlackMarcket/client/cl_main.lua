Citizen.CreateThread(function()

    exports.ox_target:addBoxZone({
        coords = vector4(1545.344, 2225.871, 77.5393, 181.0451),
        options = {
            {
                label = "Ouvrir le BlackMarcket",
                icon = "fa-solid fa-gun",
                onSelect = function()
                   lib.showContext('BlMk')
                end
            }
        }
    })
end)

lib.registerContext({
    id = 'BlMk',
    title = 'BlackMarcket',
    options = {
        {
            title = "Acheter une arme a feu",
            description = "Vous permet d'acheter une arme a feu !",
            icon = 'fa-solid fa-angle-right',
            iconColor = '#0097FF',
            onSelect = function()
                OpenArmeFeu()
            end
        },
        {
            title = "Pack de balle d'arme a feu",
            description = "Plusieur type de balle a disposition !",
            icon = 'fa-solid fa-angle-right',
            iconColor = '#0097FF',
            onSelect = function()
                OpenMunition()
            end
        },
        {
            title = "Acheter des bombe",
            description = "Vous permet d'acheter des bombe",
            icon = 'fa-solid fa-angle-right',
            iconColor = '#0097FF',
            onSelect = function()
                OpenBombe()
            end
        }
    }
})

function OpenArmeFeu()

    local option = {}
    for k, v in pairs(Config.armefeu) do
        table.insert (option, {
            title = v.label,
            description = v.description .."  \n Prix : " ..v.price,
            icon = 'fa-solid fa-angle-right',
            iconColor = '#FFE400',
            onSelect = function()
                TriggerServerEvent("argent", v.name, v.price, v.count)
            end
        })
    end
    lib.registerContext({
        id = "ArmeFeu",
        title = "Choix de l'arme a feu",
        options = option
    })
    lib.showContext('ArmeFeu')
end

function OpenMunition()

    local option = {}
    for k, v in pairs(Config.munition) do
        table.insert (option, {
            title = v.label,
            description = v.description .."  \n Prix : " ..v.price,
            icon = 'fa-solid fa-angle-right',
            iconColor = '#FFE400',
            onSelect = function()
                TriggerServerEvent("argent", v.name, v.price, v.count)
            end
        })
    end
    lib.registerContext({
        id = "Munition",
        title = "Choix des pack de balle",
        options = option
    })
    lib.showContext('Munition')
end

function OpenBombe()

    local option = {}
    for k, v in pairs(Config.bombe) do
        table.insert (option, {
            title = v.label,
            description = v.description .."  \n Prix : " ..v.price,
            icon = 'fa-solid fa-angle-right',
            iconColor = '#FFE400',
            onSelect = function()
                TriggerServerEvent("argent", v.name, v.price, v.count)
            end
        })
    end
    lib.registerContext({
        id = "Bombe",
        title = "Choix de bombe",
        options = option
    })
    lib.showContext('Bombe')
end

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_business_02")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_y_business_02", 1545.344, 2225.871, 76.5393, 181.0451, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)