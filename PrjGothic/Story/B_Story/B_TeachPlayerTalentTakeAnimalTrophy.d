func void B_TeachPlayerTalentTakeAnimalTrophy_LogEntry(var C_NPC oth, var int trophy)
{
	B_DSG_Log_OpenClose(TOPIC_TalentAnimalTrophy,LOG_NOTE,-1,"Теперь я могу:");
	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать клыки из животных.");
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вынимать когти из животных.");
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры с животных.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры с рептилий.");
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вынимать сердца из големов и демонов.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать рог у мракорисов.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вынимать язык у огненных ящеров.");
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать крылья у кровавых мух.");
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вынимать жало у кровавых мух.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать жвала у животных.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...снимать панцири с ползунов.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		Log_AddEntry(TOPIC_TalentAnimalTrophy,"...вырезать рога у драконих снепперов.");
	};
	if(Npc_GetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY) == 0)
	{
		PrintScreen(PRINT_DS_LearnTakeAnimalTrophy,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
};
func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf,var C_Npc oth,var int trophy)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	B_TeachPlayerTalentTakeAnimalTrophy_LogEntry(oth,trophy);
	return TRUE;
};


