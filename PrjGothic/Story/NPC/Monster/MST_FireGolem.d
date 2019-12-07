
prototype Mst_Default_FireGolem(C_Npc)
{
	name[0] = "Огненный голем";
	guild = GIL_FIREGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_FIREGOLEM;
	level = 35;
	B_DS_SetMst_Attribute(cMst_Default_FireGolem);
	protection[PROT_BLUNT] = 180;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 300;
	protection[PROT_MAGIC] = 150;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_FireGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance FireGolem(Mst_Default_FireGolem)
{
	B_SetVisuals_FireGolem();
	Npc_SetToFistMode(self);
};

// DS

instance SFireGolem(Mst_Default_FireGolem)
{
	B_SetVisuals_FireGolem();
	level = 10;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	Npc_SetToFistMode(self);
};
