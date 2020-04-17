func void B_LookAndSay(var int BS_STATE)
{
	if(Npc_GetDistToNpc(self,other) <= 700)
	{
		AI_LookAtNpc(self,other);
		B_Say_Smalltalk(BS_STATE);
		AI_StopLookAt(self);
	};
};
func void B_Detect_And_SaySmallTalk(var int BS_STATE)
{
	var int random_r;
	random_r = Hlp_Random(5);
	Npc_PerceiveAll(self);
	if(random_r <= 1)
	{
		if(Wld_DetectNpc(self,-1,ZS_Sit_Bench,-1))
		{
			B_LookAndSay(BS_STATE);
		}
		else if(Wld_DetectNpc(self,-1,ZS_Sit_Campfire,-1))
		{
			B_LookAndSay(BS_STATE);
		};
	}
	else if(random_r <= 3)
	{
		if(Wld_DetectNpc(self,-1,ZS_Sit_Campfire,-1))
		{
			B_LookAndSay(BS_STATE);
		}
		else if(Wld_DetectNpc(self,-1,ZS_Sit_Bench,-1))
		{
			B_LookAndSay(BS_STATE);
		};
	}
	else
	{
		if((self.guild == GIL_PIR) || (self.guild == GIL_BDT))
		{
			AI_PlayAniBS(self,"T_JOINT_RANDOM_1",BS_SIT);
			AI_PlayAniBS(self,"T_JOINT_RANDOM_1",BS_SIT);
			AI_PlayAniBS(self,"T_JOINT_RANDOM_1",BS_SIT);
		};
	};
};

func void ZS_Sit_Bench()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int ZS_Sit_Bench_Loop()
{
	var int random;
	if(!C_BodyStateContains(self,BS_SIT) && Wld_IsMobAvailable(self,"BENCH"))
	{
		AI_UseMob(self,"BENCH",1);
	};
	if(C_BodyStateContains(self,BS_SIT) && (Npc_GetStateTime(self) > (10 + (2 * self.aivar[AIV_TALKBREAKTIME])) ) )
	{
		random = Hlp_Random(7);		
		if(random <= 0)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);
		};
		if(random <= 1)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);
		};
		if(random <= 2)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);
		};
		if((random <= 3))
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);
		};
		B_Detect_And_SaySmallTalk(BS_SIT);
		Npc_SetStateTime(self,0);
	};	
	return LOOP_CONTINUE;
};

func void ZS_Sit_Bench_End()
{
	AI_UseMob(self,"BENCH",-1);
};

