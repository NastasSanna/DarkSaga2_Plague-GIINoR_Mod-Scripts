
func void B_SummonedAssessTalk()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

func void ZS_MM_Rtn_Summoned()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_MM_AssessOthersDamage);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(wisp_detector_helper)))
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_SummonedAssessTalk);
	};
	B_SetAttitude(self,ATT_FRIENDLY);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
};


var string wp3;

const int WISPLIGHTTIME = 100;
const int WISPARMORTIME = 100;
const int WISPATTACKTIME = 100;
const int WISPREGENERATIONMANATIME = 100;
const int WISPREGENERATIONHPTIME = 100;
const int WISPFINDINGTIME = 100;

func int ZS_MM_Rtn_Summoned_Loop()
{
	if(!BONUSWISP)
	{
		B_MM_WispDetect();
	}
	else if((BONUSWISP == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector)))
	{
		
		if (gettainikWISP == true)
		{
			var string wp;
			var string wp1;
			var string wp2;
			wp = Npc_GetNextWP(self);
			wp1 = Npc_GetNextWP(self);
			wp2 = Npc_GetNearestWP(hero);
//		AI_StopProcessInfos(hero);
//		AI_GotoWP(self,wp);
			if(Npc_GetDistToWP(hero,wp) >= 30000)
			{
				AI_Teleport(self,wp1);
				Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
			}
			else
			{
				AI_Teleport(self,wp2);
				Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
			};
			GETTAINIK = TRUE; 
			gettainikWISP = false;
		};
		
		if(Npc_GetStateTime(self) >= 1)
		{
			self.aivar[AIV_SummonTime] = self.aivar[AIV_SummonTime] + Npc_GetStateTime(self);
			if(BONUSWISPARMOR == TRUE)
			{
				if(self.aivar[AIV_SummonTime] >= 30)
				{
					if(BONUSWISPARMOR01 == TRUE)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-(hero.attribute[ATR_HITPOINTS_MAX] / 11));
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-(hero.attribute[ATR_HITPOINTS_MAX] / 11));
						B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -1);
						BONUSWISPARMOR01 = FALSE;
					}
					else if(BONUSWISPARMOR02 == TRUE)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-(hero.attribute[ATR_HITPOINTS_MAX] / 6));
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-(hero.attribute[ATR_HITPOINTS_MAX] / 6));
						B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -2);
						BONUSWISPARMOR02 = FALSE;
					}
					else if(BONUSWISPARMOR03 == TRUE)
					{
						Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-(hero.attribute[ATR_HITPOINTS_MAX] / 5));
						Npc_ChangeAttribute(hero,ATR_HITPOINTS,-(hero.attribute[ATR_HITPOINTS_MAX] / 5));
						B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -4);
						BONUSWISPARMOR03 = FALSE;
					};
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
					BONUSWISP = FALSE;
					BONUSWISPARMOR = FALSE;
				};
			}
			else if(BONUSWISPATTACK == TRUE)
			{
				if(self.aivar[AIV_SummonTime] >= 30)
				{
					if(BONUSWISPATTACK01 == TRUE)
					{
						Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
						Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
						Npc_ChangeAttribute(self,ATR_HITPOINTS,-5);
						Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-5);
						BONUSWISPATTACK01 = FALSE;
					}
					else if(BONUSWISPATTACK02 == TRUE)
					{
						Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
						Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
						Npc_ChangeAttribute(self,ATR_HITPOINTS,-20);
						Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-20);
						BONUSWISPATTACK02 = FALSE;
					}
					else if(BONUSWISPATTACK03 == TRUE)
					{
						Npc_ChangeAttribute(self,ATR_STRENGTH,-40);
						Npc_ChangeAttribute(self,ATR_DEXTERITY,-40);
						Npc_ChangeAttribute(self,ATR_HITPOINTS,-80);
						Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-80);
						BONUSWISPATTACK03 = FALSE;
					};
					self.flags = 0;
					BONUSWISP = FALSE;
					BONUSWISPATTACK = FALSE;
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else if(BONUSWISPREGENERATIONMANA == TRUE)
			{
				if(self.aivar[AIV_SummonTime] >= 30)
				{
					//Npc_ChangeAttribute(hero,ATR_REGENERATEMANA,-5);
					BONUSWISP = FALSE;
					BONUSWISPREGENERATIONMANA = FALSE;
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else if(BONUSWISPREGENERATIONHP == TRUE)
			{
				if(self.aivar[AIV_SummonTime] >= 30)
				{
					Npc_ChangeAttribute(hero,ATR_REGENERATEHP,-5);
					BONUSWISP = FALSE;
					BONUSWISPREGENERATIONHP = FALSE;
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else if(BONUSWISPFINDING == TRUE)
			{
				if((self.aivar[AIV_SummonTime] > 0) && (self.aivar[AIV_SummonTime] < 2))
				{
					Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
				};
				if(self.aivar[AIV_SummonTime] >= 200)
				{
					BONUSWISP = FALSE;
					BONUSWISPFINDING = FALSE;
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else if(BONUSWISPLIGHT == TRUE)
			{
				if(self.aivar[AIV_SummonTime] >= 60)
				{
					Wld_StopEffect("SPELLFX_LIGHT");
					BONUSWISP = FALSE;
					BONUSWISPLIGHT = FALSE;
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				};
			};
			Npc_SetStateTime(self,0);
			WISPISCHARGED = FALSE;
		};
	};
	if(Npc_GetDistToNpc(self,hero) > 500)
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector)) && (BONUSWISPFINDING == TRUE) && (Npc_GetDistToNpc(self,hero) > 5000))
		{
			AI_Wait(self,10);
			WP3 = Npc_GetNextWP(hero);
			AI_Teleport(self,WP3);
			WISPISCHARGED = FALSE;
		}
		else
		{
			AI_GotoNpc(self,hero);
		};
	}
	else if((Npc_GetStateTime(self) >= 1) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector)))
	{
		if(!Npc_CanSeeNpc(self,hero))
		{
			AI_TurnToNPC(self,hero);
		};
		self.aivar[AIV_SummonTime] = self.aivar[AIV_SummonTime] + Npc_GetStateTime(self);
		if(self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		};
		Npc_SetStateTime(self,0);
	};
	self.wp = Npc_GetNearestWP(self);
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Summoned_End()
{
};

