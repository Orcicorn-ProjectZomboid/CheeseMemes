-- ---------------------------------------------------------- --
-- OBJECT INITIALIZATION ------------------------------------ --
-- ---------------------------------------------------------- --
require "CheeseMemes_00Shared";


-- ---------------------------------------------------------- --
-- RECIPE FUNCTIONS ----------------------------------------- --
-- ---------------------------------------------------------- --
--[[
    CheeseMemes.Recipes.CharliesLegoBox
    Adds 20 Lego bricks and a manual to the inventory when lego box opened
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe OpenCharliesLegoBox
]]
CheeseMemes.Recipes.CharliesLegoBox = function(items, result, player)
    local inv = player:getInventory()
    inv:AddItems("Base.Bricktoys", 20);
    inv:AddItem("Base.CharliesLegoManual");
end


--[[
    CheeseMemes.Recipes.PostersCheeseDVD1
    Adds 8 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeDiscCheese1
]]
CheeseMemes.Recipes.PostersCheeseDVD1 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese01");
    inv:AddItem("Base.CheesePosterCheese02");
    inv:AddItem("Base.CheesePosterCheese03");
    inv:AddItem("Base.CheesePosterCheese04");
    inv:AddItem("Base.CheesePosterCheese05");
    inv:AddItem("Base.CheesePosterCheese06");
    inv:AddItem("Base.CheesePosterCheese07");
    inv:AddItem("Base.CheesePosterCheese08");
end


--[[
    CheeseMemes.Recipes.Crowbarski
    Creates and populates a certificate of authenticity for a crowbarski
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger     recipe CreateCrowbarskiCertificate
]]
CheeseMemes.Recipes.Crowbarski = function(items, result, player)
    -- Some Defaults (Incase item missing)
    local crowbarID = 1977;
    local crowbarValue = 69;
    local crowbarNote = " (" .. getText("UI_ModManager_List_Tooltip_Broken") .. ")";

    -- Work out the Crowbar's Details (ID, Value)
    if items then 
        crowbarID = tonumber(string.sub(items:get(0):getID(), -4))
        if not items:get(0):isBroken() then
            crowbarValue = CheeseMemes.Functions.FormatCommas((10000 - crowbarID) * 4269)
            crowbarNote = "";
            -- Write the value on the crowbar (silly scammers)
            items:get(0):setName(getText("IGUI_Crowbarski_Name", crowbarValue));
            items:get(0):setCustomName(true);
        end
    end

    -- Format the Certificate of Authenticity Text
    local cert = getText("IGUI_Crowbarski_Line00") .. "\n" ..
                 getText("IGUI_Crowbarski_Line01") .. "\n" .. 
                 getText("IGUI_Crowbarski_Line02") .. "\n" ..
                 getText("IGUI_Crowbarski_Line03") .. "\n\n" .. 
                 getText("IGUI_Crowbarski_Line04", crowbarID) .. "\n" ..
                 getText("IGUI_Crowbarski_Line05", crowbarValue, crowbarNote) .. "\n" ..
                 getText("IGUI_Crowbarski_Line06", getGameTime():getCalender():getTime()) .. "\n\n" ..
                 getText("IGUI_Crowbarski_Line07");

    -- Create the Certificate of Authenticity
    result:addPage(1, cert);
    result:setLockedBy("WHCD#" .. CheeseMemes.Functions.Timestamp());
end


--[[
    CheeseMemes.Recipes.MegaDolly
    Plays Mega Dolly Music and places her in the world.
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe CreateMegaDolly
]]
CheeseMemes.Recipes.MegaDolly = function(items, result, player)
    CheeseMemes.Functions.EmitSound(player, "CreateMegaDolly1");
    CheeseMemes.Functions.EmitSound(player, "CreateMegaDolly2");
    CheeseMemes.Functions.Say(getText("IGUI_MegaDolly"))
    local sq = getSquare(player:getX(), player:getY(), player:getZ());
    sq:AddWorldInventoryItem("Base.MegaDolly", 0, 0, 0);
end


