instance DIA_Nikki_EXIT(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Nikki_EXIT_condition;	
	information = DIA_Nikki_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Nikki_EXIT_condition(){	return TRUE;};
func void DIA_Nikki_EXIT_info(){	AI_StopProcessInfos(self);};
//
//	��������� ������
//
instance DIA_Nikki_Start(C_Info)	//��������� ������ "���, ���� ������ ���������� ��� ���������� ��������?"  //nr = 1
{
	npc = BAU_107_DS2P_Nikki;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Nikki_Start_condition;	
	information = DIA_Nikki_Start_info;
	important = TRUE;
};
func int DIA_Nikki_Start_condition(){	return TRUE;};
func void DIA_Nikki_Start_info()
{
	AI_Output(self,other,"DIA_Nikki_Start_17_00");	//���, ���� ������ ���������� ��� ���������� ��������?
	AI_Output(self,other,"DIA_Nikki_Start_17_01");	//�����! ��� �� ������ ����������, ������ ��������� ������ �� ����� � ��������������� ���� ���������.
	AI_Output(self,other,"DIA_Nikki_Start_17_02");	//� ��, ��� � ������� � ��������� � ��� ������ �� �������!
	
	AI_Output(other,self,"DIA_Nikki_Start_15_00");	//� ��� �� ��������? � �� ������ ���� ������ �������!
	
	AI_Output(self,other,"DIA_Nikki_Start_17_03");	//��, �������! ���� ���� ��� �������. � ����� ����� ����������!
	AI_Output(self,other,"DIA_Nikki_Start_17_04");	//��� ��� ������ ���� � ����� �������? �� ������?
	AI_Output(self,other,"DIA_Nikki_Start_17_05");	//�������, ���� �� ����� ��, ��� ��! ��� �� � ������� � ������� ������ ����� ������.
	AI_Output(self,other,"DIA_Nikki_Start_17_06");	//�� �������, �������� ������� �������, ������ �� �� ���������������?!
	
	AI_Output(other,self,"DIA_Nikki_Start_15_01");	//�� ������ ������ ���������, ��� ���������?
	
	AI_Output(self,other,"DIA_Nikki_Start_17_07");	//� ��� ��� ���������?
	AI_Output(self,other,"DIA_Nikki_Start_17_08");	//� ������ ��� ����� � ���, �������, ������� �������� ������ ���������� �� �������.
	AI_Output(self,other,"DIA_Nikki_Start_17_09");	//�� ������ ���� �����, � ���� ������� ������� �� ������ ������ �����������������, ������� � ��� ������ ������ ������ ������ ��������� ���� �����.
	AI_Output(self,other,"DIA_Nikki_Start_17_10");	//����� � ������ � ������ � �������� ��������, ���� ������� ���� � ������� � ���.
	AI_Output(self,other,"DIA_Nikki_Start_17_11");	//� �������, ����������, �� ��� ���� ��� �����. �����... �����...
	AI_PlayAni(self,"T_CRY");
	AI_Output(self,other,"DIA_Nikki_Start_17_12");	//����� �� ������ �� ���� ���...
	AI_PlayAni(self,"T_CRY");
	AI_Output(self,other,"DIA_Nikki_Start_17_13");	//��� � ������ �� ����� � ���������, � ������ ���� ������� �� ������� �����, � � �������� ������ �����...
	AI_PlayAni(self,"T_CRY");
	
	AI_Output(other,self,"DIA_Nikki_Start_15_02");	//���������, ����������!
	AI_PlayAni(self,"T_CRY");
};
//
//	������ ���������� �����: ����������
//
instance DIA_Nikki_IWillPunishJorn(C_Info)	//	"� ������ �����."  //nr = 3
{
	npc = BAU_107_DS2P_Nikki;
	nr = 3;
	permanent = FALSE;
	condition = DIA_Nikki_DoUHaveHealer_condition;	
	information = DIA_Nikki_DoUHaveHealer_info;
	description = "� ������ �����.";
};
func int DIA_Nikki_DoUHaveHealer_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_DoUHaveHealer_info()
{
	AI_Output(other,self,"DIA_Nikki_DoUHaveHealer_15_00");	//� ������ �����.
	AI_Output(self,other,"DIA_Nikki_DoUHaveHealer_17_00");	//�� ������ ��� ��������? ������?!
	AI_Output(self,other,"DIA_Nikki_DoUHaveHealer_17_01");	//� �� ��������� ����� ������, �� ����������� �� ��� ���� � ���, � ����, ����� � ����� ��� ��������� � ���������� � ���� ��� ������ �������.
	AI_Output(self,other,"DIA_Nikki_DoUHaveHealer_17_02");	//������� � ���� �������� ������� ������ �� ����! �����, ������, ���� ��� ������!
	
	AI_Output(other,self,"DIA_Nikki_DoUHaveHealer_15_01");	//� ������ ���, ��� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_Running,TOPIC_DS2P_BrokenHeart_Start);
};
//
//	������ ���������� �����: ����������
//
instance DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn(C_Info)	//	"��� ��������� ������, ������� �������� ���� � ���?"  //nr = 4
{
	npc = BAU_107_DS2P_Nikki;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_condition;	
	information = DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_info;
	description = "��� ��������� ������, ������� �������� ���� � ���?";
};
func int DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_info()
{
	AI_Output(other,self,"DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_15_00");	//��� ��������� ������, ������� �������� ���� � ���?
	AI_Output(self,other,"DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_17_00");	//��� ������ ��������. ��� ��������� /*���-�� � ���-��*/. !!!���� ���������
};
//
//	������ ���������� �����: ����������
//
instance DIA_Nikki_HowDoUFeel(C_Info)	//	"��� �� ���� ����������? (����������)"  //nr = 5
{
	npc = BAU_107_DS2P_Nikki;
	nr = 5;
	permanent = TRUE;
	condition = DIA_Nikki_HowDoUFeel_condition;	
	information = DIA_Nikki_HowDoUFeel_info;
	description = "��� �� ���� ����������?";
};
func int DIA_Nikki_HowDoUFeel_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_HowDoUFeel_info()
{
	AI_Output(other,self,"DIA_Nikki_HowDoUFeel_15_00");	//��� �� ���� ����������?
	AI_Output(self,other,"DIA_Nikki_HowDoUFeel_17_00");	//� ��� ����� ���� ����������� �������, ������� ������ �����?!
};
//
//	������ ���������� �����: ����������
//
instance DIA_Nikki_WhatDoUKnowAboutPirates(C_Info)	//	"��� �� ������ � �������?"  //nr = 6
{
	npc = BAU_107_DS2P_Nikki;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Nikki_WhatDoUKnowAboutPirates_condition;	
	information = DIA_Nikki_WhatDoUKnowAboutPirates_info;
	description = "��� �� ������ � �������?";
};
func int DIA_Nikki_WhatDoUKnowAboutPirates_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_WhatDoUKnowAboutPirates_info()
{
	AI_Output(other,self,"DIA_Nikki_WhatDoUKnowAboutPirates_15_00");	//��� �� ������ � �������?
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_00");	//� �������, ��� ������� � ��� ���� � ��� ����, ��� ���... ����.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_01");	//��� ��������� �������� ��� ������� ������.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_02");	//��� ���� ������� ���, ������ �� ������� �������� �� ��������!
	
	AI_Output(other,self,"DIA_Nikki_WhatDoUKnowAboutPirates_15_01");	//������?
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_03");	//��� �� �����, ����� ���-�� ��� � ��� ����������.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_04");	//� ������, ��� ��� ������� ������� � ������� ������ �� �������, ����� ��� �������� ��� ������� � ����� � ��� ���������� � �������� �� ��������.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_05");	//�, �������, �� �������, �� ���� ������������, ��� ���� ����� ���� �������� �������. ��� �� �� ��������!
	
	AI_Output(other,self,"DIA_Nikki_WhatDoUKnowAboutPirates_15_02");	//��� ���, ��� �� ������?
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_06");	//� �� ����� �� �����, �� ��� ���������� �� �������� �������� �������. �� � ��������� � ����� �������.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_07");	//� ���� ��� �� �������� �����, � ��������� ������� ����� ������ ����� ��� � ���.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_08");	//�����, ��� �� ������ �� ����� �������� �� �����, ����� ����-������ ������� � ������ �������.
};
//
//	������ ���������� �����: ����������� "��� �� ������ � �������?" � ���� ������� � ������� ("�������� ��� � ���, ��� ����� � �������")
//
instance DIA_Nikki_TamirSaidThatUHaveBadTemper(C_Info)	//	"����� �������, ��� � ���� �������� ��������."  //nr = 60
{
	npc = BAU_107_DS2P_Nikki;
	nr = 60;
	permanent = FALSE;
	condition = DIA_Nikki_TamirSaidThatUHaveBadTemper_condition;	
	information = DIA_Nikki_TamirSaidThatUHaveBadTemper_info;
	description = "����� �������, ��� � ���� �������� ��������.";
};
func int DIA_Nikki_TamirSaidThatUHaveBadTemper_condition(){	
	if(Npc_KnowsInfo(other,DIA_Nikki_WhatDoUKnowAboutPirates) && Npc_KnowsInfo(other,DIA_Tamir_TellMeAboutPeasants))
	{	return TRUE;};	
};
func void DIA_Nikki_TamirSaidThatUHaveBadTemper_info()
{
	AI_Output(other,self,"DIA_Nikki_TamirSaidThatUHaveBadTemper_15_00");	//����� �������, ��� � ���� �������� ��������. �� � ���� ������ ������. �� ����� ����� �������.
	AI_Output(self,other,"DIA_Nikki_TamirSaidThatUHaveBadTemper_17_00");	//�������, �� ���� ����� �������. � �� ������ � ������ ������� � �� �������!
	AI_Output(self,other,"DIA_Nikki_TamirSaidThatUHaveBadTemper_17_01");	//�� ������ ����� ��� �� ���� �� ��, ��� � ��� ��������, ����� �� �������� � ������������ �� ��� ��������.
	AI_Output(self,other,"DIA_Nikki_TamirSaidThatUHaveBadTemper_17_02");	//��, �������, ������� �������, �� ��� �� �� ����� �� ���� ��������, ���� ������?!
};
//
//	������ ���������� �����: ����������
//
instance DIA_Nikki_INeedHealer(C_Info)	//	"��� ����� ��������."  //nr = 7
{
	npc = BAU_107_DS2P_Nikki;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Nikki_INeedHealer_condition;	
	information = DIA_Nikki_INeedHealer_info;
	description = "��� ����� ��������.";
};
func int DIA_Nikki_INeedHealer_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_INeedHealer_info()
{
	AI_Output(other,self,"DIA_Nikki_INeedHealer_15_00");	//��� ����� ��������.
	AI_Output(self,other,"DIA_Nikki_INeedHealer_17_00");	//���� ����� ���� � ����� � �� ��� ������� � �����������. ��� ��� ��������� �����, � �������.
};
//
//	������ ���������� �����: ������ ����� ������ ����� � ������� � �������.
//
instance DIA_Nikki_KoloHasReturned(C_Info)	//	"�����, �� ������ ���!"  //nr = 8
{
	npc = BAU_107_DS2P_Nikki;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Nikki_KoloHasReturned_condition;	
	information = DIA_Nikki_KoloHasReturned_info;
	description = "�����, �� ������ ���!";
};
func int DIA_Nikki_KoloHasReturned_condition(){	if(DIA_Tamir_WithRegardToNikki_CHOICE == NIKKI_IS_BAD_WOMAN){	return TRUE;};	};
func void DIA_Nikki_KoloHasReturned_info()
{
	var c_npc Nikki;    Nikki = Hlp_GetNpc(BAU_107_DS2P_Nikki); // Ihm gehort der Dialog
   var c_npc Tamir;   Tamir = Hlp_GetNpc(BAU_105_DS2P_Tamir);

	TRIA_Invite(Tamir);   //�������� ������ � �������.
   TRIA_Start();         //�������� �������
	// ������ � ����� ���������� � ������� �� ����, ������ "������� ���"
	// ����� �������� �������� � ����� (self = Nikki, other = Hero)
   TRIA_Next(Nikki);
   DIAG_Reset();
	
	AI_Output(other,self,"DIA_Nikki_KoloHasReturned_15_00");	//�����, �� ������ ���!
	DIAG("DONTKNOW", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_00");	//(�����������) ����?
	AI_Output(other,self,"DIA_Nikki_KoloHasReturned_15_01");	//�� ��� ��, ����! �� �������� � ���� ����. ������, ����, �������� ������ ��������.
	DIAG("IGETYOU", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_01");	//(������) �� ���, ������ �������?! ���� �����!
	
	// ������ (self = Tamir, other = Hero)
   TRIA_Next(Tamir);
	AI_TurnToNpc(self,Nikki);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_12_00");	//�� ��� ��. �� ������� ������, � ���� ����� ����. �� ��� � ������!
	
	// ������ (self = Nikki, other = Hero)
   TRIA_Next(Nikki);
	AI_TurnToNpc(self,Tamir);
	DIAG("IGETYOU", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_02");	//(����) �� ���, ���� �� ���� �������? � ���� ������ ��� ����... (���������)
	
	TRIA_Next(Tamir);
	AI_TurnToNpc(self,Nikki);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_12_01");	//��� �� ����� ������ ��� ����, ���� �� ������ � ����?
	
	TRIA_Next(Nikki);
	DIAG("DONTKNOW", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_03");	//�� �...
	
	TRIA_Next(Tamir);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_12_02");	//��� �� ����� ���! � ��� � ����!
	
	TRIA_Next(Nikki);
	DIAG("NO", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_04");	//���, ���... �� ��� �������!
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_05");	//�� �� ������ ����, ��������� ��� ���� ��� ���� �������! ������ �� �������, ������ ���� � ��� ��� �����...
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_06");	//����... �� �����, � ������!
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_07");	//�� ���� ������ �����, � ������ ���� ��� ���������!
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_08");	//������ ����, ��� �� � �������� ����! �� ���� ����� ������ ��������� ���� �������!
	
	TRIA_Next(Tamir);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_12_03");	//������ �� �������� �� ���� ������������ ����� ������� �������.
	
	TRIA_Next(Nikki);
	DIAG("T_FORGETIT", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_09");	//����� �������? �� ���, ��������� ����� �������?
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_10");	//��� �������� ������, ������ ��� ����� �������! � �� ����, �� ���� �� �� ��� ������ ��� ������.
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_11");	//���, ���� �����, �� �������� � ������� � ��������� �� �������� ����� �������, �?! (������ �������)
	
	DIAG("T_COMEOVERHERE", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_12");	//�������� �� ����� ����!
	
	DIAG_Reset();
	TRIA_Finish();
	AI_StopProcessInfos(self);
};
//
//	������ ���������� �����: ����������� �������� "�����, �� ������ ���!"
//
instance DIA_Nikki_IWasOnHighOpinionOfU(C_Info)	//	"� ���� � ���� ����� ������ ������."  //nr = 1
{
	npc = BAU_107_DS2P_Nikki;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Nikki_IWasOnHighOpinionOfU_condition;	
	information = DIA_Nikki_IWasOnHighOpinionOfU_info;
	important = true;
};
func int DIA_Nikki_IWasOnHighOpinionOfU_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_KoloHasReturned)){	return TRUE;};	};
func void DIA_Nikki_IWasOnHighOpinionOfU_info()
{
	AI_Output(self,other,"DIA_Nikki_IWasOnHighOpinionOfU_17_00");	//� ���� � ���� ����� ������ ������. ��� �� ���� � ��� ����.
	AI_Output(self,other,"DIA_Nikki_IWasOnHighOpinionOfU_17_01");	//������� ������� ���� �� ������! � �� ���� ��, ����� � � ������, ������, ��� �������� ������. (������ �������)
	AI_StopProcessInfos(self);
};
//
//	������ ���������� �����: ���� ������� ����� "�� �� ������!" � ���� ����� "�������� ������"
//
const string cDIA_Nikki_UreLyingAboutJorn_Lie	= "� �� ���� ����!";
const string cDIA_Nikki_UreLyingAboutJorn_TRUE	= "������, ��������, � ���� ��� �� �� �����������.";
instance DIA_Nikki_UreLyingAboutJorn(C_Info)	//	"��� �������, ��� �� ����������� �� ���� �����."  //nr = 9
{
	npc = BAU_107_DS2P_Nikki;
	nr = 9;
	permanent = FALSE;
	condition = DIA_Nikki_UreLyingAboutJorn_condition;	
	information = DIA_Nikki_UreLyingAboutJorn_info;
	description = "��� �������, ��� �� ����������� �� ���� �����.";
};
func int DIA_Nikki_UreLyingAboutJorn_condition(){	
	if((MIS_DS2P_BrokenHeart == LOG_Running) && (MIS_DS2P_YouAreWitch == LOG_SUCCESS) && (DIA_Tamir_WithRegardToNikki_CHOICE == NIKKI_IS_BAD_WOMAN))
	{return TRUE;};	
};
func void DIA_Nikki_UreLyingAboutJorn_info()
{
	AI_Output(other,self,"DIA_Nikki_UreLyingAboutJorn_15_00");	//��� �������, ��� �� ����������� ������ �����.
	AI_Output(other,self,"DIA_Nikki_UreLyingAboutJorn_15_01");	//����� ����, ��� � ���� � ����, ��� �������, ��� �� �����. ����� ����, �� ������ ������������ ��� ��� ����?
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_17_00");	//(������) ��, �������!
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_17_01");	//���� � ��� ����������, �� ������ �� ���� ����� �������� ���� �����?
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_17_02");	//� �� ������� ������ ������ ������, �� ���� ���� �������������� ����! � ������ ������!
	Info_ClearChoices(DIA_Nikki_UreLyingAboutJorn);
	Info_AddChoice(DIA_Nikki_UreLyingAboutJorn,	Dialog_Back,	DIA_Nikki_UreLyingAboutJorn_Back);
	Info_AddChoice(DIA_Nikki_UreLyingAboutJorn,	cDIA_Nikki_UreLyingAboutJorn_Lie,	DIA_Nikki_UreLyingAboutJorn_Lie);
	Info_AddChoice(DIA_Nikki_UreLyingAboutJorn,	cDIA_Nikki_UreLyingAboutJorn_TRUE,	DIA_Nikki_UreLyingAboutJorn_True);
};
func void DIA_Nikki_UreLyingAboutJorn_Back(){	Info_ClearChoices(DIA_Nikki_UreLyingAboutJorn);};
func void DIA_Nikki_UreLyingAboutJorn_Lie()
{
	AI_Output(other,self,"DIA_Nikki_UreLyingAboutJorn_Lie_15_00");	//� �� ���� ����!
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_Lie_17_01");	//(������) �� ��� �������, ��� �� �������! �� ����� �� �������, ��� � ��� ���������.
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_Lie_17_02");	//�� ���� ���� ����� �������, �� ���� ���� �� ���� ����� �� ����� �����! ���� �� �������!
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_Lie_17_03");	//�� ����� �� ����� ����� ����� � ����, � ������! ��� �� � ��������! ��������!
	AI_StopProcessInfos(self);
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_BrokenHeart_Success2);
	BAD_SUCCESS_MIS_DS2P_BrokenHeart = TRUE;
};
func void DIA_Nikki_UreLyingAboutJorn_True()
{
	AI_Output(other,self,"DIA_Nikki_UreLyingAboutJorn_True_15_00");	//������, ��������, � ���� ��� �� �� �����������.
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_True_17_00");	//�����, ��� �� �� ����� ��� ���! �� ���������, ������� ������� � ������� �� ������� �������� �������, ����� � ��� ����!
	Info_ClearChoices(DIA_Nikki_UreLyingAboutJorn);
};
//
//	������ ���������� �����: ���� ������� ����� "�������� ������" ��� ������ � ���������� �������: "� �� ���� ����!"
//
instance DIA_Nikki_GetOutBastard(C_Info)	//	"�������� �����, �������!"  //nr = 90
{
	npc = BAU_107_DS2P_Nikki;
	nr = 9;
	permanent = FALSE;	//Redleha: ��� TRUE
	condition = DIA_Nikki_GetOutBastard_condition;	
	information = DIA_Nikki_GetOutBastard_info;
	important = true;
};
func int DIA_Nikki_GetOutBastard_condition(){
	if((BAD_SUCCESS_MIS_DS2P_BrokenHeart == TRUE) && Npc_IsInState(self,ZS_Talk))
	{return TRUE;};	
};
func void DIA_Nikki_GetOutBastard_info()
{
	AI_Output(self,other,"DIA_Nikki_GetOutBastard_17_00");	//�������� �����, �������!
	AI_StopProcessInfos(self);
};

//NS - 14/06/2013 ===========
//  �������� � ������ �����, ���� ���� �����
//===========================
instance DIA_Nikki_JornDead(C_Info)	//	"� ���� �����."  //nr = 0
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Nikki_JornDead_condition;	
	information = DIA_Nikki_JornDead_info;
	description = "� ���� �����.";
};
func int DIA_Nikki_JornDead_condition()
{	
	if ((MIS_DS2P_BrokenHeart == LOG_Running) && Npc_IsDead(PIR_210_DS2P_Jorn))
	{	return TRUE;};	
};
func void DIA_Nikki_JornDead_info()
{
	var int x;
	AI_Output(other,self,"DIA_Nikki_JornDead_15_00");	//� ���� �����.
	B_GivePlayerXP(XP_MIS_BrokenHeart);
		AI_Output(self,other,"DIA_Nikki_JornDead_17_00");	//������� ����! ������ ��� ����� �������������. ������ �� ���� ��� �������� �������.
	//���� 300 �������
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ItMi_Gold,300);
	};
	//������ � �������� "�������� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_BrokenHeart_Success);
};

