
prototype Mst_Default_Drake(C_Npc)
{
	name[0] = "Краур";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID] = ID_DRAKE;
	level = 25;
	B_DS_SetMst_Attribute(cMst_Default_Drake);
	protection[PROT_BLUNT] = 160;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 160;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 30;
	HitChance[NPC_TALENT_1H] = 80;
	HitChance[NPC_TALENT_2H] = 70;
	damagetype = DAM_FIRE | DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 149;
	damage[DAM_INDEX_EDGE] = 149;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
	//aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Drake()
{
	Mdl_SetVisual(self,"Drake.mds");
	Mdl_SetVisualBody(self,"Drake_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

//Дрейк

instance Drake(Mst_Default_Drake)
{
	B_SetVisuals_Drake();
	EquipItem(self,ItMw_DS_MonWeapon);
	CreateInvItems(self,ItFoMuttonRaw,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};
