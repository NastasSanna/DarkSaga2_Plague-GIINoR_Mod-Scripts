
func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	B_DSG_Log_OpenClose(TOPIC_TalentSmith,LOG_NOTE,-1,"����� �������� ������, ������ ����� ��� ����� ����� �����. � ������ �������� ������� �� � ���� ���������� �����, � ����� ������� ����� �� ����������. ������ ������ �������� ������� ������ ����������, ��������� ������ ������ ��������. ");
	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;		
		Log_AddEntry(TOPIC_TalentSmith,"��� ����������� ����� ��� �� ����� ������� ������������.");
	};
	/*
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"��� ��������� ������� ����� ��� ����� 1 ����� ����.");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"��� ����������� ������� ����� ��� ����� 2 ����� ����.");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"��� ������������ ������� ����� ��� ����� 2 ����� ����.");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"��� ��������� ���������� ������� ����� ��� ����� 3 ����� ����.");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"��� �������� ������� ����� ��� ����� 3 ����� ����.");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"��� ��������� ������� ������� ����� ��� ����� 4 ����� ����.");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"��� �������� ������ �������� ��� ����� 4 ����� ���� � 5 �������� ����� �������.");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"��� ��������� ������� ������ �������� ��� ����� 5 ����� ���� � 5 �������� ����� �������.");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"������ � ���� �������� ���������� ���.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"������ � ���� �������� ���������� ������� ���.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"������ � ���� �������� ��������� ������.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ��� ������ ����� ���� �������� - ������ �� ������ ������� � ����!");
	};
	*/
//*******************DS********************
	/*
		if(waffe == WEAPON_ThornWood)
	{
		PLAYER_TALENT_SMITH[WEAPON_ThornWood] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ����� � ������...");
	};

		if(waffe == WEAPON_OreDagger)
	{
		PLAYER_TALENT_SMITH[WEAPON_OreDagger] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ������ ������...");
	};

		if(waffe == WEAPON_WolfT)
	{
		PLAYER_TALENT_SMITH[WEAPON_WolfT] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ��� �����...");
	};

		if(waffe == WEAPON_BloodFlow)
	{
		PLAYER_TALENT_SMITH[WEAPON_BloodFlow] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ��������������...");
	};

		if(waffe == WEAPON_HowlBlood)
	{
		PLAYER_TALENT_SMITH[WEAPON_HowlBlood] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ��� �����...");
	};

		if(waffe == WEAPON_2h_Star)
	{
		PLAYER_TALENT_SMITH[WEAPON_2h_Star] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ������...");
	};

		if(waffe == WEAPON_Conquer)
	{
		PLAYER_TALENT_SMITH[WEAPON_Conquer] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ����������...");
	};

		if(waffe == WEAPON_2h_Reveng)
	{
		PLAYER_TALENT_SMITH[WEAPON_2h_Reveng] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ���������...");
	};

		if(waffe == WEAPON_2h_Crusher)
	{
		PLAYER_TALENT_SMITH[WEAPON_2h_Crusher] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ���������...");
	};
	
	
		if(waffe == WEAPON_OrcSlay)
	{
		PLAYER_TALENT_SMITH[WEAPON_OrcSlay] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ������ �����...");
	};

		if(waffe == WEAPON_PiratSword)
	{
		PLAYER_TALENT_SMITH[WEAPON_PiratSword] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ��������� �����...");
	};

		if(waffe == WEAPON_MasterSword)
	{
		PLAYER_TALENT_SMITH[WEAPON_MasterSword] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ������ �������...");
	};

		if(waffe == WEAPON_DeathSong)
	{
		PLAYER_TALENT_SMITH[WEAPON_DeathSong] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ����� ������...");
	};

		if(waffe == WEAPON_WavCut)
	{
		PLAYER_TALENT_SMITH[WEAPON_WavCut] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ��������...");
	};

		if(waffe == WEAPON_UndeadSlay)
	{
		PLAYER_TALENT_SMITH[WEAPON_UndeadSlay] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ������ ������...");
	};

		if(waffe == WEAPON_2H_Punch)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Punch] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ���� ����...");
	};

		if(waffe == WEAPON_2H_Urrok)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Urrok] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ���� �����...");
	};

		if(waffe == WEAPON_2H_Agash)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Agash] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ���� ����...");
	};
	
		if(waffe == WEAPON_2H_Brokdar)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Brokdar] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ���� �������...");
	};
	
		if(waffe == WEAPON_2H_RageOrc)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_RageOrc] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ���� ����...");
	};
	
		if(waffe == WEAPON_2H_OkoBeliar)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_OkoBeliar] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ��� �������...");
	};

		if(waffe == WEAPON_2H_OreConq)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_OreConq] = TRUE;
		Log_AddEntry(TOPIC_TalentSmith,"����� ������� ������ ����������...");
	};
*/

	
//********************ds**********************	
	if(Npc_GetTalentSkill(oth,NPC_TALENT_SMITH) == 0)
	{
		PrintScreen(PRINT_LearnSmith,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
	};
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};



