//*NS - 01/07/13
// охранник в пещере
instance PIR_222_DS2P_GuardCave(Npc_Default)
{
	name[0] = "Охранник";
	guild = GIL_PIR;
	id = 222;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Addon_PIR1hSword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal_Blade,BodyTex_N,ITAR_PIR_M_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_222;
};
func void Rtn_Start_222()
{
	//весь день стоит за дверью
	TA_Stand_Guarding(8,0,22,0,"");
	TA_Stand_Guarding(22,0,8,0,"");
};