
const int Value_Weed = 0;
const int Value_Beet = 3;
const int HP_Beet = 2;
const int Value_SwampHerb = 10;
const int Value_Mana_Herb_01 = 10;
const int Mana_Mana_Herb_01 = 10;
const int Value_Mana_Herb_02 = 20;
const int Mana_Mana_Herb_02 = 15;
const int Value_Mana_Herb_03 = 40;
const int Mana_Mana_Herb_03 = 20;
const int Value_Health_Herb_01 = 20;
const int HP_Health_Herb_01 = 15;
const int Value_Health_Herb_02 = 40;
const int HP_Health_Herb_02 = 30;
const int Value_Health_Herb_03 = 60;
const int HP_Health_Herb_03 = 50;
const int Value_Dex_Herb_01 = 250;
const int Value_Strength_Herb_01 = 500;
const int Value_Speed_Herb_01 = 100;
const int Speed_Boost = 15000;
const int Value_Mushroom_01 = 10;
const int HP_Mushroom_01 = 10;
const int Value_Mushroom_02 = 30;
const int HP_Mushroom_02 = 25;
const int Value_Forestberry = 10;
const int HP_Forestberry = 5;
const int Value_Blueplant = 10;
const int HP_Blueplant = 5;
const int Mana_Blueplant = 10;
const int Value_Planeberry = 10;
const int HP_Planeberry = 5;
const int Value_Temp_Herb = 100;
const int HP_Temp_Herb = 5;
const int Value_Perm_Herb = 500;
const int HP_Perm_Herb = 5;

instance ItPl_Weed(C_Item)	//Сорняк
{
	name = "Сорняк";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Weed;
	visual = "ItPl_Weed.3ds";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Weed;
};

var int Beet_DS_Bonus;
const int HP_DS_Beet = 5;
instance ItPl_Beet(C_Item)	//Свекла
{
	name = "Свекла";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Beet;
	visual = "ItPl_Beet.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_Beet;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Beet;
	text[5] = NAME_Value;
	count[5] = Value_Beet;
};
func void Use_Beet()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Beet);
	if(Npc_IsPlayer(self))
	{
		Beet_DS_Bonus += 1;
		if(Beet_DS_Bonus == 30)
		{
			B_RaiseAttribute(self,ATR_DEXTERITY,1);
			Snd_Play("LevelUp");
			Beet_DS_Bonus = 0;
		};
	};
};

var int SwampHerb_DS_Bonus;
instance ItPl_SwampHerb(C_Item)	//Болотник
{
	name = "Болотник";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_SwampHerb;
	visual = "ItPl_SwampHerb.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_SwampHerb;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_SwampHerb;
};
func void Use_SwampHerb()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
		SwampHerb_DS_Bonus += 1;
		if(SwampHerb_DS_Bonus == 20)	{	B_RaiseAttribute(self,ATR_MANA_MAX,-1);	};
		if(SwampHerb_DS_Bonus == 40)	{	B_RaiseAttribute(self,ATR_MANA_MAX,3);	};
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

const int Mana_DS_Mana_Herb_01 = 7;
instance ItPl_Mana_Herb_01(C_Item)	//Огненная крапива
{
	name = "Огненная крапива";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mana_Herb_01;
	visual = "ItPl_Mana_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_DS_Mana_Herb_01;
	text[5] = NAME_Value;
	count[5] = Value_Mana_Herb_01;
};
func void Use_Mana_Herb_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_DS_Mana_Herb_01);
};

var int Mana_Herb_02_DS_Bonus;
const int Mana_DS_Mana_Herb_02 = 16;
instance ItPl_Mana_Herb_02(C_Item)	//Огненная трава
{
	name = "Огненная трава";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mana_Herb_02;
	visual = "ItPl_Mana_Herb_02.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_02;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_DS_Mana_Herb_02;
	text[5] = NAME_Value;
	count[5] = Value_Mana_Herb_02;
};
func void Use_Mana_Herb_02()
{
	if(Npc_IsPlayer(self))
	{
		Mana_Herb_02_DS_Bonus += 1;
		if(Mana_Herb_02_DS_Bonus == 50)
		{
			B_RaiseAttribute(self,ATR_MANA_MAX,2);
			Mana_Herb_02_DS_Bonus = 0;
		};
	};
	Npc_ChangeAttribute(self,ATR_MANA,Mana_DS_Mana_Herb_02);
};

var int Mana_Herb_03_DS_Bonus;
const int Mana_DS_Mana_Herb_03 = 24;
instance ItPl_Mana_Herb_03(C_Item)	//Огненный корень
{
	name = "Огненный корень";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mana_Herb_03;
	visual = "ItPl_Mana_Herb_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_Mana_Herb_03;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_DS_Mana_Herb_03;
	text[5] = NAME_Value;
	count[5] = Value_Mana_Herb_03;
};
func void Use_Mana_Herb_03()
{
	if(Npc_IsPlayer(self))
	{
		Mana_Herb_03_DS_Bonus += 1;
		if(Mana_Herb_03_DS_Bonus == 40)
		{
			B_RaiseAttribute(self,ATR_MANA_MAX,3);
			Mana_Herb_03_DS_Bonus = 0;
		};
	};
	Npc_ChangeAttribute(self,ATR_MANA,Mana_DS_Mana_Herb_03);
};

