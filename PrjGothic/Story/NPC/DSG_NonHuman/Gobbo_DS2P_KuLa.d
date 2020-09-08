
//гоблин-торговец на болоте
//охотник, есть ручной волк
instance Gobbo_DS2P_KuLa(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Ку-Ла";
	id = 1905;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	daily_routine = Rtn_Start_1905;
};

func void Rtn_Start_1905()
{
	TA_Stand_WP(8,0,21,0,"DP_FOREST_GOBBOVIL_03_TENT");
	TA_SitOrk(21,0,8,0,"DP_FOREST_GOBBOVIL_03_TENT");
};
