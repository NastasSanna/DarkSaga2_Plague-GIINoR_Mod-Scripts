const int Value_Ru_Teleport = 500;

instance ItRu_DSP_TeleportForestTower(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Teleport;
	visual = "ItRu_DSP_TeleportForestTower.3DS";
	material = MAT_STONE;
	spell = SPL_DSP_TeleportForestTower;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_DSP_TeleportForestTower;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_DSP_TeleportFortTower(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Teleport;
	visual = "ItRu_DSP_TeleportFortTower.3DS";
	material = MAT_STONE;
	spell = SPL_DSP_TeleportFortTower;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_DSP_TeleportFortTower;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRu_DSP_TeleportCampTower(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Teleport;
	visual = "ItRu_DSP_TeleportCampTower.3DS";
	material = MAT_STONE;
	spell = SPL_DSP_TeleportCampTower;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_DSP_TeleportCampTower;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_Teleport;
	text[5] = NAME_Value;
	count[5] = value;
};
