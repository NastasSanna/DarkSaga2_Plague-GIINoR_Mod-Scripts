
var int WoodMob_01_Amount;
var int WoodMob_02_Amount;
var int WoodMob_03_Amount;
var int WoodMob_04_Amount;
var int WoodMob_05_Amount;
var int WoodMob_06_Amount;
var int WoodMob_07_Amount;
var int WoodMob_08_Amount;
var int WoodMob_09_Amount;
var int WoodMob_10_Amount;
var int WoodMob_11_Amount;
var int WoodMob_12_Amount;
var int WoodMob_13_Amount;
var int WoodMob_14_Amount;
var int WoodMob_15_Amount;
var int WoodMob_16_Amount;
var int WoodMob_17_Amount;
var int WoodMob_18_Amount;
var int WoodMob_19_Amount;
var int WoodMob_20_Amount;
const int WoodMob_01_AmounT_MAX = 12;
const int WoodMob_02_AmounT_MAX = 12;
const int WoodMob_03_AmounT_MAX = 11;
const int WoodMob_04_AmounT_MAX = 10;
const int WoodMob_05_AmounT_MAX = 11;
const int WoodMob_06_AmounT_MAX = 11;
const int WoodMob_07_AmounT_MAX = 12;
const int WoodMob_08_AmounT_MAX = 11;
const int WoodMob_09_AmounT_MAX = 10;
const int WoodMob_10_AmounT_MAX = 11;
const int WoodMob_11_AmounT_MAX = 12;
const int WoodMob_12_AmounT_MAX = 13;
const int WoodMob_13_AmounT_MAX = 14;
const int WoodMob_14_AmounT_MAX = 15;
const int WoodMob_15_AmounT_MAX = 16;
const int WoodMob_16_AmounT_MAX = 17;
const int WoodMob_17_AmounT_MAX = 18;
const int WoodMob_18_AmounT_MAX = 19;
const int WoodMob_19_AmounT_MAX = 20;
const int WoodMob_20_AmounT_MAX = 20;
const string WoodMob_01_WP = "SW_WOOD_WORK_AXE_01";
const string WoodMob_02_WP = "SW_WOOD_WORK_AXE_02";
const string WoodMob_03_WP = "SW_WOOD_WORK_AXE_03";
const string WoodMob_04_WP = "SW_WOOD_WORK_AXE_04";
const string WoodMob_05_WP = "SW_WOOD_WORK_AXE_05";
const string WoodMob_06_WP = "SW_WOOD_WORK_AXE_06";
const string WoodMob_07_WP = "SW_WOOD_WORK_AXE_07";
const string WoodMob_08_WP = "SW_WOOD_WORK_AXE_08";
const string WoodMob_09_WP = "SW_WOOD_WORK_AXE_09";
const string WoodMob_10_WP = "SW_WOOD_WORK_AXE_10";
const string WoodMob_11_WP = "SW_WOOD_WORK_AXE_11";
const string WoodMob_12_WP = "SW_WOOD_WORK_AXE_12";
const string WoodMob_13_WP = "SW_WOOD_WORK_AXE_13";
const string WoodMob_14_WP = "SW_WOOD_WORK_AXE_14";
const string WoodMob_15_WP = "SW_WOOD_WORK_AXE_15";
const string WoodMob_16_WP = "SW_WOOD_WORK_AXE_16";
const string WoodMob_17_WP = "SW_WOOD_WORK_AXE_17";
const string WoodMob_18_WP = "SW_WOOD_WORK_AXE_18";
const string WoodMob_19_WP = "SW_WOOD_WORK_AXE_19";
const string WoodMob_20_WP = "SW_WOOD_WORK_AXE_20";

