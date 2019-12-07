instance pre_none_18_Vatras(Npc_Default)
{
	name[0] = "Ватрас";
	guild = GIL_NONE;
	id = 1018;
	voice = 5;
	//flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[96] = 2;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Saturas,BodyTex_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	//B_SetFightSkills(self,30);
	//aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	CreateInvItems(self,ItMi_Gold,50);
	CreateInvItems(self,ItRw_Arrow,100);
	daily_routine = Rtn_Start_1018;
	
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_REGENERATEMANA] = 110;
	
	Npc_SetTalentSkill(self,NPC_TALENT_SHIELD,1);
	EquipItem(self,ItMw_1h_Shpaga);
	CreateInvItems(self,ITMW_DarkSaga_Shield_01,1);
	CreateInvItems(self,ITMW_DarkSaga_Shield_ds_03,1);
	CreateInvItems(self,ITMW_DarkSaga_Shield_ds_04,1);
	CreateInvItems(self,ITMW_DarkSaga_Shield_ds_05,1);
	CreateInvItems(self,ITMW_Frensis_Shield,1);
	/*EquipWeapon*/	//EquipItem(self,ITMW_DarkSaga_Shield_01);
	//oCNpc_Equip(self,ITMW_Frensis_Shield);
};
func void Rtn_Start_1018()
{
	TA_Stand_WP(8,0,23,0,"SS_MARIK_STAND");
	TA_Stand_WP(23,0,8,0,"SS_MARIK_STAND");
};
 