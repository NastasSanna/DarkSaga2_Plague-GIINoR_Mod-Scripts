func void ZS_LIE_Always()
{
	//Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	//Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessSleepTalk);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);	//NS - 10/03/2016
	if(!C_BodyStateContains(self,BS_LIE))
	{
		AI_PlayAniBS(self,"T_STAND_2_WOUNDED",BS_LIE);
	};
	AI_SetWalkMode(self,NPC_WALK);
};
func int ZS_LIE_Always_Loop()
{
	if(!C_BodyStateContains(self,BS_LIE))
	{
		AI_PlayAniBS(self,"T_STAND_2_WOUNDED",BS_LIE);
	};
	return LOOP_CONTINUE;
};
func void ZS_LIE_Always_End()
{	
};
