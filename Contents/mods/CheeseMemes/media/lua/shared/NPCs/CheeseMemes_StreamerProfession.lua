require('NPCs/MainCreationMethods');
StreamerProfession = StreamerProfession or {};


-- Add the Small PP Trait (it does nothing)
StreamerProfession.AddTraits = function()
    local traitSmallPP = TraitFactory.addTrait("smallpp", getText("UI_Trait_SmallPP"), 0, getText("UI_Trait_SmallPP_Desc"), false, false);
end


-- Add the Streamer profession
StreamerProfession.DoProfessions = function()
    local streamer = ProfessionFactory.addProfession("streamer", getText("UI_Profession_Streamer"), "prof_streamer", 0, getText("UI_Profession_Streamer_Desc"));

    -- Exclusive Traits:  SmallPP and up all night
    streamer:addFreeTrait("smallpp");
    streamer:addFreeTrait("NightOwl");

    -- Pretty good with with the small blunts (you know, small PP and all)
    streamer:addXPBoost(Perks.SmallBlunt, 1);

    -- Add it to the profession's list and descriptions
    local profList = ProfessionFactory.getProfessions()
    for i = 1, profList:size() do
        local profession = profList:get(i - 1);
        BaseGameCharacterDetails.SetProfessionDescription(profession);
    end
end


-- For some reason when you die mid-game and start a new character all the professions
-- are reset back to normal. To make matters worse, there's no Character event to bind to.
-- So as dumb as it is, we store the old profession function into a variable
-- We replace the profession function with a new function
-- Our new function calls the old professions, then adds our streamer profession
-- This is beyond idiotic but it works.
local oldProfessions = BaseGameCharacterDetails.DoProfessions;
StreamerProfession.DoProfessionsMidGame = function ()
    oldProfessions();
    StreamerProfession.DoProfessions();
end
BaseGameCharacterDetails.DoProfessions = StreamerProfession.DoProfessionsMidGame;


-- When the game loads, inject our professions and traits into the lists
Events.OnGameBoot.Add(StreamerProfession.AddTraits);
Events.OnGameBoot.Add(StreamerProfession.DoProfessions);
