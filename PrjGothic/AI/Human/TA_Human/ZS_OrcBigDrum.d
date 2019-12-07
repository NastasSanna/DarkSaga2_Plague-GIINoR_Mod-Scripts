
func void zs_orcbigdrum()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,ITMI_DRUMSTICK) < 2)
	{
		CreateInvItems(self,ITMI_DRUMSTICK,2);
	};
};

func int zs_orcbigdrum_loop()
{
	var int randymusic;
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BIGORCDRUM"))
	{
		AI_UseMob(self,"BIGORCDRUM",1);
	};
	if((Npc_GetStateTime(self) > 10) && C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		randymusic = Hlp_Random(3);
		if(randymusic == 0)
		{
			AI_PlayAniBS(self,"T_BIGORCDRUM_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
		}
		else if(randymusic == 1)
		{
			AI_PlayAniBS(self,"T_BIGORCDRUM_RANDOM_2",BS_MOBINTERACT_INTERRUPT);
		}
		else if(randymusic == 2)
		{
			AI_PlayAniBS(self,"T_BIGORCDRUM_RANDOM_3",BS_MOBINTERACT_INTERRUPT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_orcbigdrum_end()
{
	AI_UseMob(self,"BIGORCDRUM",-1);
};

