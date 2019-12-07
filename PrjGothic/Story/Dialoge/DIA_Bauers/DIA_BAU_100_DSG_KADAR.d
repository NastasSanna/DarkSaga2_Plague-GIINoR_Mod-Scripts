instance DIA_Kadar_EXIT(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Kadar_EXIT_condition;	
	information = DIA_Kadar_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Kadar_EXIT_condition(){	return TRUE;};
func void DIA_Kadar_EXIT_info(){	AI_StopProcessInfos(self);};
//
//	��������� ������
//
instance DIA_Kadar_WhoAU(C_Info)	//��������� ������ "��� ��?"  //nr = 1
{
	npc = BAU_100_DS2P_KADAR;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Kadar_WhoAU_condition;	
	information = DIA_Kadar_WhoAU_info;
	description = "��� ��?";
};
func int DIA_Kadar_WhoAU_condition(){	return TRUE;};
func void DIA_Kadar_WhoAU_info()
{
	AI_Output(other,self,"DIA_Kadar_WhoAU_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Kadar_WhoAU_10_00");	//���� ����� �����, � ������ �������� �������.
	AI_Output(other,self,"DIA_Kadar_WhoAU_15_01");	//������ ������?
	AI_Output(self,other,"DIA_Kadar_WhoAU_10_01");	//������ ��� ������ � ������ �� �����, � ��� ����� ������ �� ������, ��� ������� ���� �� ������ ������. ������ ����� ������ ������.
};
//
//	������ ���������� �����: ���������� "��� ��?"
//
instance DIA_Kadar_DoUHaveHealer(C_Info)	//	"� ��� ���� ��������?"  //nr = 3
{
	npc = BAU_100_DS2P_KADAR;
	nr = 3;
	permanent = FALSE;
	condition = DIA_Kadar_DoUHaveHealer_condition;	
	information = DIA_Kadar_DoUHaveHealer_info;
	description = "� ��� ���� ��������?";
};
func int DIA_Kadar_DoUHaveHealer_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU)){	return TRUE;};	};
func void DIA_Kadar_DoUHaveHealer_info()
{
	AI_Output(other,self,"DIA_Kadar_DoUHaveHealer_15_00");	//� ��� ���� ��������?
	AI_Output(self,other,"DIA_Kadar_DoUHaveHealer_10_00");	//��, ��� ����� ����. ��� ��� ��������� ����������. ���� ���� ������ ��� �� ��������, �� ������ �������� ���� �� ����.
};
//
//	������ ���������� �����: ���������� "��� ��?"
//
instance DIA_Kadar_WhatDoUKnowAboutPirates(C_Info)	//	"��� �� ������ � �������?"  //nr = 4
{
	npc = BAU_100_DS2P_KADAR;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Kadar_WhatDoUKnowAboutPirates_condition;	
	information = DIA_Kadar_WhatDoUKnowAboutPirates_info;
	description = "��� �� ������ � �������?";
};
func int DIA_Kadar_WhatDoUKnowAboutPirates_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU)){	return TRUE;};	};
func void DIA_Kadar_WhatDoUKnowAboutPirates_info()
{
	AI_Output(other,self,"DIA_Kadar_WhatDoUKnowAboutPirates_15_00");	//��� �� ������ � �������?
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_00");	//������� � ��� ����, ���������� �������, ����� �����������, �� ������, ����� ���-�� ��� �������.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_01");	//� ���-�� ����� ���������� �� ����, ������ ������, ����� ��� ������� �� ������ ���� � ��������.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_02");	//��� ���� ���� �� ����� ���� ������ ���� ������ ����� �����, ������ ��� ����, ��� ���� � ���� ��� ������ ���� ������, �� ��� ������� ����!
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_03");	//��� �� ����, ��� �����!
	AI_Output(other,self,"DIA_Kadar_WhatDoUKnowAboutPirates_15_01");	//� ��� ����� � ��� ����? ������ �� ���� ��� ���������.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_04");	//� ��� � �����������, ��� ���� ���� ���� ������ �����. � ������� �����, ��� � �����, �� ������ ��������.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_05");	//� ��� ��������� ���� ��������� ����� �����. ��� �������, ��� ������ ���� ����� ������ ����������.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_06");	//�������, ��� � �����.	
};
//
//	������ ���������� �����: ����������� "��� �� ������ � �������?"
//
instance DIA_Kadar_WhatElseCanUTellAboutPirates(C_Info)		//	"��� �� ��� ������ ���������� � �������?"  //nr = 40
{
	npc = BAU_100_DS2P_KADAR;
	nr = 40;
	permanent = FALSE;
	condition = DIA_Kadar_WhatElseCanUTellAboutPirates_condition;	
	information = DIA_Kadar_WhatElseCanUTellAboutPirates_info;
	description = "��� �� ��� ������ ���������� � �������?";
};
func int DIA_Kadar_WhatElseCanUTellAboutPirates_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhatDoUKnowAboutPirates)){	return TRUE;};	};
func void DIA_Kadar_WhatElseCanUTellAboutPirates_info()
{
	AI_Output(other,self,"DIA_Kadar_WhatElseCanUTellAboutPirates_15_00");	//��� �� ��� ������ ���������� � �������?
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_00");	//��� �� �� ����� ������ ������� ����������, �� �� ���, � ��� � �������, ���� ������� ���� � ���� �������� � ��������. �� ����� ������!
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_01");	//����� ��������� ��������� �� �������, ���� ������� ����� ���������� ��������, � ����� ��� �����������, �������� ����� � ��������� ������.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_02");	//�� ��������� ����������� �� ����� �������� ��������� �����, � ���� ���� ����� ���������.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_03");	//��� �����, ��� ��� � ������ ��������.
	
	AI_Output(other,self,"DIA_Kadar_WhatElseCanUTellAboutPirates_15_01");	//���� ���������, ��� ������ ������ ���������. (�������)
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_04");	//���, ���� � ������ ����������.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_05");	//��������, ����, ����� ������� ������, ����� �������, ���� ���� ���� ��� ������.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_06");	//���� ��� �����, ������ ������������� ������, ��� ���, �����������. ���� �� ����, ��� �� ���������� ������� � ��� �����.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_07");	//��� ��������� ������ ������� �� ����. ��������� � ���� ���, ���� ���� ��� ��� ���������.
};
//
//	������ ���������� �����: ���������� "��� ��?" � ���� ����� � ������, ��� ����� ������� �����
//
instance DIA_Kadar_CanISellUTrophies(C_Info)	//	"� ���� ������� ���� ��������� ������?"  //nr = 5
{
	npc = BAU_100_DS2P_KADAR;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Kadar_CanISellUTrophies_condition;	
	information = DIA_Kadar_CanISellUTrophies_info;
	description = "� ���� ������� ���� ��������� ������?";
};
func int DIA_Kadar_CanISellUTrophies_condition(){	
	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU) && Npc_KnowsInfo(other,DIA_Tamir_WhatDoUDoWithSkins))
	{	return TRUE;};	
};
func void DIA_Kadar_CanISellUTrophies_info()
{
	AI_Output(other,self,"DIA_Kadar_CanISellUTrophies_15_00");	//� ���� ������� ���� ��������� ������?
	AI_Output(self,other,"DIA_Kadar_CanISellUTrophies_10_00");	//��. � ����� ���, ��� ���� ������� ������. ��� �������� ����� ������, ����� ����� ����������� �� �������.
	AI_Output(self,other,"DIA_Kadar_CanISellUTrophies_10_01");	//� ��� ���� ���� ���� ������ ������ �� ����� � �����, ��� ����� ������.
	B_DSG_Log_OpenClose(TOPIC_BauerTrader,LOG_NOTE,-1,"����� �������� ����� � ����� �� ����� ������� ����.");
};
//
//	������ ���������� �����: ���������� "��� ��?"
//
instance DIA_Kadar_WhatAUGoingToDo(C_Info)	//	"��� �� ����������� �����������?"  //nr = 6
{
	npc = BAU_100_DS2P_KADAR;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Kadar_WhatAUGoingToDo_condition;	
	information = DIA_Kadar_WhatAUGoingToDo_info;
	description = "��� �� ����������� �����������?";
};
func int DIA_Kadar_WhatAUGoingToDo_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU)){	return TRUE;};	};
func void DIA_Kadar_WhatAUGoingToDo_info()
{
	AI_Output(other,self,"DIA_Kadar_WhatAUGoingToDo_15_00");	//��� �� ����������� �����������?
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_00");	//� ��� ��� ����� �������? � ������� ����������� ��� ������, ���� ������� ��� ���������� ���������� �������.
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_01");	//���� ���� �� � ��������� ���-�� �����������, ��� ����� �� ����� ����� ���. � �� ���� ���������!
	AI_Output(other,self,"DIA_Kadar_WhatAUGoingToDo_15_01");	//�� ������ �� ������ ��� ������ � ������ �� ������?
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_02");	//��� ���� ������ ������, ����� ����� �����, � � �� ����� ��������� ����� ��������. �� �� �����, � ������� �������, � �� ����� ���������.
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_03");	//������� ��� �������� ��������� � ���� ��������� � ���������, ��� ����� �� ���������� �� ���.
	AI_Output(other,self,"DIA_Kadar_WhatAUGoingToDo_15_02");	//� ��� ���� �������?
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_04");	//����������� �� ��� ���������� � ����. ����� ��������� ��� �� ���������� � �������.
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_05");	//��������, ��� ������, ��� ���� �� ������� �����, ��� � ������� � �������. �� ���� �� �� ��� ������.
};
//
//	������ ���������� �����: ����������� "��� �� ����������� �����������?"
//
instance DIA_Kadar_CanIHelpU(C_Info)		//	"� ���� ���-������ ������?"  //nr = 60
{
	npc = BAU_100_DS2P_KADAR;
	nr = 60;
	permanent = FALSE;
	condition = DIA_Kadar_CanIHelpU_condition;	
	information = DIA_Kadar_CanIHelpU_info;
	description = "� ���� ���-������ ������?";
};
func int DIA_Kadar_CanIHelpU_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhatAUGoingToDo)){	return TRUE;};	};
func void DIA_Kadar_CanIHelpU_info()
{
	AI_Output(other,self,"DIA_Kadar_CanIHelpU_15_00");	//� ���� ���-������ ������?
	AI_Output(self,other,"DIA_Kadar_CanIHelpU_10_00");	//�����, ������.
	AI_Output(self,other,"DIA_Kadar_CanIHelpU_10_01");	//������� ����� �������, ����� ������� ������� � ������, ��� ��������� ���� �������.
	AI_Output(self,other,"DIA_Kadar_CanIHelpU_10_02");	//� ������, ��� ���� ����, ��� ��� ���� ������� ������� ������ �� ����� ������� � ������ ������� ��������.
};
//
//	������ ���������� �����: ����������� "��� �� ����������� �����������?"
//
instance DIA_Kadar_EverythingWillBeFine(C_Info)		//	"�� ������, ��� ����� ������!"  //nr = 61
{
	npc = BAU_100_DS2P_KADAR;
	nr = 61;
	permanent = true;
	condition = DIA_Kadar_EverythingWillBeFine_condition;	
	information = DIA_Kadar_EverythingWillBeFine_info;
	description = "�� ������, ��� ����� ������!";
};
func int DIA_Kadar_EverythingWillBeFine_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhatAUGoingToDo)){	return TRUE;};	};
func void DIA_Kadar_EverythingWillBeFine_info()
{
	AI_Output(other,self,"DIA_Kadar_EverythingWillBeFine_15_00");	//�� ������, ��� ����� ������!
	AI_Output(self,other,"DIA_Kadar_EverythingWillBeFine_10_00");	//(��������) ���-�� ��� �� ������� � ���.
};
//
//	������ ���������� �����: ����������� "��� �� ����������� �����������?"
//
instance DIA_Kadar_HowDidUBecomePrefect(C_Info)		//	"��� �� ���� ���������?"  //nr = 62
{
	npc = BAU_100_DS2P_KADAR;
	nr = 62;
	permanent = false;
	condition = DIA_Kadar_HowDidUBecomePrefect_condition;	
	information = DIA_Kadar_HowDidUBecomePrefect_info;
	description = "��� �� ���� ���������?";
};
func int DIA_Kadar_HowDidUBecomePrefect_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhatAUGoingToDo)){	return TRUE;};	};
func void DIA_Kadar_HowDidUBecomePrefect_info()
{
	AI_Output(other,self,"DIA_Kadar_HowDidUBecomePrefect_15_00");	//��� �� ���� ���������?
	AI_Output(self,other,"DIA_Kadar_HowDidUBecomePrefect_10_00");	//��� � ������ ��� ��� ������� ���������� � ������, ����� ������� ������ �� ���, �������� ���������� ������� � ������������, ����� ��������� ��������, ������ ��������, ��������� �����.
	AI_Output(self,other,"DIA_Kadar_HowDidUBecomePrefect_10_01");	//������ ������� ���������� ���� �����������, ����� ���� �������� �����������.
	AI_Output(self,other,"DIA_Kadar_HowDidUBecomePrefect_10_02");	//����������� � ������� ������� ����, � �� ��������� ������� ��� ���� ������ � ��� ���� �������� ����� �������.
};
//
//	������ ���������� �����: ���������� "��� ��?" � ���� ���� ����� ����� ������� (���� ��� �� ������� ���������� � �����)
//
instance DIA_Kadar_WhereCanIFindGaron(C_Info)	//	"�� �� ������, ��� � ���� ����� ������?"  //nr = 7
{
	npc = BAU_100_DS2P_KADAR;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Kadar_WhereCanIFindGaron_condition;	
	information = DIA_Kadar_WhereCanIFindGaron_info;
	description = "�� �� ������, ��� � ���� ����� ������?";
};
func int DIA_Kadar_WhereCanIFindGaron_condition(){	
	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU) && (MIS_DS2P_GrandsonOfFisherman == LOG_Running) && !Npc_KnowsInfo(other,DIA_Maria_AboutGaron))
	{	return TRUE;};	
};
func void DIA_Kadar_WhereCanIFindGaron_info()
{
	AI_Output(other,self,"DIA_Kadar_WhereCanIFindGaron_15_00");	//�� �� ������, ��� � ���� ����� ������?
	AI_Output(self,other,"DIA_Kadar_WhereCanIFindGaron_10_00");	//� �����, ��� ������ ������ ��� � ������. ������ � ��� �� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_KardarSeen);
};
//
//	������ ���������� �����: ���������� "��� ��?" � ���� ��� �� ��������� ��� ����� � ������
//
instance DIA_Kadar_INeedMapOfIsland(C_Info)	//	"��� ����� ����� �������."  //nr = 8
{
	npc = BAU_100_DS2P_KADAR;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Kadar_INeedMapOfIsland_condition;	
	information = DIA_Kadar_INeedMapOfIsland_info;
	description = "��� ����� ����� �������.";
};
func int DIA_Kadar_INeedMapOfIsland_condition(){	
	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU) && !Npc_KnowsInfo(other,DIA_Tamir_DoUHaveMapOfIsland))
	{	return TRUE;};	
};
func void DIA_Kadar_INeedMapOfIsland_info()
{
	AI_Output(other,self,"DIA_Kadar_INeedMapOfIsland_15_00");	//��� ����� ����� �������. 
	AI_Output(self,other,"DIA_Kadar_INeedMapOfIsland_10_00");	//���, ����� �� ���� ������. � ����� ������� �������, ������� ����� ��� �� � ����. �������� ���������� � ������. �� �������, � ��������� ���� �������.
};


