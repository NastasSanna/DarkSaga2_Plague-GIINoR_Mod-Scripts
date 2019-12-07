
instance ItMw_1H_Special_03(C_Item)
{
	name = NAME_ItMw_1H_Special_03;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Special_1H_3;
	damageTotal = Damage_Special_1H_3;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_3;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_3;
	visual = "ItMw_075_1h_sword_smith_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Special_04(C_Item)
{
	name = NAME_ItMw_1H_Special_04;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Special_1H_4;
	damageTotal = Damage_Special_1H_4;
	damagetype = DAM_EDGE;
	range = Range_Special_1H_4;
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Special_1H_4;
	visual = "ItMw_090_1h_sword_smith_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Blessed_01(C_Item)
{
	name = "Грубый рудный клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_1;
	damageTotal = Damage_Blessed_1H_1;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_1;
	visual = "itmw_030_1h_PAL_sword_bastard_RAW_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Blessed_02(C_Item)
{
	name = "Освященный рудный клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_2;
	damageTotal = Damage_Blessed_1H_2;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_2;
	visual = "ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Blessed_03(C_Item)
{
	name = "Гнев Инноса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = Value_Blessed_1H_3;
	damageTotal = Damage_Blessed_1H_3;
	damagetype = DAM_EDGE;
	range = Range_Blessed_1H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Blessed_1H_3;
	visual = "ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_SWORD(C_Item)
{
	name = "Клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_PalSchwert;
	damageTotal = Damage_PalSchwert;
	damagetype = DAM_EDGE;
	range = Range_PalSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_PalSchwert;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

//DarkSaga
//-----------------------------------------------------
//-----------------------------------------------------

instance ItMw_DS_Piratensaebel(C_Item)
{
  name = "Пиратская абордажная сабля";
  mainflag = ITEM_KAT_NF;
  flags = ITEM_SWD;
  material = MAT_METAL;
  value = Value_Piratensaebel;
  damageTotal = Damage_Piratensaebel;
  damagetype = DAM_EDGE;
  range = Range_Piratensaebel;
  cond_atr[2] = ATR_STRENGTH;
  cond_value[2] = Condition_Piratensaebel;
  visual = "ItMw_030_1h_sword_03.3DS";
  on_equip = S_Saebel_T_01;
  on_unequip = S_Saebel_T_02;
  description = name;
  text[2] = NAME_Damage;
  count[2] = damageTotal;
  text[3] = NAME_Str_needed;
  count[3] = cond_value[2];
  text[4] = NAME_OneHanded;
  text[5] = NAME_Value;
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

instance ItMw_1H_Mace_GobboShaman_01(C_Item)
{
	name = "Дубина гоблина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_Belegnagel;
	damageTotal = Damage_Belegnagel;
	damagetype = DAM_BLUNT;
	range = Range_Belegnagel;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Belegnagel;
	visual = "ItMw_DS_GobShamClub_1.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Hatuaxe(C_Item)
{
	name = "Топор Хату";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 50;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	on_equip = Equip_2H_05;
	on_unequip = UnEquip_2H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_ADDON_BONUS_2H;
	count[3] = Waffenbonus_05;
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
//*********Dark Saga кузнец******************************************************

// *********+++++++++++++++ОРКИ+++++++++++++++++++++++**********

//Подделка
instance ItMw_2H_RageOrcFake(C_Item)
{
	name = "Гнев орка";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	material = MAT_METAL;
	value = 900;
	damageTotal = 78;
	damagetype = DAM_EDGE;
	range = 70;
	//on_equip = Equip_2H_05;
	//on_unequip = UnEquip_2H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	scemeName = "ROMSEALED";
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItMw_2H_RageOrcMax(C_Item)
{
	name = "Гнев орка";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 900;
	damageTotal = 400;
	damagetype = DAM_EDGE;
	range = 100;
	on_equip = Equip_2H_05;
	on_unequip = UnEquip_2H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

// урон магией +++++++++++++++++++   +20

instance ItMw_Tars_Axe(C_Item)
{
	name = "Топор военноначальника орков";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 50;
	damageTotal = 105;
	damagetype = DAM_EDGE;
	range = 140;
	on_equip = Equip_2H_05;
	on_unequip = UnEquip_2H_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[1] = "Принадлежал Тарсу";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

// Посох поглощения

instance ItMW_DrainStaff(C_Item)
{
	name = "Посох поглощения";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab02;
	damageTotal = Damage_Stab02;
	damagetype = DAM_BLUNT;
	range = Range_Stab02;
	visual = "ItMW_MageStaff_Good_2H_02.3DS";
	effect = "SPELLFX_MAGESTAFF2";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[3] = "Нужно зарядить магической энергией";
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
}; 

instance ItMW_DrainStaffCharged(C_Item)
{
	name = "Посох поглощения";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_Stab02;
	damageTotal = Damage_Stab02;
	damagetype = DAM_BLUNT;
	range = Range_Stab02;
	visual = "ItMW_MageStaff_Good_2H_02.3DS";
	effect = "SPELLFX_MAGESTAFF2";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[3] = "Посох наполнен магической энергией";
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
}; 

//Лапа Каракуса

instance ItMw_DS_MW_Karakus(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_STONE;
	value = Value_Piratensaebel;
	damageTotal = Damage_Piratensaebel;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Piratensaebel;
	visual = "ItMw_DS_MW_Karakus.zen";//"ItMw_DarkSaga_MWeapon _1.3DS";
};

// Клинок Мартина

instance ItMw_Weapon_Ds_Martin(C_Item)
{
	name = "Меч Мартина";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_Schwert3;
	damageTotal = Damage_Ds_Martin_Sword;
	damagetype = DAM_EDGE;
	range = Range_PalSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Ds_Martin_Sword;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	on_equip = Equip_Martin_Ds_Sword;
	on_unequip = UnEquip_Martin_Ds_Sword;
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_ADDON_BONUS_1H;
	count[3] = 5;
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
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

/*
//2 уровень

instance ItMw_DS_Orks_Weapon_For_GG_02(C_Item)
{
  name = "Топор орков";
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
  visual = "ItMw_DS_OrcAxe_01.3DS";
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
*/
//******************************************************
//******************************************************

//Клинок по квесту Шарда

instance ItMW_sword_WatcherSH(C_Item)
{
	name = "Клинок надзирателя";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItMw_012_1h_Sword_short_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
};

//Клинок, который дают за выигрыш на Арене

instance ITMW_PRADSWORD(C_Item)
{
	name = "Клинок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 120;
	damageTotal = Damage_Ds_Prad_Sword;
	damagetype = DAM_EDGE;
	range = Range_VLKDolch;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Ds_Prad_Sword;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_ORCPRESTIGE(C_Item)
{
	name = "Улу-Мулу";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = 500;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_2h_OrcPrestige.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
//	text[3] = NAME_RADIUS;
//	count[3] = range;
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
};  

instance ItMw_VaksAxe(C_Item)
{
	name = "Топор Вака";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 250;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 350;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};
