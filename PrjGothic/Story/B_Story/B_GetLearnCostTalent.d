//
//œÓÎÛ˜‡ÂÏ ÍÓÎ-‚Ó ÚÂ·ÛÂÏ˚ı Ó˜ÍÓ‚ ÓÔ˚Ú‡ ‰Îˇ ÔÓ‚˚¯ÂÌËˇ Ú‡Î‡ÌÚÓ‚ (Í‡ÙÚ,·ÓÂ‚˚Â)
//
func int B_GetLearnCostTalent(var C_Npc oth,var int talent,var int skill)
{
	var int kosten;
	kosten = 0;
	//
	//---------Œ¡”◊≈Õ»≈:  –”√ Ã¿√»»
	//
	if(talent == NPC_TALENT_MAGE)
	{
		if((skill >= 1) && (skill <= 6))
		{
			kosten = 5 * skill; //NS - 05/05/2016, Í‡Ê‰˚È ÒÎÂ‰Û˛˘ËÈ ÍÛ„ Ï‡„ËË Ì‡ 5 Ó˜ÍÓ‚ ‰ÓÓÊÂ
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: ŒƒÕŒ–”◊ÕŒ≈ Œ–”∆»≈
	//
	if(talent == NPC_TALENT_1H)
	{
		if(oth.aivar[REAL_TALENT_1H] >= 120)
		{
			kosten = 5 * skill;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 90)
		{
			if((oth.aivar[REAL_TALENT_1H] + skill) > 120)
			{
				kosten = 5 * skill + oth.aivar[REAL_TALENT_1H] - 120;
			}
			else
			{
				kosten = 4 * skill;
			};
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 60)
		{
			if((oth.aivar[REAL_TALENT_1H] + skill) > 90)
			{
				kosten = 4 * skill + oth.aivar[REAL_TALENT_1H] - 90;
			}
			else
			{
				kosten = 3 * skill;
			};
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 30)
		{
			if((oth.aivar[REAL_TALENT_1H] + skill) > 60)
			{
				kosten = 3 * skill + oth.aivar[REAL_TALENT_1H] - 60;
			}
			else
			{
				kosten = 2 * skill;
			};
		}
		else
		{
			if((oth.aivar[REAL_TALENT_1H] + skill) > 30)
			{
				kosten = 2 * skill + oth.aivar[REAL_TALENT_1H] - 30;
			}
			else
			{
				kosten = 1 * skill;
			};
		};		
	};
	//
	//---------Œ¡”◊≈Õ»≈: –”ƒÕŒ≈ ƒ≈ÀŒ
	//
	if(talent == NPC_TALENT_PICKORE)
	{
		if(HERO_MAGICOREHACKCHANCE >= 60)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
		kosten = kosten * skill;
	};
	//
	//---------Œ¡”◊≈Õ»≈: ƒ¬”–”◊ÕŒ≈ Œ–”∆»≈
	//
	if(talent == NPC_TALENT_2H)
	{
		if(oth.aivar[REAL_TALENT_2H] >= 120)
		{
			kosten = 5 * skill;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 90)
		{
			if((oth.aivar[REAL_TALENT_2H] + skill) > 120)
			{
				kosten = 5 * skill + oth.aivar[REAL_TALENT_2H] - 120;
			}
			else
			{
				kosten = 4 * skill;
			};
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 60)
		{
			if((oth.aivar[REAL_TALENT_2H] + skill) > 90)
			{
				kosten = 4 * skill + oth.aivar[REAL_TALENT_2H] - 90;
			}
			else
			{
				kosten = 3 * skill;
			};
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 30)
		{
			if((oth.aivar[REAL_TALENT_2H] + skill) > 60)
			{
				kosten = 3 * skill + oth.aivar[REAL_TALENT_2H] - 60;
			}
			else
			{
				kosten = 2 * skill;
			};
		}
		else
		{
			if((oth.aivar[REAL_TALENT_2H] + skill) > 30)
			{
				kosten = 2 * skill + oth.aivar[REAL_TALENT_2H] - 30;
			}
			else
			{
				kosten = 1 * skill;
			};
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: À” 
	//
	if(talent == NPC_TALENT_BOW)
	{
		if(oth.aivar[REAL_TALENT_BOW] >= 120)
		{
			kosten = 5 * skill;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 90)
		{
			if((oth.aivar[REAL_TALENT_BOW] + skill) > 120)
			{
				kosten = 5 * skill + oth.aivar[REAL_TALENT_BOW] - 120;
			}
			else
			{
				kosten = 4 * skill;
			};
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 60)
		{
			if((oth.aivar[REAL_TALENT_BOW] + skill) > 90)
			{
				kosten = 4 * skill + oth.aivar[REAL_TALENT_BOW] - 90;
			}
			else
			{
				kosten = 3 * skill;
			};
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 30)
		{
			if((oth.aivar[REAL_TALENT_BOW] + skill) > 60)
			{
				kosten = 3 * skill + oth.aivar[REAL_TALENT_BOW] - 60;
			}
			else
			{
				kosten = 2 * skill;
			};
		}
		else
		{
			if((oth.aivar[REAL_TALENT_BOW] + skill) > 30)
			{
				kosten = 2 * skill + oth.aivar[REAL_TALENT_BOW] - 30;
			}
			else
			{
				kosten = 1 * skill;
			};
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: ¿–¡¿À≈“
	//
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(oth.aivar[REAL_TALENT_CROSSBOW] >= 120)
		{
			kosten = 5 * skill;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 90)
		{
			if((oth.aivar[REAL_TALENT_CROSSBOW] + skill) > 120)
			{
				kosten = 5 * skill + oth.aivar[REAL_TALENT_CROSSBOW] - 120;
			}
			else
			{
				kosten = 4 * skill;
			};
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 60)
		{
			if((oth.aivar[REAL_TALENT_CROSSBOW] + skill) > 90)
			{
				kosten = 4 * skill + oth.aivar[REAL_TALENT_CROSSBOW] - 90;
			}
			else
			{
				kosten = 3 * skill;
			};
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 30)
		{
			if((oth.aivar[REAL_TALENT_CROSSBOW] + skill) > 60)
			{
				kosten = 3 * skill + oth.aivar[REAL_TALENT_CROSSBOW] - 60;
			}
			else
			{
				kosten = 2 * skill;
			};
		}
		else
		{
			if((oth.aivar[REAL_TALENT_CROSSBOW] + skill) > 30)
			{
				kosten = 2 * skill + oth.aivar[REAL_TALENT_CROSSBOW] - 30;
			}
			else
			{
				kosten = 1 * skill;
			};
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: œŒƒ –¿ƒ€¬¿Õ»≈ »À» ¿ –Œ¡¿“» ¿
	//
	if((talent == NPC_TALENT_SNEAK) || (talent == NPC_TALENT_ACROBAT))
	{
		kosten = 1;
	};
	//
	//---------Œ¡”◊≈Õ»≈: ¬«ÀŒÃ Œ“Ã€◊ ¿Ã»
	//
	if(talent == NPC_TALENT_PICKLOCK)
	{
		kosten = 10;
	};
	//
	//---------Œ¡”◊≈Õ»≈: ¬Œ–Œ¬—“¬Œ  ¿–Ã¿ÕŒ¬
	//
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		if(skill == PICKPOCKET_LEVEL_FIRST)
		{
			kosten = 5;
		}
		else if(skill == PICKPOCKET_LEVEL_SECOND)
		{
			kosten = 10;
		}
		else if(skill == PICKPOCKET_LEVEL_THIRD)
		{
			kosten = 15;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈:  Œ¬ ¿
	//
	if(talent == NPC_TALENT_SMITH)
	{
		if(skill == WEAPON_Common)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_1H_Special_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_2H_Special_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_Special_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_2H_Special_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_Special_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_2H_Special_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_Special_04)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_2H_Special_04)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_1H_Harad_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_Harad_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_Harad_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_Harad_04)
		{
			kosten = 10;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: ¿À’»Ã»ﬂ
	//
	if(talent == NPC_TALENT_ALCHEMY)
	{
		if(skill == POTION_Health_01)
		{
			kosten = 1;
		}
		else if(skill == POTION_Health_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_Health_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_Health_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_Mana_01)
		{
			kosten = 1;
		}
		else if(skill == POTION_Mana_02)
		{
			kosten = 3;
		}
		else if(skill == POTION_Mana_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_Mana_04)
		{
			kosten = 8;
		}
		else if(skill == POTION_Speed)
		{
			kosten = 5;
		}
		else if(skill == POTION_Perm_STR)
		{
			kosten = 20;
		}
		else if(skill == POTION_Perm_DEX)
		{
			kosten = 20;
		}
		else if(skill == POTION_Perm_Mana)
		{
			kosten = 10;
		}
		else if(skill == POTION_Perm_Health)
		{
			kosten = 10;
		}
		else if(skill == POTION_MegaDrink)
		{
			kosten = 20;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: —Õﬂ“»≈ “–Œ‘≈≈¬
	//
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if(skill == TROPHY_Teeth)
		{
			kosten = 1;	//3	- 200
		}
		else if(skill == TROPHY_Claws)
		{
			kosten = 1;	//3	- 200
		}
		else if(skill == TROPHY_Fur)
		{
			kosten = 2;	//5  -  500
		}
		else if(skill == TROPHY_Heart)
		{
			kosten = 2; //5  - 500
		}
		else if(skill == TROPHY_ShadowHorn)
		{
			kosten = 1;	//3  -  500
		}
		else if(skill == TROPHY_FireTongue)
		{
			kosten = 1;		// - 200
		}
		else if(skill == TROPHY_BFWing)
		{
			kosten = 1;		// - 200
		}
		else if(skill == TROPHY_BFSting)
		{
			kosten = 1;		// - 200
		}
		else if(skill == TROPHY_Mandibles)
		{
			kosten = 1;		// - 500
		}
		else if(skill == TROPHY_CrawlerPlate)
		{
			kosten = 1;	//3	- 200
		}
		else if(skill == TROPHY_DrgSnapperHorn)
		{
			kosten = 1;	// - 200
		}
		/*else if(skill == TROPHY_DragonScale)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DragonBlood)
		{
			kosten = 3;
		}*/
		else if(skill == TROPHY_ReptileSkin)
		{
			kosten = 1;	//3
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: ﬂ«€ »
	//
	if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{
		if(skill == LANGUAGE_1)
		{
			kosten = 4;
		}
		else if(skill == LANGUAGE_2)
		{
			kosten = 8;
		}
		else if(skill == LANGUAGE_3)
		{
			kosten = 12;
		}
		else if(skill == ORC_LANGUAGE_1)
		{
			kosten = 3;
		};		
	};
	//
	//---------Œ¡”◊≈Õ»≈: ¿Ã”À≈“ »Ÿ”Ÿ≈√Œ Œ√ŒÕ‹ ¿
	//
	if(talent == NPC_TALENT_WISPDETECTOR)
	{
		if(skill == WISPSKILL_NF)
		{
			kosten = 0;
		}
		else if(skill == WISPSKILL_FF)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_NONE)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_RUNE)
		{
			kosten = 2;
		}
		else if(skill == WISPSKILL_MAGIC)
		{
			kosten = 2;
		}
		else if(skill == WISPSKILL_FOOD)
		{
			kosten = 2;
		}
		else if(skill == WISPSKILL_POTIONS)
		{
			kosten = 3;
		}
		else if(skill == WISPSKILL_BONUSARMOR01)
		{
			kosten = 3;
		}
		else if(skill == WISPSKILL_BONUSARMOR02)
		{
			kosten = 4;
		}
		else if(skill == WISPSKILL_BONUSARMOR03)
		{
			kosten = 5;
		}
		else if(skill == WISPSKILL_BONUSATTACK01)
		{
			kosten = 3;
		}
		else if(skill == WISPSKILL_BONUSATTACK02)
		{
			kosten = 4;
		}
		else if(skill == WISPSKILL_BONUSATTACK03)
		{
			kosten = 5;
		}
		else if(skill == WISPSKILL_MANAREGENERATION)
		{
			kosten = 3;
		}
		else if(skill == WISPSKILL_HPREGENERATION)
		{
			kosten = 3;
		}
		else if(skill == WISPSKILL_LIGHTWISP)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_FINDING)
		{
			kosten = 3;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: »«√Œ“Œ¬À≈Õ»≈ –”Õ
	//
	if(talent == NPC_TALENT_RUNES)
	{
		if(skill == SPL_PalLight)
		{
			kosten = 1;
		}
		else if(skill == SPL_PalLightHeal)
		{
			kosten = 3;
		}
		else if(skill == SPL_PalHolyBolt)
		{
			kosten = 3;
		}
		else if(skill == SPL_PalMediumHeal)
		{
			kosten = 5;
		}
		else if(skill == SPL_PalRepelEvil)
		{
			kosten = 5;
		}
		else if(skill == SPL_PalFullHeal)
		{
			kosten = 10;
		}
		else if(skill == SPL_PalDestroyEvil)
		{
			kosten = 10;
		}
		else if(skill == SPL_PalTeleportSecret)
		{
			kosten = 5;
		}
		else if(skill == SPL_Light)
		{
			kosten = 1;
		}
		else if(skill == SPL_Firebolt)
		{
			kosten = 5;
		}
		else if(skill == SPL_LightHeal)
		{
			kosten = 3;
		}
		else if(skill == SPL_SummonGoblinSkeleton)
		{
			kosten = 3;
		}
		else if(skill == SPL_Zap)
		{
			kosten = 3;
		}
		else if(skill == SPL_Icebolt)
		{
			kosten = 5;
		}
		else if(skill == SPL_InstantFireball)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonWolf)
		{
			kosten = 5;
		}
		else if(skill == SPL_SummonIceWolf)
		{
			kosten = 5;
		}
		else if(skill == SPL_WindFist)
		{
			kosten = 5;
		}
		else if(skill == SPL_Sleep)
		{
			kosten = 5;
		}
		else if(skill == SPL_Charm)
		{
			kosten = 5;
		}
		else if(skill == SPL_IceLance)
		{
			kosten = 5;
		}
		else if(skill == SPL_Whirlwind)
		{
			kosten = 5;
		}
		else if(skill == SPL_MediumHeal)
		{
			kosten = 5;
		}
		else if(skill == SPL_LightningFlash)
		{
			kosten = 5;
		}
		else if(skill == SPL_ChargeFireball)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonSkeleton)
		{
			kosten = 10;
		}
		else if(skill == SPL_Fear)
		{
			kosten = 5;
		}
		else if(skill == SPL_IceCube)
		{
			kosten = 10;
		}
		else if(skill == SPL_Thunderstorm)
		{
			kosten = 5;
		}
		else if(skill == SPL_Geyser)
		{
			kosten = 10;
		}
		else if(skill == SPL_ChargeZap)
		{
			kosten = 10;
		}
		else if(skill == SPL_SummonGolem)
		{
			kosten = 15;
		}
		else if(skill == SPL_DestroyUndead)
		{
			kosten = 10;
		}
		else if(skill == SPL_Pyrokinesis)
		{
			kosten = 10;
		}
		else if(skill == SPL_WaterFist)
		{
			kosten = 10;
		}
		else if(skill == SPL_Firestorm)
		{
			kosten = 15;
		}
		else if(skill == SPL_IceWave)
		{
			kosten = 20;
		}
		else if(skill == SPL_SummonDemon)
		{
			kosten = 20;
		}
		else if(skill == SPL_FullHeal)
		{
			kosten = 10;
		}
		else if(skill == SPL_MasterOfDisaster)
		{
			kosten = 15;
		}
		else if(skill == SPL_Firerain)
		{
			kosten = 20;
		}
		else if(skill == SPL_BreathOfDeath)
		{
			kosten = 20;
		}
		else if(skill == SPL_MassDeath)
		{
			kosten = 20;
		}
		else if(skill == SPL_ArmyOfDarkness)
		{
			kosten = 20;
		}
		else if(skill == SPL_Shrink)
		{
			kosten = 20;
		}
		else
		{
			kosten = 5;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: œÀ¿¬ ¿
	//
	if(talent == NPC_TALENT_FUSING)
	{
		if(skill == FUSING_GOLD)
		{
			kosten = 3;
		}
		else if(skill == FUSING_MAGICORE)
		{
			kosten = 5;
		}
		else if(skill == FUSING_IRONORE)
		{
			kosten = 5;
		}
		else if(skill == FUSING_BLACKORE)
		{
			kosten = 5;
		}
		else if(skill == FUSING_SILVERORE)
		{
			kosten = 5;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: Œ–Œ◊‹≈ Œ–”∆»≈
	//
	if(talent == NPC_TALENT_ORCWEAPON)
	{
		if(skill == ORCWEAPON_LEVEL_FIRST)
		{
			kosten = 15;
		}
		else if(skill == ORCWEAPON_LEVEL_SECOND)
		{
			kosten = 20;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: ƒ¬¿  À»Õ ¿
	//
	if(talent == NPC_TALENT_2X2H)
	{
		if(skill == WEAPON_2X2_LEVEL_FIRST)
		{
			kosten = 15;
		}
		else if(skill == WEAPON_2X2_LEVEL_SECOND)
		{
			kosten = 20;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: Ÿ»“
	//
	if(talent == NPC_TALENT_SHIELD)
	{
		if(skill == SHIELD_LEVEL_FIRST)
		{
			kosten = 15;
		}
		else if(skill == SHIELD_LEVEL_SECOND)
		{
			kosten = 20;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: œŒ¬€ÿ≈Õ»≈ «¿Ÿ»“€ “≈À¿
	//
	if(talent == NPC_DS_PROTECTION)
	{
		if((skill == PROT_BLUNT) || (skill == PROT_EDGE))
		{
			kosten = 20;
		}
		else if(skill == PROT_FIRE)
		{
			kosten = 10;
		}
		else if(skill == PROT_FLY)
		{
			kosten = 10;
		}
		else if(skill == PROT_MAGIC)
		{
			kosten = 10;
		}
		else if(skill == PROT_POINT)
		{
			kosten = 15;
		};
	};
	//
	//---------Œ¡”◊≈Õ»≈: Œ¡–¿¡Œ“ ¿  Œ∆», »«√Œ“Œ¬À≈Õ»≈ ƒŒ—œ≈’Œ¬
	//
	if(talent == NPC_DS_SKIN)
	{
		if(skill == SKIN_COMMON)
		{
			kosten = 3;
		}
		else if(skill == SKIN_DO_LIGHT)
		{
			kosten = 5;
		}
		else if(skill == SKIN_REDO_LIGHT)
		{
			kosten = 2;
		}
		else if(skill == SKIN_DO_MEDIUM)
		{
			kosten = 10;
		}
		else if(skill == SKIN_REDO_MEDIUM)
		{
			kosten = 3;
		}
		else if(skill == SKIN_DO_HARD)
		{
			kosten = 15;
		}
		else if(skill == SKIN_REDO_HARD)
		{
			kosten = 5;
		}
		else if(skill == SKIN_DO_TROLL)
		{
			kosten = 20;
		}
		else if(skill == SKIN_REDO_TROLL)
		{
			kosten = 7;
		};
	};
	return kosten;
};

