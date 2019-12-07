
instance DIA_Joseph_EXIT(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Joseph_EXIT_condition;	
	information = DIA_Joseph_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Joseph_EXIT_condition(){	return TRUE;};
func void DIA_Joseph_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 24/06/2013 ===========
//  ��������� 
//===========================
instance DIA_Joseph_Start(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 0;
	condition = DIA_Joseph_Start_condition;	
	information = DIA_Joseph_Start_info;
	important = TRUE;
};
func int DIA_Joseph_Start_condition(){	return TRUE;};
func void DIA_Joseph_Start_info()
{
		AI_Output(self,other,"DIA_Joseph_Start_13_00");	//� ��-�� ����! ����� ���������!
	AI_Output(other,self,"DIA_Joseph_Start_15_01");	//���?
		AI_Output(self,other,"DIA_Joseph_Start_13_02");	//����� ���������, ������! ������!
	//UNFINISHED �� ��������������
	AI_TurnRight(hero);
	AI_Wait(self, 1.5);
		AI_Output(self,other,"DIA_Joseph_Start_13_03");	//� ������ �����.
	AI_LookAtNpc(other,self);
	AI_Output(other,self,"DIA_Joseph_Start_15_04");	//���� �� �������?..
	AI_StopLookAt(other);
		AI_Output(self,other,"DIA_Joseph_Start_13_05");	//(����������) ������ ��� � ����� ��� � �����, � �� ������ ������� �� ������ ��������!
	//�� ��������������
	AI_TurnAway(other, self);
		AI_PlayAni(self, "R_SCRATCHHEAD");
		AI_Output(self,other,"DIA_Joseph_Start_13_06");	//���� ��. �� ���! �����, ������. �� ��������� ��� ��?
	//�� �������������� �������
	AI_TurnToNpc(other, self);
	AI_Output(other,self,"DIA_Joseph_Start_15_07");	//� ������� ������ �� ������.
		AI_Output(self,other,"DIA_Joseph_Start_13_08");	//����� � ���� ��� � ������� ����?
	AI_Output(other,self,"DIA_Joseph_Start_15_09");	//����, ������������ ����� �� �����.
		AI_Output(self,other,"DIA_Joseph_Start_13_10");	//(�������� ����) �� ��� � ������, ��� � �������. ������, �� ����� �������� � ���� ��������� ����.
		AI_Output(self,other,"DIA_Joseph_Start_13_11");	//���� ��� ������ �� ����� �������. ������ ������� ��� ���������, ������ ���� �����!
	AI_Output(other,self,"DIA_Joseph_Start_15_12");	//� �� �� ����� ����� ��� �� ���������. �� ������� ����, � ������ �� ��� ����� �� ������, ���� ��, �������, �� �����������.
		AI_Output(self,other,"DIA_Joseph_Start_13_13");	//(� �������) �� ��� �� ����� ��������?!
		AI_Output(self,other,"DIA_Joseph_Start_13_14");	//������� ���� ���������� ������������� ��� ������� ��������, ����� ���-�� ������ ��� ������, ��� ������ � ������ ������!
		AI_Output(self,other,"DIA_Joseph_Start_13_15");	//������� ������ �� ������ ������� ���� ��������� ������!
};


//NS - 24/06/2013 ===========
//  ��� ���� �����?			nr = 1
//===========================
instance DIA_Joseph_WhatsYourName(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_WhatsYourName_condition;	
	information = DIA_Joseph_WhatsYourName_info;
	description = "��� ���� �����?";
};
func int DIA_Joseph_WhatsYourName_condition(){	return TRUE;};
func void DIA_Joseph_WhatsYourName_info()
{
	AI_Output(other,self,"DIA_Joseph_WhatsYourName_15_00");	//��� ���� �����?
		AI_Output(self,other,"DIA_Joseph_WhatsYourName_13_01");	//� ������ � ������. ����, ����� � ������ ������, ������ ���� � �������!
		AI_Output(self,other,"DIA_Joseph_WhatsYourName_13_02");	//����� ��������� ������� � ����� ������ ���. � ���, �� ������� ������ ���� ������?! �?!
};


//NS - 24/06/2013-27/06/2013 ========
//  �� ������ "��� ����� ��� ������?"
//===========================

//----------------------------
// "� ����� ����� �� �������?" ����� ����������		nr=2
instance DIA_Joseph_WhatThiefs(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 2;
	condition = DIA_Joseph_WhatThiefs_condition;	
	information = DIA_Joseph_WhatThiefs_info;
	description = "� ����� ����� �� �������?";
};
func int DIA_Joseph_WhatThiefs_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_WhatThiefs_info()
{
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_00");	//� ����� ����� �� �������?
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_01");	//(������) �����, �����... �� ���� ����������, ���������.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_02");	//���-�� �� ���� �������� ������ ��� ������ �������� ���� � �������� ���������. � ���, ������ �� ������ ���� ������, �?
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_03");	//��� ��� ���������?
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_04");	//�� ����� ������. ����� �� ��������� �������, � ����� �� ���������� � �����.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_05");	//�� �������� ������� �������� ������� ������ ����������. ������, �� �� ��������� �������� �������. (�������)
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_06");	//��� ���, � ��� ���������, ��������, ��� ��� ������ ������ ������ �� ���.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_07");	//��� ��� ��� ������ ����, ������, ��� ����� ������ ������ �� ������ �������������� �������� � ��������.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_08");	//����� ����� � ����� �����. ����� �������� ��� ���������� �� �����, � ����� �� ���� � ������, ��� �����-�� ����� ����� �� ����� � �������.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_09");	//��, � �������, ��� ��� ������ ������� �����������, ����� ����� �����, � �� ������ ����� ��������.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_10");	//� �� ���� ����������, ��� ���� ��� ������ ��� ������.
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_11");	//���� ������� ���������� ���?
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_12");	//�� ���� ���?! ���� �� ����. � ������� ������ ������.
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_13");	//�������. �� ��������, ��� �� ����� �� ����� � ����� ������.
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_14");	//��������, �� ��� ����� ��������, ����� ��� �� ���� ������ � ����� ��������?
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_15");	//(���������) ��... ���� ����������, ��� � �� ����� � ���� �����.

	//������ � �������� "��� ����� ��� ������?" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_Start);
};

//----------------------------
// "����� �� �������� �� ��������� � �����." ���� �������� ���������� ��������		nr=2
instance DIA_Joseph_NooneConfess(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 2;
	condition = DIA_Joseph_NooneConfess_condition;	
	information = DIA_Joseph_NooneConfess_info;
	description = "����� �� �������� �� ��������� � �����.";
};
func int DIA_Joseph_NooneConfess_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count > Bauers_AboutIron_Max))
	{	return TRUE;};
};
func void DIA_Joseph_NooneConfess_info()
{
	AI_Output(other,self,"DIA_Joseph_NooneConfess_15_00");	//����� �� �������� �� ��������� � �����.
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_01");	//��! ����� ���� ���� �� �����, �������, ����� �� ���������! 
	AI_Output(other,self,"DIA_Joseph_NooneConfess_15_02");	//� ��� ����� �� ������� ����?
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_03");	//� ��� ���������� �����, � ������ ��� � ������ ���� ������. ��� �� �� ������ ��� ������, ��������� ���������� ��� ��� ������ �� ������, ����� ����������� � �������, �������.
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_04");	//������-�� � ������� ����� ���� �������� ��� ����� ����� �� �����. ��� ���, ����� ��� ����, ��� �� ������ �� �������, ����� ������� ������. � �����, ��� ����� ��� ���������� ����.
	AI_Output(other,self,"DIA_Joseph_NooneConfess_15_05");	//� ���� ��� �� �������?
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_06");	//���� �� �������, �� � ������ �� ����� � �����. ����� �� ������ �������� ���. �� �����, ��� ������� ����� ������������ � ����� �����������.
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_07");	//������� ������� �� ������ � ��������� ���������, ����� ��� ��������! � �� ��� �� ��� �� �������, � ���� �����! ��� ��� ����� ����� ������, � �� ���. 

	//������ � �������� "��� ����� ��� ������?" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_JosephPlan);
};


//----------------------------
// ������� ������, ���� ���� 2 �����	(+����)		nr=2
instance DIA_Joseph_ReturnIron(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 2;
	condition = DIA_Joseph_ReturnIron_condition;	
	information = DIA_Joseph_ReturnIron_info;
	description = "� ����� �������� ����.";
};
func int DIA_Joseph_ReturnIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Npc_HasItems(other,ITMI_DS2P_IRONORE_NUGGET_BIG) >= 2))
	{	return TRUE;};
};
func void DIA_Joseph_ReturnIron_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_00");	//� ����� �������� ����.
	//(+����)
	B_GivePlayerXP(XP_MIS_WhoStoleMyIron);
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_01");	//����� �� ����!
	//������
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems(other,self,ITMI_DS2P_IRONORE_NUGGET_BIG,2);
	};
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_02");	//���, ����, ��� ������ �� ���! ��� ���� � ������� ���� ������!
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_03");	//��� ���, ��� � ���� �����. �����, ������ ���. 
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_04");	//(������) �����... ������� ���������, �������� �� �����! ����-�� ���� �� ���� ������� �����?
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_05");	//���, ���. ���� ���� �������� � ����������� ����. � ��� �� ���� ������� ��������� ����.
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_06");	//�� ���� �����, ��� � ������� ���� ���! �����, ��� �����, ��� ������. ���, ��� ���� �� ������.
	//���� 400 �������
	x = 2; if (x == 2) {
		B_GiveInvItems(self,other,ItMi_Gold,400);
	};
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_07");	//�� � ���, ��� ������ � ���� ���� ���������, ������ ������ ����� ���� ����, �����, � ���� ����� ��� ���� ���-��� ����������.
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_08");	//��������, � ���� �������� ����� ������, � �� ��������� � ���� ���� �������.
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_09");	//� ����� ���� �������� ���� ��������� ������?
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_10");	//���� ��� ����� �� ����������, �� �� � �� ������. �� ���� �����?!
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_11");	//�����.
	Joseph_ReturnIron_Day = Wld_GetDay();
 
	//������ � �������� "��� ����� ��� ������?" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_WhoStoleMyIron_Success);
	
	//������ ����������
	B_StartOtherRoutine(self, "START");
};


