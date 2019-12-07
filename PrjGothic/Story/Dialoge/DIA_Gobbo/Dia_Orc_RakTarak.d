instance DIA_RakTarak_EXIT(C_Info)
{
	npc = Orc_DS2P_RakTarak;
	nr = 999;
	permanent = TRUE;
	condition = DIA_RakTarak_EXIT_condition;	
	information = DIA_RakTarak_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_RakTarak_EXIT_condition(){	return TRUE;};
func void DIA_RakTarak_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 08/03/2016 ===========
// ����������
//===========================
//������������ ������ ---------------------
instance DIA_RakTarak_Hello(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 1;
	condition = DIA_RakTarak_Hello_condition;	
	information = DIA_RakTarak_Hello_info;
	important = TRUE;
};
func int DIA_RakTarak_Hello_condition(){	return TRUE;};
func void DIA_RakTarak_Hello_info()
{	
		AI_Output(self,other,"DIA_RakTarak_Hello_18_01");	//����, �����. ��� �� ���� ����.
	AI_Output(other,self,"DIA_RakTarak_Hello_15_02");	//���, ������� ��� ����������� ����, �� ����������� �� ����� ��� ������ ����������� ��������.
		AI_Output(self,other,"DIA_RakTarak_Hello_18_03");	//��� - ����. ��� �� ������� � �����. ��� ������ ���� � ����.
	AI_Output(other,self,"DIA_RakTarak_Hello_15_04");	//�������� �� ������.
};
//��� ��? ---------------------
instance DIA_RakTarak_WhoAU(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 2;
	condition = DIA_RakTarak_WhoAU_condition;	
	information = DIA_RakTarak_WhoAU_info;
	description = "��� ��?";
};
func int DIA_RakTarak_WhoAU_condition(){	return TRUE;};
func void DIA_RakTarak_WhoAU_info()
{	
	AI_Output(other,self,"DIA_RakTarak_WhoAU_15_01");	//��� ��?
		AI_Output(self,other,"DIA_RakTarak_WhoAU_18_02");	//��� ����� ���-�����, ��� ������� ������. �� ���� �����-����� ��� ����� � ������� � ��� � ���.
	AI_Output(other,self,"DIA_RakTarak_WhoAU_15_03");	//���? �������� ��������.
		AI_Output(self,other,"DIA_RakTarak_WhoAU_18_04");	//��������, �������� �����. ����� ������� � ������� �����. ��� ��� ��������� ���� ������. ������� ����� ����� ���. ��� ������ ����� ����, �� ������� ��� �� ��� ����. �� ���� ������� ����.
};
//������ �� ������ ��� ����? ---------------------
instance DIA_RakTarak_HowLearntLang(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 3;
	condition = DIA_RakTarak_HowLearntLang_condition;	
	information = DIA_RakTarak_HowLearntLang_info;
	description = "������ �� ������ ��� ����?";
};
func int DIA_RakTarak_HowLearntLang_condition(){	return TRUE;};
func void DIA_RakTarak_HowLearntLang_info()
{	
	AI_Output(other,self,"DIA_RakTarak_HowLearntLang_15_01");	//������ �� ������ ��� ����?
		AI_Output(self,other,"DIA_RakTarak_HowLearntLang_18_02");	//��� �������, ��������� � �����. ����� ������� � �������� � ���� � ������� ��� ����.
};
//��� �� ��� ������� ������ ����? ---------------------
instance DIA_RakTarak_WhyAlone(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 4;
	condition = DIA_RakTarak_WhyAlone_condition;	
	information = DIA_RakTarak_WhyAlone_info;
	description = "��� �� ��� ������� ������ ����?";
};
func int DIA_RakTarak_WhyAlone_condition(){	return TRUE;};
func void DIA_RakTarak_WhyAlone_info()
{	
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_01");	//��� �� ��� ������� ������ ����? ���� ������ �������� ������. 
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_02");	//��� ���� � ������, ������ ��������� �� �����, � ����� ����� ������. 
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_03");	//� ����� ���-�� ������ ��������, ����������� ������ ������������, �������� � ������ �������.
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_04");	//���� ����� ��� ���� �� ����� ������� ������. ���, ��� ����� ����� � ����� ������.
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_05");	//�� �������� ��� ����? �������?
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_06");	//��, ��� ���� ���. � ��� �����. �� ����� ��������� ���� ���, ������� �� ������� � �����. �� ������ �����, ���� ������ ��������� � �����. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_07");	//����� �������� �����, �� ��������� ����� ����� � ������ �������. ����� ��� ��� ����� �������. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_08");	//������ ��� � ������ ������ ���� ������ �� ���� �� ������� �����. ���� ������ ����� �����, ��� ���� � ����. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_09");	//�� ���� ������� ��������� �� ���. ������� ���� ���������� � ����� ������ �����, ��� ��� � ���� ��������.
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_10");	//��� �������, ����� ��� � ��-���. ���� ������. ��� ��� ���� ������ ����� �������, � ����� ����� ������� � ���� �����. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_11");	//�����-����� ��� ���� ������ ����� ���, �� ������ ���� �� ����� ���� ����� � �����, � ��� �������. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_12");	//����� ��� ����� ��� ����� � �������� �����. ����� ����, �����. ����� ��� ����� � ��� ������ ����.
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_13");	//�� ��� ����������� ������ ����� ����� ����. ��� ����� ��-���. �� ���� ����������� ���� � ���� � ������ � ���� �����������... �� ��������� �������.
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_14");	//��� � ��� ����?
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_15");	//���, ������ �� ������� ���� ������. ��-�� ���� ������, ���������. ��� ����, ��� � ��� ��� ��� �����.
};
//��� �� ������ ������ ������? ---------------------
//����� �����������
instance DIA_RakTarak_WhatNow(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 5;
	condition = DIA_RakTarak_WhatNow_condition;	
	information = DIA_RakTarak_WhatNow_info;
	description = "��� �� ������ ������ ������?";
};
func int DIA_RakTarak_WhatNow_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhyAlone))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhatNow_info()
{	
	AI_Output(other,self,"DIA_RakTarak_WhatNow_15_01");	//��� �� ������ ������ ������?
	if (MIS_DS2P_OrcInTrouble != LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_RakTarak_WhatNow_18_02");	//��� � ��-��� ����� ���� ����. ��� �� ���� ������� ������ ��� ���������� �� �����. ����� �� ������� ���� ����� �����.
	}
	else	{
		AI_Output(self,other,"DIA_RakTarak_WhatNow_18_03");	//���� ���������� ���� �����. ���� ������ ����. ���� ��� ���.
	};
};

