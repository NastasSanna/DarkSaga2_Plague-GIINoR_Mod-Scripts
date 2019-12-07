instance DIA_Tom_EXIT(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Tom_EXIT_Condition;	
	information = DIA_Tom_EXIT_Info;
	description = Dialog_Ende;
};

func int DIA_Tom_EXIT_Condition()
{	
	return TRUE;
};

func void DIA_Tom_EXIT_Info()
{	
	AI_StopProcessInfos(self);
};

// ������� �����
// nr = 1

instance DIA_Tom_Hello(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Tom_Hello_Condition;	
	information = DIA_Tom_Hello_Info;
	description = "������";
};

func int DIA_Tom_Hello_Condition()
{
	return TRUE;
};

func void DIA_Tom_Hello_Info()
{
	AI_Output(other,self,"DIA_Tom_Hello_15_00"); //������. �� ���?
	AI_Output(self,other,"DIA_Tom_Hello_17_01"); //������. ���� ����� ���, � �������. � ��, � ������, ������� �� �������?
	AI_Output(other,self,"DIA_Tom_Hello_15_02"); //��.
	AI_Output(self,other,"DIA_Tom_Hello_17_03"); //���� �� ������ ��� ������ �������� ������ ���� ��������!
	AI_Output(other,self,"DIA_Tom_Hello_15_04"); //���� ��� �� ��������. �� ������� ���� � �����, ��� ����������� � ����, ������� ����������. � ������ ��� ���������.
	AI_Output(self,other,"DIA_Tom_Hello_17_05"); //����! � ��������� ����� ������� ���� ���� ������.
};

// ������������ ����� ������� � ����� "������."
// nr = 1

instance DIA_Tom_CanIHelp(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Tom_CanIHelp_Condition;	
	information = DIA_Tom_CanIHelp_Info;
	description = "���� � ���-�� ������?";
};

func int DIA_Tom_CanIHelp_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_Hello))
	{
		return TRUE;
	};
};

func void DIA_Tom_CanIHelp_Info()
{
	AI_Output(other,self,"DIA_Tom_CanIHelp_15_00"); //���� � ���-�� ������?
	AI_Output(self,other,"DIA_Tom_CanIHelp_17_01"); //������-�� ������. ��, ��� � �������, ������ ��������� ������ � �������, ��� ��� � ����.
	AI_Output(other,self,"DIA_Tom_CanIHelp_15_02"); //�� ������ �������� ��������?
	AI_Output(self,other,"DIA_Tom_CanIHelp_17_03"); //��� ���� �� �������, �� ���������, ���� ��� ������������ ��������� � ������� � �����, �� �����. ���, � ����, ����� �� ������� ���� ���� ���� ������ �� ����.
	AI_Output(other,self,"DIA_Tom_CanIHelp_15_04"); //�����. ����� ����.
	AI_Output(self,other,"DIA_Tom_CanIHelp_17_05"); //������.
	// ������� ������ � ��������� ����
	CreateInvItems(self,ITWr_DS2P_LylyWriting,1);
	B_UseFakeScrollTime(3);
	AI_Output(self,other,"DIA_Tom_CanIHelp_17_05"); //���, �����. ������ ����� ����� ��� ���������, � �� ����� ���� �����������, ��� � ��� �������, ���� ������ ��� ��� ��� ������.
	// ������ ������ ��
	B_GiveInvItems(self,other,ITWr_DS2P_LylyWriting,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_TomsLetter,LOG_MISSION,LOG_Running,TOPIC_DS2P_TomsLetter_Start);
	B_StartOtherRoutine(Lulu,"GONE");
	AI_StopProcessInfos(self);
};

// ������������ ����� ������� � ����� "������."
// nr = 2

instance DIA_Tom_WhoIsTeacher(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Tom_WhoIsTeacher_Condition;	
	information = DIA_Tom_WhoIsTeacher_Info;
	description = "��� ���� ����� ����� ����-������ �������?";
};

func int DIA_Tom_WhoIsTeacher_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_Hello))
	{
		return TRUE;
	};
};

