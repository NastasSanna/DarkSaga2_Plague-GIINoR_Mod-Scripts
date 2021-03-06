
const int SPL_Cost_PalHolyBolt = 10;
const int SPL_Damage_PalHolyBolt = 200;

instance Spell_PalHolyBolt(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_PalHolyBolt;
};
func int Spell_Logic_PalHolyBolt(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{		return SPL_SENDSTOP;	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_PalHolyBolt)
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
func void Spell_Cast_PalHolyBolt()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_PalHolyBolt;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

