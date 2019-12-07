
prototype Mst_Default_Addon_Alligator(C_Npc)
{
	name[0] = "Аллигатор";
	guild = GIL_Alligator;
	aivar[AIV_MM_REAL_ID] = ID_Alligator;
	level = 12;
	B_DS_SetMst_Attribute(cMst_Default_Addon_Alligator);
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Alligator;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};
func void B_SetVisuals_Alligator()
{
	Mdl_SetVisual(self,"Alligator.mds");
	Mdl_SetVisualBody(self,"KRO_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Alligator(Mst_Default_Addon_Alligator)
{
	B_SetVisuals_Alligator();
	Npc_SetToFistMode(self);
};
