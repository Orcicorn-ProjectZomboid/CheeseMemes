-- ---------------------------------------------------------- --
--  OBJECT DEFINITION --------------------------------------- --
-- ---------------------------------------------------------- --
CheeseMemes = {
    VERSION = "1.0.0",
    AUTHOR = "Orcicorn",
    LOGGING = true,
    log = function(msg)
        if not CheeseMemes.LOGGING then return; end
        print("CheeseMemes: " .. msg)
    end
}
CheeseMemes.Functions = {};     -- 00Shared (Below)
CheeseMemes.Events = {};        -- 01Events
CheeseMemes.Weapons = {};       -- 02WeaponEffects
CheeseMemes.Items = {};         -- 03ItemEffects
CheeseMemes.Recipes = {};       -- 04RecipeCode

-- ---------------------------------------------------------- --
-- SHARED FUNCTIONS ----------------------------------------- --
-- Alphabetically sorted ------------------------------------ --
-- ---------------------------------------------------------- --
--[[
    CheeseMemes.Functions.EmitSound
    Broadcast a sound from the character into the world.
    The Volume and Distance is set by the Sounds configuration in /scripts
    @params     IsoCharacter    Required        The character to emit the sound from
    @params     String          Required        The sound effect to trigger
    @returns    nothing
    @trigger    multiple
]]
CheeseMemes.Functions.EmitSound = function(who, sound)
    if who == nil or sound == nil then return; end
    if not who:getEmitter():isPlaying(sound) then 
        who:getEmitter():playSound(sound)
    end
end


