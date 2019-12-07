func void ZS_DS_LaughAt_GG()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
};
func int ZS_DS_LaughAt_GG_Loop()
{
	var int randyTime;
	randyTime = Hlp_Random(3);
	if(Npc_GetStateTime(self) > (4 + randyTime))
	{
		if(Npc_GetDistToNpc(self,hero) <= 2000)
		{
			B_TurnToNpc(self,hero);
		};
		AI_PlayAni(self,"T_LAUGH_01");
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};
func void ZS_DS_LaughAt_GG_End()
{
};
