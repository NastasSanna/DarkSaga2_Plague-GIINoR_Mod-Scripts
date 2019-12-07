
func void PC_Sleep(var int t)
{
	var int hero_health;
	var int hero_healthmax;
	var int hero_healthminus;
	var string concatstr;
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if(Wld_IsTime(0,0,t,0))
	{
		Wld_SetTime(t,0);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t,0);
	};
	Wld_StopEffect("DEMENTOR_FX");
	if(SC_IsObsessed == TRUE)
	{
		PrintScreen(PRINT_SleepOverObsessed,-1,-1,FONT_Screen,2);
	}
	else
	{
		PrintScreen(PRINT_SleepOver,-1,-1,FONT_Screen,2);
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	};
	PrintGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};

func void sleepabit_s1()
{
	var C_Npc her;
	var C_Npc rock;
	her = Hlp_GetNpc(PC_Hero);
	//rock = Hlp_GetNpc(PC_Rockefeller);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SleepAbit;
		AI_ProcessInfos(hero);
		if(SC_IsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
	};
};


instance PC_NoSleep(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_NoSleep_Condition;
	information = PC_NoSleep_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int PC_NoSleep_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};
func void PC_NoSleep_Info()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};


instance PC_SLEEPTIME_5(C_Info)
{
	npc = PC_Hero;
	condition = pc_sleeptime_5_condition;
	information = pc_sleeptime_5_info;
	permanent = TRUE;
	description = "Спать до раннего утра";
};
func int pc_sleeptime_5_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};
func void pc_sleeptime_5_info()
{
	PC_Sleep(5);
};

instance PC_SleepTime_Morning(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Morning_Condition;
	information = PC_SleepTime_Morning_Info;
	permanent = TRUE;
	description = "Спать до утра";
};
func int PC_SleepTime_Morning_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};
func void PC_SleepTime_Morning_Info()
{
	PC_Sleep(8);
};

instance PC_SleepTime_Noon(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Noon_Condition;
	information = PC_SleepTime_Noon_Info;
	permanent = TRUE;
	description = "Спать до полудня";
};
func int PC_SleepTime_Noon_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};
func void PC_SleepTime_Noon_Info()
{
	PC_Sleep(12);
};

instance PC_SLEEPTIME_17(C_Info)
{
	npc = PC_Hero;
	condition = pc_sleeptime_17_condition;
	information = pc_sleeptime_17_info;
	permanent = TRUE;
	description = "Спать до вечера";
};
func int pc_sleeptime_17_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};
func void pc_sleeptime_17_info()
{
	PC_Sleep(17);
};

instance PC_SleepTime_Evening(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Evening_Condition;
	information = PC_SleepTime_Evening_Info;
	permanent = TRUE;
	description = "Спать до позднего вечера";
};
func int PC_SleepTime_Evening_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};
func void PC_SleepTime_Evening_Info()
{
	PC_Sleep(21);
};

instance PC_SleepTime_Midnight(C_Info)
{
	npc = PC_Hero;
	condition = PC_SleepTime_Midnight_Condition;
	information = PC_SleepTime_Midnight_Info;
	permanent = TRUE;
	description = "Спать до полуночи";
};
func int PC_SleepTime_Midnight_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SleepAbit)
	{
		return TRUE;
	};
};
func void PC_SleepTime_Midnight_Info()
{
	PC_Sleep(24);
};
