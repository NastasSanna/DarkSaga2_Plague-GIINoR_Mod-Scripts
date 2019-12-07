instance DIA_Gustav_EXIT(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Gustav_EXIT_Condition;	
	information = DIA_Gustav_EXIT_Info;
	description = Dialog_Ende;
};

func int DIA_Gustav_EXIT_Condition()
{	
	return TRUE;
};

func void DIA_Gustav_EXIT_Info()
{	
	AI_StopProcessInfos(self);
};

instance DIA_Gustav_CanIHelp(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Gustav_CanIHelp_Condition;	
	information = DIA_Gustav_CanIHelp_Info;
	description = "���� � ���-�� ������?";
};

func int DIA_Gustav_CanIHelp_Condition()
{
	return TRUE;
};

func void DIA_Gustav_CanIHelp_Info()
{
	AI_Output(other,self,"DIA_Gustav_CanIHelp_15_00"); //���� � ���-�� ������?
	AI_Output(self,other,"DIA_Gustav_CanIHelp_17_01"); //�����, ��. ���� ���� ����, � ������� ��� ��� ���� ����� ������ ��������.
	AI_Output(other,self,"DIA_Gustav_CanIHelp_15_02"); //��� �� ����?
	AI_Output(self,other,"DIA_Gustav_CanIHelp_17_03"); //������� � ���� �������� ������� �������. ������ ��� ���� ������ ����������, ��, ���� �������, ����� �������� ��������� �� ���. ��, �������, ���������, �� �����, �����, ����� ���������� ���� ������ � �����.
	AI_Output(other,self,"DIA_Gustav_CanIHelp_15_04"); //�� ������, ����� ��� ������ �?
	AI_Output(self,other,"DIA_Gustav_CanIHelp_17_05"); //�� ������. ��� �������� ���� ����. ��-�� ���� ��� � ���������.
	AI_GotoNpc(Tom,other); // ��� ��������� � ��
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "����� ��������� ���������"

instance DIA_Gustav_GardWantsKillYou(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Gustav_GardWantsKillYou_Condition;	
	information = DIA_Gustav_GardWantsKillYou_Info;
	description = "� ��� ��������.";
};

func int DIA_Gustav_GardWantsKillYou_Condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && !Npc_IsDead(Jinn))
	{
		return TRUE;
	};
};

func void DIA_Gustav_GardWantsKillYou_info()
{
	TRIA_Start();
	TRIA_Invite(Jinn);
	TRIA_Invite(Gustav);
	TRIA_Next(Gustav);
	AI_TurnToNpc(Jinn,other);
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_00"); //� ��� ��������.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_01"); //���� ���� ����� � ��������� ����� � ��� �������� ��������! � ��� ����� �� ���. ��� ��� ���?
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_02"); //���� ������ ���� � ����� ��������� � ����� ���, � ����� ����� � �������� ���� ������ ��� �� ��������. ����� ��� ���������� ���������� �����. � ��� � �����.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_03"); //���������! ���� ���-�� ������ � ���� ��������. � ��� �������, ��� �� �� ������ ��� �������, ��� ��������� ��� ��� ����. �����?
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_04"); //��. � �������, ���, ����� ����, �� ���-������ ����������.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_05"); //��� �� ����� ��������� � ���� ��������? � ��� ��� � ������� ������� �������� �����, ������� ����� ���� �� �������� ����� ������������ �������.
	TRIA_Next(Jinn);
	// ����� ����� ������?
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_06"); //� ���� ������� �� ����� � ����������?
	AI_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_07"); //�� ������ ����� ������ ����. �� ���� � �������� � �������� ���, �� ���������� �� ����� �� ������� ����� ���-�� � ����� ���� ����?
	TRIA_Next(Gustav);
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_08"); //���-�� ��������?
	AI_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_09"); //����� ��, �� �� ����, ������� ��.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_10"); //������, ������ ��� ������ ������� � ��� ���.
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_11"); //� ���� �� ������� ���� ��� ����. �����, �� ������ ������� ���, ����� �������� ������ ���� ������ �� ���������?
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_12"); //�������������, ����� ���� ��������� �� ���������. �� ����������� �����. ������, �� ����� � ������ ����, ������ ��� �� �� ����� ���������� � �������, � �� ���� ������ �����, � ���� ������ �� ��� ������.
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_13"); //� ������?
	TRIA_Next(Jinn);
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_14"); //������ ���� � ���� ����. � ����������� �������� ���������� ������ � ����������, ��� ���� �������� �������� ��� � ��������. ���� �� ��� � ���� ���� � �����.
	AI_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_15"); //������, � ������� ��.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_16"); //�������� ����� � �������.
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_17"); //������ ����� ��� ����� ������� ��� ����������.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_18"); //���� ��, � ���� ������ �� ������ ����. ��� � ���� ������ ��� � ����� ������ � ��������� ���������������. ��������� ������ ������� ����, � ���������� ���� ���� ���.
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_19"); //������, ��� ������ ��� ������ � ������, ������� � ���.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_20"); //� � ����, �� ������ ������, ����� ������ ������.
	DIAG_Reset();
	TRIA_Finish();
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Running,TOPIC_DS2P_FindEscapedHunters_VatrasAndColors);
	AI_StopProcessInfos(self);
};
	
