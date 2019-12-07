func void ZS_Stand_Potion()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
//	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	if(!Npc_HasItems(self,ItMi_Flask_stand))
	{
		CreateInvItem(self,ItMi_Flask_stand);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_Potion_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_UseItemToState(self,ItMi_Flask_stand,1);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 15) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		AI_PlayAniBS(self,"T_POTION_RANDOM_2",BS_ITEMINTERACT);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_Stand_Potion_End()
{
	AI_PlayAniBS(self,"T_POTION_RANDOM_2",BS_ITEMINTERACT);
	AI_UseItemToState(self,ItMi_Flask_stand,-1);
};
 