
instance PIR_200_DS2P_GARD(Npc_Default)
{
	name[0] = "Гард";
	guild = GIL_PIR;
	id = 200;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_PIR_MAIN;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_Piratensaebel);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Pirat01,BodyTex_P,ITAR_PIR_H_Addon);
	Mdl_SetModelFatness(self,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds(self,"Hum_PirSab2.mds");	
	daily_routine = rtn_prestart_200;
};
func void rtn_prestart_200()
{
	//стоит в ратуше, разговор с Грегом
	TA_Stand_WP(8,0,20,0,"");
	TA_Stand_WP(20,0,8,0,"");
};
func void rtn_start_200()
{
	//в ратуше, по ночам спит
};

