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

-- Samuel Nightstick
-- Same as a Knife
AttachedWeaponDefinitions.SamuelNightstick = {
	chance = 1,
	weaponLocation = {"Knife Right Leg"},
	bloodLocations = {"UpperRight_L"},
	addHoles = false,
	daySurvived = 6,
	weapons = {
		"Base.SamuelNightstick",
	},
}

-- Harry Potter Wands
-- Wands attached to backs
AttachedWeaponDefinitions.PotterWandBack = {
	id = "PotterWandBack",
	chance = 1,
	outfit = {"Teacher", "Student"},
	weaponLocation = {"Knife in Back"},
	bloodLocations = {"Back"},
	addHoles = false,
	daySurvived = 5,
	weapons = {
		"Base.PotterWandCheese",
		"Base.PotterWandGeek",
		"Base.PotterWandJenny",
		"Base.PotterWandMadMax",
		"Base.PotterWandSam",
		"Base.PotterWandShewolf",
		"Base.PotterWandOrc",
		"Base.PotterWandUnstoppable",
	},
}

-- Students have them equipped in belt
AttachedWeaponDefinitions.PotterWandBelt = {
	id = "PotterWandBelt",
	chance = 1,
	outfit = {"Student"},
	weaponLocation = {"Belt Right Upside"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 5,
	weapons = {
		"Base.PotterWandCheese",
		"Base.PotterWandGeek",
		"Base.PotterWandJenny",
		"Base.PotterWandMadMax",
		"Base.PotterWandSam",
		"Base.PotterWandShewolf",
		"Base.PotterWandOrc",
		"Base.PotterWandUnstoppable",
	},
}

-- Dark has a firebomb in his belt
AttachedWeaponDefinitions.DarkFireBomb = {
	id = "DarkFireBomb",
	chance = 100,
	outfit = {"CMDarkMoriarti"},
	weaponLocation = {"Belt Right Upside"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 21,
	weapons = {
		"Base.SmokeBomb",
		"Base.WaterBottlePetrol",
	}
}

-- Outfit Definitions for Teachers and Students
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Student = {
	chance = 2;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.PotterWandBack,
		AttachedWeaponDefinitions.PotterWandBelt,
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Teacher = {
	chance = 5;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.PotterWandBack,
	},
}

-- Custom Weapon attachments for Dark
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.CMDarkMoriarti = {
	chance = 100;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.DarkFireBomb,
	}
}
