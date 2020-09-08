
//верховный шаман гоблинов
instance Gobbo_DS2P_RaDaPo(Mst_Default_Gobbo_MAG)
{
	name[0] = "Ра-Да-По";
	id = 1902;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_MAG0();
	Npc_SetToFightMode(self,ItMw_1H_Mace_GobboShaman_01);
	daily_routine = Rtn_Start_1902;
};

func void Rtn_Start_1902()
{
	TA_Stand_WP(6,0,9,0,"DP_FOREST_SWAMPTEMPLE_ROOM07_04");
	TA_Stand_WP(9,0,18,0,"DP_FOREST_SWAMPTEMPLE_ROOM07_03");
	TA_Stand_WP(18,0,23,0,"DP_FOREST_SWAMPTEMPLE_ROOM07_04");
	TA_SitOrk(23,0,6,0,"DP_FOREST_SWAMPTEMPLE_ROOM07_04");
};