//NS - 24/06/2013 ===========
//  �� ������ "����������� ��� ����"
//===========================

//------------------------------
// "��� ������ � ����. �������� ��� �����������."		nr=1
// ���� ���� �����, ����� ����������
instance DIA_Joseph_INeedInstruments(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_INeedInstruments_condition;	
	information = DIA_Joseph_INeedInstruments_info;
	description = "��� ����� �����������.";
};
func int DIA_Joseph_INeedInstruments_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName) && (MIS_DS2P_Tools4Huno == LOG_Running))
	{	return TRUE;};
};
func void DIA_Joseph_INeedInstruments_info()
{
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_00");	//��� ����� �����������. ���������� ����� ��� ������ � ���� ������.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_01");	//� ���? ���-�� ����� ����?
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_02");	//�� �� ������, ��������� ������ ������������� �����������.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_03");	//���� ���� ���� � � ����� ����� � ���� ���� ����������?
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_04");	//��� ����� �� �������� ���������� ������ ������ � �� ������� ����� � ������.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_05");	//������, ��� ������� �� ���� ���� �������� � ����� � �� ������� �� ��� �� �����������. �� ����� ��� ���� ������ ��� ����������!
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_06");	//�������. ���� ����� ������?
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_07");	//(����� ���������) �������-�� �����! � �����, � ��� ������� �� ����� ��������.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_08");	//������ ���� ���� ������� � ������� ����, ����� ������� � ���� ������ � ���� ��������.
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_09");	//������� �� ������?
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_09");	//������ ������� ����� ����������, �� ��� ��� �� ���. � ���� ��� ������� ������, ����� ��� ������� �� ������ ������.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_10");	//������� �� ������ �������� ��� ������ ����� �������� ����.

	//������ � �������� "����������� ��� ����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_Running,TOPIC_DS2P_Tools4Huno_JosephWantIronnGold);
};
//------------------------------
// "��� ������ � ����. �������� ��� �����������."		nr=1
// ���� ���� � ����� ��� �� ����
instance DIA_Joseph_MadeInstruments(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_MadeInstruments_condition;	
	information = DIA_Joseph_MadeInstruments_info;
	description = "�������� ��� �����������.";
};
func int DIA_Joseph_MadeInstruments_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_INeedInstruments)
		&& (MIS_DS2P_Tools4Huno == LOG_Running)
		&& (Npc_HasItems(other,ItMi_Gold) >= 300) && (Npc_HasItems(other,ItMi_IronOre) >= 4))
	{	return TRUE;};
};
func void DIA_Joseph_MadeInstruments_info()
{
	AI_Output(other,self,"DIA_Joseph_MadeInstruments_15_00");	//��� ������ � ����. �������� ��� �����������.
	// ������ ������ � ����
	B_DS_GiveRemoveItems(other,self,ItMi_Gold,300);
	B_DS_GiveRemoveItems(other,self,ItMi_IronOre,4);
		AI_Output(self,other,"DIA_Joseph_MadeInstruments_13_01");	//������, � ������ �� ������� ��� ������, ��� ����� ����������. ������� ����� ���� �����.
	// ���������� � ������ � �������, ���� ��� �� ��������
	Joseph_Busy = TRUE;
	Joseph_ReadyTime = C_GetTime_Plus(2,0,15);
	Joseph_WorksOn = -1;
	if (MIS_DS2P_WhoStoleMyIron != LOG_SUCCESS)
	{
		B_StartOtherRoutine(self, "START");
	};
	//������ � �������� "����������� ��� ����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_Running,TOPIC_DS2P_Tools4Huno_JosephWorks);
};
//------------------------------
// "����������� ������?"		nr=1
// �����, ���� �� �������
instance DIA_Joseph_InstrumentsReady(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_InstrumentsReady_condition;	
	information = DIA_Joseph_InstrumentsReady_info;
	permanent = TRUE;
	description = "����������� ������?";
};
func int DIA_Joseph_InstrumentsReady_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_MadeInstruments) && (Joseph_Tools4Huno_Got == FALSE))
	{	return TRUE;};
};
func void DIA_Joseph_InstrumentsReady_info()
{
	AI_Output(other,self,"DIA_Joseph_InstrumentsReady_15_00");	//����������� ������?
	if (Joseph_ReadyTime < Wld_GetPassedTime(0))	//������ < 2 �����
	{
		AI_Output(self,other,"DIA_Joseph_InstrumentsReady_13_01");	//���� ���������� ��� ����� ���������? � �� ������, ����� ���� �����!
	}
	else	//����� - ������
	{
		AI_Output(self,other,"DIA_Joseph_InstrumentsReady_13_02");	//��, �������! ��� ��� ���� ��� �������!
		B_GiveInvItem_red(self,other,ItMi_Rake,2,YPOS_ItemTaken);
		B_GiveInvItem_red(self,other,ItMw_1h_Bau_Axe,5,YPOS_ItemTaken + 3);
		B_GivePlayerXP(XP_MIS_Tools4Huno_Ready);
		Joseph_Tools4Huno_Got = TRUE;
		Joseph_Busy = FALSE;
		// ������������ � ��������, ���� ��� ������
		if (MIS_DS2P_WhoStoleMyIron != LOG_SUCCESS)
		{
			B_StartOtherRoutine(self, "PRESTART");
		};
	};
	//������ � �������� "����������� ��� ����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_Running,TOPIC_DS2P_Tools4Huno_ToolsGot);
};


//NS - 25/06/2013 ===========
//  �� ������ "���������� �������"
//===========================

//----------------------------
// "������, ���� ����� ��� ������." ����� ����������		nr=3
instance DIA_Joseph_SeemsUNeedHelp(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 3;
	condition = DIA_Joseph_SeemsUNeedHelp_condition;	
	information = DIA_Joseph_SeemsUNeedHelp_info;
	description = "������, ���� ����� ��� ������.";
};
func int DIA_Joseph_SeemsUNeedHelp_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_SeemsUNeedHelp_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_00");	//������, ���� ����� ��� ������.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_01");	//�� ��� ��� ��� �����? ���! ��, �� ���� � ������ ��� �� �� ��������.
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_02");	//� ������.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_03");	//����� ���, ��� ��� ��������������� ����������� � ���� ������ �����, �� ����� �� ������� �������� �����.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_04");	//��� ���, ������ ������ � ������� ��� ����������� ���� ���������� ��������.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_05");	//����� � ������ ���, ���������, ��� �� ������� ����� ������� ��������. ����� ���� ����� ��������� ������� ������� ����������� ������.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_06");	//�������� ����, ��� �� ������� �� ���� �� �����������, �� ������������ ���������� ����������, ����� ����������� ���-������ ����������.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_07");	//������� � ������ �������� � ������� ��� � �����. ����� ����, ��� �� ���� ������� ������� �������� � ���� �� ����, ��� ��� � �� ������� ������� ���� ������.
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_08");	//� ��� �� ���� ��������?
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_09");	//�������. ����� ��������!
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_10");	//������ �� ������� �� �������?
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_11");	//��� ���� ���������� ������������ ��������, ������ ��� ������ �� ��������� ����! � ��������� ������ ��������� �����-�� ����.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_12");	//�� �� ����, ��� ���� ��������� ������� �� ��������, �� ���� ��������, ��� ��� ���� ������ ��������. � ���� ��� �� ������� �� �������, �� ���� �� �� ����������� ���� �� ������ �������� ����� ��� ����� ��������.
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_13");	//� ������ ��� ���� ����������? � ��������� �����?
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_14");	//�� ��� ��, ������ ���� ��� �����! ���� ����, ��� ��� �������������, ��� ��� ���������, ��� � ����� ������� ���� ���� �����.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_15");	//� ������ � �� ��, ����� ������� ������� �� ����, ���� �� ���� ������ ������� � �������� �� �������. ��� ����� ������� ��������� � ���� ���, ��� �������� � �������� ������������.
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_16");	//� ������� ���� �������. ����, �������, �� ������� ������ ���������� ������.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_17");	//�� �����! ��� ���� �� �������. ��������� � �����, ��� ���� ����� ���� �������� � ��� ������� ����� �������.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_18");	//������� ���� ���, � ������� ������� ����. ��������� � �����, ������ ������� � ��� �� ��������.
	//���� ����� �� ������� � ���������
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ITKE_Key_DS2P_JOSEPH_CHEST,1);
	};

	//������ � �������� "���������� �������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_LostDrawings,LOG_MISSION,LOG_Running,TOPIC_DS2P_LostDrawings_Start);

	//UNFINISHED ���������� ~10 �������� � ����� � �������� �������
	/*
	Wld_InsertNpc(Larva, "");
	Wld_InsertNpc(Minecrawler, "");
	Wld_InsertNpc(CrawlerQueen_01, "");
	//*/
};

