
func void B_MM_AssessEnemy()
{
	var C_Npc pcl;
	var C_Npc wand;
	var C_Npc STgo;
	var C_Npc Sgo;
	var C_Npc Fgo;
	var C_Npc Wgo;

	if((self.aivar[AIV_NoFightParker] == TRUE) || (other.aivar[AIV_NoFightParker] == TRUE))
	{
		return;
	};
	if((self.aivar[AIV_EnemyOverride] == TRUE) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return;
	};
	pcl = Hlp_GetNpc(PC_Levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return;
	};
	if(self.guild == GIL_DS_PIRANHA)
	{
		if(((Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_01") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_02") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_03") <= 800)
		|| (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_04") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_05") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_06") <= 800)
		|| (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_07") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_08") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_09") <= 800)
		|| (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_10") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_11") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_12") <= 800)
		|| (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_13") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_14") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_15") <= 800)
		|| (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_16") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_17") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_18") <= 800)
		|| (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_19") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_20") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_21") <= 800)
		|| (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_22") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_23") <= 800) || (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_24") <= 800)
		|| (Npc_GetDistToWP(self,"SW_BOD_QEST_LAKE_FISH_25") <= 800)) &&
			((Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_01") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_02") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_03") <= 600)
		|| (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_04") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_05") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_06") <= 600)
		|| (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_07") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_08") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_09") <= 600)
		|| (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_10") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_11") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_12") <= 600)
		|| (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_13") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_14") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_15") <= 600)
		|| (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_16") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_17") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_18") <= 600)
		|| (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_19") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_20") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_21") <= 600)
		|| (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_22") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_23") <= 600) || (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_24") <= 600)
		|| (Npc_GetDistToWP(other,"SW_BOD_QEST_LAKE_FISH_25") <= 600)))
		{
			return;
		};
	};

	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(Npc_IsPlayer(other) && (other.guild > GIL_SEPERATOR_HUM))
	{
		if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
		{
			return;
		};
	};
	if(self.senses_range > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		if(Npc_GetDistToNpc(self,other) > PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if((self.guild == GIL_ORC) || (self.guild == GIL_FRIENDLY_ORC))
	{
		if(C_BodyStateContains(other,BS_SNEAK) || C_BodyStateContains(other,BS_STAND))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if(!Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(other.npcType == NPCTYPE_FRIEND)
		{
			return;
		};
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	//NS - 08/03/16 гоблины и ГГ -------------------------
	//касается только гоблинов на болоте!
	if (HasFlags(self.aivar[AIV_StoryFlags], AIV_StoryFlag_SwampGoblin) 
		&& (Npc_IsPlayer(other) || other.aivar[AIV_PARTYMEMBER])) // ГГ или его товарищ
	{
		//друг - не атакуем
		if (Gobbos_Attitude == Gobbos_Attitude_Friendly)	{
			Npc_SetAttitude(self,ATT_FRIENDLY);
			return;
		};
		//враг - будем атаковать всегда
		if (Gobbos_Attitude == Gobbos_Attitude_Hostile)	{
			self.aivar[AIV_EnemyOverride] = FALSE;
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_SetAttitude(self,ATT_HOSTILE);
		};
	};
	//гоблины и ГГ - конец -------------------------------
	if(self.aivar[AIV_MM_ThreatenBeforeAttack] == FALSE)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	if(Npc_IsInState(self,ZS_MM_EatBody))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		};
		return;
	};
	if(Npc_IsInState(self,ZS_MM_Hunt))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
			return;
		}
		else
		{
			return;
		};
	};
	if(C_PredatorFoundPrey(self,other))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Hunt,0,"");
		return;
	};
	if(C_PredatorFoundPrey(other,self))
	{
		if(!Npc_IsInState(other,ZS_MM_Hunt) && (Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_FLEE))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			B_ClearPerceptions(self);
			AI_StartState(self,ZS_MM_Flee,0,"");
			return;
		}
		else
		{
			return;
		};
	};
	Npc_ClearAIQueue(self);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_ThreatenEnemy,0,"");
};

