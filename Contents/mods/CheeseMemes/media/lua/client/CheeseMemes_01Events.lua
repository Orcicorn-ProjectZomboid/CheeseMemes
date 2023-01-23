require "CheeseMemes_00Shared.lua";

-- Proxy Filter  OnPlayerHit, OnZombieHit
CheeseMemes.Events.OnHitEvents = function(target, player, weapon)
    local tags = weapon:getTags()
    local gamerGlasses = player:getInventory():getItemFromType("Base.GlassesCheeseGamer");
    if weapon:getType() == "Crowbarski" then 
        CheeseMemes.Weapons.CreateGlass(target)
    end
    if weapon:getType() == "SamuelNightstick" then
        CheeseMemes.Weapons.Moan(target)
    end
    if weapon:getType() == "KatanyaHarding" then
        CheeseMemes.Weapons.KneeCapABitch(target)
    end
    if weapon:getType() == "AxelRose" then
        CheeseMemes.Weapons.MeltSomeFaces(target, player)
    end
    if gamerGlasses and gamerGlasses:isEquipped() then 
        CheeseMemes.Items.GamerGlasses(player);
    end
end
CheeseMemes.Events.OnHitPlayer = function(actor, target, weapon, damage)
    CheeseMemes.Events.OnHitEvents(target, actor, weapon)
end
CheeseMemes.OnHitZombie = function(zombie, character, bodyPartType, handWeapon)
    CheeseMemes.Events.OnHitEvents(zombie, character, handWeapon)
end
Events.OnHitZombie.Add(CheeseMemes.Events.OnHitZombie)
Events.OnWeaponHitCharacter.Add(CheeseMemes.Events.OnHitPlayer)


-- On Player Update Checking for Timed Actions
CheeseMemes.Events.OnPlayerUpdate = function(player)
    if player:hasTimedActions() then
        local action = player:getCharacterActions():get(0)
        local actionType = action:getMetaType()
        if action:getSecondaryHandItem() ~= nil then 
            local actionItem = action:getSecondaryHandItem():getType()
            if actionType == "ISReadABook" and actionItem == "R4ksbook" then 
                CheeseMemes.Items.R4KBook(player, action:getSecondaryHandItem())
            end 
            if actionType == "ISEatFoodAction" and actionItem == "PossSoda" then 
                CheeseMemes.Items.PossSoda(player)
            end 
        end
    end
end
Events.OnPlayerUpdate.Add(CheeseMemes.Events.OnPlayerUpdate)


-- Context Menus
CheeseMemes.Events.OnFillContext = function(player, context, items)
    local items = ISInventoryPane.getActualItems(items);
    for _, item in ipairs(items) do 
        -- MegaDolly Right-click 
        if item:getType() == "MegaDolly" then 
            local option = context:addOption(getText("IGUI_MegaDollyFeed"), item, CheeseMemes.Items.MegaDolly)
            if not getPlayer():getInventory():getFirstTypeRecurse("Battery") then 
                local toolTip = ISWorldObjectContextMenu.addToolTip();
                option.toolTip = toolTip;
                toolTip.description = getText("IGUI_MegaDollyTooltip");
                option.notAvailable = true;
            end
            return;
        end
        -- Sniff Dave the Gnome

    end
end
Events.OnFillInventoryObjectContextMenu.Add(CheeseMemes.Events.OnFillContext)


-- Context Menu for in-world objects (doors/items/windows/walls/etc)
CheeseMemes.Events.OnFillWorldContext = function(playerID, context, worldobjects)
    local player = getSpecificPlayer(playerID);
    local playerX, playerY, playerZ = player:getX(), player:getY(), player:getZ();

    -- Search 1 square around the player for objects 
    for x = playerX - 1, playerX + 1 do 
        for y = playerY - 1, playerY + 1 do 
            local square = getCell():getGridSquare(x, y, playerZ)
            local squareObjects = square:getObjects();
            for i = 0, squareObjects:size() -1 do 
                if CheeseMemes.Functions.IsThisDavid(squareObjects:get(i)) then
                    context:addOption(getText("IGUI_SniffDavid"), player, CheeseMemes.Items.SniffDavid, square)
                end
            end
        end
    end
end
Events.OnFillWorldObjectContextMenu.Add(CheeseMemes.Events.OnFillWorldContext);


-- Daily Events at Midnight
CheeseMemes.Events.Daily = function()
    CheeseMemes.Functions.NotableDates();
end
Events.EveryDays.Add(CheeseMemes.Events.Daily);