//NS - 14/06/2013 ===========
//  �����, ��� ����� ���� ������ �����
//===========================
instance DIA_Nikki_TalkedToJorn(C_Info)	//	"� ��������� � ������."  //nr = 0
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Nikki_TalkedToJorn_condition;	
	information = DIA_Nikki_TalkedToJorn_info;
	description = "� ������ �����.";
};
func int DIA_Nikki_TalkedToJorn_condition()
{	
	if ((MIS_DS2P_BrokenHeart == LOG_Running) && Npc_KnowsInfo(other,DIA_Jorn_NikkiWantsMeToKillU))
	{	return TRUE;};	
};
func void DIA_Nikki_TalkedToJorn_info()
{
	AI_Output(other,self,"DIA_Nikki_TalkedToJorn_15_00");	//� ��������� � ������.
	AI_Output(other,self,"DIA_Nikki_TalkedToJorn_15_01");	//�� ����������, ��� �� ���� ���������� ���� ����.
		AI_Output(self,other,"DIA_Nikki_TalkedToJorn_17_02");	//���? �� ��� �� ������ ����� ��������, �����?! �� ���� ������? ��� ��� ����� ���������� ������?
		AI_Output(self,other,"DIA_Nikki_TalkedToJorn_17_03");	//���� ����, ��� �� �������������� ���� ���������, ��� ������ ��� � ������������ �� ������ �������! ��� �����������!
	AI_Output(other,self,"DIA_Nikki_TalkedToJorn_15_04");	//(��� ����) ���� ����� ����, �� ����� �� ���� ���������� �����?
	AI_Output(other,self,"DIA_Nikki_TalkedToJorn_15_05");	//����� ����, ��� ����� ���������� � ������? ����� ��� ��������.

	//������ � �������� "�������� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_Running,TOPIC_DS2P_BrokenHeart_NikkiRefuse);
};


