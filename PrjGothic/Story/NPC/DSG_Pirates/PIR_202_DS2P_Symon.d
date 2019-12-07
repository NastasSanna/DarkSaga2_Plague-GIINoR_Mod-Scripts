instance PIR_202_DS2P_Symon(Npc_Default)
{
	name[0] = "Саймон";
	guild = GIL_PIR;
	id = 202;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Cipher_neu,BodyTex_N,ITAR_PIR_M_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_202;
};
func void Rtn_PreStart_202()	//Стоит, встречает ГГ
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_Start_202()	//Обычное расписание в деревне
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_GB_COMPETITION_202()	//Смотрит соревнование ГГ и Серой Бороды
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};