//NS - 27/06/2013 ===========
// �� ������ "��� ����� ��� ������?" 	nr=11
//===========================

instance DIA_Kadar_AboutStolenIron(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 11;
	condition = DIA_Kadar_AboutStolenIron_condition;	
	information = DIA_Kadar_AboutStolenIron_info;
	description = "� ������� ������� ���.";
};
func int DIA_Kadar_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Kadar_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Kadar_AboutStolenIron_15_00");	//� ������� ������� ���.
		AI_Output(self,other,"DIA_Kadar_AboutStolenIron_10_01");	//����� ��������� ������, ����� ������. � ������� �������� ��� �������������.
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 02/07/2013 ===========
// �������� � ������ ����	(+����) 	nr=21
//===========================
instance DIA_Kadar_KaraDead(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 21;
	condition = DIA_Kadar_KaraDead_condition;	
	information = DIA_Kadar_KaraDead_info;
	description = "� ���� ��� ���� ��������� �����.";
};
func int DIA_Kadar_KaraDead_condition()
{
	if (Npc_IsDead(Kara) && Npc_KnowsInfo(other,DIA_Viola_Start))
	{	return TRUE;	};
};
func void DIA_Kadar_KaraDead_info()
{
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_00");	//� ���� ��� ���� ��������� �����.
	//(+����)
	B_GivePlayerXP(XP_News_KaraDead);
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_01");	//��� ���������?
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_02");	//� ��� � ������, ��� ������ ����� ������...
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_03");	//�?
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_04");	//����, ���� ����... ��� ������.
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_05");	//(��������) ���?
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_06");	//��� ����� ����.
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_07");	//(���������� �������)
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_08");	//� ����� ���������� ������, ��, ���, �� �����.
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_09");	//(������)

	//�������� �����
	if (Npc_GetDistToNpc(Maria, other) < PERC_DIST_DIALOG)
	{
		AI_Teleport(Maria,Npc_GetNearestWP(other));
	};
	AI_GotoNpc(Maria,other);
	AI_TurnToNpc(other,Maria);
	AI_StopProcessInfos(self);
	//������ � �����
	
	Kadar_KnowsKaraDead_Day = Wld_GetDay();
	B_StartOtherRoutine(self, "SITHOME");
};

