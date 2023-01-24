require "Items/ProceduralDistributions"
require 'Items/SuburbsDistributions'

-- *************************************************************
-- BILL MURRAY POSTERS *****************************************
-- *************************************************************
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "Base.MagazineOfBillMurray");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, "Base.MagazineOfBillMurray");
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.MagazineOfBillMurray");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.MagazineOfBillMurray");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 1);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.MagazineOfBillMurray");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 1);
table.insert(ProceduralDistributions["list"]["PostOfficeMagazines"].items, "Base.MagazineOfBillMurray");
table.insert(ProceduralDistributions["list"]["PostOfficeMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["PrisonCellRandom"].items, "Base.MagazineOfBillMurray");
table.insert(ProceduralDistributions["list"]["PrisonCellRandom"].items, 0.5);
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "Base.MagazineOfBillMurray");
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 0.5);

-- *************************************************************
-- SPIFFO POSTERS **********************************************
-- *************************************************************
--  Promotional Poster Group #1: Spiffo Restaurants
table.insert(ProceduralDistributions["list"]["CrateSpiffoMerch"].items, "Base.BoxOfSpiffoPromotional01");
table.insert(ProceduralDistributions["list"]["CrateSpiffoMerch"].items, 1);
table.insert(ProceduralDistributions["list"]["GigamartSchool"].items, "Base.BoxOfSpiffoPromotional01");
table.insert(ProceduralDistributions["list"]["GigamartSchool"].items, 2);
table.insert(ProceduralDistributions["list"]["SpiffosKitchenCounter"].items, "Base.BoxOfSpiffoPromotional01");
table.insert(ProceduralDistributions["list"]["SpiffosKitchenCounter"].items, 10);
table.insert(ProceduralDistributions["list"]["PawnShopCases"].items, "Base.BoxOfSpiffoPromotional01");
table.insert(ProceduralDistributions["list"]["PawnShopCases"].items, 3);
--  Promotional Poster Group #2: Gun Store / Prepper
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "Base.BoxOfSpiffoPromotional02");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 0.01);
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, "Base.BoxOfSpiffoPromotional02");
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, 20);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.BoxOfSpiffoPromotional02");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 8);
table.insert(ProceduralDistributions["list"]["GunStoreShelf"].items, "Base.BoxOfSpiffoPromotional02");
table.insert(ProceduralDistributions["list"]["GunStoreShelf"].items, 0.01);
table.insert(ProceduralDistributions["list"]["PawnShopCases"].items, "Base.BoxOfSpiffoPromotional02");
table.insert(ProceduralDistributions["list"]["PawnShopCases"].items, 3);
-- Spiffo Gremlins (HitVids & Crate)
table.insert(ProceduralDistributions["list"]["MovieRentalShelves"].items, "Base.CheesePosterSpiffo03");
table.insert(ProceduralDistributions["list"]["MovieRentalShelves"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, "Base.CheesePosterSpiffo03");
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, 0.1);
-- Spiffo Wick (HitVis & Crate)
table.insert(ProceduralDistributions["list"]["MovieRentalShelves"].items, "Base.CheesePosterSpiffo07");
table.insert(ProceduralDistributions["list"]["MovieRentalShelves"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, "Base.CheesePosterSpiffo07");
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, 0.1);

