
prototype Mst_Default_DemonLord(C_Npc)
{
	name[0] = "Демон-лорд";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_DEMON_LORD;
	level = 55;
	B_DS_SetMst_Attribute(cMst_Default_DemonLord);
	protection[PROT_BLUNT] = 220;
	protection[PROT_EDGE] = 220;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = 220;
	protection[PROT_FLY] = 220;
	protection[PROT_MAGIC] = 220;
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
func void B_SetVisuals_DemonLord()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance DemonLord(Mst_Default_DemonLord)
{
	B_SetVisuals_DemonLord();
	Npc_SetToFistMode(self);
};

