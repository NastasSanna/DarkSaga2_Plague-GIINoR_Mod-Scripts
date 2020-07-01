
/*                 Ћј–≈—                       */

// прототип
prototype Proto_G2NV_12_Lares(C_Npc)
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

	name[0] = "Ћарес";
	guild = GIL_G2NV;
	id = 12;
	voice = 9;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = false;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,35);
};
func void B_SetVisuals_Lares()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_N_Lares,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
};


// на стартовой локации
instance G2NV_12_Lares_PreStart(Proto_G2NV_12_Lares)
{
	B_SetVisuals_Lares();
	daily_routine = Rtn_SleepDeep_12;
};
// на основной локации
instance G2NV_12_Lares(Proto_G2NV_12_Lares)
{
	B_SetVisuals_Lares();
	daily_routine = Rtn_SleepDeep_12;
};


// спит на корабле, заражЄнный
func void Rtn_SleepDeep_12()
{
	TA_Sleep_Deep(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_07");
	TA_Sleep_Deep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_07");
};
// ждем битву с пиратами, пр€чемс€
func void Rtn_Hide_12()
{
	TA_Smalltalk(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_04"); //Ћи
	TA_Sleep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_07");
};
// бой с пиратами
func void Rtn_Fight_12()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
// здоров, не пр€чемс€
func void Rtn_Healed_12()
{
	TA_Stand_Guarding(8,0,23,30,"DP_SHIP_CREW_05");
	TA_Sleep(23,30,8,0,"DP_SHIP_IN_SLEEPROOM_BED_07");
};
  