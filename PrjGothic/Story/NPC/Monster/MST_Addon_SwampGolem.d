
prototype Mst_Default_Addon_SwampGolem(C_Npc)
{
	name[0] = "Болотный голем";
	guild = GIL_SWAMPGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_Swampgolem;
	level = 25;
	B_DS_SetMst_Attribute(cMst_Default_Addon_SwampGolem);
	protection[PROT_BLUNT] = 135;
	protection[PROT_EDGE] = 135;
	protection[PROT_POINT] = 270;
	protection[PROT_FIRE] = 145;
	protection[PROT_FLY] = 135;
	protection[PROT_MAGIC] = 135;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_Swampgolem()
{
	Mdl_SetVisual(self,"SwampGolem.mds");
	Mdl_SetVisualBody(self,"Gol_Sumpf_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance SwampGolem(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
};

instance SwampGolem_Valley(Mst_Default_Addon_SwampGolem)
{
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp] = 1500;
	aivar[AIV_OriginalFightTactic] = FAI_STONEGOLEM;
};

// DS

instance NONE_99902_Gerardgol01(Mst_Default_Addon_SwampGolem)
{
	name[0] = "Голем крови";
	guild = GIL_None;
	id = 99902;
	level = 0; 
//	npcType = NPCTYPE_FRIEND;
	B_SetAttitude(self,ATT_FRIENDLY); 
	B_SetVisuals_Swampgolem();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};