//----------------------------
// ������� ������� (+����) (+1 ����)		nr=3
// ���� ����� � ����, ��� �������
instance DIA_Joseph_ReturnDrawnings(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 3;
	condition = DIA_Joseph_ReturnDrawnings_condition;	
	information = DIA_Joseph_ReturnDrawnings_info;
	description = "� ������ ���� �������.";
};
func int DIA_Joseph_ReturnDrawnings_condition()
{
	if ((MIS_DS2P_LostDrawings == LOG_Running)
		/* UNFINISHED ������� �������
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)*/)
	{	return TRUE;};
};
func void DIA_Joseph_ReturnDrawnings_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_ReturnDrawnings_15_00");	//� ������ ���� �������.
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_02");	//(���������) ������ ���� ��� ������ �� ����! ��� ���� ��� �������, ������ ���� ����� ����!
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_03");	//� �����, ��� �� ��� ����� ������ �� ���� ��������, ���� �������� ������ ������� ��������. � ��� �� ����!
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_04");	//�� ����� ��������� ������ �� ����, ���� � ��������. ���, ��� �� ������.
	
	//���� 350 �������
	B_GiveInvItems(self,other,ItMi_Gold,350);
	
	//�������� �������
	/* UNFINISHED ������� �������
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	//*/
	AI_PrintScreen("������ 5 ��������",30,YPOS_ItemGiven,FONT_ScreenSmall,5);

	//(+����) (+1 ����)
	x = 1; if (x == 1)	{
		B_GivePlayerXP(XP_MIS_LostDrawings);
		B_RaiseAttribute(other,ATR_STRENGTH,1);
	};
	
	//������ � �������� "���������� �������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_LostDrawings,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_LostDrawings_Success);
	
	AI_Output(other,self,"DIA_Joseph_ReturnDrawnings_15_05");	//� �������, �� ���� �������� �������� � ������� ���� ������ ���������� ������.
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_06");	//�������, ������ �� �����, � ��� ���� ����� �� ��������� �����, �, ������� ��, ���� ��������� ��� ����������� ���������.
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_07");	//������, ������ �������� ������. ���... ���...
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_08");	//���, �����. ������� ��� ���, ��� ��� �������� � ���� �������, � � ��� ������.
	
	//���� ������ ���������� ��� ����� � ���� � ������
	B_GiveInvItems(self,other,ItWr_DS2P_List_Joseph,1);
	MADE_Weapon_Joseph = TRUE;
	
	//������ � �������� � ������� ��� ���� "�������� � �������" //NS �� �������� "������������ ����������� ������" 
	B_ds_LogEntry(TOPIC_PiratTrader,LOG_NOTE,-1,"������ ������ ��������� ��� ���������� ������, ���� � ������� ����������� ��������� � ������.");
};

//----------------------------
// ������� ������, � ������?
// ����� ���������� ����������� �������
instance DIA_Joseph_WhereGold(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 0;
	condition = DIA_Joseph_WhereGold_condition;	
	information = DIA_Joseph_WhereGold_info;
	important = TRUE;
};
func int DIA_Joseph_WhereGold_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_ReturnDrawnings))
	{	return TRUE;};
};
func void DIA_Joseph_WhereGold_info()
{
		AI_Output(self,other,"DIA_Joseph_WhereGold_13_01");	//������, ��� ���� � ������� ���� � ������, ���� ���?!
		AI_Output(self,other,"DIA_Joseph_WhereGold_13_02");	//�� �� �� ������ �������� �����, ������� ����������� ��������� ���������� ������� �������?
	Info_ClearChoices(DIA_Joseph_WhereGold);
	Info_AddChoice(DIA_Joseph_WhereGold,"������, � ������ �����. ��� ���� ������.",DIA_Joseph_WhereGold_Return);
	Info_AddChoice(DIA_Joseph_WhereGold,"�� ���-�� �������. ��� ������ �� ����.",DIA_Joseph_WhereGold_No);
};
func void DIA_Joseph_WhereGold_No()
{
	AI_Output(other,self,"DIA_Joseph_WhereGold_No_15_00");	//�� ���-�� �������. ��� ������ �� ����.
	//(+1 � ��������)
	B_RaiseAttribute(other,ATR_DEXTERITY,1);
		AI_Output(self,other,"DIA_Joseph_WhereGold_No_13_01");	//(���������� �������) � �� ���� �� ����� �������� ���.
		AI_Output(self,other,"DIA_Joseph_WhereGold_No_13_02");	//������� ����� �������� ��������, ��� ���� �� � �� ���� ������, ������� �� �� ���������� ������! ��!
		AI_Output(self,other,"DIA_Joseph_WhereGold_No_13_03");	//�� �� �����, ��� ���� � ���� ������� �� �������.
	AI_StopProcessInfos(self);

};
func void DIA_Joseph_WhereGold_Return()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_WhereGold_Return_15_00");	//������, � ������ �����. ��� ���� ������. ������ ���.
		AI_Output(self,other,"DIA_Joseph_WhereGold_Return_13_01");	//(���������) �� ������������� ������ ������� ��� ������? �� ���, ������ ������, ������ ���� ���� � ���?
		AI_Output(self,other,"DIA_Joseph_WhereGold_Return_13_02");	//�� ��� �� ��� ������ ������ ���� �����? �� ���� ������������� ����� �������, ���� ������ ������. � � ���� �� ����, ��� ��� ���� �����.
		AI_Output(self,other,"DIA_Joseph_WhereGold_Return_13_03");	//�� �� �����, ������ ������ � ����, ��� ���� � ���� ������� �� �������, � �� ���� ��������� � ������ ���� ���� ������.
		AI_Output(self,other,"DIA_Joseph_WhereGold_Return_13_04");	//�� �����, ��� �� ����� ����� ����������, �� �����-�� � ������ ������ �� ����, ��� ��� ��������, ���� �� �����, ��� ���� ������ ��-����������! ��-��-��!!!
	//���� ������ ������ �����
	B_GiveInvItems(self,other,ItMw_DS2P_FlameOfRevenge,1);
	AI_StopProcessInfos(self);
};


//NS - 27/06/2013 ========================================================
//  �� ������ "������ ��������" 	nr=4
//========================================================================

//----------------------------
// ������ ��� ������ ������, ����� ���� ����� ����� ������ "��� ����� ��� ������?"
instance DIA_Joseph_NeedHelpOldMill(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 4;
	condition = DIA_Joseph_NeedHelpOldMill_condition;	
	information = DIA_Joseph_NeedHelpOldMill_info;
	important = TRUE;
};
func int DIA_Joseph_NeedHelpOldMill_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_SUCCESS) && ((Joseph_ReturnIron_Day + 1) >= Wld_GetDay()))
	{	return TRUE;};
};
func void DIA_Joseph_NeedHelpOldMill_info()
{
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_13_00");	//������, � ���� � ���� ���� ����!
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_15_01");	//� ���� ������.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_13_02");	//�� ��� ����� �������� ���� � � ��������� ��� ����� ������� �����, ��� ����� �������� ��� ������� ��������.
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_15_03");	//� � ����� ��� ���?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_13_04");	//�� ��� ��. ��� ����� �������� ��������, � ���� ����� ������. ��������? (�����������) ����� ������� ���� �����.

	Info_ClearChoices(DIA_Joseph_NeedHelpOldMill);
	Info_AddChoice(DIA_Joseph_NeedHelpOldMill,"� ��������. ��� ����� ������?",DIA_Joseph_NeedHelpOldMill_Yes);
	Info_AddChoice(DIA_Joseph_NeedHelpOldMill,"��� ��� �� ���������.",DIA_Joseph_NeedHelpOldMill_No);
};
func void DIA_Joseph_NeedHelpOldMill_No()
{
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_No_15_00");	//��� ��� �����������.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_No_13_01");	//�� � ����� � �����!
	AI_StopProcessInfos(self);
};
func void DIA_Joseph_NeedHelpOldMill_Yes()
{
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_00");	//� ��������. ��� ����� ������?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_01");	//� �������� �������� � �������, ��� �� ����, ��� �� �������, ����� ������ ���. ��� ������������� ���� ������������ ��������� � ������.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_02");	//�������� ����, ������� ��, ����� ���������� ��������� ����������, ��� � ����������� ���������� ���������, ���������� �������� ������ �� �������� �������� ��������.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_03");	//�� ��� ����� �� ������������ �� �� �������, �� ��������� �� ������.
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_04");	//��� ������� ��� �����.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_05");	//�� ������� ���� ����� �����?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_06");	//� ��� ��� ��� ������ ��� ���������, �� ��� �� �������, �������, ��� ��������� � ������� �� �����, ��� �������� ��������, � ������ ���� ��������� �� ������� ������, ������� ����� �� �������, �������� ��� � �������!
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_07");	//� ���� �� ��������� ����� �� ����, �� ����� ������ ����� ������, ����� ��� ������� �������� �����!
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_08");	//������. ��� ��������� �� ����?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_09");	//��� ������� ���� �� ����, � ����� �������� ���� ������ ������, ��� ���� ����� ������. ��-�� ����� ����� � ������ ���. � �����, ���� ����� � � ��� ����� ����� � �����������, �� ��� � ������ ���� �������.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_10");	//������� �������� �� �������� � ����� ����� ������� ������. � �����, ������ ����� � ����� ���!
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_11");	//� ��� � ���� ������ �������� ������?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_12");	//������! �� ���� ������, �� ����� ��� �������! � ������ � �� ��������� ������ �����������.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_13");	//��� ������ �������, ������� ���, � �������� ���� ������, ��� �������� ��� � �������, �� � ��� �� � ��� ���-������ ������� � ��������� ���.
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_14");	//��� ��� ������ ���� ������?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_15");	//� � ������ ����, ������ ��� ���� ��������! ������ ���� �������.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_16");	//��� �� ������� ������ ��������� �������� ��������, ��� ��������� ������ �����, ��� �� ���� �����.

	//������ � �������� "������ ��������" 
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldMill_Start);
	Info_ClearChoices(DIA_Joseph_NeedHelpOldMill);
};

