
prototype BeliarWeaponPrototype_1H(C_Item)
{
	name = NAME_ADDON_BELIARSWEAPON;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	damagetype = DAM_EDGE;
	range = Range_Orkschlaechter;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 0;
	visual = "ItMw_BeliarWeapon_1H.3DS";
	effect = "SPELLFX_FIRESWORDBLACK";
	description = name;
	text[2] = NAME_OneHanded;
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_ADDON_ONEHANDED_BELIAR;
	text[5] = NAME_Value;
	count[5] = value;
};
prototype BeliarWeaponPrototype_2H(C_Item)
{
	name = NAME_ADDON_BELIARSWEAPON;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	damagetype = DAM_EDGE;
	range = Range_Drachenschneide;
	effect = "SPELLFX_FIRESWORDBLACK";
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 0;
	visual = "ItMw_BeliarWeapon_2H.3DS";
	description = name;
	text[2] = NAME_TwoHanded;
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_ADDON_TWOHANDED_BELIAR;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItMw_DS_TimeSplinter(BeliarWeaponPrototype_2H)
{
	name = "Осколок времени";
	description = name;
	value = 3500;
	damageType = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 150;
	damage[DAM_INDEX_MAGIC] = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 165;
	text[3] 		= NAME_Dam_Edge;
	count[3] 	= damage[DAM_INDEX_EDGE];
	text[4] 		= NAME_Dam_Magic;
	count[4] 	= damage[DAM_INDEX_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_BeliarWeapon_Raven(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_Raven;
	damageTotal = Damage_BeliarW_Raven;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 666666;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_BeliarWeapon_Fire(BeliarWeaponPrototype_2H)
{
	value = Value_BeliarW_2H_20;
	damageTotal = Damage_BeliarW_2H_20;
	count[5] = value;
	count[3] = damageTotal;
	effect = "SPELLFX_FIRESWORD";
};

instance ItMw_DS_BeliarWeapon_Fire(BeliarWeaponPrototype_2H)
{
	name = "Проклятый меч";
	description = name;
	value = Value_BeliarW_2H_20;
	damagetype = DAM_EDGE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 130;
	damage[DAM_INDEX_MAGIC] = 10;
	cond_atr[1]	= ATR_STRENGTH;
	cond_value[1] = 140;
	text[2] = NAME_Dam_Edge;
	count[2] = damage[DAM_INDEX_EDGE];
	text[3] = NAME_Dam_Magic;
	count[3] = damage[DAM_INDEX_MAGIC];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[1];
	count[5] = value;
	effect = "SPELLFX_FIRESWORD";
};

