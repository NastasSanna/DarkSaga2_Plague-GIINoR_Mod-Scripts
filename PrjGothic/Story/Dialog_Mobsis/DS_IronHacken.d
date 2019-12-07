
var int IronMob_01_Amount;
var int IronMob_02_Amount;
var int IronMob_03_Amount;
var int IronMob_04_Amount;
var int IronMob_05_Amount;
var int IronMob_06_Amount;
var int IronMob_07_Amount;
var int IronMob_08_Amount;
var int IronMob_09_Amount;
const int IronMob_01_AmounT_MAX = 12;
const int IronMob_02_AmounT_MAX = 12;
const int IronMob_03_AmounT_MAX = 11;
const int IronMob_04_AmounT_MAX = 10;
const int IronMob_05_AmounT_MAX = 11;
const int IronMob_06_AmounT_MAX = 11;
const int IronMob_07_AmounT_MAX = 11;
const int IronMob_08_AmounT_MAX = 11;
const int IronMob_09_AmounT_MAX = 11;
const string IronMob_01_WP = "DS_IRONORE_01";
const string IronMob_02_WP = "DS_IRONORE_02";
const string IronMob_03_WP = "DS_IRONORE_03";
const string IronMob_04_WP = "DS_IRONORE_04";
const string IronMob_05_WP = "DS_IRONORE_05";
const string IronMob_06_WP = "DS_IRONORE_06";
const string IronMob_07_WP = "DS_IRONORE_07";
const string IronMob_08_WP = "DS_IRONORE_08";
const string IronMob_09_WP = "DS_IRONORE_09";

func int B_IronMob_Bestimmung()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_01_WP) && (IronMob_01_AmounT_MAX > IronMob_01_Amount))
	{
		IronMob_01_Amount = IronMob_01_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_02_WP) && (IronMob_02_AmounT_MAX > IronMob_02_Amount))
	{
		IronMob_02_Amount = IronMob_02_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_03_WP) && (IronMob_03_AmounT_MAX > IronMob_03_Amount))
	{
		IronMob_03_Amount = IronMob_03_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_04_WP) && (IronMob_04_AmounT_MAX > IronMob_04_Amount))
	{
		IronMob_04_Amount = IronMob_04_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_05_WP) && (IronMob_05_AmounT_MAX > IronMob_05_Amount))
	{
		IronMob_05_Amount = IronMob_05_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_06_WP) && (IronMob_06_AmounT_MAX > IronMob_06_Amount))
	{
		IronMob_06_Amount = IronMob_06_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_07_WP) && (IronMob_07_AmounT_MAX > IronMob_07_Amount))
	{
		IronMob_07_Amount = IronMob_07_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_08_WP) && (IronMob_08_AmounT_MAX > IronMob_08_Amount))
	{
		IronMob_08_Amount = IronMob_08_Amount + 1;
		return TRUE;
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(hero),IronMob_09_WP) && (IronMob_09_AmounT_MAX > IronMob_09_Amount))
	{
		IronMob_09_Amount = IronMob_09_Amount + 1;
		return TRUE;
	};
	return FALSE;
};	

var int IronCounter;
var int IronTruemmer_Count;
var int IronHeroOne;

instance PC_DS_IronHacken_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_ds_IronHacken_end_condition;
	information = pc_ds_IronHacken_end_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int pc_ds_IronHacken_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_IronOREHACKEN)
	{
		return TRUE;
	};
};

func void pc_ds_IronHacken_end_info()
{
	IronTruemmer_Count = 0;
	b_endproductiondialog();
};

instance PC_IronHacken_Ds_Hour(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_IronHacken_Ds_Hour_Condition;
	information = PC_IronHacken_Ds_Hour_Info;
	permanent = TRUE;
	description = "Ударить несильно.";
};

func int PC_IronHacken_Ds_Hour_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_IronOREHACKEN)
	{
		return TRUE;
	};
};

func void PC_IronHacken_Ds_Hour_Info()
{
	PC_BrilliantHacken_Ds_Hour_Info();
	var int CurrentChance;
	var int MultiIron;
	var int Dop_Chance;
	if(B_IronMob_Bestimmung() == TRUE)	//NS - 10/12/13
	{
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
	MultiIron = Hlp_Random(100);
	if(KNOWS_MAGICORETRUEMMERSCHLAG == TRUE)
	{
		Dop_Chance = Hlp_Random(2);
	};
		if((HERO_MAGICOREHACKCHANCE >= CurrentChance) || (Dop_Chance == TRUE))
		{
			if((MAGICORECOUNTER >= 25) && (MultiIron >= 96))
			{
				CreateInvItems(hero,ItMi_Ironore,4);
				PrintScreen("Добыто 4 куска железных самородка!",-1,35,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
			}
			else if((MAGICORECOUNTER >= 15) && (MultiIron >= 72))
			{
				CreateInvItems(hero,ItMi_Ironore,3);
				PrintScreen("Добыто 3 железных самородка!",-1,36,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER = MAGICORECOUNTER + 1;
			}
			else if((MAGICORECOUNTER >= 7) && (MultiIron >= 40))
			{
				CreateInvItems(hero,ItMi_Ironore,2);
				PrintScreen("Добыто 2 железных самородка!",-1,37,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER = MAGICORECOUNTER + 1;
			}
			else
			{
				CreateInvItems(hero,ItMi_Ironore,1);
				PrintScreen("Добыт 1 кусок руды!",-1,38,FONT_ScreenSmall,2);
				MAGICORETRUEMMER_COUNT = 0;
				MAGICORECOUNTER = MAGICORECOUNTER + 1;
			};
			B_GivePlayerXP(5);
		}
		else
		{
			PrintScreen("Осколки руды разлетаются во все стороны...",-1,34,FONT_ScreenSmall,2);
			MAGICORETRUEMMER_COUNT = MAGICORETRUEMMER_COUNT + 1;
		};
	}
	else
	{
		PrintScreen(PRINT_DS_NOTHINGTOGET_THERE,-1,-1,FONT_ScreenSmall,2);
		b_endproductiondialog();
	};
};

func void IronHacken_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_IronOREHACKEN;
		AI_ProcessInfos(hero);
	};
	PC_IronHacken_Ds_Hour.description = "Ударить несильно.";
};
