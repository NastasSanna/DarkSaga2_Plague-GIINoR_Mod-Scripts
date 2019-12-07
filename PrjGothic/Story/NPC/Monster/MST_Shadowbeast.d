
prototype Mst_Default_Shadowbeast(C_Npc)
{
	name[0] = "Мракорис";
	guild = GIL_SHADOWBEAST;
	aivar[AIV_MM_REAL_ID] = ID_SHADOWBEAST;
	level = 25;
	B_DS_SetMst_Attribute(cMst_Default_Shadowbeast);
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 130;
	protection[PROT_MAGIC] = 25;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SHADOWBEAST;
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
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
};
func void B_SetVisuals_Shadowbeast()
{
	Mdl_SetVisual(self,"Shadow.mds");
	Mdl_SetVisualBody(self,"Sha_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Shadowbeast(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
};
instance Shadowbeast_GB_Competition_01(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self,ItAt_DS2P_ShadowHorn_Competition,1); // Рога для соревнования с Серой Бородой
};
instance Shadowbeast_GB_Competition_02(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self,ItAt_DS2P_ShadowHorn_Competition,1); // Рога для соревнования с Серой Бородой
};
instance Shadowbeast_GB_Competition_03(Mst_Default_Shadowbeast)
{
	B_SetVisuals_Shadowbeast();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
	CreateInvItems(self,ItAt_DS2P_ShadowHorn_Competition,1); // Рога для соревнования с Серой Бородой
};
