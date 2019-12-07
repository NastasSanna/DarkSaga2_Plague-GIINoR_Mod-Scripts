
prototype Mst_Default_Troll_Black(C_Npc)
{
	name[0] = "Черный тролль";
	guild = GIL_TROLL;
	aivar[AIV_MM_REAL_ID] = ID_TROLL_BLACK;
	level = 90;
	B_DS_SetMst_Attribute(cMst_Default_Troll_Black);
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 360;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	bodyStateInterruptableOverride = TRUE;
};
func void B_SetVisuals_Troll_Black()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Troll_Black_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,1.05,1.05,1.05);
};
instance Troll_Black(Mst_Default_Troll_Black)
{
	B_SetVisuals_Troll_Black();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItAt_DS2P_BlackTrollBone,1); // Кость черного тролля по квесту "Особый топор для Джозефа"
};
instance TrollChild_black(Mst_Default_Troll_Black)
{
	//name[0] = "Детеныш тролля";
	//level = 12;	
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 120;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 500;
	protection[PROT_FIRE] = 120;
	protection[PROT_FLY] = 500;
	protection[PROT_MAGIC] = 150;

	B_SetVisuals_Troll_Black();
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	Npc_SetToFistMode(self);
};
