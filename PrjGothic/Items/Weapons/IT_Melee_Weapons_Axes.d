
instance ItMw_1H_Mace_L_01(ItMw_1H_Axe)
{
	name = "Кочерга";
	material = MAT_WOOD;
	value = Value_Schuerhaken;
	damageTotal = Damage_Schuerhaken;
	range = Range_Schuerhaken;
	cond_value[2] = Condition_Schuerhaken;
	visual = "Itmw_005_1h_poker_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1h_Bau_Axe(ItMw_1H_Axe)
{
	name = "Серп";	
	material = MAT_METAL;
	value = Value_BauAxe;
	damageTotal = Damage_BauAxe;	
	range = Range_BauAxe;	
	cond_value[2] = Condition_BauAxe;
	visual = "Itmw_007_1h_sickle_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1h_Vlk_Mace(ItMw_1H_Axe)
{
	name = "Посох";
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = Damage_VLKMace;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_1H_Mace_L_03(ItMw_1H_Axe)
{
	name = "Палка";
	material = MAT_WOOD;
	value = Value_Belegnagel;
	damageTotal = Damage_Belegnagel;
	damagetype = DAM_BLUNT;
	range = Range_Belegnagel;
	cond_value[2] = Condition_Belegnagel;
	visual = "ItMw_008_1h_mace_light_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_1h_Bau_Mace(ItMw_1H_Axe)
{
	name = "Тяжелый сук";
	material = MAT_WOOD;
	value = Value_BauMace;
	damageTotal = Damage_BauMace;
	damagetype = DAM_BLUNT;
	range = Range_BauMace;
	cond_value[2] = Condition_BauMace;
	visual = "ItMw_010_1h_Club_01.3DS";	
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_1h_Vlk_Axe(ItMw_1H_Axe)
{
	name = "Топор";
	material = MAT_METAL;
	value = Value_VLKAxe;
	damageTotal = Damage_VLKAxe;
	range = Range_VLKAxe;
	cond_value[2] = Condition_VLKAxe;
	visual = "Itmw_010_1h_vlk_hatchet_01.3DS";	
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_1H_Mace_L_04(ItMw_1H_Axe)
{
	name = "Молот кузнеца";
	material = MAT_METAL;
	value = Value_Schmiedehammer;
	damageTotal = Damage_Schmiedehammer;
	damagetype = DAM_BLUNT;
	range = Range_Schmiedehammer;
	cond_value[2] = Condition_Schmiedehammer;
	visual = "ItMw_010_1h_sledgehammer_01.3DS";	
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_DS_Orc_SmithHammer(ItMw_1H_Axe)
{
	name = "Орочий кузнечный молот";
	material = MAT_METAL;
	value = Value_Schmiedehammer;
	damageTotal = Damage_Schmiedehammer;
	damagetype = DAM_BLUNT;
	range = Range_Schmiedehammer;
	cond_value[2] = Condition_Schmiedehammer;
	visual = "ItMw_2H_OrcMace_02.3DS";	
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Nagelknueppel(ItMw_1H_Axe)
{
	name = "Палица с шипами";
	material = MAT_WOOD;
	value = Value_Nagelknueppel;
	damageTotal = Damage_Nagelknueppel;
	damagetype = DAM_BLUNT;
	range = Range_Nagelknueppel;
	cond_value[2] = Condition_Nagelknueppel;
	visual = "ItMw_012_1h_Nailmace_01.3DS";	
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_1h_Sld_Axe(ItMw_1H_Axe)
{
	name = "Грубый тесак";
	material = MAT_METAL;
	value = Value_Sld1hAxt;
	damageTotal = Damage_Sld1hAxt;
	range = Range_Sld1hAxt;
	cond_value[2] = Condition_Sld1hAxt;
	visual = "ItMw_025_1h_sld_axe_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_1h_Sld_Sword(ItMw_1H_Axe)
{
	name = "Грубый меч";
	material = MAT_METAL;
	value = Value_Sld1hSchwert;
	damageTotal = Damage_Sld1hSchwert;
	range = Range_Sld1hSchwert;
	cond_value[2] = Condition_Sld1hSchwert;
	visual = "ItMw_025_1h_sld_sword_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Nagelkeule(ItMw_1H_Axe)
{
	name = "Дубина с шипами";
	material = MAT_WOOD;
	value = Value_Nagelkeule;
	damageTotal = Damage_Nagelkeule;
	damagetype = DAM_BLUNT;
	range = Range_Nagelkeule;
	cond_value[2] = Condition_Nagelkeule;
	visual = "ItMw_018_1h_Mace_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Kriegskeule(ItMw_1H_Axe)
{
	name = "Военная дубина";
	material = MAT_WOOD;
	value = Value_Kriegskeule;
	damageTotal = Damage_Kriegskeule;
	damagetype = DAM_BLUNT;
	range = Range_Kriegskeule;
	cond_value[2] = Condition_Kriegskeule;
	visual = "ItMw_022_1h_mace_war_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Kriegshammer1(ItMw_1H_Axe)
{
	name = "Военный молот";
	material = MAT_METAL;
	value = Value_Kriegshammer1;
	damageTotal = Damage_Kriegshammer1;
	damagetype = DAM_BLUNT;
	range = Range_Kriegshammer1;
	cond_value[2] = Condition_Kriegshammer1;
	visual = "ItMw_028_1h_warhammer_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Nagelkeule2(ItMw_1H_Axe)
{
	name = "Тяжелая дубина с шипами";
	material = MAT_WOOD;
	value = Value_Nagelkeule2;
	damageTotal = Damage_Nagelkeule2;
	damagetype = DAM_BLUNT;
	range = Range_Nagelkeule2;
	cond_value[2] = Condition_Nagelkeule2;
	visual = "ItMw_018_1h_Mace_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Schiffsaxt(ItMw_1H_Axe)
{
	name = "Корабельный топор";
	material = MAT_METAL;
	value = Value_Schiffsaxt;
	damageTotal = Damage_Schiffsaxt;
	range = Range_Schiffsaxt;
	cond_value[2] = Condition_Schiffsaxt;
	visual = "ItMw_030_1h_axe_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Steinbrecher(ItMw_1H_Axe)
{
	name = "Дробитель камней";
	material = MAT_WOOD;
	value = Value_Steinbrecher;
	damageTotal = Damage_Steinbrecher;
	damagetype = DAM_BLUNT;
	range = Range_Steinbrecher;
	cond_value[2] = Condition_Steinbrecher;
	visual = "ItMw_035_1h_mace_war_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Spicker(ItMw_1H_Axe)
{
	name = "Раскалыватель черепов";
	material = MAT_WOOD;
	value = Value_Spicker;
	damageTotal = Damage_Spicker;
	damagetype = DAM_BLUNT;
	range = Range_Spicker;
	cond_value[2] = Condition_Spicker;
	visual = "ItMw_035_1h_mace_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Doppelaxt(ItMw_1H_Axe)
{
	name = "Двойной топор";
	material = MAT_METAL;
	value = Value_Doppelaxt;
	damageTotal = Damage_Doppelaxt;
	range = Range_Doppelaxt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Doppelaxt;
	visual = "ItMw_040_1h_Axe_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Bartaxt(ItMw_1H_Axe)
{
	name = "Бердыш";
	material = MAT_METAL;
	value = Value_Bartaxt;
	damageTotal = Damage_Bartaxt;
	range = Range_Bartaxt;
	cond_value[2] = Condition_Bartaxt;
	visual = "ItMw_040_1h_axe_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Morgenstern(ItMw_1H_Axe)
{
	name = "Булава с шипами";
	material = MAT_WOOD;
	value = Value_Morgenstern;
	damageTotal = Damage_Morgenstern;
	damagetype = DAM_BLUNT;
	range = Range_Morgenstern;
	cond_value[2] = Condition_Morgenstern;
	visual = "ItMW_045_1h_mace_04.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Streitkolben(ItMw_1H_Axe)
{
	name = "Булава";
	material = MAT_METAL;
	value = Value_Streitkolben;
	damageTotal = Damage_Streitkolben;
	damagetype = DAM_BLUNT;
	range = Range_Streitkolben;
	cond_value[2] = Condition_Streitkolben;
	visual = "ItMw_050_1h_mace_war_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Rabenschnabel(ItMw_1H_Axe)
{
	name = "Клюв ворона";
	material = MAT_METAL;
	value = Value_Rabenschnabel;
	damageTotal = Damage_Rabenschnabel;
	damagetype = DAM_BLUNT;
	range = Range_Rabenschnabel;
	cond_value[2] = Condition_Rabenschnabel;
	visual = "ItMw_058_1h_warhammer_02.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
instance ItMw_Inquisitor(ItMw_1H_Axe)
{
	name = "Инквизитор";
	material = MAT_METAL;
	value = Value_Inquisitor;
	damageTotal = Damage_Inquisitor;
	range = Range_Inquisitor;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Inquisitor;
	visual = "ItMw_060_1h_mace_war_04.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_ElBastardo(ItMw_1H_Axe)
{
	name = "Эль-бастардо";
	material = MAT_METAL;
	value = Value_ElBastardo;
	damageTotal = Damage_ElBastardo;
	range = Range_ElBastardo;
	on_equip = Equip_1H_08;
	on_unequip = UnEquip_1H_08;
	cond_value[2] = Condition_ElBastardo;
	visual = "ItMw_065_1h_sword_bastard_03.3DS";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_08;
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Kriegshammer2(ItMw_1H_Axe)
{
	name = "Тяжелый военный молот";
	material = MAT_METAL;
	value = Value_Kriegshammer2;
	damageTotal = Damage_Kriegshammer2;
	damagetype = DAM_BLUNT;
	range = Range_Kriegshammer2;
	cond_value[2] = Condition_Kriegshammer2;
	visual = "ItMw_065_1h_warhammer_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};

instance ItMw_Folteraxt(ItMw_1H_Axe)
{
	name = "Топор палача";
	material = MAT_METAL;
	value = Value_Folteraxt;
	damageTotal = Damage_Folteraxt;
	damagetype = DAM_EDGE;
	range = Range_Folteraxt;
	cond_value[2] = Condition_Folteraxt;
	visual = "ItMw_065_2h_greataxe_01.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
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
