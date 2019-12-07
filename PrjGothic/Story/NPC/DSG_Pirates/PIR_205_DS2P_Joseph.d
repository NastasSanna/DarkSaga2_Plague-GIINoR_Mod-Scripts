instance PIR_205_DS2P_Joseph(Npc_Default)
{
	name[0] = "Джозеф";
	guild = GIL_PIR;
	id = 205;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Krummschwert);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal01,BodyTex_P,ITAR_PIR_M_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_205;
};
func void Rtn_PreStart_205()	//сидит в кузне, не работает (нет железа)
{
	TA_Stand_WP(8,0,22,0,"");
	TA_Stand_WP(22,0,8,0,"");
};
func void Rtn_Start_205()	//работает в кузне (есть железо)
{
	TA_Stand_WP(8,0,22,0,"");
	TA_Stand_WP(22,0,8,0,"");
};
func void Rtn_ScareVales_205()
{	//пугаем Валеса по квесту "Азартный игрок"
	//просто идет к бочке, где играют ГГ и Валес
	TA_Stand_WP(8,0,22,0,"");
	TA_Stand_WP(22,0,8,0,"");
};
