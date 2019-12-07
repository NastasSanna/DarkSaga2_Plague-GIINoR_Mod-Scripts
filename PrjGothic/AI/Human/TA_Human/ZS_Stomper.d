// ****************
// Пока не знаю что
// ****************

func void ZS_STOMPER()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkmode(self,NPC_WALK);		
	if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
    {
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_STOMPER_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT)) && (Wld_IsMobAvailable(self,"STOMPER"))
	{
		AI_UseMob(self,"STOMPER",1);
		AI_UseMob(self,"STOMPER",0);
		AI_UseMob(self,"STOMPER",-1);
	};
	return LOOP_CONTINUE;
};


func void ZS_STOMPER_End()
{
	AI_UseMob(self,"STOMPER",-1);
};