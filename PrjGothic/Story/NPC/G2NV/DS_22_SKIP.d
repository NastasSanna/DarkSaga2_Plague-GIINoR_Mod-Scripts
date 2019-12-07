
instance DS_22_SKIP(Npc_Default)
{
	name[0] = "Скип";
	guild = GIL_PIR;
	id = 22;
	voice = 8;
	flags = FALSE;
	npcType = NPCTYPE_PIR_MAIN;
	aivar[AIV_FollowDist] = 300;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_ShortSword2);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItPo_Health_03,2);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Pirat01,BodyTex_N,ITAR_PIR_L_DS);
	B_CreateAmbientInv(self);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = rtn_start_20;
};
func void rtn_start_20()	//сидит в трюме корабля после стартового разговора ГГ с Грегом
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};
func void rtn_RunAway_20()	//Убегает и прячется после стартового разговора с ГГ
{
	TA_FleeToWp(8,0,23,0,"");
	TA_FleeToWp(23,0,8,0,"");
};

