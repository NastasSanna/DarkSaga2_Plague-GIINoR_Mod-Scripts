
var string wp34;

func void zs_mm_rtn_cometohero()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	B_SetAttitude(self,ATT_FRIENDLY);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_SetWalkMode(self,NPC_RUN);
};

func int zs_mm_rtn_cometohero_loop()
{
	var C_Item ReadyWeap;
	WP34 = Npc_GetNearestWP(hero);
	if(Npc_IsInFightMode(hero,FMODE_FAR) == TRUE)
	{
		ReadyWeap = Npc_GetReadiedWeapon(hero);
	}
	else if(Npc_HasEquippedRangedWeapon(self) == TRUE)
	{
		ReadyWeap = Npc_GetEquippedRangedWeapon(hero);
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_cometohero_end()
{
};