//----------------------------
// ������ ��� ������ �� ������	(+����)
instance DIA_Joseph_KnowWhereStone(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 4;
	condition = DIA_Joseph_KnowWhereStone_condition;	
	information = DIA_Joseph_KnowWhereStone_info;
	description = "� ����, ��� ����� ������ ������!";
};
func int DIA_Joseph_KnowWhereStone_condition()
{
	if (Npc_KnowsInfo(other, DIA_Tamir_WhereGetStone4Mill))
	{	return TRUE;};
};
func void DIA_Joseph_KnowWhereStone_info()
{
	AI_Output(other,self,"DIA_Joseph_KnowWhereStone_15_00");	//� ����, ��� ����� ������ ������!
	//(+����)
	B_GivePlayerXP(XP_MIS_OldMill_TellAboutGrave);
		AI_Output(self,other,"DIA_Joseph_KnowWhereStone_13_01");	//���, �� ������� �����������!
	AI_Output(other,self,"DIA_Joseph_KnowWhereStone_15_02");	//(���������) ������ �� ������?
		AI_Output(self,other,"DIA_Joseph_KnowWhereStone_13_03");	//� �� �������, � ����� ������ ��� ����� ��������? � ��� ����� ���� ��� ��� �������, �� ��� ������ �����, � ����������� �������� � ������ � �� �������!
	AI_Output(other,self,"DIA_Joseph_KnowWhereStone_15_04");	//����� � ���� ���� ����?
		AI_Output(self,other,"DIA_Joseph_KnowWhereStone_13_05");	//� �����, ���� ������� ������, � �� ������� ������ �����, ��� ����� ������ ������, �� ������� ���� �����, ����������� �� ����� ������� ��� �������.
	AI_Output(other,self,"DIA_Joseph_KnowWhereStone_15_06");	//������, ������ ���� ���.
		AI_Output(self,other,"DIA_Joseph_KnowWhereStone_13_07");	//��, ������, ���� �������� ������� ���� � ���� ��������. � ������ �� �����, ��� �� ������ �� ���� �����. (�������)

	//������ � �������� "������ ��������" 
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldMill_JosephKnew);
};

//----------------------------
// ����� ������, �������� ��� ������	(+����, ������� "����� ������")
instance DIA_Joseph_Cave4MillIsClear(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 4;
	condition = DIA_Joseph_Cave4MillIsClear_condition;	
	information = DIA_Joseph_Cave4MillIsClear_info;
	description = "";
};
func int DIA_Joseph_Cave4MillIsClear_condition()
{
	if (Npc_KnowsInfo(other, DIA_Joseph_KnowWhereStone) && C_DSG_GraniteGraveIsClear())
	{	return TRUE;};
};
func void DIA_Joseph_Cave4MillIsClear_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_Cave4MillIsClear_15_00");	//������ ������� �� ������.
	//(+����)
	B_GivePlayerXP(XP_MIS_OldMill_Success);
		AI_Output(self,other,"DIA_Joseph_Cave4MillIsClear_13_01");	//�� ������? ������ �������, ��� � �������� ������� ���� ������?
	AI_Output(other,self,"DIA_Joseph_Cave4MillIsClear_15_02");	//���� �� ������, ����� � �������� �����. ���� �� ���� �������, ��� ��� ���� ��� �� ��������.
		AI_Output(self,other,"DIA_Joseph_Cave4MillIsClear_13_03");	//������� ���� ����! � �����, ���� ������ ����� ������. ��... �����. �� ���� �� ��� ������, � ���� ����� ��������, �����?!
		AI_Output(self,other,"DIA_Joseph_Cave4MillIsClear_13_04");	//����� �� ������ ���� �������, � ��� ������ ������� ���������. ��� ���� �� �������������.
	//���� ������� ������ �������
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ItRw_DS2P_Crossbow_StarFlight,1);
	};
	Joseph_RepairMill_Day = Wld_GetDay() + 2;
	
	//������ � �������� "������ ��������" 
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_OldMill_Success);
};


//NS - 03/07/2013 =======================
//  �� ������ "�������� �����"
//=======================================

//----------------------------
// "� ������, ��� �� ��������� ������."		nr=5
instance DIA_Joseph_AboutVales(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 5;
	condition = DIA_Joseph_AboutVales_condition;	
	information = DIA_Joseph_AboutVales_info;
	description = "� ������, ��� �� ��������� ������.";
};
func int DIA_Joseph_AboutVales_condition()
{
	if (Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && !Npc_KnowsInfo(other,DIA_Zedd_UAStutterReason))
	{	return TRUE;};
};
func void DIA_Joseph_AboutVales_info()
{
	AI_Output(other,self,"DIA_Joseph_AboutVales_15_00");	//� ������, ��� �� ��������� ������.
		AI_Output(self,other,"DIA_Joseph_AboutVales_13_01");	//(�������) � ��! ������ ���� ��� ����! ����� ����� ��� �� ����� �������, �� ��� �� � ������ ��� ���������, ����� ���� �����! ��!
		AI_Output(self,other,"DIA_Joseph_AboutVales_13_02");	//��-�����, ����� ����� ����� ������� � ��������. (������ �������)
};


//----------------------------
// "��� ����� ��������� ����."		nr=5
instance DIA_Joseph_NeedForgeBellows(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 5;
	condition = DIA_Joseph_NeedForgeBellows_condition;	
	information = DIA_Joseph_NeedForgeBellows_info;
	description = "��� ����� ��������� ����.";
};
func int DIA_Joseph_NeedForgeBellows_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_UAStutterReason))
	{	return TRUE;};
};
func void DIA_Joseph_NeedForgeBellows_info()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_15_00");	//��� ����� ��������� ����.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_13_01");	//�� �������� � ��� ��� ���� �����!
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_15_02");	//���� �������� ����� ����, ��� ��� ��� ��������� ������.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_13_03");	//������� �� �����, ���� ���������� ���� ����?
	
	Info_ClearChoices(DIA_Joseph_NeedForgeBellows);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"�� �����",DIA_Joseph_NeedForgeBellows_CantRemember);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"������ ����",DIA_Joseph_NeedForgeBellows_4);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"��� ����",DIA_Joseph_NeedForgeBellows_Right);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"��� ����",DIA_Joseph_NeedForgeBellows_2);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"���� ���",DIA_Joseph_NeedForgeBellows_1);
};
//�������� �����
func void DIA_Joseph_NeedForgeBellows_Wrong()
{
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Wrong_13_00");	//����� ������ �������� ����� ���������� ���� �� ������� �������. �� �-�� ��� �� ������ ��� ����.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Wrong_13_01");	//������� ���, ����� � ��������� ��� ������� �� ���� �� ��� � �����-������ ��������.
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_Wrong_15_02");	//� ��� ��� ������?
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Wrong_13_03");	//� ��, ��� � ���� �� ����. ���� ���� ����� ����, � ����� ����, ������, �� ������ �����.
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_Wrong_15_04");	//����� � ��� � ���� ������, ���� ��� �� ���������.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Wrong_13_05");	//� ��� ��� ����? ������ ���� � �����!

	//������ � �������� "�������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_JosephPay);
};
//������ �����
func void DIA_Joseph_NeedForgeBellows_Right()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_Right_15_00");	//��� ����.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Right_13_01");	//����� ������� �����. ����� ������ �����-�� ��������. � � ����. ������� ����.
	Joseph_GaveForgeBellows = TRUE;
	//������ � �������� "�������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_JosephGaveBellows);
};
//�������� ��������
func void DIA_Joseph_NeedForgeBellows_1()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_1_15_00");	//���� ���.
	DIA_Joseph_NeedForgeBellows_Wrong();
};
func void DIA_Joseph_NeedForgeBellows_2()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_2_15_00");	//��� ����.
	DIA_Joseph_NeedForgeBellows_Wrong();
};
func void DIA_Joseph_NeedForgeBellows_4()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_4_15_00");	//������ ����.
	DIA_Joseph_NeedForgeBellows_Wrong();
};
func void DIA_Joseph_NeedForgeBellows_CantRemember()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_CantRemember_15_00");	//�� �����.
	DIA_Joseph_NeedForgeBellows_Wrong();
};


