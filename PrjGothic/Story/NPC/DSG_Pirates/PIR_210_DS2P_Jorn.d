instance PIR_210_DS2P_Jorn(Npc_Default)
{
	name[0] = "Йорн";
	guild = GIL_PIR;
	id = 210;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR2hSword);
	EquipItem(self,ItRw_Bow_M_01);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Fingers,BodyTex_N,ITAR_PIR_L_DS);
	Mdl_SetModelFatness(self,0.9);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_210;
};
func void Rtn_Start_210()
{
};