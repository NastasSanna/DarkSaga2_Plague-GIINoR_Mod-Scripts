instance DIA_Skip_EXIT(C_Info)
{
	npc = DS_22_SKIP;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Skip_EXIT_condition;	
	information = DIA_Skip_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Skip_EXIT_condition(){	return TRUE;};
func void DIA_Skip_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Skip_Start(C_Info)	//��������� ������ �� �������
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_Start_condition;	
	information = DIA_Skip_Start_info;
	description = "��� �� ��� �������?";
};
func int DIA_Skip_Start_condition(){	return TRUE;};
func void DIA_Skip_Start_info()
{
	AI_Output(other,self,"DIA_Skip_Start_15_00");	//��� �� ��� �������?
	AI_Output(self,other,"DIA_Skip_Start_08_01");	//(�������) ����! ���� ���������?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(other,self,"DIA_Skip_Start_15_02");	//��� �� �������� �� �������? � ������ �� �������?
	AI_Output(self,other,"DIA_Skip_Start_08_03");	//������� ����� �������� ��� ����� �������. ������ ��� �� ������?
	AI_Output(other,self,"DIA_Skip_Start_15_04");	//���, ��� �� �����������. � ������, ��� �� ������� ����. ��� �� ������ ����� � ����� ��������� ������.
	AI_Output(other,self,"DIA_Skip_Start_15_05");	//������, ��� �� ��������� �� ��������?
	AI_Output(self,other,"DIA_Skip_Start_08_06");	//(����������) ����� �������... � �� ��� ������ ��������, � �����.
	AI_Output(other,self,"DIA_Skip_Start_15_07");	//� ������ �� �����...
	AI_Output(self,other,"DIA_Skip_Start_08_08");	//(����������) �����, ��� ���� ���������. � �� ���� ��, ����� ���� ����������...
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"RunAway");	//������� ������ � ���-�� ��������
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldAcquaintance_Start);
};

// ������������ ����� ����, ��� ���� ������

instance DIA_Skip_FindYou(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_FindYou_condition;	
	information = DIA_Skip_FindYou_info;
	description = "�������!";
};

func int DIA_Skip_FindYou_condition()
{
	//UNFINISHED
	return TRUE;
};

func void DIA_Skip_FindYou_info()
{
	AI_Output(other,self,"DIA_Skip_FindYou_15_00");	//���! �������!
	AI_Output(self,other,"DIA_Skip_FindYou_08_01");	//����! ��� �� ���� �����?
	AI_Output(other,self,"DIA_Skip_FindYou_15_02");	//��� ���� �� ���-�� ������. �� ������ ��� �������� � ���������� �����. ���������� �� ������ ���� ����� � ����.
	AI_Output(self,other,"DIA_Skip_FindYou_08_03");	//���������! ���� ���-�� ������. ��� ������ ����� ������� �������.
};
	
// ������������ ����� ����, ��� �� ������ �������������� ����������� "��������"

instance DIA_Skip_IMeetGreg(C_Info)
{
	npc = DS_22_SKIP;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Skip_IMeetGreg_condition;	
	information = DIA_Skip_IMeetGreg_info;
	description = "� �������� �����.";
};

func int DIA_Skip_IMeetGreg_condition()
{
	// UNFINISHED
	return TRUE;
};

func void DIA_Skip_IMeetGreg_info()
{
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_00");	//� �������� �����.
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_01");	//(������) ��? � ��� �� ������?
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_02");	//�� ������ �������� ��������: ����� ��������� ��� � ���� ������ ����� �������, �� ���� � ����� ���� � ������ ���������� ������� �����������
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_03");	//��� � ����! ���� � ���� ���-�� ������. � �� ���� ������� ��� ��� ������� ����.
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_04");	//� ��� ���������-��?
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_05");	//�� ��� � �������, ����� ���� ����� ���������� �����. ���������, ��� ���������� ������� ��������� � ��� � ����, ��� � ���� ����� �� ����� ���������. ������ �� ����� ��� �������� �� �����. � ��� ���� ����. ������ �������.
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_06");	//� ��� �� ������ ������ ������?
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_07");	//���� �� ����. ��� ���� ����������� ���-������, ��� ���� ���� ����� �� ������. � ����, �������, ��� ����������� ����� �� �������?
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_08");	//���.
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_09");	//����. ������, ���� ��� ������. ���� ����� ������� �� ������ ����� � ����� ���.
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_10");	//� ������� ����� �� �������?
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_11");	//��� ��! ���� � �������� ��� �� �����, ��� �� ����� �� ������ � ���� �����. ������, � ������.
};	
	
// ������������ ����� ����, ��� �� ���������� ������ "� �������� �����."

instance DIA_Skip_WhatAreYouDo(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_WhatAreYouDo_condition;	
	information = DIA_Skip_WhatAreYouDo_info;
	description = "��� ������ ������?";
};

func int DIA_Skip_WhatAreYouDo_condition()
{
	if (Npc_KnowsInfo(other,DIA_Skip_IMeetGreg))
	{
		return TRUE;
	};
};

