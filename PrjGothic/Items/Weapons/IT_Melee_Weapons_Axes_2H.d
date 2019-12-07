
instance ItMw_1h_Nov_Mace(ItMw_2H_Axe)
{
	name = "Боевой посох";
	material = MAT_WOOD;
	value = Value_NovMace;
	damageTotal = Damage_NovMace;
	damagetype = DAM_BLUNT;
	range = Range_NovMace;
	cond_value[2] = Condition_NovMace;
	description = name;
	visual = "ItMw_020_2h_Nov_Staff_01.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2h_Bau_Axe(ItMw_2H_Axe)
{
	name = "Топор дровосека";
	material = MAT_WOOD;
	flags = ITEM_2HD_AXE | ITEM_NSPLIT;
	value = 0;
	damageTotal = Damage_Bau2hAxt;
	range = Range_Bau2hAxt;
	cond_value[2] = Condition_Bau2hAxt;
	description = name;
	visual = "ItMw_020_2h_Axe_Lumberjack_01.3ds";
	text[1] = "Этот топор подходит для рубки деревьев";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2H_Axe_L_01(ItMw_2H_Axe)
{
	name = "Кирка";
	material = MAT_METAL;
	flags = ITEM_2HD_AXE | ITEM_NSPLIT;
	value = 0;
	damageTotal = 10;
	range = Range_Spitzhacke;
	cond_value[2] = Condition_Spitzhacke;
	description = name;
	visual = "ItMw_020_2h_Pickaxe_01.3DS";
	on_equip = Equip_Kirka;
	on_unequip = Unequip_Kirka;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_2H_Axe_L_02(C_ITEM)
{
	name = "Кирка";
	mainflag = ITEM_KAT_NONE;
	material = MAT_METAL;
	flags = 0;
	value = 0;
	damageTotal = 0;
	description = name;
	visual = "ItMw_020_2h_Pickaxe_01.3DS";
};
func void Equip_Kirka()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_ApplyOverlayMds(self,"Hum_PickOre.mds");
	};
};
func void UnEquip_Kirka()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_RemoveOverlayMds(self,"Hum_PickOre.mds");
	};
};

