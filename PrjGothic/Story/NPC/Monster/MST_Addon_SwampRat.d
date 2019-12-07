
prototype Mst_Default_Swamprat(C_Npc)
{
	name[0] = "Болотная крыса";
	guild = GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID] = ID_Swamprat;
	level = 12;
	B_DS_SetMst_Attribute(cMst_Default_Swamprat);
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Swamprat()
{
	Mdl_SetVisual(self,"Swamprat.mds");
	Mdl_SetVisualBody(self,"Swamprat_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Swamprat(Mst_Default_Swamprat)
{
	B_SetVisuals_Swamprat();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
};

