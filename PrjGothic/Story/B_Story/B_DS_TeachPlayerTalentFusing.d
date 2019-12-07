
func int B_DS_TeachPlayerTalentFusing(var C_Npc slf,var C_Npc oth,var int skill)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_FUSING,skill);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	b_dsg_log_openclose(TOPIC_TALENTFUSING,LOG_NOTE,-1,"����� ������� ���������, ������ ����� ��� ����� ����� ��� ������. � ������ �������� ������� ������ � ���� ���������, � ����� �������� ������� � �����. ��������� �������������� ����������� ������� �� ������ ��� �������.");
	if(skill == FUSING_GOLD)
	{
		PLAYER_TALENT_FUSING[FUSING_GOLD] = TRUE;		
		Log_AddEntry(TOPIC_TALENTFUSING,"�� �������� ��������� ���������� 10 ���������. � �� ������ ��������� ����� ���������� 4 ������.");
	};
	if(skill == FUSING_MAGICORE)
	{
		PLAYER_TALENT_FUSING[FUSING_MAGICORE] = TRUE;
		Log_AddEntry(TOPIC_TALENTFUSING,"�� ������ ����� ���������� ���� ���������� 10 ��������� ��� ������������.");
	};
	if(skill == FUSING_SILVERORE)
	{
		PLAYER_TALENT_FUSING[FUSING_SILVERORE] = TRUE;
		Log_AddEntry(TOPIC_TALENTFUSING,"�� ����������� ��������� ���������� 10 ���������. � �� ������ ��������� ����� ���������� 4 ������ ��� ���������� ���� ����������.");
	};
	if(skill == FUSING_IRONORE)
	{
		PLAYER_TALENT_FUSING[FUSING_IRONORE] = TRUE;
		Log_AddEntry(TOPIC_TALENTFUSING,"�� ������ ����� �������� ���� ����� ��������� 10 ��������� ��� ������������, 3 ����� ����� ����� ��� 2 �������� ��� ��������.");
	};
	if(skill == FUSING_BLACKORE)
	{
		PLAYER_TALENT_FUSING[FUSING_BLACKORE] = TRUE;
		Log_AddEntry(TOPIC_TALENTFUSING,"�� ������ ����� ������ ���� ���������� 10 ��������� ��� ������������.");
	};
	if(Npc_GetTalentSkill(oth,NPC_TALENT_FUSING) == 0)
	{
		PrintScreen(PRINT_DS_LEARNFUSING,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	Npc_SetTalentSkill(oth,NPC_TALENT_FUSING,1);
	return TRUE;
};

