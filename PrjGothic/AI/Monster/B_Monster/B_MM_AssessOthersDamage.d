
func void B_MM_AssessOthersDamage()
{
	if((Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	if((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self)))
	{
		return;
	};
	//NS - 19/03/16 гоблины и ГГ -------------------------
	//если ГГ напал на гоблина на болоте
	if (HasFlags(self.aivar[AIV_StoryFlags], AIV_StoryFlag_SwampGoblin) 
		&& HasFlags(victim.aivar[AIV_StoryFlags], AIV_StoryFlag_SwampGoblin)
		&& (Npc_IsPlayer(other) || other.aivar[AIV_PARTYMEMBER])) // ГГ или его товарищ
	{
		//ГГ - враг всем болотным гоблинам
		Gobbos_Attitude = Gobbos_Attitude_Hostile;
		//мне лично
		self.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SetAttitude(self,ATT_HOSTILE);
	};
	//гоблины и ГГ - конец -------------------------------
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_IsPlayer(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		if(Npc_IsPlayer(other) && !Npc_IsDead(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			Npc_SetTarget(self,victim);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
	};
	if(self.guild == GIL_WOLF)
	{
		if((victim.guild == GIL_WOLF) && (other.guild == GIL_WOLF) && Npc_IsPlayer(other) && Npc_IsDead(victim))
		{
			Npc_ClearAIQueue(self);
			B_ClearPerceptions(self);
			self.start_aistate = ZS_MM_Rtn_Summoned;
			AI_StartState(self,ZS_MM_Rtn_Summoned,0,"");
			return;
		};
	};
	if((self.guild == GIL_Stoneguardian) && (victim.guild == GIL_Stoneguardian) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		b_awake_stoneguardian(self);
	};
	if((Wld_GetGuildAttitude(self.guild,victim.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,victim.guild) != ATT_FRIENDLY) && !Npc_IsDead(victim))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,victim);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
};

