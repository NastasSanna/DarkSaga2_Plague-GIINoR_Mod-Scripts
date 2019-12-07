
prototype Mst_Default_Gnore(C_Npc)
{
	name[0] = "Рудогрыз";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_GNORE;
	level = 16;
	B_DS_SetMst_Attribute(cMst_Default_Gnore);
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 110;
	protection[PROT_MAGIC] = 10;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
	//aivar[AIV_MM_WuselStart] = OnlyRoutine;
};
func void B_SetVisuals_Gnore()
{
	Mdl_SetVisual(self,"Gnore.mds");
	Mdl_SetVisualBody(self,"Gnore_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
func void B_SetVisuals_GnoreWarrior()
{
	Mdl_SetVisual(self,"Gnore.mds");
	Mdl_SetVisualBody(self,"GNOREWARIOR_BODY",2,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Gnore(Mst_Default_Gnore)
{
	B_SetVisuals_Gnore();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.2,1.2,1.2);
};
instance Gnore_1(Mst_Default_Gnore)
{
	B_SetVisuals_Gnore();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.7,1.7,1.7);
};
instance Gnore_2(Mst_Default_Gnore)
{
	B_SetVisuals_Gnore();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,2.0,2.0,2.0);
};
instance Gnore_Warrior(Mst_Default_Gnore)
{
	name[0] = "Рудогрыз - Воин";
	B_SetVisuals_GnoreWarrior();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.8,1.8,1.8);
};
