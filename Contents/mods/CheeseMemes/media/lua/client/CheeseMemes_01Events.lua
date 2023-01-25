-- ---------------------------------------------------------- --
-- OBJECT INITIALIZATION ------------------------------------ --
-- ---------------------------------------------------------- --
require "CheeseMemes_00Shared.lua";


-- ---------------------------------------------------------- --
-- EVENT FUNCTIONS ------------------------------------------ --
-- ---------------------------------------------------------- --
--[[
    Cheesememes.Events.Daily
    Triggers everday at midnight and acts as a proxy for Notable Dates
    to determine if the date today is of any significant value
    @params     none
    @returns    nothing
    @trigger    Events.EveryDays
]]
CheeseMemes.Events.Daily = function()
    CheeseMemes.Functions.NotableDates();
end


--[[
    CheeseMemes.Events.OnFillContext
    Checks to see if you are interacting with the Mega Dolly item, and if so
    then create a Feed option and/or disable it if necessary
    @params     IsoCharacter        Required        The player triggering the event
    @params     KahluaTable         Required        The context menu to be filled
    @params     KahluaTable         Required        A list of items you're interacting with
    @returns    nothing
    @trigger    Events.OnFillInventoryObjectContextMenu
]]
CheeseMemes.Events.OnFillContext = function(player, context, items)
    local items = ISInventoryPane.getActualItems(items);
    local disabled = false;
    local disableMessage = "";
    for _, item in ipairs(items) do 
        -- MegaDolly Right-click 
        if item:getType() == "MegaDolly" then 
            local option = context:addOption(getText("IGUI_MegaDollyFeed"), item, CheeseMemes.Items.MegaDolly)

            -- Disable if you don't have a bettery
            if not getPlayer():getInventory():getFirstTypeRecurse("Battery") then 
                disabled = true;
                disableMessage = "IGUI_MegaDollyTooltip";
            end

            -- Disable if Too Soon (Anti-Spam)
            if item:getModData().LastDollyAction ~= nil then 
                if (CheeseMemes.Functions.Timestamp() - item:getModData().LastDollyAction) < 120000 then 
                    disabled = true;
                    disableMessage = "IGUI_MegaDollySpam";
                end
            end

            -- Disable the tooltip?
            if disabled then 
                local toolTip = ISWorldObjectContextMenu.addToolTip();
                option.toolTip = toolTip;
                toolTip.description = getText(disableMessage);
                option.notAvailable = true;
            end
        end
    end
end


--[[
    CheeseMemes.Events.OnFillWorldContext
    Checks to see if you are interacting with David the Gnome and if so
    offer up the possibility to sniff him as an option.
    @params     IsoPlayer       Required        The player interacting with the world
    @params     KahluaTable     Required        The context menu to be filled
    @params     KahluaTable     Required        The world objects available nearby the player
    @returns    nothing
    @triggers   Events.OnFillWorldObjectContextMenu
]]
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


--[[
    CheeseMemes.Events.OnHitEvents
    Determines the weapon that is being used and triggers the Weapon Effects
    that are necessary. For example breaking the crowbarski
    @params     IsoCharacter/IsoZombie      Required        The Character or Zombie to get hit
    @params     IsoCharacter                Required        The player doing the attacking
    @params     IsoComboItem                Required        The weapon doing the attacking
    @returns    nothing
    @trigger    CheeseMemes.Events.OnHitPlayer
    @trigger    CheeseMemes.Events.OnHitZombie
]]
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


--[[
    CheeseMemes.Events.OnPlayerUpdate
    Check if the player is involved in a timed action. if they are, determine if it
    matches any of our Items. For example, if you're reading a book is it R4k's book?
    If it is, then trigger the r4ksbook functions.
    @params     IsoCharacter            Required        The character being updated
    @returns    nothing
    @trigger    Events.OnPlayerUpdate
]]
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


-- ---------------------------------------------------------- --
-- EVENT FUNCTION PROXIES ----------------------------------- --
-- ---------------------------------------------------------- --
--[[
    CheeseMemes.Events.OnHitPlayer
    A Proxy function for CheeseMemes.OnHitEvents which adjusts the
    actor/target format from the in-game events to our event functions
    @params     IsoCharacter        Required        The character attacking
    @params     IsoCharacter        Required        The character being attacked
    @params     IsoComboItem        Required        The weapon doing the attacking
    @params     Float               Required        The damage being done
    @returns    nothing
    @trigger    Events.OnWeaponHitCharacter
]]
CheeseMemes.Events.OnHitPlayer = function(actor, target, weapon, damage)
    CheeseMemes.Events.OnHitEvents(target, actor, weapon)
end


--[[
    CheeseMemes.Events.OnHitZombie
    A Proxy function for CheeseMemes.OnHitEvents which adjusts the
    actor/target format from the in-game events to our event functions
    @params     IsoZombie           Required        The zombie being attacked
    @params     IsoCharacter        Required        The character being attacked
    @params     BodyPartType        Required        The body part being attacked
    @params     IsoComboItem        Required        The weapon doing the attacking
    @returns    nothing
    @trigger    Events.OnHitZombie
]]
CheeseMemes.Events.OnHitZombie = function(zombie, character, bodyPartType, handWeapon)
    CheeseMemes.Events.OnHitEvents(zombie, character, handWeapon)
end


-- ---------------------------------------------------------- --
-- API EVENTS ----------------------------------------------- --
-- ---------------------------------------------------------- --
Events.EveryDays.Add(CheeseMemes.Events.Daily);
Events.OnFillInventoryObjectContextMenu.Add(CheeseMemes.Events.OnFillContext)
Events.OnFillWorldObjectContextMenu.Add(CheeseMemes.Events.OnFillWorldContext);
Events.OnHitZombie.Add(CheeseMemes.Events.OnHitZombie)
Events.OnPlayerUpdate.Add(CheeseMemes.Events.OnPlayerUpdate)
Events.OnWeaponHitCharacter.Add(CheeseMemes.Events.OnHitPlayer)
