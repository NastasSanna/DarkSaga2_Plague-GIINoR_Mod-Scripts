
PROTOTYPE Mst_Default_Rabbit(C_Npc)			
{
	name = "Заяц";
	guild = gil_ds_rabbit;
	aivar[AIV_MM_REAL_ID] = ID_RABBIT;
	level = 1;
	B_DS_SetMst_Attribute(cMst_Default_Rabbit);
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] =	0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] =	0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range =	PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = FALSE;
};
func void B_SetVisuals_Rabbit()
{
	Mdl_SetVisual(self,	"Rabbit.mds");
	Mdl_SetVisualBody(self,"Rabbit_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
INSTANCE Rabbit(Mst_Default_Rabbit)
{
	B_SetVisuals_Rabbit();
	Npc_SetToFistMode(self);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]	= OnlyRoutine;
	CreateInvItems(self,ItFoMuttonRaw,1);
};