-- *************************************************************
-- MOVIE POSTERS ***********************************************
-- *************************************************************
-- Group 1: HitVids may have box of promotional posters
table.insert(ProceduralDistributions["list"]["MovieRentalShelves"].items, "Base.BoxOfMoviePromotional01");
table.insert(ProceduralDistributions["list"]["MovieRentalShelves"].items, 1);
table.insert(ProceduralDistributions["list"]["PawnShopCases"].items, "Base.BoxOfMoviePromotional01");
table.insert(ProceduralDistributions["list"]["PawnShopCases"].items, 3);
-- Group 2: Individual posters may be in VHS Crates
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, "Base.CheesePosterMovie01");
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, 3);
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, "Base.CheesePosterMovie02");
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, 3);
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, "Base.CheesePosterMovie03");
table.insert(ProceduralDistributions["list"]["CrateVHSTapes"].items, 3);
-- Group 2: Hobbies may also have individual posterrs
table.insert(ProceduralDistributions["list"]["Hobbies"].items, "Base.CheesePosterMovie01");
table.insert(ProceduralDistributions["list"]["Hobbies"].items, 0.5);
table.insert(ProceduralDistributions["list"]["Hobbies"].items, "Base.CheesePosterMovie02");
table.insert(ProceduralDistributions["list"]["Hobbies"].items, 0.5);
table.insert(ProceduralDistributions["list"]["Hobbies"].items, "Base.CheesePosterMovie03");
table.insert(ProceduralDistributions["list"]["Hobbies"].items, 0.5);
-- Group 3: Harry Potter poster may be in Kids Dresser
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, "Base.CheesePosterMovie01");
table.insert(ProceduralDistributions["list"]["WardrobeChild"].items, 0.5);

-- *************************************************************
-- CHARLIE POSTERS *********************************************
-- *************************************************************
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.CharliePosterBook");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.1);
table.insert(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"].items, "Base.CharliePosterBook");
table.insert(ProceduralDistributions["list"]["LivingRoomShelfNoTapes"].items, 0.1);
table.insert(ProceduralDistributions["list"]["LivingRoomSideTable"].items, "Base.CharliePosterBook");
table.insert(ProceduralDistributions["list"]["LivingRoomSideTable"].items, 0.01);

-- *************************************************************
-- ZOMBIE POSTERS **********************************************
-- *************************************************************
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.CheesePosterZombie01");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.CheesePosterZombie02");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.CheesePosterZombie01");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.CheesePosterZombie02");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.001);

-- *************************************************************
-- CHEESE POSTERS **********************************************
-- *************************************************************
-- Cheeple
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, 0.1);
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["CafeShelfBooks"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["CafeShelfBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 0.5);
table.insert(ProceduralDistributions["list"]["DeskGeneric"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["DeskGeneric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, 1);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.1);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.MagazineCheese1");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 1);
-- Curd
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, 0.2);
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 0.5);
table.insert(ProceduralDistributions["list"]["JanitorMisc"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["JanitorMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["KitchenRandom"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["KitchenRandom"].items, 0.5);
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, 1);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.1);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.MagazineCheese2");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 1);
-- Enquirer
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.3);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, 0.3);
table.insert(ProceduralDistributions["list"]["BreakRoomShelves"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["BreakRoomShelves"].items, 1);
table.insert(ProceduralDistributions["list"]["CafeShelfBooks"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["CafeShelfBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 0.5);
table.insert(ProceduralDistributions["list"]["DeskGeneric"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["DeskGeneric"].items, 0.8);
table.insert(ProceduralDistributions["list"]["GarageFirearms"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["GarageFirearms"].items, 0.1);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.1);
table.insert(ProceduralDistributions["list"]["Locker"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["Locker"].items, 0.6);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.MagazineCheese3");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 1);
table.insert(SuburbsDistributions["all"]["bin"].items, "Base.MagazineCheese3");
table.insert(SuburbsDistributions["all"]["bin"].items, 0.01);
-- Bild
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["BathroomShelf"].items, 0.2);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BreakRoomShelves"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["BreakRoomShelves"].items, 1);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 0.5);
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, 1);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.1);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 1);
table.insert(ProceduralDistributions["list"]["OfficeDeskHome"].items, "Base.MagazineCheese4");
table.insert(ProceduralDistributions["list"]["OfficeDeskHome"].items, 0.5);

-- *************************************************************
-- CHEESE POSTER CD ********************************************
-- *************************************************************
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, "Base.DiscCheese1");
table.insert(ProceduralDistributions["list"]["ClassroomDesk"].items, 0.001);
table.insert(ProceduralDistributions["list"]["OfficeDeskHome"].items, "Base.DiscCheese1");
table.insert(ProceduralDistributions["list"]["OfficeDeskHome"].items, 0.5);
