
prototype Mst_Default_Shadowbeast_Addon_Fire(C_Npc)
{
	name[0] = "Огненный мракорис";
	guild = GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID] = ID_Gargoyle;
	level = 30;
	B_DS_SetMst_Attribute(cMst_Default_Shadowbeast_Addon_Fire);
	protection[PROT_BLUNT] = 170;
	protection[PROT_EDGE] = 170;
	protection[PROT_POINT] = 220;
	protection[PROT_FIRE] = 230;
	protection[PROT_FLY] = 170;
	protection[PROT_MAGIC] = 75;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Gargoyle;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 6;
	aivar[AIV_MM_SleepEnd] = 20;
	aivar[AIV_MM_RoamStart] = 20;
	aivar[AIV_MM_RoamEnd] = 6;
};
func void B_SetVisuals_Shadowbeast_Fire()
{
	Mdl_SetVisual(self,"FireShadow.mds");
	Mdl_SetVisualBody(self,"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Shadowbeast_Addon_Fire(Mst_Default_Shadowbeast_Addon_Fire)
{
	B_SetVisuals_Shadowbeast_Fire();
	CreateInvItems(self,ItAt_FireshadBlood,1);
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
};
instance Shadowbeast_Ghost_VioletFire(Mst_Default_Shadowbeast_Addon_Fire)
{
	B_SetVisuals_Shadowbeast_Fire();
	CreateInvItems(self,ItAt_FireshadBlood,1);
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_VIOLETFIREARMOR";
};
// ======================== DSG ===================================
instance Shadowbeast_Addon_Fire_Garon(Mst_Default_Shadowbeast_Addon_Fire)
{
	B_SetVisuals_Shadowbeast_Fire();
	CreateInvItems(self,ItAt_FireshadBlood,1);
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_GHOST;
	effect = "SPELLFX_FIREARMOR";
};