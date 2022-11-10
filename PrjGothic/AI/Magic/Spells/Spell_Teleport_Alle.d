
const int SPL_Cost_Teleport = 10;

func void B_PrintTeleportTooFarAway(var int level)
{
	if(level != CurrentLevel)
	{
		PrintScreen(PRINT_TeleportTooFarAway,-1,YPOS_LevelUp,FONT_ScreenSmall,2);
	};
};


instance Spell_Teleport(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_CASTER;
	canTurnDuringInvest = 0;
	targetCollectRange = 0;
	targetCollectAzi = 0;
	targetCollectElev = 0;
};


func int Spell_Logic_TeleportForestTower(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportForestTower()
{
	B_PrintTeleportTooFarAway(DSG_PROLOG_ZEN);
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};
	AI_Teleport(self,"FORESTTOWER");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int Spell_Logic_TeleportFortTower(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportFortTower()
{
	B_PrintTeleportTooFarAway(DSG_PROLOG_ZEN);
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};
	AI_Teleport(self,"FORTTOWER");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};

func int Spell_Logic_TeleportCampTower(var int manaInvested)
{
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportCampTower()
{
	B_PrintTeleportTooFarAway(DSG_PROLOG_ZEN);
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};
	AI_Teleport(self,"CAMPTOWER");
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
};


func void Spell_Cast_Teleport()
{
	if(Npc_GetActiveSpell(self) == SPL_DSP_TeleportForestTower)
	{
		Spell_Cast_TeleportForestTower();
	};
	if(Npc_GetActiveSpell(self) == SPL_DSP_TeleportFortTower)
	{
		Spell_Cast_TeleportFortTower();
	};
	if(Npc_GetActiveSpell(self) == SPL_DSP_TeleportCampTower)
	{
		Spell_Cast_TeleportCampTower();
	};

};

