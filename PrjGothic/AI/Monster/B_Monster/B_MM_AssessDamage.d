
func void B_MM_AssessDamage()
{
	if (!Hlp_IsValidNpc(other))
	{
		return;
	};
	var C_Npc MagGol;
	var C_Item OthWeap;
	var C_Npc STRGol;
	var C_Npc FGol;
	var int ActSpell;

	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;
	B_IceKlinge_Damage(other,self);
	B_MagicWeaponDamage(other,self);
	B_ArrowBonusDamage_S(other,self);
	//{return;}else{};
	B_BoltBonusDamage_S(other,self);
	//{return;}else{};
	if(Npc_IsDead(self) && (Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)))
	{
		if(self.aivar[AIV_VictoryXPGiven] == FALSE)
		{
			B_GivePlayerXP(self.level * XP_PER_VICTORY);
			self.aivar[AIV_VictoryXPGiven] = TRUE;
		};
		self.aivar[AIV_KilledByPlayer] = TRUE;
		B_Say_Overlay(self,other,"$dead");
		//AI_PlayAni(slf,"T_DEAD");
		Npc_SendPassivePerc(self,PERC_ASSESSMURDER,self,other);
		AI_StartState(self,ZS_Dead,0,"");
		return;		
	};
	
// Посох поглощения супротив Голема		
	if(Npc_HasItems(other,ItMW_DrainStaffCharged))
	{
		STRGol = Hlp_GetNpc(StormGolem);
		Npc_GetInvItem(other,ItMW_DrainStaffCharged);
		OthWeap = Npc_GetReadiedWeapon(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRGol)) && (Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item)))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-100);
			return;
		};
	};

// **************убийство огненного
	
	if((Npc_HasItems(other,ItSc_Icelance) || Npc_HasItems(other,ItRu_Icelance)) && (telFireGol == true))
	{
		FGol = Hlp_GetNpc(SfireGolem);
		ActSpell = Npc_GetActiveSpell(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FGol)) && (ActSpell == 73))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-150);
			return;
		};
	};
	
	if((Npc_HasItems(other,ItSc_Icebolt) || Npc_HasItems(other,ItRu_Icebolt)) && (telFireGol == true))
	{
		FGol = Hlp_GetNpc(SfireGolem);
		ActSpell = Npc_GetActiveSpell(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FGol)) && (ActSpell == 20))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-80);
			return;
		};
	};

	if((Npc_HasItems(other,ItSc_IceCube) || Npc_HasItems(other,ItRu_IceCube)) && (telFireGol == true))
	{
		FGol = Hlp_GetNpc(SfireGolem);
		ActSpell = Npc_GetActiveSpell(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FGol)) && (ActSpell == 33))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-100);
			return;
		};
	};
	
	if((Npc_HasItems(other,ItSc_IceWave) || Npc_HasItems(other,ItRu_IceWave)) && (telFireGol == true))
	{
		FGol = Hlp_GetNpc(SfireGolem);
		ActSpell = Npc_GetActiveSpell(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FGol)) && (ActSpell == 39))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-100);
			return;
		};
	};
	
	if((Npc_HasItems(other,ItSc_Thunderstorm) || Npc_HasItems(other,ItRu_Thunderstorm)) && (telFireGol == true))
	{
		FGol = Hlp_GetNpc(SfireGolem);
		ActSpell = Npc_GetActiveSpell(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FGol)) && (ActSpell == 70))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-400);
			return;
		};
	};

	if((Npc_HasItems(other,ItSc_WaterFist) || Npc_HasItems(other,ItRu_WaterFist)) && (telFireGol == true))
	{
		FGol = Hlp_GetNpc(SfireGolem);
		ActSpell = Npc_GetActiveSpell(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FGol)) && (ActSpell == 72))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-200);
			return;
		};
	};
//	гейзер почему-то не пашет. лучше не использовать ваще
	if((Npc_HasItems(other,ItSc_Geyser) || Npc_HasItems(other,ItRu_Geyser)) && (telFireGol == true))
	{
		FGol = Hlp_GetNpc(SfireGolem);
		ActSpell = Npc_GetActiveSpell(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FGol)) && (ActSpell == 75))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-300);
			return;
		};
	};
	
	
	
// убийство огненного 	end

	if((self.guild == GIL_Stoneguardian) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		b_awake_stoneguardian(self);
	};
	if(C_PredatorFoundPrey(other,self))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		B_ClearPerceptions(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
		return;
	};
	if(Npc_IsInState(self,ZS_MM_Attack))
	{
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE))
		{
			return;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE))
		{
			return;
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if(self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID(other))
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
	Npc_ClearAIQueue(self);
	Npc_SetTarget(self,other);
	B_ClearPerceptions(self);
	AI_StartState(self,ZS_MM_Attack,0,"");
};

