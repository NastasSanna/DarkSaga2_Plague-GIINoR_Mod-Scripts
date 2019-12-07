instance none_17_Gorn(Npc_Default)
{
	name[0] = "Горн";
	guild = GIL_VLK;
	id = 17;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Axe);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItPo_Health_02,6);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Gorn,BodyTex_B,itar_djg_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_17;
};
func void Rtn_Start_17()
{
	TA_Sleep_Deep(8,0,23,0,"");
	TA_Sleep_Deep(23,0,8,0,"");
};
