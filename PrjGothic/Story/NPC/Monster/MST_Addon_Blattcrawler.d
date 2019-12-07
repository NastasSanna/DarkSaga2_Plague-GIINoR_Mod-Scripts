
prototype Mst_Default_Blattcrawler(C_Npc)
{
	name[0] = "Богомол";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_BLATTCRAWLER;
	level = 15;
	B_DS_SetMst_Attribute(cMst_Default_Blattcrawler);
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 75;
	protection[PROT_MAGIC] = 10;
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

func void B_SetVisuals_Blattcrawler()
{
	Mdl_SetVisual(self,"Blattcrawler.mds");
	Mdl_SetVisualBody(self,"BlattCrawler_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Blattcrawler(Mst_Default_Blattcrawler)
{
	B_SetVisuals_Blattcrawler();
	Npc_SetToFistMode(self);
};

