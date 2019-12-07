
prototype Mst_Default_StormGolem(C_Npc)
{
	name[0] = "Воздушный голем";
	guild = GIL_ICEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STORMGOLEM;
	level = 40;
	flags = NPC_FLAG_GHOST;
	B_DS_SetMst_Attribute(cMst_Default_StormGolem);
	protection[PROT_BLUNT] = 140;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = 170;
	protection[PROT_FLY] = -1;
	protection[PROT_MAGIC] = 200;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_DRAGON_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_StormGolem()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Windgolem.mds");
	Mdl_SetVisualBody(self,"Gol_Wind_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance StormGolem_DS(Mst_Default_StormGolem)
{
	B_SetVisuals_StormGolem();
	Npc_SetToFistMode(self);
};

// DS 

instance StormGolem(Mst_Default_StormGolem)
{
	name[0] = "Вихревой голем";
	level = 10;
	protection[PROT_BLUNT] = IMMUNE;
	protection[PROT_EDGE] = IMMUNE;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	B_SetVisuals_StormGolem();
	Npc_SetToFistMode(self);
};