// ������������, ���� ������� ����� "����� ��������� ���������"

instance DIA_Gustav_GardsTrust(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Gustav_GardsTrust_Condition;	
	information = DIA_Gustav_GardsTrust_Info;
	description = "��������� ��������.";
};

func int DIA_Gustav_GardsTrust_Condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Success) && Hunters_IsNotKilled)
	{
		return TRUE;
	};
};

func void DIA_Gustav_GardsTrust_Info()
{
	AI_Output(other,self,"DIA_Gustav_GardsTrust_15_00"); //��������� ��������. ���� �������.
	AI_Output(self,other,"DIA_Gustav_GardsTrust_17_01"); //(� �����������) ���, ����� ������ � ���� ��������.
	AI_Output(other,self,"DIA_Gustav_GardsTrust_15_02"); //������ ����������, �� ����������� ������� �� �����, ����� ��� ����� ���������.
	AI_Output(self,other,"DIA_Gustav_GardsTrust_17_03"); //�������. �� � ������ �� ������������, ������ �� ������ ��� ����� ��������. ����������. ������� ����, ���� �� �� ���� ������������, �� ��� �� ������ ������ �������.
	AI_Output(other,self,"DIA_Gustav_GardsTrust_15_04"); //�� ��������. ��� �� ����� ������ �����.
	AI_Output(self,other,"DIA_Gustav_GardsTrust_17_05"); //���-�� ���� � �������� �� ���� ����������� � ����. �������. ������� � �����, �� ���� ����� ���-�� �������.
	AI_StopProcessInfos(self);
};

// ������������, ���� ������� ����� "����" � ���� ����� "�������" � �������������� ���������

instance DIA_Gustav_AboutPirateAttack(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Gustav_AboutPirateAttack_Condition;	
	information = DIA_Gustav_AboutPirateAttack_Info;
	description = "�� �� ������ ���������� �� �������?";
};

func int DIA_Gustav_AboutPirateAttack_Condition()
{
	if ((MIS_DS2P_Plague == Log_Success) && (MIS_DS2P_Conspiracy == Log_Running) && (Conspiracy_Mode == 1))
	{
		return TRUE;
	};
};

