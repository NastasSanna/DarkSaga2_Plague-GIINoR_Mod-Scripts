instance BAU_109_DS2P_Lulu(Npc_Default)
{
	name[0] = "Лулу";
	guild = GIL_BAU;
	id = 109;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe",FaceBabe_N_BlackHair,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_109;
};
func void Rtn_Start_109()
{
};
func void Rtn_Gone_109() // Лулу похитили пираты по квесту "Письмо"
{
};


