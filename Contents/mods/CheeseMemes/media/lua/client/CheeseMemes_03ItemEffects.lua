-- ---------------------------------------------------------- --
--  OBJECT DEFINITION --------------------------------------- --
-- ---------------------------------------------------------- --
require "CheeseMemes_00Shared.lua";


-- ---------------------------------------------------------- --
--  LOCAL VARIABLES ----------------------------------------- --
-- ---------------------------------------------------------- --
local r4kStartedReadingAt = 0;          -- When you started reading r4ks book
local possStartedDrinking = 0;          -- When you started drinking PossCola
local lastGnomeSniff = 0;               -- Last time you sniffed David


-- ---------------------------------------------------------- --
--  ITEM EFFECTS -------------------------------------------- --
-- ---------------------------------------------------------- --
--[[
    CheeseMemes.Items.GamerGlasses
    If you're wearing the Cheese Gamer Glasses, you may randomly shout out some 
    stupid shit that is pretty common on the Twitch Streams.
    @params     IsoCharacter        Required        The character wearing the glasses
    @returns    nothing
    @trigger    CheeseMemes.Events.OnHitEvents
]]
CheeseMemes.Items.GamerGlasses = function(player)
    local maxQuotes = 59;                -- IGUI_CheeseQuotesXXX
    if ZombRand(1, 100) <= 1 then 
        local quote = ZombRand(0, (maxQuotes + 1))
        if quote < 1 then quote = 1; end
        if quote >= maxQuotes then quote = maxQuotes; end            
        CheeseMemes.Functions.Say(getText("IGUI_CheeseQuotes" .. quote));
    end
end


--[[
    CheeseMemes.Items.MegaDolly
    This handles when MechaDolly is fed. It will record the last time she had an action
    to avoid spam, delete a battery from your inventory then randomlyk decide if you deserve
    a reward. If you do, the entire inventory of the game is loaded and we pick a single item from it.
    Then a voice line is emitted to indicate she wants more or that she gave you a reward.
    @params     IsoCombotItem       Optional            The item we're interacting with. Useless but Event requires we pass it
    @returns    nothing
    @trigger    CheeseMemes.Events.OnFillContext
]]
CheeseMemes.Items.MegaDolly = function(item)
    local player = getPlayer();
    local playerInv = player:getInventory();

    -- Record the last action for spam prevention
    item:getModData().LastDollyAction = CheeseMemes.Functions.Timestamp();

    -- Tweak out the random since Ceil/Floor is a little fucky with ZombRand
    local randomSoundMax = 5;           -- Max sounds (Happy/More should always be same amount)
    local random = ZombRand(0, randomSoundMax + 1);
    if random < 1 then random = 1; end
    if random > randomSoundMax then random = randomSoundMax; end

    -- Delete a Battery
    playerInv:DoRemoveItem(playerInv:getFirstTypeRecurse("Battery"))
    
    -- 95% of the time, just say dolly wants more. Otherwise, random loot item!
    if ZombRand(100) > 10 then 
        CheeseMemes.Functions.EmitSound(player, "MegaDollyMore" .. random);
    else
        CheeseMemes.Functions.EmitSound(player, "MegaDollyHappy" .. random);
        local allItems = ScriptManager.instance:getAllItems();
        local randomItem = allItems:get(ZombRand(allItems:size()-1))
        playerInv:AddItem(randomItem:getFullName());
        CheeseMemes.Functions.Shout(getText("IGUI_MegaDollyLoot"));
        CheeseMemes.Functions.HaloText(player, getText("IGUI_MegaDollyLoot2", randomItem:getDisplayName()))
    end
end


--[[
    CheeseMemes.Items.PossSoda
    When you're drinking Poss' soda, each tick there is a 0.1% chance that you 
    become over hydrated. This seems really slow but it triggers every tick for a few seconds
    and generally leads to about a 75% (give or take) chance you over hydrate.
    @params     IsoCharacter        Required        The Character drinking the soda
    @returns    nothing
    @trigger    CheeseMemes.Events.OnPlayerUpdate
]]
CheeseMemes.Items.PossSoda = function(player)
    local overHydrated = false
    if (getTimestamp() - possStartedDrinking) > 5 then
        if ZombRand(1000) <= 1 then 
            possStartedDrinking = getTimestamp();
            local wornItems = player:getWornItems();
            for i = 0, wornItems:size() - 1 do 
                local item = wornItems:get(i):getItem()
                if item:IsClothing() and item:getWetness() < 10 then 
                    item:setWetness(ZombRand(11, 85));
                    item:updateWetness(true)
                    overHydrated = true;
                end
            end
            if overHydrated then 
                CheeseMemes.Functions.HaloText(player, getText("IGUI_DammitPoss"))
            end
        end
    end
