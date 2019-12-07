
const int Value_BCKopf = 50;
const int Value_Meatbugflesh = 10;
const int Value_SheepFur = 10;
const int Value_WolfFur = 10;
const int Value_BugMandibles = 15;
const int Value_Claw = 15;
const int Value_LurkerClaw = 15;
const int Value_Teeth = 15;
const int Value_CrawlerMandibles = 15;
const int Value_Wing = 20;
const int Value_Sting = 25;
const int Value_ReptileSkin = 25;
const int Value_WargFur = 25;  
const int Value_DrgSnapperHorn = 100;
const int Value_CrawlerPlate = 50;
const int Value_ShadowFur = 250;
const int Value_SharkSkin = 200;
const int Value_TrollFur = 300;
const int Value_WaranFiretongue = 300;
const int Value_ShadowHorn = 300;
const int Value_SharkTeeth = 300;
const int Value_TrollTooth = 300;
const int Value_TrollBlackFur = 350;
const int Value_GoblinBone = 10;
const int Value_SkeletonBone = 10;
const int Value_DemonHeart = 300;
const int Value_StoneGolemHeart = 300;
const int Value_FireGolemHeart = 300;
const int Value_IceGolemHeart = 300;
//const int Value_UndeadDragonSoulStone = 400;
//const int Value_IcedragonHeart = 400;
//const int Value_FiredragonHeart = 400;
//const int Value_SwampdragonHeart = 400;
//const int Value_RockdragonHeart = 400;
//const int Value_DragonBlood = 200;
//const int Value_DragonScale = 200;
const int Value_Keilerfur = 15;
const int Value_ZombiePrah = 1;
const int Value_KeeperKryptHeart = 600;
const int Value_KarakusCanine = 55;
const int Value_FireshadBlood = 20;
const int Value_HarpyBlood = 15;
const int Value_IcewolfBlood = 10;
//DSG
const int Value_DSG_AnimalBlood = 5;

instance ItAt_Addon_BCKopf(C_Item)
{
	name = "Голова";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS";
	material = MAT_LEATHER;
	description = "Голова богомола";
	text[5] = NAME_Value;
	count[5] = value;
};

var int Meatbugflesh_DS_Bonus;
instance ItAt_Meatbugflesh(C_Item)
{
	name = "Мясо жука";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Meatbugflesh;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Meatbugflesh;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Meatbugflesh()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
	if(Npc_IsPlayer(self))
	{
		Meatbugflesh_DS_Bonus += 1;
		if(Meatbugflesh_DS_Bonus == 5)
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
			Snd_Play("LevelUp");
			Meatbugflesh_DS_Bonus = 0;
		};
	};
};

