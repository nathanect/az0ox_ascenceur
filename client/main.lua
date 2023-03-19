ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Menu_main = RageUI.CreateMenu(Config.menuName, Config.menuDesc)
Menu_main:SetRectangleBanner(Config.menuColor.r, Config.menuColor.g, Config.menuColor.b, Config.menuColor.a)

Menu_main.Closed = function() 
    menu_ouvert = false 
end

function OpenMenu()
    if menu_ouvert then
        return 
    else 
        menu_ouvert = true 
        RageUI.Visible(Menu_main, true) 

        Citizen.CreateThread(function() 
            while menu_ouvert do 
                Citizen.Wait(0)
                RageUI.IsVisible(Menu_main, function()
                    for k,v in pairs(posAscenceur) do 
                        RageUI.Button(v.name, nil, {RightLabel = "→"}, true, {
                            onSelected = function()
                                DoScreenFadeOut(1000)
                                Wait(1000)
                                SetEntityCoords(GetPlayerPed(-1), v.x, v.y, v.z)
                                Wait(1000)
                                DoScreenFadeIn(1000)
                            end
                        })
                    end
                end)
            end
        end)
    end
end