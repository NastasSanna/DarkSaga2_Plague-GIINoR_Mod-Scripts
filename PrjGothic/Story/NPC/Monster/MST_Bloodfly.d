
prototype Mst_Default_Bloodfly(C_Npc)
{
	name[0] = "Кровавая муха";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_BLOODFLY;
	level = 3;
	B_DS_SetMst_Attribute(cMst_Default_Bloodfly);
	protection[PROT_BLUNT] = 25;
	protection[PROT_EDGE] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 25;
	protection[PROT_MAGIC] = 5;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};
func void B_SetVisuals_Bloodfly()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",0,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
func void B_SetVisuals_Bloodfly2()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Bloodfly(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};
instance Bloodfly_Old(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly2();
	Npc_SetToFistMode(self);
};

instance YBloodfly(Mst_Default_Bloodfly)
{
	name[0] = "Малая кровавая муха";
	level = 2;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 10;
	protection[PROT_MAGIC] = 0;
	B_SetVisuals_Bloodfly();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance Sleepfly(Mst_Default_Bloodfly)
{
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = OnlyRoutine;
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};

