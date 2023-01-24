require "Items/ProceduralDistributions"
require 'Items/SuburbsDistributions'

-- R4K's Memoire (Only in the trash)
table.insert(SuburbsDistributions["all"]["bin"].items, "Base.R4ksbook");
table.insert(SuburbsDistributions["all"]["bin"].items, 1);

-- Poss Cola (Where soda is found, sometimes trash or dead zombies)
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["CafeteriaDrinks"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["CafeteriaDrinks"].items, 8);
table.insert(ProceduralDistributions["list"]["CrateSodaBottles"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["CrateSodaBottles"].items, 12);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 12);
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["FridgeBreakRoom"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeOffice"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["FridgeOffice"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["FridgeRich"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 12);
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["FridgeTrailerPark"].items, 1);
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["GasStorageCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["GigamartBottles"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["GigamartBottles"].items, 12);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 6);
table.insert(ProceduralDistributions["list"]["MotelFridge"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["MotelFridge"].items, 3);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 8);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 8);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "Base.PossSoda");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 8);
table.insert(SuburbsDistributions["all"]["bin"].items, "Base.PossSoda");
table.insert(SuburbsDistributions["all"]["bin"].items, 0.01);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.PossSoda");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.0001);

-- Charlie's Lego Box (Plus possible manual)
table.insert(ProceduralDistributions["list"]["CrateToys"].items, "Base.CharliesLegoBox");
table.insert(ProceduralDistributions["list"]["CrateToys"].items, 1);
table.insert(ProceduralDistributions["list"]["DaycareCounter"].items, "Base.CharliesLegoBox");
table.insert(ProceduralDistributions["list"]["DaycareCounter"].items, 1);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.CharliesLegoBox");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 4);
table.insert(ProceduralDistributions["list"]["Gifts"].items, "Base.CharliesLegoBox");
table.insert(ProceduralDistributions["list"]["Gifts"].items, 5);
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.CharliesLegoBox");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 6);
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "Base.CharliesLegoBox");
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 0.5);

-- Charlie's lego manual
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "Base.CharliesLegoManual");
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 0.1);

-- Tiny Dolly (Where Dolly is, sometimes female zombies)
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateToys"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["CrateToys"].items, 1);
table.insert(ProceduralDistributions["list"]["DaycareCounter"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["DaycareCounter"].items, 0.1);
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, 0.1);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 0.1);
table.insert(ProceduralDistributions["list"]["Gifts"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["Gifts"].items, 1);
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 2);
table.insert(ProceduralDistributions["list"]["Hobbies"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["Hobbies"].items, 1);
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "Base.TinyDolly");
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 0.6);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.TinyDolly");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.001);

-- Big Dolly (very rare with dolly, very rarely in zombies)
table.insert(ProceduralDistributions["list"]["CrateToys"].items, "Base.BigDolly");
table.insert(ProceduralDistributions["list"]["CrateToys"].items, 0.001);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.BigDolly");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 0.001);
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.BigDolly");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 0.001);
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "Base.BigDolly");
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 0.0001);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.BigDolly");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.0001);

-- Remma the Rat (same places as other spiffo plushies)
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.001);
table.insert(ProceduralDistributions["list"]["CrateSpiffoMerch"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["CrateSpiffoMerch"].items, 10);
table.insert(ProceduralDistributions["list"]["CrateToys"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["CrateToys"].items, 0.01);
table.insert(ProceduralDistributions["list"]["DaycareCounter"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["DaycareCounter"].items, 0.001);
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["DaycareDesk"].items, 0.001);
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["DaycareShelves"].items, 0.001);
table.insert(ProceduralDistributions["list"]["Gifts"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["Gifts"].items, 0.001);
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 0.001);
table.insert(ProceduralDistributions["list"]["SpiffosKitchenCounter"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["SpiffosKitchenCounter"].items, 8);
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "Base.RemmyRat");
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 0.001);
