
func void zs_pick_wood()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_pick_wood_loop()
{
	var int ani_pickwood_randy;
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"W-MAN"))
	{
		AI_UseMob(self,"W-MAN",1);
	};
	if((Npc_GetStateTime(self) > 20) && C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		ani_pickwood_randy = Hlp_Random(100);
		if(ani_pickwood_randy < 50)
		{
			AI_PlayAniBS(self,"T_W-MAN_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_pick_wood_end()
{
	AI_UseMob(self,"W-MAN",-1);
};