func int B_WoodMob_Bestimmung()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_01_WP) && (WoodMob_01_AmounT_MAX > WoodMob_01_Amount))
	{
		WoodMob_01_Amount = WoodMob_01_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_02_WP) && (WoodMob_02_AmounT_MAX > WoodMob_02_Amount))
	{
		WoodMob_02_Amount = WoodMob_02_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_03_WP) && (WoodMob_03_AmounT_MAX > WoodMob_03_Amount))
	{
		WoodMob_03_Amount = WoodMob_03_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_04_WP) && (WoodMob_04_AmounT_MAX > WoodMob_04_Amount))
	{
		WoodMob_04_Amount = WoodMob_04_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_05_WP) && (WoodMob_05_AmounT_MAX > WoodMob_05_Amount))
	{
		WoodMob_05_Amount = WoodMob_05_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_06_WP) && (WoodMob_06_AmounT_MAX > WoodMob_06_Amount))
	{
		WoodMob_06_Amount = WoodMob_06_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_07_WP) && (WoodMob_07_AmounT_MAX > WoodMob_07_Amount))
	{
		WoodMob_07_Amount = WoodMob_07_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_08_WP) && (WoodMob_08_AmounT_MAX > WoodMob_08_Amount))
	{
		WoodMob_08_Amount = WoodMob_08_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_09_WP) && (WoodMob_09_AmounT_MAX > WoodMob_09_Amount))
	{
		WoodMob_09_Amount = WoodMob_09_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_10_WP) && (WoodMob_10_AmounT_MAX > WoodMob_10_Amount))
	{
		WoodMob_10_Amount = WoodMob_10_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_11_WP) && (WoodMob_11_AmounT_MAX > WoodMob_11_Amount))
	{
		WoodMob_11_Amount = WoodMob_11_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_12_WP) && (WoodMob_12_AmounT_MAX > WoodMob_12_Amount))
	{
		WoodMob_12_Amount = WoodMob_12_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_13_WP) && (WoodMob_13_AmounT_MAX > WoodMob_13_Amount))
	{
		WoodMob_13_Amount = WoodMob_13_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_14_WP) && (WoodMob_14_AmounT_MAX > WoodMob_14_Amount))
	{
		WoodMob_14_Amount = WoodMob_14_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_15_WP) && (WoodMob_15_AmounT_MAX > WoodMob_15_Amount))
	{
		WoodMob_15_Amount = WoodMob_15_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_16_WP) && (WoodMob_16_AmounT_MAX > WoodMob_16_Amount))
	{
		WoodMob_16_Amount = WoodMob_16_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_17_WP) && (WoodMob_17_AmounT_MAX > WoodMob_17_Amount))
	{
		WoodMob_17_Amount = WoodMob_17_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_18_WP) && (WoodMob_18_AmounT_MAX > WoodMob_18_Amount))
	{
		WoodMob_18_Amount = WoodMob_18_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_19_WP) && (WoodMob_19_AmounT_MAX > WoodMob_19_Amount))
	{
		WoodMob_19_Amount = WoodMob_19_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),WoodMob_20_WP) && (WoodMob_20_AmounT_MAX > WoodMob_20_Amount))
	{
		WoodMob_20_Amount = WoodMob_20_Amount + 1;
		return TRUE;
	};
	return FALSE;
};
//-----------------------------------------------------------

func void DS_WOODCUTTING_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_WOODCUTTING;
		AI_ProcessInfos(hero);
	};
};
var int WoodCounter;
var int WoodTruemmer_Count;
var int WoodHeroOne;

instance PC_WOODCUTTING_End(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 999;
	condition 	= PC_WOODCUTTING_End_Condition;
	information = PC_WOODCUTTING_End_Info;
	permanent 	= TRUE;
	description = Dialog_Ende;
};


func int PC_WOODCUTTING_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_WOODCUTTING)
	{
		return TRUE;
	};
};

func void PC_WOODCUTTING_End_Info()
{
	WoodTruemmer_Count = 0;
	b_endproductiondialog();
};

//----------------------------------------------------
instance PC_WoodCutting(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_WoodCutting_Condition;
	information = PC_WoodCutting_Info;
	permanent = TRUE;
	description = "Ударить.";
};

func int PC_WoodCutting_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_WOODCUTTING)
	{
		return TRUE;
	};
};

func void PC_WoodCutting_Info()
{
	var int MultiWood;
	MultiWood = Hlp_Random(100 + hero.attribute[ATR_STRENGTH] / 2);	
	if(B_WoodMob_Bestimmung() == TRUE)
	{
		if(MultiWood >= 90)
	  {
			CreateInvItems(hero,ItMi_WoodRaw,3);
			PrintScreen("Добыто 3 куска древесины!",-1,-1,FONT_ScreenSmall,2);
			WoodTruemmer_Count = 0;
		}
		else if(MultiWood >= 70)
		{
			CreateInvItems(hero,ItMi_WoodRaw,2);
			PrintScreen("Добыто 2 куска древесины!",-1,-1,FONT_ScreenSmall,2);
			WoodTruemmer_Count = 0;
			WoodCounter = WoodCounter + 1;
		}
		else if(MultiWood >= 30)
		{
			CreateInvItems(hero,ItMi_WoodRaw,1);
			PrintScreen("Добыт 1 кусок древесины!",-1,-1,FONT_ScreenSmall,2);
			WoodTruemmer_Count = 0;
			WoodCounter = WoodCounter + 1;
		}
		else
		{
			PrintScreen("Щепки разлетаются во все стороны...",-1,-1,FONT_ScreenSmall,2);
			WoodTruemmer_Count = WoodTruemmer_Count + 1;
		};
	}
	else
	{
		PrintScreen(PRINT_DS_NOTHINGTOGET_THERE,-1,-1,FONT_ScreenSmall,2);
		b_endproductiondialog();
	};
};
