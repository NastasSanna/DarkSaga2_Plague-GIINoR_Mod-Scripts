
func void zs_orcdrum()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if (Npc_GetBodyState (self) != BS_MOBINTERACT)
	{
		AI_SetWalkMode(self,NPC_WALK);	
		if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"ORCDRUM",1);
  };
};

func int zs_orcdrum_loop()
{
	var int randymusic;
    if(Npc_GetBodyState (self) != BS_MOBINTERACT)
	{
		randymusic = Hlp_Random(3);
		if(randymusic == 0)
		{
			AI_PlayAniBS(self,"T_ORCDRUM_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
		}
		else if(randymusic == 1)
		{
			AI_PlayAniBS(self,"T_ORCDRUM_RANDOM_2",BS_MOBINTERACT_INTERRUPT);
		}
		else if(randymusic == 2)
		{
			AI_PlayAniBS(self,"T_ORCDRUM_RANDOM_3",BS_MOBINTERACT_INTERRUPT);
		};
	};	
	return LOOP_CONTINUE;
};

func void zs_orcdrum_end()
{

	AI_UseMob(self,"ORCDRUM",-1);
};

