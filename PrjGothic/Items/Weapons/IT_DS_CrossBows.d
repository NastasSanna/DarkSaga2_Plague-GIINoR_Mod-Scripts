instance ItRw_Addon_MagicCrossbow(C_Item)
{
	name = "Магический арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_CROSSBOW";
	value = Value_MagicCrossbow;
	damageTotal = Damage_MagicCrossbow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_MagicBolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MagicCrossbow;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Mil_Crossbow(C_Item)
{
	name = "Арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_MilArmbrust;
	damageTotal = Damage_MilArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_MilArmbrust;
	visual = "ItRw_Mil_Crossbow.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_L_01(C_Item)
{
	name = "Охотничий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_Jagdarmbrust;
	damageTotal = Damage_Jagdarmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Jagdarmbrust;
	visual = "ItRw_Crossbow_L_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_L_02(C_Item)
{
	name = "Легкий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_LeichteArmbrust;
	damageTotal = Damage_LeichteArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_LeichteArmbrust;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_M_01(C_Item)
{
	name = "Арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_Armbrust;
	damageTotal = Damage_Armbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Armbrust;
	visual = "ItRw_Crossbow_M_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_M_02(C_Item)
{
	name = "Военный арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_Kriegsarmbrust;
	damageTotal = Damage_Kriegsarmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Kriegsarmbrust;
	visual = "ItRw_Crossbow_M_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_H_01(C_Item)
{
	name = "Тяжелый арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_SchwereArmbrust;
	damageTotal = Damage_SchwereArmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_SchwereArmbrust;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_H_02(C_Item)
{
	name = "Арбалет мастера";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_Drachenjaegerarmbrust;
	damageTotal = Damage_Drachenjaegerarmbrust;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Drachenjaegerarmbrust;
	visual = "ItRw_Crossbow_H_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_CROSSBOW_ORC(C_Item)
{
	name = "Орочий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 2000;
	damageTotal = 200;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	visual = "ItRw_Crossbow_H_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

// Арбалет Обрина до починки

instance ItRw_Crossbow_ObrBrok(C_Item)
{
	name = "Сломанный арбалет Обрина";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	damageTotal = 5;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_SchwereArmbrust;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
};

// арб Обрина после починки

instance ItRw_Crossbow_ObrGood(C_Item)
{
	name = "Арбалет Обрина";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_WOOD;
	damageTotal = 155;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_SchwereArmbrust;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
};

