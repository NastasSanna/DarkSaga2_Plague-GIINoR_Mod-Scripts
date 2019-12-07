
const int Value_Apple = 8;
const int HP_Apple = 10;
const int Value_Cheese = 30;
const int HP_Cheese = 15;
const int Value_Bacon = 50;
const int HP_Bacon = 20;
const int Value_Bread = 20;
const int HP_Bread = 10;
const int Value_Fish = 15;
const int HP_Fish = 5;
const int Value_Rawmeat = 3;
const int HP_RawMeat = 6;
const int Value_Meat = 6;
const int HP_Meat = 12;
const int Value_Stew = 8;
const int HP_Stew = 20;
const int Value_FishSoup = 20;
const int HP_FishSoup = 10;
const int Value_Sausage = 30;
const int HP_Sausage = 12;
const int Value_Honey = 30;
const int HP_Honey = 12;
const int Value_Water = 10;
const int HP_Water = 8;
const int Value_Beer = 20;
const int HP_Beer = 3;
const int Mana_Beer = 1;
const int Value_Booze = 15;
const int HP_Booze = 4;
const int Mana_Booze = 1;
const int Value_Wine = 20;
const int HP_Wine = 2;
const int Mana_Wine = 1;
const int Value_Milk = 15;
const int HP_Milk = 5;
const int Mana_Milk = 1;

instance ItFo_Apple(C_Item)
{
	name = "Яблоко";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Apple;
	visual = "ItFo_Apple.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Apple;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Apple;
	text[3] = "Свежее яблоко,";
	text[4] = "твердое и сочное.";
	text[5] = NAME_Value;
	count[5] = Value_Apple;
};
func void Use_Apple()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Apple);
	if(Npc_IsPlayer(self))
	{
		Apple_Bonus += 1;
		if(Apple_Bonus == 7)		{	Print(PRINT_Eat1);
		};
		if(Apple_Bonus == 15)	{	Print(PRINT_Eat2);
		};
		if(Apple_Bonus == 30)
		{
			B_RaiseAttribute(self,ATR_DEXTERITY,1);
			Snd_Play("LevelUp");
			Apple_Bonus = 0;
		};
	};
};

var int Cheese_DS_Bonus;
const int HP_DS_Cheese = 35;
instance ItFo_Cheese(C_Item)
{
	name = "Сыр";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Cheese;
	visual = "ItFo_Cheese.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Cheese;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Cheese;
	text[5] = NAME_Value;
	count[5] = Value_Cheese;
};
func void Use_Cheese()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Cheese);
	if(Npc_IsPlayer(self))
	{
		Cheese_DS_Bonus += 1;
		if(Cheese_DS_Bonus == 35)
		{
			B_RaiseAttribute(self,ATR_MANA_MAX,2);
			Snd_Play("LevelUp");
			Cheese_DS_Bonus = 0;
		};
	};
};

var int Bacon_DS_Bonus;
const int HP_DS_Bacon = 45;
instance ItFo_Bacon(C_Item)
{
	name = "Окорок";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bacon;
	visual = "ItFo_Bacon.3ds";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Bacon;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Bacon;
	text[5] = NAME_Value;
	count[5] = Value_Bacon;
};
func void Use_Bacon()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Bacon);
	if(Npc_IsPlayer(self))
	{
		Bacon_DS_Bonus += 1;
		if(Bacon_DS_Bonus == 30)
		{
			//B_RaiseAttribute(self,ATR_MANA_MAX,2);
			B_GiveBonusProt(self,PROT_FIRE,2);
			Snd_Play("LevelUp");
			Bacon_DS_Bonus = 0;
		};
	};
};

var int Bread_DS_Bonus;
const int HP_DS_Bread = 9;
instance ItFo_Bread(C_Item)
{
	name = "Хлеб";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bread;
	visual = "ItFo_Bread.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Bread;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Bread;
	text[5] = NAME_Value;
	count[5] = Value_Bread;
};
func void Use_Bread()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Bread);
	if(Npc_IsPlayer(self))
	{
		Bread_DS_Bonus += 1;
		if(Bread_DS_Bonus == 50)
		{
			//B_RaiseAttribute(self,ATR_MANA_MAX,2);
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT,1);
			Snd_Play("LevelUp");
			Bread_DS_Bonus = 0;
		};
	};
};

