
var int Mst_Class;
const int MstMonster = 1;
const int MstUndead = 5;
const int MstTroll = 6;
const int MstDragon = 7;
const int MstMagic_Monster = 8;
const int MstHuman = 9;
const int MstOrc = 10;

//***********РАСЧЕТ КОЭФФИЦИЕНТА УРОНА************
//*************************************************
func int B_BowTalent_Multiplier(var C_NPC enemy)
{
	var int Multiplier;
	var int Talent;
	Talent = enemy.HitChance[NPC_TALENT_BOW];
	//Multiplier = 100 + Talent/2;
	if(Talent < 30)
	{
		Multiplier = 100 + Talent/3;
	}
	else if(Talent < 60)
	{
		Multiplier = 100 + Talent/2;
	}
	else if(Talent >= 60)
	{
		Multiplier = 100 + Talent*2/3;
	};
	return Multiplier;
};

//****РАСЧЕТ ДОП.УРОНА В ЗАВИСИМОСТИ ОТ ГИЛЬДИИ****
//*************************************************
func int B_GuildArrowDopUron(var C_NPC enemy, var C_ITEM arrow)		//доп.урон, зависящий от гильдии
{
	/*
	if(enemy.guild == GIL_HUN)
	{
		
	}
	
	else if(enemy.guild == GIL_PAL)
	{
		
	}
	else if(enemy.guild == GIL_KDF)
	{
		
	}
	else if(enemy.guild == GIL_KIL)
	{
		
	}
	else if(enemy.guild == GIL_DJG)
	{
		
	}
	else if(enemy.guild == GIL_PAL)
	{
		
	}
	else if(enemy.guild == GIL_PAL)
	{
		
	}
	else if(enemy.guild == GIL_PAL)
	{
		
	}
	*/
	return TRUE;
};

//********************************************
//*************ОПРЕДЕЛЕНИЕ КЛАССА МОСТРА******
func int Monster_is_Class(var C_NPC slf)
{
	if((slf.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_Swamprat)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_Giant_Rat)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SHEEP)	
	||(slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER_DEMON)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_HARPY)	
	//||(slf.aivar[AIV_MM_REAL_ID] == ID_WISP)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)	
	||(slf.aivar[AIV_MM_REAL_ID] == ID_Keiler)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)	
	||(slf.aivar[AIV_MM_REAL_ID] == ID_MEATBUG)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_BLATTCRAWLER)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_Bloodhound)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_OrcBiter)	
	||(slf.aivar[AIV_MM_REAL_ID] == ID_Razor)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_LURKER)		
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)		
	||(slf.aivar[AIV_MM_REAL_ID] == ID_Alligator)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_Icewolf)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)	
	||(slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)	
	||(slf.aivar[AIV_MM_REAL_ID] == ID_WARAN)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_WARG)	
	||(slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)	
	||(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
	||(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(StonePuma))
	||(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Shadowbeast_Addon_Fire)))
	{
		Mst_Class = MstMonster;
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_DEMON)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_SKELETON)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST_SKELETON)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE))
	{
		Mst_Class = MstUndead;
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_TROLL)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK))
	{
		Mst_Class = MstTroll;
	}
	else if(slf.guild == GIL_DRAGON)
	{
		Mst_Class = MstDragon;
	}
	else if((slf.aivar[AIV_MM_REAL_ID] == ID_Stoneguardian)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	||(slf.aivar[AIV_MM_REAL_ID] == ID_Swampgolem))
	{
		Mst_Class = MstMagic_Monster;
	}
	else if(slf.guild < GIL_SEPERATOR_HUM)
	{
		Mst_Class = MstHuman;
	};
	return Mst_Class;
};

//**********************************************
//***************БОНУСЫ СТРЕЛ*******************

