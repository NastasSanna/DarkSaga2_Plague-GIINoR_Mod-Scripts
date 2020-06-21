INSTANCE SA_Saturas(Npc_Default)
{
	// ------ NSC ------
	name 		= "Saturas";
	/*
	guild 		= GIL_KDW; 
	id 			= 900321;
	voice 		= 14;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	//aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Saturas, BodyTex_B, ITAR_KDW_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	 
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	*/
	guild = GIL_NONE;
	id = 99;
	voice = 9;

	npcType = NPCTYPE_FRIEND;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Schwert3);
	CreateInvItems(self,ItMi_OldCoin,1);
	CreateInvItems(self,ItPo_Health_02,5);
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,95);

	EquipItem(self,ITMW_DarkSaga_Shield_01);
	EquipItem(self,ItMw_1h_Shpaga);
	Npc_SetTalentSkill(self,NPC_TALENT_SHIELD,1);
	CreateInvItems(self,ITMW_DarkSaga_Shield_01,1);
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_900321;
};

FUNC VOID Rtn_Start_900321()
{	
	TA_Study_WP		(08,00,20,00,"TOT"); 
	TA_Study_WP		(20,00,08,00,"TOT");
};

func void Sat_test_PressFunc()
{


};

