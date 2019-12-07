instance BAU_114_DS2P_Tom(Npc_Default)
{
	name[0] = "Том";
	guild = GIL_BAU;
	id = 114;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Wolf,BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_114;
};
func void Rtn_Start_114()
{
	
};
func void Rtn_Waiting_PiratePatrol_114() // Ожидает ГГ по квесту "Патруль Пиратов"
{
	
};
func void Rtn_Attack_PiratePatrol_114() // Подходит ближе к пиратам по квесту "Патруль Пиратов"
{
	
};