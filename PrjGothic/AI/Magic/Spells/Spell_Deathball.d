
const int SPL_COST_Deathball = 35;
const int SPL_DAMAGE_Deathball = 265;

instance Spell_Deathball(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Deathball;
};
func int Spell_Logic_Deathball(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_COST_Deathball)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	//��������� ��� �����
	return SPL_SENDSTOP;
};
func void Spell_Cast_Deathball()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_COST_Deathball;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

