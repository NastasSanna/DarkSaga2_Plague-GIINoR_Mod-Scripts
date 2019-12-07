instance PIR_203_DS2P_Zedd(Npc_Default)
{
	name[0] = "Зедд";
	guild = GIL_PIR;
	id = 203;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_CorAngar,BodyTex_B,ITAR_PIR_M_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_203;
};
func void Rtn_Start_203()
{	//непрерывно квасит в таверне
	TA_Sit_Chair(8,0,22,0,"");
	TA_Sit_Chair(22,0,8,0,"");
};
func void Rtn_Main_203()
{	//когда протрезвеет, делет что-то еще кроме пития
	TA_Sit_Chair(8,0,22,0,"");
	TA_Sit_Chair(22,0,8,0,"");
};
func void Rtn_ScareVales_203()
{	//пугаем Валеса по квесту "Азартный игрок"
	//просто идет к бочке, где играют ГГ и Валес
	TA_Stand_WP(8,0,22,0,"");
	TA_Stand_WP(22,0,8,0,"");
};
