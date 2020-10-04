
//Молодые безымянные гоблины

instance Gobbo_DS2P_Young(Mst_Default_Gobbo_Green)	
{
	id = 1920;
	name[0] = "Молодой гоблин";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Green();
	Mdl_SetModelScale(self, 0.85, 0.85, 0.85);
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1920;
};

func void Rtn_Start_1920()
{
	TA_Min(self,7,15,22,0,ZS_MM_Rtn_Wusel,"DP_FOREST_SWAMPTEMPLE_ROOM06_02");
	TA_Min(self,22,0,7,15,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_ROOM06_02");
};