//NS - 27/06/2013 ================================================
// �� ������ "��� ����� ��� ������?" 	nr=101
//================================================================

instance DIA_Nikki_AboutStolenIron(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 101;
	condition = DIA_Nikki_AboutStolenIron_condition;	
	information = DIA_Nikki_AboutStolenIron_info;
	description = "���-�� ����� ��� ������ �� �������.";
};
func int DIA_Nikki_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Nikki_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Nikki_AboutStolenIron_15_00");	//���-�� ����� ��� ������ �� �������.
		AI_Output(self,other,"DIA_Nikki_AboutStolenIron_17_01");	//� �����, ��� ������ �������� � ������ ���� �����.
		AI_Output(self,other,"DIA_Nikki_AboutStolenIron_17_02");	//� ����� ����� ��� ��������� ���� �������� �������? ����� ��� �������� ��� ������ ������ � ���� ��� ��� ����������?!
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 27/06/2013 ================================================
// ����� ������� �������� (���� ����� �� ������)
//================================================================
instance DIA_Nikki_MillRepaired(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_MillRepaired_condition;	
	information = DIA_Nikki_MillRepaired_info;
	important = TRUE;
};
func int DIA_Nikki_MillRepaired_condition()
{
	if ((Joseph_RepairMill_Done == TRUE) && (BAD_SUCCESS_MIS_DS2P_BrokenHeart == FALSE))	{	return TRUE;	};
};
func void DIA_Nikki_MillRepaired_info()
{
		AI_Output(self,other,"DIA_Nikki_MillRepaired_17_00");	//������� ����. � �������, ��� �� ����� �������� ��������.
	AI_StopProcessInfos(self);
};


