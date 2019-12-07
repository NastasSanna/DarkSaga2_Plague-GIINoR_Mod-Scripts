
prototype Mst_Default_Wolf(C_Npc)
{
	name[0] = "Волк";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	level = 5;
	B_DS_SetMst_Attribute(cMst_Default_Wolf);
	protection[PROT_BLUNT] = 35;
	protection[PROT_EDGE] = 35;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 35;
	protection[PROT_MAGIC] = 5;
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
func void B_SetVisuals_Wolf()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Wolf(Mst_Default_Wolf)
{
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};
instance Wolf_Symon(Mst_Default_Wolf) // Прирученный саймоном волк по квесту "Помочь добиться Сью"
{
	B_SetVisuals_Wolf();
	guild = GIL_NONE;
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};
instance Summoned_Wolf(Mst_Default_Wolf)
{
	name[0] = "Вызванный волк";
	guild = gil_summoned_wolf;
	aivar[AIV_MM_REAL_ID] = id_summoned_wolf;
	level = 0;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 75;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 35;
	protection[PROT_FLY] = 75;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};
instance YWolf(Mst_Default_Wolf)
{
	level = 3;
	name[0] = "Молодой волк";
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 20;
	fight_tactic = FAI_MONSTER_COWARD;
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};

//Волк-нежить

prototype Mst_Default_WolfUndead(C_Npc)
{
	name[0] = "Волк-нежить";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF_UNDEAD;
	level = 6;
	B_DS_SetMst_Attribute(cMst_Default_WolfUndead);
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 30;
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

func void B_SetVisuals_WolfUndead()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"UndeadWOL_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance WolfUndead(Mst_Default_WolfUndead)
{
	B_SetVisuals_WolfUndead();
	Npc_SetToFistMode(self);
};

