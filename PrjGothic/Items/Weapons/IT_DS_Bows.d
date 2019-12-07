const string MAGICBOWNEEDED = "Требуется магический лук";
const string BATTLEBOWNEEDED = "Требуется боевой лук";
const string HUNTERBOWNEEDED = "Требуется охотничий лук";
const string MAGICCBOWNEEDED = "Требуется магический арбалет";
const string BATTLECBOWNEEDED = "Требуется боевой арбалет";
const string HUNTERCBOWNEEDED = "Требуется охотничий арбалет";
const string BOWCLASSISHUNTER = "Класс лука:    Охотничий";
const string BOWCLASSISMAGIC = "Класс лука:    Магический";
const string BOWCLASSISBATTLE = "Класс лука:    Боевой";
const string CBOWCLASSISHUNTER = "Класс арбалета:    Охотничий";
const string CBOWCLASSISMAGIC = "Класс арбалета:    Магический";
const string CBOWCLASSISBATTLE = "Класс арбалета:    Боевой";

func void equip_battlearrow(var C_Item battlemunit)
{
	var C_Item rangedWeapon;
	var int munit;
	var string concatText;
	var string munitname;
//	var string concatcond;
//	var string concatcond1;
	var string stnoweapon;
	munit = Hlp_GetInstanceID(battlemunit);
	munitname = battlemunit.name;
	if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
	{
		rangedWeapon = Npc_GetEquippedRangedWeapon(hero);
		if(((rangedWeapon.flags & ITEM_BOW) == ITEM_BOW) && ((battlemunit.flags & ITEM_BOW) == ITEM_BOW) && (rangedWeapon.weight != 3))
		{
			if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ItRw_Addon_MagicArrow))
			{		Equip_DS_Arrow = 1;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_INNOSRETRIBUTIONARROW))
			{		Equip_DS_Arrow = 2;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_SILVEROREARROW))
			{		Equip_DS_Arrow = 3;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_MAGICOREARROW))
			{		Equip_DS_Arrow = 4;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_BLACKOREARROW))
			{		Equip_DS_Arrow = 5;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_VAMPIRARROW))
			{		Equip_DS_Arrow = 6;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ItRw_Arrow))
			{		Equip_DS_Arrow = 7;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ItRw_Addon_FireArrow))
			{		Equip_DS_Arrow = 8;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_KILLERARROW))
			{		Equip_DS_Arrow = 9;	};
			rangedWeapon.munition = munit;
			concatText = ConcatStrings("Выбран тип заряда: ",munitname);
			AI_PrintScreen(concatText,10,70,FONT_ScreenSmall,2);
		};
		if(((rangedWeapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW) && ((battlemunit.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW) && (rangedWeapon.weight != 3))
		{
			if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ItRw_Bolt_01))
			{		Equip_DS_Bolt = 1;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ItRw_Addon_MagicBolt))
			{		Equip_DS_Bolt = 2;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_SILVEROREBOLT))
			{		Equip_DS_Bolt = 3;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_MAGICOREBOLT))
			{		Equip_DS_Bolt = 4;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_BLACKOREBOLT))
			{		Equip_DS_Bolt = 5;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_VAMPIRBOLT))
			{		Equip_DS_Bolt = 6;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_FIREBOLT))
			{		Equip_DS_Bolt = 7;	}
			else if(Hlp_GetInstanceID(battlemunit) == Hlp_GetInstanceID(ITRW_ADDON_TROLLKILLERBOLT))
			{		Equip_DS_Bolt = 8;	};
			rangedWeapon.munition = munit;
			concatText = ConcatStrings("Выбран тип заряда: ",munitname);
			AI_PrintScreen(concatText,10,70,FONT_ScreenSmall,2);
		};
		if( (((rangedWeapon.flags & ITEM_BOW) == ITEM_BOW) && ((battlemunit.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW)) 
		|| (((rangedWeapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW) && ((battlemunit.flags & ITEM_BOW) == ITEM_BOW)) 
		|| (rangedWeapon.weight == 3))
		{
			AI_PrintScreen("Невозможно экипировать",20,70,FONT_ScreenSmall,2);
		};
	}
	else
	{
		if((battlemunit.flags & ITEM_BOW) == ITEM_BOW)
		{
			stNoWeapon = " луком";
		}
		else if((battlemunit.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW)
		{
			stNoWeapon = " арбалетом";
		};
		stnoweapon = ConcatStrings("Не экипирован",stnoweapon);
		AI_PrintScreen(stnoweapon,20,70,FONT_ScreenSmall,2);
	};
};

instance ItRw_Atis_Bow(C_Item)
{
	name = "Лук Атиса";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 500;
	damageTotal = 50;
	damagetype = DAM_POINT;
	munition = ITRW_INNOSRETRIBUTIONARROW;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_SldBogen;
	visual = "ItRw_Sld_Bow.mms";
	description = name;
	text[1] = BOWCLASSISMAGIC;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Sld_Bow(C_Item)		//Лук
{
	name = "Лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_SldBogen;
	damageTotal = Damage_SldBogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_SldBogen;
	visual = "ItRw_Sld_Bow.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_L_01(C_Item)		//Короткий лук
{
	name = "Короткий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Kurzbogen;
	damageTotal = Damage_Kurzbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kurzbogen;
	visual = "ItRw_Bow_L_01.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_L_02(C_Item)		//Ивовый лук
{
	name = "Ивовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Weidenbogen;
	damageTotal = Damage_Weidenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Weidenbogen;
	visual = "ItRw_Bow_L_02.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_L_03(C_Item)		//Охотничий лук
{
	name = "Охотничий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damageTotal = Damage_Jagdbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_M_01.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_L_04(C_Item)		//Вязовый лук
{
	name = "Вязовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Ulmenbogen;
	damageTotal = Damage_Ulmenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Ulmenbogen;
	visual = "ItRw_Bow_M_02.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_M_01(C_Item)		//Композитный лук
{
	name = "Композитный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Kompositbogen;
	damageTotal = Damage_Kompositbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kompositbogen;
	visual = "ItRw_Bow_M_01.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_M_02(C_Item)		//Ясеневый лук
{
	name = "Ясеневый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Eschenbogen;
	damageTotal = Damage_Eschenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Eschenbogen;
	visual = "ItRw_Bow_M_02.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_M_03(C_Item)		//Длинный лук
{
	name = "Длинный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Langbogen;
	damageTotal = Damage_Langbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Langbogen;
	visual = "ItRw_Bow_M_03.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_M_04(C_Item)		//Буковый лук
{
	name = "Буковый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Buchenbogen;
	damageTotal = Damage_Buchenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Buchenbogen;
	visual = "ItRw_Bow_M_04.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_H_01(C_Item)		//Костяной лук
{
	name = "Костяной лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Knochenbogen;
	damageTotal = Damage_Knochenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Knochenbogen;
	visual = "ItRw_Bow_H_01.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_H_02(C_Item)		//Дубовый лук
{
	name = "Дубовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Eichenbogen;
	damageTotal = Damage_Eichenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Eichenbogen;
	visual = "ItRw_Bow_H_02.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_H_03(C_Item)		//Военный лук
{
	name = "Военный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Kriegsbogen;
	damageTotal = Damage_Kriegsbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Kriegsbogen;
	visual = "ItRw_Bow_H_03.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_H_04(C_Item)		//Драконий лук
{
	name = "Драконий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_Drachenbogen;
	damageTotal = Damage_Drachenbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Drachenbogen;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Addon_FireBow(C_Item)
{
	name = "Огненный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_FireBow;
	damageTotal = Damage_FireBow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_FireArrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREBOW";
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_FireBow;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISBATTLE;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

/*
const int VALUE_HUNTERBOW_01 = 400;
const int VALUE_HUNTERBOW_02 = 700;
const int VALUE_HUNTERBOW_03 = 1000;
const int VALUE_HUNTERBOW_04 = 1200;
const int VALUE_HUNTERBOW_05 = 1500;
const int VALUE_HUNTERBOW_06 = 1700;
const int VALUE_HUNTERBOW_07 = 2000;
const int VALUE_HUNTERBOW_08 = 3000;
const int DAMAGE_HUNTERBOW_01 = 35;
const int DAMAGE_HUNTERBOW_02 = 45;
const int DAMAGE_HUNTERBOW_03 = 50;
const int DAMAGE_HUNTERBOW_04 = 60;
const int DAMAGE_HUNTERBOW_05 = 70;
const int DAMAGE_HUNTERBOW_06 = 80;
const int DAMAGE_HUNTERBOW_07 = 90;
const int DAMAGE_HUNTERBOW_08 = 100;
const int CONDITION_HUNTERBOW_01_DEX = 30;
const int CONDITION_HUNTERBOW_02_DEX = 35;
const int CONDITION_HUNTERBOW_03_DEX = 40;
const int CONDITION_HUNTERBOW_04_DEX = 50;
const int CONDITION_HUNTERBOW_05_DEX = 60;
const int CONDITION_HUNTERBOW_06_DEX = 70;
const int CONDITION_HUNTERBOW_07_DEX = 85;
const int CONDITION_HUNTERBOW_08_DEX = 90;
const int CONDITION_HUNTERBOW_01_STR = 15;
const int CONDITION_HUNTERBOW_02_STR = 20;
const int CONDITION_HUNTERBOW_03_STR = 30;
const int CONDITION_HUNTERBOW_04_STR = 45;
const int CONDITION_HUNTERBOW_05_STR = 55;
const int CONDITION_HUNTERBOW_06_STR = 65;
const int CONDITION_HUNTERBOW_07_STR = 80;
const int CONDITION_HUNTERBOW_08_STR = 80;
const int BONUS_TALENTBOW_HUNTER_01 = 0;
const int BONUS_TALENTBOW_HUNTER_02 = 2;
const int BONUS_TALENTBOW_HUNTER_03 = 2;
const int BONUS_TALENTBOW_HUNTER_04 = 2;
const int BONUS_TALENTBOW_HUNTER_05 = 3;
const int BONUS_TALENTBOW_HUNTER_06 = 3;
const int BONUS_TALENTBOW_HUNTER_07 = 3;
const int BONUS_TALENTBOW_HUNTER_08 = 5;

instance ITRW_HUNTERBOW_01(C_Item)
{
	name = "Охотничий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_HUNTERBOW_01;
	damageTotal = DAMAGE_HUNTERBOW_01;
	damagetype = DAM_POINT;
	munition = itrw_hunterarrow;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISHUNTER;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITRW_HUNTERBOW_02(C_Item)
{
	name = "Лук Разведчика";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_HUNTERBOW_02;
	damageTotal = DAMAGE_HUNTERBOW_02;
	damagetype = DAM_POINT;
	munition = itrw_hunterarrow;
	on_equip = equip_itrw_hunterbow_02;
	on_unequip = unequip_itrw_hunterbow_02;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISHUNTER;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_itrw_hunterbow_02()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,2);
};

func void unequip_itrw_hunterbow_02()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,-2);
};


instance ITRW_HUNTERBOW_03(C_Item)
{
	name = "Убийца Глорхов";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_HUNTERBOW_03;
	damageTotal = DAMAGE_HUNTERBOW_03;
	damagetype = DAM_POINT;
	munition = itrw_hunterarrow;
	on_equip = equip_itrw_hunterbow_03;
	on_unequip = unequip_itrw_hunterbow_03;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISHUNTER;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

func void equip_itrw_hunterbow_03()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,2);
};

func void unequip_itrw_hunterbow_03()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,-2);
};


instance ITRW_HUNTERBOW_04(C_Item)
{
	name = "Доблесть охотника";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_HUNTERBOW_04;
	damageTotal = DAMAGE_HUNTERBOW_04;
	damagetype = DAM_POINT;
	munition = itrw_hunterarrow;
	on_equip = equip_itrw_hunterbow_04;
	on_unequip = unequip_itrw_hunterbow_04;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISHUNTER;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_itrw_hunterbow_04()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,2);
};

func void unequip_itrw_hunterbow_04()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,-2);
};

instance ITRW_HUNTERBOW_05(C_Item)
{
	name = "Хозяин леса";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_HUNTERBOW_05;
	damageTotal = DAMAGE_HUNTERBOW_05;
	damagetype = DAM_POINT;
	munition = itrw_hunterarrow;
	on_equip = equip_itrw_hunterbow_05;
	on_unequip = unequip_itrw_hunterbow_05;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISHUNTER;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_itrw_hunterbow_05()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,3);
};

func void unequip_itrw_hunterbow_05()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,-3);
};

instance ITRW_HUNTERBOW_06(C_Item)
{
	name = "Рассекающий пространство";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_HUNTERBOW_06;
	damageTotal = DAMAGE_HUNTERBOW_06;
	damagetype = DAM_POINT;
	munition = itrw_hunterarrow;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_HUNTERBOW_06_STR;
	on_equip = equip_itrw_hunterbow_06;
	on_unequip = unequip_itrw_hunterbow_06;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISHUNTER;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_itrw_hunterbow_06()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,3);
};

func void unequip_itrw_hunterbow_06()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,-3);
};

instance ITRW_HUNTERBOW_07(C_Item)
{
	name = "Последний Возглас";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_HUNTERBOW_07;
	damageTotal = DAMAGE_HUNTERBOW_07;
	damagetype = DAM_POINT;
	munition = itrw_hunterarrow;
	on_equip = equip_itrw_hunterbow_07;
	on_unequip = unequip_itrw_hunterbow_07;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISHUNTER;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_itrw_hunterbow_07()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,3);
};

func void unequip_itrw_hunterbow_07()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,-3);
};

instance ITRW_HUNTERBOW_08(C_Item)
{
	name = "Шепот Смерти";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_HUNTERBOW_08;
	damageTotal = DAMAGE_HUNTERBOW_08;
	damagetype = DAM_POINT;
	munition = itrw_hunterarrow;
	on_equip = equip_itrw_hunterbow_08;
	on_unequip = unequip_itrw_hunterbow_08;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISHUNTER;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_itrw_hunterbow_08()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,5);
};

func void unequip_itrw_hunterbow_08()
{
	B_AddFightSkill(hero,NPC_TALENT_BOW,-5);
};
*/
const int CONDITION_MAGICBOW_MANA = 80;
const int CONDITION_MAGICBOW_STR = 80;
const int CONDITION_MAGICBOW_DEX = 80;

instance ItRw_Addon_MagicBow(C_Item)
{
	name = "Магический лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_MagicBow;
	damageTotal = Damage_MagicBow;
	damagetype = DAM_MAGIC;
	munition = ItRw_Addon_MagicArrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOW";
	on_equip = equip_itrw_addon_magicbow;
	on_unequip = unequip_itrw_addon_magicbow;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[1] = BOWCLASSISMAGIC;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_itrw_addon_magicbow()
{
	B_AddFightSkill(self,NPC_TALENT_BOW,5);
};
func void unequip_itrw_addon_magicbow()
{
	B_AddFightSkill(self,NPC_TALENT_BOW,-5);
};