func void DIA_Tom_WhoIsTeacher_Info()
{
	AI_Output(other,self,"DIA_Tom_WhoIsTeacher_15_00"); //��� ���� ����� ����� ����-������ �������?
	AI_Output(self,other,"DIA_Tom_WhoIsTeacher_17_01"); //� ���� ������� ���� ����������� ������. ���� � ������� �������, � ����� �������� ���� ���������� �� ��������� ��������, ����� �� ������������ ��������.
	AI_Output(self,other,"DIA_Tom_WhoIsTeacher_17_02"); //������ � ������� ������, �� ���������� � ��������� ������ ���� ���� � ���� �����, � ���� �� �� ���������, �� ���� ���� ��� �������. ���� �������� ������� ����������� ������. ����� ���� ��������� ������� ��������, ���� ����� ������, � ���� �� ����� ��������.
};

// ������������ ����� ������� � ����� "��� ���� ����� ����� ����-������ �������?"
// nr = 2

instance DIA_Tom_TeachMe(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Tom_TeachMe_Condition;	
	information = DIA_Tom_TeachMe_Info;
	description = "����� ���� ����������� ������.";
};

func int DIA_Tom_TeachMe_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_WhoIsTeacher))
	{
		return TRUE;
	};
};

func void DIA_Tom_TeachMe_Info()
{
	AI_Output(other,self,"DIA_Tom_TeachMe_15_00"); //����� ���� ����������� ������.
	AI_Output(self,other,"DIA_Tom_TeachMe_17_01"); //������, �� ������������� ����� � 100 ������� � ����� ����.
};

// ������������, ���� ��� �������� � �� 100 ������� �� ��������, � � �� ��� ����
// nr = 2

instance DIA_Tom_PayForTeach(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Tom_PayForTeach_Condition;	
	information = DIA_Tom_PayForTeach_Info;
	description = "��� ������.";
};

func int DIA_Tom_PayForTeach_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_TeachMe) && Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		return TRUE;
	};
};

func void DIA_Tom_PayForTeach_Info()
{
	AI_Output(other,self,"DIA_Tom_PayForTeach_15_00"); //��� ������.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Tom_PayForTeach_17_01"); //��������� � ����� �����.
	B_DSG_Log_OpenClose(TOPIC_TeacherOther,LOG_NOTE,-1,"��� ���������� ����� ���� �������� ������.");
};

// ������������, ���� �� �������� �� ��������
// nr = 2

instance DIA_Tom_Teaching(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = TRUE;
	condition = DIA_Tom_Teaching_Condition;	
	information = DIA_Tom_Teaching_Info;
	description = "����� ���� ����������� ������.";
};

func int DIA_Tom_Teaching_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_PayForTeach))
	{
		return TRUE;
	};
};

// UNFINISHED -  ���� ������ �������?

func void DIA_Tom_Teaching_Info()
{
	AI_Output(other,self,"DIA_Tom_TeachMe_15_00"); //����� ���� ����������� ������.
	if ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE))
	{
		Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("�������� �����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Tom_Teaching_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("�������� ������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Tom_Teaching_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("������ ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Tom_Teaching_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("���� �������� ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Tom_Teaching_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("������ �������� ����",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Tom_Teaching_BFWing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Tom_Teaching,B_BuildLearnString("��� ���������� ��������",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Tom_Teaching_DSHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Tom_Teaching_17_00"); //������ �� ���� ��������� ��������� � ��� ������ ������ ���� �����. � ������ ����� � ������� ���� ����������, ����� ��������� ������.
	};
};

func void DIA_Tom_Teaching_Back()
{
	Info_ClearChoices(DIA_Tom_Teaching);
};

func void DIA_Tom_Teaching_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

func void DIA_Tom_Teaching_DSHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		//
	};
	Info_ClearChoices(DIA_Tom_Teaching);
	Info_AddChoice(DIA_Tom_Teaching,Dialog_Back,DIA_Tom_Teaching_Back);
};

// ������������, ����� ������� � �������� ������ ������
// nr = 1

instance DIA_Tom_PiratePatrolPlan(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Tom_PiratePatrolPlan_Condition;	
	information = DIA_Tom_PiratePatrolPlan_Info;
	description = " ";
};

func int DIA_Tom_PiratePatrolPlan_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Gustav_CanIHelp))
	{
		return TRUE;
	};
};