var int Fish_DS_Bonus;
const int HP_DS_Fish = 20;
instance ItFo_Fish(C_Item)
{
	name = "Рыба";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Fish;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Fish;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Fish;
	text[5] = NAME_Value;
	count[5] = Value_Fish;
};
func void Use_Fish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Fish);
	if(Npc_IsPlayer(self))
	{
		Fish_DS_Bonus += 1;
		if(Fish_DS_Bonus == 40)
		{
			B_RaiseAttribute(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
			Fish_DS_Bonus = 0;
		};
	};
};
var int RawMeat_DS_Bonus;
const int HP_DS_RawMeat = 10;
instance ItFoMuttonRaw(C_Item)
{
	name = "Сырое мясо";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Rawmeat;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_RawMeat;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_RawMeat;
	text[5] = NAME_Value;
	count[5] = Value_Rawmeat;
};
func void Use_RawMeat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_RawMeat);
	if(Npc_IsPlayer(self))
	{
		RawMeat_DS_Bonus += 1;
		if(RawMeat_DS_Bonus == 1000) //пока нет бонуса
		{
			B_RaiseAttribute(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
			RawMeat_DS_Bonus = 0;
		};
	};
};
var int Meat_DS_Bonus;
const int HP_DS_Meat = 25;
instance ItFoMutton(C_Item)
{
	name = "Жареное мясо";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Meat;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_Meat;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Meat;
	text[5] = NAME_Value;
	count[5] = Value_Meat;
};
func void Use_Meat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Meat);
	if(Npc_IsPlayer(self))
	{
		Meat_DS_Bonus += 1;
		if(Meat_DS_Bonus == 50)
		{
			B_GiveBonusProt(self,PROT_POINT,1);
			Snd_Play("LevelUp");
			Meat_DS_Bonus = 0;
		};
	};
};
var int Stew_DS_Bonus;
const int HP_DS_Stew = 30;
instance ItFo_Stew(C_Item)
{
	name = "Похлебка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Stew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_Stew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Stew;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};
func void Use_Stew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Stew);
	if(Npc_IsPlayer(self))
	{
		Stew_DS_Bonus += 1;
		if(Stew_DS_Bonus == 30)
		{
			var int randy;
			randy = Hlp_Random(3);
			if(randy == 0)
			{		B_RaiseAttribute(self,ATR_STRENGTH,1);
			}
			else if(randy == 1)
			{		B_RaiseAttribute(self,ATR_DEXTERITY,1);
			}
			else
			{		B_RaiseAttribute(self,ATR_MANA_MAX,1);
			};
			Snd_Play("LevelUp");
			Stew_DS_Bonus = 0;
		};
	};
};
instance ItFo_XPStew(C_Item)
{
	name = "Похлебка Теклы";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Stew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_XPStew;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[2] = NAME_Bonus_Str;
	count[2] = 1;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};
func void Use_XPStew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);
	Snd_Play("LevelUp");
	B_RaiseAttribute(self,ATR_STRENGTH,1);
};
var int FishSoup_DS_Bonus;
const int HP_DS_FishSoup = 15;
instance ItFo_FishSoup(C_Item)
{
	name = "Уха";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_FishSoup;
	visual = "ItFo_FishSoup.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_FishSoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_FishSoup;
	text[5] = NAME_Value;
	count[5] = Value_FishSoup;
};
func void Use_FishSoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_FishSoup);
	if(Npc_IsPlayer(self))
	{
		FishSoup_DS_Bonus += 1;
		if(Fish_DS_Bonus == 5)		{	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);	Snd_Play("LevelUp");	};
		if(Fish_DS_Bonus == 20)	{	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,2);	Snd_Play("LevelUp");	};
		if(Fish_DS_Bonus == 50)	{	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,3);	Snd_Play("LevelUp");	};
		if(Fish_DS_Bonus == 90)	{	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,4);	Snd_Play("LevelUp");	};
		if(Fish_DS_Bonus == 150)	{	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,5);	Snd_Play("LevelUp");	};
	};
};

var int Sausage_DS_Bonus;
const int HP_DS_Sausage = 18;
instance ItFo_Sausage(C_Item)
{
	name = "Колбаса";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Sausage;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Sausage;
	text[5] = NAME_Value;
	count[5] = Value_Sausage;
};
func void Use_Sausage()
{
	if(Npc_IsPlayer(self))
	{
		Sausage_DS_Bonus += 1;
		if(Sausage_DS_Bonus == 50)
		{
			var int hero_mana_max; var int hero_dex; var int hero_str; var int hero_max_atr;var int attr_number;
			hero_mana_max = self.attribute[ATR_MANA_MAX];
			hero_dex = self.attribute[ATR_DEXTERITY];
			hero_str = self.attribute[ATR_STRENGTH];
			if(Hero_str > hero_dex)
			{	hero_max_atr = hero_str; attr_number = ATR_STRENGTH;	}
			else
			{	hero_max_atr = hero_dex; attr_number = ATR_DEXTERITY;	};
			if(hero_mana_max > hero_max_atr)
			{	hero_max_atr = hero_mana_max;	attr_number = ATR_MANA_MAX;};
			B_RaiseAttribute(self,attr_number,5);
			Snd_Play("LevelUp");
			Sausage_DS_Bonus = 0;
		};
	};	
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Sausage);	
};

