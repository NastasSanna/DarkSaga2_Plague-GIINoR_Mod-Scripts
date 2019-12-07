//Королева Ползунов

prototype Mst_Default_CrawlerQueen(C_Npc)
{
	name[0] = "Королева ползунов";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_MINECRAWLER_QUEEN;
	level = 15;
	B_DS_SetMst_Attribute(cMst_Default_CrawlerQueen);
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};
func void B_SetVisuals_CrawlerQueen()
{
  Mdl_SetVisual(self,"CrwQ2.mds");
  Mdl_SetVisualBody(self,"CrwQ2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance CrawlerQueen_01(Mst_Default_CrawlerQueen)
{
  B_SetVisuals_CrawlerQueen();
  damagetype = DAM_FLY;
  Npc_SetToFistMode(self);
};
