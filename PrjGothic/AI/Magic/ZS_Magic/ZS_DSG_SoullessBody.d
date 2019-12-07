
//душа возвращается в тело
func void B_ReturnSoul()
{
	Npc_SetAsPlayer(self);
	B_KillNpc(other);
};

func void ZS_SoullessBody()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_ReturnSoul);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_ReturnSoul);
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	B_StopLookAt(self);
	AI_StopPointAt(self);	
	AI_UnreadySpell(self);
	AI_StandupQuick(self);
};

func int ZS_SoullessBody_Loop()
{  
	return LOOP_CONTINUE;
};

func void ZS_SoullessBody_End()
{
};
