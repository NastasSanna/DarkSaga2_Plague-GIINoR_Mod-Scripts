
func void ZS_WoodCutter()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(!Npc_HasItems(self,ItMw_2h_Bau_Axe))
	{
		CreateInvItem(self,ItMw_2h_Bau_Axe);
	};
};

func int ZS_WoodCutter_Loop()
{
	var int zufall;
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"W-MAN"))
	{
		AI_UseMob(self,"W-MAN",1);
	};
	if((Npc_GetStateTime(self) > 5) && C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		zufall = Hlp_Random(100);
		if(zufall < 50)
		{
			AI_PlayAniBS(self,"T_W-MAN_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_WoodCutter_End()
{
	AI_UseMob(self,"W-MAN",-1);
};