
//гоблин-торговец на болоте
//охотник, есть ручной волк
instance Gobbo_DS2P_KuLa(Mst_Default_Gobbo_Warrior)
{
	name[0] = "Ку-Ла";
	id = 1905;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
};