var int Honey_DS_Bonus;
const int HP_DS_Honey = 50;
const int Mana_DS_Honey = 25;
instance ItFo_Honey(C_Item)
{
	name = "Мед";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Honey;
	visual = "ItFo_Honey.3DS";
	material = MAT_STONE;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Honey;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Honey;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_DS_Honey;
	text[5] = NAME_Value;
	count[5] = Value_Honey;
};
func void Use_Honey()
{
	if(Npc_IsPlayer(self))
	{
		Honey_DS_Bonus += 1;
		if(Honey_DS_Bonus == 15)
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,1);
			Snd_Play("LevelUp");			
		};
		if(Honey_DS_Bonus == 30)
		{
			B_RaiseAttribute(self,ATR_MANA_MAX,1);
			Snd_Play("LevelUp");			
		};
		if(Honey_DS_Bonus == 45)
		{
			B_RaiseAttribute(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");			
		};
		if(Honey_DS_Bonus == 60)
		{
			B_RaiseAttribute(self,ATR_DEXTERITY,1);
			Snd_Play("LevelUp");			
		};		
	};
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Honey);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_DS_Honey);
};

var int Water_DS_Bonus;
const int HP_DS_Water = 1;
instance ItFo_Water(C_Item)
{
	name = "Вода";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Water;
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Water;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Water;
	text[5] = NAME_Value;
	count[5] = Value_Water;
};
func void Use_Water()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Water);
	if(Npc_IsPlayer(self))
	{
		Water_DS_Bonus += 1;
		if((Water_DS_Bonus == 50) || (Honey_DS_Bonus == 90) || (Honey_DS_Bonus == 150))
		{
			Wld_PlayEffect("spellFX_HealShrine",self,self,0,0,0,FALSE);
			Snd_Play("LevelUp");
			if(Water_DS_Bonus == 50)
			{
				PrintScreen("Озарение близко",-1,-1,Font_Screen,2);
			};
			if(Honey_DS_Bonus == 90)
			{
				B_RaiseAttribute(self,ATR_HITPOINTS_MAX,2);
				PrintScreen("Мудрость Аданоса коснулась тебя",-1,-1,Font_Screen,2);
			};
			if(Honey_DS_Bonus == 150)
			{
				B_RaiseAttribute(self,ATR_MANA_MAX,2);
				B_GiveBonusProt(self,PROT_DS_FIRE | PROT_DS_MAGIC,1);
				PrintScreen("Благословение воды не оставит тебя",-1,-1,Font_Screen,2);
			};
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];	
		};
	};	
};
const int HP_WaterMega = 50;
instance ItFo_DS_WaterMega(C_Item)
{
	name = "Вода";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Water;
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_DS_WaterMega;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_WaterMega;
	text[5] = NAME_Value;
	count[5] = Value_Water;
};
func void Use_DS_WaterMega()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WaterMega);
};
var int Beer_DS_Bonus;
const int HP_DS_Beer = 5;
const int MAna_DS_Beer = 1;
instance ItFo_Beer(C_Item)
{
	name = "Пиво";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Beer;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = Use_Beer;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Beer;
	text[2] = NAME_Bonus_Mana;
	count[2] = MAna_DS_Beer;
	text[4] = "Черное паладинское";
	text[5] = NAME_Value;
	count[5] = Value_Beer;
};
func void Use_Beer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Beer);
	Npc_ChangeAttribute(self,ATR_MANA,MAna_DS_Beer);
	if(Npc_IsPlayer(self))
	{
		Beer_DS_Bonus += 1;
		if(Beer_DS_Bonus == 40)
		{
			B_GiveBonusProt(self,PROT_FIRE,2);
			Snd_Play("LevelUp");
			Beer_DS_Bonus = 0;
		};
	};
};

