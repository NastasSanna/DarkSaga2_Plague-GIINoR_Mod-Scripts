
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
	B_DSG_Log_OpenClose(TOPIC_TalentTrophySkin,LOG_NOTE,-1,"������ � ����:");
	if(skin_talent == SKIN_COMMON)
	{
		PLAYER_TALENT_SKIN[SKIN_COMMON] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...������������ ����.");
	};
	if(skin_talent == SKIN_DO_LIGHT)
	{
		PLAYER_TALENT_SKIN[SKIN_DO_LIGHT] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...������ ������ ����� ���������. ��� �� ������������ ���������� 5 ������������ ���� ����� � 5 �������� �������.");
	};
	if(skin_talent == SKIN_REDO_LIGHT)
	{
		PLAYER_TALENT_SKIN[SKIN_REDO_LIGHT] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...��������� ������ ����� ���������. ��� �� ���������� ���������� 2 �������� ��������.");
	};
	if(skin_talent == SKIN_DO_MEDIUM)
	{
		PLAYER_TALENT_SKIN[SKIN_DO_MEDIUM] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...������ ������� ����� ���������. ��� �� ������������ ���������� 6 ������������ ���� ����� � 8 �������� �������.");
	};
	if(skin_talent == SKIN_REDO_MEDIUM)
	{
		PLAYER_TALENT_SKIN[SKIN_REDO_MEDIUM] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...��������� ������� ����� ���������. ��� �� ���������� ���������� 2 ������������ ����� ����� � 4 �������� ��������.");
	};
	if(skin_talent == SKIN_DO_HARD)
	{
		PLAYER_TALENT_SKIN[SKIN_DO_HARD] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...������ ������� ����� ���������. ��� �� ������������ ���������� 4 ������������ ����� ��������� � 10 �������� �������.");
	};
	if(skin_talent == SKIN_REDO_HARD)
	{
		PLAYER_TALENT_SKIN[SKIN_REDO_HARD] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...��������� ������� ����� ���������. ��� �� ���������� ���������� 6 �������� �������.");
	};
	if(skin_talent == SKIN_DO_TROLL)
	{
		PLAYER_TALENT_SKIN[SKIN_DO_TROLL] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...������ ������� �������. ��� �� ������������ ���������� 3 ������������ ����� ������ � 20 �������� �������.");
	};
	if(skin_talent == SKIN_REDO_TROLL)
	{
		PLAYER_TALENT_SKIN[SKIN_REDO_TROLL] = TRUE;
		Log_AddEntry(TOPIC_TalentTrophySkin,"...��������� ������� �������. ��� �� ���������� ���������� 10 �������� �������.");
	};
	if(Npc_GetTalentSkill(oth,NPC_DS_SKIN) == 0)
	{
		PrintScreen(PRINT_DS_LearnTrophySkin,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	Npc_SetTalentSkill(oth,NPC_DS_SKIN,1);
	return TRUE;
};



