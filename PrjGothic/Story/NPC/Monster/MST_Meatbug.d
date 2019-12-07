
prototype Mst_Default_Meatbug(C_Npc)
{
	name[0] = "ћ€сной жук";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level = 1;
	B_DS_SetMst_Attribute(cMst_Default_Meatbug);
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};
func void B_SetVisuals_Meatbug()
{
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Meatbug(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};

instance MEATBUG_COMETOHERO(Mst_Default_Meatbug)
{
	Mdl_SetVisual(self,"Meatbug.mds");
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 4000;
	start_aistate = zs_mm_rtn_cometohero;
	noFocus = TRUE;
	flags = NPC_FLAG_IMMORTAL;
};

instance MEATBUG_Invisible(Mst_Default_Meatbug)
{
	noFocus = TRUE;
	Mdl_SetVisual(self,"Meatbug.mds");
};
