
const int SPL_Cost_MassDeath = 200;
const int SPL_Damage_MassDeath = 888;

instance Spell_MassDeath(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_MassDeath;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};
func int Spell_Logic_Massdeath(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{		return SPL_SENDSTOP;	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_MassDeath)
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
func void Spell_Cast_Massdeath()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_MassDeath;
	};
	self.aivar[AIV_SelectSpell] += 1;
};
