
//охранник на входе в деревню

instance Gobbo_DS2P_YahYah(Mst_Default_DS_Gobbo_Berserk)
{
	name[0] = "ях-ях";
	id = 1904;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_DS_Gobbo_Berserk1();
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
};

