//зеленые безымянные гоблины

instance Gobbo_DS2P_Green_01(Mst_Default_Gobbo_Green)	
{
	id = 1930;
	name[0] = "Зеленый гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1930;
};

func void Rtn_Start_1930()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM04_03");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Rest,"DP_FOREST_SWAMPTEMPLE_ROOM04_03");
};


instance Gobbo_DS2P_Green_02(Mst_Default_Gobbo_Green)	
{
	id = 1931;
	name[0] = "Зеленый гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1931;
};

func void Rtn_Start_1931()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM05_CAMPFIRE");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Rest,"DP_FOREST_SWAMPTEMPLE_ROOM05_CAMPFIRE");
};