
func void ZS_Dance()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
	/*
	if((self.guild == GIL_PIR) && (self.npcType == NPCTYPE_Skel))
	{
		AI_EquipArmor(self,ItAr_ds_Santa);
	};
	*/
};

func int ZS_Dance_Loop()
{
	var int danceStyle;
	danceStyle = Hlp_Random(9);
	if(danceStyle == 0)
	{
		AI_PlayAni(self,"T_DANCE_01");
	};
	if(danceStyle == 1)
	{
		AI_PlayAni(self,"T_DANCE_02");
	};
	if(danceStyle == 2)
	{
		AI_PlayAni(self,"T_DANCE_03");
	};
	if(danceStyle == 3)
	{
		AI_PlayAni(self,"T_DANCE_04");
	};
	if(danceStyle == 4)
	{
		AI_PlayAni(self,"T_DANCE_05");
	};
	if(danceStyle == 5)
	{
		AI_PlayAni(self,"T_DANCE_06");
	};
	if(danceStyle == 6)
	{
		AI_PlayAni(self,"T_DANCE_07");
	};
	if(danceStyle == 7)
	{
		AI_PlayAni(self,"T_DANCE_08");
	};
	if(danceStyle == 8)
	{
		AI_PlayAni(self,"T_DANCE_09");
	};
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	return LOOP_CONTINUE;
};

func void ZS_Dance_End()
{
	AI_Standup(self);
};

func void zs_orcdance()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	//if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	if(!Npc_IsOnFP (self, "DANCE"))
	{
		AI_GotoWP(self,self.wp);
		//AI_AlignToWP(self);
	};
};

func int zs_orcdance_loop()
{
	var int danceStyle;
	danceStyle = Hlp_Random(9);
	if(danceStyle < 2)
	{
		AI_PlayAni(self,"T_DANCE");
	}
	else
	{
		AI_PlayAni(self,"T_DANCE_RANDOM_1");
	};
	//AI_GotoWP(self,self.wp);
	//AI_AlignToWP(self);
	return LOOP_CONTINUE;
};

func void zs_orcdance_end()
{
	AI_Standup(self);
};

