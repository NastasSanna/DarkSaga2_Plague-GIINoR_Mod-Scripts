instance none_10_Nameless(Npc_Default)
{
	name[0] = "����������";
	guild = GIL_G2NV;
	id = 10;
	voice = 15;
	level = 25;
	npcType = npctype_main;
	exp = 162500;
	exp_next = 175500;
	lp = 3;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 350;
	attribute[ATR_HITPOINTS] = 350;
	fight_tactic = FAI_HUMAN_MASTER;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",9,0,"Hum_Head_Pony",Face_N_Player,0,itar_djg_h);
	B_SetFightSkills(self,60);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKORE,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_C,24);
	EquipItem(self,ItMw_2H_Special_04);
	EquipItem(self,ItRw_Crossbow_H_02);
	CreateInvItems(self,ItRw_Arrow,20);
	CreateInvItems(self,ItRw_Bolt_01,20);
	CreateInvItems(self,ItKe_Lockpick,2);
	CreateInvItems(self,ItPo_Health_01,3);
	CreateInvItems(self,ItPo_Health_02,2);
	CreateInvItems(self,ItPo_Health_03,1);
	CreateInvItems(self,ItPo_Mana_01,3);
	CreateInvItems(self,ItPo_Mana_02,2);
	CreateInvItems(self,ItPo_Mana_03,1);
	CreateInvItems(self,ItFo_Bread,5);
	CreateInvItems(self,ItFo_Milk,5);
	/*��� �����--------------------------*/
	CreateInvItems(self,ItPo_Health_03,10);
	CreateInvItems(self,ItPo_Mana_03,10);
	//------------------------------------
	daily_routine = Rtn_Start_10;
}; 
func void Rtn_Start_10()
{

};