--[[
    CheeseMemes.Recipes.onTestNearComputer
    Searches around the player in a 1 sauare diameter looking 
    to determine if you're a computer.
    @params     IsoCombotItem       Optional        The item checked from the recipe but it is ignored
    @returns    Boolean                             True/False if near a computer sprite
    @trigger    recipe ConsumeDiscCheese1
]]
CheeseMemes.Recipes.OnTestNearComputer = function(item)
    local player = getPlayer();
    local playerX, playerY, playerZ = player:getX(), player:getY(), player:getZ();

    -- Search 1 square around to see if we're near a computer
    for x = playerX -1, playerX + 1 do 
        for y = playerY -1, playerY + 1 do 
            local square = getCell():getGridSquare(x, y, playerZ);
            local squareObjects = square:getObjects();
            for i = 0, squareObjects:size() - 1 do 
                if CheeseMemes.Functions.IsThisComputer(squareObjects:get(i)) then 
                    -- You're near a computer, so good enough. 
                    -- There's no easy way to tell if there is power here because the game
                    -- forces you to check Appliances, Radios and Lights not Squares
                    return true;
                end
            end
        end
    end
    return false;
end


--[[
    CheeseMemes.Recipes.PostersBillMurray
    Randomly generates 1 of X posters of bill murray when triggered
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeMagazineOfBillMurray
]]
CheeseMemes.Recipes.PostersBillMurray = function(items, result, player)
    local rndMax = 4;                           -- Amount of Posterss in the Bill collection
    local inv = player:getInventory();
    local random = ZombRand(rndMax+1);
    if random < 1 then random = 1; end
    if random > rndMax then random = rndMax; end
    inv:AddItem("Base.CheesePosterBill0" .. random);
end


--[[
    CheeseMemes.Recipes.PostersCharlie
    Adds 2 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeCharliePosterBook 
]]
CheeseMemes.Recipes.PostersCharlie = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CharliePoster01");
    inv:AddItem("Base.CharliePoster02");
end


--[[
    CheeseMemes.Recipes.PostersCheese1
    Adds 2 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeMagazineCheese1
]]
CheeseMemes.Recipes.PostersCheese1 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese01");
    inv:AddItem("Base.CheesePosterCheese02");
end


--[[
    CheeseMemes.Recipes.PostersCheese2
    Adds 2 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeMagazineCheese2
]]
CheeseMemes.Recipes.PostersCheese2 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese03");
    inv:AddItem("Base.CheesePosterCheese04");
end


--[[
    CheeseMemes.Recipes.PostersCheese3
    Adds 2 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeMagazineCheese3
]]
CheeseMemes.Recipes.PostersCheese3 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese05");
    inv:AddItem("Base.CheesePosterCheese06");
end


--[[
    CheeseMemes.Recipes.PostersCheese4
    Adds 2 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeMagazineCheese4
]]
CheeseMemes.Recipes.PostersCheese4 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese07");
    inv:AddItem("Base.CheesePosterCheese08");
end


--[[
    CheeseMemes.Recipes.PostersMovie1
    Adds 3 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe OpenBoxOfMoviePromotional01
]]
CheeseMemes.Recipes.PostersMovie1 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterMovie01");   -- Harry Potter
    inv:AddItem("Base.CheesePosterMovie02");   -- Gremlins
    inv:AddItem("Base.CheesePosterMovie03");   -- Back to the Future
end


--[[
    CheeseMemes.Recipes.PostersSpiffo1
    Adds 3 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeBoxOfSpiffoPromotional01
]]
CheeseMemes.Recipes.PostersSpiffo1 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterSpiffo01");   -- Don't be Blue
    inv:AddItem("Base.CheesePosterSpiffo04");   -- Merry Spiffmas
    inv:AddItem("Base.CheesePosterSpiffo05");   -- Stay Warm
end


--[[
    CheeseMemes.Recipes.PostersSpiffo2
    Adds 2 posters to the player's inventory when executed
    @params     KahluaTable         Required        The items being used in the recipe
    @params     IsoComboItem        Required        The item being crafted
    @params     IsoCharacter        Required        The player doing the crafting
    @trigger    recipe ConsumeBoxOfSpiffoPromotional02
]]
CheeseMemes.Recipes.PostersSpiffo2 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterSpiffo02");   -- Be Prepared
    inv:AddItem("Base.CheesePosterSpiffo06");   -- They're Coming
end