//NS - 02/07/2013 ================================================
// ����� ������ ������ (���� ����� �� ������)
//================================================================
instance DIA_Nikki_KadarDead(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_KadarDead_condition;	
	information = DIA_Nikki_KadarDead_info;
	important = TRUE;
};
func int DIA_Nikki_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk)
		&& (BAD_SUCCESS_MIS_DS2P_BrokenHeart == FALSE))
	{	return TRUE;	};
};
func void DIA_Nikki_KadarDead_info()
{
		AI_Output(self,other,"DIA_Nikki_KadarDead_17_00");	//� ������, ��� ����� � ���� �������.
		AI_Output(self,other,"DIA_Nikki_KadarDead_17_01");	//����� ��� ���� � �� ������ ��������� ������, �� ��� ����� �� ����.
	AI_StopProcessInfos(self);
};


//NS - 03/07/2013 ================================================
// �� ������ "�������� �����" (���� ����� �� ������)
//================================================================
// ��������� ����� ������, ���� ����� ��� �� �����
instance DIA_Nikki_CanUSewClothes(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_CanUSewClothes_condition;	
	information = DIA_Nikki_CanUSewClothes_info;
	description = "�� ������ ���� ������?";
};
func int DIA_Nikki_CanUSewClothes_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_GotForgeBellows) && (Maria_MadeClothes == FALSE)
		&& (BAD_SUCCESS_MIS_DS2P_BrokenHeart == FALSE))
	{	return TRUE;	};
};
func void DIA_Nikki_CanUSewClothes_info()
{
	AI_Output(other,self,"DIA_Nikki_CanUSewClothes_15_00");	//�� ������ ���� ������?
		AI_Output(self,other,"DIA_Nikki_CanUSewClothes_17_01");	//� ����� ���� ����.
	AI_Output(other,self,"DIA_Nikki_CanUSewClothes_15_02");	//������� ������� ��� ���� ��� �������?
		AI_Output(self,other,"DIA_Nikki_CanUSewClothes_17_03");	//��� ��� � ����� �����? � ���, ���� ���� ��� �������, ����� ��� ���� ������� ������? 
	AI_Output(other,self,"DIA_Nikki_CanUSewClothes_15_04");	//��� �� ��� ����, � ��� ����.
		AI_Output(self,other,"DIA_Nikki_CanUSewClothes_17_05");	//��� �����. �������� ������ ���� � �� ���� � ����� �� ����.
};