var int Booze_DS_Bonus;
const int HP_DS_Booze = -5;
const int Mana_DS_Booze = 6;
instance ItFo_Booze(C_Item)
{
	name = "Шнапс";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Booze;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Booze;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Booze;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_DS_Booze;
	text[5] = NAME_Value;
	count[5] = Value_Booze;
};
instance ITFO_SAMOGON(C_Item)
{
	name = "Самогон";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Booze;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Booze;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Booze;
	text[2] = NAME_Bonus_Mana;
	count[2] = MAna_DS_Booze;
	text[5] = NAME_Value;
	count[5] = Value_Booze;
};
func void Use_Booze()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Booze);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Booze);
	if(Npc_IsPlayer(self))
	{
		Booze_DS_Bonus += 1;
		if(Booze_DS_Bonus == 45)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT,2);
			Snd_Play("LevelUp");
		};
	};
};

var int Wine_DS_Bonus;
const int HP_DS_Wine = 1;
const int MAna_DS_Wine = 5;
instance ItFo_Wine(C_Item)
{
	name = "Вино";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Wine;
	visual = "ItFo_Wine.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Wine;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_DS_Wine;
	text[2] = NAME_Bonus_Mana;
	count[2] = MAna_DS_Wine;
	text[5] = NAME_Value;
	count[5] = Value_Wine;
};
func void Use_Wine()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS_Wine);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_DS_Wine);
	if(Npc_IsPlayer(self))
	{
		Wine_DS_Bonus += 1;
		if(Wine_DS_Bonus == 40)
		{
			B_RaiseAttribute(self,ATR_DEXTERITY,1);
			Snd_Play("LevelUp");
		};
	};
};

var int Milk_DS_Bonus;
const int HP_DS_Milk = 10;
const int MAna_DS_Milk = 5;
instance ItFo_Milk(C_Item)
{
	name = "Молоко";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Milk;
	visual = "ItFo_Milk.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Milk;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Milk;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Milk;
	text[5] = NAME_Value;
	count[5] = Value_Milk;
};
func void Use_Milk()
{
	if(Npc_IsPlayer(self))
	{
		Milk_DS_Bonus += 1;
		if(Milk_DS_Bonus == 45)
		{
			B_RaiseAttribute(self,ATR_MANA_MAX,3);
			Snd_Play("LevelUp");
			Milk_DS_Bonus = 0;
		};
	};
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Milk);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Milk);
};

// Рагу Фила

instance ItFo_XP_Fill(C_Item)
{
	name = "Рагу Фила";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_XP_Fill;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Stew;
	text[2] = NAME_Bonus_Str;
	count[2] = 1;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};
func void Use_XP_Fill()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Stew);
	Snd_Play("LevelUp");
	B_RaiseAttribute(self,ATR_STRENGTH,1);
};

//Краденная еда,вино Грифа

instance ItFo_Wine_Grif_01(C_Item)
{
	name = "Вино";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Wine;
	visual = "ItFo_Wine.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_Wine_Grif_01;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Wine;
	text[2] = NAME_Bonus_Mana;
	count[2] = Mana_Wine;
	text[5] = NAME_Value;
	count[5] = Value_Wine;
};
func void Use_Wine_Grif_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wine);
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Wine);
};

instance ItFoMutton_Grif_01(C_Item)
{
	name = "Жареное мясо";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Meat;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemeName = "MEAT";
	on_state[0] = Use_Meat_Grif_01;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Meat;
	text[5] = NAME_Value;
	count[5] = Value_Meat;
};
func void Use_Meat_Grif_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Meat);
};

instance ItMi_UniversalWater(C_Item)
{
	name = "Универсальное зелье";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Water;
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_UniversalWater;
	description = name;
	text[1] = "Восстановит силу и ловкость";
	count[1] = 1;
	text[2] = "Укрепит дух и тело";
	count[2] = 20;
	text[5] = NAME_Value;
	count[5] = Value_Water;
};
func void Use_UniversalWater()
{
	self.attribute[ATR_STRENGTH] += 1;
	self.attribute[ATR_DEXTERITY] += 1;
	self.attribute[ATR_HITPOINTS_MAX] += 20;
	self.attribute[ATR_MANA_MAX] +=20;
	PrintScreen("Сила и ловкость: +1",-1,5,FONT_Screen,2);
	PrintScreen("Здоровье и мана: +20",-1,7,FONT_Screen,2);	
};

//-------------------------------------------------------------
//-------------------ИЗ ФАЙЛА по АДДОНУ------------------------


const int Value_Rum = 30;
const int Mana_Rum = 10;
const int Value_Grog = 10;
const int HP_Grog = 20;
const int Value_SchnellerHering = 30;
const int Value_LousHammer = 30;
const int Mana_LousHammer = 1;
const int Value_SchlafHammer = 60;
const int Value_FireStew = 180;
const int STR_FireStew = 1;
const int HP_FireStew = 5;
const int STR_MeatSoup = 1;
const int Value_Shellflesh = 60;
const int HP_Shellflesh = 20;