//----------------------------
// ������ ���� (200 ���.), ���� �� �����		nr=5
instance DIA_Joseph_BuyForgeBellows(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 5;
	condition = DIA_Joseph_BuyForgeBellows_condition;	
	information = DIA_Joseph_BuyForgeBellows_info;
	description = "��� ����� ��������� ����.";
	permanent = TRUE;
};
func int DIA_Joseph_BuyForgeBellows_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_NeedForgeBellows) && (Joseph_GaveForgeBellows == FALSE))
	{	return TRUE;};
};
func void DIA_Joseph_BuyForgeBellows_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_BuyForgeBellows_15_00");	//������ ��� ���� ��� �������.
	if (Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		AI_Output(self,other,"DIA_Joseph_BuyForgeBellows_13_01");	//��� ��� ������ ��������. �������.
		//������ ����, �������� ������
		x = 1; if (x == 1)	{
			B_DS_GiveRemoveItems(other,self,ItMi_Gold,200);
			B_GiveInvItems(self,other,ITMI_DS2P_ForgeBellows,1);
		};
		Joseph_GaveForgeBellows = TRUE;
		//������ � �������� "�������� �����" 
		B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_JosephGaveBellows);
	}
	else
	{
		AI_Output(self,other,"DIA_Joseph_BuyForgeBellows_13_02");	//��������� ������ � ����� ���� ����.
	};
};


//NS - 26/06/2013 ==============================================
//  �������� � ��������
// ���� ���������� ���� � ���� �� ������ � LP
// ����� ���������� ������ �� �����
//==============================================================

//----------------------------
// "�� ������ ������� ���� ���������� ����?"		nr=10
instance DIA_Joseph_CanUTeach(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 10;
	condition = DIA_Joseph_CanUTeach_condition;	
	information = DIA_Joseph_CanUTeach_info;
	description = "�� ������ ������� ���� ���������� ����?";
};
func int DIA_Joseph_CanUTeach_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_CanUTeach_info()
{
	AI_Output(other,self,"DIA_Joseph_CanUTeach_15_00");	//�� ������ ������� ���� ���������� ����?
		AI_Output(self,other,"DIA_Joseph_CanUTeach_13_01");	//� �� ��� ���-�� ������? � ���� ��� �� �������, �� ������� �������� � ���������, ������� ���� ����� �� ����� � ����� �������.
	AI_Output(other,self,"DIA_Joseph_CanUTeach_15_02");	//��, � �������� � ���� ��� �������� �������, ������ �����. �� ������� ���� ������.
		AI_Output(self,other,"DIA_Joseph_CanUTeach_13_03");	//�� ������, ��� ���. ���� ������, � � ����� ���� �����, ��� ���� ���.
		AI_Output(self,other,"DIA_Joseph_CanUTeach_13_04");	//� ���� ��� ���� ���� ���� �������� �������� �������, ����� � ���������. � ������ ����, ���� ������.
	// ���. �������� � ��������
	TEACH_Joseph_Smith = TRUE;
	TRADE_Joseph = TRUE;
	
	//������ � �������� � ������� ��� ���� "������� � �������" 
	B_ds_LogEntry(TOPIC_PiratTeacher,LOG_NOTE,-1,"������ ����� ������� ���� ������������� ������.");

	//������ � �������� � ������� ��� ���� "�������� � �������" 
	B_ds_LogEntry(TOPIC_PiratTrader,LOG_NOTE,-1,"������ ������� ������� ��� ������������ �������.");
};

//----------------------------
// "� �� ����� �������� ������."		nr=11
instance DIA_Joseph_Sharpening(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 11;
	condition = DIA_Joseph_Sharpening_condition;	
	information = DIA_Joseph_Sharpening_info;
	description = "� �� ����� �������� ������.";
};
func int DIA_Joseph_Sharpening_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_Sharpening_info()
{
	AI_Output(other,self,"DIA_Joseph_Sharpening_15_00");	//� �� ����� �������� ������.
		AI_Output(self,other,"DIA_Joseph_Sharpening_13_01");	//� ��� ���� ������? ������ ������, ����� � ���������� ����� � ������.
		AI_Output(self,other,"DIA_Joseph_Sharpening_13_02");	//���� � ���� ���� ������ �� ������� �����, ������� ���� �� ������.
};

//----------------------------
// "� ����� �� ��������� ���� ����."		nr=12
instance DIA_Joseph_PreTeach_Str(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 12;
	condition = DIA_Joseph_PreTeach_Str_condition;	
	information = DIA_Joseph_PreTeach_Str_info;
	description = "� ����� �� ��������� ���� ����.";
};
func int DIA_Joseph_PreTeach_Str_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_PreTeach_Str_info()
{
	AI_Output(other,self,"DIA_Joseph_PreTeach_Str_15_00");	//� ����� �� ��������� ���� ����.
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_13_01");	//�, �� ������ ��� ��� � ������� ��������, ����� ��� ���������! ���� �� �, �� ����� �� ������ ���� ������! (������ �������)
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_13_02");	//�� ������� ������, �� ��� �� ��������.
	AI_Output(other,self,"DIA_Joseph_PreTeach_Str_15_03");	//� ������?
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_13_04");	//� ������ � �������. ����� ���� � ������� ��� �� �����, ��! �� �����, � ������� ���� �� ����, ���, �������� ����. (������ �������)
	Info_ClearChoices(DIA_Joseph_PreTeach_Str);
	Info_AddChoice(DIA_Joseph_PreTeach_Str,"����� ���������, ��� �������.",DIA_Joseph_PreTeach_Str_Yes);
	Info_AddChoice(DIA_Joseph_PreTeach_Str,"����� � ������ ���?",DIA_Joseph_PreTeach_Str_No);
};

func void DIA_Joseph_PreTeach_Str_No()
{
	AI_Output(other,self,"DIA_Joseph_PreTeach_Str_No_15_00");	//����� � ������ ���?
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_No_13_01");	//���, ��! ������� ���� ��� �� �����!
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_No_13_02");	//� ��� ����� ��� ����� ���������, � �� ��� ����� ��� ������, ��� ���� ������ ������ ������� ��������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Joseph_Fight = TRUE;
};

func void DIA_Joseph_PreTeach_Str_Yes()
{
	AI_Output(other,self,"DIA_Joseph_PreTeach_Str_Yes_15_00");	//����� ���������, ��� �������.
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_Yes_13_01");	//��� ����� ���������� ������!
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_Yes_13_02");	//�������, ������� ����, ������ ����� ������! ��!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Joseph_Fight = TRUE;
};

//----------------------------
// 	����� ���:
// 	�������� +2 ����,  	��������� +����
instance DIA_Joseph_Fight_Finished(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 0;
	condition = DIA_Joseph_Fight_Finished_condition;	
	information = DIA_Joseph_Fight_Finished_info;
	important = TRUE;
};
func int DIA_Joseph_Fight_Finished_condition()
{
	if ((Joseph_Fight == TRUE)
		&& (self.aivar[AIV_LastFightComment] == FALSE)
		&& ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)))
	{	return TRUE;};
};
func void DIA_Joseph_Fight_Finished_info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Joseph_Fight_Finished_13_01");	//� �� ������� �����! ���� �� ������, ��� ���� ������� �������� ������ �������! 
		B_RaiseAttribute(other,ATR_STRENGTH,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Joseph_Fight_Finished_13_02");	//�� �� ���, ����� ���? � �� � �� �����, ��� �� ����� � ������� � ����� �������. (������ �������)
		AI_Output(self,other,"DIA_Joseph_Fight_Finished_13_03");	//�����, �� ��������, �� �� ������ � �� ���������, ���� � ����� ����������! ��!
		B_GivePlayerXP(XP_Joseph_Fight_Lost);
	};
	self.aivar[AIV_LastFightComment] = TRUE;
	
	//� ����� ������ ����� �����
	AI_Output(other,self,"DIA_Joseph_Fight_Finished_15_04");	//������ �� ������ ���� �����?
		AI_Output(self,other,"DIA_Joseph_Fight_Finished_13_05");	//�������, �� �� ����� ��� ������� �����. (�������) ������� � ����� �����.
	
	//������ � �������� � ������� ��� ���� "������� � �������" 
	B_ds_LogEntry(TOPIC_PiratTeacher,LOG_NOTE,-1,"� ������� � ���� ��������� ���� ����.");
	TEACH_Joseph_Str = TRUE;
	
	AI_StopProcessInfos(self);
};

//===========================================================
// ��������		nr=21
instance DIA_Joseph_TRADE(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 21;
	condition = DIA_Joseph_TRADE_condition;	
	information = DIA_Joseph_TRADE_info;
	description = "������, ��� � ���� ����.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Joseph_TRADE_condition()
{
	if (TRADE_Joseph == TRUE)
	{	return TRUE;};
};
func void DIA_Joseph_TRADE_info()
{
	AI_Output(other,self,"DIA_Joseph_TRADE_15_00");	//������, ��� � ���� ����.
		AI_Output(self,other,"DIA_Joseph_TRADE_13_01");	//��� ���, ��� � ���� ����.
	B_GiveTradeInv(self);
};
// ������� �������, ���� ������� ������ � ������ 2 ���,
//�����������, ����� � ������� ������� ��������
instance DIA_Joseph_TRADE_Weapon(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 20;
	condition = DIA_Joseph_TRADE_Weapon_condition;	
	information = DIA_Joseph_TRADE_Weapon_info;
	description = "� ���� ������ � ���� ������?";
	trade = TRUE;
};
func int DIA_Joseph_TRADE_Weapon_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_SUCCESS) && ((Joseph_ReturnIron_Day + 2) >= Wld_GetDay()))
	{	return TRUE;};
};
func void DIA_Joseph_TRADE_Weapon_info()
{
	AI_Output(other,self,"DIA_Joseph_TRADE_Weapon_15_00");	//� ���� ������ � ���� ������?
		AI_Output(self,other,"DIA_Joseph_TRADE_Weapon_13_01");	//�������, �������.
	TRADE_Joseph = TRUE;
	Give_Joseph_Weapon = TRUE; // �������, ��� ���� �������� � ��������� ������
	B_GiveTradeInv(self);
	
	//������ � �������� � ������� ��� ���� "�������� � �������" 
	B_ds_LogEntry(TOPIC_PiratTrader,LOG_NOTE,-1,"� ������� � ���� ������ ������.");
};

