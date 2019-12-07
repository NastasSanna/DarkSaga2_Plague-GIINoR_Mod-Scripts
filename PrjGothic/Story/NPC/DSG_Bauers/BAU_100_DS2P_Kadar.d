instance BAU_100_DS2P_Kadar(Npc_Default)
{
	name[0] = "Кадар";
	guild = GIL_BAU;
	id = 100;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetAttributesToChapter(self,4);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Fingers,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,1.2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = Rtn_Start_100;
};
func void Rtn_Start_100()	//обычное расписание
{
	TA_Stand_WP	( 8,0,22,0,"");
	TA_Stand_WP	(22,0, 8,0,"");
};
func void Rtn_SitHome_100()	//сидит безвылазно в своей комнате
{
	TA_Sit_Chair	( 8,0,22,0,"");
	TA_Sit_Chair	(22,0, 8,0,"");
};