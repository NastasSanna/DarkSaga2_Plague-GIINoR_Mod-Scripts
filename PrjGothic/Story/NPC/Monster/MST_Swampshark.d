
prototype Mst_Default_Swampshark(C_Npc)
{
	name[0] = "Речной червь";
	guild = GIL_SWAMPSHARK;
	aivar[AIV_MM_REAL_ID] = ID_SWAMPSHARK;
	level = 22;
	B_DS_SetMst_Attribute(cMst_Default_Swampshark);
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 15;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SWAMPSHARK;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	//aivar[AIV_MM_WuselStart] = OnlyRoutine;
};
func void B_SetVisuals_Swampshark()
{
	Mdl_SetVisual(self,"Swampshark.mds");
	Mdl_SetVisualBody(self,"Swa_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Swampshark(Mst_Default_Swampshark)
{
	B_SetVisuals_Swampshark();
	Mdl_SetModelScale(self,0.5,0.5,0.5);
	Npc_SetToFistMode(self);
};
//Болотный змей – Большая Змея или Га-ра-боль (разумный змей на болотах)
instance Swampshark_DSG_LargeSnake(Mst_Default_Swampshark)
{
	name[0] = "Большая Змея";
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetVisuals_Swampshark();
	Mdl_SetModelScale(self,0.5,0.5,0.5);
	Npc_SetToFistMode(self);
};