end


--[[
    CheeseMemes.Items.R4KBook
    When R4K's book is being read, we first make note that you started reading the book
    and we put some ridiculous text above the player's head.  After a few seconds we 
    put you to sleep and make a snoring sound that everyone else can hear. We then 
    also delete the book from your inventory to act like you consumed it.
    @params     IsoCharacter        Required        The player reading the book
    @params     IsoComboItem        Required        The Item being Read
    @returns    nothing
    @trigger    CheeseMemes.Events.OnPlayerUpdate
]]
CheeseMemes.Items.R4KBook = function(player, item)
    if r4kStartedReadingAt == 0 then 
        r4kStartedReadingAt = getTimestamp();
        -- CheeseMemes.Functions.HaloText(player, getText("IGUI_R4KBook"))
        CheeseMemes.Functions.Say(getText("IGUI_R4KBook"))
    else
        if (getTimestamp() - r4kStartedReadingAt) >= 2 or player:isTimedActionInstant() then
            UIManager.setFadeBeforeUI(player:getPlayerNum(), true)
            UIManager.FadeOut(player:getPlayerNum(), 1)
            player:setAsleepTime(0.0);
            player:setAsleep(true)
            getSleepingEvent():setPlayerFallAsleep(player, 6);
            CheeseMemes.Functions.EmitSound(player, "R4KSnoring");
            player:getInventory():DoRemoveItem(item);
            r4kStartedReadingAt = 0;
        end
    end
end


--[[
    CheeseMemes.Items.SniffDavid
    Handles when you sniff david the gnome.  It records the last time you did it so we don't
    get too much spam on it and then plays an emote and triggers a voice line.  There's a 10% 
    chance you get a little drunk off of his Pheromones
    @params     IsoCharacter        Required        The player doing the sniffing
    @params     Square              Required        The square the player is doing the sniffing on
    @returns    nothing
    @trigger    CheeseMemes.Events.OnFillWorldContext
]]
CheeseMemes.Items.SniffDavid = function(player, square)
    -- Spam protection
    if lastGnomeSniff > 0 and (getTimestamp() - lastGnomeSniff) < 4 then 
        return;
    end

    -- Emote, Play sound, make note
    player:playEmote("followme")
    CheeseMemes.Functions.PlaySound(square, "GnomeLaugh");
    lastGnomeSniff = getTimestamp();

    -- Handle how the character reacts
    if ZombRand(100) < 10 then 
        CheeseMemes.Functions.Shout(getText("IGUI_SniffDavidShout"))
        if player:getStats():getDrunkenness() < 12 then 
            player:getStats():setDrunkenness(12);
        end
    else
        local random = ZombRand(0, 6)
        if random < 1 then random = 1; end
        if random > 5 then random = 5; end
        CheeseMemes.Functions.HaloText(player, getText("IGUI_SniffDavidLine" .. random));
    end
end

CheeseMemes.Items.SniffGnomey = function(player, square)
    -- Spam protection
    if lastGnomeSniff > 0 and (getTimestamp() - lastGnomeSniff) < 4 then 
        return;
    end
   
    player:playEmote("followme");
    CheeseMemes.Functions.PlaySound(square, "GnomeLaughTiny");
    lastGnomeSniff = getTimestamp();
    
    -- Handle the reaction
    if ZombRand(100) < 5 then 
        CheeseMemes.Functions.Shout(getText("IGUI_SniffGnomeyShout"));
        if player:getStats():getDrunkenness() < 24 then 
            player:getStats():setDrunkenness(24);
        end
    else
        local random = ZombRand(0, 6)
        if random < 1 then random = 1; end
        if random > 5 then random = 5; end
        CheeseMemes.Functions.HaloText(player, getText("IGUI_SniffGnomeyLine" .. random));
    end
end