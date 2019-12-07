prototype Mst_Default_Karakus(C_Npc)
{
	name[0] = "Каракус";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID] = ID_KARAKUS;
	level = 25;
	B_DS_SetMst_Attribute(cMst_Default_Karakus);
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 70;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 30;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	damagetype = DAM_EDGE;
	//damage[DAM_INDEX_EDGE] = 40;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
	//aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Karakus()
{
	Mdl_SetVisual(self,"Drake.mds");
	Mdl_ApplyOverlayMds(self,"Karakus.mds");
	Mdl_SetVisualBody(self,"Karakus_Body1",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Karakus(Mst_Default_Karakus)
{
	B_SetVisuals_Karakus();
	EquipItem(self,ItMw_DS_MW_Karakus);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};
