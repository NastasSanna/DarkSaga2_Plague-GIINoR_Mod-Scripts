
func void ZS_Smith_Anvil_Monet()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	//* NS - 26/10/2013
	if(!Npc_HasItems(self,ITMI_DS_CHEKAN))
	{
		CreateInvItem(self,ITMI_DS_CHEKAN);
	};
};

func int ZS_Smith_Anvil_Monet_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"MONETANVIL"))
	{
		AI_UseMob(self,"MONETANVIL",1);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smith_Anvil_Monet_End()
{
	AI_UseMob(self,"MONETANVIL",-1);
	//Посмотрим эти удаления
	//* NS - 26/10/2013
	Npc_RemoveInvItems(self,ITMI_FUSINGGOLDTEMPLATE,1);
	Npc_RemoveInvItems(self,ITMI_DS_CHEKAN,1);
};
