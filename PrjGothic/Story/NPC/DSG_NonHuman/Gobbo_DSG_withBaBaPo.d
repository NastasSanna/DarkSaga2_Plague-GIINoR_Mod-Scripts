
//воины, вместе с Ба-Ба-По атакуют пиратов, возвращают статуэтку Гуруна
//потом возвращаются в деревню гоблинов на болото

instance Gobbo_withBaBaPo_1(Mst_Default_Gobbo_Warrior)
{
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

instance Gobbo_withBaBaPo_2(Mst_Default_Gobbo_Warrior)
{
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};
