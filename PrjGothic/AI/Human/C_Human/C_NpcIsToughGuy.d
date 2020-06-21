
func int C_NpcIsToughGuy(var C_Npc slf)
{
	if(slf.aivar[AIV_ToughGuy] == TRUE)
	{
		return TRUE;
	};
	if((slf.guild == GIL_BDT) || (slf.guild == GIL_PIR) || (slf.guild == GIL_PIR2)
		|| (slf.guild == GIL_HUN) || (slf.guild == GIL_OUT))
	{
		return TRUE;
	};
	return FALSE;
};

