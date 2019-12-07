
func void B_MM_AssessSurprise()
{
	Npc_SetTarget(self,other);
};

func void ZS_MM_Attack()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,B_MM_AssessSurprise);
	B_ValidateOther();
	if((self.guild == GIL_SHEEP) || (self.guild == GIL_DS_RABBIT))
	{
		Npc_ClearAIQueue(self);
		B_ClearPerceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	if((self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.npcType == NPCTYPE_Skel))
	{
		if(Npc_IsInFightMode(self,FMODE_NONE))
		{
			AI_EquipBestRangedWeapon(self);
			AI_EquipBestMeleeWeapon(self);		
		};
		if(Npc_HasEquippedMeleeWeapon(self))
		{
			if(Npc_HasItems(self,ITMW_DarkSaga_Shield_ds_06) && Npc_GetTalentSkill(self,NPC_TALENT_SHIELD))
			{
				//EquipItem_ds(self,ITMW_DarkSaga_Shield_ds_06);	//”¡–¿ÕŒ 3.12.2013
				EquipItem(self,ITMW_DarkSaga_Shield_ds_06);
			};
			if(Npc_HasItems(self,ITMW_DarkSaga_Shield_ds_04) && Npc_GetTalentSkill(self,NPC_TALENT_SHIELD))
			{
				//EquipItem_ds(self,ITMW_DarkSaga_Shield_ds_04);	//”¡–¿ÕŒ 3.12.2013
				EquipItem(self,ITMW_DarkSaga_Shield_ds_04);
			};
		};
	};
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_MM_Attack_Loop()
{
	Npc_GetTarget(self);
	if(self.guild == GIL_DRAGON)
	{
		self.aivar[AIV_TAPOSITION] += 1;
		if((self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (self.aivar[AIV_TAPOSITION] >= 2))
		{
			self.attribute[ATR_HITPOINTS] += 1;
			self.aivar[AIV_TAPOSITION] = 0;
		};
	};
	/*Redleha: Ó·‡·ÓÚÍ‡ ÔË‡ÌËÈ*/
	/*
	if(CurrentLevel == WORLD_DARKSAGA_ZEN)
	{
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
				Npc_ClearAIQueue(self);
				//AI_Standup(self);
				AI_PlayAni(self,"T_WARN");
				self.aivar[AIV_PursuitEnd] = TRUE;
				AI_StartState(self,ZS_MM_Rtn_Swim,1,"");
				return LOOP_END;
			};
		};
	};
	*/
	if(self.guild == GIL_ZOMBIE)
	{
		var int randyvoice;
		randyvoice = Hlp_Random(6);
		if(Npc_GetStateTime(self) % 6 == 2)
		{	
			if(randyvoice == 0)
			{
				AI_Output(self,self,"Eaaat1");
				Snd_Play("ZMB_EAAAT1");
			}
			else if(randyvoice == 1)
			{
				AI_Output(self,self,"Eaaat2");
				Snd_Play("ZMB_EAAAT2");
			}
			else if(randyvoice == 2)
			{
				AI_Output(self,self,"Eaaat3");
				Snd_Play("ZMB_EAAAT3");
			}
			else if(randyvoice == 3)
			{
				AI_Output(self,self,"Eaaat4");
				Snd_Play("ZMB_EAAAT4");
			}
			else if(randyvoice == 4)
			{
				AI_Output(self,self,"Eaaat5");
				Snd_Play("ZMB_EAAAT5");
			}
			else if(randyvoice == 5)
			{
				AI_Output(self,self,"Eaaat6");
				Snd_Play("ZMB_EAAAT6");
			};
		};
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_MAGE) 
  {
    if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MELEE)
    {
	    AI_PlayAni(self,"T_SPELL_V2");
      AI_Wait(self,0.5);
			Wld_PlayEffect("SPELLFX_FIREBOLT",self,other,0,100,DAM_FLY,TRUE);
    };
		if(Npc_GetStateTime(self) > 3)
		{	
			var int RandyMagieShaman;
			RandyMagieShaman = Hlp_Random(10);
			if(RandyMagieShaman == 0)
			{
				AI_PlayAni(self,"T_SPELL_V2");
				AI_Wait(self,0.5);
				Wld_PlayEffect("SPELLFX_FIREBOLT",self,other,0,100,DAM_MAGIC,TRUE);	
			}
			else if(RandyMagieShaman == 1)
			{	
				AI_PlayAni(self,"T_SPELL_V1");
				Wld_PlayEffect("SPELLFX_HEAL",self,self,0,0,0,TRUE);
				self.attribute[ATR_HITPOINTS] += 150;
				AI_Wait(self,0.5);
			}
			else if(RandyMagieShaman == 2)
			{
				AI_PlayAni(self,"T_SPELL_V3");
				AI_Wait(self,0.5);
				Wld_PlayEffect("SPELLFX_FIREBOLT",self,other,0,100,DAM_MAGIC,TRUE);	
			};	
			Npc_SetStateTime(self,0);
		};
		return LOOP_CONTINUE;
  };
	//***************************************************************
//	if((self.guild == GIL_Stoneguardian)) //&& (RavenIsDead == TRUE) )
//	{
//		B_KillNpc(self);
//	};
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FollowTime]) && (self.aivar[AIV_PursuitEnd] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		AI_PlayAni(self,"T_WARN");
	};
	if(self.aivar[AIV_PursuitEnd] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			return LOOP_END;
		};
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_Dist]) || !(C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP)))
			{
				self.aivar[AIV_PursuitEnd] = FALSE;
				Npc_SetStateTime(self,0);
				self.aivar[AIV_StateTime] = 0;
			}
			else
			{
				AI_TurnToNPC(self,other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
			};
		};
		return LOOP_CONTINUE;
	};
	if((C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE)) && (self.aivar[AIV_MM_FollowInWater] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if(self.aivar[AIV_WaitBeforeAttack] == 1)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	if(self.level == 0)
	{
		if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
		{
			self.aivar[AIV_SummonTime] = self.aivar[AIV_SummonTime] + 1;
			self.aivar[AIV_StateTime] = Npc_GetStateTime(self);
		};
		if(self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(!C_BodyStateContains(other,BS_RUN) && !C_BodyStateContains(other,BS_JUMP) && (Npc_GetStateTime(self) > 0))
	{
		Npc_SetStateTime(self,0);
		self.aivar[AIV_StateTime] = 0;
	};
	if(self.aivar[AIV_MaxDistToWp] > 0)
	{
		if((Npc_GetDistToWP(self,self.wp) > self.aivar[AIV_MaxDistToWp]) && (Npc_GetDistToWP(other,self.wp) > self.aivar[AIV_MaxDistToWp]))
		{
			self.fight_tactic = FAI_NAILED;
		}
		else
		{
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic];
		};
	};
	if(C_NpcIsMonsterMage(self) || (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		B_CreateAmmo(self);
		Npc_ChangeAttribute(self,ATR_MANA,ATR_MANA_MAX);
		B_SelectWeapon(self,other);
	};
	if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
	{
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			AI_Attack(self);
		}
		else
		{
			Npc_ClearAIQueue(self);
		};
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		return LOOP_CONTINUE;
	}
	else
	{
		if((self.aivar[AIV_MM_PRIORITY] == PRIO_EAT) && C_WantToEat(self,other))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other) && ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) && (other.aivar[AIV_INVINCIBLE] == FALSE))
		{
			self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
			return LOOP_CONTINUE;
		}
		else
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
	};
};

func void ZS_MM_Attack_End()
{
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if(C_NpcIsMonsterMage(self) || (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
	};
	if(Npc_IsDead(other) && C_WantToEat(self,other))
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_EatBody,0,"");
		return;
	};
};