//===========================================================
// �������� �����		nr=50
// �� ���� ����� � ������
instance DIA_Joseph_TEACH_Smith(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 50;
	condition = DIA_Joseph_TEACH_Smith_condition;	
	information = DIA_Joseph_TEACH_Smith_info;
	description = "����� ���� ������ ������.";
	permanent = TRUE;
};
func int DIA_Joseph_TEACH_Smith_condition()
{
	if (TEACH_Joseph_Smith == TRUE)
	{	return TRUE;};
};

// ����, 1 ������� --------------------------------

func void B_Joseph_TEACH_Smith_Menu()
{
	Info_ClearChoices(DIA_Joseph_TEACH_Smith);
	Info_AddChoice(DIA_Joseph_TEACH_Smith,Dialog_Back,DIA_Joseph_TEACH_Smith_back);
	/* UNFINISHED
	//������
	if(Weapon_Ds_Template = FALSE)	
	{	
		Info_AddChoice(DIA_Joseph_TEACH_Smith,"�������� (x LP, xxx ���.)",DIA_Joseph_TEACH_Smith_DoIt_Template);
	};
	//*/
};

func void DIA_Joseph_TEACH_Smith_info()
{
	AI_Output(other,self,"DIA_Joseph_TEACH_15_00");	//����� ���� ������ ������.
		AI_Output(self,other,"DIA_Joseph_TEACH_13_01");	//����� ������, � ���������.
	B_Joseph_TEACH_Smith_Menu();
};

func void DIA_Joseph_TEACH_Smith_back()
{
	Info_ClearChoices(DIA_Joseph_TEACH_STR);
};

// ����� ������� ----------------------------------
func int DIA_Joseph_TEACH_Smith_DoIt(var int lp, var int price, var string Log_Str)
{
	var int Result;	Result = 0;
	if(other.lp >= lp)
	{
		if(Npc_HasItems(other,ItMi_Gold) >= price)
		{
			other.lp -= lp;		
			B_DS_GiveRemoveItems(other,self,ItMi_Gold,price);		
			B_ds_LogEntry(TOPIC_TalentSmith,LOG_NOTE,-1,Log_Str);	
			Result = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Joseph_NoGold_13_00");	//� ���� ������������ ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Joseph_NoLP_13_00");	//� ���� ������������ �����.
	};
	B_Joseph_TEACH_Smith_Menu();
	return Result;
};

// ���������� ������ -------------------------------
/* UNFINISHED
func int DIA_Joseph_TEACH_Smith_DoIt_Template()	//������
{
	// ���� ��������� ������ - �������� � ������ ����������
	if (DIA_Joseph_TEACH_Smith_DoIt(0,0,"������ � ������"))
	{	Weapon_Ds_Template = TRUE;	};
};
//*/