func int B_MegaMonster_ProtPoint(var C_NPC MegaMonster)
{
	var int MegaMonster_ProtPoint;
	const int DragonSwamp_ProtPoint = 150;
	const int DragonRock_ProtPoint  = 160;
	const int DragonFire_ProtPoint  = 170;
	const int DragonIce_ProtPoint   = 180;
	const int DragonUndead_ProtPoint= 200;
	const int Troll_ProtPoint 		= 250;
	const int BlackTroll_ProtPoint  = 300;
	
	if(MegaMonster.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		MegaMonster_ProtPoint = DragonFire_ProtPoint;
	}
	else if(MegaMonster.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		MegaMonster_ProtPoint = DragonIce_ProtPoint;
	}
	else if(MegaMonster.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		MegaMonster_ProtPoint = DragonSwamp_ProtPoint;
	}
	else if(MegaMonster.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	{
		MegaMonster_ProtPoint = DragonRock_ProtPoint;
	}
	else if(MegaMonster.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		MegaMonster_ProtPoint = DragonUndead_ProtPoint;
	}
	else if(MegaMonster.aivar[AIV_MM_REAL_ID] == ID_TROLL)
	{
		MegaMonster_ProtPoint = Troll_ProtPoint;
	}
	else if(MegaMonster.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)
	{
		MegaMonster_ProtPoint = BlackTroll_ProtPoint;
	};
	return MegaMonster_ProtPoint;
};

func int B_ArrowBonusDamage_S(var C_Npc oth,var C_Npc slf)
{
	if (!Npc_HasReadiedRangedWeapon(oth))	{return FALSE;};
	var C_Item readyweap;
	var int WeaponDamage;							//дамаг оружия.
	var int WeaponDamageWithoutProtection;			//рассчитанный дамаг, не учитывая защиту.
	var int WeaponFullDamage;						//рассчитанный дамаг, учитывая защиту.
	var int EnemyDexterity;							//ловкость атакующего.
	var int EnemyStrength;							//сила атакующего.
	var int EnemyManaMax;							//макс.мана атакующего.
	var int RandyCriticalDamage;					//шанс критического урона для стрелы Тролля.
	var int Multiplier;								//множитель, зависящий от мастерства владения луком.
	var int DopUronDependHitChance;
	var int HALF, var int HALFFIRE,	var int MIX, var int MIX1, var int HALFATTRIBUTE,var int MIXATTRIBUTE, var int x1; 
	var int x2; //Заебали эти разнообразные параметры(поэтому беру тупые константы)
	
	Multiplier = B_BowTalent_Multiplier(oth);		//Множитель высчитывается от степени мастерства владения луком.
	EnemyDexterity = oth.attribute[ATR_DEXTERITY];
	EnemyStrength  = oth.attribute[ATR_STRENGTH];
	EnemyManaMax   = oth.attribute[ATR_MANA_MAX];
	readyweap = Npc_GetReadiedWeapon(oth);
	WeaponDamage = readyweap.damageTotal;
	WeaponDamageWithoutProtection = WeaponDamage + EnemyDexterity;
	if(slf.protection[PROT_POINT] != IMMUNE)
	{
		if((WeaponDamageWithoutProtection - slf.protection[PROT_POINT]) >= 0)
		{
			WeaponFullDamage = WeaponDamageWithoutProtection - slf.protection[PROT_POINT];
		}
		else
		{
			WeaponFullDamage = 0;
		};
	}
	else
	{
		WeaponFullDamage = 0;
	};
	if(((EnemyDexterity/2 + EnemyStrength/2) + WeaponDamage - slf.protection[PROT_POINT]) >= 0)
	{
		HALF = (EnemyDexterity/2 + EnemyStrength/2) + WeaponDamage - slf.protection[PROT_POINT];
	}
	else
	{
		HALF = 0;
	};
	if(((EnemyDexterity/2 + EnemyStrength/2) + WeaponDamage - slf.protection[PROT_FIRE]) >= 0)
	{
		HALFFIRE = (EnemyDexterity/2 + EnemyStrength/2) + WeaponDamage - slf.protection[PROT_FIRE];
	}
	else
	{
		HALFFIRE = 0;
	};
	if(((EnemyDexterity/3 + EnemyStrength/5 + EnemyManaMax/2) + WeaponDamage - slf.protection[PROT_MAGIC]) >= 0)
	{
		MIX = (EnemyDexterity/3 + EnemyStrength/5 + EnemyManaMax/2) + WeaponDamage - slf.protection[PROT_MAGIC];
	}
	else
	{
		MIX = 0;
	};
	if((EnemyManaMax + WeaponDamage - slf.protection[PROT_MAGIC]) >= 0)
	{
		x1 = EnemyManaMax + WeaponDamage - slf.protection[PROT_MAGIC];
	}
	else
	{
		x1 = 0;
	};
	if((EnemyStrength + WeaponDamage - slf.protection[PROT_POINT]) >= 0)
	{
		x2 = EnemyStrength + WeaponDamage - slf.protection[PROT_POINT];
	}
	else
	{
		x2 = 0;
	};
	MIXATTRIBUTE  = EnemyDexterity/3 + EnemyStrength/5 + EnemyManaMax/2;
	HALFATTRIBUTE = EnemyDexterity/2 + EnemyStrength/2 ;
	
	DopUronDependHitChance = ((Multiplier-100)*WeaponFullDamage)/100;
	
//****************БОЕВЫЕ СТРЕЛЫ******************	
//***********************************************
	
//***********************************************
//****************Огненная Стрела****************		//Готова
	
	if(readyweap.munition == ItRw_Addon_FireArrow)
	{
		Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,10,DAM_FIRE,FALSE);
		if(slf.flags == 0)									//на бессмертных не действует
		{
		if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
		{
			slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*HALFFIRE*50/10000 - DopUronDependHitChance;
		}
		else if(Monster_is_Class(slf) == MstMagic_Monster)
		{
			if(slf.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
			{
				if( Multiplier*(HALFFIRE)/100 >= 5 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*HALFFIRE/100;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] -= 5;
				};
			};
		}
		else if(Monster_is_Class(slf) == MstUndead)
		{
			slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*HALFFIRE*40/10000;
		}
		else if(Monster_is_Class(slf) == MstDragon)
		{
			if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
			{
				if( Multiplier*(HALFFIRE)/100 >= 4 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(HALFFIRE)/100;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] -= 4;
				};
			};
		}
		else if(Monster_is_Class(slf) == MstTroll)
		{
			slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(HALFFIRE)/300;
		};
		};
	};
	
