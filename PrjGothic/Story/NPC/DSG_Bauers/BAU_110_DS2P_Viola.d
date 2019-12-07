instance BAU_110_DS2P_Viola(Npc_Default)
{
	name[0] = "Виола";
	guild = GIL_BAU;
	id = 110;
	voice = 16;
	flags = 0;
	npcType = NPCTYPE_main;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Bau_Mace);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,FEMALE,"Hum_Head_Babe4",FaceBabe_N_VlkBlonde,BodyTexBabe_N,ITAR_BauBabe_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,20);
	daily_routine = Rtn_Start_110;
};
func void Rtn_Start_110()
{	//просто сидит в пещере
	TA_Sit_Campfire		( 8,0,22,0,"");
	TA_Sleep			(22,0, 8,0,"");
};

func void Rtn_Cooking_110()
{	//днем готовит в котле
	TA_Cook_Cauldron	( 8,0,20,0,"");
	TA_Sit_Campfire		(20,0,22,0,"");
	TA_Sleep			(22, 8,0,0,"");
};

