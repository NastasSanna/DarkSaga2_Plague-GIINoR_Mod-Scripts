instance none_16_Lester(Npc_Default)
{
	name[0] = "Лестер";
	guild = GIL_VLK;
	id = 16;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_Kriegshammer2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Lester,BodyTex_P,ITAR_Lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_16;
};
func void Rtn_Start_16()
{
	TA_Sleep_Deep(8,0,23,0,"");
	TA_Sleep_Deep(23,0,8,0,"");
};
