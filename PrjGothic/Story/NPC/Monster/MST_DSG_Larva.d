
prototype Mst_Default_Larva(C_Npc)
{
	name[0] = "Личинка ползуна";
	guild = GIL_DSG_Larva;	/*Redleha: не забыть прописать взаимоотношения*/
	aivar[AIV_MM_REAL_ID] = ID_DSG_LARVA;
	level = 2;
	B_DS_SetMst_Attribute(cMst_Default_Larva);
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};
func void B_SetVisuals_Larva()
{
	Mdl_SetVisual(self,"Larva.mds");
	Mdl_SetVisualBody(self,"Larva_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Larva(Mst_Default_Larva)
{
	B_SetVisuals_Larva();
	Npc_SetToFistMode(self);
};
