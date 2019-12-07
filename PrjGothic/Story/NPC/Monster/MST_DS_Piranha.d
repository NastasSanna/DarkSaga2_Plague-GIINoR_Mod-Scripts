
prototype Mst_Default_Pyranha(C_Npc)
{
  name[0] = "Пиранья";
  guild = GIL_DS_PIRANHA;
  aivar[AIV_MM_REAL_ID] = ID_PIRANHA;
  level = 7;
  B_DS_SetMst_Attribute(cMst_Default_Pyranha);
  protection[PROT_BLUNT] = 35;
  protection[PROT_EDGE] = 35;
  protection[PROT_POINT] = -1;
  protection[PROT_FIRE] = -1;
  protection[PROT_FLY] = 0;
  protection[PROT_MAGIC] = 0;
  damagetype = DAM_EDGE;
  fight_tactic = FAI_BLOODFLY;
  senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
  senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
  aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
  aivar[AIV_MM_FollowTime] = FOLLOWTIME_SHORT;
  aivar[AIV_MM_FollowInWater] = TRUE;
  aivar[AIV_MM_Packhunter] = FALSE;
  start_aistate = ZS_MM_Rtn_Swim;
  //aivar[AIV_MM_WuselStart] = OnlyRoutine;
};
func void Set_PIRANHA_Visuals()
{
	Mdl_SetVisual(self,"Piranha.mds");
	Mdl_SetVisualBody(self,"Piranha_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	//Mdl_SetModelScale(self,1.3,1.3,1.3);
};
instance Pyranha(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha1(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha2(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha3(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha4(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha5(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha6(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha7(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha8(Mst_Default_Pyranha)
{
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.15,1.15,1.15);
	Npc_SetToFistMode(self);
};
instance Pyranha_Big(Mst_Default_Pyranha)
{
	name[0] = "Пиранья-убийца";
	attribute[ATR_STRENGTH] = 80;
  attribute[ATR_DEXTERITY] = 80;
  attribute[ATR_HITPOINTS_MAX] = 140;
  attribute[ATR_HITPOINTS] = 140;
	Set_PIRANHA_Visuals();
	Mdl_SetModelScale(self,1.35,1.35,1.35);
	Npc_SetToFistMode(self);
};

