
func void B_UseFakeScroll()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
	CreateInvItem(self,Fakescroll);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Fakescroll,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakescroll,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakescroll,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakescroll,-1);
	};
};

func void B_UseFakeScrollTime(var float time)
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
	CreateInvItem(self,Fakescroll);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Fakescroll,1);
		AI_Wait(self,time);
		AI_UseItemToState(self,Fakescroll,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakescroll,1);
		AI_Wait(self,time);
		AI_UseItemToState(self,Fakescroll,-1);
	};
};

func void B_UseFakeBook()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
	CreateInvItem(self,DS_FakeBook);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,DS_FakeBook,1);
		AI_Wait(self,3);
		AI_UseItemToState(self,DS_FakeBook,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,DS_FakeBook,1);
		AI_Wait(self,3);
		AI_UseItemToState(self,DS_FakeBook,-1);
	};
};

