
prototype Mst_Default_Gobbo_Warrior(C_Npc)
{
	name[0] = "Гоблин-воин";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BLACK;
	level = 15;
	B_DS_SetMst_Attribute(cMst_Default_Gobbo_Warrior);
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 40;
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
func void B_SetVisuals_Gobbo_Warrior()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",2,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
func void B_SetVisuals_Gobbo_Warrior_Visir()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",3,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Gobbo_Warrior(Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior();
	Npc_SetToFightMode(self,ItMw_1h_MISC_Sword);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};
instance Gobbo_Warrior_Visir(Mst_Default_Gobbo_Warrior)
{
	B_SetVisuals_Gobbo_Warrior_Visir();
	Npc_SetToFightMode(self,ItMw_1h_Misc_Axe);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};
