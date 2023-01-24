require "CheeseMemes_00Shared.lua";

CheeseMemes.Weapons.Moan = function(target)
    -- % chance you trigger a sound effect
    if ZombRand(100) <= 5 then return; end;
    
    if instanceof(target, "IsoZombie") then
        local sound = "SamuelMoan";
        if target:isFemale() then 
            sound = sound .. "Female";
        else
            sound = sound .. "Male";
        end

        -- Pick a random sound effect (Excess due to floor/ceil issues with ZombRand)a
        local random = ZombRand(1, 9);
        if random <= 3 then sound = sound .. 1; end
        if random > 3 and random <= 6 then sound = sound .. 2; end
        if random > 6 then sound = sound .. 3; end

        -- Play the sound
        CheeseMemes.Functions.EmitSound(target, sound)
    end
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
