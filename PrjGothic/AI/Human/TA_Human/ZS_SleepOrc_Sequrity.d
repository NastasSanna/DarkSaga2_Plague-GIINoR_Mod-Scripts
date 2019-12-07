
// *********************
// Сон орка у штольни
// *********************

func void ZS_SleepOrc_Sequrity()
{	
	//NS - еще не спим, только собираемся. а если спать негде, то и не ляжем
	Perception_Set_Normal();
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	B_ResetAll(self);
	AI_SetWalkmode(self,NPC_WALK);		
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_SleepOrc_Sequrity_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		//NS - а вот теперь спим
		B_ClearPerceptions(self);
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepTalk);
	};			
	return LOOP_CONTINUE;
};

func void ZS_SleepOrc_Sequrity_end()
{
  AI_PlayAni(self,"T_GUARDSLEEP_2_STAND");
};	
