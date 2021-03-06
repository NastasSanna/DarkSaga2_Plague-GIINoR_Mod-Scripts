
prototype Mst_Default_Wisp(C_Npc)
{
	name[0] = "���������� ����";
	guild = GIL_BLOODFLY;
	level = 4;
	B_DS_SetMst_Attribute(cMst_Default_Wisp);
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void B_SetVisuals_Wisp()
{
	Mdl_SetVisual(self,"Irrlicht.mds");
	Mdl_SetVisualBody(self,"Irrlicht_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_wisphelper()
{
	Mdl_SetVisual(self,"Irrlicht.mds");
	Mdl_SetVisualBody(self,"Irrlicht_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Wisp(Mst_Default_Wisp)
{
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
};

instance Wisp_Detector(Mst_Default_Wisp)
{
	level = 0;
	npcType = npctype_main;
	B_SetVisuals_Wisp();
	senses_range = 3000;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	Npc_SetToFistMode(self);
	aivar[AIV_NoFightParker] = TRUE;
	start_aistate = ZS_MM_Rtn_Summoned;
};

instance WISP_DETECTOR_HELPER(Mst_Default_Wisp)
{
	level = 0;
	npcType = npctype_main;
	noFocus = TRUE;
	flags = 0;
	Mdl_SetVisual(self,"Irrlicht.mds");
	Mdl_SetVisualBody(self,"Irrlicht_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,0.01,0.01,0.01);
	senses_range = 3000;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	Npc_SetToFistMode(self);
	aivar[AIV_NoFightParker] = TRUE;
	start_aistate = ZS_MM_Rtn_Summoned;
};
