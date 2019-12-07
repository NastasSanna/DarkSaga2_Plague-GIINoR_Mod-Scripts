
//верховный шаман гоблинов
instance Gobbo_DS2P_RaDaPo(Mst_Default_Gobbo_MAG)
{
	name[0] = "Ра-Да-По";
	id = 1902;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_MAG0();
	Npc_SetToFightMode(self,ItMw_1H_Mace_GobboShaman_01);
};