func void DIA_Tom_PiratePatrolPlan_Info()
{
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_00"); //���� ��� � ���. ��� ��� �� ���� �� ����� ���������� �� ���������� �������, ���� ������� ���, ����� �� ��� ��� ������� �����, �������.
	AI_Output(other,self,"DIA_Tom_PiratePatrolPlan_15_01"); //������ ��������� �� ��� ������?
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_02"); //��. �� ������ �� �� ���������. ������ �� �������� ��������� ������ � � ���� �� ���� �������� ����� ���, ���� ��������. �� �������� ���?
	AI_Output(other,self,"DIA_Tom_PiratePatrolPlan_15_03"); //�������, �� ��� �� �������� � ��� ������?
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_04"); //���, ����� ���� ���. �, ���� � ���� ����� ����� ������ �� ������� ����, � �� �� ������� �������. ������ �������� � ��� ����� �� �����, � ��� �������. ��� ���� ������ ������� ��������� �� ��������� ��������, ��������� �� ������.
	CreateInvItems(self,ItMi_DS2P_TomHorn,1);
	B_GiveInvItems(self,other,ItMi_DS2P_TomHorn,1);
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_05"); //������ �� ������� ��� � ���� ��� � ���� ����, ������ ���. ��� � ������� ������ �������� ���������� ��� ����, ������� �� � ����� �������� ������. ���������� ����?
	AI_Output(other,self,"DIA_Tom_PiratePatrolPlan_15_06"); //��� �������. ������ �����, �����.
	AI_Output(self,other,"DIA_Tom_PiratePatrolPlan_17_07"); //�������, ����� ������ �������. � ������ ����� ����� ����� ����.
	AI_Output(other,self,"DIA_Tom_PiratePatrolPlan_15_08"); //������, � �����.
	B_StartOtherRoutine(self,"WAITINIG_PIRATEPATROL");
	B_DSG_Log_OpenClose(TOPIC_DS2P_PiratesPatrol,LOG_MISSION,Log_Running,TOPIC_DS2P_PiratesPatrol_Start);
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "������� �������" � �� ������ � ���������� 19:00 - 20:00
// nr = 1

instance DIA_Tom_PiratePatrol_Begining(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	important = FALSE;
	condition = DIA_Tom_PiratePatrol_Begining_Condition;	
	information = DIA_Tom_PiratePatrol_Begining_Info;
	description = "� ������.";
};

func int DIA_Tom_PiratePatrol_Begining_Condition()
{
	if ((MIS_DS2P_PiratesPatrol == Log_Running) && Wld_IsTime(19,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Tom_PiratePatrol_Begining_Info()
{
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Begining_15_00"); //� ������.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Begining_17_01"); //����. �����?
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Begining_15_02"); //��, ����� ������� ���� ������� ������, ��� ��� ������������ ��� ���������� ����.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Begining_17_03"); //(���������) ��� �������� ���� �������. �� ����!
	B_StartOtherRoutine(self,"ATTACK_PIRATEPATROL");
	AI_StopProcessInfos(self);
};

// �����������, ����� �� � ��� ������� ����� � �������
// nr = 1

instance DIA_Tom_PiratePatrol_Cont_01(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Tom_PiratePatrol_Cont_01_Condition;	
	information = DIA_Tom_PiratePatrol_Cont_01_Info;
	description = " ";
};

func int DIA_Tom_PiratePatrol_Cont_01_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_PiratePatrol_Begining) && Hlp_StrCmp(Npc_GetNearestWP(self),"TEST_WAYPOINT")) //UNFINISHED �������� WayPoint
	{
		return TRUE;
	};
};

