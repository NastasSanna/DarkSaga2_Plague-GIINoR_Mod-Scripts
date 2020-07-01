
/*                 ВАТРАС                       */

// прототип
prototype Proto_G2NV_18_Vatras(C_Npc)
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
	
	name[0] = "Ватрас";
	guild = GIL_G2NV;
	id = 18;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
};
func void B_SetVisuals_Vatras()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Saturas,BodyTex_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
};


// на стартовой локации
instance G2NV_18_Vatras_PreStart(Proto_G2NV_18_Vatras)
{
	B_SetVisuals_Vatras();
	daily_routine = Rtn_PreStart_18;
};
// на основной локации
instance G2NV_18_Vatras(Proto_G2NV_18_Vatras)
{
	B_SetVisuals_Vatras();
	daily_routine = Rtn_Start_18;
};


// Ухаживает за больными
func void Rtn_PreStart_18()
{
	TA_Stand_WP(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_07");
	TA_Stand_WP(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_07");
};
// Причалили
func void Rtn_Start_18()	
{
	TA_Follow_Player(8,0,23,0,"DP_SHIP_DECK_17");
	TA_Follow_Player(23,0,8,0,"DP_SHIP_DECK_17");
};
// Идёт на пирс к пиратам с ГГ
func void Rtn_GotoPirates_18()
{
	TA_Stand_WP(8,0,23,0,"DP_COAST_PIER03_03");
	TA_Stand_WP(23,0,8,0,"DP_COAST_PIER03_03");
};
// Лечит всех
func void Rtn_Healing_18()
{
	TA_Study_WP( 6,0, 8,0,"DP_SHIP_IN_SLEEPROOM_BED_01");
	TA_Study_WP( 8,0,10,0,"DP_SHIP_IN_SLEEPROOM_BED_02");
	TA_Study_WP(10,0,12,0,"DP_SHIP_IN_SLEEPROOM_BED_03");
	TA_Study_WP(12,0,14,0,"DP_SHIP_IN_SLEEPROOM_BED_04");
	TA_Study_WP(14,0,16,0,"DP_SHIP_IN_SLEEPROOM_BED_05");
	TA_Study_WP(16,0,18,0,"DP_SHIP_IN_SLEEPROOM_BED_06");
	TA_Study_WP(18,0,20,0,"DP_SHIP_IN_SLEEPROOM_BED_07");
	TA_Study_WP(20,0,22,0,"DP_SHIP_IN_SLEEPROOM_BED_08");
	TA_Read_Bookstand(22,0,2,0,"DP_SHIP_IN_22");
	TA_Potion_Alchemy(2,0,6,0,"DP_SHIP_IN_22");
};
// бой с пиратами
func void Rtn_Fight_18()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
