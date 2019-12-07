
instance ItRu_DS_WindBolt(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = Value_Ru_Windfist;
	visual = "ItRu_Windfist.3ds";
	material = MAT_STONE;
	spell = SPL_WindBolt;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_WINDBOLT;
	text[1] = NAME_Manakosten;
	count[1] = SPL_Cost_WINDBOLT;
	text[2] = NAME_Damage;
	count[2] = SPL_DAMAGE_WINDBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItRu_DS_Fake(C_Item)		//Фейк руны
{
	name 		= NAME_Rune;
	mainflag 	= ITEM_KAT_NONE;
	flags 		= 0;
	value 		= 0;
	visual 		= "ItRu_TeleportFarm.3ds";
	material 	= MAT_STONE;
	scemeName 	= "ROMSEALED";
	description = NAME_Rune_DS_Bad;
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
