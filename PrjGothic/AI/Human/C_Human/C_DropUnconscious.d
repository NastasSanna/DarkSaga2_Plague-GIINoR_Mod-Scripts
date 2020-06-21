
/* NPC после драки
 * TRUE - без создания 
 * FALSE - упал замертво */
func int C_DropUnconscious(var C_NPC slf, var C_NPC oth)
{
	if (oth.guild >= GIL_SEPERATOR_HUM && oth.guild <= GIL_SEPERATOR_ORC) {
		return FALSE;
	};
	if((C_NpcGetAttitude(slf,oth) != ATT_HOSTILE) && oth.aivar[AIV_DropDeadAndKill] == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