func void DIA_Gustav_AboutPirateAttack_info()
{
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_00"); //�� �� ������ ���������� �� �������?
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_01"); //��� ������ � ����� ��������, � ���� ��������� ���� ����, ���?
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_02"); //� ��������� ������� �� �������.
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_03"); //��� ��� ��� ����� � �������? �� ��� �����! � �� ���� ��� ������ ������ ������������.
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_04"); //����� ��� ��������. � ���� �� � �� ���������. ������ � ����� ������� �����������, � ������ � ���� ���� �������� ����, ����� ������������� �������. ������ � ���� ��� ��������� ������� ������� �������, ����� ������� ����� ��� ����.
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_05"); //��� � ����� ������ ����! � ����� ����� �� �� � �������� ���� ������. �� ��� �� �������� �������� ����������?
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_06"); //������ ���, �� ����� �� �� �����. ����� �����, ��� �� ������� ����������� ��������, ������ �� �������, ��� ��� �� �������� � ���� ���� ������. ���-�� � � ��� ����� � �������� ��. �� � � ���, �� ������� �� � �����. ��������?
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_07"); //� ����������� � ��������. (������ �������) �����! ���� �����������.
	TRIA_Start();
	B_StartOtherRoutine(Fart,"TALKWITHGUSTAV");
	AI_SetWalkMode(Fart,NPC_RUN);
	B_StartOtherRoutine(Tom,"TALKWITHGUSTAV");
	AI_SetWalkMode(Tom,NPC_RUN);
	B_StartOtherRoutine(Jinn,"TALKWITHGUSTAV");
	AI_SetWalkMode(Jinn,NPC_RUN);
	TRIA_Invite(Fart);
	TRIA_Invite(Tom);
	TRIA_Invite(Jinn);
	TRIA_Invite(Gustav);
	if (Garon_Choice == Garon_Choice_GoForest) // ���� ����� ������������� � ����������
	{
		B_StartOtherRoutine(Garon,"TALKWITHGUSTAV");
		AI_SetWalkMode(Garon,NPC_RUN);
		TRIA_Invite(Garon);
	};
	Wld_PlayEffect("BLACK_SCREEN_SLOW", other,other,0,0,0,FALSE);
	AI_Wait(self,4);
	AI_StopFX(other,"BLACK_SCREEN_SLOW");
	AI_TurnToNpc(Fart,other);
	AI_TurnToNpc(Tom,other);
	AI_TurnToNpc(Jinn,other);
	AI_TurnToNpc(Gustav,Tom);
	AI_TurnToNpc(other,Tom);
	if (Garon_Choice == Garon_Choice_GoForest)
	{
		AI_TurnToNpc(Garon,other);
	};
	TRIA_Next(Gustav);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_08"); //�� ���, ������, ������ ����� ������� ����� ���, ��� � ��� ��� �������� ���������?
	TRIA_Next(Tom);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_10_09"); //��, ������� ������������� ����� �������, ������� � ������ �� �������, � ��������! ����� ���� ������� �������� ���� ������ ������.
	TRIA_Next(Jinn);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_11_10"); //����� �������. �� �� ������, ��� ���� ������� �� ����������?
	AI_TurnToNpc(other,Jinn);
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_11"); //� ������� ��� ������, ����� ��� � ������� �� �� �������.
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_11_12"); //����� � ���� ��. ���� ������� ��� ������ � ���� ��������.
	TRIA_Next(Fart);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_13"); //������ ��� � ������� ���� ������, �������� �� ������ ���� ��������. ��� �� ������, � ����� ������ ���������� �������? 
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_14"); //� ��� ��� �� ����� ������� ���������? �� ����� �� �� ������ ������� ������� � ������������� �������� � ������?
	AI_TurnToNpc(other,Fart);
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_15"); //����� �������� �� ��������� � ����, ��� � ����� �������� ��������. �� ������ ������� �������: �� ������ ����������� ���-������ � ���� ������� � �������, ����� �������� ������ � ��������� �� ����?
	TRIA_Next(Tom);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_10_16"); //���� ��� ���� �������� �����. ������� � ��������, �� ����� ��� ����������� �����, ����� ��������� �� ���. ����� ���� ������������?
	AI_TurnToNpc(other,Tom);
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_17"); //���� ������. �� �� ��� ����� ����� �� �����������.
	TRIA_Next(Fart);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_18"); //���������! � ���� � ����. ���� ����������� ������!
	if (Garon_Choice == Garon_Choice_GoForest)
	{
		TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_19"); //� ���� � ����.
		TRIA_Next(Gustav);
		AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_20"); //�� ������, �����? �� ���� ����� �������� �� �����, � ����� ��� ����.
		TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_21"); //� ������. ���� �� ��������� �� ��� ��������������.
		TRIA_Next(Gustav);
		AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_22"); //������! ����� �� �����������. ���� ��������� �������.
	};
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Running,TOPIC_DS2P_Conspiracy_HuntersWithUs);
	B_StartOtherRoutine(Gustav,"WAITINGFORSIGNAL");
	B_StartOtherRoutine(Tom,"WAITINGFORSIGNAL");
	B_StartOtherRoutine(Jinn,"WAITINGFORSIGNAL");
	B_StartOtherRoutine(Fart,"WAITINGFORSIGNAL");
	if (Garon_Choice == Garon_Choice_GoForest)
	{
		B_StartOtherRoutine(Garon,"WAITINGFORSIGNAL");
	};
	AI_StopProcessInfos(self);
};
	
	