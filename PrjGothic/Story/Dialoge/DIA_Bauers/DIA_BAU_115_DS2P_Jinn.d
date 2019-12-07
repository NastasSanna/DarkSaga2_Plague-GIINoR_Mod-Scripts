instance DIA_Jinn_EXIT(C_Info)
{
	npc = BAU_115_DS2P_Jinn;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Jinn_EXIT_condition;	
	information = DIA_Jinn_EXIT_info;
	description = Dialog_Ende;
};

func int DIA_Jinn_EXIT_condition()
{	
	return TRUE;
};

func void DIA_Jinn_EXIT_info()
{	
	AI_StopProcessInfos(self);
};

// ������������ ����� ����, ��� �� ������ ������ � ��������� � �������� �� ������ "����� ��������� ���������"
// nr = 1

instance DIA_Jinn_BringColors(C_Info)
{
	npc = BAU_115_DS2P_Jinn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jinn_BringColors_condition;	
	information = DIA_Jinn_BringColors_info;
	description = "��� ���� ��������.";
};

func int DIA_Jinn_BringColors_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running)
		 && (Npc_HasItems(other,ItMi_DS2P_JinnsColorChest) >= 1)
		 && Npc_KnowsInfo(other,DIA_Vatras_SelfmadeHeads))
	{
		return TRUE;
	};
};

func void DIA_Jinn_BringColors_info()
{
	AI_Output(other,self,"DIA_Jinn_BringColors_15_00"); //��� ���� ��������.
	AI_Output(self,other,"DIA_Jinn_BringColors_13_01"); //������.
	// ������ �������� �����
	B_GiveInvItems(other,self,ItMi_DS2P_JinnsColorChest,1);
	AI_Output(self,other,"DIA_Jinn_BringColors_13_02"); //��, ��� ���. �������� �� ���� ����������, ��� ���.
	AI_Output(other,self,"DIA_Jinn_BringColors_15_03"); //����� ��������� �� ����?
	AI_Output(self,other,"DIA_Jinn_BringColors_13_04"); //������� ����� ��� ���. ������ �����, � ��� �������� ������ ����� �������� ������.
	Jinns_CreatingHeads = Wld_GetDay();
	Jinns_CreatedHeads = FALSE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Running,TOPIC_DS2P_FindEscapedHunters_ThreeDays);
	AI_StopProcessInfos(self);
};
	
// �����������, ���� ���� ����� ������ ������, � ������ ������ 3 ����
// nr = 1

instance DIA_Jinn_SelfmadeHeads_NotReady(C_Info)
{
	npc = BAU_115_DS2P_Jinn;
	nr = 1;
	permanent = TRUE;
	important = TRUE;
	condition = DIA_Jinn_SelfmadeHeads_NotReady_condition;	
	information = DIA_Jinn_SelfmadeHeads_NotReady_info;
	description = " ";
};

func int DIA_Jinn_SelfmadeHeads_NotReady_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && !Jinns_CreatedHeads && (Jinns_CreatingHeads - Wld_GetDay() < 3) && Npc_IsInState(self,ZS_TALK))
	{
		return TRUE;
	};
};

func void DIA_Jinn_SelfmadeHeads_NotReady_info()
{
	AI_Output(self,other,"DIA_Jinn_SelfmadeHeads_NotReady_13_00"); //�� �����, � �����.
	AI_StopProcessInfos(self);
};

// �����������, ���� ���� ����� ������ ������, � ������ 3 ��� ��� ������
// nr = 1

instance DIA_Jinn_SelfmadeHeads_Ready(C_Info)
{
	npc = BAU_115_DS2P_Jinn;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Jinn_SelfmadeHeads_Ready_condition;	
	information = DIA_Jinn_SelfmadeHeads_Ready_info;
	description = " ";
};

func int DIA_Jinn_SelfmadeHeads_Ready_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && !Jinns_CreatedHeads && (Jinns_CreatingHeads - Wld_GetDay() > 3))
	{
		return TRUE;
	};
};

func void DIA_Jinn_SelfmadeHeads_Ready_info()
{
	AI_Output(self,other,"DIA_Jinn_SelfmadeHeads_Ready_13_00"); //���, ��� ������.
	// ������� 4 ��������� ������ � ��������� �����
	CreateInvItems(self,ItMi_DS2P_HuntersHead_SelfMade,4);
	// ������ ������ ��
	B_GiveInvItems(self,other,ItMi_DS2P_HuntersHead_Selfmade,4);
	AI_Output(self,other,"DIA_Jinn_SelfmadeHeads_Ready_13_01"); //������� �������, �������, �� ������ �����. ���� ��� �� ���������?
	AI_Output(other,self,"DIA_Jinn_SelfmadeHeads_Ready_15_02"); //���, �� ������ �������� ����� ������������ �������, ������� ������ �� ����� ��� ����������.
	AI_Output(self,other,"DIA_Jinn_SelfmadeHeads_Ready_13_03"); //����� ���������, ��� ��� ���������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Running,TOPIC_DS2P_FindEscapedHunters_ReturningToVatras);
	AI_StopProcessInfos(self);
};

// �����������, ���� ����� ������ "����� ��������� ���������" ���������� � ��������
// nr = 1

instance DIA_Jinn_GardsTrust(C_Info)
{
	npc = BAU_115_DS2P_Jinn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jinn_GardsTrust_condition;	
	information = DIA_Jinn_GardsTrust_info;
	description = "�� ���� �����?";
};

func int DIA_Jinn_GardsTrust_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Success) && Hunters_IsNotKilled && Npc_KnowsInfo(other,DIA_Gustav_GardsTrust))
	{
		return TRUE;
	};
};

func void DIA_Jinn_GardsTrust_info()
{
	AI_Output(other,self,"DIA_Jinn_GardsTrust_15_00"); //������ ������, ��� �� ���� �����.
	AI_Output(self,other,"DIA_Jinn_GardsTrust_13_01"); //��, ����� ������������� ���� �� ������. �� ��� ���������� ����� �������, �� ������� ������� ��� ���.
	AI_Output(other,self,"DIA_Jinn_GardsTrust_15_02"); //�� �����.
	AI_Output(self,other,"DIA_Jinn_GardsTrust_13_03"); //�����. ������ ��� ������, � ����� ��� ������-�����. ���� �������, ��� ��� �������� �� ������ � ������ ��������.
	// ������� ������ � ������ ��
	CreateInvItems(self,ItRi_DS2P_HuntersProtection,1);
	B_GiveInvItems(self,other,ItRi_DS2P_HuntersProtection,1);
	AI_Output(other,self,"DIA_Jinn_GardsTrust_15_04"); //�������.
	AI_StopProcessInfos(self);
};