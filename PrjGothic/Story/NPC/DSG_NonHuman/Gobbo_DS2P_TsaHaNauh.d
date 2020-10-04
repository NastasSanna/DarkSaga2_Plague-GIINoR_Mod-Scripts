
//вождь гоблинов
func void B_SetVisuals_Gobbo_Chief()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_ApplyOverlayMds(self,"Gobbo_Berserk.MDS");
	Mdl_SetVisualBody(self,"HGob_Body_Chief",2,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

instance Gobbo_DS2P_TsaHaNauh(Mst_Default_DS_Gobbo_Berserk)
{
	name[0] = "Ца-Ха-Наух";
	id = 1901;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Chief();
	Npc_SetToFightMode(self,ItMw_Schwert1);
	
	daily_routine = Rtn_Start_1901;
};

func void Rtn_Start_1901()
{
	TA_Min(self,8,0,21,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_TRONE");
	TA_Min(self,21,0,8,0,ZS_MM_Rtn_Sit,"DP_FOREST_SWAMPTEMPLE_TRONE");
};