var int Health_Herb_01_DS_Bonus;
const int HP_DS_Health_Herb_01 = 8;
instance ItPl_Health_Herb_01(C_Item)	//Лечебное растение
{
	name = "Лечебное растение";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Health_Herb_01;
	visual = "ItPl_Health_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Health_Herb_01;
	text[5] = NAME_Value;
	count[5] = Value_Health_Herb_01;
};
func void Use_Health_Herb_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Health_Herb_01);
};

var int Health_Herb_02_DS_Bonus;
const int HP_DS_Health_Herb_02 = 16;
instance ItPl_Health_Herb_02(C_Item)	//Лечебная трава
{
	name = "Лечебная трава";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Health_Herb_02;
	visual = "ItPl_Health_Herb_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_02;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Health_Herb_02;
	text[5] = NAME_Value;
	count[5] = Value_Health_Herb_02;
};
func void Use_Health_Herb_02()
{
	if(Npc_IsPlayer(self))
	{
		Health_Herb_02_DS_Bonus += 1;
		if(Health_Herb_02_DS_Bonus == 50)
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,2);
			Health_Herb_02_DS_Bonus = 0;
		};
	};
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Health_Herb_02);
};

var int Health_Herb_03_DS_Bonus;
const int HP_DS_Health_Herb_03 = 24;
instance ItPl_Health_Herb_03(C_Item)	//Лечебный корень
{
	name = "Лечебный корень";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Health_Herb_03;
	visual = "ItPl_Health_Herb_03.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Health_Herb_03;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Health_Herb_03;
	text[5] = NAME_Value;
	count[5] = Value_Health_Herb_03;
};
func void Use_Health_Herb_03()
{
	if(Npc_IsPlayer(self))
	{
		Health_Herb_03_DS_Bonus += 1;
		if(Health_Herb_03_DS_Bonus == 60)
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,3);
			Health_Herb_03_DS_Bonus = 0;
		};
	};
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Health_Herb_03);
};

var int Dex_Herb_01_DS_Bonus;
const int HP_DS_Dex_Herb_01 = 50;
instance ItPl_Dex_Herb_01(C_Item)	//Ягода гоблина
{
	name = "Ягода гоблина";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Dex_Herb_01;
	visual = "ItPl_Dex_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Dex_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Dex_Herb_01;
	text[2] = NAME_Bonus_Dex;
	count[2] = 1;
	text[3] = NAME_DS_AntiBonus_Str;
	count[3] = -1;	
	text[5] = NAME_Value;
	count[5] = Value_Dex_Herb_01;
};
func void Use_Dex_Herb_01()
{
	B_RaiseAttribute(self,ATR_DEXTERITY,1);
	B_RaiseAttribute(self,ATR_STRENGTH,-1);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Dex_Herb_01);
};

var int Strength_Herb_01_DS_Bonus;
const int HP_DS_Strength_Herb_01 = 100;
instance ItPl_Strength_Herb_01(C_Item)	//Драконий корень
{
	name = "Драконий корень";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Strength_Herb_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Strength_Herb_01;
	text[2] = NAME_Bonus_Str;
	count[2] = 1;
	text[3] = NAME_DS_AntiBonus_Dex;
	count[3] = -1;	
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
};

func void Use_Strength_Herb_01()
{
	B_RaiseAttribute(self,ATR_STRENGTH,1);
	B_RaiseAttribute(self,ATR_DEXTERITY,-1);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Dex_Herb_01);
};

instance ItPl_Speed_Herb_01(C_Item)	//Снеппер-трава
{
	name = "Снеппер-трава";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Speed_Herb_01;
	visual = "ItPl_Speed_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Speed_Herb_01;
	scemeName = "FOOD";
	text[3] = NAME_Sec_Duration;
	count[3] = Speed_Boost / 1000;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Speed_Herb_01;
};

func void Use_Speed_Herb_01()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",Speed_Boost);
};

var int Mushroom_01_DS_Bonus;
const int HP_DS_Mushroom_01 = 8;
instance ItPl_Mushroom_01(C_Item)	//Темный гриб
{
	name = "Темный гриб";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mushroom_01;
	visual = "ItPl_Mushroom_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mushroom_01;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Mushroom_01;
	text[5] = NAME_Value;
	count[5] = Value_Mushroom_01;
};
func void Use_Mushroom_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Mushroom_01);
	if(Npc_IsPlayer(self))
	{
		Dunkelpilz_Bonus += 1;
		if(Dunkelpilz_Bonus == 20)
		{
			//B_RaiseAttribute(self,ATR_MANA_MAX,5);
			Npc_ChangeAttribute(self,ATR_MANA,5);
			//Snd_Play("LevelUp");
			Dunkelpilz_Bonus = 0;
		};
	};
};

