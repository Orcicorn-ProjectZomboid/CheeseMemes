require "CheeseMemes_00Shared";

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


CheeseMemes.Recipes.Crowbarski = function(items, result, player)
    -- Some Defaults (Incase item missing)
    local crowbarID = 1977;
    local crowbarValue = 69;
    local crowbarNote = " (" .. getText("UI_ModManager_List_Tooltip_Broken") .. ")";

    -- Work out the Crowbar's Details (ID, Value)
    if items then 
        crowbarID = tonumber(string.sub(items:get(0):getID(), -4))
        if not items:get(0):isBroken() then
            crowbarValue = FormatCommas((10000 - crowbarID) * 4269)
            crowbarNote = "";
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
    result:setLockedBy("JennyUpTopWithCheese#" .. getGametimeTimestamp());
end


-- Posters: Spiffo Promotional Posters
CheeseMemes.Recipes.PostersSpiffo1 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterSpiffo01");   -- Don't be Blue
    inv:AddItem("Base.CheesePosterSpiffo04");   -- Merry Spiffmas
    inv:AddItem("Base.CheesePosterSpiffo05");   -- Stay Warm
end
CheeseMemes.Recipes.PostersSpiffo2 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterSpiffo02");   -- Be Prepared
    inv:AddItem("Base.CheesePosterSpiffo06");   -- They're Coming
end

-- Posters: Bill Murray (Random poster per magazine)
CheeseMemes.Recipes.PostersBillMurray = function(items, result, player)
    local rndMax = 4;                           -- Amount of Posterss in the Bill collection
    local inv = player:getInventory();
    local random = ZombRand(rndMax+1);
    if random < 1 then random = 1; end
    if random > rndMax then random = rndMax; end
    inv:AddItem("Base.CheesePosterBill0" .. random);
end

-- Posters: Movies (regular)
CheeseMemes.Recipes.PostersMovie1 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterMovie01");   -- Harry Potter
    inv:AddItem("Base.CheesePosterMovie02");   -- Gremlins
    inv:AddItem("Base.CheesePosterMovie03");   -- Back to the Future
end

-- Posters: Charlie (Movies)
CheeseMemes.Recipes.PostersCharlie = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CharliePoster01");
    inv:AddItem("Base.CharliePoster02");
end

-- Posters: Cheese #1
CheeseMemes.Recipes.PostersCheese1 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese01");
    inv:AddItem("Base.CheesePosterCheese02");
end

-- Posters: Cheese #2
CheeseMemes.Recipes.PostersCheese2 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese03");
    inv:AddItem("Base.CheesePosterCheese04");
end

-- Posters: Cheese #3
CheeseMemes.Recipes.PostersCheese3 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese05");
    inv:AddItem("Base.CheesePosterCheese06");
end

-- Posters: Cheese #4
CheeseMemes.Recipes.PostersCheese4 = function(items, result, player)
    local inv = player:getInventory();
    inv:AddItem("Base.CheesePosterCheese07");
    inv:AddItem("Base.CheesePosterCheese08");
end

-- DVD: Cheese Art #1
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

-- Open Charlie's Lego Box
CheeseMemes.Recipes.CharliesLegoBox = function(items, result, player)
    local inv = player:getInventory()
    inv:AddItems("Base.Bricktoys", 20);
    inv:AddItem("Base.CharliesLegoManual");
end

-- Summon MECHA DOLLLLLLYYYYYYYYYYYYY
CheeseMemes.Recipes.MegaDolly = function(items, result, player)
    CheeseMemes.Functions.EmitSound(player, "CreateMegaDolly1");
    CheeseMemes.Functions.EmitSound(player, "CreateMegaDolly2");
    CheeseMemes.Functions.Say(getText("IGUI_MegaDolly"))
    local sq = getSquare(player:getX(), player:getY(), player:getZ());
    sq:AddWorldInventoryItem("Base.MegaDolly", 0, 0, 0);
end
