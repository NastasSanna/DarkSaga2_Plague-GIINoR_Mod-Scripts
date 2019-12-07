
func void ZS_Sit_Campfire()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		/*if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_GotoWP(self,self.wp);
		};*/
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int ZS_Sit_Campfire_loop()
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
	if(C_BodyStateContains(self,BS_SIT) && (Npc_GetStateTime(self) > (10 + (2 * self.aivar[AIV_TALKBREAKTIME])) ) )
	{
		B_Detect_And_SaySmallTalk(BS_SIT);
		Npc_SetStateTime(self,0);
	};		
	return LOOP_CONTINUE;
};

func void ZS_Sit_Campfire_end()
{
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
};

