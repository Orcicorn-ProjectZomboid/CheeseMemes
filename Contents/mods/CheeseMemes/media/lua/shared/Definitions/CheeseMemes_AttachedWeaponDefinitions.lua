require "Definitions/AttachedWeaponDefinitions"

-- Katanya Harding
-- Same spawn options as the Katana
AttachedWeaponDefinitions.KatanyaHarding = {
    chance = 1,
	weaponLocation = {"Knife Right Leg"},
	bloodLocations = {"UpperRight_L"},
	addHoles = true,
	daySurvived = 60,
	weapons = {
		"Base.KatanyaHarding",
	},
}

-- Axel Rose
-- Same spawn options as the FireAxe
AttachedWeaponDefinitions.AxelRose = {
	chance = 2,
	weaponLocation = {"Axe Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 15,
	weapons = {
		"Base.AxelRose",
	},
}

-- Crowbarski
-- Same spawn options as the Crowbar
AttachedWeaponDefinitions.Crowbarski = {
	chance = 3,
	weaponLocation = {"Crowbar Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 10,
	weapons = {
		"Base.Crowbarski",
	},
}