-- ---------------------------------------------------------- --
-- OBJECT INITIALIZATION ------------------------------------ --
-- ---------------------------------------------------------- --
require "CheeseMemes_00Shared.lua";


-- ---------------------------------------------------------- --
-- WEAPON FUNCTIONS ----------------------------------------- --
-- ---------------------------------------------------------- --
--[[
    CheeseMemes.Weapons.CreateGlass
    When the crowbarski is used as a weapon it instantly breaks.  When
    that occurs we create a pile of glass on the ground.
    @params     IsoCharacter/IsoZombie      Required        The Character/Zombie being hit
    @returns    nothing
    @trigger    CheeseMemes.Events.OnHitEvents
]]
CheeseMemes.Weapons.CreateGlass = function(target)
    -- Get the location of the target and put broken glass at their feet
    local sq = getSquare(target:getX(), target:getY(), target:getZ());
    sq:addBrokenGlass();
end


--[[
    CheeseMemes.Weapons.KneeCapABitch
    Handles the attack functionality of the Katanya Harding.
    if a zombie, they're knocked down and forced to crawl but if you
    hit a player in PvP we break their right leg like Nancy Kerrigan
    @params     IsoCharacter/IsoZombie      Required        The player/zombie being hit
    @returns    nothing
    @trigger    CheeseMemes.Events.OnHitEvents
]]
CheeseMemes.Weapons.KneeCapABitch = function(target)
    if instanceof(target, "IsoZombie") then
        -- if the zombie can walk, stagger then break their legs
        if target:isCanWalk() then
            target:setCanWalk(false);
            target:setBecomeCrawler(true);
            target:knockDown(true);
            if target:isFemale() and ZombRand(100) <= 10 then 
                CheeseMemes.Functions.EmitSound(target, "KatanyaHardingHit");
            end
        end
    elseif instanceof(target, "IsoPlayer") then
        -- if the player can walk, knock them down, break right leg
        local bodyDamage = target:getBodyDamage();
        if bodyDamage:getBodyPart(BodyPartType.LowerLeg_R):getFractureTime() <= 0 then    
            bodyDamage:getBodyPart(BodyPartType.LowerLeg_R):setFractureTime(20);
            bodyDamage:getBodyPart(BodyPartType.UpperLeg_R):setStiffness(20);
            bodyDamage:getBodyPart(BodyPartType.Foot_R):setStiffness(20);
        end
    end
end


--[[
    CheeseMemes.Weapons.MeltSomeFaces
    Handles the attack routines from the "AxelRose" axe which produces a random
    attempt at lighting the target on fire.
    @params     IsoCharacter/IsoZombie      Required        The Player/Zombie being hit
    @params     IsoCharacter                Requirewd       The character doing the attacking
    @returns    nothing
    @trigger    CheeseMemes.Events.OnHitEvents
]]
CheeseMemes.Weapons.MeltSomeFaces = function(target, player)
    -- If Target is a zombie, small chance
    if instanceof(target, "IsoZombie") then 
        if ZombRand(200) == 69 then
            target:setStaggerBack(true);
            target:SetOnFire();
            CheeseMemes.Functions.EmitSound(player, "AxelRoseProc" .. ZombRand(1,2));
        end
    elseif instanceof(target, "IsoPlayer") then 
        if ZombRand(100) <= 25 then
            local bodyDamage = target:getBodyDamage()
            bodyDamage:getBodyPart(BodyPartType.Head):setBurned();
            bodyDamage:getBodyPart(BodyPartType.Neck):setBurned();
            target:splatBloodFloorBig();
            target:SetOnFire();
            if getPlayer() == player then       -- Only attacker should shout
                CheeseMemes.Functions.Say(getText("IGUI_AxelRosePVP1", target:getDisplayName()))
                CheeseMemes.Functions.Say(getText("IGUI_AxelRosePVP2"));
            end 
        end 
    end
end


--[[
    CheeseMemes.Weapons.Moan
    Handles the possibility of a zombie moaning if they are hit by
    Samuel Knight and choose a random sex-based voice line to play
    @params     IsoCharacter/IsoZombie      Required        The Player/Zombie being hit
    @returns    nothing
    @trigger    CheeseMemes.Events.OnHitEvents
]]
CheeseMemes.Weapons.Moan = function(target)
    -- Must be a zombie and must pass a % random check
    if not instanceof(target, "IsoZombie") then return; end;
    if ZombRand(100) > 10 then return; end;
    
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
