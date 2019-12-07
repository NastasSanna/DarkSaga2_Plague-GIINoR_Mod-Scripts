
instance ItMw_DS_VakKastet(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_CLAY;
	damageTotal = 100;
	damagetype = DAM_FLY;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 350;
	visual = "ItMw_DS_Vakkastet.zen";
};

//Клешня Спящего

instance ItMw_DS_MonWeapon(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Piratensaebel;
	damageTotal = Damage_Piratensaebel;
	damagetype = DAM_EDGE;
	range = Range_Special_2H_4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Piratensaebel;
	visual = "ItMw_DarkSaga_MWeapon _1.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
