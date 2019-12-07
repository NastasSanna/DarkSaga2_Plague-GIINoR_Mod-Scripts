
func void B_UseItem(var C_Npc slf,var int itmInstance)
{
	var C_Npc target;
	if(C_BodyStateContains(slf,BS_SIT))
	{
		return;
	};
	target = Npc_GetLookAtTarget(slf);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(slf);
		AI_UseItem(slf,itmInstance);
		B_LookAtNpc(slf,target);
	}
	else
	{
		AI_UseItem(slf,itmInstance);
	};
};

func void B_UseItem_StandUp(var C_Npc slf,var int itmInstance)
{
	var C_Npc target;
	if(C_BodyStateContains(slf,BS_SIT))
	{
		AI_Standup(slf);
		B_TurnToNpc(slf,hero);
	};
	/*FOR SHIELD*///	AI_RemoveWeapon_ds(slf);
	AI_RemoveWeapon(slf);
	target = Npc_GetLookAtTarget(slf);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(slf);
		AI_UseItem(slf,itmInstance);
		//B_LookAtNpc(slf,hero);
	}
	else
	{
		AI_UseItem(slf,itmInstance);
	};
	AI_PlayAni(slf,"T_GETLOST");
	AI_PlayAni(slf,"T_GETLOST");
};