func void DIA_Tom_PiratePatrol_Cont_01_Info()
{
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Cont_01_17_00"); //������ ��� ��� ����� �����?
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Cont_01_15_01"); //����.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Cont_01_17_02"); //������ �� � ������ ������� � ����� � ���, ������� � ���� ���. �� ���� � ������� ������� ���� ���� � ������ �������. ���� ������ ������� ����������� � ���� ������, �� � ��� �� ����� ������� ������ �� �����. �������?
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Cont_01_15_03"); //��.
	PiratePatrol_Success = TRUE;
	AI_StopProcessInfos(self);
};

// ������������, ���� ������ ������, � ���� ����� �� ����, ��� �� ������� ������

instance DIA_Tom_PiratePatrol_Failed(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Tom_PiratePatrol_Failed_Condition;	
	information = DIA_Tom_PiratePatrol_Failed_Info;
	description = " ";
};

func int DIA_Tom_PiratePatrol_Failed_Condition()
{
	//if (Npc_IsDead(PIR_001_Patrol) && Npc_IsDead(PIR_002_Patrol) && (PiratePatrol_Success == FALSE))
	//{
	//	return TRUE;
	//};
};

func void DIA_Tom_PiratePatrol_Failed_Info()
{
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Failed_17_00"); //����! ������ ���� ������ ��� ������� ��. �� ��� �������� � ������ ���� ������ ��������� ��� �������.
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Failed_15_01"); //������, ��� �� �������, ��� ��� ����������.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Failed_17_02"); //���������! �������, ��� ���������.
	AI_StopProcessInfos(self);
};

instance DIA_Tom_PiratePatrol_Success(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 2;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Tom_PiratePatrol_Success_Condition;	
	information = DIA_Tom_PiratePatrol_Success_Info;
	description = " ";
};

func int DIA_Tom_PiratePatrol_Success_Condition()
{
	//if (Npc_IsDead(PIR_001_Patrol) && Npc_IsDead(PIR_002_Patrol) && (PiratePatrol_Success == TRUE))
	//{
		return TRUE;
	//};
};

func void DIA_Tom_PiratePatrol_Success_Info()
{
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Success_17_00"); //���! ��� ����������!
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Success_15_01"); //��, ���� � �� �����, ��� ��� ������ ��������� �����.
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Success_17_02"); //(������) ���� �����, � ���� �� �����. ������, ������� ������ ������ �������� ������ � ������ �����? ����� ���� ����� ������� ������� � ������� ���� ���� ��� ���������.
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Success_15_03"); //��� �� ��� ������� ��������� �� �� �������?
	AI_Output(self,other,"DIA_Tom_PiratePatrol_Success_17_04"); //���������� ������ �� ����� ���� �� ������ �������� ���� ������ ������� ���� �� ����� ����������.
	AI_Output(other,self,"DIA_Tom_PiratePatrol_Success_15_05"); //(�������) ������ � ���������!
};

instance DIA_Tom_BringBackHorn(C_Info)
{
	npc = BAU_114_DS2P_Tom;
	nr = 1;
	permanent = FALSE;
	important = FALSE;
	condition = DIA_Tom_BringBackHorn_Condition;	
	information = DIA_Tom_BringBackHorn_Info;
	description = "���, ������ ���� ����-���.";
};

func int DIA_Tom_BringBackHorn_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Tom_PiratePatrol_Success))
	{
		return TRUE;
	};
};

func void DIA_Tom_BringBackHorn_Info()
{
	AI_Output(other,self,"DIA_Tom_BringBackHorn_15_00"); //���, ������ ���� ����-���.
	AI_Output(self,other,"DIA_Tom_BringBackHorn_17_01"); //�������, �� �������� �� �������� �������� ��������. � �� ������������ ������� �� ���� �����. �� ��, �������, � ��� ����������, �� � ����� ��� ���� �����.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	//B_GivePlayerXP(100);
	//Npc_ExchangeRoutine
	B_DSG_Log_OpenClose(TOPIC_DS2P_PiratesPatrol,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_PiratesPatrol_Success);
};
	