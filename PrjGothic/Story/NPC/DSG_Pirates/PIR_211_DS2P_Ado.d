instance PIR_211_DS2P_Ado(Npc_Default)
{
	name[0] = "Адо";
	guild = GIL_PIR;
	id = 211;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart_Dusty,BodyTex_N,ITAR_PIR_LL_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_211;
};
func void Rtn_PreStart_211()	//сценка с Карой
{
};
func void Rtn_Start_211()	//обычное в пещере
{
};