//===========================================================
// �������� ����		nr=51
// �� ���� ����� � ������
instance DIA_Joseph_TEACH_STR(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 51;
	condition = DIA_Joseph_TEACH_STR_condition;	
	information = DIA_Joseph_TEACH_STR_info;
	description = "� �� ����� ��������� ���� ����.";
	permanent = TRUE;
};
func int DIA_Joseph_TEACH_STR_condition()
{
	if (TEACH_Joseph_Str == TRUE)
	{	return TRUE;};
};
func void B_Joseph_TEACH_STR_Menu()
{
	Info_ClearChoices(DIA_Joseph_TEACH_STR);
	Info_AddChoice(DIA_Joseph_TEACH_STR,Dialog_Back,DIA_Joseph_TEACH_STR_back);
	Info_AddChoice(DIA_Joseph_TEACH_STR,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_STRENGTH,1,-1),DIA_Joseph_TEACH_STR_1);
	Info_AddChoice(DIA_Joseph_TEACH_STR,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_STRENGTH,5,-1),DIA_Joseph_TEACH_STR_5);
};
func void DIA_Joseph_TEACH_STR_info()
{
	AI_Output(other,self,"DIA_Joseph_TEACH_STR_15_00");	//� �� ����� ��������� ���� ����.
		AI_Output(self,other,"DIA_Joseph_TEACH_STR_13_01");	//������, ����� �������������.
	B_Joseph_TEACH_STR_Menu();
};
func void DIA_Joseph_TEACH_STR_back()
{
	Info_ClearChoices(DIA_Joseph_TEACH_STR);
};
func void DIA_Joseph_TEACH_STR_DoIt(var int points)
{
	var int cost;
	cost = b_ds_GetTeachAtrPaymentAmount(other,ATR_STRENGTH,points);
	if(Npc_HasItems(other,ItMi_Gold) >= cost)
	{
		if(B_TeachAttributePoints(self,other,ATR_STRENGTH,points,T_MAX))
		{
			b_giveInvItems(other,self,ItMi_Gold,cost);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Joseph_NoGold_13_00");	//� ���� ������������ ������.
	};
	B_Joseph_TEACH_STR_Menu();
};
func void DIA_Joseph_TEACH_STR_1()
{
	DIA_Joseph_TEACH_STR_DoIt(1);
};
func void DIA_Joseph_TEACH_STR_5()
{
	DIA_Joseph_TEACH_STR_DoIt(5);
};

//===========================================================
// ������������ ������		nr=70
instance DIA_Joseph_MADE_Weapon(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 70;
	condition = DIA_Joseph_MADE_Weapon_condition;	
	information = DIA_Joseph_MADE_Weapon_info;
	description = "�� ������ ����������� ������...";
	permanent = TRUE;
};
func int DIA_Joseph_MADE_Weapon_condition()
{
	if ((MADE_Weapon_Joseph == TRUE)
		&& (Joseph_Busy == FALSE))	//���� � ������ ������ �� �����
	{	return TRUE;};
};
func void DIA_Joseph_MADE_Weapon_info()
{
	AI_Output(other,self,"DIA_Joseph_MADE_Weapon_15_00");	//�� ������ ����������� ������...
	Info_ClearChoices(DIA_Joseph_MADE_Weapon);
	/* UNFINISHED
	Info_AddChoice(DIA_Joseph_MADE_Weapon,"�������� ��� ���� ...",DIA_Joseph_MADE_Weapon_Template);
	//*/
};
// ���������� ItemID, ���� ���������� ������
func int C_Joseph_MADE_Weapon_CanMade(var int GoldAmount, var int ItemID)
{
	if (Npc_HasItems(other,ItMi_gold) < GoldAmount)
	{
		AI_Output(self,other,"DIA_Joseph_NoGold_13_00");	//� ���� ������������ ������.
		return FALSE;
	};
	AI_Output(self,other,"DIA_Joseph_MADE_Weapon_13_01");	//������� ����� ���� �����, ��� ����� ������.
	Joseph_Busy = TRUE;
	Joseph_ReadyTime = C_GetTime_Plus(2,0,15);
	Joseph_WorksOn = ItemID;
	// �������� ������, ���� �� ����� �� �����
	if (MIS_DS2P_WhoStoleMyIron != LOG_SUCCESS)
	{
		B_StartOtherRoutine(self, "START");
	};
	return TRUE;
};

func void C_Joseph_MADE_Weapon_NoMaterials()
{
	AI_Output(self,other,"DIA_Joseph_NoMaterials_13_00");	//� ���� ������������ ����������.
};


// ���������� ������ -------------------------------
/* UNFINISHED
//������
func int DIA_Joseph_MADE_Weapon_Template()
{
	//�������� ����������
	if (C_Npc_DS_HasItems_Scr(hero,It,1,YPos_3,true)
		&& (C_Npc_DS_HasItems_Scr(hero,It,1,YPos_5,true))
	{	
		C_Joseph_MADE_Weapon_CanMade(0, Hlp_GetInstanceID(ItMw_Template));//������������ ������ � ��������� ������
	}
	else
	{
		C_Joseph_MADE_Weapon_NoMaterials();
	};
	AI_StopProcessInfos(self);
};
//*/

// ������ ������ ----------------------------------
instance DIA_Joseph_MADE_Weapon_Ready(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 0;
	condition = DIA_Joseph_MADE_Weapon_Ready_condition;	
	information = DIA_Joseph_MADE_Weapon_Ready_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Joseph_MADE_Weapon_Ready_condition()
{
	if ((Joseph_ReadyTime >= Wld_GetPassedTime(0)) && (Joseph_Busy == TRUE) && (Joseph_WorksOn > 0))
	{	return TRUE;};
};
func void DIA_Joseph_MADE_Weapon_Ready_info()
{
		AI_Output(self,other,"DIA_Joseph_InstrumentsReady_13_00");	//��� ������. ��-�����, ���������� ����� �������.
	//������ ������
	B_GiveInvItems(self, other, Joseph_WorksOn, 1);
	//�������, ��� �� �����
	Joseph_Busy = FALSE;
	Joseph_WorksOn = 0;
	// ������������ � ��������, ���� ��� ������
	if (MIS_DS2P_WhoStoleMyIron != LOG_SUCCESS)
	{
		B_StartOtherRoutine(self, "PRESTART");
	};
};

// ������������, ���� ���� ����� "������������ �����"
// nr = 1

instance DIA_Joseph_CharmedBolts(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_CharmedBolts_condition;	
	information = DIA_Joseph_CharmedBolts_info;
	permanent = FALSE;
	description = "��� ����� ������������ ����� ��� ��������.";
};

func int DIA_Joseph_CharmedBolts_condition()
{
	if (MIS_DS2P_CharmedBolts == Log_Running)
	{	
		return TRUE;
	};
};

func void DIA_Joseph_CharmedBolts_info()
{
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_15_00");	//��� ����� ������������ ����� ��� ��������.
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_13_01");	//����������, �-�� ��� ������?
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_15_02");	//������ �� ������� ������ ������, ��� �, ��� � � ������ ��������� ���� � ������.
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_13_03");	//��, ��� ������������� ���, ���� ����� ������ �������� ���������� ��������� � ����������� ����������� ��� ��������.
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_15_04");	//��� �� ������ ��� �� �������? ��� ���� ��� ������� ������ ������.
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_13_05");	//������. ������, ��-������, ������� ��� ���� ������ ���������� ����. �� ������ ������ ����� ���������� �������� ������ �����������. � ��-������, �� ��� ��������� ����� ��� ������������, ������ ��� � ���� ������� �� ���������.
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_13_06");	//�-�������, ������ ������������� ���� ����� ������ 10 �����, �� ������. ��������� ��� �����. ����?
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_15_07");	//���� � ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_Success,TOPIC_DS2P_CharmedBolts_BringIngredients);
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "������������ �����", � �������� ��� ����������� ��� �������
// nr = 1

instance DIA_Joseph_CharmedBoltsCreating(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_CharmedBoltsCreating_condition;	
	information = DIA_Joseph_CharmedBoltsCreating_info;
	permanent = FALSE;
	description = "���, � ��� ������.";
};

func int DIA_Joseph_CharmedBoltsCreating_condition()
{
	if ((MIS_DS2P_CharmedBolts == Log_Running) && Npc_KnowsInfo(other,DIA_Joseph_CharmedBolts)
		 && (Npc_HasItems(other,ItMi_Nugget) >= 5) && (Npc_HasItems(other,ITMI_FUSING_RW_TEMPLATE) >= 1)
		 && (Npc_HasItems(other,ItMi_Gold) >= 200))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_CharmedBoltsCreating_info()
{
	AI_Output(other,self,"DIA_Joseph_CharmedBoltsCreating_15_00");	//���, � ��� ������. ���� ������ ����.
	// ������ ������� ����
	B_GiveInvItems(other,self,ItMi_Nugget,5);
	AI_Output(other,self,"DIA_Joseph_CharmedBoltsCreating_15_01");	//����� ��� ������������.
	// ������ ������� �����
	B_GiveInvItems(other,self,ITMI_FUSING_RW_TEMPLATE,1);
	AI_Output(other,self,"DIA_Joseph_CharmedBoltsCreating_15_02");	//� 200 �����.
	// ������ ������� 200 �������
	B_GiveInvItems(other,self,ItMi_Gold,200);
	AI_Output(other,self,"DIA_Joseph_CharmedBoltsCreating_15_03");	//� ���� ����� ��������. ������ ���� �������.
	AI_Output(self,other,"DIA_Joseph_CharmedBoltsCreating_13_04");	//������� ����� ������ ����, �� ��� ����� � ���������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_Running,TOPIC_DS2P_CharmedBolts_CreatingBolts);
	Joseph_CharmedBolts = C_GetTime_Plus(4,0,1);
	Joseph_CharmedBoltsCreated = FALSE;
	AI_StopProcessInfos(self);
};
	
// �����������, ���� ���� ����� "������������ �����", ������ ��������� � ������, � ������ ������ 4 �����
// nr = 1

instance DIA_Joseph_CharmedBolts_NotReady(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_CharmedBolts_NotReady_condition;	
	information = DIA_Joseph_CharmedBolts_NotReady_info;
	permanent = TRUE;
	important = TRUE;
	description = " ";
};

func int DIA_Joseph_CharmedBolts_NotReady_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_CharmedBoltsCreating) && (Joseph_CharmedBoltsCreated == FALSE)
		&& (Joseph_CharmedBolts < Wld_GetPassedTime(0)) && Npc_IsInState(self,ZS_Talk))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_CharmedBolts_NotReady_info()
{
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_NotReady_13_00");	//��� �� ������, ������� �����.
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "������������ �����", ������ ��������� � ������, � ������ ������ 4 �����
// nr = 1

instance DIA_Joseph_CharmedBolts_Ready(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_CharmedBolts_Ready_condition;	
	information = DIA_Joseph_CharmedBolts_Ready_info;
	permanent = FALSE;
	important = TRUE;
	description = " ";
};

func int DIA_Joseph_CharmedBolts_Ready_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_CharmedBoltsCreating) && (Joseph_CharmedBoltsCreated == FALSE)
		&& (Joseph_CharmedBolts >= Wld_GetPassedTime(0)))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_CharmedBolts_Ready_info()
{
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_Ready_13_00");	//��� �����.
	// ������� ����� � ��������� ������� � ������ ��
	CreateInvItems(self,ITRW_ADDON_MAGICOREBOLT,20);
	B_GiveInvItems(self,other,ITRW_ADDON_MAGICOREBOLT,20);
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_Ready_13_01");	//�����������, ��� � ���������, ������� �� ����, � ��� ������ ����� ������� � �� ���� ������� ������ ���-�� ���������.
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_Ready_15_02");	//������ � ��� ������. �������.
	Joseph_CharmedBoltsCreated = TRUE;
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� "�������"
// nr = 1

instance DIA_Joseph_SpecialAxe(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_SpecialAxe_condition;	
	information = DIA_Joseph_SpecialAxe_info;
	permanent = FALSE;
	description = "� ������, ��� �� ������ �������� �����-�� ������ ������.";
};

func int DIA_Joseph_SpecialAxe_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && (C_DIA_Greg_OurIdea_Know_AboutJoseph == TRUE))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_SpecialAxe_info()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_00");	//� ������, ��� �� ������ �������� �����-�� ������ ������. ������, ���������� �����������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_01");	//��� ��� ����� ���������, �?
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_02");	//������� ������. �� �� ������ �������, ����� �� ��������, ��� ��� ������� ����������.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_03");	//�������, � �����������, ��� ������ �����, �� ����������. ����, ������, ��? ��� ������ ������ ���, ��� ������ ��������� �� ������ �������. � ����� ���� ��� ����������?
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_04");	//� � ��� �������� ������ � ���� ���������� ���, ��� ������� � ��������� �����. �������� ���� ���-�� �������� �������� ����� ���������. � ���� ������ ������� ������ �� �������, ����� ������ ���� ��������.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_05");	//��, ��������� ���� � ��� �� ������ ������ �������� ��������, ��� ����� ���������. ����� ��� �� ����, ����� ������� ������� ���, � ��� �������� ����� ������� ���� �� �������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_06");	//�� ����������� ���� � ���� ����������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_07");	//�������! (�������) � ��� �� ����� ������� �������, ������� ��������� �� ����!
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_08");	//� ������ ����� �� �� ��� ��� �� ������� �����, � ������� ��������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_09");	//�����, � ��� ����� �� ����� �� ����� �������. ��� ���� � ���� ���� ��-���-��-��-���� ����, ����� ��� ����� ��������� �� ����!
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_10");	//� ��� �� ��� � �������������? ��� ���� ����� ���������� ����?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_11");	//�� ���, ���� � ���� ���� � � ��������� ������ � ����� ��������� � �������� ������� ����� ������, ����, ��� ������ ��� ���� ��������� �� �������. � ���� �������� ����� �����, ������� �� ������� �� ��������, �� ��������� � ��� � ���� ����� ������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_12");	//� ���� ������ ���� �� �������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_13");	//��� �����: ������ ��������� ������, �������� ����� ������� ������ � �������� ���������� ����.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_14");	//� ��������� �����-����� ����. � ����� ���� ��� ���������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_15");	//����� ������� ���� �� ����� ������� ���������� � ����, � �� ����� ������� ������ � �������. �� ��� � ���� ������� ������� �������, ������� �� ����������, ���� �� ��� �������� �����.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_16");	//� ������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_17");	//�������� ���� ������ ������� ����������� ����������, ���� ������ ������� ������� �� ��������. ������ ������� � � ���� �������� � ����� ������������� � ���� ������ ������. �� ����� ������ ������ ��������. 
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_18");	//�� ��������� ����: ���������� �� ��������� ���������� ���� ������ � ���������� ������� ������ ������, ������� �������� ����� ����������. 
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_19");	//�������, ��� ���������? � ���� ����������� ���� ������ �� ����, ���� ������. ����� ���� ��� �� ������� �������� � ������ ������ ����������� ��������. � ������ ������ �� ����� ������ ������ �� ������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_20");	//�, ������, ��� ���� ������ � ������ ������� �������� � ������ ������ ������ ������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_21");	//��, �� ������� ����� ���� ���������� �������, ������� ��� ������ ���������, ������ �����. ���� ���������� �������� �������� ����������� � ������� �������, �������� �������� ��� ��������.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_22");	//������� � ����������, �� ����� ���-�� ���� ��������. ������� �� � ��� �������������, �� ��������� ��� � ����� ���������. �����-�� � � �����, ��� ������ ������ ���������� � �������, ����� ��������� ���� ��������.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_23");	//����� ����� � � ����� ��������������� ���� �����, �� ��� � ��������� ����.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_24");	//�����, � ���� ������ ���� � ������� ����������� ������������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_25");	//��? �� ����� ���� ���?
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_26");	//��������� ������, ��� ���������� ���� �������� ����.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_27");	//��� �, � ��������. ������� ��� ������ ��������� ������, �������� ����� ������� ������ � �������� ���������� ����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_Start);
	Info_ClearChoices(DIA_Joseph_SpecialAxe);
	Info_AddChoice(DIA_Joseph_SpecialAxe,"� ���� ������ ��� ��������.",DIA_Joseph_SpecialAxe_NoQuestions);
	Info_AddChoice(DIA_Joseph_SpecialAxe,"��� ������� ������ ������?",DIA_Joseph_SpecialAxe_BlackTroll);
	Info_AddChoice(DIA_Joseph_SpecialAxe,"��� ��� ������ ��������� ������?",DIA_Joseph_SpecialAxe_StoneGolem);
	Info_AddChoice(DIA_Joseph_SpecialAxe,"��� ��� ����� �������� ���������� ����?",DIA_Joseph_SpecialAxe_Ore);
};

