
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
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Chief();
	Npc_SetToFightMode(self,ItMw_Schwert1);
};
