
instance DS_20_Alaster(Npc_Default)
{
	name[0] = "Аластер";
	guild = GIL_NONE;
	id = 20;
	voice = 15;
	level = 0;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 0;
	exp_next = 500;
	protection[PROT_FALL] = 0;
	//lp = 40;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",9,0,"DS_Head",0,0,ITAR_Vlk_H);
	B_SetFightSkills(self,10);
	//Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	EquipItem(self,ItMw_1h_Shpaga);
	CreateInvItems(self,ItRw_Bow_L_01,1);
	CreateInvItems(self,ItRw_Arrow,10);
	CreateInvItems(self,ItSc_Telekinesis,3);
	CreateInvItems(self,ItMw_1h_Vlk_Dagger,1);
	CreateInvItems(self,ItMw_1h_Shpaga_BET,1);
		CreateInvItems(self,ItMw_1H_Blessed_01,1);
		CreateInvItems(self,ItMw_1H_Common_01,1);
	//Npc_SetTalentSkill(self,NPC_TALENT_ORCWEAPON,2);
	//Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	
	
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_REGENERATEMANA] = 110;
	CreateInvItems(self,ITMW_Frensis_Shield,1);
	//EquipItem(self,ITMW_Frensis_Shield);
	
	Npc_SetTalentSkill(self,NPC_TALENT_SHIELD,1);

};
