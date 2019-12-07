
func void ZS_Smith_Fire_Monet()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(!Npc_HasItems(self,ITMI_LADLE))
	{
		CreateInvItem(self,ITMI_LADLE);
	};
};
func int ZS_Smith_Fire_Monet_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"MONETFIRE"))
	{
		AI_UseMob(self,"MONETFIRE",1);
	};
	return LOOP_CONTINUE;
};
func void ZS_Smith_Fire_Monet_End()
{
	AI_UseMob(self,"MONETFIRE",-1);
	//Под вопросом эти удаления
	//* NS - 26/10/2013
	Npc_RemoveInvItems(self,ITMI_DARKSAGA_STOCK,1);
	Npc_RemoveInvItems(self,ITMI_LADLE,1);
};
