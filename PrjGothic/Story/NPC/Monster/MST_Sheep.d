
prototype Mst_Default_Sheep(C_Npc)
{
	name[0] = "Œ‚ˆ‡";
	guild = GIL_SHEEP;
	aivar[AIV_MM_REAL_ID] = ID_SHEEP;
	level = 1;
	B_DS_SetMst_Attribute(cMst_Default_Sheep);
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
};
func void B_SetVisuals_Sheep()
{
	Mdl_SetVisual(self,"Sheep.mds");
	Mdl_SetVisualBody(self,"Sheep_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
func void B_SetVisuals_Hammel()
{
	Mdl_SetVisual(self,"Sheep.mds");
	Mdl_SetVisualBody(self,"Hammel_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Sheep(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};
//Œ¬÷€ ¡¿–Œ ¿.
instance Sheep_Barok_01(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
	flags = NPC_FLAG_IMMORTAL;
};
instance Sheep_Barok_02(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
	flags = NPC_FLAG_IMMORTAL;
};
instance Sheep_Barok_03(Mst_Default_Sheep)
{
	B_SetVisuals_Sheep();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
	flags = NPC_FLAG_IMMORTAL;
};

