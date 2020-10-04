
//Старый безымянный гоблин

instance Gobbo_DS2P_Old(Mst_Default_Gobbo_Black)	
{
	id = 1921;
	name[0] = "Старый гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Black();
	Mdl_SetModelFatness(self, -0.5);
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1921;
};

func void Rtn_Start_1921()
{
	TA_Min(self,7,0,22,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM06_HUT");
	TA_Min(self,22,0,7,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM06_HUT");
};