instance DIA_Kadar_AfterKaraDead(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 0;
	condition = DIA_Kadar_AfterKaraDead_condition;	
	information = DIA_Kadar_AfterKaraDead_info;
	important = TRUE;
};
func int DIA_Kadar_AfterKaraDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Kadar_KaraDead) && (Npc_IsInState(self, ZS_Talk)))
	{	return TRUE;	};
};
func void DIA_Kadar_AfterKaraDead_info()
{
	AI_Output(other,self,"DIA_Kadar_AfterKaraDead_15_00");	//��� ��?
		AI_Output(self,other,"DIA_Kadar_AfterKaraDead_10_01");	//(���������� ������� � ������)
	AI_StopProcessInfos(self);
};

// ������������ �� ��������� ����, ����� ���������� ������ "����� ��������� ���������"

instance DIA_Kadar_AfterEscapedHunters(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 1;
	condition = DIA_Kadar_AfterEscapedHunters_condition;	
	information = DIA_Kadar_AfterEscapedHunters_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Kadar_AfterEscapedHunters_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == LOG_SUCCESS) && (EscapedHunters_QuestComplete - Wld_GetDay()) >= 1)
	{	
		return TRUE;	
	};
};

func void DIA_Kadar_AfterEscapedHunters_info()
{
	AI_Output(self,other,"DIA_Kadar_AfterEscapedHunters_10_00");	//��� ������?
	AI_Output(other,self,"DIA_Kadar_AfterEscapedHunters_15_01");	//��� ������?
	AI_Output(self,other,"DIA_Kadar_AfterEscapedHunters_10_02");	//��, ��� �������� ������.
	AI_Output(other,self,"DIA_Kadar_AfterEscapedHunters_15_03");	//���, ������ ��������� �� ���.
	AI_Output(self,other,"DIA_Kadar_AfterEscapedHunters_10_04");	//��������� ������! ���� ��������� �� ����� � ������ �� ����! ���� �� � ����� �������� ������ �����!
	AI_StopProcessInfos(self);
};

