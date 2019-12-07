
prototype Mst_Default_SleepKeeper(C_Npc)
{
	name[0] = "Ловчий";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID] = ID_SLEEPKEEPER;
	level = 25;
	B_DS_SetMst_Attribute(cMst_Default_SleepKeeper);
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 170;
	protection[PROT_FIRE] = 45;
	protection[PROT_FLY] = 170;
	protection[PROT_MAGIC] = 30;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	//aivar[AIV_MM_RoamStart] = OnlyRoutine;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void B_SetVisuals_SleepKeeper()
{
	Mdl_SetVisual(self,"SleepKeeper.mds");
	Mdl_SetVisualBody(self,"SleepKeeper_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance SleepKeeper(Mst_Default_SleepKeeper)
{
	B_SetVisuals_SleepKeeper();
	EquipItem(self,ItMw_DS_MonWeapon);	
//	Mdl_SetModelScale(self,0.8,0.8,0.8);
};