//**********************************************	
//*****************Стрела убийцы****************		//Готова
	
	if(readyweap.munition == ItRw_Addon_KillerArrow)
	{
		Wld_PlayEffect("spellFX_GLB_Soul_Arrow_SPREAD",slf,oth,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_GLB_Soul_Arrow",slf,oth,0,0,0,FALSE);
		
		var int RandyDepHitChance;
		RandyDepHitChance = oth.HitChance[NPC_TALENT_BOW]/3;
		RandyCriticalDamage = Hlp_Random(100);
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if(slf.guild < GIL_SEPERATOR_HUM)
			{
				if(RandyCriticalDamage <= RandyDepHitChance)
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - slf.attribute[ATR_HITPOINTS_MAX];			
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*x2*20/10000 - DopUronDependHitChance;
				};
			};
		};
	};
	
//**********************************************	
//*****************Обычная Стрела****************		//Готова
	
	if(readyweap.munition == ItRw_Arrow)
	{
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*20*x2/10000 - DopUronDependHitChance;
			};
		};		
	};	

//***************МАГИЧЕСКИЕ СТРЕЛЫ*************
//*******************************************************************************************************
	
//**********************************************			//Готова!
//***************Магическая стрела**************
	if(readyweap.munition == ItRw_Addon_MagicArrow)													  
	{
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((slf.guild == GIL_DMT) || (Monster_is_Class(slf) == MstUndead))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX*50)/10000 - DopUronDependHitChance;			
			}
			else if((Monster_is_Class(slf) == MstMonster)
				||(  Monster_is_Class(slf) == MstHuman)
				||(  Monster_is_Class(slf) == MstOrc))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX*40)/10000 - DopUronDependHitChance;
			};
		};
	};

