
//гоблин-торговец на болоте
//охотник, есть ручной волк

func void B_SetVisuals_Gobbo_Hunter()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_HunterBody",4,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Gobbo_DS2P_KuLa(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Ку-Ла";
	id = 1905;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Hunter();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	daily_routine = Rtn_Start_1905;
};

func void Rtn_Start_1905()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Rest,"DP_FOREST_GOBBOVIL_03_TENT");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Sit,"DP_FOREST_GOBBOVIL_03_TENT");
};

// UNFINISHED - иногда уходит охотиться
func void Rtn_Hunt_1905()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Rest,"DP_FOREST_GOBBOVIL_03_TENT");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Sit,"DP_FOREST_GOBBOVIL_03_TENT");
};