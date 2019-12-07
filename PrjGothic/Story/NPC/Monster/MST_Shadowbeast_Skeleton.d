
prototype Mst_Default_Shadowbeast_Skeleton(C_Npc)
{
	name[0] = "������ ���������";
	guild = GIL_SHADOWBEAST_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST_SKELETON;
	level = 35;
	B_DS_SetMst_Attribute(cMst_Default_Shadowbeast_Skeleton);
	protection[PROT_BLUNT] = 160;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 70;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};
func void B_SetVisuals_Shadowbeast_Skeleton()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Shadowbeast_Skeleton(Mst_Default_Shadowbeast_Skeleton)
{
	B_SetVisuals_Shadowbeast_Skeleton();
	Npc_SetToFistMode(self);
};
