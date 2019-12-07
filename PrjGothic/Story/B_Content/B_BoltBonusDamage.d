
//***********РАСЧЕТ КОЭФФИЦИЕНТА УРОНА************
//*************************************************
func int B_CBowTalent_Multiplier(var C_NPC enemy)
{
	var int Multiplier;
	var int Talent;
	Talent = enemy.HitChance[NPC_TALENT_CROSSBOW];
	//Multiplier = 100 + Talent/2;
	if(Talent < 30)
	{
		Multiplier = 100 + Talent/2;
	}
	else if(Talent < 60)
	{
		Multiplier = 100 + Talent*2/3;
	}
	else if(Talent >= 60)
	{
		Multiplier = 100 + Talent*3/4;
	};
	return Multiplier;
};

//****РАСЧЕТ ДОП.УРОНА В ЗАВИСИМОСТИ ОТ ГИЛЬДИИ****
//*************************************************
func int B_GuildBoltDopUron(var C_NPC enemy, var C_ITEM bolt)		//доп.урон, зависящий от гильдии
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

//**********************************************
//***************БОНУСЫ БОЛТОВ******************

func int B_BoltBonusDamage_S(var C_Npc oth,var C_Npc slf)
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
	var int HALF, var int HALFFIRE, var int MIX, var int HALFATTRIBUTE, var int MIXATTRIBUTE, var int x1, 
	var int x2; //Заебали эти разнообразные параметры(поэтому беру тупые константы)
	
	Multiplier = B_CBowTalent_Multiplier(oth);		//Множитель высчитывается от степени мастерства владения луком.
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
	if(((EnemyStrength*2/5 + EnemyManaMax*3/5) + WeaponDamage - slf.protection[PROT_MAGIC]) >= 0)
	{
		MIX = (EnemyStrength*2/5 + EnemyManaMax*3/5) + WeaponDamage - slf.protection[PROT_MAGIC];
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
	HALFATTRIBUTE = EnemyDexterity + EnemyStrength;
	
	DopUronDependHitChance = ((Multiplier-100)*WeaponFullDamage)/100;
	
//****************БОЕВЫЕ БОЛТЫ******************	
//***********************************************
	
//***********************************************
//****************Огненный Болт****************		//Готов
	
	if(readyweap.munition == ItRw_Addon_FireBolt)
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
					if( Multiplier*(HALFFIRE)/100 >= 10 )
					{
						slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*HALFFIRE/100;
					}
					else
					{
						slf.attribute[ATR_HITPOINTS] -= 10;
					};
				};
			}
			else if(Monster_is_Class(slf) == MstUndead)
			{
				if( Multiplier*HALFFIRE*40/10000 >= 10 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*HALFFIRE*60/10000;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] -= 10;
				};
			}
			else if(Monster_is_Class(slf) == MstDragon)
			{
				if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
				{
					if( Multiplier*(HALFFIRE)/100 >= 8 )
					{
						slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(HALFFIRE)/100;
					}
					else
					{
						slf.attribute[ATR_HITPOINTS] -= 8;
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
//*****************Обычный Болт****************		//Готова
	
	if(readyweap.munition == ItRw_Bolt_01)
	{
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*45*x2/10000 - DopUronDependHitChance;
			};
		};		
	};	

//********************************************	
//***************Болт на Тролля***************	

	if(readyweap.munition == ItRw_Addon_TrollKillerBolt)
	{
		RandyCriticalDamage = Hlp_Random(100);				//наличие критического урона
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				//шанс критического урона - 30%
				if(RandyCriticalDamage>=30)
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*x2*80/10000) - DopUronDependHitChance;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*x2*140/10000) - DopUronDependHitChance;
				};
			}
			else if(Monster_is_Class(slf) == MstMagic_Monster)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*HALFATTRIBUTE*30/10000);
			}
			else if(Monster_is_Class(slf) == MstUndead)
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*HALFATTRIBUTE*30/10000);
			}
			else if(Monster_is_Class(slf) == MstDragon)
			{
				if( (HALFATTRIBUTE - B_MegaMonster_ProtPoint(slf)) >= 10 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(HALFATTRIBUTE - B_MegaMonster_ProtPoint(slf))/100;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] -= 10;
				};
			}
			else if(Monster_is_Class(slf) == MstTroll)
			{
				if( (HALFATTRIBUTE - B_MegaMonster_ProtPoint(slf)) >= 10 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(HALFATTRIBUTE - B_MegaMonster_ProtPoint(slf))/100;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] -= 10;
				};
			};
		};		
	};

//***************МАГИЧЕСКИЕ СТРЕЛЫ*************
	
//**********************************************			//Готов!
//***************Магический болт**************
	if(readyweap.munition == ItRw_Addon_MagicBolt)
	{
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((slf.guild == GIL_DMT) || (Monster_is_Class(slf) == MstUndead))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX*60)/10000 - DopUronDependHitChance;			
			}
			else if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX*45)/10000 - DopUronDependHitChance;
			};
		};
	};
