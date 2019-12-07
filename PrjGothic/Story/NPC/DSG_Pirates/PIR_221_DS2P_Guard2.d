//*NS - 18/06/13
// второй из охранников у входа в ратушу
instance PIR_221_DS2P_Guard2(Npc_Default)
{
	name[0] = "Охранник";
	guild = GIL_PIR;
	id = 221;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Blade,BodyTex_N,ITAR_PIR_L_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_221;
};
func void Rtn_Start_221()
{
	//стоит перед ратушей весь день
	TA_Stand_Guarding(8,0,22,0,"");
	TA_Stand_Guarding(22,0,8,0,"");
};