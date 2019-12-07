
func int B_SelectSpell(var C_Npc slf,var C_Npc oth)
{
	if (!Hlp_IsValidNpc(slf))	{return FALSE;};
	if (!Hlp_IsValidNpc(oth))	{return FALSE;};
	if (C_NpcIsDown(oth))	{return FALSE;};
	var int dK_rnd;
	var int dK_Mega;
	var int spellvar;
	if((slf.npcType == NPCTYPE_FRIEND) && Npc_IsPlayer(oth) && (oth.guild < GIL_SEPERATOR_HUM))
	{
		if((slf.guild == GIL_KDF) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
		{
			if(Npc_HasItems(slf,ItRu_Sleep) == 0)
			{
				CreateInvItems(slf,ItRu_Sleep,1);
			};
			B_ReadySpell(slf,SPL_Sleep,SPL_Cost_Sleep);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if((slf.guild == GIL_DMT) && (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if(Npc_HasItems(slf,ItRu_BeliarsRage) == 0)
		{			CreateInvItems(slf,ItRu_BeliarsRage,1);		};
		if(Npc_HasItems(slf,ItRu_Deathbolt) == 0)
		{			CreateInvItems(slf,ItRu_Deathbolt,1);		};
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{			CreateInvItems(slf,ItRu_Deathball,1);		};
		if(Npc_HasItems(slf,ItRu_Firerain) == 0)
		{			CreateInvItems(slf,ItRu_Firerain,1);		};
		if(Npc_HasItems(slf,ItRu_Thunderstorm) == 0)
		{			CreateInvItems(slf,ItRu_Thunderstorm,1);		};
		if(Npc_HasItems(slf,ItRu_LightningFlash) == 0)
		{			CreateInvItems(slf,ItRu_LightningFlash,1);		};
		if(Npc_HasItems(slf,ItRu_Firestorm) == 0)
		{			CreateInvItems(slf,ItRu_Firestorm,1);		};
		if(Npc_HasItems(slf,ItRu_Skull) == 0)
		{			CreateInvItems(slf,ItRu_Skull,1);		};
		if(Npc_HasItems(slf,ItRu_ArmyOfDarkness) == 0)
		{			CreateInvItems(slf,ItRu_ArmyOfDarkness,1);		};
		if(Npc_IsDrawingWeapon(slf))
		{			return TRUE;		};
		spellvar = slf.aivar[AIV_SelectSpell];
		if((spellvar < 40) && (spellvar != 10) && (spellvar != 2))
		{
			if(Kapitel >= 3)
			{	B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);				return TRUE;
			}
			else 
			{	B_ReadySpell(slf,SPL_Deathbolt,SPL_COST_Deathbolt);				return TRUE;
			};
		}
		else if(spellvar == 2)
		{	B_ReadySpell(slf,SPL_ArmyOfDarkness,SPL_Cost_ArmyOfDarkness);			return TRUE;
		}
		else if(spellvar == 10)
		{	
			slf.aivar[AIV_SelectSpell] = 11;
			dK_Mega = Hlp_Random(100);
			if(dK_Mega <= 2)
			{	B_ReadySpell(slf,SPL_Firerain,SPL_Cost_Firerain);				return TRUE;
			}
			else if(dK_Mega <= 5)
			{	B_ReadySpell(slf,SPL_Thunderstorm,SPL_Cost_Thunderstorm);				return TRUE;
			}
			else if(dK_Mega <= 10)
			{	B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);		return TRUE;
			}
			else if(dK_Mega <= 12)
			{	B_ReadySpell(slf,SPL_Skull,SPL_COST_Skull);				return TRUE;
			}
			else
			{	B_ReadySpell(slf,SPL_Firestorm,SPL_COST_Firestorm);				return TRUE;
			};
		}
		else if(spellvar == 40)
		{		slf.aivar[AIV_SelectSpell] = 0;
		};
		return TRUE;
	};
	
	
	if((slf.guild == GIL_KDF) || (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS))
	{
		if(Npc_HasItems(slf,ItRu_Concussionbolt) == 0)	{CreateInvItems(slf,ItRu_Concussionbolt,1);};
		if(Npc_HasItems(slf,ItRu_IceCube) == 0)			{CreateInvItems(slf,ItRu_IceCube,1);};
		if(Npc_HasItems(slf,ItRu_LightningFlash) == 0)	{CreateInvItems(slf,ItRu_LightningFlash,1);};
		if(Npc_HasItems(slf,ItRu_GreenTentacle) == 0)	{CreateInvItems(slf,ItRu_GreenTentacle,1);};
		if(Npc_HasItems(slf,ItRu_WindFist) == 0)		{CreateInvItems(slf,ItRu_WindFist,1);};
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)	{CreateInvItems(slf,ItRu_InstantFireball,1);};
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)		{CreateInvItems(slf,ItRu_Deathball,1);};
		if(Npc_HasItems(slf,ItRu_FullHeal) == 0)		{CreateInvItems(slf,ItRu_FullHeal,1);};
		if(Npc_HasItems(slf,ItRu_Skull) == 0)		{CreateInvItems(slf,ItRu_Skull,1);};
		if(slf.attribute[ATR_HITPOINTS] < 100)
		{
			B_ReadySpell(slf,SPL_FullHeal,SPL_Cost_FullHeal);
			return TRUE;
		}
		else if(C_NpcHasAttackReasonToKill(slf))
		{
			if(slf.flags == NPC_FLAG_IMMORTAL)
			{
				if((Npc_GetDistToNpc(slf,oth) < 1500) && !Npc_IsInState(oth,ZS_Greententacle) && (!Npc_IsInState(oth,ZS_Greententacle)) && (oth.guild != GIL_BLOODFLY) && (oth.guild != GIL_DEMON))
				{
					B_ReadySpell(slf,SPL_GreenTentacle,SPL_Cost_GreenTentacle);					
				}
				else if((Npc_GetDistToNpc(slf,oth) < 1500) && (oth.guild == GIL_BLOODFLY))
				{
					B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
				}
				else if(oth.guild == GIL_DEMON)
				{
					B_ReadySpell(slf,SPL_Skull,SPL_Cost_Skull);
				}
				else if((Npc_GetDistToNpc(slf,oth) < 1000) && (oth.guild != GIL_BLOODFLY) && (oth.guild != GIL_DEMON))
				{
					B_ReadySpell(slf,SPL_WindFist,SPL_Cost_WindFist);					
				}
				else if((!Npc_IsInState(oth,ZS_MagicFreeze)) && (!Npc_IsInState(oth,ZS_Greententacle)))
				{
					B_ReadySpell(slf,SPL_IceCube,SPL_Cost_IceCube);
				}
				else// if(Npc_IsInState(oth,ZS_MagicFreeze) || Npc_IsInState(oth,ZS_Greententacle))
				{
					B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
				};				
			}			
			else
			{
				B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			};
			return TRUE;
		}
		else 
		{
			B_ReadySpell(slf,SPL_ConcussionBolt,SPL_COST_Concussionbolt);
			return TRUE;
		};
	};
	if(slf.guild == GIL_PAL)
	{
		if(slf.fight_tactic == FAI_NAILED)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,ItRu_PalHolyBolt) == 0)
		{
			CreateInvItems(slf,ItRu_PalHolyBolt,1);
		};
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE) && C_NpcIsEvil(oth))
		{
			B_ReadySpell(slf,SPL_PalHolyBolt,SPL_Cost_PalHolyBolt);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.guild == GIL_SKELETON_MAGE)
	{
		if(Npc_HasItems(slf,ItRu_SumSkel) == 0)
		{
			CreateInvItems(slf,ItRu_SumSkel,1);
		};
		if(Npc_HasItems(slf,ItRu_IceCube) == 0)
		{
			CreateInvItems(slf,ItRu_IceCube,1);
		};
		if(Npc_HasItems(slf,ItRu_Icebolt) == 0)
		{
			CreateInvItems(slf,ItRu_Icebolt,1);
		};
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		/*if(slf.aivar[AIV_SelectSpell] >= 6)
		{
			slf.aivar[AIV_SelectSpell] = 1;
		};
		B_ReadySpell(slf,SPL_Icebolt,SPL_COST_Icebolt);
		return TRUE;*/
		
		if(slf.aivar[AIV_SelectSpell] >= 12)
		{
			slf.aivar[AIV_SelectSpell] = 0;
		};
		spellvar = slf.aivar[AIV_SelectSpell];
		if(spellvar >= 6)
		{
			spellvar = spellvar - 5;
		};
		if(!Npc_IsInState(oth,ZS_MagicFreeze) && (spellvar == 0))
		{
			B_ReadySpell(slf,SPL_IceCube,SPL_Cost_IceCube);
			return TRUE;
		}
		else if((spellvar == 1) || (spellvar == 3))
		{
			B_ReadySpell(slf,SPL_SummonSkeleton,SPL_Cost_SummonSkeleton);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			return TRUE;
		};
	};
	if(slf.guild == GIL_ICEGOLEM)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
		{
			if(Npc_HasItems(slf,ItRu_IceCube) == 0)
			{
				CreateInvItems(slf,ItRu_IceCube,1);
			};
			if((Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE) || Npc_IsInState(oth,ZS_MagicFreeze))
			{
				return FALSE;
			}
			else
			{
				B_ReadySpell(slf,SPL_IceCube,SPL_Cost_IceCube);
				return TRUE;
			};
		}
		else if(slf.aivar[AIV_MM_REAL_ID] == ID_STORMGOLEM)
		{
			if(Npc_HasItems(slf,ItRu_LightningFlash) == 0){CreateInvItems(slf,ItRu_LightningFlash,1);};
			if(Npc_HasItems(slf,ItRu_WindFist) == 0){CreateInvItems(slf,ItRu_WindFist,1);};
			if(Npc_HasItems(slf,ItRu_DS_WindBolt) == 0){CreateInvItems(slf,ItRu_DS_WindBolt,1);};
			if((Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE) || Npc_IsInState(oth,ZS_MagicFreeze))
			{
				return FALSE;
			}
			else
			{
				/*if(Npc_GetDistToNpc(slf,oth) < 1200)
				{
					B_ReadySpell(slf,SPL_Whirlwind,SPL_Cost_Whirlwind);
					return TRUE;
				}/*
				else* if(Npc_GetDistToNpc(slf,oth) < 3000)
				{*/
					B_ReadySpell(slf,SPL_WindBolt,SPL_Cost_WindBolt);
					return TRUE;
				/*};
				
				else
				{
					B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
					return TRUE;
				};*/
			};
		};
	};
	if(slf.guild == GIL_FIREGOLEM)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		Npc_ClearAIQueue(slf);
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if(Npc_HasItems(slf,ItRu_InstantFireball) == 0)
		{
			CreateInvItems(slf,ItRu_InstantFireball,1);
		};
		if(Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			B_ReadySpell(slf,SPL_InstantFireball,SPL_COST_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	return FALSE;
};

