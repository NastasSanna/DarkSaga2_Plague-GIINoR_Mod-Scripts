
const int SPL_Cost_Icelance = 45;
const int SPL_DAMAGE_Icelance = 160;

instance Spell_Icelance(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_Icelance;
	damagetype = DAM_MAGIC;
};
func int Spell_Logic_Icelance(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{		return SPL_SENDSTOP;	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_Icelance)
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
func void Spell_Cast_Icelance()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Icelance;
	};
	self.aivar[AIV_SelectSpell] += 1;
};
