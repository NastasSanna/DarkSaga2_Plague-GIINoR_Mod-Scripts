
func int C_NpcIsUndead(var C_Npc slf)
{
	if((slf.guild == GIL_GOBBO_SKELETON) || (slf.guild == GIL_SUMMONED_GOBBO_SKELETON) 
	|| (slf.guild == GIL_SKELETON) || (slf.guild == GIL_SUMMONED_SKELETON) 
	|| (slf.guild == GIL_SKELETON_MAGE) || (slf.guild == GIL_ZOMBIE) 
	|| (slf.guild == GIL_SHADOWBEAST_SKELETON) || (slf.guild == GIL_UNDEADORC) 
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	|| (slf.guild == GIL_SummonedZombie))	//* NS - 20/10/2013
	{
		return TRUE;
	};
	//* NS - 26/01/2013
	if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_SKELETON) || (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOBBO_SKELETON) 
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON) || (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON) 
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (slf.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE) 
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST_SKELETON) || (slf.guild == slf.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCWARRIOR)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_WOLF_UNDEAD)
	|| (slf.npcType == NPCTYPE_Skel))
	{
		return TRUE;
	};
	return FALSE;
};

