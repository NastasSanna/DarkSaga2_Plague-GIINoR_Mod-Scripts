
func int B_TeachMagicCircle(var C_Npc slf,var C_Npc oth,var int circle)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_MAGE,circle);//NS - 05/05/2016 ����������� ��������� ������
	if((circle < 1) || (circle > 6))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	B_DSG_Log_OpenClose(TOPIC_TalentMagicCircle,LOG_NOTE,-1,"���������� ����, � ������� � ���� ������, �������������� �� ������. � �� ���� ������������ ����������, ��������� ����� �������� �����, ������ ��������� ����.");
	if(circle == 1)
	{
		PrintScreen(PRINT_LearnCircle_1,-1,-1,FONT_Screen,2);
		B_ds_LogEntry(TOPIC_TalentMagicCircle,LOG_NOTE,-1,"���������� 1-�� �����: ����, �������� ������, ����� ������, ������� ������ ������� � ����� ������� �������.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LearnCircle_2,-1,-1,FONT_Screen,2);
		B_ds_LogEntry(TOPIC_TalentMagicCircle,LOG_NOTE,-1,"���������� 2-�� �����: �������� ���, ������� ������, ����� �����, ����� ����� � ���.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LearnCircle_3,-1,-1,FONT_Screen,2);
		B_ds_LogEntry(TOPIC_TalentMagicCircle,LOG_NOTE,-1,"���������� 3-�� �����: ������� ������� �������, ������� ������, ����� �������� ����, �������� �������, ����� � ������� ����.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LearnCircle_4,-1,-1,FONT_Screen,2);
		B_ds_LogEntry(TOPIC_TalentMagicCircle,LOG_NOTE,-1,"���������� 4-�� �����: ������, �������� ��������� ������, ����������� ������ � ������� �������� ���.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LearnCircle_5,-1,-1,FONT_Screen,2);
		B_ds_LogEntry(TOPIC_TalentMagicCircle,LOG_NOTE,-1,"���������� 5-�� �����: ������� �������� ����, ������� �����, ����� ������ � ������� ������� �������.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LearnCircle_6,-1,-1,FONT_Screen,2);
		B_ds_LogEntry(TOPIC_TalentMagicCircle,LOG_NOTE,-1,"���������� 6-�� �����: �������� �����, ������� ������, ����� ������, ����� ���� � ����������� �������.");
		return TRUE;
	};
	return FALSE;
};


