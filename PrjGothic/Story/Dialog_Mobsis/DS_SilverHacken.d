
var int SilverMob_01_Amount;var int SilverMob_02_Amount;var int SilverMob_03_Amount;
var int SilverMob_04_Amount;var int SilverMob_05_Amount;var int SilverMob_06_Amount;
var int SilverMob_07_Amount;var int SilverMob_08_Amount;var int SilverMob_09_Amount;
var int SilverMob_10_Amount;var int SilverMob_11_Amount;
const int SilverMob_01_AmounT_MAX = 12;
const int SilverMob_02_AmounT_MAX = 12;
const int SilverMob_03_AmounT_MAX = 11;
const int SilverMob_04_AmounT_MAX = 10;
const int SilverMob_05_AmounT_MAX = 11;
const int SilverMob_06_AmounT_MAX = 11;
const int SilverMob_07_AmounT_MAX = 12;
const int SilverMob_08_AmounT_MAX = 11;
const int SilverMob_09_AmounT_MAX = 10;
const int SilverMob_10_AmounT_MAX = 11;
const int SilverMob_11_AmounT_MAX = 11;
const string SilverMob_07_WP = "DS_SILVERORE_01";
const string SilverMob_08_WP = "DS_SILVERORE_02";
const string SilverMob_09_WP = "DS_SILVERORE_03";
const string SilverMob_10_WP = "DS_SILVERORE_04";
const string SilverMob_11_WP = "DS_SILVERORE_05";


func int B_SilverMob_Bestimmung()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(hero),"OC_ORC_HACKEN_SILVER_01") && (SilverMob_01_AmounT_MAX > SilverMob_01_Amount))
	{
		SilverMob_01_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"OM_LEVEL_02_SILVER_ORE_01") && (SilverMob_02_AmounT_MAX > SilverMob_02_Amount))
	{
		SilverMob_02_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"OM_LEVEL_02_SILVER_ORE_02") && (SilverMob_03_AmounT_MAX > SilverMob_03_Amount))
	{
		SilverMob_03_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"OM_LEVEL_02_SILVER_ORE_03") && (SilverMob_04_AmounT_MAX > SilverMob_04_Amount))
	{
		SilverMob_04_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"OM_LEVEL_02_SILVER_ORE_04") && (SilverMob_05_AmounT_MAX > SilverMob_05_Amount))
	{
		SilverMob_05_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"OM_LEVEL_02_SILVER_ORE_05") && (SilverMob_06_AmounT_MAX > SilverMob_06_Amount))
	{
		SilverMob_06_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),SilverMob_07_WP) && (SilverMob_07_AmounT_MAX > SilverMob_07_Amount))
	{
		SilverMob_07_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),SilverMob_08_WP) && (SilverMob_08_AmounT_MAX > SilverMob_08_Amount))
	{
		SilverMob_08_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),SilverMob_09_WP) && (SilverMob_09_AmounT_MAX > SilverMob_09_Amount))
	{
		SilverMob_09_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),SilverMob_10_WP) && (SilverMob_10_AmounT_MAX > SilverMob_10_Amount))
	{
		SilverMob_10_Amount += 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),SilverMob_11_WP) && (SilverMob_11_AmounT_MAX > SilverMob_11_Amount))
	{
		SilverMob_11_Amount += 1;
		return TRUE;
	};
	return FALSE;
};	

var int SilverCounter;
var int SilverTruemmer_Count;
var int SilverHeroOne;

instance PC_DS_SilverHacken_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_ds_SilverHacken_end_condition;
	information = pc_ds_SilverHacken_end_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int pc_ds_SilverHacken_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SILVEROREHACKEN)
	{
		return TRUE;
	};
};

func void pc_ds_SilverHacken_end_info()
{
	SilverTruemmer_Count = 0;
	b_endproductiondialog();
};

instance PC_SilverHacken_Ds_Hour(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_SilverHacken_Ds_Hour_Condition;
	information = PC_SilverHacken_Ds_Hour_Info;
	permanent = TRUE;
	description = "Ударить несильно.";
};

func int PC_SilverHacken_Ds_Hour_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SILVEROREHACKEN)
	{
		return TRUE;
	};
};

//var int Learn_Silver_by_doing;

func void PC_SilverHacken_Ds_Hour_Info()
{
	PC_BrilliantHacken_Ds_Hour_Info();
	var int CurrentChance;
	var int MultiSilver;
	var int Dop_Chance;
	LEARN_DS_MAGICORE_BY_DOING = LEARN_DS_MAGICORE_BY_DOING + 1;
	if(LEARN_DS_MAGICORE_BY_DOING == 10)
	{
		b_upgrade_hero_magicorehackchance(3);
	}
	else if(LEARN_DS_MAGICORE_BY_DOING == 25)
	{
		b_upgrade_hero_magicorehackchance(4);
	}
	else if(LEARN_DS_MAGICORE_BY_DOING == 40)
	{
		b_upgrade_hero_magicorehackchance(5);
	};
	CurrentChance = Hlp_Random(100);
	MultiSilver = Hlp_Random(100);
	if(KNOWS_MAGICORETRUEMMERSCHLAG == TRUE)
	{
		Dop_Chance = Hlp_Random(2);
	};
	if(B_SilverMob_Bestimmung() == TRUE)
	{
		if((HERO_MAGICOREHACKCHANCE >= CurrentChance) || (Dop_Chance == TRUE))
		{
			if((MAGICORECOUNTER >= 25) && (MultiSilver >= 96))
			{
				CreateInvItems(hero,ItMi_SilverOre_Nugget,4);
				PrintScreen("Добыто 4 серебряных самородка!",-1,35,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
			}
			else if((MAGICORECOUNTER >= 15) && (MultiSilver >= 72))
			{
				CreateInvItems(hero,ItMi_SilverOre_Nugget,3);
				PrintScreen("Добыто 3 серебряных самородка!",-1,36,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER += 1;
			}
			else if((MAGICORECOUNTER >= 7) && (MultiSilver >= 40))
			{
				CreateInvItems(hero,ItMi_SilverOre_Nugget,2);
				PrintScreen("Добыто 2 серебряных самородка!",-1,37,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER += 1;
			}
			else
			{
				CreateInvItems(hero,ItMi_SilverOre_Nugget,1);
				PrintScreen("Добыт 1 серебряный самородок!",-1,38,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER += 1;
			};
			B_GivePlayerXP(5);
		}
		else
		{
			PrintScreen("Серебряные осколки разлетаются во все стороны...",-1,34,FONT_ScreenSmall,2);
			MAGICORETRUEMMER_COUNT += 1;
		};
	}
	else
	{
		PrintScreen(PRINT_DS_NOTHINGTOGET_THERE,-1,-1,FONT_ScreenSmall,2);
		b_endproductiondialog();
	};
};

func void SilverHacken_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SILVEROREHACKEN;
		AI_ProcessInfos(hero);
	};
	PC_SilverHacken_Ds_Hour.description = "Ударить несильно.";
};
