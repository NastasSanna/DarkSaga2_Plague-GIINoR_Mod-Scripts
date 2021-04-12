
func int C_NpcHasAllIngredients_OrcInTrouble(var C_NPC slf)
{
	if (Npc_HasItems(slf, ItPl_Health_Herb_01) >= 3 &&
		Npc_HasItems(slf, ItPl_Mana_Herb_01) >= 2 &&
		Npc_HasItems(slf, ItPl_Mushroom_01) >= 7 &&
		Npc_HasItems(slf, ItPl_Blueplant) >= 10 &&
		Npc_HasItems(slf, ItFo_DS2P_OrcBooze) >= 1
		
	) {
		return TRUE;
	};
	return FALSE;
};


func void B_GiveAllIngredients_OrcInTrouble(var C_NPC slf, var C_NPC oth)
{
	AI_PrintScreen("Отданы растения и крепкий самогон",30,-1,FONT_ScreenSmall,5);
	Npc_RemoveInvItems(slf, ItPl_Health_Herb_01, 3);
	Npc_RemoveInvItems(slf, ItPl_Mana_Herb_01, 2);
	Npc_RemoveInvItems(slf, ItPl_Mushroom_01, 7);
	Npc_RemoveInvItems(slf, ItPl_Blueplant, 10);
	Npc_RemoveInvItems(slf, ItFo_DS2P_OrcBooze, 1);
};

//UNFINISHED spawn points
func void B_Spawn_PlantsForOrcHealing()
{
	Wld_InsertItem(ItPl_Health_Herb_01, "FP_SPAWNITEM_DP_FOREST_PLANT_01");
	Wld_InsertItem(ItPl_Health_Herb_01, "FP_SPAWNITEM_DP_FOREST_PLANT_02");
	Wld_InsertItem(ItPl_Health_Herb_01, "FP_SPAWNITEM_DP_FOREST_PLANT_03");
	Wld_InsertItem(ItPl_Health_Herb_01, "FP_SPAWNITEM_DP_FOREST_PLANT_04");
	Wld_InsertItem(ItPl_Health_Herb_01, "FP_SPAWNITEM_DP_FOREST_PLANT_05");
	
	Wld_InsertItem(ItPl_Mana_Herb_01, "FP_SPAWNITEM_DP_FOREST_PLANT_06");
	Wld_InsertItem(ItPl_Mana_Herb_01, "FP_SPAWNITEM_DP_FOREST_PLANT_07");
	Wld_InsertItem(ItPl_Mana_Herb_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");
	
	Wld_InsertItem(ItPl_Mushroom_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Mushroom_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Mushroom_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Mushroom_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Mushroom_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Mushroom_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Mushroom_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Mushroom_01, "FP_SPAWNITEM_DP_FOREST_PLANT_08");
	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");	
	Wld_InsertItem(ItPl_Blueplant, "FP_SPAWNITEM_DP_FOREST_PLANT_08");
};

// орков нельзя подводить слишком близко к людям
func int C_OrcsFollow_TooCloseToHumans() {
	if (Npc_GetDistToWP(hero, "FORESTHUT") < 2500) {
		return TRUE;
	};
	if (Npc_GetDistToWP(hero, "DP_FOREST_NATURALBRIDGE_04") < 2000) {
		return TRUE;
	};
	if (Npc_GetDistToWP(hero, "DP_COAST_TOWN_OUT_TO_CIMM_02") < 5000) {
		return TRUE;
	};
	if (Npc_GetDistToWP(hero, "DP_FORT_TOWN_ROAD_FIELDS_06") < 5000) {
		return TRUE;
	};
	if (Npc_GetDistToWP(hero, "DP_FORT_TOWN_TO_MILL_04") < 5000) {
		return TRUE;
	};
	if (Npc_GetDistToWP(hero, "DP_COAST_WAY_TO_BEACH_02") < 5000) {
		return TRUE;
	};
	return FALSE;
};

const string WP_GOBBOVIL = "DP_FOREST_GOBBOVIL_ENTANCE";
// довели до делевни
func int C_OrcsFollow_Arrived() {
	var C_NPC RakTarak; RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
	var C_NPC ArTush; ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
	
	if (Npc_GetDistToWP(hero, WP_GOBBOVIL) < 500 && Npc_GetDistToWP(RakTarak, WP_GOBBOVIL) < 1000 && Npc_GetDistToWP(ArTush, WP_GOBBOVIL) < 1000) {
		return TRUE;
	};
	return FALSE;
};