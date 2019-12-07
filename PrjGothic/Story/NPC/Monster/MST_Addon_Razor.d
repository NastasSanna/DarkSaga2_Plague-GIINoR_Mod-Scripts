
prototype Mst_Default_Razor(C_Npc)
{
	name[0] = "Бритвозуб";
	guild = GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID] = ID_Razor;
	level = 18;
	B_DS_SetMst_Attribute(cMst_Default_Razor);
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 30;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void Set_Razor_Visuals()
{
	Mdl_SetVisual(self,"Razor.mds");
	Mdl_SetVisualBody(self,"Raz_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Razor(Mst_Default_Razor)
{
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
};
