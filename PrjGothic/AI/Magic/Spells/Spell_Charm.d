
const int SPL_Cost_Charm = 50;
const int SPL_Damage_Charm = 0;

instance Spell_Charm(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	damage_per_level = SPL_Damage_Charm;
	damagetype = DAM_MAGIC;
};
func int Spell_Logic_Charm(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{
		return SPL_SENDSTOP;
	};
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)) || (self.attribute[ATR_MANA] >= SPL_Cost_Charm))
	{
		if((other.aivar[AIV_NpcSawPlayerCommit] != CRIME_NONE) )
		{		
		};
		B_DeletePetzCrime(other);
		other.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
		other.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
		if(Wld_GetGuildAttitude(other.guild,self.guild) != ATT_HOSTILE)
		{
			if(Npc_GetAttitude(other,self) == ATT_HOSTILE)
			{
				Npc_SetTempAttitude(other,Wld_GetGuildAttitude(other.guild,self.guild));
			};
		};
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
	//��������� ��� �����
	return SPL_SENDSTOP;
};
func void Spell_Cast_Charm()
{
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Charm;
	};
	self.aivar[AIV_SelectSpell] += 1;
};

