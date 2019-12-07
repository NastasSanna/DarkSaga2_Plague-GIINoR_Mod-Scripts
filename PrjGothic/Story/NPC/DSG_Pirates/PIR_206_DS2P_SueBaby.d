instance PIR_206_DS2P_SueBaby(Npc_Default)
{
	name[0] = "Крошка Сью";
	guild = GIL_PIR;
	id = 206;
	voice = 16;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert1);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_Hure,BodyTexBabe_N,ITAR_PIR_DS2P_BABE);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_206;
};
func void Rtn_PreStart_206()	//Стоит, встречает ГГ
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void Rtn_Start_206()	//Обычное расписание в деревне
{
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};

