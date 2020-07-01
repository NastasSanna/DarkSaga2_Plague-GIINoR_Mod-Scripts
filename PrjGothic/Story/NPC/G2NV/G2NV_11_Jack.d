
/*                 ДЖЕК                       */

// прототип
prototype Proto_G2NV_11_Jack(C_Npc)
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

	name[0] = "Джек";
	guild = GIL_G2NV;
	id = 11;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_PARTYMEMBER] = false;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
};
func void B_SetVisuals_Jack()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_ImportantOld,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
};


// на стартовой локации
instance G2NV_11_Jack_PreStart(Proto_G2NV_11_Jack)
{
	B_SetVisuals_Jack();
	daily_routine = Rtn_Start_11;
};
// на основной локации
instance G2NV_11_Jack(Proto_G2NV_11_Jack)
{
	B_SetVisuals_Jack();
	daily_routine = Rtn_Start_11;
};



// стоит у штурвала
func void Rtn_Start_11()	
{
	TA_Follow_Player(8,0,23,0,"DP_SHIP_CREW_CAPTAIN");
	TA_Follow_Player(23,0,8,0,"DP_SHIP_CREW_CAPTAIN");
};
func void Rtn_GotoPirates_11()	//Идёт на пирс к пиратам с ГГ
{
	// UNFINISHED
	TA_Follow_Player(8,0,23,0,"DP_COAST_PIER03_03");
	TA_Follow_Player(23,0,8,0,"DP_COAST_PIER03_03");
};
//Живёт в домике рыбака
// пересечения: Гарон, Харок
func void Rtn_Waiting_11()	
{
	TA_Stand_Eating( 7,30, 9,45,"DP_COAST_FISHERHUT_OUT_03");
	TA_Stand_ArmsCrossed( 9,45,10,20,"DP_COAST_BEACH_08");
	TA_Stand_ArmsCrossed(10,20,10,55,"DP_COAST_BEACH_03");
	TA_Stand_ArmsCrossed(10,55,11,30,"DP_COAST_BEACH_09");
	TA_Stand_ArmsCrossed(11,30,12,40,"DP_COAST_BEACH_03");
	TA_Stand_Eating(12,40,14, 5,"DP_COAST_FISHERHUT_OUT_02");
	TA_Sit_Bench(14, 5,17,50,"DP_COAST_FISHERHUT_OUT_02");
	TA_Stand_Eating(17,50,19,10,"DP_COAST_FISHERHUT_OUT_02");
	TA_Smalltalk(19,10,21,15,"DP_COAST_FISHERHUT_OUT_02"); //Харок
	TA_Sleep(21,15, 7,30,"DP_COAST_FISHERHUT_IN_02");
};
// спит на корабле, заражённый (если остался на корабле и в течение 2 дней не разговаривал с ГГ)
func void Rtn_SleepDeep_11()	
{
	TA_Sleep_Deep(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_06");
	TA_Sleep_Deep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_06");
};
// ждем битву с пиратами, прячемся
func void Rtn_Hide_11()
{
	TA_Sit_Chair(6,0,23,0,"DP_SHIP_IN_30");
	TA_Sleep(23,0,6,0,"DP_SHIP_IN_SLEEPROOM_BED_06");
};
// бой с пиратами
func void Rtn_Fight_11()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
// здоров, не прячемся
func void Rtn_Healed_11()
{
	TA_Cook_Stove(7,0,8,30,"DP_SHIP_IN_30");
	TA_Stand_Eating(8,30,10,30,"DP_SHIP_CREW_01");
	TA_Stand_Guarding(10,30,21,30,"DP_SHIP_CREW_01");
	TA_Sleep(21,30,7,0,"DP_SHIP_IN_SLEEPROOM_BED_06");
};