//**********************************************			//Готова!
//*************Стрела возмездия Инноса**********	
	
	if(readyweap.munition == ItRw_InnosRetributionArrow)
	{
		if(slf.flags == 0)			//на бессмертных не действует
		{
			Wld_PlayEffect("spellFX_GLB_INNOSLIGHT_SPREAD",slf,slf,0,0,0,FALSE);
			if((slf.guild == GIL_DMT) || (Monster_is_Class(slf) == MstUndead))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX*50)/10000 - DopUronDependHitChance;			
			}
			else if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX*40)/10000 - DopUronDependHitChance;
			};
		};
	};

//**********************************************			//ГОТОВА!!!
//************Стрела похитителя душ*************	
	
	if(readyweap.munition == ItRw_Addon_VampirArrow)
	{
		var int difference;					//возвращаемое количество Хитпойнтов(HP)
		var int VampirHPProcent;			//Возвращаемый процент = %навыка владения луком / 2 ;
		VampirHPProcent = oth.HitChance[NPC_TALENT_BOW] / 2;
		var int ManaDifference;				//Возвращаемое количество очков маны
		var int VampirManaProcent;			//Возвращаемый процент = %навыка владения луком / 4 ;
		VampirManaProcent = oth.HitChance[NPC_TALENT_BOW] / 4;
		
		difference	  =(x1)*VampirHPProcent  /100;
		ManaDifference=(x1)*VampirManaProcent/100;
		
		if(slf.flags == 0)							//на бессмертных не действует
		{
			Wld_PlayEffect("spellFX_Skull_Skull1",slf,oth,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Skull_SPREAD",slf,slf,0,0,0,FALSE);
			if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX*40)/10000 - DopUronDependHitChance;
				if(oth.attribute[ATR_HITPOINTS] < oth.attribute[ATR_HITPOINTS_MAX])
				{
					if(difference <= (oth.attribute[ATR_HITPOINTS_MAX] - oth.attribute[ATR_HITPOINTS]))
					{
						oth.attribute[ATR_HITPOINTS] += difference;
					}
					else
					{
						oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
					};
				};
				if(oth.attribute[ATR_MANA] < oth.attribute[ATR_MANA_MAX])
				{
					if(ManaDifference <= (oth.attribute[ATR_MANA_MAX] - oth.attribute[ATR_MANA]))
					{
						oth.attribute[ATR_MANA] += ManaDifference;
					}
					else
					{
						oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
					};
				};
			};
		};
	};
	
//**************************************************		//В стадии определения
//****Стрела с наконечником из черной руды**********
	
	if(readyweap.munition == ItRw_Addon_BlackOreArrow)
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE_02",slf,slf,0,0,0,FALSE);
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				if( MIX >= 15 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*80*MIX/10000 - DopUronDependHitChance;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - 15 - DopUronDependHitChance;
				};			
			}
			else if(Monster_is_Class(slf) == MstMagic_Monster)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*MIX/200);
			}
			else if(Monster_is_Class(slf) == MstUndead)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*MIX/200);
			}
			else if(Monster_is_Class(slf) == MstDragon)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*MIX/300);
			}
			else if(Monster_is_Class(slf) == MstTroll)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*MIX/300);
			};
		};
	};
	
//***************************************************		//Готова!!!
//****Стрела с наконечником из магической руды*******
	
	if(readyweap.munition == ItRw_Addon_MagicOreArrow)
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE_01",slf,slf,0,0,0,FALSE);
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				if( MIX >= 10 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*60*MIX/10000 - DopUronDependHitChance;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - 10 - DopUronDependHitChance;
				};			
			}
			else if(Monster_is_Class(slf) == MstMagic_Monster)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*MIX/300);
			}
			else if(Monster_is_Class(slf) == MstUndead)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*MIX/300);
			}
			else if(Monster_is_Class(slf) == MstDragon)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*MIX/400);
			}
			else if(Monster_is_Class(slf) == MstTroll)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*MIX/400);
			};		
		};
	};

	//конец стрел
	return FALSE;
};	
