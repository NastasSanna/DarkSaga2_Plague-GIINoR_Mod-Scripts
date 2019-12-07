
func void ZS_StandWall()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_UnequipWeapons(self);
};

func int ZS_StandWall_Loop()
{
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"WALL"))
	{
		AI_UseMob(self,"WALL",1);
	};
	if((Npc_GetStateTime(self) > 4) && C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		var int random;
		random = Hlp_Random(9);
		if(random == 0)
		{
			AI_PlayAni(self,"R_WALL_RANDOM_1");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"R_WALL_RANDOM_2");
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"R_WALL_RANDOM_3");
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void ZS_StandWall_End()
{
	AI_UseMob(self,"WALL",-1);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
};