//NS - 08/03/2016 ===========
// �� ������� � �������
//===========================
//� �� ���� ������� ��� ������ �����? ---------------------
instance DIA_RakTarak_OtherOrcs(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 11;
	condition = DIA_RakTarak_OtherOrcs_condition;	
	information = DIA_RakTarak_OtherOrcs_info;
	description = "� �� ���� ������� ��� ������ �����?";
};
func int DIA_RakTarak_OtherOrcs_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_Hello))	{
		return TRUE;
	};
};
func void DIA_RakTarak_OtherOrcs_info()
{	
	AI_Output(other,self,"DIA_RakTarak_OtherOrcs_15_01");	//� �� ���� ������� ��� ������ �����?
		AI_Output(self,other,"DIA_RakTarak_OtherOrcs_18_02");	//���, ���� ����� �� ����. ��� ������� ����� �����.
	AI_Output(other,self,"DIA_RakTarak_OtherOrcs_15_03");	//������?
		AI_Output(self,other,"DIA_RakTarak_OtherOrcs_18_04");	//����� ���� ������, ������� ��� �������.
};
//������ ��� ���������� ��������� � �������? ---------------------
instance DIA_RakTarak_AboutDragon(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 12;
	condition = DIA_RakTarak_AboutDragon_condition;	
	information = DIA_RakTarak_AboutDragon_info;
	description = "������ ��� ���������� ��������� � �������?";
};
func int DIA_RakTarak_AboutDragon_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_OtherOrcs))	{
		return TRUE;
	};
};
func void DIA_RakTarak_AboutDragon_info()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutDragon_15_01");	//������ ���������� ��� ��������� � �������?
		AI_Output(self,other,"DIA_RakTarak_AboutDragon_18_02");	//�� ������, ����� ������. ��� ����������� ��� ���� ������. � ��������������.
	AI_Output(other,self,"DIA_RakTarak_AboutDragon_15_03");	//��� ���� ����� �������? ������� �� ������ ��������� �� ���� �����?!
		AI_Output(self,other,"DIA_RakTarak_AboutDragon_18_04");	//���, �� �� ���� � �� ������. ������ ���� ��� �� ����. �� ������ �� �������, ������ ����. 
		AI_Output(self,other,"DIA_RakTarak_AboutDragon_18_05");	//��� ������ ���������� � ���, �� �� ������ �� ���������. �������� ������� ������, � ���� ����������.
};


