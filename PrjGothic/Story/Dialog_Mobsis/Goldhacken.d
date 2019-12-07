var int GoldMob_01_Amount;
var int GoldMob_02_Amount;
var int GoldMob_03_Amount;
var int GoldMob_04_Amount;
var int GoldMob_05_Amount;
var int GoldMob_06_Amount;
var int GoldMob_07_Amount;
var int GoldMob_08_Amount;
var int GoldMob_09_Amount;
var int GoldMob_10_Amount;
var int GoldMob_11_Amount;
var int GoldMob_12_Amount;
var int GoldMob_13_Amount;
var int GoldMob_14_Amount;
var int GoldMob_15_Amount;
var int GoldMob_16_Amount;
var int GoldMob_17_Amount;
var int GoldMob_18_Amount;
var int GoldMob_19_Amount;
var int GoldMob_20_Amount;
const int GoldMob_01_AmounT_MAX = 5;
const int GoldMob_02_AmounT_MAX = 5;
const int GoldMob_03_AmounT_MAX = 5;
const int GoldMob_04_AmounT_MAX = 5;
const int GoldMob_12_AmounT_MAX = 7;
const int GoldMob_05_AmounT_MAX = 9;
const int GoldMob_06_AmounT_MAX = 9;
const int GoldMob_07_AmounT_MAX = 9;
const int GoldMob_08_AmounT_MAX = 15;
const int GoldMob_09_AmounT_MAX = 15;
const int GoldMob_10_AmounT_MAX = 18;
const int GoldMob_11_AmounT_MAX = 18;
const int GoldMob_13_AmounT_MAX = 12;
const int GoldMob_14_AmounT_MAX = 13;
const int GoldMob_15_AmounT_MAX = 14;
const int GoldMob_16_AmounT_MAX = 15;
const int GoldMob_17_AmounT_MAX = 16;
const int GoldMob_18_AmounT_MAX = 17;
const int GoldMob_19_AmounT_MAX = 18;
const int GoldMob_20_AmounT_MAX = 19;

func int B_GoldMob_Bestimmung()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_01") && (GoldMob_01_AmounT_MAX > GoldMob_01_Amount))
	{
		GoldMob_01_Amount = GoldMob_01_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_02") && (GoldMob_02_AmounT_MAX > GoldMob_02_Amount))
	{
		GoldMob_02_Amount = GoldMob_02_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_03") && (GoldMob_03_AmounT_MAX > GoldMob_03_Amount))
	{
		GoldMob_03_Amount = GoldMob_03_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_04") && (GoldMob_04_AmounT_MAX > GoldMob_04_Amount))
	{
		GoldMob_04_Amount = GoldMob_04_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_05") && (GoldMob_05_AmounT_MAX > GoldMob_05_Amount))
	{
		GoldMob_05_Amount = GoldMob_05_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_06") && (GoldMob_06_AmounT_MAX > GoldMob_06_Amount))
	{
		GoldMob_06_Amount = GoldMob_06_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_07") && (GoldMob_07_AmounT_MAX > GoldMob_07_Amount))
	{
		GoldMob_07_Amount = GoldMob_07_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_08") && (GoldMob_08_AmounT_MAX > GoldMob_08_Amount))
	{
		GoldMob_08_Amount = GoldMob_08_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_09") && (GoldMob_09_AmounT_MAX > GoldMob_09_Amount))
	{
		GoldMob_09_Amount = GoldMob_09_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_10") && (GoldMob_10_AmounT_MAX > GoldMob_10_Amount))
	{
		GoldMob_10_Amount = GoldMob_10_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_11") && (GoldMob_11_AmounT_MAX > GoldMob_11_Amount))
	{
		GoldMob_11_Amount = GoldMob_11_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_12") && (GoldMob_12_AmounT_MAX > GoldMob_12_Amount))
	{
		GoldMob_12_Amount = GoldMob_12_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_13") && (GoldMob_13_AmounT_MAX > GoldMob_13_Amount))
	{
		GoldMob_13_Amount = GoldMob_13_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_14") && (GoldMob_14_AmounT_MAX > GoldMob_14_Amount))
	{
		GoldMob_14_Amount = GoldMob_14_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_15") && (GoldMob_15_AmounT_MAX > GoldMob_15_Amount))
	{
		GoldMob_15_Amount = GoldMob_15_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_16") && (GoldMob_16_AmounT_MAX > GoldMob_16_Amount))
	{
		GoldMob_16_Amount = GoldMob_16_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_17") && (GoldMob_17_AmounT_MAX > GoldMob_17_Amount))
	{
		GoldMob_17_Amount = GoldMob_17_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_18") && (GoldMob_18_AmounT_MAX > GoldMob_18_Amount))
	{
		GoldMob_18_Amount = GoldMob_18_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_19") && (GoldMob_19_AmounT_MAX > GoldMob_19_Amount))
	{
		GoldMob_19_Amount = GoldMob_19_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),"SW_GOLD_MINE_ORE_20") && (GoldMob_20_AmounT_MAX > GoldMob_20_Amount))
	{
		GoldMob_20_Amount = GoldMob_20_Amount + 1;
		return TRUE;
	};
	return FALSE;
};

func void Goldhacken_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_GOLDHACKEN;
		AI_ProcessInfos(hero);
	};
};

instance PC_Goldhacken_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Goldhacken_End_Condition;
	information = PC_Goldhacken_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int PC_Goldhacken_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};
func void PC_Goldhacken_End_Info()
{
	b_endproductiondialog();
};

instance PC_Goldhacken_Addon_Hour(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Goldhacken_Addon_Hour_Condition;
	information = PC_Goldhacken_Addon_Hour_Info;
	permanent = TRUE;
	description = "Ударить несильно.";
};
func int PC_Goldhacken_Addon_Hour_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	{
		return TRUE;
	};
};

var int GoldCounter;

func void PC_Goldhacken_Addon_Hour_Info()
{
	var int CurrentChance;
	var int MultiGold;
	var int Dop_Chance;
	LEARN_DS_MAGICORE_BY_DOING += 1;
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
	MultiGold = Hlp_Random(100);
	if(KNOWS_MAGICORETRUEMMERSCHLAG == TRUE)
	{
		Dop_Chance = Hlp_Random(2);
	};
	if(B_GoldMob_Bestimmung() == TRUE)
	{
		if((HERO_MAGICOREHACKCHANCE >= CurrentChance) || (Dop_Chance == TRUE))
		{
			if((MAGICORECOUNTER >= 25) && (MultiGold >= 96))
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,4);
				PrintScreen("Добыто 4 золотых самородка!",-1,35,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
			}
			else if((MAGICORECOUNTER >= 15) && (MultiGold >= 72))
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,3);
				PrintScreen("Добыто 3 золотых самородка!",-1,36,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER += 1;
			}
			else if((MAGICORECOUNTER >= 7) && (MultiGold >= 40))
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,2);
				PrintScreen("Добыто 2 золотых самородка!",-1,37,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER += 1;
			}
			else
			{
				CreateInvItems(hero,ItMi_GoldNugget_Addon,1);
				PrintScreen("Добыт 1 золотой самородок!",-1,38,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER += 1;
			};
			B_GivePlayerXP(5);
		}
		else
		{
			PrintScreen("Золотые осколки разлетаются во все стороны...",-1,34,FONT_ScreenSmall,2);
			MAGICORETRUEMMER_COUNT += 1;
		};
	}
	else
	{
		PrintScreen(PRINT_DS_NOTHINGTOGET_THERE,-1,-1,FONT_ScreenSmall,2);
		b_endproductiondialog();
	};
};
