prototype ITAR_DS_Proto(C_Item)
{
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	material = MAT_LEATHER;	visual_skin = 0;
	name = ""; 
	description = name;
	visual 				= "ItAr_Governor.3ds";
	visual_change = "Armor_Governor.asc";
	protection[PROT_EDGE] = 0;	protection[PROT_BLUNT] = 0;	protection[PROT_POINT] = 0;	
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Governor;
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;			count[5] = value;
};
Prototype ITKE_Key_Proto(C_Item)
{
	name = NAME_Key; description = name;
	mainflag = ITEM_KAT_NONE;	flags = ITEM_MISSION;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	value = Value_Key_01;
	text[5] = NAME_Value;	count[5] = value;
};
prototype ItMw_1H_Axe(C_Item)
{
	name = "Òîïîð";
	mainflag = ITEM_KAT_NF;
	material = MAT_WOOD;
	flags = ITEM_AXE;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Schuerhaken;
	value = Value_Schuerhaken;
	damageTotal = Damage_Schuerhaken;
	visual = "Itmw_005_1h_poker_01.3DS";
	range = Range_Schuerhaken;
	description = name;
	text[2] = NAME_Damage;			count[2] = damageTotal;
	text[3] = NAME_Str_needed;	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
prototype ItMw_2H_Axe(C_Item)
{
	name = "Òîïîð";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_NovMace;
	damageTotal = Damage_NovMace;
	material = MAT_WOOD;
	visual = "ItMw_020_2h_Nov_Staff_01.3DS";
	description = name;
	value = Value_NovMace;
	range = Range_NovMace;
	text[2] = NAME_Damage;			count[2] = damageTotal;
	text[3] = NAME_Str_needed;	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
prototype ItMw_1H_Sword(C_Item)
{
	name = "Ìå÷";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKDolch;
	value = Value_VLKDolch;
	damageTotal = Damage_VLKDolch;
	range = Range_VLKDolch;	
	visual = "Itmw_005_1h_dagger_01.3DS";
	description = name;
	text[2] = NAME_Damage;			count[2] = damageTotal;
	text[3] = NAME_Str_needed;	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
prototype ItMw_2H_Sword(C_Item)
{
	name = "Ìå÷";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	damagetype = DAM_EDGE;
	cond_atr[2] = ATR_STRENGTH;
	description = name;
	value = Value_Misc2hSword;
	damageTotal = Damage_Misc2hSword;
	range = Range_Misc2hSword;
	cond_value[2] = Condition_Misc2hSword;
	visual = "ItMw_025_2h_Sword_old_01.3DS";
	text[2] = NAME_Damage;			count[2] = damageTotal;
	text[3] = NAME_Str_needed;	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
//--------------------------------------------------------------
//ÏÐÎÒÎÒÈÏ ÌÅ×À ÄËß ÂÒÎÐÎÉ ÐÓÊÈ
//--------------------------------------------------------------
prototype ITMW_DarkSaga_Sword_2x2_PROTO(C_Item)
{
	name = "";description = name;
	mainflag = ITEM_KAT_FF;flags = ITEM_CROSSBOW;	
	material = MAT_METAL;	damagetype = DAM_EDGE;
	munition = ITRW_DS_FAKEBOLT;
	damageTotal = 30;	
	range = 40;
	weight = 3;	
	value = 400;
	cond_atr[2] = ATR_STRENGTH;	cond_value[2] = 30;
	visual = "ItMw_DarkSaga_2x2_Dagger_1.3DS";
	on_equip = S_Sword2x2_equip;
	on_unequip = S_Sword2x2_unequip;	
	text[1] = NAME_Damage;			count[1] = damageTotal;
	text[2] = NAME_Str_needed;	count[2] = cond_value[2];
	text[3] = NAME_2X2HANDED;
	text[4] = NAME_Talent2x2_needed;
	text[5] = NAME_Value;			count[5] = value;
};
