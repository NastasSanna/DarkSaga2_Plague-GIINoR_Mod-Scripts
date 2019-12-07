
prototype Mst_Default_Warg(C_Npc)
{
	name[0] = "Варг";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WARG;
	level = 28;
	B_DS_SetMst_Attribute(cMst_Default_Warg);
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 125;
	protection[PROT_FLY] = 125;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};
func void B_SetVisuals_WARG()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Warg_Body2",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
func void B_SetVisuals_BLACKWOLF()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Warg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Warg(Mst_Default_Warg)
{
	B_SetVisuals_WARG();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};
instance Warg_DSG_Lider(Mst_Default_Warg)
{
	name[0] = "Черный волк";
	level = 30;
	attribute[ATR_STRENGTH] += 25;
	attribute[ATR_DEXTERITY] += 30;
	attribute[ATR_HITPOINTS_MAX] += 140;
	attribute[ATR_HITPOINTS] += 140;
	protection[PROT_BLUNT] += 12;
	protection[PROT_EDGE] += 12;
	protection[PROT_POINT] += 12;
	protection[PROT_FIRE] += 12;
	protection[PROT_FLY] += 12;
	protection[PROT_MAGIC] += 12;
	B_SetVisuals_BLACKWOLF();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
	CreateInvItems(self,ItRi_DS2P_ProtEdgPoi_01,1);
};
