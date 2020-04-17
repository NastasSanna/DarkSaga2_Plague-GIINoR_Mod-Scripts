instance none_11_Jack(Npc_Default)
{
	name[0] = "Джек";
	guild = GIL_G2NV;
	id = 11;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_PARTYMEMBER] = false;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ImportantOld,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_PreStart_11;
};
func void Rtn_PreStart_11()	//Стоит на корабле
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};
func void Rtn_GotoPirates_11()	//Идёт на пирс к пиратам с ГГ
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};
func void Rtn_Start_11()	//Живёт в домике рыбака
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};
func void Rtn_SleepDeep_11()	//Спит на корабле, заражённый (если остался на корабле и в течение 2 дней не разговаривал с ГГ)
{
	TA_Sleep_Deep(8,0,23,0,"");
	TA_Sleep_Deep(23,0,8,0,"");
};
