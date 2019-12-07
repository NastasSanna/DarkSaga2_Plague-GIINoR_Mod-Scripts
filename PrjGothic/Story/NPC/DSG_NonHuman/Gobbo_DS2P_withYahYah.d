
//¬месте с ях-ях на входе в деревню гоблинов

instance Gobbo_withYahYah_1(Mst_Default_DS_Gobbo_Berserk)	
{
	name[0] = "√облин-охранник";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_DS_Gobbo_Berserk1();
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
};

instance Gobbo_withYahYah_2(Mst_Default_DS_Gobbo_Berserk)
{
	name[0] = "√облин-охранник";
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_DS_Gobbo_Berserk1();
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
};