//NS - 08/03/2016 ===========
// ����� "��� � ����"
//===========================
//��� � ����� ������? ---------------------
instance DIA_RakTarak_WhatHappenedToFriend(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 21;
	condition = DIA_RakTarak_WhatHappenedToFriend_condition;	
	information = DIA_RakTarak_WhatHappenedToFriend_info;
	description = "��� � ����� ������?";
};
func int DIA_RakTarak_WhatHappenedToFriend_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_Hello))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhatHappenedToFriend_info()
{	
	AI_Output(other,self,"DIA_RakTarak_WhatHappenedToFriend_15_01");	//��� � ����� ������?
		AI_Output(self,other,"DIA_RakTarak_WhatHappenedToFriend_18_02");	//�� ��������. ��� ������� ������.
	AI_Output(other,self,"DIA_RakTarak_WhatHappenedToFriend_15_03");	//��� ����� ������?
		AI_Output(self,other,"DIA_RakTarak_WhatHappenedToFriend_18_04");	//������ � ������� �������� ���� � �������� ����.
	AI_Output(other,self,"DIA_RakTarak_WhatHappenedToFriend_15_05");	//�������?
		AI_Output(self,other,"DIA_RakTarak_WhatHappenedToFriend_18_06");	//��, ��� �������� �����.
};
//���� � ���-�� ������? ---------------------
//����� �����������
instance DIA_RakTarak_MayIHelp(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 22;
	condition = DIA_RakTarak_MayIHelp_condition;	
	information = DIA_RakTarak_MayIHelp_info;
	description = "���� � ���-�� ������?";
};
func int DIA_RakTarak_MayIHelp_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhatHappenedToFriend))	{
		return TRUE;
	};
};
func void DIA_RakTarak_MayIHelp_info()
{	
	AI_Output(other,self,"DIA_RakTarak_MayIHelp_15_01");	//���� � ���-�� ������?
		AI_Output(self,other,"DIA_RakTarak_MayIHelp_18_02");	//��� ���������� ������ �����. ����� ������ ��-���.
	AI_Output(other,self,"DIA_RakTarak_MayIHelp_15_03");	//���-�� ������: � ���� ��� ���, ��?
		AI_Output(self,other,"DIA_RakTarak_MayIHelp_18_04");	//���. ��� ������ �����, �� ����� �� ��� �����. ������ ������ ������, ��-��� ����� ������� ��� ��� ������.
	AI_Output(other,self,"DIA_RakTarak_MayIHelp_15_05");	//� ���� �������� ���� ��� �����. ��� ���� �����?
		AI_Output(self,other,"DIA_RakTarak_MayIHelp_18_06");	//��� ����: ��� ���-���, ��� ���-���, ���� ���-����, ������ ���� � ���� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Start);
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Medicine);
	//UNFINISHED ������� �������� � ����/� ���������
};
//���� � ���-�� ������? ---------------------
//���� ���� �����
//������ � ������ �� 1 ����
var int DIA_RakTarak_AboutMedicine01_Once;
var int DIA_RakTarak_AboutMedicine02_Once;
var int DIA_RakTarak_AboutMedicine03_Once;
var int DIA_RakTarak_AboutMedicine04_Once;
var int DIA_RakTarak_AboutMedicine05_Once;
var int DIA_RakTarak_AboutMedicineAll_Once;
//��� ��������?
func int DIA_RakTarak_AboutMedicine_AllAsked()
{
	if (DIA_RakTarak_AboutMedicineAll_Once)	{
		return TRUE;
	};
	if (DIA_RakTarak_AboutMedicine01_Once && DIA_RakTarak_AboutMedicine02_Once && DIA_RakTarak_AboutMedicine03_Once
		&& DIA_RakTarak_AboutMedicine04_Once && DIA_RakTarak_AboutMedicine05_Once)
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_All);
		DIA_RakTarak_AboutMedicineAll_Once = TRUE;
		return TRUE;
	};
	return FALSE;
};
//.......................................
instance DIA_RakTarak_AboutMedicine(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 23;
	condition = DIA_RakTarak_AboutMedicine_condition;	
	information = DIA_RakTarak_AboutMedicine_info;
	description = "������ ���������...";
};
func int DIA_RakTarak_AboutMedicine_condition(){
	if (MIS_DS2P_OrcInTrouble == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_RakTarak_AboutMedicine_info()
{	
	Info_ClearChoices(DIA_RakTarak_AboutMedicine);
	if (DIA_RakTarak_AboutMedicine_AllAsked())	{
		Info_AddChoice(DIA_RakTarak_AboutMedicine,"� �����. (�����)",DIA_RakTarak_AboutMedicine_Back);
	};
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"��� ����� ������?",DIA_RakTarak_AboutMedicine05);
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"��� ����� ����?",DIA_RakTarak_AboutMedicine04);
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"��� ����� ���-����?",DIA_RakTarak_AboutMedicine03);
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"��� ����� ���-���?",DIA_RakTarak_AboutMedicine02);
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"��� ����� ���-���?",DIA_RakTarak_AboutMedicine01);
	if ((Npc_HasItems(other,ItPl_Health_Herb_01) >= 3) && (Npc_HasItems(other,ItPl_Mana_Herb_01) >= 2)
		&& (Npc_HasItems(other,ItPl_Mushroom_01) >= 7) && (Npc_HasItems(other,ItPl_Blueplant) >= 10)
		&& (Npc_HasItems(other,ItFo_DS2P_OrcBooze) >= 1))
	{
		Info_AddChoice(DIA_RakTarak_AboutMedicine,"� ��� ������.",DIA_RakTarak_AboutMedicine_Ready);
	};
};
func void DIA_RakTarak_AboutMedicine_Back()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine_Back_15_01");	//� �����.
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine_Back_18_02");	//��� ����� � �������� - �������. ��-��� ������ �������. �� ����� ���� �������.
	Info_ClearChoices(DIA_RakTarak_AboutMedicine);
};
func void DIA_RakTarak_AboutMedicine01()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine01_15_01");	//��� ����� ���-���?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine01_18_02");	//�������� ��������.
	if (!DIA_RakTarak_AboutMedicine01_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_GroBash);
		DIA_RakTarak_AboutMedicine01_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"� �����. (�����)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine02()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine02_15_01");	//��� ����� ���-���?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine02_18_02");	//�������� �������. ����� ������ � ������ ��������.
	if (!DIA_RakTarak_AboutMedicine02_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_ShtiOra);
		DIA_RakTarak_AboutMedicine02_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"� �����. (�����)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine03()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine03_15_01");	//��� ����� ���-����?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine03_18_02");	//���-���� ���� ������ ����. ���������, ������ ������.
	if (!DIA_RakTarak_AboutMedicine03_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_UraGona);
		DIA_RakTarak_AboutMedicine03_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"� �����. (�����)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine04()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine04_15_01");	//��� ����� ����?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine04_18_02");	//���� ����� � ��������. �������, ������� �������� �����.
	if (!DIA_RakTarak_AboutMedicine04_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Nori);
		DIA_RakTarak_AboutMedicine04_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"� �����. (�����)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine05()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine05_15_01");	//��� ����� ������?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine05_18_02");	//�������. ����� ������� � ������ �������. ������ �������. ����� ������ ���� ������ - ���� ���� �������.
	if (!DIA_RakTarak_AboutMedicine05_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Ktarto);
		DIA_RakTarak_AboutMedicine05_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"� �����. (�����)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine_Ready()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine_Ready_15_01");	//� ��� ������.
	//���� ����� � ������� �������
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01, 3);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,2);
	Npc_RemoveInvItems(other,ItPl_Mushroom_01, 7);
	Npc_RemoveInvItems(other,ItPl_Blueplant, 10);
	Npc_RemoveInvItems(other,ItFo_DS2P_OrcBooze, 1);
	AI_PrintScreen("����������� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,5);
	
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine_Ready_18_02");	//��� ���������� ����� �� ������. ����� �� ����� ��� ������ �����.
	//���-����� �������� � �������� ���� � ���-�� ������� ����� � ���. ������ ��� ������ � �������� ����� - B_DS2P_Talk_End
	AI_PlayAni(self,"T_LAB_STAND_2_S0");
	AI_PlayAni(self,"T_LAB_S0_2_S1");
	AI_PlayAni(self,"T_LAB_S1_2_S0");
	AI_PlayAni(self,"T_LAB_S0_2_STAND");
	ArTush_Healed = -1; //���� ���� ���������
	AI_StopProcessInfos(self);
};
// ��������� - ������� ----------------------------
instance DIA_RakTarak_Healed(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 24;
	condition = DIA_RakTarak_Healed_condition;	
	information = DIA_RakTarak_Healed_info;
	important = TRUE;
};
func int DIA_RakTarak_Healed_condition()
{
	if (ArTush_Healed && (Npc_GetDistToPlayer(Orc_DS2P_ArTush) < PERC_DIST_INTERMEDIAT))	{
		return TRUE;
	};
};
func void DIA_RakTarak_Healed_info()
{	
	//UNFINISHED
	var C_NPC RakTarak;	RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
	var C_NPC ArTush;	ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
	TRIA_Invite(ArTush);
	TRIA_Start();
	
	TRIA_Next(RakTarak);
	AI_LookAtNpc(RakTarak,hero);
		AI_Output(self,other,"DIA_RakTarak_Healed_18_01");	//������! ����� ������!
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_OrcInTrouble_Success);
	B_GivePlayerXP(XP_MIS_OrcInTrouble_Success);
	
	//���-����� �������������� � ��-����.
	AI_LookAtNpc(RakTarak,ArTush);
		AI_Output(self,other,"DIA_RakTarak_Healed_18_02");	//���� ����� �����! ����� ����� �������, ���� ��� �����.
	
	TRIA_Next(ArTush);
		AI_Output(self,other,"DIA_RakTarak_Healed_18_03");	//����� ����� ���� �����!
	AI_Output(other,self,"DIA_RakTarak_Healed_15_04");	//� ��-��������� �����? �� ����� �� �������.
	
	TRIA_Next(RakTarak);
	AI_TurnToNpc(RakTarak,hero);
	AI_LookAtNpc(RakTarak,hero);
		AI_Output(self,other,"DIA_RakTarak_Healed_18_05");	//��-��� �������� ������� �����.
	AI_Output(other,self,"DIA_RakTarak_Healed_15_06");	//�� ��������, �������. �� ����� ������ ��� ������� ��� �����?
		AI_Output(self,other,"DIA_RakTarak_Healed_18_07");	//��-��� �� ����� ���� �����. ��� ���� ������ ������� ������� �����. 
		AI_Output(self,other,"DIA_RakTarak_Healed_18_08");	//��� �� ���� ���� �����. ����� ����� ���� �����, � ��� ������� ����� �� �������.
	//���� ����� � ����� �����
	B_GiveInvItems(RakTarak,hero,ItMW_Ds_KrashDargot,1);
	TEACH_RakTarak = TRUE;

	TRIA_Finish();
};