// �����������, ���� ������� ������� "��� ��� ����� �������� ���������� ����?" � ������� � ��������

func void DIA_Joseph_SpecialAxe_Ore()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_00");	//��� ��� ����� �������� ���������� ����?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_01");	//� ��������! (���� )��-��-��!
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_02");	//� ���� ��������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_03");	//� � ��������. ������ � �������� ����� ��������� ������������ ���������� ���� ���, ��� ��� �� ������ ����� ��������� �������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_04");	//�� �� �������� ������ ����. ��� ��� ����� ������� �������.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_05");	//��, ��� ��������. � ��������, ���� � ���� ����� ���������� ���������� ����, ��, �����, � ����� ���-������ ���������� �� ����� �������, ��� ��� ����������� �� �������� ����� �������. ������, �������� ���������� �� � ������� ������, �� ������� �������� � �� ����.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_06");	//��� ��� ������� ��� ������ �������� ���������� ����, � ������ � ���.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_07");	//�� �� �������, ��� � ���� ��� ���� ����.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_08");	//����� ����! ���� � ���� �������� ���������� ����, ����� �� ������� � ��������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_09");	//����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_AboutOre);
};

// �����������, ���� ������� ������� "��� ��� ������ ��������� ������?" � ������� � ��������

func void DIA_Joseph_SpecialAxe_StoneGolem()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_StoneGolem_15_00");	//��� ��� ������ ��������� ������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_StoneGolem_13_01");	//�������� �� ������-�������, ��� ��������� ���������, ��������� ������� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_AboutGolem);
};

// �����������, ���� ������� ������� "��� ������� ������ ������?" � ������� � ��������

func void DIA_Joseph_SpecialAxe_BlackTroll()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BlackTroll_15_00");	//��� ������� ������ ������?
	// UNFINISHED - ������� ��� ������� ������ ������
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BlackTroll_13_01");	//������ ��� ���� ���� ������� there.
	B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_AboutTroll);
};

// �����������, ���� ������� ������� "� ���� ������ ��� ��������." � ������� � ��������

func void DIA_Joseph_SpecialAxe_NoQuestions()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_NoQuestions_15_00");	//� ���� ������ ��� ��������.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_NoQuestions_13_01");	//�������-��! ������ �� ����� � � ���� ��� ���� ������� ������ ������.
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� "������ ����� ��� �������", � �� ����� ��� �����������
// nr = 1

instance DIA_Joseph_SpecialAxe_BringIngr(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_SpecialAxe_BringIngr_condition;	
	information = DIA_Joseph_SpecialAxe_BringIngr_info;
	permanent = FALSE;
	description = "� ��� ������.";
};

func int DIA_Joseph_SpecialAxe_BringIngr_condition()
{
	if ((MIS_DS2P_SpecialAxe4Joseph == Log_Running) && (SpecialAxe_FindAllIngr == TRUE)
		 && (Npc_HasItems(hero,ItMi_Nugget) >= 20) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1)
		 && (Npc_HasItems(hero,ItAt_DS2P_BlackTrollBone) >= 1))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_SpecialAxe_BringIngr_info()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_00");	//� ��� ������.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_01");	//�� �����?! �� ���� � ������!
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_02");	//���. ��� ������ ��������� ������.
	// ������ ������ �������
	B_GiveInvItems(other,self,ItAt_StoneGolemHeart,1);
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_03");	//��� �������� ����� ������� ������. ������� ���������, ����� � ����.
	// ������ ����� �������
	B_GiveInvItems(other,self,ItAt_DS2P_BlackTrollBone,1);
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_04");	//� ��� ����.
	// ������ ���� �������
	B_GiveInvItems(other,self,ItMi_Nugget,20);
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_05");	//����������! �� ������������� ��� ������! �� �����, ��� ��� ��������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_06");	//�� ���� �� ������, ��� ���������� ������ ��� �����������?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_07");	//�������! �������� ������ � �������� ��� ����� ������ ��������� ������ �� ���������� �������. � �� �� ������ ��� ������� ������, ������ �������� ����� ��������� ����� ��� ������ ��������� �����. �� � �� � �� ��� ������ ������ �� �������� ���������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_08");	//(�� �������) ��� ������, � ���� ���� �������� ��������� �����.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_09");	//���� �� ��������� �������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_10");	//���� �������. ����� ����� ����� �����?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_11");	//��� ����� ���. ����� ������ ������ �� ��������.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_12");	//����� ������ � �����?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_13");	//��, � ����� ���� � ������� ������ ����, �� � �� �� ������. ������� ����� ���� �����, �����, � ����� ������� ���������.
	Joseph_ReadyAxeTime = Wld_GetDay();
	AI_StopProcessInfos(self);
};

// ������������, ���� ������ ������ �� ������������ ������
// nr = 1

instance DIA_Joseph_ReadyAxe(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_ReadyAxe_condition;	
	information = DIA_Joseph_ReadyAxe_info;
	permanent = TRUE;
	description = "������?";
};

func int DIA_Joseph_ReadyAxe_condition()
{
	if ((MIS_DS2P_SpecialAxe4Joseph == Log_Running) && Npc_KnowsInfo(other,DIA_Joseph_SpecialAxe_BringIngr))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_ReadyAxe_info()
{
	AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_00");	//������?
	if (Joseph_ReadyAxe == FALSE) // ���� ������ ������ 2 ����
	{
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_01");	//��� ���, ������� �����.
		AI_StopProcessInfos(self);
	}
	else // ���� ������ ������ 2 ����
	{
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_02");	//(���������) ��. ��������, ������, ������� ����������, ����� �������� ������������� ������ ������, � ����� ���������� ����� ������ � �� ������ ��� ������ ��� ������� ���� ��������.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_03");	//��������?
		// ������ ������� ����� � ����������� ���
		AI_ReadyMeleeWeapon(self);
		AI_PlayAni(self,"T_1HSINSPECT");
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_04");	//�� ��������, ����� �������! ������� ������ ������ ������, � ���� ���� ������ �������� � �� ���� ���� ��� �� ��� �����. ���� �������� �� ��������! � ������ �������� ������� ����������� ����� ������.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_05");	//��� ���� ��� ���� �� ��������� ������, ��� ��������� ��� �������� ������� ������ ������ � ���������� �����������.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_06");	//���, �������� � ��������� ����� ��� �������.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_07");	//��, ��� ��� ��������� ��������. ������ ���������� � ����� ������ ��� �������� �����.
		// ������ ������� �����
		AI_RemoveWeapon(self);
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_08");	//����� ������������� ��������� ������ ����������.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_09");	//��, ��� ������ ������, ������� � �����-���� �����. ���� ��� � �������� ��������� ��� ������, �� ������ ����������� �������, ������ �����.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_10");	//� �� �� ����� ��������� ��� ����� ������.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_11");	//��� ����, �� ����. �� �������� � ������ ��������. ����� �� ������� ��� ������� ���� �����? ������ �� ������, ��� ���� ��� ������ ��������������, ������� �� ������ � �� ������� ��������� � ��������� �� ���.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_12");	//����� ���� � ��������� � ������, � �� ������, ��� ������ �� ������� ���� ��� ��, ��� ������ �������� ������ �����. ��������, ��� � ��� �������, �� �� �� �������� ����. ��� ���� ����� �� ����?
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_13");	//(��������) �����, ����� ��� ����. ���� ���������� �������� ����� �������, ����� �������� ����� � ����� ��������, ��� ����� ���� �����.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_14");	//��, �� �����, ��� ������� ���, ���  ���� ����� ����. ����� �� � ���� ������, �� �� ����� ���� �� ������ �����.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_15");	//��� �������?
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_16");	//���� �� �� ������ �� ��� � ���� ����� ���� ������, �� � �� ����� ���� ���������. �� ������, ����� ��� ����� ������������ �����, � ���������, ���� ���� ������ ����� ����� ���������.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_17");	//�� �� ����� ������ �������, �� � ���� �������� ���� ����� �����. ��� ��� ��,  ����� ���� ����� �� �����. �� ������ �� �������� ������ ����� ������ ������� � �� ���� ��� ��� ����� ��������.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_18");	//��������!
		B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Success,TOPIC_DS2P_SpecialAxe4Joseph_Success);
		Joseph_InConspiracy = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_JosephIn);
		B_GivePlayerXP(XP_MIS_DS2P_SpecialAxe4Joseph);
		AI_StopProcessInfos(self);
	};
};