var int Mushroom_02_DS_Bonus;
const int HP_DS_Mushroom_02 = 25;
const int Mana_DS_Mushroom_02 = 1;
instance ItPl_Mushroom_02(C_Item)	//Мясной гриб
{
	name = "Мясной гриб";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mushroom_02;
	visual = "ItPl_Mushroom_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Mushroom_02;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Mushroom_02;
	text[2] = NAME_Bonus_Mana;
	count[2] = MAna_DS_Mushroom_02;
	text[5] = NAME_Value;
	count[5] = Value_Mushroom_02;
};
func void Use_Mushroom_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Mushroom_02);
	Npc_ChangeAttribute(self,ATR_MAna,Mana_DS_Mushroom_02);
	if(Npc_IsPlayer(self))
	{
		Mushroom_02_DS_Bonus += 1;
		if(Mushroom_02_DS_Bonus == 100)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT,2);
			Snd_Play("LevelUp");
			self.attribute[ATR_HITPOINTS] = 2;
			AI_PlayAniBS(self,"T_STAND_2_WOUNDEDB",BS_LIE);
			Mushroom_02_DS_Bonus = 0;
		};
	};
};

var int Blueplant_DS_Bonus;
const int HP_DS_Blueplant = 10;
const int Mana_DS_Blueplant = -3;
instance ItPl_Blueplant(C_Item)	//Синее растение
{
	name = "Синее растение";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Blueplant;
	visual = "ItPl_Blueplant.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Blueplant;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Blueplant;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_DS_Blueplant;
	text[5] = NAME_Value;
	count[5] = Value_Blueplant;
};
func void Use_Blueplant()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_DS_Blueplant);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Blueplant);
	if(Npc_IsPlayer(self))
	{
		Blueplant_DS_Bonus += 1;
		if(Blueplant_DS_Bonus == 50)
		{
			B_GiveBonusProt(self,PROT_MAGIC,1);
			Snd_Play("LevelUp");
			Blueplant_DS_Bonus = 0;
			Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
		};
	};
};

var int Forestberry_DS_Bonus;
const int HP_DS_Forestberry = 20;
instance ItPl_Forestberry(C_Item)	//Лесная ягода
{
	name = "Лесная ягода";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Forestberry;
	visual = "ItPl_Forestberry.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Forestberry;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Forestberry;
	text[5] = NAME_Value;
	count[5] = Value_Forestberry;
};
func void Use_Forestberry()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Forestberry);
	if(Npc_IsPlayer(self))
	{
		Forestberry_DS_Bonus += 1;
		if(Forestberry_DS_Bonus == 100)
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,10);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Forestberry);
			Snd_Play("LevelUp");
			Forestberry_DS_Bonus = 0;
		};
	};
};

var int Planeberry_DS_Bonus;
const int HP_DS_Planeberry = 6;
instance ItPl_Planeberry(C_Item)	//Дикая ягода
{
	name = "Дикая ягода";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Planeberry;
	visual = "ItPl_Planeberry.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Planeberry;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Planeberry;
	text[5] = NAME_Value;
	count[5] = Value_Planeberry;
};
func void Use_Planeberry()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Planeberry);
	if(Npc_IsPlayer(self))
	{
		Planeberry_DS_Bonus += 1;
		if(Planeberry_DS_Bonus == 70)
		{
			B_GiveBonusProt(self,PROT_MAGIC,1);
			Snd_Play("LevelUp");
			Planeberry_DS_Bonus = 0;
		};
	};
};

var int Temp_Herb_DS_Bonus;
const int Mana_DS_Temp_Herb = 9;
instance ItPl_Temp_Herb(C_Item)	//Луговой горец
{
	name = "Луговой горец";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Temp_Herb;
	visual = "ItPl_Temp_Herb.3ds";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Temp_Herb;
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_DS_Temp_Herb;
	text[5] = NAME_Value;
	count[5] = Value_Temp_Herb;
};
func void Use_Temp_Herb()
{
	Npc_ChangeAttribute(self,ATR_Mana,Mana_DS_Temp_Herb);
	if(Npc_IsPlayer(self))
	{
		Temp_Herb_DS_Bonus += 1;
		if(Temp_Herb_DS_Bonus == 40)
		{
			B_RaiseAttribute(self,ATR_DEXTERITY,1);
			Snd_Play("LevelUp");
			Temp_Herb_DS_Bonus = 0;
		};
	};
};

instance ItPl_Perm_Herb(C_Item)	//Царский щавель
{
	name = "Царский щавель";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Perm_Herb;
	visual = "ItPl_Perm_Herb.3ds";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Perm_Herb;
	description = name;
	text[1] = "Не следует ее употреблять в пищу.";
	text[5] = NAME_Value;
	count[5] = Value_Perm_Herb;
};
func void Use_Perm_Herb()
{
	self.attribute[ATR_HITPOINTS] = 2;
};

