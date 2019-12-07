//NS (24.02.14) сюда весь спец урон. Вызывать там, где обычный B_AssessDamage отключен
func void B_SpecailDamage()
{
	B_MagicWeaponDamage(other,self);
	B_IceKlinge_Damage(other,self);
	//B_MilarSwordSpecialDamage(other,self);
	B_ArrowBonusDamage_S(other,self);
	B_BoltBonusDamage_S(other,self);
	//B_TestDamage(other,self);		//ТЕСТОВОЕ
};
func void B_AssessDamage()
{
	if (!Hlp_IsValidNpc(other))
	{
		/* DEBUG INFO
		PrintSelf("B_AssessDamage: No other");
		//*/
		return;
	};
	B_SpecailDamage();	//NS (24.02.14)
	if((self.attribute[ATR_HITPOINTS] < 0) && (Npc_IsPlayer(other) || (!Npc_IsPlayer(other) && (other.aivar[AIV_PARTYMEMBER] == TRUE))))
	{
		if(self.aivar[AIV_VictoryXPGiven] == FALSE)
		{
			B_GivePlayerXP(self.level * XP_PER_VICTORY);
			self.aivar[AIV_VictoryXPGiven] = TRUE;
		};
		self.aivar[AIV_KilledByPlayer] = TRUE;
		B_Say_Overlay(self,other,"$dead");
		Npc_SendPassivePerc(self,PERC_ASSESSMURDER,self,other);
		AI_StartState(self,ZS_Dead,0,"");
		/*FOR SHIELD*///AI_DropShield(self);
		
		B_DS_FillingGhoulGlass(other,self);
	};
	if(self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
	};
	if(Npc_IsInState(self,ZS_Attack))
	{
		if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
		{
			return;
		};
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if((self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other)) || (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)))
			{
				Npc_SetTarget(self,other);
			}
			else
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID(other);
			};
		};
		return;
	};
	if(B_AssessEnemy())
	{
		return;
	};
	if(!Npc_IsPlayer(other) && (other.aivar[AIV_ATTACKREASON] == AR_NONE))
	{
		B_Attack(self,other,AR_NONE,0);
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MELEE) || Npc_IsInFightMode(other,FMODE_FIST) || Npc_IsInFightMode(other,FMODE_NONE))
	{
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (((self.npcType == NPCTYPE_FRIEND) || (self.aivar[AIV_PARTYMEMBER] == TRUE)) && Npc_IsPlayer(other)))
		{
			if(!Npc_IsInState(self,ZS_ReactToDamage))
			{
				Npc_ClearAIQueue(self);
				B_ClearPerceptions(self);
				AI_StartState(self,ZS_ReactToDamage,0,"");
				return;
			};
		};
	};
	B_Attack(self,other,AR_ReactToDamage,0);
};

