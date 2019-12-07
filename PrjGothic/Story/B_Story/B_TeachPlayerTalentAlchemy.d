
func int B_TeachPlayerTalentAlchemy(var C_Npc slf,var C_Npc oth,var int talent)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ALCHEMY,talent);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"����� ������� �����, ��� ����� ������ ��������, ������ � ����������� �����������. ������� ������������ ������������� ��������, � ���� ����������� ����� �� ������������ �����.");
	if(talent == ALCHEMY_Essence)
	{
		PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Essence] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"������ � ���� ������������ ����������� ��� ������������ ��������.");
	};
	if(talent == ALCHEMY_Extract)
	{
		PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Extract] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"� ������ ���������� ������� ��� ��������� ����������.");
	};
	if(talent == ALCHEMY_Elixir)
	{
		PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"� ���� ������������ ��������� ��� ��������� ���������.");
	};
	if(talent == ALCHEMY_Perm)
	{
		PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Perm] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"� �����, ��� ����� ������������ ������� ������, ����� ������������� ������ �����.");
	};
	if(talent == ALCHEMY_Time)
	{
		PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Time] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"������ � ���� ������������� ����� � ��������� �������� ����� �������.");
	};
	/*
	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ��������� �������Ȕ: 2 �������� �������� � 1 ������� �����.");
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ���������� ����������: 2 �������� ����� � 1 ������� �����.");
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ���������� ���������: 2 �������� ����� � 1 ������� �����.");
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ��������� ���۔: 2 �������� ������� � 1 ������� �����.");
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ���������� ���۔: 2 �������� ����� � 1 ������� �����.");
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ��������� ���۔: 2 �������� ����� � 1 ������� �����");
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ������ ��������ߔ: 1 �������-����� � 1 ������� �����");
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ��������� ���۔: 1 �������� ������ � 1 ������� ������.");
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ��������� �������Ȕ: 1 ���������� ����� � 1 ������� ������.");
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ��������� �����: 1 �������� ������ � 1 ������� ������.");
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		Log_AddEntry(TOPIC_TalentAlchemy,"����������� ��� ��������� ����Ȕ: 1 �������� ������ � 1 ������� ������.");
	};
	if(Npc_GetTalentSkill(oth,NPC_TALENT_ALCHEMY) == 0)
	{
		PrintScreen(PRINT_LearnAlchemy,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	//*/
	Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	return TRUE;
};


