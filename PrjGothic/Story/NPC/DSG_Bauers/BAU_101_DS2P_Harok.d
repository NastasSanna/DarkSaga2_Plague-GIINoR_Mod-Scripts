instance BAU_101_DS2P_Harok(Npc_Default)
{
	name[0] = "Харок";
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
};
func void Rtn_GaronTalk_101()		//стоит рядом с Гароном, чтобы были оба наготове для триалога
{
	TA_RunToWP(8,0,22,0,"");
	TA_RunToWP(22,0,8,0,"");
};
func void Rtn_GaronReturned_101()	//Гарон остался дома, по ночам дежурят по очереди
{
};
