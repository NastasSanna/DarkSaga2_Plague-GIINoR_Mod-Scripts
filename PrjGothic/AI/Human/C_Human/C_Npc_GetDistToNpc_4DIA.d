func int C_DSG_NpcIsTrialogNpc_ReturnDist(var C_NPC slf)
{
	if((C_NpcIs(slf, PIR_211_DS2P_Ado)) && (slf.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return 800;
	};
	if((C_NpcIs(slf, PIR_210_DS2P_Jorn)) && (slf.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return 700;
	};
	return 0;
};
func int C_Npc_GetDistToNpc_4DIA()
{
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)
	{
		return TRUE;
	};
	if(C_DSG_NpcIsTrialogNpc_ReturnDist(self))
	{
		return TRUE;
	};
	return FALSE;
};
