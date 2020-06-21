const int Value_ItMw_DS2P_BeliarHorror = 3000;
const int Damage_ItMw_DS2P_BeliarHorror = 100;
const int Range_ItMw_DS2P_BeliarHorror = 90;
const int Cond_ItMw_DS2P_BeliarHorror_STR = 65;
instance ItMw_DS2P_BeliarHorror(ItMw_1H_Sword)
{
	name = "Клинок";
	value = Value_ItMw_DS2P_BeliarHorror;
	damageTotal = Damage_ItMw_DS2P_BeliarHorror;
	range = Range_ItMw_DS2P_BeliarHorror;
	cond_value[2] = Cond_ItMw_DS2P_BeliarHorror_STR;		//условие по силе
	visual = "ItMw_DS_Sword_05.3DS";
	description = "Ужас Белиара";
	count[2] = damageTotal;			//Урон
	count[3] = cond_value[2];	//Условие по силе
	count[5] = value;						//Цена
};

const int Value_ItMw_DS2P_FlameOfRevenge = 2000;
const int Damage_ItMw_DS2P_FlameOfRevenge = 120;
const int Range_ItMw_DS2P_FlameOfRevenge = 155;
const int Cond_ItMw_DS2P_FlameOfRevenge_STR = 115;
instance ItMw_DS2P_FlameOfRevenge(ItMw_2H_Sword)
{
	name = "Клинок";	description = "Пламя мести";	visual = "ItMw_DS_Sword_06.3DS";
	value = Value_ItMw_DS2P_FlameOfRevenge;
	damageTotal = Damage_ItMw_DS2P_FlameOfRevenge;
	range = Range_ItMw_DS2P_FlameOfRevenge;
	cond_value[2] = Cond_ItMw_DS2P_FlameOfRevenge_STR;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
//=========================
//"Укус Гадюки" - отравленный, дает Адо за квест "В поисках сокровищ" 
// UNFINISHED визуал, отравление
//==================
instance ItMw_DS2P_ViperSting(ItMw_1H_Sword)
{
	name = "Укус гадюки";	description = name;	visual = "Itmw_005_1h_dagger_01.3DS";
	value = Value_VLKDolch;
	damageTotal = Damage_VLKDolch;
	range = Range_VLKDolch;
	cond_value[2] = Condition_VLKDolch;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
//=========================
//"Меч Гуруна" - дает Ца-Ха-Наух за квест "Защита для маленьких 
// UNFINISHED визуал
// Меч гоблинский, поэтому условие на ловкость, а не силу
//==================
const int Value_ItMw_DS2P_1H_GurunSword = 900;
const int Damage_ItMw_DS2P_1H_GurunSword = 100;
const int Range_ItMw_DS2P_1H_GurunSword = 90;
const int Cond_ItMw_DS2P_1H_GurunSword_DEX = 90;

instance ItMw_DS2P_1H_GurunSword(ItMw_1H_Sword)
{
	name = "Меч Гуруна";	description = name;	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	damageTotal = Damage_ItMw_DS2P_1H_GurunSword;
	range = Range_ItMw_DS2P_1H_GurunSword;
	
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Cond_ItMw_DS2P_1H_GurunSword_DEX;
	count[2] = damageTotal;
	
	value = Value_ItMw_DS2P_1H_GurunSword;
	count[3] = cond_value[2];
	count[5] = value;
};
//=========================
//"Покоритель природы" - изготавливает Джозеф для себя же по квесту "Особый топор для Джозефа"
// UNFINISHED визуал, характеристики
//==================
const int Value_ItMw_DS2P_2H_JosephAxe = 900;
const int Damage_ItMw_DS2P_2H_JosephAxe = 100;
const int Range_ItMw_DS2P_2H_JosephAxe = 90;
const int Cond_ItMw_DS2P_2H_JosephAxe = 90;

instance ItMw_DS2P_2H_JosephAxe(ItMw_1H_Sword)
{
	name = "Покоритель природы";	description = name;	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	damageTotal = Damage_ItMw_DS2P_2H_JosephAxe;
	range = Range_ItMw_DS2P_2H_JosephAxe;
	
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Cond_ItMw_DS2P_2H_JosephAxe;
	count[2] = damageTotal;
	
	value = Value_ItMw_DS2P_2H_JosephAxe;
	count[3] = cond_value[2];
	count[5] = value;
};
//=========================
//"Челнок смерти"
//=========================
const int Value_ItMw_DSP_WeaverSword = 500;
const int Damage_ItMw_DSP_WeaverSword = 70;
const int Range_ItMw_DSP_WeaverSword = 75;
const int Cond_ItMw_DSP_WeaverSword = 65;

instance ItMw_DSP_WeaverSword(ItMw_1H_Sword)
{
	flags = ITEM_MISSION;
	name = "Челнок смерти";
	description = name;
	visual = "ItMw_DS_Sword_03.3DS";
	text[1] = "Легкий и быстрый, как ткацкий челнок.";
	
	damageTotal = Damage_ItMw_DSP_WeaverSword;
	range = Range_ItMw_DSP_WeaverSword;
	count[2] = damageTotal;
	
	cond_value[2] = Cond_ItMw_DSP_WeaverSword;
	count[3] = cond_value[2];
	
	value = 150;
	count[5] = value;
	
	on_equip 				= Equip_ItMw_DSP_WeaverSword;
	on_unequip 				= UnEquip_ItMw_DSP_WeaverSword;
};
func void Equip_ItMw_DSP_WeaverSword()
{
	Bonus_WeaverSword_Equipped = TRUE;
	GiveBonus_WeaverComplect();
};
func void UnEquip_ItMw_DSP_WeaverSword()
{
	Bonus_WeaverSword_Equipped = FALSE;
	GiveBonus_WeaverComplect();
};



