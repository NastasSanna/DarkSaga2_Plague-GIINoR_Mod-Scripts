
func int C_DS_NpcHasSolidFood(var C_Npc owner)
{
	if((Npc_HasItems(owner,ItFo_Stew) > 0) || (Npc_HasItems(owner,ItFo_Addon_Pfeffer_01) > 0) 
	|| (Npc_HasItems(owner,ItFo_Honey) > 0) || (Npc_HasItems(owner,ItFo_Addon_Meatsoup) > 0) 
	|| (Npc_HasItems(owner,ItFo_Apple) > 0) || (Npc_HasItems(owner,ItFo_FishSoup) > 0) 
	|| (Npc_HasItems(owner,ItFo_Bacon) > 0)  
	|| (Npc_HasItems(owner,ItFo_Fish) > 0) || (Npc_HasItems(owner,ItFoMuttonRaw) > 0) 
	|| (Npc_HasItems(owner,ItFoMutton) > 0) || (Npc_HasItems(owner,ItFo_Addon_Shellflesh) > 0) 
	|| (Npc_HasItems(owner,ItFo_XPStew) > 0) || (Npc_HasItems(owner,ItFo_Addon_FireStew) > 0) 
	|| (Npc_HasItems(owner,ItFo_Cheese) > 0) || (Npc_HasItems(owner,ItFo_Sausage) > 0) 
	|| (Npc_HasItems(owner,ItFo_Bread) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_DS_NpcHasPlants(var C_Npc owner)
{
	if((Npc_HasItems(owner,ItPl_Beet) > 0) || (Npc_HasItems(owner,ItPl_Health_Herb_01) > 0) 
	|| (Npc_HasItems(owner,ItPl_Planeberry) > 0) || (Npc_HasItems(owner,ItPl_Health_Herb_02) > 0) 
	|| (Npc_HasItems(owner,ItPl_Temp_Herb) > 0) || (Npc_HasItems(owner,ItPl_Health_Herb_03) > 0) 
	|| (Npc_HasItems(owner,ItPl_Dex_Herb_01) > 0) || (Npc_HasItems(owner,ItPl_Mana_Herb_01) > 0) 
	|| (Npc_HasItems(owner,ItPl_Blueplant) > 0) || (Npc_HasItems(owner,ItPl_Mana_Herb_02) > 0) 
	|| (Npc_HasItems(owner,ItPl_Forestberry) > 0) || (Npc_HasItems(owner,ItPl_Mana_Herb_03) > 0) 
	|| (Npc_HasItems(owner,ItPl_Mushroom_02) > 0) || (Npc_HasItems(owner,ItPl_Speed_Herb_01) > 0) 
	|| (Npc_HasItems(owner,ItPl_Mushroom_01) > 0) || (Npc_HasItems(owner,ItPl_Strength_Herb_01) > 0) 
	|| (Npc_HasItems(owner,ItPl_Perm_Herb) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_DS_NpcHasPotions(var C_Npc owner)
{
	if((Npc_HasItems(owner,itfo_samogon) > 0) || (Npc_HasItems(owner,ItFo_Addon_Grog) > 0) || (Npc_HasItems(owner,ItFo_Milk) > 0) || (Npc_HasItems(owner,ItFo_Addon_SchlafHammer) > 0) 
		|| (Npc_HasItems(owner,ItFo_Beer) > 0) || (Npc_HasItems(owner,ItFo_Water) > 0) || (Npc_HasItems(owner,ItFo_Addon_SchnellerHering) > 0) || (Npc_HasItems(owner,ItFo_Booze) > 0) || (Npc_HasItems(owner,ItFo_Addon_Rum) > 0) || (Npc_HasItems(owner,ItFo_Wine) > 0) || (Npc_HasItems(owner,ItFo_Addon_LousHammer) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_DS_NpcHasFood(var C_Npc man)
{
	if(c_ds_npchassolidfood(man) || c_ds_npchasplants(man) || c_ds_npchaspotions(man))
	{
		return TRUE;
	};
	return FALSE;
};

