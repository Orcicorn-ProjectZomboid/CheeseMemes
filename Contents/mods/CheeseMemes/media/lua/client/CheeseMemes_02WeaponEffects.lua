require "CheeseMemes_00Shared.lua";

CheeseMemes.Weapons.Moan = function(target)
    -- Must be a zombie and must pass a % random check
    if not instanceof(target, "IsoZombie") then return; end;
    if ZombRand(100) > 5 then return; end;
    
    -- Determine the Male/Female sound effect file name
    local sound = "SamuelMoan";
    if target:isFemale() then 
        sound = sound .. "Female";
    else
        sound = sound .. "Male";
    end

    -- Pick a random sound effect. We go 0 to Max+1 since the ceil/floor functions
    -- in ZombRand cause the start/stop integers to only get 1/2 a chance compared to others
    local maxSounds = 3
    local random = ZombRand(0, maxSounds + 1);
    if random < 1 then random = 1; end;
    if random > maxSounds then random = maxSounds; end;

    -- Play the sound
    CheeseMemes.Functions.EmitSound(target, sound)
end

CheeseMemes.Weapons.KneeCapABitch = function(target)
    if instanceof(target, "IsoZombie") then
        if target:isCanWalk() then
            target:setCanWalk(false);
            target:setBecomeCrawler(true);
            target:knockDown(true);
            if target:isFemale() and ZombRand(100) <= 10 then 
                CheeseMemes.Functions.EmitSound(target, "KatanyaHardingHit");
            end
        end
    else
        target:setKnockedDown(true)
        -- Break leg somehow?
    end
end

CheeseMemes.Weapons.MeltSomeFaces = function(target, player)
    if ZombRand(200) == 69 then
        if instanceof(target, "IsoZombie") then 
            -- There's no player setStaggerBack
            target:setStaggerBack(true);
        end
        if not target:isOnFire() then 
            target:SetOnFire();
            CheeseMemes.Functions.EmitSound(player, "AxelRoseProc1");
        else
            CheeseMemes.Functions.EmitSound(player, "AxelRoseProc2");
        end
    end
end

CheeseMemes.Weapons.CreateGlass = function(target)
    local sq = getSquare(target:getX(), target:getY(), target:getZ());
    sq:addBrokenGlass();
end
