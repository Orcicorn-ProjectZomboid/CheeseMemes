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

CheeseMemes.Functions.PlaySound = function(who, sound)
    who:playSound(sound);
end

CheeseMemes.Functions.EmitSound = function(who, sound)
    if who == nil or sound == nil then return; end
    if not who:getEmitter():isPlaying(sound) then 
        who:getEmitter():playSound(sound)
    end
end

CheeseMemes.Functions.FormatCommas = function(number)
    -- Credit: http://richard.warburton.it
    local left,num,right = string.match(number,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

CheeseMemes.Functions.HaloText = function(player, message)
    HaloTextHelper:update();
    HaloTextHelper.addText(player, message, HaloTextHelper.getColorWhite())
    HaloTextHelper:update();
end

CheeseMemes.Functions.IsThisDavid = function(object)
    local sprite = object:getSprite():getName() or object:getSpriteName();
    if sprite == "vegetation_ornamental_01_48" or sprite == "vegetation_ornamental_01_49" then 
        return true;
    else
        return false;
    end
end

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

CheeseMemes.Functions.NotableDates = function()
    -- Dates are always 1 less than they are. IDK Why
    local month = getGameTime():getMonth() + 1;
    local day = getGameTime():getDay() + 1;

    if month < 0 or month > 12 then return; end;
    if day < 1 or day > 31 then return; end;

    -- Populate our array of important dates
    local importantDates = {}
    importantDates[0] = {1, 1, "SURVIVED ANOTHER YEAR!"};
    importantDates[1] = {1, 20, "Damn, forgot another anniversary"};
    importantDates[2] = {2, 9, "Happy Birthday Cheese!"};
    importantDates[3] = {9, 21, "Happy Birthday Bill Murray"};
    importantDates[4] = {12, 25, "Merry Christmas!"};

    -- Loop through the dates and determine if this is an important date
    for key,_ in ipairs(importantDates) do 
        if (importantDates[key][1] == month) and (importantDates[key][2] == day) then 
            CheeseMemes.Functions.HaloText(importantDates[key][3]);
            return;     -- Only one announcement per day
        end
    end

end