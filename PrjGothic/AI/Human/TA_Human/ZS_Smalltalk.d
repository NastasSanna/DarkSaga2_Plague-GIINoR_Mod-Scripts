
const int SmallTalkFreq = 4;
var int SmallTalkFreq_Multi;

func void ZS_Smalltalk()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Smalltalk_Loop()
{
	if(self.guild == GIL_VLK)
	{
		SmallTalkFreq_Multi = 3;
	}
	else
	{
		SmallTalkFreq_Multi = 2;
	};
	if(Npc_IsOnFP(self,"SMALLTALK"))
	{
		if(Npc_GetStateTime(self) >= (SmallTalkFreq * SmallTalkFreq_Multi))
		{
			Npc_PerceiveAll(self);
			if(Wld_DetectNpc(self,-1,ZS_Smalltalk,-1))
			{
				if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime(other,SmallTalkFreq);
					B_TurnToNpc(self,other);
					B_Say_Smalltalk(BS_STAND);
				};
			};
			Npc_SetStateTime(self,0);
		};
	}
	else if(Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		AI_GotoFP(self,"SMALLTALK");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smalltalk_End()
{
};

