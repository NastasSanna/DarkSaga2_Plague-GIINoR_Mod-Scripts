instance BAU_103_DS2P_Cimm(Npc_Default)
{
	name[0] = "ײטלל";
	guild = GIL_BAU;
	id = 103;
	voice = 3;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_L_NormalBart01,BodyTex_L,ITAR_Bau_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_103;
};
func void Rtn_Start_103()
{
	TA_Stand_WP(8,0,22,0,"");
	TA_Stand_WP(22,0,8,0,"");
};
