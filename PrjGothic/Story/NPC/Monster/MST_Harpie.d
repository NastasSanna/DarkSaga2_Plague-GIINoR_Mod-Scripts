
prototype Mst_Default_Harpie(C_Npc)
{
	name[0] = "Γΰποθÿ";
	guild = GIL_HARPY;
	aivar[AIV_MM_REAL_ID] = ID_HARPY;
	level = 16;
	B_DS_SetMst_Attribute(cMst_Default_Harpie);
	protection[PROT_BLUNT] = 95;
	protection[PROT_EDGE] = 95;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 95;
	protection[PROT_FLY] = 95;
	protection[PROT_MAGIC] = 5;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HARPY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_Harpie()
{
	Mdl_SetVisual(self,"Harpie.mds");
	Mdl_SetVisualBody(self,"Har_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Harpie(Mst_Default_Harpie)
{
	B_SetVisuals_Harpie();
	CreateInvItems(self,ItAt_HarpyBlood,1);
	Npc_SetToFistMode(self);
};
