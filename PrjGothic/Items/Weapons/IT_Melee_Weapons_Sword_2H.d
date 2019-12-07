
instance ItMw_2H_Sword_M_01(ItMw_2H_Sword)
{
	name = "Ржавый двуручный меч";
	value = Value_Misc2hSword;
	damageTotal = Damage_Misc2hSword;
	range = Range_Misc2hSword;
	cond_value[2] = Condition_Misc2hSword;
	visual = "ItMw_025_2h_Sword_old_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2h_Sld_Sword(ItMw_2H_Sword)
{
	name = "Грубый двуручный меч";
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Sld2hSchwert;
	range = Range_Sld2hSchwert;
	cond_value[2] = Condition_Sld2hSchwert;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2h_Pal_Sword(ItMw_2H_Sword)
{
	name = "Двуручный меч паладина";
	value = Value_PalZweihaender;
	damageTotal = Damage_PalZweihaender;
	range = Range_PalZweihaender;
	cond_value[2] = Condition_PalZweihaender;
	visual = "ItMw_040_2h_PAL_Sword_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2H_OrcSword_01(ItMw_2H_Sword)
{
	name = "Меч ящера";
	value = Value_Orkschwert;
	damageTotal = Damage_Orkschwert;
	range = Range_Orkschwert;
	cond_value[2] = Condition_Orkschwert;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2H_OrcSword_02(ItMw_2H_Sword)
{
	name = "Военный меч орков";
	value = Value_Orkschwert_01;
	damageTotal = Damage_Orkschwert_01;
	range = Range_Orkschwert_01;
	cond_value[2] = Condition_Orkschwert_01;
	visual = "ItMw_2H_OrcSword_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Zweihaender1(ItMw_2H_Sword)
{
	name = "Легкий двуручный меч";
	value = Value_Zweihaender1;
	damageTotal = Damage_Zweihaender1;
	range = Range_Zweihaender1;
	cond_value[2] = Condition_Zweihaender1;
	visual = "ItMw_032_2h_sword_light_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_2H_Special_01(ItMw_2H_Sword)
{
	name = NAME_ItMw_2H_Special_01;
	value = Value_Special_2H_1;
	damageTotal = Damage_Special_2H_1;
	range = Range_Special_2H_1;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	cond_value[2] = Condition_Special_2H_1;
	visual = "ItMw_050_2h_Sword_smith_02.3DS";
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_10;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Zweihaender2(ItMw_2H_Sword)
{
	name = "Двуручный меч";
	value = Value_Zweihaender2;
	damageTotal = Damage_Zweihaender2;
	range = Range_Zweihaender2;
	cond_value[2] = Condition_Zweihaender2;
	visual = "ItMw_055_2h_sword_light_05.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Zweihaender3(ItMw_2H_Sword)
{
	name = "Сила Рун";
	value = Value_Zweihaender3;
	damageTotal = Damage_Zweihaender3;
	range = Range_Zweihaender3;
	cond_value[2] = Condition_Zweihaender3;
	visual = "ItMw_060_2h_sword_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2H_Special_02(ItMw_2H_Sword)
{
	name = NAME_ItMw_2H_Special_02;
	value = Value_Special_2H_2;
	damageTotal = Damage_Special_2H_2;
	range = Range_Special_2H_2;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	cond_value[2] = Condition_Special_2H_2;
	visual = "ItMw_070_2h_Sword_smith_03.3DS";
	description = name;
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_10;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Zweihaender4(ItMw_2H_Sword)
{
	name = "Тяжелый двуручный меч";
	value = Value_Zweihaender4;
	damageTotal = Damage_Zweihaender4;
	range = Range_Zweihaender4;
	cond_value[2] = Condition_Zweihaender4;
	visual = "ItMw_068_2h_sword_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Krummschwert(ItMw_2H_Sword)
{
	name = "Абордажная сабля";
	value = Value_Scimitar;
	damageTotal = Damage_Scimitar;
	range = Range_Scimitar;
	cond_value[2] = Condition_Scimitar;
	visual = "ItMw_070_2h_sword_09.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Sturmbringer(ItMw_2H_Sword)
{
	name = "Несущий бурю";
	value = Value_Sturmbringer;
	damageTotal = Damage_Sturmbringer;
	range = Range_Sturmbringer;
	cond_value[2] = Condition_Sturmbringer;
	visual = "ItMw_075_2h_sword_heavy_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_2H_Special_03(ItMw_2H_Sword)
{
	name = NAME_ItMw_2H_Special_03;
	value = Value_Special_2H_3;
	damageTotal = Damage_Special_2H_3;
	range = Range_Special_2H_3;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	cond_value[2] = Condition_Special_2H_3;
	visual = "ItMw_090_2h_sword_smith_04.3DS";
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_10;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Drachenschneide(ItMw_2H_Sword)
{
	name = "Гроза драконов";
	value = Value_Drachenschneide;
	damageTotal = Damage_Drachenschneide;
	range = Range_Drachenschneide;
	cond_value[2] = Condition_Drachenschneide;
	visual = "itMw_080_2h_sword_heavy_04.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_2H_Special_04(ItMw_2H_Sword)
{
	name = NAME_ItMw_2H_Special_04;
	value = Value_Special_2H_4;
	damageTotal = Damage_Special_2H_4;
	range = Range_Special_2H_4;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	cond_value[2] = Condition_Special_2H_4;
	visual = "ItMw_110_2h_sword_smith_05.3DS";
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Waffenbonus_10;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_2H_Blessed_01(ItMw_2H_Sword)
{
	name = "Грубый рудный клинок";
	value = Value_Blessed_2H_1;
	damageTotal = Damage_Blessed_2H_1;
	range = Range_Blessed_2H_1;
	cond_value[2] = Condition_Blessed_2H_1;
	visual = "ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_2H_Blessed_02(ItMw_2H_Sword)
{
	name = "Меч ордена";
	value = Value_Blessed_2H_2;
	damageTotal = Damage_Blessed_2H_2;
	range = Range_Blessed_2H_2;
	cond_value[2] = Condition_Blessed_2H_2;
	visual = "ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2H_Blessed_03(ItMw_2H_Sword)
{
	name = "Святой палач";
	value = Value_Blessed_2H_3;
	damageTotal = Damage_Blessed_2H_3;
	range = Range_Blessed_2H_3;
	cond_value[2] = Condition_Blessed_2H_3;
	visual = "ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_DS_Sword_06(ItMw_2H_Sword)
{
	name = "Клинок";
	value = 150;
	damageTotal = 100;
	range = 155;
	cond_value[2] = 115;
	visual = "ItMw_DS_Sword_06.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
//*************************************************************
//Топор для ГГ(Оркская техника)
//*************************************************************

// 1 уровень

instance ItMw_DS_Orks_Weapon_For_GG(C_Item)
{
  name = "Легкий топор орков";
  mainflag = ITEM_KAT_NF;
  flags = ITEM_2HD_SWD;
  material = MAT_METAL;
	weight = 2;
  value = Value_Piratensaebel;
  damageTotal = Damage_Piratensaebel;
  damagetype = DAM_EDGE;
  range = Range_Piratensaebel;
  cond_atr[2] = ATR_STRENGTH;
  cond_value[2] = Condition_Piratensaebel;
  visual = "ItMw_DarkSaga_O2h_Maul_3.3DS";
  on_equip = S_Topor_ds_Orks_01;
  on_unequip = S_Topor_ds_Orks_02;
  description = name;
  text[2] = NAME_Damage;
  count[2] = damageTotal;
  text[3] = NAME_Str_needed;
  count[3] = cond_value[2];
  text[4] = NAME_OneHanded;
  text[5] = NAME_Value;
  count[5] = value;
};
