
func void ZS_Circle()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	Npc_SetPercTime(self,0.3);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int ZS_Circle_Loop()
{
	var int randy;
	var int randyKDW;
	var int randyKDW_Lightstar;
	if(self.guild == GIL_DMT)
	{
		randy = Hlp_Random(3000);
		if(Npc_GetStateTime(self) > randy)
		{
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
		};
	}
	else
	{
		randy = Hlp_Random(1000);
		if(Npc_GetStateTime(self) > randy)
		{
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Circle_End()
{
};

