
// охрана вождя

instance Gobbo_ChiefGuard_1(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Гоблин-охранник";
	id = 1912;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Warrior_Visir();
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	daily_routine = Rtn_Start_1912;
};

func void Rtn_Start_1912()
{
	TA_Guard_Passage(8,0,21,0,"DP_FOREST_SWAMPTEMPLE_TRONE_LEFT");
	TA_Guard_Passage(21,0,8,0,"DP_FOREST_SWAMPTEMPLE_TRONE_LEFT");
};

instance Gobbo_ChiefGuard_2(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Гоблин-охранник";
	id = 1913;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Warrior_Visir();
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	daily_routine = Rtn_Start_1913;
};

func void Rtn_Start_1913()
{
	TA_Guard_Passage(8,0,21,0,"DP_FOREST_SWAMPTEMPLE_TRONE_RIGHT");
	TA_Guard_Passage(21,0,8,0,"DP_FOREST_SWAMPTEMPLE_TRONE_RIGHT");
};

