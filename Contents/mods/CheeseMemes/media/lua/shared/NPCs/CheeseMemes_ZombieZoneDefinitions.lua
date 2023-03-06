require 'NPCs/ZombiesZoneDefinition'
ZombiesZoneDefinition = ZombiesZoneDefinition or {};

-- Zone Debugger Spawns (See /lua/shared/NPCs/ZombiesZoneDefinition.lua)

-- DARK MORIARTI ZOMBIE
CheeseDarkMoriarti = {
    name = "CMDarkMoriarti",
    gender = "male",
    chance = 1,
};
ZombiesZoneDefinition.Fossoil[CheeseDarkMoriarti] = CheeseDarkMoriarti;
ZombiesZoneDefinition.ThunderGas[CheeseDarkMoriarti] = CheeseDarkMoriarti;

-- General Population Spawns
table.insert(ZombiesZoneDefinition.Default, {name="CMDarkMoriarti", chance=0.1, gender="male"});
