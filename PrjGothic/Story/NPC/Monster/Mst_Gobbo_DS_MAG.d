//Гоблин Шаман

prototype Mst_Default_Gobbo_MAG(C_Npc)
{
	name[0] = "Гоблин - Шаман";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_MAGE;
	level = 9;
	B_DS_SetMst_Attribute(cMst_Default_Gobbo_MAG);
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_OrcSitStart] = 6;
	aivar[AIV_MM_OrcSitEnd] = 20;
	aivar[AIV_MM_RestStart] = 20;
	aivar[AIV_MM_RestEnd] = 6;
};
func void B_SetVisuals_Gobbo_MAG()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"GOB_ShamanBody",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
func void B_SetVisuals_Gobbo_MAG0()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"GOB_ShamanBody",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
func void B_SetVisuals_Gobbo_MAG2()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"GOB_ShamanBody",2,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
func void B_SetVisuals_Gobbo_MAG3()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"GOB_ShamanBody",3,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
