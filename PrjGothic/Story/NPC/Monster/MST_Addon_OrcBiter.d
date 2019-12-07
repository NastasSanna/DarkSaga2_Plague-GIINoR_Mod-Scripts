
prototype Mst_Default_OrcBiter(C_Npc)
{
	name[0] = "Чомпер";
	guild = GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID] = ID_OrcBiter;
	level = 12;
	B_DS_SetMst_Attribute(cMst_Default_OrcBiter);
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void Set_OrcBiter_Visuals()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_ApplyOverlayMds(self,"Orcbiter.mds");
	Mdl_SetVisualBody(self,"Sc2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance OrcBiter(Mst_Default_OrcBiter)
{
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
};
