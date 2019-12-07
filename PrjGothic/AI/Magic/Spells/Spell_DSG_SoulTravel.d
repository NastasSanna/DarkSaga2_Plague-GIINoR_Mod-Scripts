//******************************************************************
//						ПУТЕШЕСТВИЕ ДУШИ
//  На NPC не действует.
//*******************************************************************

const int SPL_Cost_SoulTravel = 50;	//UNFINISHED
var int SoulTravel_BodyInst;	//из какого тела вылезла душа

instance Spell_SoulTravel(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;
	targetCollectAlgo = TARGET_COLLECT_NONE;
	canTurnDuringInvest = 0;
};
func int Spell_Logic_SoulTravel(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{	
		Print("SPL_SENDSTOP cursed");
		return SPL_SENDSTOP;
	};
	if(Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		Print("SPL_SENDCAST scroll");
		return SPL_SENDCAST;
	}
	else if(self.attribute[ATR_MANA] >= SPL_Cost_SoulTravel)
	{
		Print("SPL_SENDCAST rune");
		return SPL_SENDCAST;
	};
	Print("SPL_SENDSTOP no mana");
	return SPL_SENDSTOP;
};
func void Spell_Cast_SoulTravel()
{
	Print("Spell_Cast_SoulTravel");
	b_UnblessedCursedSpell();
	if(Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] -= SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] -= SPL_Cost_SoulTravel;
	};
	self.aivar[AIV_SelectSpell] += 1;
	if(Npc_IsPlayer(self))	//только для игрока!
	{
		var C_NPC Body;	Body = Hlp_GetNpc(self);
		var oCNpc Body_mem;	Body_mem = Hlp_GetNpc(self);
		Print("Spell_Cast_SoulTravel Npc_IsPlayer");
		SoulTravel_BodyInst = Hlp_GetInstanceID(self);	//запоминаем, из какого тела вылезли
		if (Wld_InsertWP(Body_mem._zCVob_trafoObjToWorld[3], Body_mem._zCVob_trafoObjToWorld[7], Body_mem._zCVob_trafoObjToWorld[11],
		             "WP_SOULLESSBODY") > 0)
		{
			Wld_SpawnNpcRange(self,PC_PlayerSoul,1,-1);	//создаем дух
			Npc_SetAsPlayer(PC_PlayerSoul);//вселяемся
			AI_StartState(Body, ZS_SoullessBody,1,"WP_SOULLESSBODY");	//тело уходит в бессознанку
		};
	};
};