//NS - 21/03/2016 ===========
// ����� "������ ��� ���������"
//===========================
//����� � �������� ---------------------
instance DIA_RakTarak_GobboCall(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 30;
	condition = DIA_RakTarak_GobboCall_condition;	
	information = DIA_RakTarak_GobboCall_info;
	description = "������, ���������. ��� �� �����, ���� ��������?";
};
func int DIA_RakTarak_GobboCall_condition(){
	if (MIS_DS2P_OrcInTrouble == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_RakTarak_GobboCall_info()
{	
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_01");	//������, ���������. ��� �� �����, ���� ��������?
		AI_Output(self,other,"DIA_RakTarak_GobboCall_18_02");	//���, ��� �� ����, ���� ����. ��� � ��-���, ��������, ���������� ��� �����������.
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_03");	//���� ����������� �������.
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_04");	//�� ���� �������, �� �������, ����� ����� ��������, ������� ������ ���������. �� ��� ��������� �������� �������� �����, � �������� ������� �� ����� ����������. 
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_05");	//�� ����� ����� ���������, ��� ��. � ���� � ��-����� �������� ���� ���, � ��� �� ���� ����� �������� � ����� �� �����.
		AI_Output(self,other,"DIA_RakTarak_GobboCall_18_06");	//��� ��������� ���� �����������. ���� ��������. ��� � ��-��� �������� ������� �������� � �������� ���� ���.
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_07");	//��� � ������.
		AI_Output(self,other,"DIA_RakTarak_GobboCall_18_08");	//�� ���� �� �����, ���� ����. ���� ����� ����� ���.
	//������ � �������� "������ ��� ���������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_OrcsAgree);
	B_GivePlayerXP(XP_MIS_Protection4LittleOnes_Agreed);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Orc_DS2P_ArTush.aivar[AIV_PARTYMEMBER] = TRUE;
};
//����� � �������� ---------------------
instance DIA_RakTarak_LetsGo(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 31;
	condition = DIA_RakTarak_LetsGo_condition;	
	information = DIA_RakTarak_LetsGo_info;
	description = "� ������ ���. �����!";
	permanent = TRUE;
};
func int DIA_RakTarak_LetsGo_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && (Orcs_Follow == FALSE))	{
		return TRUE;
	};
};
func void DIA_RakTarak_LetsGo_info()
{	
	B_StartOtherRoutine(self,"FOLLOW");
	B_StartOtherRoutine(Orc_DS2P_ArTush,"FOLLOW");
	AI_Output(other,self,"DIA_RakTarak_LetsGo_15_01");	//� ������ ���. �����!
	AI_StopProcessInfos(self);
	Orcs_Follow = TRUE;
};
//����� ---------------------
instance DIA_RakTarak_WaitHere(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 32;
	condition = DIA_RakTarak_WaitHere_condition;	
	information = DIA_RakTarak_WaitHere_info;
	description = "��������� ���!";
	permanent = TRUE;
};
func int DIA_RakTarak_WaitHere_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && (Orcs_Follow == TRUE))	{
		return TRUE;
	};
};
func void B_DS2P_OrcsWait()
{
	Orcs_Follow = FALSE;
	B_SetWaitWP(self, WP_RakTarak_Wait);
	B_StartOtherRoutine(self,"WAIT");
//	B_SetWaitWP(self, WP_ArTush_Wait); WP ����� � 2� �����
	B_StartOtherRoutine(Orc_DS2P_ArTush,"WAIT");
};
func void DIA_RakTarak_WaitHere_info()
{	
	B_DS2P_OrcsWait();
	AI_Output(other,self,"DIA_RakTarak_WaitHere_15_01");	//��������� ���!
		AI_Output(self,other,"DIA_RakTarak_WaitHere_18_02");	//���� ����� �����. ����� ������������.
	AI_StopProcessInfos(self);
};
//���� ������ ---------------------
instance DIA_RakTarak_TooClose(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 33;
	condition = DIA_RakTarak_TooClose_condition;	
	information = DIA_RakTarak_TooClose_info;
	important = TRUE;
	permanent = TRUE;
};
func int C_DS2P_OrcsTooClose()
{
	//UNFINISHED ������� ������ � �������
	if (Npc_GetDistToWP(self,"DP_VILL_VILLAGE_01") < 5000)	{
		return FALSE;
	};
	if (Npc_GetDistToWP(self,"DP_VILL_VILLAGE_02") < 5000)	{
		return FALSE;
	};
	//UNFINISHED ������� ������ � ���������
	if (Npc_GetDistToWP(self,"") < 3000)	{
		return FALSE;
	};
	return FALSE;
};
func int DIA_RakTarak_TooClose_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && (Orcs_Follow == TRUE)
		 && C_DS2P_OrcsTooClose())	{
		return TRUE;
	};
};
func void DIA_RakTarak_TooClose_info()
{	
	B_DS2P_OrcsWait();
		AI_Output(self,other,"DIA_RakTarak_TooClose_18_01");	//���� ������ �� ����. ����� �����, ������� ������.
	AI_StopProcessInfos(self);
};
//������! ---------------------
instance DIA_RakTarak_CameToGobbos(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 34;
	condition = DIA_RakTarak_CameToGobbos_condition;	
	information = DIA_RakTarak_CameToGobbos_info;
	description = "���, �� ������.";
	permanent = TRUE;
};
func int C_DS2P_OrcsCameToGobbos()
{
	//UNFINISHED ������ � �������
	if (Npc_GetDistToWP(self,"") < 3000)	{
		return FALSE;
	};
	return FALSE;
};
func int DIA_RakTarak_CameToGobbos_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && (Orcs_Follow == TRUE)
		 && C_DS2P_OrcsCameToGobbos())	{
		return TRUE;
	};
};
func void DIA_RakTarak_CameToGobbos_info()
{	
	//�������� ����. ����������
	ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
	RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
	//����� ���� � �������
	B_StartOtherRoutine(RakTarak,"GOBBOCAMP");
	B_StartOtherRoutine(ArTush,"GOBBOCAMP");
	
	TRIA_Start();
	TRIA_Invite(ArTush);
	
	AI_Output(other,self,"DIA_RakTarak_CameToGobbos_15_01");	//���, �� ������.
		AI_Output(self,other,"DIA_RakTarak_CameToGobbos_18_02");	//�������, �����. ���� ����� ����� ��� ���. ��� �� ����, ��� ���� �����������.

	TRIA_Next(ArTush);
		AI_TurnToNpc(self,other);
		AI_TurnToNpc(other,self);
		AI_Output(self,other,"DIA_RakTarak_CameToGobbos_18_03");	//��� ����, ���-�����. ���� ����� ����� ����.
	TRIA_Next(RakTarak);
		AI_TurnToNpc(self,other);
		AI_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_RakTarak_CameToGobbos_15_04");	//��� �� �������?
		AI_Output(self,other,"DIA_RakTarak_CameToGobbos_18_05");	//��-��� ��������, ��� ������� ����� ����� ��������� � ������� ���.
	//����� ���� ���� ��-��� �������� ���� ������ �� ����� � ���� ��� ����� ��
	//TEST NEEDED
	TRIA_Next(ArTush);
		AI_TurnToNpc(self,other);
		AI_TurnToNpc(other,self);
		AI_ReadyMeleeWeapon(self);
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_SpawnNpcRange(self,MEATBUG_Invisible,1,10);
		self = Hlp_GetNpc(self_bkup);
		Npc_SetTarget(self,MEATBUG_Invisible);
		AI_Attack(self);
	TRIA_Next(RakTarak);
		AI_TurnToNpc(self,other);
		AI_TurnToNpc(other,self);
		AI_Output(self,other,"DIA_RakTarak_CameToGobbos_18_06");	//���������? ����� ����� ����� ������ ����� �����.
	TRIA_Finish();

	//�������� ��������� ������� +3
	B_RaiseFightTalent(other,NPC_TALENT_2H, 3);
	//������ � �������� "������ ��� ���������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_OrcsCame);
	
	//�������, ������ �� �����
	Orcs_Follow = FALSE;
	Orcs_CameToGobbos = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Orc_DS2P_ArTush.aivar[AIV_PARTYMEMBER] = FALSE;
};



