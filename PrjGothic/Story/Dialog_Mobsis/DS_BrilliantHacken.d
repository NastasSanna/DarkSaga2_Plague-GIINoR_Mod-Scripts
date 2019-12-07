
var int BrilliantMob_01_Amount;
var int BrilliantMob_02_Amount;
var int BrilliantMob_03_Amount;
var int BrilliantMob_04_Amount;
var int BrilliantMob_05_Amount;
var int BrilliantMob_06_Amount;
var int BrilliantMob_07_Amount;
var int BrilliantMob_08_Amount;
var int BrilliantMob_09_Amount;
var int BrilliantMob_10_Amount;
var int BrilliantMob_11_Amount;
var int BrilliantMob_12_Amount;
var int BrilliantMob_13_Amount;
var int BrilliantMob_14_Amount;
const int BrilliantMob_01_AmounT_MAX = 8;
const int BrilliantMob_02_AmounT_MAX = 8;
const int BrilliantMob_03_AmounT_MAX = 8;
const int BrilliantMob_04_AmounT_MAX = 8;
const int BrilliantMob_05_AmounT_MAX = 8;
const int BrilliantMob_06_AmounT_MAX = 8;
const int BrilliantMob_07_AmounT_MAX = 8;
const int BrilliantMob_08_AmounT_MAX = 8;
const int BrilliantMob_09_AmounT_MAX = 8;
const int BrilliantMob_10_AmounT_MAX = 8;
const int BrilliantMob_11_AmounT_MAX = 8;
const int BrilliantMob_12_AmounT_MAX = 8;
const int BrilliantMob_13_AmounT_MAX = 8;
const int BrilliantMob_14_AmounT_MAX = 8;

const string BrilliantMob_01_WP = "DS_IRONORE_01";
const string BrilliantMob_02_WP = "DS_IRONORE_02";
const string BrilliantMob_03_WP = "DS_IRONORE_03";
const string BrilliantMob_04_WP = "DS_IRONORE_04";
const string BrilliantMob_05_WP = "DS_IRONORE_05";
const string BrilliantMob_06_WP = "DS_IRONORE_06";
const string BrilliantMob_07_WP = "DS_IRONORE_07";
const string BrilliantMob_08_WP = "DS_IRONORE_08";
const string BrilliantMob_09_WP = "DS_IRONORE_09";
const string BrilliantMob_10_WP = "DS_SILVERORE_01";
const string BrilliantMob_11_WP = "DS_SILVERORE_02";
const string BrilliantMob_12_WP = "DS_SILVERORE_03";
const string BrilliantMob_13_WP = "DS_SILVERORE_04";
const string BrilliantMob_14_WP = "DS_SILVERORE_05";
func void B_DS_WP_BrilliantMobIs()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_01_WP))
	{BrilliantMob_01_Amount = BrilliantMob_01_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_02_WP))
	{BrilliantMob_02_Amount = BrilliantMob_02_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_03_WP))
	{BrilliantMob_03_Amount = BrilliantMob_03_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_04_WP))
	{BrilliantMob_04_Amount = BrilliantMob_04_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_05_WP))
	{BrilliantMob_05_Amount = BrilliantMob_05_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_06_WP))
	{BrilliantMob_06_Amount = BrilliantMob_06_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_07_WP))
	{BrilliantMob_07_Amount = BrilliantMob_07_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_08_WP))
	{BrilliantMob_08_Amount = BrilliantMob_08_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_09_WP))
	{BrilliantMob_09_Amount = BrilliantMob_09_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_10_WP))
	{BrilliantMob_10_Amount = BrilliantMob_10_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_11_WP))
	{BrilliantMob_11_Amount = BrilliantMob_11_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_12_WP))
	{BrilliantMob_12_Amount = BrilliantMob_12_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_13_WP))
	{BrilliantMob_13_Amount = BrilliantMob_13_AmounT_MAX;	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_14_WP))
	{BrilliantMob_14_Amount = BrilliantMob_14_AmounT_MAX;	};
};
func int B_BrilliantMob_Bestimmung()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_01_WP) && (BrilliantMob_01_AmounT_MAX > BrilliantMob_01_Amount))
	{
		BrilliantMob_01_Amount = BrilliantMob_01_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_02_WP) && (BrilliantMob_02_AmounT_MAX > BrilliantMob_02_Amount))
	{
		BrilliantMob_02_Amount = BrilliantMob_02_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_03_WP) && (BrilliantMob_03_AmounT_MAX > BrilliantMob_03_Amount))
	{
		BrilliantMob_03_Amount = BrilliantMob_03_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_04_WP) && (BrilliantMob_04_AmounT_MAX > BrilliantMob_04_Amount))
	{
		BrilliantMob_04_Amount = BrilliantMob_04_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_05_WP) && (BrilliantMob_05_AmounT_MAX > BrilliantMob_05_Amount))
	{
		BrilliantMob_05_Amount = BrilliantMob_05_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_06_WP) && (BrilliantMob_06_AmounT_MAX > BrilliantMob_06_Amount))
	{
		BrilliantMob_06_Amount = BrilliantMob_06_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_07_WP) && (BrilliantMob_07_AmounT_MAX > BrilliantMob_07_Amount))
	{
		BrilliantMob_07_Amount = BrilliantMob_07_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_08_WP) && (BrilliantMob_08_AmounT_MAX > BrilliantMob_08_Amount))
	{
		BrilliantMob_08_Amount = BrilliantMob_08_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_09_WP) && (BrilliantMob_09_AmounT_MAX > BrilliantMob_09_Amount))
	{
		BrilliantMob_09_Amount = BrilliantMob_09_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_10_WP) && (BrilliantMob_10_AmounT_MAX > BrilliantMob_10_Amount))
	{
		BrilliantMob_10_Amount = BrilliantMob_10_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_11_WP) && (BrilliantMob_11_AmounT_MAX > BrilliantMob_11_Amount))
	{
		BrilliantMob_11_Amount = BrilliantMob_11_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_12_WP) && (BrilliantMob_12_AmounT_MAX > BrilliantMob_12_Amount))
	{
		BrilliantMob_12_Amount = BrilliantMob_12_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),BrilliantMob_13_WP) && (BrilliantMob_13_AmounT_MAX > BrilliantMob_13_Amount))
	{
		BrilliantMob_13_Amount = BrilliantMob_13_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),BrilliantMob_14_WP) && (BrilliantMob_14_AmounT_MAX > BrilliantMob_14_Amount))
	{
		BrilliantMob_14_Amount = BrilliantMob_14_Amount + 1;
		return TRUE;
	};
	return FALSE;
};	

