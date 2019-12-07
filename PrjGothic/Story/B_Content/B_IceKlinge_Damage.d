func void B_IceKlinge_Damage(var C_Npc oth,var C_Npc slf)
{
	if (!Npc_HasReadiedMeleeWeapon(oth))	{return;};	//NS (24/02/14)
	var C_Item ReadyWeap;	ReadyWeap = Npc_GetReadiedWeapon(oth);
	//NS - изменены условия
	if(Hlp_IsItem(ReadyWeap,ItMw_DS_IceKlinge) && (slf.attribute[ATR_HITPOINTS] > 0))
	{
		Wld_PlayEffect("SPELLFX_ICELANCE_COLLIDEFX",slf,slf,0,0,0,FALSE);
		//NS - клинок действует на всех, КРОМЕ:
		// нежити и призраков
		if(C_NpcIsUndead(slf) || (slf.flags & NPC_FLAG_GHOST != 0))
		{	return;		};
		// големов и каменных стражей
		if((slf.guild == GIL_FIREGOLEM) || (slf.guild == GIL_SWAMPGOLEM) || (slf.guild == GIL_ICEGOLEM)
			|| (slf.guild == GIL_STONEGOLEM) || (slf.guild == GIL_Stoneguardian)
			|| (slf.guild == GIL_SummonedGuardian) || (slf.guild == GIL_SUMMONED_GOLEM) || (slf.guild == GIL_Gargoyle))
		{	return;		};
		// драконов, демонов, огненных ящеров
		if((slf.guild == GIL_DRAGON) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
			|| (slf.guild == GIL_DEMON) || (slf.guild == GIL_SUMMONED_DEMON))
		{	return;		};
		// крупных тварей
		if((slf.guild == GIL_TROLL) || (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER_QUEEN))
		{	return;		};
		// и еще 
		if((slf.aivar[AIV_MM_REAL_ID] == ID_WISP) || (slf.aivar[AIV_MM_REAL_ID] == ID_Swarm) || (slf.aivar[AIV_MM_REAL_ID] == ID_PIRANHA))
		{	return;		};
		
		Npc_ClearAIQueue(slf);
		B_ClearPerceptions(slf);
		//Wld_PlayEffect("SPELLFX_ICECUBE_COLLIDE",slf,slf,0,0,0,FALSE); //что-то глючит, осколки подвисают в воздухе
		Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",slf,slf,0,0,0,FALSE);
		AI_StartState(slf,ZS_MagicFreeze,0,"");
	};
};
