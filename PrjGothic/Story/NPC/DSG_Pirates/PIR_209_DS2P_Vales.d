instance PIR_209_DS2P_Vales(Npc_Default)
{
	name[0] = "Валес";
	guild = GIL_PIR;
	id = 209;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart10,BodyTex_N,ITAR_PIR_M_DS);
	Mdl_SetModelFatness(self,1.3);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_209;
};
func void Rtn_PreStart_209()	//Начально местоположение (на пляжу наверно)
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};
func void Rtn_GoToGregToPirs_209()	//Идут к Грегу для помощи в давлении на ГГ
{
	TA_STAND_ReadyWeapon(8,0,20,0,"");
	TA_STAND_ReadyWeapon(8,0,20,0,"");
};
func void Rtn_Start_209()	//Занимает обычное своё положение: охраняет корабль
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};
func void Rtn_Scared_203()
{	//носится между несколькими WP или FP
	TA_FleeToWP(8,0,22,0,"");
	TA_FleeToWP(22,0,8,0,"");
};
func void Rtn_DEATH_203()
{	//Ватрас убил
	TA_FleeToWP(8,0,22,0,"");
	TA_FleeToWP(22,0,8,0,"");
};