var int BrilliantCounter;
var int BrilliantTruemmer_Count;
var int BrilliantHeroOne;

instance PC_DS_BrilliantHacken_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_ds_BrilliantHacken_end_condition;
	information = pc_ds_BrilliantHacken_end_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int pc_ds_BrilliantHacken_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_BrilliantHACKEN)
	{
		return TRUE;
	};
};
func void pc_ds_BrilliantHacken_end_info()
{
	BrilliantTruemmer_Count = 0;
	b_endproductiondialog();
};

instance PC_BrilliantHacken_Ds_Hour(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_BrilliantHacken_Ds_Hour_Condition;
	information = PC_BrilliantHacken_Ds_Hour_Info;
	permanent = TRUE;
	description = "Ударить несильно.";
};
func int PC_BrilliantHacken_Ds_Hour_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_BrilliantHACKEN)
	{
		return TRUE;
	};
};
var int Topaz_Or_Ametist;
func void PC_BrilliantHacken_Ds_Hour_Info()
{
	var int CurrentChance;
	var int MultiBrilliant;	
	//LEARN_DS_MAGICORE_BY_DOING = LEARN_DS_MAGICORE_BY_DOING + 1;
	//if(LEARN_DS_MAGICORE_BY_DOING == 10)
	//{
	//	b_upgrade_hero_magicorehackchance(3);
	//}
	//else if(LEARN_DS_MAGICORE_BY_DOING == 25)
	//{
	//	b_upgrade_hero_magicorehackchance(4);
	//}
	//else if(LEARN_DS_MAGICORE_BY_DOING == 40)
	//{
	//	b_upgrade_hero_magicorehackchance(5);
	//};
	CurrentChance = Hlp_Random(100);
	MultiBrilliant = Hlp_Random(100);
	//Topaz_Or_Ametist = Hlp_Random(6);
	if(B_BrilliantMob_Bestimmung() == TRUE)
	{
		if(MultiBrilliant >= 75)
	  {
			if(Topaz_Or_Ametist == FALSE)
			{
				CreateInvItems(hero,ItMi_DS_Ametist,2);
				PrintScreen("Добыто 2 аметиста!",-1,-1,FONT_ScreenSmall,2);
				Topaz_Or_Ametist = TRUE;
			}
			else
			{
				CreateInvItems(hero,ItMi_DS_Topaz,2);
				PrintScreen("Добыто 2 топаза!",-1,-1,FONT_ScreenSmall,2);
				Topaz_Or_Ametist = FALSE;
			};
			BrilliantTruemmer_Count = 0;
			B_DS_WP_BrilliantMobIs();
		}
		else if(MultiBrilliant >= 50)
		{
			if(Topaz_Or_Ametist == FALSE)
			{
				CreateInvItems(hero,ItMi_DS_Ametist,1);
				PrintScreen("Добыт 1 аметист!",-1,-1,FONT_ScreenSmall,2);
				Topaz_Or_Ametist = TRUE;
			}
			else
			{
				CreateInvItems(hero,ItMi_DS_Topaz,1);
				PrintScreen("Добыт 1 топаз!",-1,-1,FONT_ScreenSmall,2);
				Topaz_Or_Ametist = FALSE;
			};
			BrilliantTruemmer_Count = 0;
			BrilliantCounter = BrilliantCounter + 1;
			B_DS_WP_BrilliantMobIs();
		}		
		else
		{
			PrintScreen("Сверкающие осколки разлетаются во все стороны...",-1,30,FONT_ScreenSmall,2);
			BrilliantTruemmer_Count = BrilliantTruemmer_Count + 1;
		};
	};
	/*
	else
	{
		PrintScreen(PRINT_DS_NOTHINGTOGET_THERE,-1,-1,FONT_ScreenSmall,2);
		b_endproductiondialog();
	};*/
};

func void BrilliantHacken_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_BrilliantHACKEN;
		AI_ProcessInfos(hero);
	};
	PC_BrilliantHacken_Ds_Hour.description = "Ударить несильно.";
};
const int SUM_DS_IronAndSilverOre = 14;	//Сумма жил железных и серебряных
const int Amount_DS_Topaz = 16;
const int Amount_DS_Ametist = 16;

func void ds_brilliant_hack()
{
	var int RandyChance_BrilliantHack;
	RandyChance_BrilliantHack = Hlp_Random(100);
};
