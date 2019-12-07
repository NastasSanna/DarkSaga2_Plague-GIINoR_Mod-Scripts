
prototype Mst_Addon_Stoneguardian(C_Npc)
{
	name[0] = "Каменный часовой";
	guild = GIL_Stoneguardian;
	aivar[AIV_MM_REAL_ID] = ID_Stoneguardian;
	level = 18;
	bodyStateInterruptableOverride = TRUE;
	B_DS_SetMst_Attribute(cMst_Addon_Stoneguardian);
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 400;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Stoneguardian;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	Npc_SetToFistMode(self);
};
func void B_SetVisuals_Stoneguardian()
{
	Mdl_SetVisual(self,"StoneGuardian.mds");
	Mdl_SetVisualBody(self,"StG_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Summoned_Guardian(Mst_Addon_Stoneguardian)
{
	name[0] = NAME_Addon_Summoned_Guardian;
	guild = GIL_SummonedGuardian;
	aivar[AIV_MM_REAL_ID] = ID_SummonedGuardian;
	level = 0;
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 175;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Stoneguardian();
};
instance Stoneguardian(Mst_Addon_Stoneguardian)
{
	attribute[ATR_HITPOINTS_MAX] = 380;
	attribute[ATR_HITPOINTS] = 380;
//	start_aistate = ZS_MM_Rtn_Rest_Loop;
	B_SetVisuals_Stoneguardian();
};
