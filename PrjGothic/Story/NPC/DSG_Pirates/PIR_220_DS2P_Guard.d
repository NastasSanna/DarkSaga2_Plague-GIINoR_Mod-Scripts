//*NS - 18/06/13
// один из охранников у входа в ратушу
instance PIR_220_DS2P_Guard(Npc_Default)
{
	name[0] = "Охранник";
	guild = GIL_PIR;
	id = 220;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_ToughBald01,BodyTex_L,ITAR_PIR_M_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_220;
};
func void Rtn_Start_220()
{
	//стоит перед ратушей весь день
	TA_Stand_Guarding(8,0,22,0,"");
	TA_Stand_Guarding(22,0,8,0,"");
};