/*
//**********************************************			//Готов!
//*************Болт возмездия Инноса**********	
	
	if(readyweap.munition == ItRw_InnosRetributionBolt)
	{
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((slf.guild == GIL_DMT) || (Monster_is_Class(slf) == MstUndead))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX)/100 - DopUronDependHitChance;			
			}
			else if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(MIX*70)/10000 - DopUronDependHitChance;
			};
		};
	};
*/
//**********************************************			//ГОТОВ!!!
//****************Болт вампира******************	
	
	if(readyweap.munition == ItRw_Addon_VampirBolt)
	{
		var int difference;					//возвращаемое количество Хитпойнтов(HP)
		var int VampirHPProcent;			//Возвращаемый процент = %навыка владения луком / 2 ;
		VampirHPProcent = oth.HitChance[NPC_TALENT_CROSSBOW] / 2;
		var int ManaDifference;				//Возвращаемое количество очков маны
		var int VampirManaProcent;			//Возвращаемый процент = %навыка владения луком / 4 ;
		VampirManaProcent = oth.HitChance[NPC_TALENT_CROSSBOW] / 4;
		
		difference	   =(x1)*VampirHPProcent  /100;
		ManaDifference =(x1)*VampirManaProcent/100;
		
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
//*********Болт с наконечником из черной руды*****
	
	if(readyweap.munition == ItRw_Addon_BlackOreBolt)
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE_02",slf,slf,0,0,0,FALSE);
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((Monster_is_Class(slf) == 1) || (Monster_is_Class(slf) == MstHuman) || (Monster_is_Class(slf) == 2) || (Monster_is_Class(slf) == 3) 
			|| (Monster_is_Class(slf) == MstOrc) || (Monster_is_Class(slf) == 4))
			{
				//Люди и монстры получают доп.урон - 50% от рассчитанного дамага, не учитывая защиту.
				//Но минимальный урон = 15 единицам ХП
				if( (WeaponDamageWithoutProtection*50/100 - slf.protection[PROT_MAGIC]) >= 15 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*(WeaponDamageWithoutProtection*50/100 - slf.protection[PROT_MAGIC])/100 - DopUronDependHitChance;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - 15 - DopUronDependHitChance;
				};			
			}
			else if(Monster_is_Class(slf) == MstMagic_Monster)
			{
				if( (WeaponDamageWithoutProtection - slf.protection[PROT_MAGIC]) >= 0 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*(WeaponDamageWithoutProtection - slf.protection[PROT_MAGIC])/200);
				};			
			}
			else if(Monster_is_Class(slf) == MstUndead)
			{
				if( (WeaponDamageWithoutProtection - slf.protection[PROT_MAGIC]) >= 0 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*(WeaponDamageWithoutProtection - slf.protection[PROT_MAGIC])/200);
				};
			}
			else if(Monster_is_Class(slf) == MstDragon)
			{
				if( (WeaponDamageWithoutProtection - slf.protection[PROT_MAGIC]) >= 0 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*(WeaponDamageWithoutProtection - slf.protection[PROT_MAGIC])/300);
				};
			}
			else if(Monster_is_Class(slf) == MstTroll)
			{
				if( (WeaponDamageWithoutProtection - slf.protection[PROT_MAGIC]) >= 0 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - (Multiplier*(WeaponDamageWithoutProtection - slf.protection[PROT_MAGIC])/300);
				};
			};
		};
	};
	
//******************************************************	//Готова!!!
//*********Болт с наконечником из магической руды*******
	
	if(readyweap.munition == ItRw_Addon_MagicOreBolt)
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE_01",slf,slf,0,0,0,FALSE);
		if(slf.flags == 0)									//на бессмертных не действует
		{
			if((Monster_is_Class(slf) == MstMonster)||(Monster_is_Class(slf) == MstHuman)||(Monster_is_Class(slf) == MstOrc))
			{
				if( MIX >= 20 )
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - Multiplier*MIX*85/10000 - DopUronDependHitChance;
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] - 20 - DopUronDependHitChance;
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
	//конец стрел
	
//******************************************************
//*********************ОПЫТ*****************************
	/*
	if(Npc_IsDead(slf) && Npc_IsPlayer(oth))
	{
		if(slf.aivar[AIV_VictoryXPGiven] == FALSE)
		{
			B_GivePlayerXP(slf.level*XP_PER_VICTORY);
			slf.aivar[AIV_VictoryXPGiven] = TRUE;
		};
		B_Say_Overlay(slf,oth,"$dead");
		AI_PlayAni(slf,"T_DEAD");
		Npc_SendPassivePerc(slf,PERC_ASSESSMURDER,slf,oth);
		//AI_StartState(slf,ZS_Dead,0,"");
		return TRUE;
	};
	//Npc_SendPassivePerc(slf,PERC_ASSESSFIGHTSOUND,slf,oth);
	*/
	return FALSE;
};	
