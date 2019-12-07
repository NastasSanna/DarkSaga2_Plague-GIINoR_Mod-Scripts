func void ZS_Cook_Ork()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		AI_GotoWP(self,self.wp);
	};
	if(!Npc_HasItems(self,ItFoMuttonRaw))
	{
		CreateInvItem(self,ItFoMuttonRaw);
	};
};
func int ZS_Cook_Ork_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BUTCHER"))
	{
		AI_UseMob(self,"BUTCHER",1);
	};
	return LOOP_CONTINUE;
};
func void ZS_Cook_Ork_End()
{
	AI_UseMob(self,"BUTCHER",-1);
	if(Npc_HasItems(self,ItFoMutton))
	{
		Npc_RemoveInvItems(self,ItFoMutton,1);
	};
};
