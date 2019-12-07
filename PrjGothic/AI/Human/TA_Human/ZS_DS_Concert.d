
func void ZS_DS_Concert()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_DS_Concert_Loop()
{
	var int RandyAni;
	RandyAni = Hlp_Random(100);
	if(Npc_GetStateTime(self) >= 1)
	{
		//AI_PlayAni(self,"T_HGUARD_2_STAND");
		self.aivar[AIV_TAPOSITION] = NOTINPOS;		
		Npc_SetStateTime(self,0);
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		//AI_PlayAni(self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};	
	return LOOP_CONTINUE;
};

func void ZS_DS_Concert_End()
{
};

func void ZS_DS_ConcertSong()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
func int ZS_DS_ConcertSong_Loop()
{
	if(Npc_GetStateTime(self) >= 1)
	{
		self.aivar[AIV_TAPOSITION] = NOTINPOS;	
		Npc_SetStateTime(self,0);
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};	
	return LOOP_CONTINUE;
};

func void ZS_DS_ConcertSong_End()
{
};
