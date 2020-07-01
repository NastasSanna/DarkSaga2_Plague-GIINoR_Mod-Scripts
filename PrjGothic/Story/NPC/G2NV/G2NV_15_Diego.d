
/*                 ДИЕГО                       */

// прототип
prototype Proto_G2NV_15_Diego(C_Npc)
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
	
	name[0] = "Диего";
	guild = GIL_G2NV;
	id = 15;
	voice = 11;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
};
func void B_SetVisuals_Diego()
{
	B_SetNpcVisual(self,MALE,"Hum_Head_Thief",Face_L_Diego,BodyTex_L,ITAR_Diego);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
};


// на стартовой локации
instance G2NV_15_Diego_PreStart(Proto_G2NV_15_Diego)
{
	B_SetVisuals_Diego();
	daily_routine = Rtn_PreStart_15;
};
// на основной локации
instance G2NV_15_Diego(Proto_G2NV_15_Diego)
{
	B_SetVisuals_Diego();
	daily_routine = Rtn_Start_15;
};


func void Rtn_PreStart_15()	//Стоит на палубе
{
	TA_Stand_WP(8,0,23,0,"DP_SHIP_CREW_06");
	TA_Stand_WP(23,0,8,0,"DP_SHIP_CREW_06");
}; 
func void Rtn_Start_15()	//Стоит на корабле
{
	TA_Follow_Player(8,0,23,0,"DP_SHIP_CREW_03");
	TA_Follow_Player(23,0,8,0,"DP_SHIP_CREW_03");
}; 

func void Rtn_GotoPirates_15()	//Идёт на пирс к пиратам с ГГ
{
	// UNFINISHED
	TA_Stand_WP(8,0,23,0,"DP_COAST_PIER03_03");
	TA_Stand_WP(23,0,8,0,"DP_COAST_PIER03_03");
};
func void Rtn_Unconscious_15()	//Лежит в бессознанке, типа от чумы.
{
	// UNFINISHED
	TA_LIE_Always(8,0,23,0,"DP_COAST_PIER03_03");
	TA_LIE_Always(23,0,8,0,"DP_COAST_PIER03_03");
};
// спит на корабле, заражённый
func void Rtn_SleepDeep_15()
{
	TA_Sleep_Deep(8,0,23,0,"DP_SHIP_IN_SLEEPROOM_BED_04");
	TA_Sleep_Deep(23,0,8,0,"DP_SHIP_IN_SLEEPROOM_BED_04");
};
// ждем битву с пиратами, прячемся
func void Rtn_Hide_15()
{
	TA_Sit_Chair(7,25,22,50,"DP_SHIP_IN_18");
	TA_Sleep(22,50,7,25,"DP_SHIP_IN_SLEEPROOM_BED_04");
};
// бой с пиратами
func void Rtn_Fight_15()
{
	// UNFINISHED
	TA_Stand_WP(6,0,23,0,"DP_SHIP_CREW_05");
	TA_Stand_WP(23,0,6,0,"DP_SHIP_CREW_05");
};
// здоров, не прячемся
func void Rtn_Healed_15()
{
	TA_Sit_Bench(7,25,22,50,"DP_SHIP_CREW_04");
	TA_Sleep(22,50,7,25,"DP_SHIP_IN_SLEEPROOM_BED_04");
};

