// ****************
// Крутение колеса
// ****************

func void ZS_STONEMILL()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkmode(self,NPC_WALK);		
	if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
   {
		AI_GotoWP(self,self.wp);
	};
};
func int ZS_STONEMILL_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT)) && (Wld_IsMobAvailable(self,"STONEMILL"))
	{
		AI_UseMob(self,"STONEMILL",1);
		AI_UseMob(self,"STONEMILL",0);
		AI_UseMob(self,"STONEMILL",-1);
	};
	return LOOP_CONTINUE;
};
func void ZS_STONEMILL_End()
{
	AI_UseMob(self,"STONEMILL",-1);
};
