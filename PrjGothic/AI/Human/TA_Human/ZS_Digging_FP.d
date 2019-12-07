
func void zs_digging_fp()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(!Npc_HasItems(self,ITMI_DS_SPADE))
	{
		CreateInvItem(self,ITMI_DS_SPADE);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_digging_fp_loop()
{
	if(Npc_IsOnFP(self,"DIG"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"DIG"))
	{
		AI_GotoFP(self,"DIG");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_UseItemToState(self,ITMI_DS_SPADE,1);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	return LOOP_CONTINUE;
};

func void zs_digging_fp_end()
{
	AI_UseItemToState(self,ITMI_DS_SPADE,-1);
};

