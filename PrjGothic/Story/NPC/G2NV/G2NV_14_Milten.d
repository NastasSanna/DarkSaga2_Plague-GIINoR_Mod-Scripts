
/*                 ћ»Ћ№“≈Ќ                       */

// прототип
prototype Proto_G2NV_14_Milten(C_Npc)
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
	
	name[0] = "ћилтен";
	guild = GIL_G2NV;
	id = 14;
	voice = 3;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = false;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv(self);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
};
func void B_SetVisuals_Milten()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Milten,BodyTex_N,ItAr_KDF_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
};


// на стартовой локации
instance G2NV_14_Milten_PreStart(Proto_G2NV_14_Milten)
{
	B_SetVisuals_Milten();
	daily_routine = Rtn_SleepDeep_14;
};
// на основной локации
instance G2NV_14_Milten(Proto_G2NV_14_Milten)
{
	B_SetVisuals_Milten();
	daily_routine = Rtn_SleepDeep_14;
};


// спит на корабле, заражЄнный
func void Rtn_SleepDeep_14()
{
	TA_Sleep_Deep(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_03");
	TA_Sleep_Deep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_03");
};
// ждем битву с пиратами, пр€чемс€
func void Rtn_Hide_14()
{
	TA_Study_WP(7,12,14,24,"DP_SHIP_DECK_36");
	TA_Cook_Cauldron(14,24,22,10,"DP_SHIP_IN_30");
	TA_Sleep(22,10,7,12,"DP_SHIP_IN_SLEEPROOM_BED_03");
};
// бой с пиратами
func void Rtn_Fight_14()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
// здоров, не пр€чемс€
func void Rtn_Healed_14()
{
	TA_Study_WP(7,12,11,24,"DP_SHIP_DECK_36");
	TA_Cook_Cauldron(11,24,14,10,"DP_SHIP_IN_30");
	TA_Study_WP(14,10,22,10,"DP_SHIP_DECK_36");
	TA_Sleep(22,10,7,12,"DP_SHIP_IN_SLEEPROOM_BED_03");
};

