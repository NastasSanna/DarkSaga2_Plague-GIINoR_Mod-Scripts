
//вождь гоблинов
instance Gobbo_DS2P_TsaHaNauh(Mst_Default_Gobbo_MAG)
{
	name[0] = "Ца-Ха-Наух";
	id = 1901;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_MAG2();
	Npc_SetToFightMode(self,ItMw_1H_Mace_GobboShaman_01);
};
