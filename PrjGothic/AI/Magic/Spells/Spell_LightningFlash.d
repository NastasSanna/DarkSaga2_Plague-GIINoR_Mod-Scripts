
const int SPL_Cost_LightningFlash = 50;
const int SPL_Damage_LightningFlash = 175;
const int SPL_ZAPPED_DAMAGE_PER_SEC = 2;
const int SPL_TIME_SHORTZAPPED = 2;

instance Spell_LightningFlash(C_Spell_Proto)
{
	time_per_mana = 0;
	damage_per_level = SPL_Damage_LightningFlash;
	damagetype = DAM_MAGIC;
};
func int Spell_Logic_LightningFlash(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{		return SPL_SENDSTOP;	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_LightningFlash)
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
func void Spell_Cast_LightningFlash()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_LightningFlash;
	};
	self.aivar[AIV_SelectSpell] += 1;
};