func void DIA_Skip_WhatAreYouDo_info()
{
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_00");	//��� ������ ������?
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_01");	//���������. �� ��� ��� ���� �� �� �������, ���� �� �������. ������ � ������.
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_02");	//����� ����� ����.
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_03");	//������� ������, �� ������ ��� ������?
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_04");	//������ � ���.
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_05");	//� ���� ��������� � �����, �� �����. ���� �� ������� ������.
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_06");	//��� �� ����-�� �� ������?
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_07");	//� �����, ���� ������� ��� ����� ���� ������� ����.
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_08");	//� ��� � ��� ������? � ���� ������ � ��� �� ����� ������������� ���������.
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_09");	//� �� ����, ���, �� ������, ����������. � ����� �� ��������. � �� ���������, ����� ����� �������, ����� ���������� ������ �� ������ �������.
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_10");	//������, � ��������, ��� ����� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldAcquaintance_Start);
	AI_StopProcessInfos(self);
};
	
// ������������ ����� ����, ��� �� ���������� ������ "��� �� ������ ������?" � ���� ����� "�������"

instance DIA_Skip_News(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_News_condition;	
	information = DIA_Skip_News_info;
	description = "� ���� ��� ���� �������.";
};

func int DIA_Skip_News_condition()
{
	if (Npc_KnowsInfo(other,DIA_Skip_WhatAreYouDo) && (MIS_DS2P_Conspiracy == Log_Running) && (MIS_DS2P_OldAcquaintance == Log_Running))
	{
		return TRUE;
	};
};	
	
func void DIA_Skip_News_info()
{
	AI_Output(other,self,"DIA_Skip_News_15_00");	//� ���� ��� ���� �������.
	AI_Output(self,other,"DIA_Skip_News_08_01");	//������.
	Info_ClearChoices(DIA_Skip_News);
	if (Conspiracy_Alternative == TRUE) // ���� ���� �����
	{
		Info_AddChoice(DIA_Skip_News,"���� �����.",DIA_Skip_News_GregIsDead);
	}
	else
	{
		Info_AddChoice(DIA_Skip_News,"�� � ������ ����� �������� ����� �� ������ �������.",DIA_Skip_News_Conspiracy);
	};
};

