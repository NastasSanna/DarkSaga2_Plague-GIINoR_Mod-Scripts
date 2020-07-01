
/*                 АЛАСТЕР                       */

// прототип
prototype Proto_DS_20_Alaster(C_Npc)
{
	//NPC_Default
	protection[PROT_FALL] = 100;
	damagetype = DAM_BLUNT;
	senses = SENSE_HEAR | SENSE_SEE;
	senses_range = PERC_DIST_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	aivar[AIV_TIME_UNCONSCIOUS] = HAI_TIME_UNCONSCIOUS;
	bodyStateInterruptableOverride = FALSE;
	
	name[0] = "Аластер";
	guild = GIL_G2NV;
	id = 20;
	voice = 15;
	level = 0;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 0;
	exp_next = 500;
	protection[PROT_FALL] = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 50;
	attribute[ATR_HITPOINTS] = 50;
	CreateInvItems(self,ItRw_Bow_L_01,1);
	CreateInvItems(self,ItRw_Arrow,10);
	CreateInvItems(self,ItSc_Telekinesis,3);
		CreateInvItems(self,ItMw_1H_Blessed_01,1);
		CreateInvItems(self,ItMw_1H_Common_01,1);
		CreateInvItems(self,ITMW_Frensis_Shield,1);
	
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_REGENERATEMANA] = 110;
	
	Npc_SetTalentSkill(self,NPC_TALENT_SHIELD,1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
};
func void B_SetVisuals_Alaster()
{
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",9,0,"DS_Head",0,0,ITAR_HUN_BLACKTROLL);
};


// на стартовой локации
instance DS_20_Alaster_PreStart(Proto_DS_20_Alaster)
{
	B_SetVisuals_Alaster();
	daily_routine = Rtn_SleepDeep_20;
};
// в Храме Черепа
instance DS_20_Alaster_SkullTemple(Proto_DS_20_Alaster)
{
	B_SetVisuals_Alaster();
	daily_routine = Rtn_Temple_20;
};
// на основной локации
instance DS_20_Alaster(Proto_DS_20_Alaster)
{
	B_SetVisuals_Alaster();
	daily_routine = Rtn_SleepDeep_20;
};


// спит на корабле, заражённый
func void Rtn_SleepDeep_20()
{
	TA_Sleep_Deep(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_01");
	TA_Sleep_Deep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_01");
};
// ждем битву с пиратами, прячемся
func void Rtn_Hide_20()
{
	TA_Sit_Chair(6,0,23,0,"DP_SHIP_IN_30");
	TA_Sleep(23,0,6,0,"DP_SHIP_IN_SLEEPROOM_BED_01");
};
// бой с пиратами
func void Rtn_Fight_20()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
// здоров, не прячемся
func void Rtn_Healed_20()
{
	TA_Stand_Drinking( 6,0, 8,0,"DP_SHIP_DECK_19");
	TA_Stand_Guarding( 8,0,12,0,"DP_SHIP_DECK_19");
	TA_Stand_Drinking(12,0,14,0,"DP_SHIP_DECK_19");
	TA_Stand_Guarding(14,0,23,0,"DP_SHIP_DECK_19");
	TA_Sleep(23,0,6,0,"DP_SHIP_IN_SLEEPROOM_BED_01");
};
// в храме
func void Rtn_Temple_20()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"ST_FINAL_08");
	TA_Stand_WP(23,0,6,0,"ST_FINAL_08");
};