var int Shellflesh_DS_Bonus;
instance ItFo_Addon_Shellflesh(C_Item)
{
	name = "Мясо моллюска";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Shellflesh;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Shellflesh;
	description = name;
	text[0] = "Сочное мясо моллюска";
	text[2] = "Можно есть сырым";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Shellflesh()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	if(Npc_IsPlayer(self))
	{
		Shellflesh_DS_Bonus += 1;
		if(Shellflesh_DS_Bonus == 10)
		{
			B_RaiseAttribute(self,ATR_MANA_MAX,1);
			Snd_Play("LevelUp");
			Shellflesh_DS_Bonus = 0;
		};
	};
};

instance ItFo_Addon_Rum(C_Item)
{
	name = "Ром";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Rum;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseRum;
	scemeName = "POTIONFAST";
	description = "Белый ром";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Rum;
	text[5] = NAME_Value;
	count[5] = Value_Rum;
};
func void UseRum()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Rum);
};

instance ItFo_Addon_Grog(C_Item)
{
	name = "Грог";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Grog;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseGrog;
	scemeName = "POTIONFAST";
	description = "Настоящий грог моряков";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Grog;
	text[5] = NAME_Value;
	count[5] = Value_Grog;
};
func void UseGrog()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Grog);
};

var int Hammer_Once;

instance ItFo_Addon_LousHammer(C_Item)
{
	name = "Молот Лу";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_LousHammer;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseLouHammer;
	scemeName = "POTIONFAST";
	description = "Молот Лу";
	text[1] = "Эффект          ???";
	text[5] = NAME_Value;
	count[5] = Value_LousHammer;
};
func void UseLouHammer()
{
	if(Hammer_Once == FALSE)
	{
		B_RaiseAttribute(self,ATR_MANA_MAX,Mana_LousHammer);
		Hammer_Once = TRUE;
	};
};

instance ItFo_Addon_SchlafHammer(C_Item)
{
	name = "Двойной молот";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_SchlafHammer;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseSchlafHammer;
	scemeName = "POTIONFAST";
	description = "Двойной молот";
	text[1] = "Способно свалить с ног любого...";
	text[5] = NAME_Value;
	count[5] = Value_SchlafHammer;
};
func void UseSchlafHammer()
{
	if(self.attribute[ATR_HITPOINTS] > 2)
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] / 2;
	};
};

instance ItFo_Addon_SchnellerHering(C_Item)
{
	name = "Быстрая селедка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_SchnellerHering;
	visual = "ItMi_Rum_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseSchnellerHering;
	scemeName = "POTIONFAST";
	description = "Выглядит подозрительно!";
	text[1] = "Эффект неизвестен.";
	text[2] = "Возможны побочные эффекты";
	text[5] = NAME_Value;
	count[5] = Value_SchnellerHering;
};
func void UseSchnellerHering()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",120000);
	};
};

instance ItFo_Addon_Pfeffer_01(C_Item)
{
	name = "Мешочек с перцем";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = "Красный жгучий перец";
	text[0] = "с южных островов";
	text[3] = "ОСТОРОЖНО, ЖГУЧИЙ!";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItFo_Addon_FireStew(C_Item)
{
	name = "Пламенная нарезка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_FireStew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_FireStew;
	description = name;
	text[1] = NAME_Bonus_Str;
	count[1] = STR_FireStew;
	text[5] = NAME_Value;
	count[5] = Value_FireStew;
};
func void Use_FireStew()
{
	B_RaiseAttribute(self,ATR_STRENGTH,STR_FireStew);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_FireStew);
	PrintScreen("Повышение силы и здоровья!",-1,34,FONT_ScreenSmall,2);
};

instance ItFo_Addon_Meatsoup(C_Item)
{
	name = "Мясная похлебка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_FishSoup;
	visual = "ItFo_FishSoup.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_MeatSoup;
	description = "Дымящаяся мясная похлебка";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_MeatSoup;
	text[5] = NAME_Value;
	count[5] = Value_FishSoup;
};
func void Use_MeatSoup()
{
	var string concatText;
	concatText = ConcatStrings(NAME_Bonus_Str,IntToString(STR_MeatSoup));
	B_RaiseAttribute(self,ATR_STRENGTH,STR_MeatSoup);
	PrintScreen(concatText,-1,34,FONT_ScreenSmall,2);
};
