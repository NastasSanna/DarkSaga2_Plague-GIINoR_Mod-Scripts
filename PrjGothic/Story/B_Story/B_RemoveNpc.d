
func void B_RemoveNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		AI_Teleport(npc,"TOT");
		B_StartOtherRoutine(npc,"TOT");
		Npc_ClearInventory(npc);	//NS (16.02.2014) возможно, поэтому "мервецы" иногда возвращались с TOT
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		AI_Teleport(npc,"TOT");
	};
};

