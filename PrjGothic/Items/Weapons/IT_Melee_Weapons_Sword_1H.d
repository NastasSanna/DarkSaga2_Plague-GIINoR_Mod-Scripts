
instance ItMw_1h_Vlk_Dagger(ItMw_1H_Sword)
{
	name = "Кинжал";
	value = Value_VLKDolch;
	damageTotal = Damage_VLKDolch;
	range = Range_VLKDolch;
	cond_value[2] = Condition_VLKDolch;
	visual = "Itmw_005_1h_dagger_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_ShortSword1(ItMw_1H_Sword)
{
	name = "Короткий меч";
	value = Value_ShortSword1;
	damageTotal = Damage_ShortSword1;
	range = Range_ShortSword1;
	cond_value[2] = Condition_ShortSword1;
	visual = "ItMw_010_1h_Sword_short_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1H_Sword_L_03(ItMw_1H_Sword)
{
	name = "Волчий нож";
	value = Value_Wolfsklinge;
	damageTotal = Damage_Wolfsklinge;
	range = Range_Wolfsklinge;
	cond_value[2] = Condition_Wolfsklinge;
	visual = "ItMw_012_1h_Knife_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_ShortSword2(ItMw_1H_Sword)
{
	name = "Грубый короткий меч";
	value = Value_ShortSword2;
	damageTotal = Damage_ShortSword2;
	range = Range_ShortSword2;
	cond_value[2] = Condition_ShortSword2;
	visual = "ItMw_012_1h_Sword_short_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Sense(ItMw_1H_Sword)
{
	name = "Малая коса";
	value = Value_Sense;
	damageTotal = Damage_Sense;
	range = Range_Sense;
	cond_value[2] = Condition_Sense;
	visual = "ItMw_012_1h_Scythe_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1h_Vlk_Sword(ItMw_1H_Sword)
{
	name = "Шпага";
	value = Value_VLKSchwert;
	damageTotal = Damage_VLKSchwert;
	range = Range_VLKSchwert;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_VLKSchwert;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	description = name;
	count[2] = damageTotal;
	count[5] = value;
};
instance ItMw_1h_Shpaga(ItMw_1H_Sword)
{
	name = "Шпага";
	//flags = flags | ITEM_NSPLIT;
	value = Value_VLKSchwert;
	damageTotal = Damage_VLKSchwert;
	range = Range_VLKSchwert;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	//on_equip = eq_Shpaga;
	//on_unequip = uneq_Shpaga;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
/*
func void eq_Shpaga()
{
	CreateInvItem(self,ItMw_1h_Shpaga);
	Npc_RemoveInvItem(self,ItMw_1h_Shpaga);
	item.name = "Шпага_Новая";
};
func void uneq_Shpaga()
{
	
};
*/
instance ItMw_1h_MISC_Sword(ItMw_1H_Sword)
{
	name = "Ржавый меч";
	value = Value_MiscSword;
	damageTotal = Damage_MiscSword;
	range = Range_MiscSword;
	cond_value[2] = Condition_MiscSword;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_1h_Mil_Sword(ItMw_1H_Sword)
{
	name = "Грубый палаш";
	value = Value_MilSchwert;
	damageTotal = Damage_MilSchwert;
	range = Range_MilSchwert;
	cond_value[2] = Condition_MilSchwert;
	visual = "Itmw_025_1h_Mil_Sword_broad_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1h_Pal_Sword(ItMw_1H_Sword)
{
	name = "Меч паладина";
	value = Value_PalSchwert;
	damageTotal = Damage_PalSchwert;
	range = Range_PalSchwert;
	cond_value[2] = Condition_PalSchwert;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_ShortSword3(ItMw_1H_Sword)
{
	name = "Короткий меч";
	value = Value_ShortSword3;
	damageTotal = Damage_ShortSword3;
	range = Range_ShortSword3;
	cond_value[2] = Condition_ShortSword3;
	visual = "ItMw_016_1h_Sword_short_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_ShortSword4(ItMw_1H_Sword)
{
	name = "Волчий зуб";
	value = Value_ShortSword4;
	damageTotal = Damage_ShortSword4;
	range = Range_ShortSword4;
	cond_value[2] = Condition_ShortSword4;
	visual = "ItMw_020_1h_Sword_short_04.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_ShortSword5(ItMw_1H_Sword)
{
	name = "Изысканный короткий меч";
	value = Value_ShortSword5;
	damageTotal = Damage_ShortSword5;
	range = Range_ShortSword5;
	cond_value[2] = Condition_ShortSword5;
	visual = "ItMw_025_1h_Sword_short_05.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Piratensaebel(ItMw_1H_Sword)
{
	name = "Пиратская абордажная сабля";
	value = Value_Piratensaebel;
	damageTotal = Damage_Piratensaebel;
	range = Range_Piratensaebel;
	cond_value[2] = Condition_Piratensaebel;
	visual = "ItMw_030_1h_sword_03.3DS";
	description = name;
	on_equip = S_Saebel_T_01;
  on_unequip = S_Saebel_T_02;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Schwert(ItMw_1H_Sword)
{
	name = "Грубый длинный меч";
	value = Value_Schwert;
	damageTotal = Damage_Schwert;
	range = Range_Schwert;
	cond_value[2] = Condition_Schwert;
	visual = "ItMw_030_1h_sword_long_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1H_Common_01(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Common_01;
	value = Value_Common1;
	damageTotal = Damage_Common1;
	range = Range_Common1;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_value[2] = Condition_Common1;
	visual = "ItMw_030_1h_Common_Sword_01.3DS";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Schwert1(ItMw_1H_Sword)
{
	name = "Изысканный меч";
	value = Value_Schwert1;
	damageTotal = Damage_Schwert1;
	range = Range_Schwert1;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_value[2] = Condition_Schwert1;
	visual = "ItMw_035_1h_Sword_04.3DS";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Schwert2(ItMw_1H_Sword)
{
	name = "Длинный меч";
	value = Value_Schwert2;
	damageTotal = Damage_Schwert2;
	range = Range_Schwert2;
	cond_value[2] = Condition_Schwert2;
	visual = "ItMw_037_1h_sword_long_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Schwert3(ItMw_1H_Sword)
{
	name = "Грубый полуторный меч";
	value = Value_Schwert3;
	damageTotal = Damage_Schwert3;
	range = Range_Schwert3;
	cond_value[2] = Condition_Schwert3;
	visual = "ItMw_045_1h_Sword_Bastard_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Schwert4(ItMw_1H_Sword)
{
	name = "Изысканный длинный меч";
	value = Value_Schwert4;
	damageTotal = Damage_Schwert4;
	range = Range_Schwert4;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_value[2] = Condition_Schwert4;
	visual = "ItMw_045_1h_Sword_long_04.3DS";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_1H_Special_01(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Special_01;
	value = Value_Special_1H_1;
	damageTotal = Damage_Special_1H_1;
	range = Range_Special_1H_1;
	on_equip = Equip_1H_07;
	on_unequip = UnEquip_1H_07;
	cond_value[2] = Condition_Special_1H_1;
	visual = "ItMw_045_1h_Sword_smith_02.3DS";
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_07;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Rapier(ItMw_1H_Sword)
{
	name = "Рапира";
	value = Value_Rapier;
	damageTotal = Damage_Rapier;
	range = Range_Rapier;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Rapier;
	visual = "ItMw_050_1h_Sword_Rapier_01.3ds";
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_08;
	description = name;
	count[2] = damageTotal;	
	count[5] = value;
};

instance ItMw_Rubinklinge(ItMw_1H_Sword)
{
	name = "Рубиновый клинок";
	value = Value_Rubinklinge;
	damageTotal = Damage_Rubinklinge;
	range = Range_Rubinklinge;
	on_equip = Equip_1H_06;
	on_unequip = UnEquip_1H_06;
	cond_value[2] = Condition_Rubinklinge;
	visual = "ItMw_050_1h_sword_05.3DS";
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_06;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Runenschwert(ItMw_1H_Sword)
{
	name = "Рунный меч";
	value = Value_Runenschwert;
	damageTotal = Damage_Runenschwert;
	range = Range_Runenschwert;
	cond_value[2] = Condition_Runenschwert;
	visual = "ItMw_055_1h_sword_long_05.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Schwert5(ItMw_1H_Sword)
{
	name = "Изысканный полуторный меч";
	value = Value_Schwert5;
	damageTotal = Damage_Schwert5;
	range = Range_Schwert5;
	cond_value[2] = Condition_Schwert5;
	visual = "ItMw_058_1h_Sword_Bastard_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1H_Special_02(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Special_02;
	value = Value_Special_1H_2;
	damageTotal = Damage_Special_1H_2;
	range = Range_Special_1H_2;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_value[2] = Condition_Special_1H_2;
	visual = "ItMw_060_1h_Sword_smith_03.3DS";
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_10;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Meisterdegen(ItMw_1H_Sword)
{
	name = "Шпага мастера";
	value = Value_Meisterdegen;
	damageTotal = Damage_Meisterdegen;
	range = Range_Meisterdegen;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Meisterdegen;
	visual = "ItMw_065_1h_SwordCane_02.3ds";
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_10;
	description = name;
	count[2] = damageTotal;
	count[5] = value;
};

instance ItMw_Orkschlaechter(ItMw_1H_Sword)
{
	name = "Убийца орков";
	value = Value_Orkschlaechter;
	damageTotal = Damage_Orkschlaechter;
	range = Range_Orkschlaechter;
	cond_value[2] = Condition_Orkschlaechter;
	visual = "ItMw_065_1h_sword_bastard_04.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ITMW_DS_HUNTERSWORD_01(ItMw_1H_Sword)
{
	name = "Охотничий меч";
	value = Value_Schwert5;
	damageTotal = Damage_Schwert5;
	range = Range_Schwert5;
	cond_value[2] = Condition_Schwert5;
	visual = "ItMw_058_1h_Sword_Bastard_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
//-
//----Мечи, смоделированные Денисом.---- ItMw_DS_Sword_0*.3ds//
//-
instance ItMw_DS_Sword_01(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 60;
	range = 65;
	cond_value[2] = 60;
	visual = "ItMw_DS_Sword_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_DS_Sword_02(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 65;
	range = 75;
	cond_value[2] = 65;
	visual = "ItMw_DS_Sword_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_DS_Sword_03(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 65;
	range = 75;
	cond_value[2] = 65;
	visual = "ItMw_DS_Sword_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_DS_Sword_05(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 65;
	range = 90;
	cond_value[2] = 65;
	visual = "ItMw_DS_Sword_05.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
//Ледяной клинок
instance ItMw_DS_IceKlinge(ItMw_1H_Sword)
{
	name = "Ледяной осколок";
	value = Value_Rubinklinge;
	damageTotal = Damage_Rubinklinge;
	range = Range_Rubinklinge;
	on_equip = Equip_1H_06;
	on_unequip = UnEquip_1H_06;
	cond_value[2] = Condition_Rubinklinge;
	visual = "ItMw_050_1h_sword_05.3DS";
	text[1] = "От этого клинка веет холодом.";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_06;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

//Оригинальные файлы игры

instance ItMw_1H_Special_03(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Special_03;
	value = Value_Special_1H_3;
	damageTotal = Damage_Special_1H_3;
	range = Range_Special_1H_3;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_value[2] = Condition_Special_1H_3;
	visual = "ItMw_075_1h_sword_smith_04.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_10;
	count[5] = value;
};

instance ItMw_1H_Special_04(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Special_04;
	value = Value_Special_1H_4;
	damageTotal = Damage_Special_1H_4;
	range = Range_Special_1H_4;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_value[2] = Condition_Special_1H_4;
	visual = "ItMw_090_1h_sword_smith_05.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_10;
	count[5] = value;
};

instance ItMw_1H_Blessed_01(ItMw_1H_Sword)
{
	name = "Грубый рудный клинок";
	flags = flags | ITEM_MISSION;
	value = Value_Blessed_1H_1;
	damageTotal = Damage_Blessed_1H_1;
	range = Range_Blessed_1H_1;
	cond_value[2] = Condition_Blessed_1H_1;
	visual = "itmw_030_1h_PAL_sword_bastard_RAW_01.3ds";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1H_Blessed_02(ItMw_1H_Sword)
{
	name = "Освященный рудный клинок";
	flags = flags | ITEM_MISSION;
	value = Value_Blessed_1H_2;
	damageTotal = Damage_Blessed_1H_2;
	range = Range_Blessed_1H_2;
	cond_value[2] = Condition_Blessed_1H_2;
	visual = "ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1H_Blessed_03(ItMw_1H_Sword)
{
	name = "Гнев Инноса";
	flags = flags | ITEM_MISSION;
	value = Value_Blessed_1H_3;
	damageTotal = Damage_Blessed_1H_3;
	range = Range_Blessed_1H_3;
	cond_value[2] = Condition_Blessed_1H_3;
	visual = "ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ITMW_SWORD(ItMw_1H_Sword)
{
	name = "Клинок";
	value = Value_PalSchwert;
	damageTotal = Damage_PalSchwert;
	range = Range_PalSchwert;
	cond_value[2] = Condition_PalSchwert;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

//DarkSaga
//-----------------------------------------------------
//-----------------------------------------------------

instance ItMw_DS_Piratensaebel(ItMw_1H_Sword)
{
  name = "Пиратская абордажная сабля";
  value = Value_Piratensaebel;
  damageTotal = Damage_Piratensaebel;
  range = Range_Piratensaebel;
  cond_value[2] = Condition_Piratensaebel;
  visual = "ItMw_030_1h_sword_03.3DS";
  on_equip = S_Saebel_T_01;
  on_unequip = S_Saebel_T_02;
  description = name;
  count[2] = damageTotal;
  count[3] = cond_value[2];
  count[5] = value;
};
func void S_Saebel_T_01()
{
  Mdl_ApplyOverlayMds(self,"Hum_PirSab2.mds");
};
func void S_Saebel_T_02()
{
  Mdl_RemoveOverlayMds(self,"Hum_PirSab2.mds");
};

// Клинок Мартина

instance ItMw_Weapon_Ds_Martin(ItMw_1H_Sword)
{
	name = "Меч Мартина";
	value = Value_Schwert3;
	damageTotal = Damage_Ds_Martin_Sword;
	range = Range_PalSchwert;
	cond_value[2] = Condition_Ds_Martin_Sword;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	on_equip = Equip_Martin_Ds_Sword;
	on_unequip = UnEquip_Martin_Ds_Sword;
	description = name;
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = 5;
	count[2] = damageTotal;
	count[3] = cond_value[2];	
	count[5] = value;
};

func void Equip_Martin_Ds_Sword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
};

func void UnEquip_Martin_Ds_Sword()
{
	B_AddFightSkill(self,NPC_TALENT_1H,-5);
};
//Клинок по квесту Шарда

instance ItMW_sword_WatcherSH(ItMw_1H_Sword)
{
	name = "Клинок надзирателя";
	flags = flags | ITEM_MISSION;
	damageTotal = 25;
	range = 60;
	cond_value[2] = 15;
	visual = "ItMw_012_1h_Sword_short_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
};

//Клинок, который дают за выигрыш на Арене

instance ITMW_PRADSWORD(ItMw_1H_Sword)
{
	name = "Клинок";
	flags = flags | ITEM_MISSION;
	value = 120;
	damageTotal = Damage_Ds_Prad_Sword;
	range = Range_VLKDolch;
	cond_value[2] = Condition_Ds_Prad_Sword;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
