
//Черные безымянные гоблины

instance Gobbo_DS2P_Black_01(Mst_Default_Gobbo_Black)	
{
	id = 1941;
	name[0] = "Черный гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1941;
};

func void Rtn_Start_1941()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Rest,"DP_FOREST_SWAMPTEMPLE_ROOM04_04");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM04_04");
};

instance Gobbo_DS2P_Black_02(Mst_Default_Gobbo_Black)	
{
	id = 1942;
	name[0] = "Черный гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1942;
};

func void Rtn_Start_1942()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Rest,"DP_FOREST_SWAMPTEMPLE_ROOM05_02_CAMPFIRE");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM05_02_CAMPFIRE");
};

instance Gobbo_DS2P_Black_03(Mst_Default_Gobbo_Black)	
{
	id = 1942;
	name[0] = "Черный гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1943;
};

func void Rtn_Start_1943()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Rest,"DP_FOREST_SWAMPTEMPLE_ROOM2_07");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM2_07");
};

instance Gobbo_DS2P_Black_04(Mst_Default_Gobbo_Black)	
{
	id = 1942;
	name[0] = "Черный гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1944;
};

func void Rtn_Start_1944()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Rest,"DP_FOREST_SWAMPTEMPLE_ROOM2_06");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM2_06");
};

instance Gobbo_DS2P_Black_05(Mst_Default_Gobbo_Black)	
{
	id = 1942;
	name[0] = "Черный гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1945;
};

func void Rtn_Start_1945()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Rest,"DP_FOREST_SWAMPTEMPLE_ROOM01_TO_ROOM04_01");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM01_TO_ROOM04_01");
};