//NS - 10/03/2016 ===========
// ��������
//===========================
instance DIA_RakTarak_preTeach(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 51;
	condition = DIA_RakTarak_preTeach_condition;	
	information = DIA_RakTarak_preTeach_info;
	description = "���� �� ������ ������� ����?";
};
func int DIA_RakTarak_preTeach_condition()
{
	if (TEACH_RakTarak)	{
		return TRUE;
	};
};
func void DIA_RakTarak_preTeach_info()
{	
	AI_Output(other,self,"DIA_RakTarak_preTeach_15_01");	//���� �� ������ ������� ����?
		AI_Output(self,other,"DIA_RakTarak_preTeach_18_02");	//��� ������� ���� ������� �����, ����� ������ ���� �������.
	B_ds_LogEntry(TOPIC_TeacherOther,LOG_NOTE,-1,"��� ���-����� �������, ��� ��������� ��������� ������� �������, � ����� ���� ���������� ��� ��������� ����.");
};
// ----------------------------------------------------------
// ��� ������� ��� �������� ������� �������, � ����� �������� ���� �� 200.
instance DIA_RakTarak_Teach(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 52;
	condition = DIA_RakTarak_Teach_condition;	
	information = DIA_RakTarak_Teach_info;
	description = "����� ����...";
	permanent = TRUE;
};
func int DIA_RakTarak_Teach_condition()
{
	if (TEACH_RakTarak
		&& Npc_KnowsInfo(other,DIA_RakTarak_preTeach))	{
		return TRUE;
	};
};
func void DIA_RakTarak_Teach_info()
{	
	Info_ClearChoices(DIA_RakTarak_Teach);
	Info_AddChoice(DIA_RakTarak_Teach,Dialog_Back,DIA_RakTarak_Teach_Back);
	Info_AddChoice(DIA_RakTarak_Teach,"���� +5",DIA_RakTarak_Teach_Strength5);
	Info_AddChoice(DIA_RakTarak_Teach,"���� +1",DIA_RakTarak_Teach_Strength1);
	Info_AddChoice(DIA_RakTarak_Teach,"������ ������",DIA_RakTarak_Teach_OrcWeapon);
};
func void DIA_RakTarak_Teach_Back()
{	
	Info_ClearChoices(DIA_RakTarak_Teach);
};
func void DIA_RakTarak_Teach_OrcWeapon()
{	
	if(B_DS_TeachPlayerOrcWeapon(self,other,ORCWEAPON_LEVEL_FIRST))
	{
		AI_Output(other,self,"DIA_RakTarak_Teach_OrcWeapon_15_01");	//����� ���� ��������� ����� �������.
			AI_Output(self,other,"DIA_RakTarak_Teach_OrcWeapon_18_02");	//����� ������ �������, ��� ������ ����� �������, ��� � �����. ��������� �� ���� ����� ����� ���� � ��������.
			AI_Output(self,other,"DIA_RakTarak_Teach_OrcWeapon_18_03");	//����� ������� ������� ��� ����, �������� ������ �������� � �����, ����� �� ������� ����� ����. 
			AI_Output(self,other,"DIA_RakTarak_Teach_OrcWeapon_18_04");	//���� ���� �������� ��������, ������ ���� ������ ����. ����� ���� ������� ����� ���� �����, ������ ���� �� ������.
	};
	DIA_RakTarak_Teach_info();
};
func void DIA_RakTarak_Teach_Strength1()
{	
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,200))
	{
		AI_Output(self,other,"DIA_RakTarak_Teach_Strength_18_01");	//��� ����� ���� �������.
	};
	DIA_RakTarak_Teach_info();
};
func void DIA_RakTarak_Teach_Strength5()
{	
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,200))
	{
		AI_Output(self,other,"DIA_RakTarak_Teach_Strength_18_01");	//��� ����� ���� �������.
	};
	DIA_RakTarak_Teach_info();
};



/* UNFINISHED

SVN
���-�����: ��� ������ ������ �� ������� �����.



//*/
