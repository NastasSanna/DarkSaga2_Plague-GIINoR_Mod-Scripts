
const int SPL_Cost_Geyser = 150;
const int SPL_DAMAGE_Geyser = 222;

instance Spell_Geyser(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Geyser;
	damagetype = DAM_MAGIC;
};
func int Spell_Logic_Geyser(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Geyser)
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
func void Spell_Cast_Geyser()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Geyser;
	};
	self.aivar[AIV_SelectSpell] += 1;
};
