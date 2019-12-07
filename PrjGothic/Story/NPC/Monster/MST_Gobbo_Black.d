
prototype Mst_Default_Gobbo_Black(C_Npc)
{
	name[0] = "Черный гоблин";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 7;
	B_DS_SetMst_Attribute(cMst_Default_Gobbo_Black);
	protection[PROT_BLUNT] = 55;
	protection[PROT_EDGE] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = 6;
	aivar[AIV_MM_OrcSitEnd] = 20;
	aivar[AIV_MM_RestStart] = 20;
	aivar[AIV_MM_RestEnd] = 6;
};
func void B_SetVisuals_Gobbo_Black()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Gobbo_Black(Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};
