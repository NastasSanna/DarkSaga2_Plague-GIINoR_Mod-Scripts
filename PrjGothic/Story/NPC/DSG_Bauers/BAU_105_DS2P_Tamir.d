instance BAU_105_DS2P_Tamir(Npc_Default)
{
	name[0] = "Тамир";
	guild = GIL_BAU;
	id = 105;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Tough_Lee_ghnlich,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = Rtn_Start_105;
};
func void Rtn_Start_105()	//Сидит на пне
{
	TA_Sit_Bench(8,0,22,0,"");
	TA_Sleep(22,0,8,0,"");
};
func void Rtn_HUNTING_105()	//Идёт на охоту с ГГ
{
	TA_Guide_Player(8,0,22,0,"");
	TA_Guide_Player(22,0,8,0,"");
};
func void Rtn_GoToNikki_105()	//Бежит к Никки
{
	TA_Guide_Player(8,0,22,0,"");
	TA_Guide_Player(22,0,8,0,"");
};
