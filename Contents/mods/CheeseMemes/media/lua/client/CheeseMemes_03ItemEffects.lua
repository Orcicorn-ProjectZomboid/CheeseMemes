require "CheeseMemes_00Shared.lua";

local r4kStartedReadingAt = 0;
local possStartedDrinking = 0;
local lastGnomeSniff = 0;


-- R4K's Book:  Triggered "OnPlayerUpdate"
--              When book is being read, Goooodnight
CheeseMemes.Items.R4KBook = function(player, item)
    if r4kStartedReadingAt == 0 then 
        r4kStartedReadingAt = getTimestamp();
        CheeseMemes.Functions.HaloText(player, getText("IGUI_R4KBook"))
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


-- Poss Soda: Triggered "OnPlayerUpdate"
--            Chance to soak your clothing.
--            Pretty much guaranteed to happen
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



-- Mecha Dolly talks and gives rewards for feeding her batteries
CheeseMemes.Items.MegaDolly = function(item)
    local player = getPlayer();
    local playerInv = player:getInventory();

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
        local randomItem = allItems:get(ZombRand(allItems:size()-1)):getFullName();
        playerInv:AddItem(randomItem);
        player:SayShout(getText("IGUI_MegaDollyLoot"));
    end
end


-- Sniff David the Gnome
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
        player:SayShout(getText("IGUI_SniffDavidShout"))
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


-- Gamer Glasses causes you to say stupid shit randomly
CheeseMemes.Items.GamerGlasses = function(player)
    local maxQuotes = 10;                -- IGUI_CheeseQuotesXXX
    if ZombRand(1, 100) <= 2 then 
        local quote = ZombRand(0, (maxQuotes + 1))
        if quote < 1 then quotes = 1; end
        if quote > maxQuotes then quote = maxQuotes; end            
        -- player:Say(getText("IGUI_CheeseQuotes" .. quote))
        processSayMessage(getText("IGUI_CheeseQuotes" .. quote))
    end
end
