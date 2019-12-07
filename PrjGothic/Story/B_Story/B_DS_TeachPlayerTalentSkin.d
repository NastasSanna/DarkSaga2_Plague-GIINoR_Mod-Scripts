
func int B_DS_TeachPlayerTalentSkin(var C_Npc slf,var C_Npc oth,var int skin_talent)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_DS_SKIN,skin_talent);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	B_DSG_Log_OpenClose(TOPIC_TalentTrophySkin,LOG_NOTE,-1,"Теперь я могу:");
	if(skin_talent == SKIN_COMMON)
	{
		PLAYER_TALENT_SKIN[SKIN_COMMON] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...обрабатывать кожу.");
	};
	if(skin_talent == SKIN_DO_LIGHT)
	{
		PLAYER_TALENT_SKIN[SKIN_DO_LIGHT] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...делать легкую броню охотников. Для ее изготовления необходимы 5 обработанных шкур волка и 5 стальных пластин.");
	};
	if(skin_talent == SKIN_REDO_LIGHT)
	{
		PLAYER_TALENT_SKIN[SKIN_REDO_LIGHT] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...укреплять легкую броню охотников. Для ее укрепления необходимы 2 стальные пластины.");
	};
	if(skin_talent == SKIN_DO_MEDIUM)
	{
		PLAYER_TALENT_SKIN[SKIN_DO_MEDIUM] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...делать среднюю броню охотников. Для ее изготовления необходимы 6 обработанных шкур варга и 8 стальных пластин.");
	};
	if(skin_talent == SKIN_REDO_MEDIUM)
	{
		PLAYER_TALENT_SKIN[SKIN_REDO_MEDIUM] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...укреплять среднюю броню охотников. Для ее укрепления необходимы 2 обработанные шкуры варга и 4 стальные пластины.");
	};
	if(skin_talent == SKIN_DO_HARD)
	{
		PLAYER_TALENT_SKIN[SKIN_DO_HARD] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...делать тяжелую броню охотников. Для ее изготовления необходимы 4 обработанные шкуры мракориса и 10 стальных пластин.");
	};
	if(skin_talent == SKIN_REDO_HARD)
	{
		PLAYER_TALENT_SKIN[SKIN_REDO_HARD] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...укреплять тяжелую броню охотников. Для ее укрепления необходимы 6 стальных пластин.");
	};
	if(skin_talent == SKIN_DO_TROLL)
	{
		PLAYER_TALENT_SKIN[SKIN_DO_TROLL] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...делать ”Защиту тролля”. Для ее изготовления необходимы 3 обработанных шкуры тролля и 20 стальных пластин.");
	};
	if(skin_talent == SKIN_REDO_TROLL)
	{
		PLAYER_TALENT_SKIN[SKIN_REDO_TROLL] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...укреплять ”Защиту тролля”. Для ее укрепления необходимы 10 стальных пластин.");
	};
	if(Npc_GetTalentSkill(oth,NPC_DS_SKIN) == 0)
	{
		PrintScreen(PRINT_DS_LearnTrophySkin,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	Npc_SetTalentSkill(oth,NPC_DS_SKIN,1);
	return TRUE;
};



