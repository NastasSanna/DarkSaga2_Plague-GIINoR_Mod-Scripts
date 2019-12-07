
func void B_DS_UseFakeRune()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
	CreateInvItem(self,ItRu_DS_Fake);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,ItRu_DS_Fake,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItRu_DS_Fake,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,ItRu_DS_Fake,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItRu_DS_Fake,-1);
	};
};

func void B_DSG_UseFakeAmulet()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
	CreateInvItem(self,ItMi_DS2P_FakeAmulet);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,ItMi_DS2P_FakeAmulet,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItMi_DS2P_FakeAmulet,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,ItMi_DS2P_FakeAmulet,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,ItMi_DS2P_FakeAmulet,-1);
	};
};