--[[
    CheeseMemes.Functions.FormatCommas
    Takes a series of integers and format's them with comma's in the american style
    @params     Integer         Required        The number to be formatted (e.g.: 1234567)
    @returns    String                          Formatted String (e.g.: 1,234,567)
    @trigger    CheeseMemes.Recipes.Crowbarski
]]
CheeseMemes.Functions.FormatCommas = function(number)
    -- Credit: http://richard.warburton.it
    local left,num,right = string.match(number,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end


--[[
    CheeseMemes.Functions.HaloText
    Produces text about the player head that is only viewable client-side
    @params     IsoCharacter    Required        The player to produce the halo text 
    @params     String          Required        The text to draw in the halo text
    @returns    nothing
    @trigger    multiple
]]
CheeseMemes.Functions.HaloText = function(player, message)
    HaloTextHelper:update();
    HaloTextHelper.addText(player, message, HaloTextHelper.getColorWhite())
    HaloTextHelper:update();
end


--[[
    CheeseMemes.Functions.IsThisComputer
    Checks if an object is a regular computer sprite. Same idea as david but there are 
    2 different computers and 4 different angles
    @params     IsoObject       Required        The object to test
    @returns    boolean                         True/False if object is a computer
    @trigger    CheeseMemes.Recipes.OnTestNearComputer
]]
CheeseMemes.Functions.IsThisComputer = function(object)
    -- appliances_com_01_ :: 72-79 is a computer
    local sprite = object:getSprite():getName() or object:getSpriteName();
    if sprite == "appliances_com_01_72" or sprite == "appliances_com_01_73" or 
       sprite == "appliances_com_01_74" or sprite == "appliances_com_01_75" or
       sprite == "appliances_com_01_76" or sprite == "appliances_com_01_77" or
       sprite == "appliances_com_01_78" or sprite == "appliances_com_01_79" then
        return true;
    else
        return false;
    end
end


--[[
    CheeseMemes.Functions.IsThisDavid
    Checks if an object is David the Gnome. Since it's a world object we can't
    ask for the type as it's just moveable. We have to check if it's sprite matches
    @params     IsoObject       Required        The Object to test
    @returns    boolean                        True/False if it is David the Gnome
    @trigger    CheeseMemes.Events.OnFillWorldContext
]]
CheeseMemes.Functions.IsThisDavid = function(object)
    local sprite = object:getSprite():getName() or object:getSpriteName();
    if sprite == "vegetation_ornamental_01_48" or sprite == "vegetation_ornamental_01_49" then 
        return true;
    else
        return false;
    end
end


--[[
    CheeseMemes.Functions.IsThisGnomey
    Checks if an object is a Gnomey Variant from Dylan's Tiles. Since it's a world object we can't
    ask for the type as it's just moveable. We have to check if it's sprite matches
    @params     IsoObject       Required        The Object to test
    @returns    boolean                        True/False if it is Gnomey/Gnomey-Like
    @trigger    CheeseMemes.Events.OnFillWorldContext
]]
CheeseMemes.Functions.IsThisGnomey = function(object)
    local sprite = object:getSprite():getName() or object:getSpriteName();
    if sprite == "DylansGardenStuff01_34" or sprite == "DylansGardenStuff01_35" or sprite == "DylansGardenStuff01_45" or sprite == "DylansGardenStuff01_46" then 
        return true;
    else
        return false;
    end
end


--[[
    CheeseMemes.Functions.NotableDates 
    Checks the current in-game date against a list of important dates.
    if an important dates occurs, then produce a little halo text
    @params     none
    @returns    nothing
    @trigger    CheeseMemes.Events.Daily
]]
CheeseMemes.Functions.NotableDates = function()
    -- Dates are always 1 less than they are. IDK Why
    local month = getGameTime():getMonth() + 1;
    local day = getGameTime():getDay() + 1;

    if month < 0 or month > 12 then return; end;
    if day < 1 or day > 31 then return; end;

    -- Populate our array of important dates
    local importantDates = {}
    importantDates[0] = {1, 1, "SURVIVED ANOTHER YEAR!"};
    -- importantDates[1] = {1, 20, "Damn, forgot another anniversary"};
    importantDates[1] = {2, 9, "Happy Birthday Cheese"};
    importantDates[2] = {2, 21, "Happy Birthday Charlie"};
    importantDates[3] = {9, 21, "Happy Birthday Bill Murray"};
    importantDates[4] = {10, 9, "Happy Birthday Dahlia"};
    importantDates[5] = {10, 28, "Happy Birthday Jenny"};
    importantDates[6] = {12, 25, "Merry Christmas!"};

    -- Loop through the dates and determine if this is an important date
    for key,_ in ipairs(importantDates) do 
        if (importantDates[key][1] == month) and (importantDates[key][2] == day) then 
            CheeseMemes.Functions.HaloText(getPlayer(), importantDates[key][3]);
            return;     -- Only one announcement per day
        end
    end
end


--[[
    CheeseMemes.Functions.PlaySound
    Plays a sound on the client machine without emitting into the world
    @params     IsoCharacter    Required    The character to play the sound on
    @params     String          Required    The sound effect to trigger
    @returns    nothing
    @trigger    multiple
]]
CheeseMemes.Functions.PlaySound = function(who, sound)
    who:playSound(sound);
end


--[[
    CheeseMemes.Functions.Say
    Makes the current player say a message out loud
    This is set up as a proxy function so that we can change the API calls as needed
    @params     String          Required        The string to say out loud
    @returns    nothing
    @trigger    multiple
]]
CheeseMemes.Functions.Say = function(message)
    -- getPlayer():Say(message)
    processSayMessage(message)
end


--[[
    CheeseMemes.Functions.Shout
    Makes the current player shout a message out loud
    This is setup as aproxy function so that we can change the API calls as needed
    @params     String          Required        The string to shout
    @returns    nothing
    @trigger    multiple
]]
CheeseMemes.Functions.Shout = function(message)
    -- getPlayer():SayShout(message)
    processShoutMessage(message)
end


--[[
    CheeseMemes.Functions.Timestamp 
    Returns an Epoch Timestamp in Milliseconds. Proxified incase we decide to change
    how the timestamp is generated as it may be used in multiple places.
    @params     none
    @returns    integer                         The Timestamp in milliseconds
    @trigger    CheeseMemes.Events.OnFillContext
    @trigger    CheeseMemes.Recipes.Crowbarski
]]
CheeseMemes.Functions.Timestamp = function()
    return getGameTime():getCalender():getTimeInMillis();
end
