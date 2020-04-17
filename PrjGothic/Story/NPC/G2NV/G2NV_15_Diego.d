instance none_15_Diego(Npc_Default)
{
	name[0] = "Диего";
	guild = GIL_G2NV;
	id = 15;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_PreStart_15;
};
func void Rtn_PreStart_15()	//Стоит на корабле
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
}; 
func void Rtn_GotoPirates_15()	//Идёт на пирс к пиратам с ГГ
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};
func void Rtn_Unconscious_15()	//Лежит в бессознанке, типа от чумы.
{
	TA_LIE_Always(8,0,23,0,"");
	TA_LIE_Always(23,0,8,0,"");
};
func void Rtn_StartSleep_15()	//Спит на корабле, заражённый
{
	TA_Sleep_Deep(8,0,23,0,"");
	TA_Sleep_Deep(23,0,8,0,"");
};
