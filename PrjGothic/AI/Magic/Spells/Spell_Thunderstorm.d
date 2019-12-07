
const int SPL_Cost_Thunderstorm = 120;
const int SPL_DAMAGE_Thunderstorm = 300;

instance Spell_Thunderstorm(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Thunderstorm;
	damagetype = DAM_MAGIC;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};
func int Spell_Logic_Thunderstorm(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{		return SPL_SENDSTOP;	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Thunderstorm)
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
func void Spell_Cast_Thunderstorm()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Thunderstorm;
	};
	self.aivar[AIV_SelectSpell] += 1;
};
