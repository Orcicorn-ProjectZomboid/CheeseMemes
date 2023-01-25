-- If "Streamer" profession is selected, you get instant access
-- to the Jenny & Cheese T-Shirts. Boys get the Gamer glasses.
ClothingSelectionDefinitions = ClothingSelectionDefinitions or {};
ClothingSelectionDefinitions.streamer = {
	Female = {
		Tshirt = {
			items = {"Base.TShirtJennyShakes"},
		},
	},
    Male = {
		Tshirt = {
			items = {"Base.TShirtRoyaleWithCheese"},
		},
        Eyes = {
            items = {"Base.GlassesCheeseGamer"},
        },
	},
}
