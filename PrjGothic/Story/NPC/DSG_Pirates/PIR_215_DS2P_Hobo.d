instance PIR_215_DS2P_Hobo(Npc_Default)
{
	name[0] = "Хобо";
	guild = GIL_PIR;
	id = 215;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Torlof,BodyTex_N,ITAR_PIR_LL_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_215;
};
func void Rtn_Start_215()
{
};
