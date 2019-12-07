
func void B_GiveDeathInv(var C_Npc slf)
{
	if(slf.aivar[AIV_DeathInvGiven] == TRUE)
	{
		return;
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
	{
		if((slf.aivar[AIV_MM_REAL_ID] == ID_WOLF) && (slf.protection[PROT_POINT] != IMMUNE))
		{
			CreateInvItems(slf,ItAt_Teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Icewolf)
		{
			CreateInvItems(slf,ItAt_Teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WARG)
		{
			CreateInvItems(slf,ItAt_DS2P_Teeth_Warg,2);	//NS - 26/06/2013
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
		{
			CreateInvItems(slf,ItAt_Teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
		{
			CreateInvItems(slf,ItAt_Teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Razor)
		{
			CreateInvItems(slf,ItAt_Teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_KARAKUS)
		{
			CreateInvItems(slf,ItAt_Canine_Karakus,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Bloodhound)
		{
			CreateInvItems(slf,ItAt_Teeth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)
		{
			CreateInvItems(slf,ItAt_SharkTeeth,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)
		{
			CreateInvItems(slf,ItAt_TrollTooth,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)
		{
			CreateInvItems(slf,ItAt_TrollTooth,4);
		};		
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WARAN)
		{
			CreateInvItems(slf,ItAt_Claw,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
		{
			CreateInvItems(slf,ItAt_Claw,4);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
		{
			CreateInvItems(slf,ItAt_Claw,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Razor)
		{
			CreateInvItems(slf,ItAt_Claw,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
		{
			CreateInvItems(slf,ItAt_Claw,4);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
		{
			CreateInvItems(slf,ItAt_Claw,4);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Bloodhound)
		{
			CreateInvItems(slf,ItAt_Claw,4);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)
		{
			CreateInvItems(slf,ItAt_LurkerClaw,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHEEP)
		{
			CreateInvItems(slf,ItAt_SheepFur,1);
		};
		if((slf.aivar[AIV_MM_REAL_ID] == ID_WOLF) && (slf.protection[PROT_POINT] != IMMUNE))
		{
			CreateInvItems(slf,ItAt_WolfFur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Icewolf)
		{
			CreateInvItems(slf,ItAt_WolfFur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WARG)
		{
			CreateInvItems(slf,ItAt_WargFur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
		{
			CreateInvItems(slf,ItAt_ShadowFur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)
		{
			CreateInvItems(slf,ItAt_TrollFur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)
		{
			CreateInvItems(slf,ItAt_TrollBlackFur,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Keiler)
		{
			CreateInvItems(slf,ItAt_Addon_KeilerFur,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)
		{
			CreateInvItems(slf,itat_LurkerSkin,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
		{
			CreateInvItems(slf,itat_LurkerSkin,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Razor)
		{
			CreateInvItems(slf,itat_LurkerSkin,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
		{
			CreateInvItems(slf,itat_LurkerSkin,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_WARAN)
		{
			CreateInvItems(slf,itat_LurkerSkin,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
		{
			CreateInvItems(slf,itat_LurkerSkin,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)
		{
			CreateInvItems(slf,ItAt_SharkSkin,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
		{
			CreateInvItems(slf,ItAt_StoneGolemHeart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
		{
			CreateInvItems(slf,ItAt_FireGolemHeart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
		{
			CreateInvItems(slf,ItAt_IceGolemHeart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_STORMGOLEM)
		{
			CreateInvItems(slf,ItAt_DS_StormGolemHeart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_Swampgolem)
		{
			CreateInvItems(slf,ItAt_DS2P_Heart_SwampGolem,1);	//NS - 26/06/2013
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON)
		{
			CreateInvItems(slf,ItAt_DemonHeart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
		{
			CreateInvItems(slf,ItAt_DemonHeart,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SLEEPKEEPER)
		{
			CreateInvItems(slf,ItAt_Heart_KeeperKrypt,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
		{
			CreateInvItems(slf,ItAt_ShadowHorn,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
		{
			CreateInvItems(slf,ItAt_WaranFiretongue,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
		{
			CreateInvItems(slf,ItAt_Wing,2);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
		{
			CreateInvItems(slf,ItAt_Sting,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG)
		{
			CreateInvItems(slf,ItAt_BugMandibles,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
		{
			CreateInvItems(slf,ItAt_CrawlerMandibles,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(slf,ItAt_CrawlerMandibles,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_GNORE)
		{
			CreateInvItems(slf,ItAt_Claw_Rudogriz,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
		{
			CreateInvItems(slf,ItAt_CrawlerPlate,1);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(slf,ItAt_CrawlerPlate,2);
		};
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAKE)
		{
			CreateInvItems(slf,ItAt_Armour_Kraur,1);
		};
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == TRUE)
	{
		if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
		{
			CreateInvItems(slf,ItAt_DrgSnapperHorn,2);
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_MEATBUG)
	{
		CreateInvItems(slf,ItAt_Meatbugflesh,1);
	}
	else if( (slf.aivar[AIV_MM_REAL_ID] == ID_LURKER) || (slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER) 
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_Razor)	|| (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) 
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_WARAN) || (slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN))
	{
		CreateInvItems(slf,ItAt_VeinLizard,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER) || (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR))
	{
		CreateInvItems(slf,ItAt_Spider_Crawler,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_SKELETON)
	{
		CreateInvItems(slf,ItAt_GoblinBone,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BERSERK)
	{
		CreateInvItems(slf,ItPl_Dex_Herb_01,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	{
		CreateInvItems(slf,ItAt_SkeletonBone,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_WOLF_UNDEAD)
	{
		CreateInvItems(slf,ItAt_Bone_WolfZombie,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
	{
		var int SKELETON_MAGE_Randomizer; SKELETON_MAGE_Randomizer = Hlp_Random(100);
		if(SKELETON_MAGE_Randomizer <= 5)		{CreateInvItems(slf,ItPo_Mana_03,1);}
		else if(SKELETON_MAGE_Randomizer <= 15)	{CreateInvItems(slf,ItPo_Mana_02,1);}
		else 									{CreateInvItems(slf,ItPo_Mana_01,1);};
		CreateInvItems(slf,ItMi_Sulfur,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	{
		CreateInvItems(slf,ItAt_Prah_Zombie,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_BLATTCRAWLER)
	{
		CreateInvItems(slf,ItAt_Addon_BCKopf,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER_QUEEN)
	{
		CreateInvItems(slf,ItAt_Egg_CrawlerQueen,1);
	};
	var int GoblinGreen_Randomizer; GoblinGreen_Randomizer = Hlp_Random(100);
	if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GoblinGreen_Randomizer == 0))
	{
		CreateInvItems(slf,ItMi_SilverRing,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GoblinGreen_Randomizer <= 5))
	{
		CreateInvItems(slf,ItPl_Mushroom_01,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GoblinGreen_Randomizer <= 15))
	{
		CreateInvItems(slf,ItMi_Gold,5);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GoblinGreen_Randomizer <= 30))
	{
		CreateInvItems(slf,ItFo_Fish,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (GoblinGreen_Randomizer <= 50))
	{
		CreateInvItems(slf,ItMi_Gold,2);
	};
	var int GoblinBlack_Randomizer; GoblinBlack_Randomizer = Hlp_Random(100);
	if(((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) || (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BERSERK)) 
	&& (GoblinBlack_Randomizer == 0))
	{
		CreateInvItems(slf,ItMi_GoldRing,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GoblinBlack_Randomizer <= 5))
	{
		CreateInvItems(slf,ItFo_Fish,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GoblinBlack_Randomizer <= 15))
	{
		CreateInvItems(slf,ItMi_Gold,10);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GoblinBlack_Randomizer <= 30))
	{
		CreateInvItems(slf,ItPl_Mushroom_02,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (GoblinBlack_Randomizer <= 50))
	{
		CreateInvItems(slf,ItMi_Gold,5);
	};
	var int Orc_Randomizer; Orc_Randomizer = Hlp_Random(10);
	if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (Orc_Randomizer == 0))
	{
		CreateInvItems(slf,ItPo_Health_02,1);
		CreateInvItems(slf,ItMi_Gold,2);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (Orc_Randomizer == 1))
	{
		CreateInvItems(slf,ItPo_Health_01,1);
		CreateInvItems(slf,ItFoMuttonRaw,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (Orc_Randomizer == 2))
	{
		CreateInvItems(slf,ItPo_Health_01,2);
		CreateInvItems(slf,ItMi_Gold,18);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (Orc_Randomizer == 3))
	{
		CreateInvItems(slf,ItFo_Booze,1);
		CreateInvItems(slf,ItMi_SilverRing,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (Orc_Randomizer == 4))
	{
		CreateInvItems(slf,ItPl_Health_Herb_01,1);
		CreateInvItems(slf,ItMi_Gold,4);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (Orc_Randomizer <= 7))
	{
		CreateInvItems(slf,ItMi_Gold,9);
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (Orc_Randomizer == 0))
	{
		CreateInvItems(slf,ItPo_Mana_03,1);
		CreateInvItems(slf,ItMi_Gold,5);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (Orc_Randomizer == 1))
	{
		CreateInvItems(slf,ItPo_Mana_02,2);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (Orc_Randomizer == 2))
	{
		CreateInvItems(slf,ItPo_Mana_02,1);
		CreateInvItems(slf,ItMi_Coal,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (Orc_Randomizer == 3))
	{
		CreateInvItems(slf,ItPo_Mana_01,2);
		CreateInvItems(slf,ItMi_Gold,12);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (Orc_Randomizer == 4))
	{
		CreateInvItems(slf,ItPo_Mana_01,1);
		CreateInvItems(slf,ItMi_Sulfur,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (Orc_Randomizer <= 8))
	{
		CreateInvItems(slf,ItPl_Mana_Herb_02,2);
		CreateInvItems(slf,ItMi_Gold,8);
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (Orc_Randomizer == 0))
	{
		CreateInvItems(slf,ItAt_WolfFur,1);
		CreateInvItems(slf,ItPo_Health_03,1);
		CreateInvItems(slf,ItFoMutton,2);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (Orc_Randomizer == 1))
	{
		CreateInvItems(slf,ItMi_GoldRing,1);
		CreateInvItems(slf,ItPo_Health_01,1);
		CreateInvItems(slf,ItMi_Gold,26);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (Orc_Randomizer == 2))
	{
		CreateInvItems(slf,ItSc_LightHeal,1);
		CreateInvItems(slf,ItLsTorch,2);
		CreateInvItems(slf,ItAt_Teeth,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (Orc_Randomizer <= 5))
	{
		CreateInvItems(slf,ItMi_Gold,19);
		CreateInvItems(slf,ItPo_Health_02,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (Orc_Randomizer == 6))
	{
		CreateInvItems(slf,ItAt_WargFur,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) && (Orc_Randomizer <= 9))
	{
		CreateInvItems(slf,ItMi_Gold,22);
		CreateInvItems(slf,ItPo_Health_01,1);
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON) && (Orc_Randomizer == 0))
	{
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItMi_GoldRing,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON) && (Orc_Randomizer <= 2))
	{
		CreateInvItems(slf,ItPo_Mana_03,1);
		CreateInvItems(slf,ItPo_Health_02,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON) && (Orc_Randomizer <= 6))
	{
		CreateInvItems(slf,ItPo_Mana_02,2);
		CreateInvItems(slf,ItMi_Pitch,1);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON)
	{
		CreateInvItems(slf,ItPo_Mana_02,1);
		CreateInvItems(slf,ItPo_Health_02,1);
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) && (Orc_Randomizer <= 1))
	{
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItPo_Health_03,2);
		CreateInvItems(slf,ItSc_SumDemon,1);
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) && (Orc_Randomizer <= 5))
	{
		CreateInvItems(slf,ItPo_Mana_03,2);
		CreateInvItems(slf,ItPo_Health_03,2);
	}
	else if(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
	{
		CreateInvItems(slf,ItPo_Mana_03,1);
		CreateInvItems(slf,ItPo_Health_03,1);
	};
	slf.aivar[AIV_DeathInvGiven] = TRUE;
};


