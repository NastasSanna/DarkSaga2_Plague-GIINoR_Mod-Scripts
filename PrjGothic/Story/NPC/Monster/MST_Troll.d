
prototype Mst_Default_Troll(C_Npc)
{
	name[0] = "������";
	guild = GIL_TROLL;
	aivar[AIV_MM_REAL_ID] = ID_TROLL;
	level = 45;
	B_DS_SetMst_Attribute(cMst_Default_Troll);
	protection[PROT_BLUNT] = 145;
	protection[PROT_EDGE] = 145;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = 145;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = 280;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	bodyStateInterruptableOverride = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};
func void B_SetVisuals_Troll()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Troll(Mst_Default_Troll)
{
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};
instance Valley_Troll(Mst_Default_Troll)
{
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp] = 2300;
	aivar[AIV_OriginalFightTactic] = FAI_TROLL;
};
instance Maya_Troll(Mst_Default_Troll)
{
	aivar[AIV_MaxDistToWp] = 1000;
	aivar[AIV_OriginalFightTactic] = FAI_TROLL;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};
instance Troll_DI(Mst_Default_Troll)
{
	name[0] = "�������� ������";
	aivar[AIV_MaxDistToWp] = 300;
	aivar[AIV_OriginalFightTactic] = FAI_TROLL;
	B_SetVisuals_Troll();
	Npc_SetToFistMode(self);
};
instance TrollChild(Mst_Default_Troll)
{
	name[0] = "������� ������";
	level = 12;	
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 55;
	protection[PROT_EDGE] = 65;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 55;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 50;
	B_SetVisuals_Troll();
	Mdl_SetModelScale(self,0.6,0.6,0.6);
	Npc_SetToFistMode(self);
};
