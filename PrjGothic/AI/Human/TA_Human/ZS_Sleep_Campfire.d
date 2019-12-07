
func void ZS_GotoCampfire()
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
	AI_StartState(self,ZS_Sleep_Campfire,0,"");
};
func void B_AssessSleepCampfireTalk()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_SIT_RANDOM_1");
	};
	AI_StartState(self,ZS_ObservePlayer,0,"");
};

func void ZS_Sleep_Campfire()
{
	//NS - еще не спим, только собираемся. а если спать негде, то и не ляжем
	Perception_Set_Normal();
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
};

func int ZS_Sleep_Campfire_loop()
{
	if(Npc_IsOnFP(self,"CAMPFIRE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_AlignToFP(self);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	}
	else if(Npc_IsOnFP(self,"ROAM") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_AlignToFP(self);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	}
	else if(Wld_IsFPAvailable(self,"CAMPFIRE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoFP(self,"CAMPFIRE");
		AI_Standup(self);
		AI_AlignToFP(self);
	}
	else if(Wld_IsFPAvailable(self,"ROAM") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoFP(self,"ROAM");
		AI_Standup(self);
		AI_AlignToFP(self);
	}
	else if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_AlignToWP(self);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	};
	if(C_BodyStateContains(self,BS_SIT) && (Npc_GetStateTime(self) >= 10))
	{
		AI_PlayAniBS(self,"T_SIT_RANDOM_1",BS_SIT);		
		Npc_SetStateTime(self,0);
	};
	//NS - а вот теперь спим
	if (C_BodyStateContains(self,BS_SIT) && (self.aivar[AIV_TAPOSITION] == NOTINPOS))	{
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		B_ClearPerceptions(self);
		Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepCampfireTalk);
	};
	return LOOP_CONTINUE;
};

func void ZS_Sleep_Campfire_end()
{
	Npc_StopAni(self,"T_SIT_RANDOM_1");
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
};

