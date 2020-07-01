
/*                 √ќ–Ќ                       */

// прототип
prototype Proto_G2NV_17_Gorn(C_Npc)
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
	
	name[0] = "√орн";
	guild = GIL_G2NV;
	id = 17;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Axe);
	EquipItem(self,ItRw_Crossbow_M_01);
	CreateInvItems(self,ItPo_Health_02,6);
	B_CreateAmbientInv(self);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
};
func void B_SetVisuals_Gorn()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_B_Gorn,BodyTex_B,itar_djg_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
};


// на стартовой локации
instance G2NV_17_Gorn_PreStart(Proto_G2NV_17_Gorn)
{
	B_SetVisuals_Gorn();
	daily_routine = Rtn_SleepDeep_17;
};
// на основной локации
instance G2NV_17_Gorn(Proto_G2NV_17_Gorn)
{
	B_SetVisuals_Gorn();
	daily_routine = Rtn_SleepDeep_17;
};


// спит на корабле, заражЄнный
func void Rtn_SleepDeep_17()
{
	TA_Sleep_Deep(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_05");
	TA_Sleep_Deep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_05");
};
// ждем битву с пиратами, пр€чемс€
func void Rtn_Hide_17()
{
	TA_Stand_Drinking(8, 8,11,44,"DP_SHIP_IN_04");
	TA_Sit_Chair(11,44,23, 3,"DP_SHIP_IN_04");
	TA_Sleep(23, 3,8, 8,"DP_SHIP_IN_SLEEPROOM_BED_05");
};
// бой с пиратами
func void Rtn_Fight_17()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
// здоров, не пр€чемс€
func void Rtn_Healed_17()
{
	TA_Sit_Bench(8, 8,23, 3,"DP_SHIP_DECK_29");
	TA_Sleep(23, 3,8, 8,"DP_SHIP_IN_SLEEPROOM_BED_05");
};

