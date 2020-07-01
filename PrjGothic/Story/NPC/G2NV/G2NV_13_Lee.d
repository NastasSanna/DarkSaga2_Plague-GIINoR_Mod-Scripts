
/*                 Ћ»                       */

// прототип
prototype Proto_G2NV_13_Lee(C_Npc)
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
	
	name[0] = "Ћи";
	guild = GIL_G2NV;
	id = 13;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = false;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
};
func void B_SetVisuals_Lee()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Lee,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
};


// на стартовой локации
instance G2NV_13_Lee_PreStart(Proto_G2NV_13_Lee)
{
	B_SetVisuals_Lee();
	daily_routine = Rtn_SleepDeep_13;
};
// на основной локации
instance G2NV_13_Lee(Proto_G2NV_13_Lee)
{
	B_SetVisuals_Lee();
	daily_routine = Rtn_SleepDeep_13;
};


// спит на корабле, заражЄнный
func void Rtn_SleepDeep_13()
{
	TA_Sleep_Deep(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_08");
	TA_Sleep_Deep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_08");
};
// ждем битву с пиратами, пр€чемс€
func void Rtn_Hide_13()
{
	TA_Smalltalk(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_03"); //Ћарес
	TA_Sleep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_08");
};
// бой с пиратами
func void Rtn_Fight_13()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
// здоров, не пр€чемс€
func void Rtn_Healed_13()
{
	TA_Practice_Sword(6,5,7,15,"DP_SHIP_CREW_19");
	TA_Stand_Guarding(7,15,22,30,"DP_SHIP_CREW_19");
	TA_Sleep(22,30,6,5,"DP_SHIP_IN_SLEEPROOM_BED_08");
};
