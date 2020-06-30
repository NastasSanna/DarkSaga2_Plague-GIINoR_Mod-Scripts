
prototype Mst_Default_DS_Gobbo_Berserk(C_Npc)
{
	name[0] = "Гоблин-берсеркер";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_BERSERK;
	level = 25;
	B_DS_SetMst_Attribute(cMst_Default_DS_Gobbo_Berserk);
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 150;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_DS_Gobbo_Berserk1()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_ApplyOverlayMds(self,"Gobbo_Berserk.MDS");
	Mdl_SetVisualBody(self,"HGob_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};
func void B_SetVisuals_DS_Gobbo_Berserk2()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_ApplyOverlayMds(self,"Gobbo_Berserk.MDS");
	Mdl_SetVisualBody(self,"HGob_Body",2,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};
//DS2P
func void B_SetVisuals_DS2P_Gobbo_BerserkSkeleton()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_ApplyOverlayMds(self,"Gobbo_Berserk.MDS");
	Mdl_SetVisualBody(self,"HGOB_BODY_SKELETON",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,1.15,1.15,1.15);
};

instance Gobbo_BerserkSkeleton(Mst_Default_DS_Gobbo_Berserk)
{
	guild = GIL_GOBBO_SKELETON;
	B_SetVisuals_DS2P_Gobbo_BerserkSkeleton();
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
};
