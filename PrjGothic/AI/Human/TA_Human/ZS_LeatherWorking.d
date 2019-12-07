func void ZS_LeatherWorking()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_LeatherWorking_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSSKIN"))
	{
		AI_UseMob(self,"BSSKIN",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_LeatherWorking_End()
{
	AI_UseMob(self,"BSSKIN",-1);
};
