instance pre_none_15_Diego(Npc_Default)
{
	name[0] = "Диего";
	guild = GIL_NONE;
	id = 1015;
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
	daily_routine = Rtn_Start_1015;
};
func void Rtn_Start_1015()
{
	TA_Stand_WP(8,0,23,0,"SS_MARIK_STAND");
	TA_Stand_WP(23,0,8,0,"SS_MARIK_STAND");
}; 
