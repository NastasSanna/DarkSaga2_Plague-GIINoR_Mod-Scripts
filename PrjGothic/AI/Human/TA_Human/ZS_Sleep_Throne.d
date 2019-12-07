func void ZS_GotoThrone()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};
	AI_StartState(self,ZS_Sleep_Throne,0,"");
};

func void B_AssessSleepThroneTalk()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_SIT_RANDOM_1");
		AI_PlayAniBS(self,"T_SIT_RANDOM_2",BS_SIT);
	};
	AI_StartState(self,ZS_ObservePlayer,0,"");
};
func void B_AssessQuietSoundSleepThrone()
{
	Npc_StopAni(self,"T_SIT_RANDOM_1");
	AI_StartState(self,ZS_ObservePlayer,0,"");
};

func void ZS_Sleep_Throne()
{
	//NS - еще не спим, только собираемся. а если спать негде, то и не ляжем
	Perception_Set_Normal();
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int ZS_Sleep_Throne_Loop()
{
	if(!C_BodyStateContains(self,BS_SIT) && Wld_IsMobAvailable(self,"THRONE"))
	{
		AI_UseMob(self,"THRONE",1);
	};
	if(C_BodyStateContains(self,BS_SIT) && (Npc_GetStateTime(self) >= 4))
	{
		AI_PlayAniBS(self,"T_THRONE_RANDOM_1",BS_SIT);
		Npc_SetStateTime(self,0);
	};
	//NS - а вот теперь спим
	if (C_BodyStateContains(self,BS_SIT) && (self.aivar[AIV_TAPOSITION] == NOTINPOS))	{
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		B_ClearPerceptions(self);
		self.senses = SENSE_HEAR;
		self.senses_range = 550;
		Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSoundSleepThrone);
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepThroneTalk);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sleep_Throne_End()
{
	AI_UseMob(self,"THRONE",-1);
};