//"��� ����� ������." - ������������, ���� ���� ����� "������."
// nr = 1

instance DIA_Nikki_Dress4Sue(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_Dress4Sue_condition;	
	information = DIA_Nikki_Dress4Sue_info;
	description = "��� ����� ������.";
	permanent = FALSE;
};

func int DIA_Nikki_Dress4Sue_condition()
{
	if (MIS_DS2P_Dress4Sue == Log_Running)
	{	
		return TRUE;	
	};
};

func void DIA_Nikki_Dress4Sue_info()
{
	AI_Output(other,self,"DIA_Nikki_Dress4Sue_15_00");	//��� ����� ������.
	AI_Output(self,other,"DIA_Nikki_Dress4Sue_17_01");	//���� �� ���� ����������, ����� ��� ����. � ���� 500 �������. � �� ������� ������.
	Nikki_KnowAboutDress = TRUE;
};

//"���, ����� ������." - ������������, ���� ���� ����� "������.", � ����� ������ ������� ������ ��
// nr = 1

instance DIA_Nikki_SellDress(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_SellDress_condition;	
	information = DIA_Nikki_SellDress_info;
	description = "��� ����� ������.";
	permanent = FALSE;
};

func int DIA_Nikki_SellDress_condition()
{
	if ((MIS_DS2P_Dress4Sue == Log_Running) && Nikki_KnowAboutDress)
	{	
		return TRUE;	
	};
};

func void DIA_Nikki_SellDress_info()
{
	AI_Output(other,self,"DIA_Nikki_SellDress_15_00");	//���, ����� ������.
	if (Npc_HasItems(other,ItMI_Gold) >= 500) // ���� � �� ���� 500 ������
	{
		AI_Output(self,other,"DIA_Nikki_SellDress_17_01");	//������, ��� ������.
		CreateInvItems(self,0,1); // UNFINISHED - ���� �������� ��� ������
		B_GiveInvItems(self,other,0,1); // UNFINISHED - ���� �������� ��� ������
		B_GiveInvItems(other,self,ItMi_Gold,500); // ������ 500 ������� �����
		Nikki_KnowAboutDress = FALSE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,LOG_Running,TOPIC_DS2P_Dress4Sue_InProgress_02);
	}
	else
	{
		AI_Output(self,other,"DIA_Nikki_SellDress_17_02");	//������� �����, ���������, ����� �������.
	};
};