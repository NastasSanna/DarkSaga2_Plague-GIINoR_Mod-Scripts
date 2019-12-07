
func void ZS_MM_Hunt()
{
	Perception_Set_Monster_Rtn();
	AI_Standup(self);
	AI_TurnToNPC(self,other);
	if((self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) || (self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN))
	{
		AI_SetWalkMode(self,NPC_SNEAK);
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);
	};
	AI_GotoNpc(self,other);
};

func int ZS_MM_Hunt_Loop()
{
	return LOOP_END;
};

func void ZS_MM_Hunt_End()
{
};

