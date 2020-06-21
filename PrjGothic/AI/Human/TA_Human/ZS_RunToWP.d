
func void ZS_RunToWP()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	B_MM_DeSynchronize();	//NS (01/05/14)
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
};

func int ZS_RunToWP_Loop()
{
	var int random;
	if(Npc_GetStateTime(self) > 5)
	{
		random = Hlp_Random(2);
		if(random == 0)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		};		
		Npc_SetStateTime(self,0);
	};
	//NS (30.04.14) для диалогов
	if ((Npc_GetDistToNpc(self,other) <= PERC_DIST_ACTIVE_MAX) && Npc_CheckInfo(self,1))	{
		AI_TurnToNpc(self,hero);
	};
	return LOOP_CONTINUE;
};

func void ZS_RunToWP_End()
{
};

