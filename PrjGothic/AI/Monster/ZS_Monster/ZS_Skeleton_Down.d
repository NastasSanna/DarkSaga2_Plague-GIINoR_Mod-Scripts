func void ZS_SkeletonDown()
{
	B_ClearPerceptions(self);
	self.noFocus = TRUE;
	self.bodyStateInterruptableOverride = TRUE;
	Npc_SetPercTime(self,1);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self, self.wp);
	};
};

func int ZS_SkeletonDown_LOOP()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_DEAD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	self.noFocus = TRUE;
	self.bodyStateInterruptableOverride = TRUE;
	return LOOP_CONTINUE;
};

func void ZS_SkeletonDown_END()
{
	AI_PlayAni(self,"T_SPAWN");
	self.noFocus = FALSE;
	self.bodyStateInterruptableOverride = FALSE;
};
