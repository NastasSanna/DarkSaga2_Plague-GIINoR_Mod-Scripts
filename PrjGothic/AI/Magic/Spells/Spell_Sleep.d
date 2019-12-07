
const int SPL_Cost_Sleep = 30;
const int SPL_TIME_Sleep = 30;

instance Spell_Sleep(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
};
func int Spell_Logic_Sleep(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{
		return SPL_SENDSTOP;
	};
	if((Npc_GetDistToNpc(self,other) >= 1500) && Npc_IsPlayer(self))
	{
		B_Say_Overlay(self,self,"$DOESNTWORK");
		PrintScreen("Хм, наверно надо подойти поближе",-1,-1,Font_ScreenSmall_Red_HI,3);
		return SPL_SENDSTOP;
	};
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)) || (self.attribute[ATR_MANA] >= SPL_Cost_Sleep))
	{
		if(Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] -= SPL_Cost_Sleep;
		};
		if(!C_BodyStateContains(other,BS_SWIM) && !C_BodyStateContains(other,BS_DIVE) && !C_NpcIsDown(other) 
		&& (other.guild < GIL_SEPERATOR_HUM) && (other.flags != NPC_FLAG_IMMORTAL) 
		&& (Npc_GetDistToNpc(self,other) <= 1500) && (other.guild != GIL_KDF) && (other.guild != GIL_DMT) 
		&& (other.guild != GIL_PAL))
		{
			Npc_ClearAIQueue(other);
			B_ClearPerceptions(other);
			AI_StartState(other,ZS_MagicSleep,0,"");
		};		
		return SPL_SENDCAST;
	}	
	else
	{
		return SPL_SENDSTOP;
	};
	//добавлено под конец
	return SPL_SENDSTOP;
};
func void Spell_Cast_Sleep()
{
	b_UnblessedCursedSpell();
	self.aivar[AIV_SelectSpell] += 1;
};
