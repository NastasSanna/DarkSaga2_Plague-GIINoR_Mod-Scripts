func void ZS_GotoOrcCampfire()
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
	AI_StartState(self,ZS_SleepOrc_Campfire,0,"");
};
func void B_AssessSleepOrcCampfireTalk()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
	};
	AI_StartState(self,ZS_ObservePlayer,0,"");
};

func void B_AssessQuietSoundSleepOrcCampfire()
{
	AI_StartState(self,ZS_ObservePlayer,0,"");
};

func void ZS_SleepOrc_Campfire()
{
	//NS - еще не спим, только собираемся. а если спать негде, то и не ляжем
	Perception_Set_Normal();
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
};

func int ZS_SleepOrc_Campfire_loop()
{
	if(Npc_IsOnFP(self,"CAMPFIRE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_AlignToFP(self);
		AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
	}
	else if(Wld_IsFPAvailable(self,"CAMPFIRE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoFP(self,"CAMPFIRE");
		AI_Standup(self);
		AI_AlignToFP(self);
	}
	else if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_AlignToWP(self);
		AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
	};
	//NS - а вот теперь спим
	if (C_BodyStateContains(self,BS_SIT) && (self.aivar[AIV_TAPOSITION] == NOTINPOS))	{
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		B_ClearPerceptions(self);
		self.senses = SENSE_HEAR;
		self.senses_range = 400;
		Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSoundSleepOrcCampfire);
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepOrcCampfireTalk);
	};
	return LOOP_CONTINUE;
};

func void ZS_SleepOrc_Campfire_end()
{
	AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
};