instance ItMw_1h_Misc_Axe(ItMw_2H_Axe)
{
	name = "Ржавый топор";
	material = MAT_METAL;
	value = Value_MiscAxe;
	damageTotal = Damage_MiscAxe;
	range = Range_MiscAxe;
	cond_value[2] = Condition_MiscAxe;
	description = name;
	visual = "ItMw_025_2h_Misc_Axe_old_01.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_2h_Sld_Axe(ItMw_2H_Axe)
{
	name = "Грубый боевой топор";
	material = MAT_METAL;
	value = Value_Sld2hAxe;
	damageTotal = Damage_Sld2hAxe;
	range = Range_Sld2hAxe;
	cond_value[2] = Condition_Sld2hAxe;
	description = name;
	visual = "ItMw_035_2h_sld_axe_01.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2H_OrcAxe_01(ItMw_2H_Axe)
{
	name = "Легкий топор орков";
	material = MAT_METAL;
	value = Value_Orkaxt_01;
	damageTotal = Damage_Orkaxt_01;
	range = Range_Orkaxt_01;
	cond_value[2] = Condition_Orkaxt_01;
	description = name;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	on_equip = S_Topor_ds_Orks_01;
	on_unequip = S_Topor_ds_Orks_02;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2H_OrcAxe_02(ItMw_2H_Axe)
{
	name = "Средний топор орков";
	material = MAT_METAL;
	value = Value_Orkaxt_02;
	damageTotal = Damage_Orkaxt_02;
	range = Range_Orkaxt_02;
	cond_value[2] = Condition_Orkaxt_02;
	description = name;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	on_equip = S_Topor_ds_Orks_01;
	on_unequip = S_Topor_ds_Orks_02;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_2H_OrcAxe_03(ItMw_2H_Axe)
{
	name = "Тяжелый топор орков";
	material = MAT_METAL;
	value = Value_Orkaxt_03;
	damageTotal = Damage_Orkaxt_03;
	range = Range_Orkaxt_03;
	cond_value[2] = Condition_Orkaxt_03;
	description = name;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	on_equip = S_Topor_ds_Orks_01;
	on_unequip = S_Topor_ds_Orks_02;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ITMW_2H_ORCAXE_04(ItMw_2H_Axe)
{
	name = "Брутальный топор орков";
	material = MAT_METAL;
	value = 25;
	damageTotal = Damage_Orkaxt_04;
	range = Range_Orkaxt_04;
	cond_value[2] = Condition_Orkaxt_04;
	description = name;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	on_equip = S_Topor_ds_Orks_01;
	on_unequip = S_Topor_ds_Orks_02;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Richtstab(ItMw_2H_Axe)
{
	name = "Посох судьи";
	material = MAT_WOOD;
	value = Value_Richtstab;
	damageTotal = Damage_Richtstab;
	range = Range_Richtstab;
	cond_value[2] = Condition_Richtstab;
	description = name;
	visual = "ItMw_025_2h_Staff_02.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Hellebarde(ItMw_2H_Axe)
{
	name = "Алебарда";
	material = MAT_METAL;
	value = Value_Hellebarde;
	damageTotal = Damage_Hellebarde;
	range = Range_Hellebarde;
	cond_value[2] = Condition_Hellebarde;
	description = name;
	visual = "itmw_028_2h_halberd_01.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Stabkeule(ItMw_2H_Axe)
{
	name = "Палица";
	material = MAT_WOOD;
	value = Value_Stabkeule;
	damageTotal = Damage_Stabkeule;
	damagetype = DAM_BLUNT;
	range = Range_Stabkeule;
	cond_value[2] = Condition_Stabkeule;
	description = name;
	visual = "ItMw_032_2h_staff_03.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Streitaxt1(ItMw_2H_Axe)
{
	name = "Легкий боевой топор";
	material = MAT_METAL;
	value = Value_Streitaxt1;
	damageTotal = Damage_Streitaxt1;
	range = Range_Streitaxt1;
	cond_value[2] = Condition_Streitaxt1;
	description = name;
	visual = "ItMw_035_2h_Axe_light_03.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Streitaxt2(ItMw_2H_Axe)
{
	name = "Боевой топор";
	material = MAT_METAL;
	value = Value_Streitaxt2;
	damageTotal = Damage_Streitaxt2;
	range = Range_Streitaxt2;
	cond_value[2] = Condition_Streitaxt2;
	description = name;
	visual = "ItMw_060_2h_axe_heavy_01.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Schlachtaxt(ItMw_2H_Axe)
{
	name = "Военный топор";
	material = MAT_METAL;
	value = Value_Schlachtaxt;
	damageTotal = Damage_Schlachtaxt;
	range = Range_Schlachtaxt;
	cond_value[2] = Condition_Schlachtaxt;
	description = name;
	visual = "ItMw_070_2h_axe_heavy_03.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Barbarenstreitaxt(ItMw_2H_Axe)
{
	name = "Боевой топор варваров";
	material = MAT_METAL;
	value = Value_Barbarenstreitaxt;
	damageTotal = Damage_Barbarenstreitaxt;
	range = Range_Barbarenstreitaxt;
	cond_value[2] = Condition_Barbarenstreitaxt;
	description = name;
	visual = "ItMw_075_2h_axe_heavy_04.3DS";
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
//----------------------
instance ItMw_Berserkeraxt(C_Item)
{
	name = "Топор берсеркера";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_Berserkeraxt;
	damageTotal = Damage_Berserkeraxt;
	damagetype = DAM_EDGE;
	range = Range_Berserkeraxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Berserkeraxt;
	visual = "ItMw_080_2h_axe_heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
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
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	scemeName = "ROMSEALED";
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
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
