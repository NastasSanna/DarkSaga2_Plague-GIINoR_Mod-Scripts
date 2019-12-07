
prototype Mst_Default_Waran(C_Npc)
{
	name[0] = "����";
	guild = GIL_WARAN;
	aivar[AIV_MM_REAL_ID] = ID_WARAN;
	level = 11;
	B_DS_SetMst_Attribute(cMst_Default_Waran);
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};
func void B_SetVisuals_Waran()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_SetVisualBody(self,"War_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Waran(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};
