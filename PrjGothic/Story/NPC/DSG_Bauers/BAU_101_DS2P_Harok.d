instance BAU_101_DS2P_Harok(Npc_Default)
{
	name[0] = "’арок";
	guild = GIL_BAU;
	id = 101;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart02,BodyTex_N,ITAR_Bau_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_101;
};
func void Rtn_Start_101()		//обычный дома: ест, спит, рыбачит
{
	//TA_Smalltalk(19,10,21,15,"DP_COAST_FISHERHUT_OUT_02"); //ƒжек, если он на берегу
};
func void Rtn_GaronTalk_101()		//стоит р€дом с √ароном, чтобы были оба наготове дл€ триалога
{
	TA_RunToWP(8,0,22,0,"");
	TA_RunToWP(22,0,8,0,"");
};
func void Rtn_GaronReturned_101()	//√арон осталс€ дома, по ночам дежур€т по очереди
{
};
