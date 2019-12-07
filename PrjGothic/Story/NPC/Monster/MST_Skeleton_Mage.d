
prototype Mst_Default_Skeleton_Mage(C_Npc)
{
	name[0] = "Скелет-маг";
	guild = GIL_SKELETON_MAGE;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON_MAGE;
	level = 30;
	B_DS_SetMst_Attribute(cMst_Default_Skeleton_Mage);
	protection[PROT_BLUNT] = 135;
	protection[PROT_EDGE] = 135;
	protection[PROT_POINT] = -1;
	protection[PROT_FIRE] = 45;
	protection[PROT_FLY] = 135;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_STRONG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_Skeleton_Mage()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	Mdl_SetVisualBody(self,"Ske_Fly_Body",1,DEFAULT,"",1,DEFAULT,-1);
};
instance SkeletonMage(Mst_Default_Skeleton_Mage)
{
	B_SetVisuals_Skeleton_Mage();
};
instance Skeleton_Ghost_Mage(Mst_Default_Skeleton_Mage)
{
	B_SetVisuals_Skeleton_Mage();
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_VIOLETFIREARMOR";
};
//------------------ DARKSAGA II: prolog --------------------
// UNFINISED добавить артефакт/оружие
instance Skeleton_Ghost_Mage_DS2P_GraniteGrave(Mst_Default_Skeleton_Mage)
{
	B_SetVisuals_Skeleton_Mage();
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_VIOLETFIREARMOR";
};