func void DIA_Skip_News_GregIsDead()
{
	AI_Output(other,self,"DIA_Skip_News_GregIsDead_15_00");	//���� �����.
	AI_Output(self,other,"DIA_Skip_News_GregIsDead_08_01");	//���? ��� ��� ���������?
	AI_Output(other,self,"DIA_Skip_News_GregIsDead_15_02");	//�� ����� �����.
	AI_Output(self,other,"DIA_Skip_News_GregIsDead_08_03");	//�������! ������, � ���� ��������� � �����. ���, ������ ������� ������ �� ������� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,Log_Mission,Log_Success,TOPIC_DS2P_OldAcquaintance_GregIsDead);
	B_StartOtherRoutine(self,"AFTERQUEST");
	B_GivePlayerXP(XP_MIS_DS2P_OldAcquaintance);
	// ������� 150 ������� � ������ ��
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_News_Conspiracy()
{
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_00");	//�� � ������ ����� �������� ����� �� ������ �������.
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_01");	//��� ��� ��������? �� ����� ���� ������ ������ ������� ����������, � ��� ���� �� ������.
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_02");	//� ��� ��������, ��� ��� ����� ������������ ���� ������.
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_03");	//��� ���� ������?
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_04");	//���, ��� � ������. ���� �� ��� �������� � ������������ �� �����, �� ������ �����������, ��� �� ���� �������.
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_05");	//�� � ���� ������? �� �������� �� ���������.
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_06");	//�� ����� ���� ���, �� ���� ���������� � ������ � �������, ��� �� �� ���, �� ��, �����, � ������ ���� �� �������.
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_07");	//��� ����! ����� ������! �����, ����� ���, ��� ���� �� ������� �������� ���� � �����, �� � ���������� �� ���� �� ������.
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_08");	//� � ���� �� ����� �������� ���, ����� ����, ��� ������� ��� ������ �����?
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_09");	//������, � ��� ����� ��������� � � ������ ���������� ������ ����. �� ������, ������� � ��� ��������� �� ����? ��� � � ��� �� ����� ������, ��� ��� ����� ��������.
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_10");	//����� � ������� ����� ���� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,Log_Mission,Log_Running,TOPIC_DS2P_OldAcquaintance_SkipHelps);
	AI_StopProcessInfos(self);
};
	
// ������������ ����� ����, ��� �� ��������� ����� � ������ �����

instance DIA_Skip_HowAreYou(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Skip_HowAreYou_condition;	
	information = DIA_Skip_HowAreYou_info;
	description = "��� ����?";
};

func int DIA_Skip_HowAreYou_condition()
{
	if (MIS_DS2P_OldAcquaintance == Log_Success)
	{
		return TRUE;
	};
};

func void DIA_Skip_HowAreYou_info()
{
	AI_Output(other,self,"DIA_Skip_HowAreYou_15_00");	//��� ����?
	if (Conspiracy_Alternative == TRUE)
	{
		AI_Output(self,other,"DIA_Skip_HowAreYou_08_01");	//�������. �������� ��������� �������. ������, ����� ����� ���, ����� ��������� � ���������� ����� � �� ������������ � ������ �� ��������.
		AI_Output(self,other,"DIA_Skip_HowAreYou_08_02");	//���� �� �� ��� ����� �������� � ����� ������������ �������, � �� ������, ��� ��� ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Skip_HowAreYou_08_03");	//�� ��� ������, ��� �������� ��, �� ��� �����, ��� �������. ���� ���� � �� � �������� �� ����� �����������, �� ����� ������.
	};
};
	
// ������������ ����� ����, ��� ���� ���������� �������� �����

instance DIA_Skip_GregAccept(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_GregAccept_condition;	
	information = DIA_Skip_GregAccept_info;
	description = "���� ��������. ";
};

func int DIA_Skip_GregAccept_condition()
{
	if ((MIS_DS2P_OldAcquaintance == Log_Running) && Npc_KnowsInfo(other,DIA_Greg_SkipHelps))
	{
		return TRUE;
	};
};

func void DIA_Skip_GregAccept_info()
{
	AI_Output(other,self,"DIA_Skip_GregAccept_15_00");	//���� ��������. �� ������, ��� ���� �� ������������ �� ����, �� �� ������� ���� � �����. �� �� ��������, ��� �� ��������� ��� ���� ������ ������, ���� ������� ��� ��� ���.
	AI_Output(self,other,"DIA_Skip_GregAccept_08_01");	//��� �, ���� �� ������������� ����� � ���� ����, � � ���������� ���� �� ����. ���, ��� ���� �� ���� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Running,TOPIC_DS2P_Conspiracy_SkipIn);
	Skip_InConspiracy = TRUE;
	B_StartOtherRoutine(self,"AFTERQUEST");
	// ������� 200 ������� � ������ ��
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_StopProcessInfos(self);
};

// ������������ ����� ����, ��� "�������" �������� � ���� �����

instance DIA_Skip_ConspiracyOver(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Skip_ConspiracyOver_condition;	
	information = DIA_Skip_ConspiracyOver_info;
	description = " ";
};

func int DIA_Skip_ConspiracyOver_condition()
{
	if ((MIS_DS2P_OldAcquaintance == Log_Running) && (MIS_DS2P_Conspiracy == Log_Success) && Conspiracy_IsStarted
		&& Npc_IsInState(self,ZS_TALK))
	{
		return TRUE;
	};
};

func void DIA_Skip_ConspiracyOver_info()
{
	TRIA_Start();
	TRIA_Invite(Greg);
	TRIA_Invite(Skip);
	AI_GotoNpc(Greg,Skip);
	TRIA_Next(Skip);
	AI_Output(self,other,"DIA_Skip_ConspiracyOver_08_00");	//���, ������� ��� �����������, � �� ��� ��� ����?
	AI_Output(other,self,"DIA_Skip_ConspiracyOver_15_01");	//���� � ���� ����.
	AI_Output(self,other,"DIA_Skip_ConspiracyOver_08_02");	//������ ������, � ���� ������� ����������, ��� ���� ����� �������.
	AI_Output(other,self,"DIA_Skip_ConspiracyOver_15_03");	//� �� �� ��������� ������������� �� ������� �����?
	AI_Output(self,other,"DIA_Skip_ConspiracyOver_08_04");	//(�������) ���� �� ��� �� ������� ���������� �������������. ���� ���� ��������, ����� ������� ���� ��� ������ ����. �� ����� �� �������.
	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Skip_ConspiracyOver_11_05");	//��� �� ���� �� � � ����� ����������, ��� ���������� ����. � ������, ��� �� ���� ����, �� �� ������, ��� �� ���������� ����� � ��������.
	Skip_GregFight = self.attribute[ATR_HITPOINTS_MAX]; // ������ ���, ����� ���� ���� � ������ �����
	self.attribute[ATR_HITPOINTS_MAX] = 1;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	B_Attack(Greg,Skip,AR_NONE,0);
	DIAG_Reset();
//???	TRIA_Next();
	AI_StopProcessInfos(self);
};

// ������������ ����� ����, ��� ���� ������ �����

instance DIA_Skip_SkipIsDown(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Skip_SkipIsDown_condition;	
	information = DIA_Skip_SkipIsDown_info;
	description = " ";
};

func int DIA_Skip_SkipIsDown_condition()
{
	if (Skip_IsGregFight == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Skip_SkipIsDown_info()
{
	AI_Output(self,other,"DIA_Skip_SkipIsDown_08_00");	//��� ������ � ����, ��� ��� ��� ����, �������� � ����� ����. ��, ������, ��� ���� ����� �������. ���� � ����� �� ������, ��� ��� ����, ��� �� ������ ���� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,Log_Mission,Log_Success,TOPIC_DS2P_OldAcquaintance_Success);
	B_GivePlayerXP(XP_MIS_DS2P_OldAcquaintance);
	B_StartOtherRoutine(self,"AFTERQUEST");
	AI_StopProcessInfos(self);
};
	