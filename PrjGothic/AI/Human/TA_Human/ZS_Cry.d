
func void ZS_Cry()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToWP(self);
	//AI_PlayAni(self,"T_STAND_2_HGUARD");
};

func int ZS_Cry_Loop()
{
	var int random;
	if(Npc_GetStateTime(self) > 15)
	{
		random = Hlp_Random(2);
		if(random == 0)
		{
			AI_PlayAni(self,"T_CRY");
		};		
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Cry_End()
{
};

