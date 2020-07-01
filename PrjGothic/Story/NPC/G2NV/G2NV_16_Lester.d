
/*                 Ћ≈—“≈–                       */

// прототип
prototype Proto_G2NV_16_Lester(C_Npc)
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
	
	name[0] = "Ћестер";
	guild = GIL_G2NV;
	id = 16;
	voice = 13;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv(self);
	EquipItem(self,ItMw_Kriegshammer2);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
};
func void B_SetVisuals_Lester()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_P_Lester,BodyTex_P,ITAR_Lester);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
};


// на стартовой локации
instance G2NV_16_Lester_PreStart(Proto_G2NV_16_Lester)
{
	B_SetVisuals_Lester();
	daily_routine = Rtn_SleepDeep_16;
};
// на основной локации
instance G2NV_16_Lester(Proto_G2NV_16_Lester)
{
	B_SetVisuals_Lester();
	daily_routine = Rtn_SleepDeep_16;
};


// спит на корабле, заражЄнный
func void Rtn_SleepDeep_16()
{
	TA_Sleep_Deep(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_02");
	TA_Sleep_Deep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_02");
};
// ждем битву с пиратами, пр€чемс€
func void Rtn_Hide_16()
{
	TA_Cook_Cauldron(7,25,11,05,"DP_SHIP_IN_30");
	TA_Smoke_Joint(11,05,13,17,"DP_SHIP_DECK_37");
	TA_Sit_Chair(13,17,22,38,"DP_SHIP_IN_04");
	TA_Sleep(22,38,7,25,"DP_SHIP_IN_SLEEPROOM_BED_02");
};
// бой с пиратами
func void Rtn_Fight_16()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
// здоров, не пр€чемс€
func void Rtn_Healed_16()
{
	TA_Smoke_Joint(7,25,23,38,"DP_SHIP_DECK_29");
	TA_Sleep(23,38,7,25,"DP_SHIP_IN_SLEEPROOM_BED_02");
};
