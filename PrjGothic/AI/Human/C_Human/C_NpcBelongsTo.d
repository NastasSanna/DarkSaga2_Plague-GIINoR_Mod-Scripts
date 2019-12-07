
func int C_NpcBelongsToPir(var C_Npc slf)
{
	if(slf.guild == GIL_PIR)	{		return TRUE;	};
	return FALSE;
};
func int C_NpcBelongsToBau(var C_Npc slf)
{
	if(slf.guild == GIL_BAU)	{		return TRUE;	};
	return FALSE;
};
func int C_NpcBelongsToPAL(var C_Npc slf)
{
	if(slf.guild == GIL_PAL)	{		return TRUE;	};
	return FALSE;
};

