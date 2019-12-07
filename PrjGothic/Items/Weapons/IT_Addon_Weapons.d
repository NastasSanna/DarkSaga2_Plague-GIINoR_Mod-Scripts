
instance ItMW_Addon_Hacker_1h_01(C_Item)
{
	name = "Мачете";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Machete;
	damageTotal = Damage_Machete;
	damagetype = DAM_EDGE;
	range = Range_Machete;
	on_equip = Equip_1H_03;
	on_unequip = UnEquip_1H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Machete;
	visual = "ItMw_1H_Machete_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_1h_02(C_Item)
{
	name = "Старое мачете";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_AltMachete;
	damageTotal = Damage_AltMachete;
	damagetype = DAM_EDGE;
	range = Range_AltMachete;
	on_equip = Equip_1H_02;
	on_unequip = UnEquip_1H_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_AltMachete;
	visual = "ItMw_1H_Machete_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_02;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_2h_01(C_Item)
{
	name = "Гигантское мачете";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Hacker;
	damageTotal = Damage_Hacker;
	damagetype = DAM_EDGE;
	range = Range_Hacker;
	on_equip = Equip_2H_03;
	on_unequip = UnEquip_2H_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Hacker;
	visual = "ItMw_2H_Machete_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_03;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMW_Addon_Hacker_2h_02(C_Item)
{
	name = "Старое гигантское мачете";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_AltHacker;
	damageTotal = Damage_AltHacker;
	damagetype = DAM_EDGE;
	range = Range_AltHacker;
	on_equip = Equip_2H_02;
	on_unequip = UnEquip_2H_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_AltHacker;
	visual = "ItMw_2H_Machete_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_02;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR2hAxe(C_Item)
{
	name = "Крушитель досок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_PIR2hAxe;
	damageTotal = Damage_PIR2hAxe;
	damagetype = DAM_EDGE;
	range = Range_PIR2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR2hAxe;
	visual = "ItMw_070_2h_axe_heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR2hSword(C_Item)
{
	name = "Абордажная сабля";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_PIR2hSword;
	damageTotal = Damage_PIR2hSword;
	damagetype = DAM_EDGE;
	range = Range_PIR2hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR2hSword;
	visual = "ItMw_070_2h_sword_09.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR1hAxe(C_Item)
{
	name = "Абордажная пика";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_PIR1hAxe;
	damageTotal = Damage_PIR1hAxe;
	damagetype = DAM_EDGE;
	range = Range_PIR1hAxe;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR1hAxe;
	visual = "ItMw_030_1h_axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Addon_PIR1hSword(C_Item)
{
	name = "Абордажный нож";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_PIR1hSword;
	damageTotal = Damage_PIR1hSword;
	damagetype = DAM_EDGE;
	range = Range_PIR1hSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PIR1hSword;
	visual = "ItMw_030_1h_sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItMw_Addon_Betty(C_Item)
{
	name = "Бетти";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = Value_Betty;
	damageTotal = Damage_Betty;
	damagetype = DAM_EDGE;
	range = Range_ElBastardo;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 60;
	visual = "ItMw_065_1h_sword_bastard_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
