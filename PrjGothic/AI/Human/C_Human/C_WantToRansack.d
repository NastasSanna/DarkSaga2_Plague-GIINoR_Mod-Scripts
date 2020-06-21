
func int C_WantToRansack(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_FRIEND || slf.guild == GIL_G2NV) && Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_ORC))
	{
		return FALSE;
	};
	return TRUE;
};

