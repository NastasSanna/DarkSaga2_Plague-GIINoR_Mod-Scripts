
prototype Mst_Default_Scavenger_Demon(C_Npc)
{
	name[0] = NAME_ADDON_SCAVENGERGL;
	guild = GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID] = ID_SCAVENGER_DEMON;
	level = 10;
	B_DS_SetMst_Attribute(cMst_Default_Scavenger_Demon);
	protection[PROT_BLUNT] = 65;
	protection[PROT_EDGE] = 65;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 65;
	protection[PROT_FLY] = 65;
	protection[PROT_MAGIC] = 5;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_EatGroundStart] = 6;
	aivar[AIV_MM_EatGroundEnd] = 22;
};
func void B_SetVisuals_Scavenger_Demon()
{
	Mdl_SetVisual(self,"ScavengerGL.mds");
	Mdl_SetVisualBody(self,"Scavenger_Demon_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Scavenger_Demon(Mst_Default_Scavenger_Demon)
{
	B_SetVisuals_Scavenger_Demon();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};
