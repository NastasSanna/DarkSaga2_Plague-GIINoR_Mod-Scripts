instance BAU_108_DS2P_Huno(Npc_Default)
{
	name[0] = "Хуно";
	guild = GIL_BAU;
	id = 108;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal03,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_108;
};
func void Rtn_Start_108()
{
	//работает возле деревне в поле, вечером сидит в таверне, на ночь в домик
};
