
const int SPL_Cost_IceWave = 120;

instance Spell_IceWave(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = 111;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};
func int Spell_Logic_IceWave(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{		return SPL_SENDSTOP;	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_IceWave)
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
func void Spell_Cast_IceWave()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_IceWave;
	};
	self.aivar[AIV_SelectSpell] += 1;
};
