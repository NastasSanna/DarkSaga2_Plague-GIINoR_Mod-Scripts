
const int SPL_COST_WindBolt = 15;
const int SPL_DAMAGE_WindBolt = 65;

instance Spell_WindBolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_WindBolt;
	damagetype = DAM_FLY;
	targetCollectAlgo = TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange = 2500;
};
func int Spell_Logic_WindBolt(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{		return SPL_SENDSTOP;	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_WindBolt)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	//добавлено под конец
	return SPL_SENDSTOP;
};

func void Spell_Cast_WindBolt()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_COST_WindBolt;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

