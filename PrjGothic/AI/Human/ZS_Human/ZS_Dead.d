
func void ZS_Dead()
{
	//***********добавил******************
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
	var int HALF, var int HALFFIRE, var int MIX, var int MIX1, var int HALFATTRIBUTE, var int MIXATTRIBUTE, var int x1, 
	var int x2; //Заебали эти разнообразные параметры(поэтому беру тупые константы)
	Multiplier = B_CBowTalent_Multiplier(other);		//Множитель высчитывается от степени мастерства владения луком.
	EnemyDexterity = other.attribute[ATR_DEXTERITY];
	EnemyStrength  = other.attribute[ATR_STRENGTH];
	EnemyStrength  = other.attribute[ATR_STRENGTH];
	EnemyManaMax   = other.attribute[ATR_MANA_MAX];
	readyweap = Npc_GetReadiedWeapon(other);
	WeaponDamage = readyweap.damageTotal;
	WeaponDamageWithoutProtection = WeaponDamage + EnemyDexterity;
	// +Saturas //
	//AI_DropShield(self); Пока под вопросом
	//удолил
	// end of +Saturas //
	if(self.protection[PROT_POINT] != IMMUNE)
	{
		if((WeaponDamageWithoutProtection - self.protection[PROT_POINT]) >= 0)
		{
			WeaponFullDamage = WeaponDamageWithoutProtection - self.protection[PROT_POINT];
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
	if(((EnemyDexterity/2 + EnemyStrength/2) + WeaponDamage - self.protection[PROT_POINT]) >= 0)
	{
		HALF = (EnemyDexterity/2 + EnemyStrength/2) + WeaponDamage - self.protection[PROT_POINT];
	}
	else
	{
		HALF = 0;
	};
	if(((EnemyDexterity/2 + EnemyStrength/2) + WeaponDamage - self.protection[PROT_FIRE]) >= 0)
	{
		HALFFIRE = (EnemyDexterity/2 + EnemyStrength/2) + WeaponDamage - self.protection[PROT_FIRE];
	}
	else
	{
		HALFFIRE = 0;
	};
	if(((EnemyStrength*2/5 + EnemyManaMax*3/5) + WeaponDamage - self.protection[PROT_MAGIC]) >= 0)
	{
		MIX = (EnemyStrength*2/5 + EnemyManaMax*3/5) + WeaponDamage - self.protection[PROT_MAGIC];
	}
	else
	{
		MIX = 0;
	};
	if(((EnemyStrength*2/5 + EnemyManaMax*3/5) + WeaponDamage - self.protection[PROT_MAGIC]) >= 0)
	{
		MIX1 = (EnemyStrength*2/5 + EnemyManaMax*3/5) + WeaponDamage - self.protection[PROT_MAGIC];
	}
	else
	{
		MIX1 = 0;
	};
	if((EnemyManaMax + WeaponDamage - self.protection[PROT_MAGIC]) >= 0)
	{
		x1 = EnemyManaMax + WeaponDamage - self.protection[PROT_MAGIC];
	}
	else
	{
		x1 = 0;
	};
	if((EnemyStrength + WeaponDamage - self.protection[PROT_POINT]) >= 0)
	{
		x2 = EnemyStrength + WeaponDamage - self.protection[PROT_POINT];
	}
	else
	{
		x2 = 0;
	};
	MIXATTRIBUTE  = EnemyDexterity/3 + EnemyStrength/5 + EnemyManaMax/2;
	HALFATTRIBUTE = EnemyDexterity + EnemyStrength;
	//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StopLookAt(self);
	AI_StopPointAt(self);
	if((Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)) && (self.aivar[AIV_VictoryXPGiven] == FALSE))
	{
		B_GivePlayerXP(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if(Npc_GetDistToNpc(self,other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
		};
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		if(C_DropUnconscious(self, other))
		{
			MadKillerCount += 1;
		};
	};
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//СТРЕЛЫ И БОЛТЫ+++++++++++++++++++++++++++++++
	if((readyweap.munition == ItRw_Addon_BlackOreArrow) || (readyweap.munition == ItRw_Addon_BlackOreBolt))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE_02",self,self,0,0,0,FALSE);
	};
	if((readyweap.munition == ItRw_Addon_MagicOreArrow) || (readyweap.munition == ItRw_Addon_MagicOreBolt))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE_01",self,self,0,0,0,FALSE);		
	};
	if((readyweap.munition == ItRw_Addon_FireArrow) || (readyweap.munition == ItRw_Addon_FireBolt))
	{
		if((Monster_is_Class(self) == MstMonster)||(Monster_is_Class(self) == MstHuman)||(Monster_is_Class(self) == MstOrc))
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		};
	};	
	if((readyweap.munition == ItRw_Addon_VampirArrow) || (readyweap.munition == ItRw_Addon_VampirBolt))
	{
		var int difference;					//возвращаемое количество Хитпойнтов(HP)
		var int VampirHPProcent;			//Возвращаемый процент = %навыка владения луком / 2 ;
		var int VampirHPProcent1;			//Возвращаемый процент = %навыка владения луком / 2 ;
		var int ManaDifference;				//Возвращаемое количество очков маны
		var int VampirManaProcent;			//Возвращаемый процент = %навыка владения луком / 4 ;
		if(readyweap.munition == ItRw_Addon_VampirBolt)
		{
			VampirHPProcent = other.HitChance[NPC_TALENT_CROSSBOW] / 2;
		}
		else if(readyweap.munition == ItRw_Addon_VampirArrow)
		{
			VampirHPProcent = other.HitChance[NPC_TALENT_BOW] / 2;
		};
		if(readyweap.munition == ItRw_Addon_VampirBolt)
		{
			VampirManaProcent = other.HitChance[NPC_TALENT_CROSSBOW] / 4;
		}
		else if(readyweap.munition == ItRw_Addon_VampirArrow)
		{
			VampirManaProcent = other.HitChance[NPC_TALENT_BOW] / 4;
		};
		difference	  =(x1)*VampirHPProcent  /100;
		ManaDifference=(x1)*VampirManaProcent/100;
		Wld_PlayEffect("spellFX_Skull_Skull1",self,other,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_Skull_SPREAD",self,self,0,0,0,FALSE);
		if((Monster_is_Class(self) == MstMonster)||(Monster_is_Class(self) == MstHuman)||(Monster_is_Class(self) == MstOrc))
		{
			if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
			{
				if(difference <= (other.attribute[ATR_HITPOINTS_MAX] - other.attribute[ATR_HITPOINTS]))
				{
					other.attribute[ATR_HITPOINTS] += difference;
				}
				else
				{
					other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
				};
			};
			if(other.attribute[ATR_MANA] < other.attribute[ATR_MANA_MAX])
			{
				if(ManaDifference <= (other.attribute[ATR_MANA_MAX] - other.attribute[ATR_MANA]))
				{
					other.attribute[ATR_MANA] += ManaDifference;
				}
				else
				{
					other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
				};
			};
		};
	};
	//---------------------------------------------------------------------
	//Удаляем фейковые кирки
	if(Npc_HasItems(self,ItMw_2H_Axe_L_02))
	{
		Npc_RemoveInvItems(self,ItMw_2H_Axe_L_02,Npc_HasItems(self,ItMw_2H_Axe_L_02));
	};
	//NS - 26/10/2013 я не понимаю, откуда они берутся!
	B_DS_RemoveFakeItems(self);
	//-----------------------------------------------------------
	
	//-----------------------------------------------------------
	//NS - 18/07/2013
	B_DS2P_CheckLog_OnDeath(self);	//сюда пишем все квестовые проверки
	//-----------------------------------------------------------
	
	
	
	B_GiveTradeInv(self);
	B_GiveDeathInv(self);
	B_ClearRuneInv(self);
	B_DeletePetzCrime(self);
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	B_DS_UnequipWeapons(self);	//Здесь было AI_UnequipWeapons(self);
	self.aivar[AIV_TAPOSITION] = FALSE;
	B_DS_FillingGhoulGlass(other,self);
	self.aivar[AIV_Spell_4_Uncon] = FALSE;
};

func int ZS_Dead_loop()
{
	if(self.aivar[AIV_TAPOSITION] == FALSE)
	{
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	return LOOP_CONTINUE;
};

