
func void B_WISPDETECTOR_LearnEffect(var C_Npc Teacher)
{
	AI_PlayAni(Teacher,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
	Snd_Play("WSP_Dead_A1");
};

func int B_TeachPlayerTalentWispDetector(var C_Npc slf,var C_Npc oth,var int WispSkill)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_WISPDETECTOR,WispSkill);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	B_DSG_Log_OpenClose(TOPIC_WispDetector,LOG_NOTE,-1,LogText_Addon_WispLearned);
	if(WispSkill == WISPSKILL_FF)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_FF);
	};
	if(WispSkill == WISPSKILL_NONE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_NONE);
	};
	if(WispSkill == WISPSKILL_RUNE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_RUNE);
	};
	if(WispSkill == WISPSKILL_MAGIC)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_MAGIC);
	};
	if(WispSkill == WISPSKILL_FOOD)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_FOOD);
	};
	if(WispSkill == WISPSKILL_POTIONS)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_POTIONS);
	};
	if(WispSkill == WISPSKILL_BONUSARMOR01)
	{
		PLAYER_TALENT_WISPDETECTOR[7] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);		
		B_DSG_Log_OpenClose(TOPIC_WISPDETECTORSPECIAL,LOG_NOTE,-1,LOGTEXT_ADDON_WISPLEARNED_BONUSARMOR01);
	};
	if(WispSkill == WISPSKILL_BONUSARMOR02)
	{
		PLAYER_TALENT_WISPDETECTOR[8] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);		
	};
	if(WispSkill == WISPSKILL_BONUSARMOR03)
	{
		PLAYER_TALENT_WISPDETECTOR[9] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
	};
	if(WispSkill == WISPSKILL_BONUSATTACK01)
	{
		PLAYER_TALENT_WISPDETECTOR[10] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_DSG_Log_OpenClose(TOPIC_WISPDETECTORSPECIAL,LOG_NOTE,-1,LOGTEXT_ADDON_WISPLEARNED_BONUSATTACK01);
	};
	if(WispSkill == WISPSKILL_BONUSATTACK02)
	{
		PLAYER_TALENT_WISPDETECTOR[11] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
	};
	if(WispSkill == WISPSKILL_BONUSATTACK03)
	{
		PLAYER_TALENT_WISPDETECTOR[12] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
	};
	if(WispSkill == WISPSKILL_LIGHTWISP)
	{
		PLAYER_TALENT_WISPDETECTOR[15] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_DSG_Log_OpenClose(TOPIC_WISPDETECTORSPECIAL,LOG_NOTE,-1,LOGTEXT_ADDON_WISPLEARNED_LIGHTWISP);
	};
	if(WispSkill == WISPSKILL_FINDING)
	{
		PLAYER_TALENT_WISPDETECTOR[16] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_DSG_Log_OpenClose(TOPIC_WISPDETECTORSPECIAL,LOG_NOTE,-1,LOGTEXT_ADDON_WISPLEARNED_FINDING);
	};
	if(WispSkill == WISPSKILL_MANAREGENERATION)
	{
		PLAYER_TALENT_WISPDETECTOR[13] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_DSG_Log_OpenClose(TOPIC_WISPDETECTORSPECIAL,LOG_NOTE,-1,LOGTEXT_ADDON_WISPLEARNED_MANAREGENERATION);
	};
	if(WispSkill == WISPSKILL_HPREGENERATION)
	{
		PLAYER_TALENT_WISPDETECTOR[14] = TRUE;
		B_WISPDETECTOR_LearnEffect(slf);
		B_DSG_Log_OpenClose(TOPIC_WISPDETECTORSPECIAL,LOG_NOTE,-1,LOGTEXT_ADDON_WISPLEARNED_HPREGENERATION);
	};
	//PrintScreen(PRINT_LearnWispDetector,-1,-1,FONT_Screen,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_WISPDETECTOR,1);
	return TRUE;
};


