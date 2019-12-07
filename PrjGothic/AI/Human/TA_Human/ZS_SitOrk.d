// *********************
// Орки просто сидят
// *********************

func void ZS_SitOrk()
{	
	Perception_Set_Normal();
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkmode(self,NPC_WALK);		
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
};

func int ZS_SitOrk_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_AligntoWP(self);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_SitOrk_end()
{
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
};
