
const int SPL_COST_Deathbolt = 25;
const int SPL_DAMAGE_Deathbolt = 200;

instance Spell_Deathbolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Deathbolt;
};
func int Spell_Logic_Deathbolt(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_Deathbolt)
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
func void Spell_Cast_Deathbolt()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_COST_Deathbolt;
	};
	self.aivar[AIV_SelectSpell] += 1;
};
