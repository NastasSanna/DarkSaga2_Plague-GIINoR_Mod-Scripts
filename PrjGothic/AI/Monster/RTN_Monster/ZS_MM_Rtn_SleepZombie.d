
func void B_ZOMBIE_RISE()
{
	if(Npc_GetDistToNpc(self,hero) <= 500)
	{
		AI_PlayAniBS(self,"T_SLEEP_2_STAND",BS_STAND);
		//AI_TurnToNpc(self,hero);
	};
};

func void ZS_MM_Rtn_SleepZombie()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	//Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_ZOMBIE_RISE);
	//Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_SleepZombie_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAniBS(self,"T_STAND_2_SLEEP",BS_LIE);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_SleepZombie_end()
{
	//AI_PlayAniBS(self,"T_SLEEP_2_STAND",BS_STAND);
};