instance ItAt_SheepFur(C_Item)
{
	name = "Овечья шкура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SheepFur;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_WolfFur(C_Item)
{
	name = "Волчья шкура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WolfFur;
	visual = "ItAt_WolfFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_BugMandibles(C_Item)
{
	name = "Жвала полевого хищника";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BugMandibles;
	visual = "ItAt_BugMandibles.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Claw(C_Item)
{
	name = "Когти";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Claw;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_LurkerClaw(C_Item)
{
	name = "Когти шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_LurkerClaw;
	visual = "ItAt_LurkerClaw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Teeth(C_Item)
{
	name = "Зубы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Teeth;
	visual = "ItAt_Teeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_CrawlerMandibles(C_Item)
{
	name = "Жвала ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_CrawlerMandibles;
	visual = "ItAt_CrawlerMandibles.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = Use_Mandibles;
	description = name;
	text[0] = "Эти жвала можно открыть,";
	text[1] = "чтобы выпить железы, находящиеся внутри.";
	text[2] = "Они регенерируют вашу магическую энергию.";
	text[3] = "Эффект снижается со временем.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Mandibles()
{
	if(Mandibles_Bonus <= 9)
	{
		Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX]);
		Mandibles_Bonus = Mandibles_Bonus + 1;
	}
	else
	{
		PrintScreen(PRINT_Mandibles,-1,YPOS_LevelUp,FONT_ScreenSmall,2);
	};
};

instance ItAt_Wing(C_Item)
{
	name = "Крылья";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wing;
	visual = "ItAt_Wing.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Sting(C_Item)
{
	name = "Жало";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sting;
	scemeName = "FOOD";
	on_state[0] = Use_Sting;
	visual = "ItAt_Sting.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Это жало";
	text[2] = "содержит яд.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Sting()
{
	if(Knows_Bloodfly == TRUE)
	{
		if(Bloodfly_Bonus <= 10)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
			Print(PRINT_FullyHealed);
			Bloodfly_Bonus = Bloodfly_Bonus + 1;
		}
		else
		{
			Print(PRINT_Mandibles);
		};
	}
	else
	{
		Print(PRINT_Bloodfly);
		if(self.attribute[ATR_HITPOINTS] > 1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1;
		};
	};
};


instance itat_LurkerSkin(C_Item)
{
	name = "Шкура рептилии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_ReptileSkin;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_WargFur(C_Item)
{
	name = "Шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WargFur;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Addon_KeilerFur(C_Item)
{
	name = "Шкура кабана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Keilerfur;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_DrgSnapperHorn(C_Item)
{
	name = "Рог драконьего снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DrgSnapperHorn;
	visual = "ItAt_DrgSnapperHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_CrawlerPlate(C_Item)
{
	name = "Панцирь ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_CrawlerPlate;
	visual = "ItAt_CrawlerPlate.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowFur(C_Item)
{
	name = "Шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_ShadowFur;
	visual = "ItAt_ShadowFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_SharkSkin(C_Item)
{
	name = "Шкура речного червя";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SharkSkin;
	visual = "ItAt_SharkSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_TrollFur(C_Item)
{
	name = "Шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_TrollFur;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_TrollBlackFur(C_Item)
{
	name = "Шкура черного тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_TrollBlackFur;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_WaranFiretongue(C_Item)
{
	name = "Огненный язык";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WaranFiretongue;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowHorn(C_Item)
{
	name = "Рог мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_ShadowHorn;
	visual = "ItAt_ShadowHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_SharkTeeth(C_Item)
{
	name = "Зубы речного червя";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SharkTeeth;
	visual = "ItAt_SharkTeeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_TrollTooth(C_Item)
{
	name = "Клык тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_TrollTooth;
	visual = "ItAt_TrollTooth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ItAt_StoneGolemHeart(C_Item)
{
	name = "Сердце каменного голема";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_StoneGolemHeart;
	visual = "ItAt_StoneGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_FireGolemHeart(C_Item)
{
	name = "Сердце огненного голема";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_FireGolemHeart;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_IceGolemHeart(C_Item)
{
	name = "Сердце Ледяного голема";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_IceGolemHeart;
	visual = "ItAt_IceGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_DS_StormGolemHeart(C_Item)
{
	name = "Сердце Вихревого голема";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_IceGolemHeart;
	visual = "ItAt_IceGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_GoblinBone(C_Item)
{
	name = "Кость гоблина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoblinBone;
	visual = "ItAt_GoblinBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_SkeletonBone(C_Item)
{
	name = "Кость скелета";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SkeletonBone;
	visual = "ItAt_SkeletonBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_DemonHeart(C_Item)
{
	name = "Сердце демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DemonHeart;
	visual = "ItAt_DemonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

// ds

instance ItAt_IcewolfBlood(C_Item)
{
	name = "Кровь ледяного волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VAlue_IcewolfBlood;			//10
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItAt_FireshadBlood(C_Item)
{
	name = "Кровь огненного мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VAlue_FireshadBlood;			//20
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};


instance ItAt_HarpyBlood(C_Item)
{
	name = "Кровь гарпии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HarpyBlood;				//15
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

//DSG
instance ItAt_DSG_AnimalBlood(C_Item)
{
	name = "Кровь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DSG_AnimalBlood;				//5
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_GLAS;
	description = name;
	text[2] = "Кровь обычного животного";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

// Трофеи новых животных(краура, каракуса, волка-нежити, рудогрыза, хранителя склепов, ловчего, королевы ползунов)

instance ItAt_Canine_Karakus(C_Item)
{
	name = "Клык каракуса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_KarakusCanine;
	visual = "ItAt_Canine_Karakus.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItAt_Armour_Kraur(C_Item)
{
	name = "Панцирь краура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Teeth;
	visual = "ItAt_Armour_Kraur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Bone_WolfZombie(C_Item)
{
	name = "Кость волка-нежити";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Teeth;
	visual = "ItAt_Bone_WolfZombie.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Claw_Rudogriz(C_Item)
{
	name = "Клешня рудогрыза";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Teeth;
	visual = "ItAt_Claw_Rudogriz.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
const int Value_Egg_CrawlerQueen = 5000;

instance ItAt_Egg_CrawlerQueen(C_Item)
{
	name = "Яйцо кровяной королевы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Egg_CrawlerQueen;
	visual = "ITMICRAWLEREGG.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_EggBroken_CrawlerQueen(C_Item)
{
	name = "Разбитое яйцо ползунов";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Egg_CrawlerQueen;
	visual = "CR_DI_OPENEGG.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Возможно из него";
	text[1] = "кто-то уже вылупился.";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Spider_Crawler(C_Item)
{
	name = "Паутина ползунов";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ITAT_CRAWLERSpider.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Очень легкая";
	text[1] = "и прозрачная";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Heart_KeeperKrypt(C_Item)
{
	name = "Сердце хранителя склепов";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_KeeperKryptHeart;
	visual = "ItAt_DemonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

//Жила ящерицы
const int Value_VeinLizard = 150;
instance ItAt_VeinLizard(C_Item)
{
	name = "Жила ящерицы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_VeinLizard;
	visual = "ItAt_VeinLizard.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

//Прах зомби

instance ItAt_Prah_Zombie(C_Item)
{
	name = "Прах";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_ZombiePrah;
	visual = "ItMi_Sulfur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
//--------Обработанные шкуры с умением от Даниэль---------------------

const int Value_DS_SheepFur_H = 15;
const int Value_DS_WolfFur_H = 15;
const int Value_DS_Keilerfur_H = 20;
const int Value_DS_WargFur_H = 30;
const int Value_DS_ShadowFur_H = 350;
const int Value_DS_TrollFur_H = 420;
const int Value_DS_TrollBlackFur_H = 500;

instance ItAt_DS_SheepFur_H(C_Item)
{
	name = "Обработанная овечья шкура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS_SheepFur_H;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_DS_WolfFur_H(C_Item)
{
	name = "Обработанная волчья шкура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS_WolfFur_H;
	visual = "ItAt_WolfFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_DS_KeilerFur_H(C_Item)
{
	name = "Обработанная шкура кабана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS_Keilerfur_H;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_DS_WargFur_H(C_Item)
{
	name = "Обработанная шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS_WargFur_H;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_DS_ShadowFur_H(C_Item)
{
	name = "Обработанная шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS_ShadowFur_H;
	visual = "ItAt_ShadowFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_DS_TrollFur_H(C_Item)
{
	name = "Обработанная шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS_TrollFur_H;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_DS_TrollBlackFur_H(C_Item)
{
	name = "Обработанная шкура черного тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS_TrollBlackFur_H;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

