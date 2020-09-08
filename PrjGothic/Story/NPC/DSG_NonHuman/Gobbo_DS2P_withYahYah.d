
//¬месте с ях-ях на входе в деревню гоблинов

instance Gobbo_withYahYah_1(Mst_Default_DS_Gobbo_Berserk)	
{
	id = 1914;
	name[0] = "√облин-охранник";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_DS_Gobbo_Berserk1();
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
	daily_routine = Rtn_Start_1914;
};

func void Rtn_Start_1914()
{
	TA_Stand_WP(8,0,21,0,"DP_FOREST_GOBBOVIL_02_TENT");
	TA_SitOrk(21,0,8,0,"DP_FOREST_GOBBOVIL_02_TENT");
};

instance Gobbo_withYahYah_2(Mst_Default_DS_Gobbo_Berserk)
{
	id = 1915;
	name[0] = "√облин-охранник";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_DS_Gobbo_Berserk1();
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
	daily_routine = Rtn_Start_1915;
};

func void Rtn_Start_1915()
{
	TA_Stand_WP(8,0,21,0,"DP_FOREST_GOBBOVIL_02_TENT");
	TA_SitOrk(21,0,8,0,"DP_FOREST_GOBBOVIL_02_TENT");
};


