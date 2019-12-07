instance BAU_107_DS2P_Nikki(Npc_Default)
{
	name[0] = "Никки";
	guild = GIL_BAU;
	id = 107;
	voice = 17;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe8",FaceBabe_N_MidBauBlonde,BodyTexBabe_N,ITAR_BAU_DS2P_BABE);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,10);
	daily_routine = Rtn_Start_107;
};
func void Rtn_Start_107()
{
	
};
//ЖДЕТ ГГ и Тамира у себя
func void Rtn_WAIT_107()
{
	
};
