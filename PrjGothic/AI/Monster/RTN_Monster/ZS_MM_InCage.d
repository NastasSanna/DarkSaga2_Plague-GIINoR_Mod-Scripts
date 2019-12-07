
// зверь в клетке
// никуда не убегает, ни на что, кроме боли, не реагирует
//NS (янв.2014)

func void ZS_MM_Rtn_InCage()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_InCage_Loop()
{
	var int randomMove;
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		}
		else
		{
			AI_GotoWP(self,self.wp);
		};
		return LOOP_CONTINUE;
	};
	if(Hlp_Random(1000) <= 5)
	{
		randomMove = Hlp_Random(3);
		if((self.guild != GIL_SKELETON) && (self.guild != GIL_SKELETON_MAGE))
		{
			if(randomMove == 0)
			{
				AI_PlayAni(self,"R_ROAM1");
			};
			if(randomMove == 1)
			{
				AI_PlayAni(self,"R_ROAM2");
			};
			if(randomMove == 2)
			{
				AI_PlayAni(self,"R_ROAM3");
			};
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_InCage_End()
{
};
