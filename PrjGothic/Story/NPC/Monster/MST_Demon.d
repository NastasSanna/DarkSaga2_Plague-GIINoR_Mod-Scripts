
prototype Mst_Default_Demon(C_Npc)
{
	name[0] = "�����";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON;
	level = 40;
	B_DS_SetMst_Attribute(cMst_Default_Demon);
	protection[PROT_BLUNT] = 185;
	protection[PROT_EDGE] = 185;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = 185;
	protection[PROT_FLY] = 185;
	protection[PROT_MAGIC] = 185;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_DEMON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_Demon()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Demon(Mst_Default_Demon)
{
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};
instance Summoned_Demon(Mst_Default_Demon)
{
	name[0] = "��������� �����";
	guild = gil_summoned_demon;
	aivar[AIV_MM_REAL_ID] = id_summoned_demon;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Demon();
	Npc_SetToFistMode(self);
};
