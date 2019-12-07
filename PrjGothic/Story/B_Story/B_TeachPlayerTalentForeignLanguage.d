
func int B_TeachPlayerTalentForeignLanguage(var C_Npc slf,var C_Npc oth,var int Language)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_FOREIGNLANGUAGE,Language);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	/* ///ќтключено, ибо €зыков не изучаем новых
	if(Language < 3)
	{
		B_DSG_Log_OpenClose(TOPIC_DS_LANGUAGE_FER,LOG_NOTE,-1,"");
	}
	else
	{
		B_DSG_Log_OpenClose(TOPIC_DS_LANGUAGE_ORC,LOG_NOTE,-1,"");
	};
	if(Language == LANGUAGE_1)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
		Log_AddEntry(TOPIC_DS_LANGUAGE_FER,LOGTEXT_DS_LANGUAGE_1);
		PrintScreen("»зучено: язык кресть€н",-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	if(Language == LANGUAGE_2)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
		Log_AddEntry(TOPIC_DS_LANGUAGE_FER,LOGTEXT_DS_LANGUAGE_2);
		PrintScreen("»зучено: язык знати",-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	if(Language == LANGUAGE_3)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
		Log_AddEntry(TOPIC_DS_LANGUAGE_FER,LOGTEXT_DS_LANGUAGE_3);
		PrintScreen("»зучено: язык жрецов",-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	if(Language == ORC_LANGUAGE_1)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[ORC_LANGUAGE_1] = TRUE;
		Log_AddEntry(TOPIC_DS_LANGUAGE_ORC,LOGTEXT_DS_ORC_LANGUAGE_1);
		PrintScreen("»зучено: язык орков",-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	*/
	//PrintScreen(PRINT_LearnForeignLanguage,-1,-1,FONT_Screen,2);
	return TRUE;
};


