
prototype Mst_Default_Gobbo_Skeleton(C_Npc)
{
	name[0] = "Скелет гоблина";
	guild = GIL_GOBBO_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_SKELETON;
	level = 14;
	B_DS_SetMst_Attribute(cMst_Default_Gobbo_Skeleton);
	protection[PROT_BLUNT] = 85;
	protection[PROT_EDGE] = 85;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 85;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_Gobbo_Skeleton()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gobbo_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Gobbo_Skeleton(Mst_Default_Gobbo_Skeleton)
{
	B_SetVisuals_Gobbo_Skeleton();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};
instance Summoned_Gobbo_Skeleton(Mst_Default_Gobbo_Skeleton)
{
	name[0] = "Вызванный скелет";
	guild = gil_summoned_gobbo_skeleton;
	aivar[AIV_MM_REAL_ID] = id_summoned_gobbo_skeleton;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Gobbo_Skeleton();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};
