
instance ItMw_1h_Vlk_Dagger_BET(ItMw_1H_Sword)
{
	name = "Кинжал";
	value = Value_VLKDolch;
	damageTotal = 5+ Damage_VLKDolch;
	range = Range_VLKDolch;
	cond_value[2] = Condition_VLKDolch;
	visual = "Itmw_005_1h_dagger_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_ShortSword1_BET(ItMw_1H_Sword)
{
	name = "Короткий меч";
	value = Value_ShortSword1;
	damageTotal = 5+ Damage_ShortSword1;
	range = Range_ShortSword1;
	cond_value[2] = Condition_ShortSword1;
	visual = "ItMw_010_1h_Sword_short_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_1H_Sword_L_03_BET(ItMw_1H_Sword)
{
	name = "Волчий нож";
	value = Value_Wolfsklinge;
	damageTotal = 5+ Damage_Wolfsklinge;
	range = Range_Wolfsklinge;
	cond_value[2] = Condition_Wolfsklinge;
	visual = "ItMw_012_1h_Knife_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_ShortSword2_BET(ItMw_1H_Sword)
{
	name = "Грубый короткий меч";
	value = Value_ShortSword2;
	damageTotal = 5+ Damage_ShortSword2;
	range = Range_ShortSword2;
	cond_value[2] = Condition_ShortSword2;
	visual = "ItMw_012_1h_Sword_short_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Sense_BET(ItMw_1H_Sword)
{
	name = "Малая коса";
	value = Value_Sense;
	damageTotal = 5+ Damage_Sense;
	range = Range_Sense;
	cond_value[2] = Condition_Sense;
	visual = "ItMw_012_1h_Scythe_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_1h_Vlk_Sword_BET(ItMw_1H_Sword)
{
	name = "Шпага";
	value = Value_VLKSchwert;
	damageTotal = 5+ Damage_VLKSchwert;
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
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[5] = value;
nutrition = 100;};
instance ItMw_1h_Shpaga_BET(ItMw_1H_Sword)
{
	name = "Шпага";
	//flags = flags | ITEM_NSPLIT;
	value = Value_VLKSchwert;
	damageTotal = 5+ Damage_VLKSchwert;
	range = Range_VLKSchwert;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = ConcatStrings(name," (заточено)");
	//on_equip = eq_Shpaga;
	//on_unequip = uneq_Shpaga;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
/*
func void eq_Shpaga()
{
	CreateInvItem(self,ItMw_1h_Shpaga);
	Npc_RemoveInvItem(self,ItMw_1h_Shpaga);
	item.name = "Шпага_Новая";
nutrition = 100;};
func void uneq_Shpaga()
{
	
nutrition = 100;};
*/
instance ItMw_1h_MISC_Sword_BET(ItMw_1H_Sword)
{
	name = "Ржавый меч";
	value = Value_MiscSword;
	damageTotal = 5+ Damage_MiscSword;
	range = Range_MiscSword;
	cond_value[2] = Condition_MiscSword;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
instance ItMw_1h_Mil_Sword_BET(ItMw_1H_Sword)
{
	name = "Грубый палаш";
	value = Value_MilSchwert;
	damageTotal = 5+ Damage_MilSchwert;
	range = Range_MilSchwert;
	cond_value[2] = Condition_MilSchwert;
	visual = "Itmw_025_1h_Mil_Sword_broad_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_1h_Pal_Sword_BET(ItMw_1H_Sword)
{
	name = "Меч паладина";
	value = Value_PalSchwert;
	damageTotal = 5+ Damage_PalSchwert;
	range = Range_PalSchwert;
	cond_value[2] = Condition_PalSchwert;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_ShortSword3_BET(ItMw_1H_Sword)
{
	name = "Короткий меч";
	value = Value_ShortSword3;
	damageTotal = 5+ Damage_ShortSword3;
	range = Range_ShortSword3;
	cond_value[2] = Condition_ShortSword3;
	visual = "ItMw_016_1h_Sword_short_03.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_ShortSword4_BET(ItMw_1H_Sword)
{
	name = "Волчий зуб";
	value = Value_ShortSword4;
	damageTotal = 5+ Damage_ShortSword4;
	range = Range_ShortSword4;
	cond_value[2] = Condition_ShortSword4;
	visual = "ItMw_020_1h_Sword_short_04.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_ShortSword5_BET(ItMw_1H_Sword)
{
	name = "Изысканный короткий меч";
	value = Value_ShortSword5;
	damageTotal = 5+ Damage_ShortSword5;
	range = Range_ShortSword5;
	cond_value[2] = Condition_ShortSword5;
	visual = "ItMw_025_1h_Sword_short_05.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Piratensaebel_BET(ItMw_1H_Sword)
{
	name = "Пиратская абордажная сабля";
	value = Value_Piratensaebel;
	damageTotal = 5+ Damage_Piratensaebel;
	range = Range_Piratensaebel;
	cond_value[2] = Condition_Piratensaebel;
	visual = "ItMw_030_1h_sword_03.3DS";
	description = ConcatStrings(name," (заточено)");
	on_equip = S_Saebel_T_01;
  on_unequip = S_Saebel_T_02;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Schwert_BET(ItMw_1H_Sword)
{
	name = "Грубый длинный меч";
	value = Value_Schwert;
	damageTotal = 5+ Damage_Schwert;
	range = Range_Schwert;
	cond_value[2] = Condition_Schwert;
	visual = "ItMw_030_1h_sword_long_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_1H_Common_01_BET(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Common_01;
	value = Value_Common1;
	damageTotal = 5+ Damage_Common1;
	range = Range_Common1;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_value[2] = Condition_Common1;
	visual = "ItMw_030_1h_Common_Sword_01.3DS";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Schwert1_BET(ItMw_1H_Sword)
{
	name = "Изысканный меч";
	value = Value_Schwert1;
	damageTotal = 5+ Damage_Schwert1;
	range = Range_Schwert1;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_value[2] = Condition_Schwert1;
	visual = "ItMw_035_1h_Sword_04.3DS";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Schwert2_BET(ItMw_1H_Sword)
{
	name = "Длинный меч";
	value = Value_Schwert2;
	damageTotal = 5+ Damage_Schwert2;
	range = Range_Schwert2;
	cond_value[2] = Condition_Schwert2;
	visual = "ItMw_037_1h_sword_long_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Schwert3_BET(ItMw_1H_Sword)
{
	name = "Грубый полуторный меч";
	value = Value_Schwert3;
	damageTotal = 5+ Damage_Schwert3;
	range = Range_Schwert3;
	cond_value[2] = Condition_Schwert3;
	visual = "ItMw_045_1h_Sword_Bastard_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Schwert4_BET(ItMw_1H_Sword)
{
	name = "Изысканный длинный меч";
	value = Value_Schwert4;
	damageTotal = 5+ Damage_Schwert4;
	range = Range_Schwert4;
	on_equip = Equip_1H_05;
	on_unequip = UnEquip_1H_05;
	cond_value[2] = Condition_Schwert4;
	visual = "ItMw_045_1h_Sword_long_04.3DS";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_05;
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
instance ItMw_1H_Special_01_BET(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Special_01;
	value = Value_Special_1H_1;
	damageTotal = 5+ Damage_Special_1H_1;
	range = Range_Special_1H_1;
	on_equip = Equip_1H_07;
	on_unequip = UnEquip_1H_07;
	cond_value[2] = Condition_Special_1H_1;
	visual = "ItMw_045_1h_Sword_smith_02.3DS";
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_07;
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
instance ItMw_Rapier_BET(ItMw_1H_Sword)
{
	name = "Рапира";
	value = Value_Rapier;
	damageTotal = 5+ Damage_Rapier;
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
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;	
	count[5] = value;
nutrition = 100;};

instance ItMw_Rubinklinge_BET(ItMw_1H_Sword)
{
	name = "Рубиновый клинок";
	value = Value_Rubinklinge;
	damageTotal = 5+ Damage_Rubinklinge;
	range = Range_Rubinklinge;
	on_equip = Equip_1H_06;
	on_unequip = UnEquip_1H_06;
	cond_value[2] = Condition_Rubinklinge;
	visual = "ItMw_050_1h_sword_05.3DS";
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_06;
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Runenschwert_BET(ItMw_1H_Sword)
{
	name = "Рунный меч";
	value = Value_Runenschwert;
	damageTotal = 5+ Damage_Runenschwert;
	range = Range_Runenschwert;
	cond_value[2] = Condition_Runenschwert;
	visual = "ItMw_055_1h_sword_long_05.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Schwert5_BET(ItMw_1H_Sword)
{
	name = "Изысканный полуторный меч";
	value = Value_Schwert5;
	damageTotal = 5+ Damage_Schwert5;
	range = Range_Schwert5;
	cond_value[2] = Condition_Schwert5;
	visual = "ItMw_058_1h_Sword_Bastard_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_1H_Special_02_BET(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Special_02;
	value = Value_Special_1H_2;
	damageTotal = 5+ Damage_Special_1H_2;
	range = Range_Special_1H_2;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_value[2] = Condition_Special_1H_2;
	visual = "ItMw_060_1h_Sword_smith_03.3DS";
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_10;
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_Meisterdegen_BET(ItMw_1H_Sword)
{
	name = "Шпага мастера";
	value = Value_Meisterdegen;
	damageTotal = 5+ Damage_Meisterdegen;
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
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[5] = value;
nutrition = 100;};

instance ItMw_Orkschlaechter_BET(ItMw_1H_Sword)
{
	name = "Убийца орков";
	value = Value_Orkschlaechter;
	damageTotal = 5+ Damage_Orkschlaechter;
	range = Range_Orkschlaechter;
	cond_value[2] = Condition_Orkschlaechter;
	visual = "ItMw_065_1h_sword_bastard_04.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ITMW_DS_HUNTERSWORD_01_BET(ItMw_1H_Sword)
{
	name = "Охотничий меч";
	value = Value_Schwert5;
	damageTotal = 5+ Damage_Schwert5;
	range = Range_Schwert5;
	cond_value[2] = Condition_Schwert5;
	visual = "ItMw_058_1h_Sword_Bastard_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
//-
//----Мечи, смоделированные Денисом.---- ItMw_DS_Sword_0*.3ds//
//-
instance ItMw_DS_Sword_01_BET(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 5+ 60;
	range = 65;
	cond_value[2] = 60;
	visual = "ItMw_DS_Sword_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
instance ItMw_DS_Sword_02_BET(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 5+ 65;
	range = 75;
	cond_value[2] = 65;
	visual = "ItMw_DS_Sword_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
instance ItMw_DS_Sword_03_BET(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 5+ 65;
	range = 75;
	cond_value[2] = 65;
	visual = "ItMw_DS_Sword_03.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
instance ItMw_DS_Sword_05_BET(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 5+ 65;
	range = 90;
	cond_value[2] = 65;
	visual = "ItMw_DS_Sword_05.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
//Ледяной клинок
instance ItMw_DS_IceKlinge_BET(ItMw_1H_Sword)
{
	name = "Ледяной осколок";
	value = Value_Rubinklinge;
	damageTotal = 5+ Damage_Rubinklinge;
	range = Range_Rubinklinge;
	on_equip = Equip_1H_06;
	on_unequip = UnEquip_1H_06;
	cond_value[2] = Condition_Rubinklinge;
	visual = "ItMw_050_1h_sword_05.3DS";
	text[1] = "От этого клинка веет холодом.";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_06;
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

//Оригинальные файлы игры

instance ItMw_1H_Special_03_BET(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Special_03;
	value = Value_Special_1H_3;
	damageTotal = 5+ Damage_Special_1H_3;
	range = Range_Special_1H_3;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_value[2] = Condition_Special_1H_3;
	visual = "ItMw_075_1h_sword_smith_04.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_10;
	count[5] = value;
nutrition = 100;};

instance ItMw_1H_Special_04_BET(ItMw_1H_Sword)
{
	name = NAME_ItMw_1H_Special_04;
	value = Value_Special_1H_4;
	damageTotal = 5+ Damage_Special_1H_4;
	range = Range_Special_1H_4;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_value[2] = Condition_Special_1H_4;
	visual = "ItMw_090_1h_sword_smith_05.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = Waffenbonus_10;
	count[5] = value;
nutrition = 100;};

instance ItMw_1H_Blessed_01_BET(ItMw_1H_Sword)
{
	name = "Грубый рудный клинок";
	flags = flags | ITEM_MISSION;
	value = Value_Blessed_1H_1;
	damageTotal = 5+ Damage_Blessed_1H_1;
	range = Range_Blessed_1H_1;
	cond_value[2] = Condition_Blessed_1H_1;
	visual = "itmw_030_1h_PAL_sword_bastard_RAW_01.3ds";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_1H_Blessed_02_BET(ItMw_1H_Sword)
{
	name = "Освященный рудный клинок";
	flags = flags | ITEM_MISSION;
	value = Value_Blessed_1H_2;
	damageTotal = 5+ Damage_Blessed_1H_2;
	range = Range_Blessed_1H_2;
	cond_value[2] = Condition_Blessed_1H_2;
	visual = "ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ItMw_1H_Blessed_03_BET(ItMw_1H_Sword)
{
	name = "Гнев Инноса";
	flags = flags | ITEM_MISSION;
	value = Value_Blessed_1H_3;
	damageTotal = 5+ Damage_Blessed_1H_3;
	range = Range_Blessed_1H_3;
	cond_value[2] = Condition_Blessed_1H_3;
	visual = "ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

instance ITMW_SWORD_BET(ItMw_1H_Sword)
{
	name = "Клинок";
	value = Value_PalSchwert;
	damageTotal = 5+ Damage_PalSchwert;
	range = Range_PalSchwert;
	cond_value[2] = Condition_PalSchwert;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};

//DarkSaga
//-----------------------------------------------------
//-----------------------------------------------------

instance ItMw_DS_Piratensaebel_BET(ItMw_1H_Sword)
{
  name = "Пиратская абордажная сабля";
  value = Value_Piratensaebel;
  damageTotal = 5+ Damage_Piratensaebel;
  range = Range_Piratensaebel;
  cond_value[2] = Condition_Piratensaebel;
  visual = "ItMw_030_1h_sword_03.3DS";
  on_equip = S_Saebel_T_01;
  on_unequip = S_Saebel_T_02;
  description = ConcatStrings(name," (заточено)");
  count[2] = damageTotal;
  count[3] = cond_value[2];
  count[5] = value;
nutrition = 100;};

// Клинок Мартина

instance ItMw_Weapon_Ds_Martin_BET(ItMw_1H_Sword)
{
	name = "Меч Мартина";
	value = Value_Schwert3;
	damageTotal = 5+ Damage_Ds_Martin_Sword;
	range = Range_PalSchwert;
	cond_value[2] = Condition_Ds_Martin_Sword;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	on_equip = Equip_Martin_Ds_Sword;
	on_unequip = UnEquip_Martin_Ds_Sword;
	description = ConcatStrings(name," (заточено)");
	text[1] = NAME_ADDON_BONUS_1H;
	count[1] = 5;
	count[2] = damageTotal;
	count[3] = cond_value[2];	
	count[5] = value;
nutrition = 100;};

//Клинок по квесту Шарда

instance ItMW_sword_WatcherSH_BET(ItMw_1H_Sword)
{
	name = "Клинок надзирателя";
	flags = flags | ITEM_MISSION;
	damageTotal = 5+ 25;
	range = 60;
	cond_value[2] = 15;
	visual = "ItMw_012_1h_Sword_short_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
nutrition = 100;};

//Клинок, который дают за выигрыш на Арене

instance ITMW_PRADSWORD_BET(ItMw_1H_Sword)
{
	name = "Клинок";
	flags = flags | ITEM_MISSION;
	value = 120;
	damageTotal = 5+ Damage_Ds_Prad_Sword;
	range = Range_VLKDolch;
	cond_value[2] = Condition_Ds_Prad_Sword;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = ConcatStrings(name," (заточено)");
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
nutrition = 100;};
