
prototype Mst_Default_MinecrawlerWarrior(C_Npc)
{
	name[0] = "Ползун-воин";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_MINECRAWLERWARRIOR;
	level = 16;
	B_DS_SetMst_Attribute(cMst_Default_MinecrawlerWarrior);
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 110;
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
func void B_SetVisuals_MinecrawlerWarrior()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Cr2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance MinecrawlerWarrior(Mst_Default_MinecrawlerWarrior)
{
	B_SetVisuals_MinecrawlerWarrior();
	Npc_SetToFistMode(self);
};
instance MINECRAWLERWARRIOR_DS(Mst_Default_MinecrawlerWarrior)
{
	name[0] = "Ползун-воин";
	B_SetVisuals_MinecrawlerWarrior();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.2,1.2,1.2);
	level = 22;
	attribute[ATR_STRENGTH] = 130;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 330;
	attribute[ATR_HITPOINTS] = 330;
};
