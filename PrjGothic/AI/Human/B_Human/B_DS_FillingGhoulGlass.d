func void B_DS_FillingGhoulGlass(var C_NPC killer, var C_NPC killerVictim)
{
	if(Npc_IsPlayer(killer) && 
	((killerVictim.guild == GIL_BLOODFLY) || (killerVictim.guild == GIL_WOLF) || killerVictim.guild == GIL_DS_PIRANHA )
	|| (killerVictim.guild == GIL_MINECRAWLER) 
	|| (killerVictim.guild == GIL_GOBBO) || (killerVictim.guild == GIL_SHADOWBEAST)|| (killerVictim.guild == gil_summoned_wolf) 
	|| (killerVictim.guild == GIL_SNAPPER) || (killerVictim.guild == GIL_SWAMPSHARK) || (killerVictim.guild == GIL_Giant_Rat) 
	|| (killerVictim.guild == GIL_SHEEP )
	|| (killerVictim.guild == GIL_DRACONIAN) || (killerVictim.guild == GIL_SCAVENGER) || (killerVictim.guild == GIL_MOLERAT )
	|| (killerVictim.guild == GIL_HARPY) 
	|| (killerVictim.guild == GIL_LURKER) || (killerVictim.guild == GIL_WARAN) || (killerVictim.guild == GIL_TROLL )
	|| (killerVictim.guild == GIL_Alligator) 
	|| (killerVictim.guild < GIL_SEPERATOR_HUM) || (killerVictim.guild == GIL_ORC) || (killerVictim.guild == GIL_FRIENDLY_ORC))
	{
		if(Npc_HasItems(killer,ItPo_DS_GhoulGlass) || Npc_HasItems(killer,ItPo_DS_GhoulGlass50)
		|| Npc_HasItems(killer,ItPo_DS_GhoulGlass100) || Npc_HasItems(killer,ItPo_DS_GhoulGlass150)
		|| Npc_HasItems(killer,ItPo_DS_GhoulGlass200) || Npc_HasItems(killer,ItPo_DS_GhoulGlass250) 
		|| Npc_HasItems(killer,ItPo_DS_GhoulGlass300) || Npc_HasItems(killer,ItPo_DS_GhoulGlass350))
		{
			Wld_PlayEffect("spellFX_Fear",killerVictim,killerVictim,0,0,0,FALSE);
			if(killer.attribute[ATR_HITPOINTS] < killer.attribute[ATR_HITPOINTS_MAX])
			{
				killer.attribute[ATR_HITPOINTS] += 50;			
				Wld_PlayEffect("spellFX_GLB_Soul_Arrow_SPREAD",killerVictim,killer,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_SuckEnergy_BloodFly",killerVictim,killer,0,0,0,FALSE);
				//Wld_PlayEffect("spellFX_GLB_Soul_Arrow",killerVictim,other,0,0,0,FALSE);
				if(killer.attribute[ATR_HITPOINTS] > killer.attribute[ATR_HITPOINTS_MAX])
				{
					killer.attribute[ATR_HITPOINTS] = killer.attribute[ATR_HITPOINTS_MAX];
				};
			}
			else if(Npc_HasItems(killer,ItPo_DS_GhoulGlass) == 1)
			{
				Npc_RemoveInvItems(killer,ItPo_DS_GhoulGlass,1);
				CreateInvItems(killer,ItPo_DS_GhoulGlass50,1);
			}
			else if(Npc_HasItems(killer,ItPo_DS_GhoulGlass50) == 1)
			{
				Npc_RemoveInvItems(killer,ItPo_DS_GhoulGlass50,1);
				CreateInvItems(killer,ItPo_DS_GhoulGlass100,1);
			}
			else if(Npc_HasItems(killer,ItPo_DS_GhoulGlass100) == 1)
			{
				Npc_RemoveInvItems(killer,ItPo_DS_GhoulGlass100,1);
				CreateInvItems(killer,ItPo_DS_GhoulGlass150,1);
			}
			else if(Npc_HasItems(killer,ItPo_DS_GhoulGlass150) == 1)
			{
				Npc_RemoveInvItems(killer,ItPo_DS_GhoulGlass150,1);
				CreateInvItems(killer,ItPo_DS_GhoulGlass200,1);
			}
			else if(Npc_HasItems(killer,ItPo_DS_GhoulGlass200) == 1)
			{
				Npc_RemoveInvItems(killer,ItPo_DS_GhoulGlass200,1);
				CreateInvItems(killer,ItPo_DS_GhoulGlass250,1);
			}
			else if(Npc_HasItems(killer,ItPo_DS_GhoulGlass250) == 1)
			{
				Npc_RemoveInvItems(killer,ItPo_DS_GhoulGlass250,1);
				CreateInvItems(killer,ItPo_DS_GhoulGlass300,1);
				PrintScreen(PRINT_DS_GhoulGlass_IsFull,-1,15,FONT_Screen,1);
			}
			else if(Npc_HasItems(killer,ItPo_DS_GhoulGlass300) == 1)
			{
				Npc_RemoveInvItems(killer,ItPo_DS_GhoulGlass300,1);
				CreateInvItems(killer,ItPo_DS_GhoulGlass350,1);
				PrintScreen(PRINT_DS_GhoulGlass_IsFull,-1,15,FONT_Screen,1);
			};			
		};		
	};
};
