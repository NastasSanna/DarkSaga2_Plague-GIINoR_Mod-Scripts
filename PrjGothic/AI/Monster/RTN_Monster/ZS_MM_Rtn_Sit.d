
func void ZS_MM_Rtn_Sit()
{
	Perception_Set_Monster_Rtn();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_Sit_loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_OrcSitStart],0,self.aivar[AIV_MM_OrcSitEnd],0) && (self.aivar[AIV_MM_OrcSitStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Npc_IsOnFP(self,"CAMPFIRE") && !C_BodyStateContains(self,BS_SIT))
		{
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		}
		else if(Npc_IsOnFP(self,"ROAM") && !C_BodyStateContains(self,BS_SIT))
		{
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
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
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};		
	}
	else
	{
		if(C_BodyStateContains(self,BS_SIT) && (Npc_GetStateTime(self) >= 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
		{
			AI_PlayAniBS(self,"T_SIT_RANDOM_01",BS_SIT);		
			Npc_SetStateTime(self,0);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Sit_end()
{
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
};

