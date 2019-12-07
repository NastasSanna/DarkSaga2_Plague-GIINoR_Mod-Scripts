instance DIA_GrayBeard_EXIT(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 999;
	permanent = TRUE;
	condition = DIA_GrayBeard_EXIT_condition;	
	information = DIA_GrayBeard_EXIT_info;
	description = Dialog_Ende;
};

func int DIA_GrayBeard_EXIT_condition()
{	
	return TRUE;
};

func void DIA_GrayBeard_EXIT_info()
{	
	AI_StopProcessInfos(self);
};

// ������ �������� � ����� �������. ����������, ���� �� ������ ���������
// � ���. nr = 1

instance DIA_GrayBeard_Hello(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_Hello_condition;	
	information = DIA_GrayBeard_Hello_info;
	description = " ";
};

func int DIA_GrayBeard_Hello_condition()
{	
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_Hello_info()
{	
	AI_Output(self,other,"DIA_GrayBeard_Hello_13_00");	//��, ���������� �����, � ���� �� �������� ����-������ ������?
	AI_Output(other,self,"DIA_GrayBeard_Hello_15_01");	//�������, ���� ���� �� ��������.
	AI_Output(self,other,"DIA_GrayBeard_Hello_13_02");	//���, �������! ��� ����� ����. �� ���, ���� ��� ����, � ����!
	Info_ClearChoices(DIA_GrayBeard_Hello);
	Info_AddChoice(DIA_GrayBeard_Hello,"���, ����.",DIA_GrayBeard_Hello_NoGrog);
	// ���� � ������ ���� ����, �� ���������� ����� "(���� ����)"
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_GrayBeard_Hello,"(���� ����)",DIA_GrayBeard_Hello_Grog);
	};
};

// ����������� ��� ������ ������� "���, ����." � ������ ��������� � ����� �������

func void DIA_GrayBeard_Hello_NoGrog()
{
	AI_Output(other,self,"DIA_GrayBeard_Hello_NoGrog_15_00");	//���, ����.
	AI_Output(self,other,"DIA_GrayBeard_Hello_NoGrog_13_01");	//����, �� ���� ����������� ������ ���� ������ ������ ���.
	AI_Output(self,other,"DIA_GrayBeard_Hello_13_03");	//� ���� � ���� �����������, ������. �� ������ ������� ����� ����� ������� ����. ��������?
	AI_Output(other,self,"DIA_GrayBeard_Hello_15_04");	//���� ����� � ����.
};

// ����������� ��� ������ ������� "(���� ����)" � ������ ��������� � ����� �������

func void DIA_GrayBeard_Hello_Grog()
{
	AI_Output(other,self,"DIA_GrayBeard_Hello_Grog_15_00");	//���, �����.
	// ������ ���� ����� ������
	B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	// ����� ������ �������� ����
	B_UseItem(self,ItFo_Addon_Grog);
	AI_Output(self,other,"DIA_GrayBeard_Hello_NoGrog_13_01");	//(���� ����������) ������ � ���� �������... ��!
	AI_Output(self,other,"DIA_GrayBeard_Hello_13_03");	//� ���� � ���� �����������, ������. �� ������ ������� ����� ����� ������� ����. ��������?
	AI_Output(other,self,"DIA_GrayBeard_Hello_15_04");	//���� ����� � ����.
};

// "��� ��?". ������������, ���� ��������� ������ ������ � ����� �������
// nr = 1

instance DIA_GrayBeard_WhoAreYou(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_WhoAreYou_condition;	
	information = DIA_GrayBeard_WhoAreYou_info;
	description = "��� ��?";
};

func int DIA_GrayBeard_WhoAreYou_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WhoAreYou_info()
{	
	AI_Output(other,self,"DIA_GrayBeard_WhoAreYou_15_00");	//��� ��?
	AI_Output(self,other,"DIA_GrayBeard_WhoAreYou_13_01");	//(�����) � � ����� ������! ����� �����, ���� ��������� � �������� ���. ���� ����� �� ����� ��������, �������� � �� ������ ��������� ��������, ������� � ��� ����� ����������� � ���������� ������� �������. ���� ������ � �����. � ������ ������������ ���� � ��������� ������. ߅
	AI_Output(other,self,"DIA_GrayBeard_WhoAreYou_15_02");	//��, � ��� �����, ��� �� �������� ����������� �� ���������.
	AI_Output(self,other,"DIA_GrayBeard_WhoAreYou_13_03");	//���������� ��� ������ �����. ������� �� ��������, ����� ��� �, �� ������ � ���� ���� ������� � ���������� � �������� ��� ��� �� �������� �� ���� �����. �� ���������� �� �������, ����� ��� ������, ����������� ���� ��� ����������.
	AI_Output(other,self,"DIA_GrayBeard_WhoAreYou_15_04");	//�����-�����, � ��� �����.
};

// "�� ���, ��� ����� �����?". ������������, ���� ��������� ������ ������ � ����� �������
// nr = 2

instance DIA_GrayBeard_DrinkAllTime(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 2;
	permanent = FALSE;
	condition = DIA_GrayBeard_DrinkAllTime_condition;	
	information = DIA_GrayBeard_DrinkAllTime_info;
	description = "�� ���, ��� ����� �����?";
};

func int DIA_GrayBeard_DrinkAllTime_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_DrinkAllTime_info()
{
	AI_Output(other,self,"DIA_GrayBeard_DrinkAllTime_15_00");	//�� ���, ��� ����� �����?
	AI_Output(self,other,"DIA_GrayBeard_DrinkAllTime_13_01");	//(�����) � ��� ��� ��� ������?
	AI_Output(other,self,"DIA_GrayBeard_DrinkAllTime_15_02");	//�� ���, ������ ���������, ��� �� ������ �� �����.
	AI_Output(self,other,"DIA_GrayBeard_DrinkAllTime_13_03");	//(���������) ��� ��� ���! � ���� ����� ���� ��������. �� ��� ������-����� �������� � �������� ��� ������, � � ��� �����. ����� ����, ��� � ��������� ��� ��� ������� � �������, �� �� ���� ���� �� ����� �������������.
	AI_Output(other,self,"DIA_GrayBeard_DrinkAllTime_15_04");	//��-��, � ��� ����� � �������� ����� ��������.
	AI_Output(self,other,"DIA_GrayBeard_DrinkAllTime_13_05");	//��������� ����������. �� � ����� ���� � �������, ���������� ��� �� �������� � ���, ��� ��������� ������, ������ �� ������� � ������ 300 ������� ����������. ������ ������ ������.
	AI_Output(other,self,"DIA_GrayBeard_DrinkAllTime_15_06");	//���-������ � ������ ���. ������ � ���� ������� ��� ����������.
	AI_Output(self,other,"DIA_GrayBeard_DrinkAllTime_13_07");	//��! ��������! ���������? ��������� �������, ���� � � ����� ������! 
};

// "��� �� ���������� � �����?". ������������, ���� ��������� ������ ������ � ����� �������
// nr = 3

instance DIA_GrayBeard_AboutGard(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 3;
	permanent = FALSE;
	condition = DIA_GrayBeard_AboutGard_condition;	
	information = DIA_GrayBeard_AboutGard_info;
	description = "��� �� ���������� � �����?";
};

func int DIA_GrayBeard_AboutGard_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello) && GrayBeard_AboutGard > 0)
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_AboutGard_info()
{
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_00");	//��� �� ���������� � �����?
	AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_01");	//�������� �����, ������! �������! ��� ��� ����� �� ������ ����, � ��� ���� ������� ����. ������?
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_02");	//���� � ��� �����������? ��� �� ���������� � �������� �����?
	AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_03");	//��, �� ������� �����, ���������� �����. ���� ������ ��� ����� ����� ������� ����, ��� ��� �� ����������. ���� � ��� ����� ������ �� ����� ����������� ����, ������ ���� ���������. ���
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_04");	//(��������) ����� �� �� ����.
	AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_05");	//�� ��� ����� ������� ������ �� ���� ��������.
	Info_ClearChoices(DIA_GrayBeard_AboutGard);
	Info_AddChoice(DIA_GrayBeard_AboutGard,"������!",DIA_GrayBeard_AboutGard_Enough);
	Info_AddChoice(DIA_GrayBeard_AboutGard,"(������� ������)",DIA_GrayBeard_AboutGard_Continue);
};

//�����������, ���� ������� ������� "������!" � ������� � ����� ������� "��� �� ���������� � �����?"

func void DIA_GrayBeard_AboutGard_Enough()
{
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_Enough_15_00");	//������! ��� ���� ����, ����� ����������.
	GrayBeard_AboutGard_Ended = TRUE;
	AI_StopProcessInfos(self);
};

//����������� �� ����� ������� ����� ������ �������� �������, � ���������� ��

func void DIA_GrayBeard_AboutGard_Continue()
{
	if (GrayBeard_AboutGard == 1)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //�� ��� � �����������? �, ��. ��� ���.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_06");	//��� ����� ������ ���. � �� ����� ���������� ��������� �������� ���� �������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_07");	//�� ����� ��� �� �������, � �� �������� �������. ����� �������� ���.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_08");	//��� ���� �������, ����� ���� � ��������.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"������!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(������� ������)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 2)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //�� ��� � �����������? �, ��. ��� ���.
			GrayBeard_AboutGard = FALSE;
		};
		//������� � ��������� ����� ������ ����
		CreateInvItem(self,ItFo_Addon_Grog);
		//����� ������ �������� ����
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_09");	//�� � ��� ������ ������ � ����� � ����� � ���������� �� �������������� ����������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_10");	//������� ������ � ��������� ����, �������� �� ��� �����.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_11");	//���� ���� ���� �� ������ � �����, ������ ������ ����� ��������.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"������!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(������� ������)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 3)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //�� ��� � �����������? �, ��. ��� ���.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_12");	//���������� ����� �������, ������� ���, � �, ������� ��� ����, ���� ����� �� �����.
		//������� � ��������� ����� ������ ����
		CreateInvItem(self,ItFo_Addon_Grog);
		//����� ������ �������� ����
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_13");	//� ����� ��� �� ���������. � ��� ������ ���� ����� ��� ������� ���������� �����.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_14");	//�� � ��� �������� �����, �� ��� � �� ���. ��� ������� � ��������, �� ���-��� ������ �� �����.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"������!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(������� ������)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 4)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //�� ��� � �����������? �, ��. ��� ���.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_15");	//������� ��� ���� ������ ������, � � ������� ��� ����� ������ ��������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_16");	//������ �� �� ���� �������� ���������. � ��� ������� ��������, ����� ���������� ������� �, ������������, ������� � ����.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_17");	//� �������, ���������� �������. � ��������� �� ������� ��� � ���� ��������� ���� ������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_18");	//����� ����� � ��������� � ����, �, ����� ��� ��������� ��������� ���� �� ��������, ��� ������� ��������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_19");	//������� ���� �������� ���� �� ����� ����� �, �������� ��� �������, ��������� ��� �������� � ��� �������. � ����������, � � ��� ����� ��� ������� ����� �������� ������ ��� �������. ������� � ����.
		AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_20");	//� ��� ���?
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_21");	//�� ��! ���� ���������� ��� ���� ������, ����� �� ������ ���� ������� ���������. � �����
		AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_22");	//���, �������, �� � ���������. ���-������ � ������ ���
		GrayBeard_AboutGard = 0;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
	};
};

// ����������� �������� ����� ������ � �������� �����. ����������, ���� �������� ������� �������� "������!"
// nr = 3

instance DIA_GrayBeard_AboutGard_Run(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 3;
	permanent = TRUE;
	condition = DIA_GrayBeard_AboutGard_Run_condition;	
	information = DIA_GrayBeard_AboutGard_Run_info;
	description = "�� ���-�� ����������� ��� �����.";
};

func int DIA_GrayBeard_AboutGard_Run_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_AboutGard) && (GrayBeard_AboutGard_Ended == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_AboutGard_Run_info()
{
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_Run_15_00");	//�� ���-�� ����������� ��� �����.
	if (GrayBeard_AboutGard == 1)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //�� ��� � �����������? �, ��. ��� ���.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_06");	//��� ����� ������ ���. � �� ����� ���������� ��������� �������� ���� �������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_07");	//�� ����� ��� �� �������, � �� �������� �������. ����� �������� ���.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_08");	//��� ���� �������, ����� ���� � ��������.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"������!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(������� ������)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 2)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //�� ��� � �����������? �, ��. ��� ���.
			GrayBeard_AboutGard = FALSE;
		};
		//������� � ��������� ����� ������ ����
		CreateInvItem(self,ItFo_Addon_Grog);
		//����� ������ �������� ����
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_09");	//�� � ��� ������ ������ � ����� � ����� � ���������� �� �������������� ����������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_10");	//������� ������ � ��������� ����, �������� �� ��� �����.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_11");	//���� ���� ���� �� ������ � �����, ������ ������ ����� ��������.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"������!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(������� ������)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 3)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //�� ��� � �����������? �, ��. ��� ���.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_12");	//���������� ����� �������, ������� ���, � �, ������� ��� ����, ���� ����� �� �����.
		//������� � ��������� ����� ������ ����
		CreateInvItem(self,ItFo_Addon_Grog);
		//����� ������ �������� ����
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_13");	//� ����� ��� �� ���������. � ��� ������ ���� ����� ��� ������� ���������� �����.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_14");	//�� � ��� �������� �����, �� ��� � �� ���. ��� ������� � ��������, �� ���-��� ������ �� �����.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"������!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(������� ������)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 4)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //�� ��� � �����������? �, ��. ��� ���.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_15");	//������� ��� ���� ������ ������, � � ������� ��� ����� ������ ��������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_16");	//������ �� �� ���� �������� ���������. � ��� ������� ��������, ����� ���������� ������� �, ������������, ������� � ����.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_17");	//� �������, ���������� �������. � ��������� �� ������� ��� � ���� ��������� ���� ������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_18");	//����� ����� � ��������� � ����, �, ����� ��� ��������� ��������� ���� �� ��������, ��� ������� ��������.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_19");	//������� ���� �������� ���� �� ����� ����� �, �������� ��� �������, ��������� ��� �������� � ��� �������. � ����������, � � ��� ����� ��� ������� ����� �������� ������ ��� �������. ������� � ����.
		AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_20");	//� ��� ���?
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_21");	//�� ��! ���� ���������� ��� ���� ������, ����� �� ������ ���� ������� ���������. � �����
		AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_22");	//���, �������, �� � ���������. ���-������ � ������ ���
		GrayBeard_AboutGard = 0;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
	};
};

// "��� �� ����� ������?". ������������ ����� ������� ������� � ����� �������
// nr = 4

instance DIA_GrayBeard_WhatAreYouDoingHere(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 4;
	permanent = FALSE;
	condition = DIA_GrayBeard_WhatAreYouDoingHere_condition;	
	information = DIA_GrayBeard_WhatAreYouDoingHere_info;
	description = "��� �� ����� ������?";
};

func int DIA_GrayBeard_WhatAreYouDoingHere_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WhatAreYouDoingHere_info()
{
	AI_Output(other,self,"DIA_GrayBeard_WhatAreYouDoingHere_15_00");	//��� �� ����� ������?
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_01");	//��� � � � ��� �� ���� ���������! �, ���������� ����� ����� ������, �������� ��������� �� ���� ������� ����� ������ ������ ����, ��� ���� ���������� ������� ����. � ���� � ������ ���������� � ���� �������� ����� �����!
	AI_Output(other,self,"DIA_GrayBeard_WhatAreYouDoingHere_15_02");	//� ��� ��� �������?
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_03");	//��������� ���� ��������� ��� �� ���. ��, �������� ��� ��� � � �� ������ ������ ��������! ���� �� ���� � ��� ������ �� ������� �� ������� ���������, �� ���� ���� �������������� ��� �� ������ ������. 
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_04");	//���� � � � ����� ��������� ���� �������� �����, ������ ��� ���� ������ ������� �� ������, � �� ������. � ��� ��� �� ��������� ������� � ���� ���.
	AI_Output(other,self,"DIA_GrayBeard_WhatAreYouDoingHere_15_05");	//������������� �������! �����-���� ��������� �� ������� ����. �������� � ��� �����, ��� �� �������.
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_06");	//(���������) ������������ ������? �, ����� ������, �� ��������� ���������!
	AI_Output(other,self,"DIA_GrayBeard_WhatAreYouDoingHere_15_07");	//�� ��� ��, � � ������ �� ���� ����������� ��� ����� ������� ���������.
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_08");	//��-�� ��!
};

// ������� �����. ���������� ����� ������� ������� � ����� �������
// nr = 

instance DIA_GrayBeard_SellGrog(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 5;
	permanent = TRUE;
	condition = DIA_GrayBeard_SellGrog_condition;	
	information = DIA_GrayBeard_SellGrog_info;
	description = "(������� ����)";
};

func int DIA_GrayBeard_SellGrog_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_SellGrog_info()
{
	AI_Output(other,self,"DIA_GrayBeard_SellGrog_15_00");	//� ���� ���� ���� ������� ����� ��� ����.
	AI_Output(self,other,"DIA_GrayBeard_SellGrog_13_01");	//����� ����!
	Info_ClearChoices(DIA_GrayBeard_SellGrog);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
};

// ����������� ��� ������ ������� "� ���� ������ ���." � ������� ����� ������ � ������� �����

func void DIA_GrayBeard_SellGrog_Nothing()
{
	AI_Output(other,self,"DIA_GrayBeard_SellGrog_Nothing_15_00");	//� ���� ������ ���.
	AI_Output(self,other,"DIA_GrayBeard_SellGrog_Nothing_13_01");	//���� ��! ����� ����� ���������� ����? � ���� � ��� ���� ����� ���.
	AI_StopProcessInfos(self);
};

// ����������� ��� ������ ������� "������� ���" � ������� � ����� ������� � ������� �����

func void DIA_GrayBeard_SellGrog_All()
{
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		var int Player_Grog; Player_Grog = Npc_HasItems(other,ItFo_Addon_Grog);
		B_GiveInvItems(other,self,ItFo_Addon_Grog,Player_Grog);
		// ���� ����� ������� ���, ����� ����� ��� �������� ���� ��� �������� ����� ������ - ��������� ����������� � ��������� ������
		Npc_RemoveInvItems(self,ItFo_Addon_Grog,Player_Grog);
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_00");	//(�����) ����� ����!
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
	}
	else
	{
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_01");	//(�����) ��! �� ��������� ���� ��������? �������, ����� � ���� ������������� ����� ����.
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
	};
};

// ����������� ��� ������ ������� "������� 10 �������" � ������� � ����� ������� � ������� �����

func void DIA_GrayBeard_SellGrog_Ten()
{
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 10)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,10);
		// ���� ����� ������� ���, ����� ����� ��� �������� ���� ��� �������� ����� ������ - ��������� ����������� � ��������� ������
		Npc_RemoveInvItems(self,ItFo_Addon_Grog,10);
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_00");	//(�����) ����� ����!
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
	}
	else
	{
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_01");	//(�����) ��! �� ��������� ���� ��������? �������, ����� � ���� ������������� ����� ����.
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
	};
};

// ����������� ��� ������ ������� "������� 5 �������" � ������� � ����� ������� � ������� �����

func void DIA_GrayBeard_SellGrog_Five()
{
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 5)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,5);
		// ���� ����� ������� ���, ����� ����� ��� �������� ���� ��� �������� ����� ������ - ��������� ����������� � ��������� ������
		Npc_RemoveInvItems(self,ItFo_Addon_Grog,5);
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_00");	//(�����) ����� ����!
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
	}
	else
	{
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_01");	//(�����) ��! �� ��������� ���� ��������? �������, ����� � ���� ������������� ����� ����.
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
	};
};

// ����������� ��� ������ ������� "������� 1 �������" � ������� � ����� ������� � ������� �����

func void DIA_GrayBeard_SellGrog_One()
{
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		// ���� ����� ������� ���, ����� ����� ��� �������� ���� ��� �������� ����� ������ - ��������� ����������� � ��������� ������
		Npc_RemoveInvItems(self,ItFo_Addon_Grog,1);
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_00");	//(�����) ����� ����!
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
	}
	else
	{
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_01");	//(�����) ��! �� ��������� ���� ��������? �������, ����� � ���� ������������� ����� ����.
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"� ���� ������ ���.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� ���.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 10 �������.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 5 �������.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"������� 1 �������.",DIA_GrayBeard_SellGrog_One);
	};
};

// "� ���� ����������� ���.". ���������� ����� ������� ������� � ����� �������
// nr = 6

instance DIA_GrayBeard_SkeletonHunting(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 6;
	permanent = FALSE;
	condition = DIA_GrayBeard_SkeletonHunting_condition;	
	information = DIA_GrayBeard_SkeletonHunting_info;
	description = "� ���� ����������� ���.";
};

func int DIA_GrayBeard_SkeletonHunting_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_SkeletonHunting_info()
{
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_15_00");	//� ���� ����������� ���. �����, ����� ������?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_01");	//��, ������� �� �� �������, ��� �, ����� ������, ����� �����. �� ��, ��� ������������� ����� ������.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_15_02");	//����������?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_03");	//(��������) ��, �� �� �����. ���� � �����! ����� �� ���������� ���������� �� ���� ������ ����, � ���������� ������ ����������� ��� ������� ���������. ��� ����� �����������, �� � �������� � ����� ��������� ��� ��� ������� ����� �� ��������. 
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_04");	//� ���� ������ ��������� ���� ���������� ����� ��������� �� ����� ��������� ���������� �����. �������, ��� �� ���� ���� ��� ������ �� ����� �������� ���� ����� ����.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_15_05");	//� �� ������ ������ ���� ��� ����.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_06");	//��, ���� ���� ������, ��! � � ��� �� ���� ���������� ����� � ����� ������. ������������ ���� ���� ���, � �� ����� ������ �����������.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_07");	//� ��� ���� �����, ��� ���������� ������ ���, ���� �� ���������� �� ����, ��� �����, ����� ��� ���������� �������, ����� ��������� �������� �������������. � ����� �� ����, � ������� �� ������ �������� ����� ��������.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_08");	//� �� ���� ����� �������� ���������� � ������ ������ ������. �� ���������� � ��� � �������� �������.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_09");	//���� �, ��� ����� ������, ������ ���������� � ���� �������� �����, ���� � ������ �� ��� ���������� � ������� ���������. �� ��� �������, ������� �����, � ��� ������ ��������� ���������� ��� �����, ���� ������ ���� ����������� ���� ������ ��� �����.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_10");	//��� ����� ������� ��� ������ ����� ����������� ���������, ���� �� ������� �������� ��� � ����. ��� �������� ������, ����� ������. ������� ����, ��� ��� ������������ ������, ����� ����� ������ ����� �� ������-������������� ����������. 
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_11");	//� ��� ��� � ��� ��� ���� ���������� � ��� �����. ��� ��� ���� �������� � ��� ��������, ��������� ����� ������ ������, ������� �� �������� � ���������� ����������� ��������. � ��� ���� � ����� ������ �����!
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_12");	//�, ����� ������, ������ ���� � ������� �����, ������ �������� ��������� �� �����-�� ����� ������!
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_15_13");	//�������� �������. � �� ������ �� ������� ���������� � ��� �����?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_14");	//���� ���. � ��������� ���� ��������� �����. � ���� ��� � �������� ������� ������������ ������, �� ����������� ������ ������.
	Info_ClearChoices(DIA_GrayBeard_SkeletonHunting);
	Info_AddChoice(DIA_GrayBeard_SkeletonHunting,"�, �� ����� �����.",DIA_GrayBeard_SkeletonHunting_Deciline);
	Info_AddChoice(DIA_GrayBeard_SkeletonHunting,"�����, � ���� ������?",DIA_GrayBeard_SkeletonHunting_Accept);
};

//����������� ��� ������ ������� "�, �� ����� �����." � ������� � ����� ������� "� ���� ����������� ���."

func void DIA_GrayBeard_SkeletonHunting_Deciline()
{
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Deciline_15_00");	//�, �� ����� �����.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Deciline_13_00");	//������, � ��� �������� ���� ������� �������� ��� ��� �����.
};

//����������� ��� ������ ������� "�����, � ���� ������?" � ������� � ����� ������� "� ���� ����������� ���."

func void DIA_GrayBeard_SkeletonHunting_Accept()
{
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_00");	//�����, � ���� ������?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_01");	//��, ��� ����� ���������. ����� ������� ���: �� ������ ���� � ��� �����, �� ������ ���� ���������� �� ��� ������, ���� ���-�� ������ �� ���. �����, ��� ������ ������ �����.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_02");	//��, �� �������� ������. ������� ��������� ��� �������. � �� ������� �� ������ ���.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_03");	//����, � ��� �� ���� ���� ������. ��� ������� ������?
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_04");	//�� � ��������� �� ��. ������. � ������ ������, ��� � �����.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_05");	//(����������) �����, ������?
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_06");	//������. ��� � �� ���.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_07");	//(����������) ��, �����. ������ �������� ����� ����.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_08");	//����� ��������?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_09");	//������� �������.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_10");	//� ����� ������? � � ������ �����.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_11");	//������ ��� ������ ���������� ������ � ������ ����� �����. ������� �������.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_12");	//������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_GhostsSword,LOG_MISSION,LOG_Running,TOPIC_DS2P_GhostsSword_Start);
};

//�����������, ���� ����� ��������� ������ �� ��� - "��� ����?"
// nr = 1

instance DIA_GrayBeard_SueBaby_Tria(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_SueBaby_Tria_condition;	
	information = DIA_GrayBeard_SueBaby_Tria_info;
	description = " ";
};

func int DIA_GrayBeard_SueBaby_Tria_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_HowDoYouDo))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_SueBaby_Tria_info()
{
	//�������� ������� ����� ����� �������, �� � ���
	TRIA_Start();
	TRIA_Invite(SueBaby);
	TRIA_Invite(GrayBeard);
	TRIA_Next(GrayBeard);
	// self = GrayBeard, other = Hero
	AI_TurnToNpc(self,SueBaby);
	AI_TurnToNpc(SueBaby,self);
	AI_TurnToNpc(other,self);
	AI_Output(self,other,"DIA_GrayBeard_SueBaby_Tria_13_00");	//��! �-��� ��� �-�-�� ��� ���� ��!.. �������, �-����������? �-��!
	TRIA_Next(SueBaby);
	// self = SueBaby, other = Hero
	AI_Output(self,other,"DIA_GrayBeard_SueBaby_Tria_17_01");	//���������� ������, ������ ���� ����, ����� ����������.
	TRIA_Next(GrayBeard);
	// self = GrayBeard, other = Hero
	AI_Output(self,other,"DIA_GrayBeard_SueBaby_Tria_13_02");	//�-�������� ��! �� �-��� �� �-��� ��!.. ������ �� �-���� ��� ��!.. �������������. � �-����� ��!.. ���!
	AI_Output(other,self,"DIA_GrayBeard_SueBaby_Tria_15_03");	//��, ��! ��������� ������������� � ������ � ����� ����.
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_GrayBeard_SueBaby_Tria_13_04");	//�-� �� �-��� ��!.. �-�����? �-�������� �-������ ��!.. � �-������ ��!.. ������. �� � ����� ��!.. ����� �-����� �-����� ��!
	AI_Output(other,self,"DIA_GrayBeard_SueBaby_Tria_15_05");	//�� ��� ��� ����!
	DIAG_Reset();
	TRIA_Finish();
	SueBaby_GrayBeard_Fight = 1; // �������������� �����, ����� ������� �������� � Unconscious
	// ����� ������ �������� �� ��
	B_Attack(self,other,AR_NONE,0);
	// ��� �������� �� ����� ������
	B_Attack(SueBaby,self,AR_NONE,0);
	AI_StopProcessInfos(self);
};

//"� �� ������ ���.".������������, ���� ����� ����� "�������� ����� ������".
// nr = 1

instance DIA_GrayBeard_AboutSue(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_AboutSue_condition;	
	information = DIA_GrayBeard_AboutSue_info;
	description = " ";
};

func int DIA_GrayBeard_AboutSue_condition()
{	
	if (MIS_DS2P_TeachGrayBeard == Log_Running)
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_AboutSue_info()
{
	AI_Output(other,self,"DIA_GrayBeard_AboutSue_15_00");	//� �� ������ ���.
	AI_Output(self,other,"DIA_GrayBeard_AboutSue_13_01");	//�� ������ ���������� �� ���� ����������?
	AI_Output(other,self,"DIA_GrayBeard_AboutSue_15_02");	//� �� ����������� �� ����� ����������� ������������. � ����, ����� �� ������ �� ��� ��� � ��������.
	AI_Output(self,other,"DIA_GrayBeard_AboutSue_13_03");	//���?!! �� � ��� ����� ������! ��� �� ������ ���-�� ��� ���������?!
	AI_Output(other,self,"DIA_GrayBeard_AboutSue_15_04");	//�����, �����������? ��� �� �����, ����� ��������� � ������� ������?
	if ((SueBaby_GrayBeard_Fight == 2) || (SueBaby_GrayBeard_Fight == 3) || (SueBaby_GrayBeard_Fight == 4)) //���� �� � ��� ������� ����� ������ � �������
	{
		AI_Output(other,self,"DIA_GrayBeard_AboutSue_15_05");	//���� ����������� �������� � �����?
		AI_Output(self,other,"DIA_GrayBeard_AboutSue_13_06");	//�� ���, �������! �� ��� ����, � �����, ��� ��, � �� ������� �� ��� ����� ������!
	}
	else if (SueBaby_GrayBeard_Fight == 5)
	{
		AI_Output(self,other,"DIA_GrayBeard_AboutSue_13_07");	//�� ������-�� �� ������ ������� ���� ������, ��� �������������, � ������ �� � �������� ����������� �� �����? �������, ������, ������ �� �������� ���� ��� ����.
	};
	//����� ������ ������� ��
	B_Attack(self,other,AR_NONE,0);
	//�������������� �����, ����� ��������� - ��� ���������
	GrayBeard_AttackIsOver = FALSE;
	AI_StopProcessInfos(self);
};

//�����������, ���� �� �������� ���

instance DIA_GrayBeard_LoseFight(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_LoseFight_condition;	
	information = DIA_GrayBeard_LoseFight_info;
	description = " ";
};

func int DIA_GrayBeard_LoseFight_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) && (GrayBeard_AttackNum > 0) && (GrayBeard_AttackWinner == 1))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_LoseFight_info()
{
	AI_Output(self,other,"DIA_GrayBeard_LoseFight_13_00");	//� �� �������, ��� �� ������ � ��������. � � ����� ������, � �� �����-������ ������ ��� ������. ���� ��� ������ �� �����. � ������ ���� ������ � �������, ��� ������� ���.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Failed,TOPIC_DS2P_TeachGrayBeard_Failed);
	AI_StopProcessInfos(self);
};

//"� ���? ������� ������� ��������� �� �������?".������������, ���� �� ������� ������ ���
// nr = 1

instance DIA_GrayBeard_WinOne(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_WinOne_condition;	
	information = DIA_GrayBeard_WinOne_info;
	description = "� ���? ������� ������� ��������� �� �������?";
};

func int DIA_GrayBeard_WinOne_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) && (GrayBeard_AttackNum == 1) && (GrayBeard_AttackWinner == 2))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WinOne_info()
{
	AI_Output(other,self,"DIA_GrayBeard_WinOne_15_00");	//� ���? ������� ������� ��������� �� �������?
	AI_Output(self,other,"DIA_GrayBeard_WinOne_13_01");	//�, ���� ���� ���� ������! ��� ���� �����?
	AI_Output(other,self,"DIA_GrayBeard_WinOne_15_02");	//������ ����, ����� ��, �������, ������ �� ���. ��� � ��������.
	AI_Output(self,other,"DIA_GrayBeard_WinOne_13_03");	//� ���� �� ����, ��� � ���������� ����? ��, ��� �� ����� ����, ��� �� ������, ��� �, ����� ������, ���� ������� ������� ������ ����� ��������� ���� �������.
	AI_Output(other,self,"DIA_GrayBeard_WinOne_15_04");	//��� �, ����� �� �� �����. ����� ���� �� �������� ��� ���� ������.
	//����� ������ ������� ��
	B_Attack(self,other,AR_NONE,0);
	//�������������� �����, ����� ��������� - ��� ���������
	GrayBeard_AttackIsOver = FALSE;
	GrayBeard_AttackWinner = 0;
	AI_StopProcessInfos(self);
};

//"������ ��������� ���������� ��� ���.".������������, ���� �� ������� ������ ���
// nr = 1

instance DIA_GrayBeard_WinTwo(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_WinTwo_condition;	
	information = DIA_GrayBeard_WinTwo_info;
	description = "� ���? ������� ������� ��������� �� �������?";
};

func int DIA_GrayBeard_WinTwo_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) && (GrayBeard_AttackNum == 2) && (GrayBeard_AttackWinner == 2))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WinTwo_info()
{
	AI_Output(other,self,"DIA_GrayBeard_WinTwo_15_00");	//������ ��������� ���������� ��� ���.
	AI_Output(self,other,"DIA_GrayBeard_WinTwo_13_01");	//����, ���� �� �������! ������� ��� �� ����!
	AI_Output(other,self,"DIA_GrayBeard_WinTwo_15_02");	//�������, �� ������ ����� �� ���������� ������ �� ������� ������� ���. ������, � ���� �������� ���� ��� ���� �� ��������� ����.
	AI_Output(self,other,"DIA_GrayBeard_WinTwo_13_03");	//� �� ����� ����!
	AI_Output(other,self,"DIA_GrayBeard_WinTwo_15_04");	//�����, �� ��� ����������.
	//����� ������ ������� ��
	B_Attack(self,other,AR_NONE,0);
	//�������������� �����, ����� ��������� - ��� ���������
	GrayBeard_AttackIsOver = FALSE;
	GrayBeard_AttackWinner = 0;
	AI_StopProcessInfos(self);
};

//"���, ���������?".������������, ���� �� ������� ������ ���
// nr = 1

instance DIA_GrayBeard_WinThree(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = TRUE;
	condition = DIA_GrayBeard_WinThree_condition;	
	information = DIA_GrayBeard_WinThree_info;
	description = "���, ���������?";
};

func int DIA_GrayBeard_WinThree_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) && (GrayBeard_AttackNum == 3) && (GrayBeard_AttackWinner == 2))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WinThree_info()
{
	AI_Output(other,self,"DIA_GrayBeard_WinThree_15_00");	//���, ���������?
	AI_Output(self,other,"DIA_GrayBeard_WinThree_13_01");	//��, ��� ������!
	AI_Output(other,self,"DIA_GrayBeard_WinThree_15_02");	//�� ��������� ���?
	AI_Output(self,other,"DIA_GrayBeard_WinThree_13_03");	//��� � �����!
	AI_Output(other,self,"DIA_GrayBeard_WinThree_15_04");	//�����, �� ��� ����������.
	AI_StopProcessInfos(self);
};

// "� ����� �� ������ ���.". ������������, ���� �� ����� � ������������ �� ������� ���
// nr = 1

instance DIA_GrayBeard_AgainAboutSue(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_AgainAboutSue_condition;	
	information = DIA_GrayBeard_AgainAboutSue_info;
	description = "� ����� �� ������ ���.";
};

func int DIA_GrayBeard_AgainAboutSue_condition()
{	
	if (SueBaby_AboutGrayBeardSolution == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_AgainAboutSue_info()
{
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_00");	//� ����� �� ������ ���.
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_01");	//���?! � �� ������, ��� �� ���� �� �����������.
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_02");	//��� ���������� �������� ������������. � ���� ��������� �� �� �����. ���� ��������� �, �� �� �������� �������� �� ������� ���. ���� ��, �� ��� �������� ���� ���� �������. �����.
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_03");	//������������? ��, ��� ���� ��������.
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_04");	//(������������) � ��� � �����, ��� ����� ������ ����!
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_05");	//(������) ���?!! � ����?!! �� � ������� ��� ����, ������ ������! � ����� ������ ���� � ���������� ����!
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_06");	//�� ��� �� �������� ���� �����, ��� �� ������� �������� ������������.
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_07");	//���?!! � ���� ������, ��� � ������ �� �����! �����, ������� ��� ������������ ����� ������!
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_08");	//��� �� ��������?
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_09");	//��!!! ���� ���� ������! ��!
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_10");	//����� ������� ������� � � ����� ��������. �� �� �� ������, ����� ����� ������� ������ ������������?
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_11");	//����� �������, ������ �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_01);
	AI_StopProcessInfos(self);
};

// "�� ���, ������?". ������������, ���� �� ����� � ������������ � ��������� 2-3 �������
// ���� ���� ��� - ����������� 3 �������, ���� ��� - �� 2
// nr = 1

instance DIA_GrayBeard_StartCompetition(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_StartCompetition_condition;	
	information = DIA_GrayBeard_StartCompetition_info;
	description = "�� ���, ������?";
};

func int DIA_GrayBeard_StartCompetition_condition()
{	
	if (Npc_KnowsInfo(other,DIA_Symon_GrayBeardCompetition) && Npc_KnowsInfo(other,DIA_Karah_GrayBeardCompetition))
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			if (Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition_Gold))
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		};
	};
};

func void DIA_GrayBeard_StartCompetition_info()
{
	TRIA_Start();
	TRIA_Invite(GrayBeard);
	if (!Npc_IsDead(PIR_201_DS2P_Greg)) // ���� ���� �����, �� ������� �����
	{
		TRIA_Invite(Greg);
	}
	else
	{
		TRIA_Invite(Karah);
	};
	AI_Output(other,self,"DIA_GrayBeard_StartCompetition_15_00");	//�� ���, ������?
	AI_Output(self,other,"DIA_GrayBeard_StartCompetition_13_01");	//�����, ������ �������! � ������ ���� �� ���� �������.
	if (!Npc_IsDead(PIR_201_DS2P_Greg))
	{
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_GrayBeard_StartCompetition_17_02");	//����, ������ ���� � �����. ���� ������ �����, ��������� � ����� ���� ����������, ��������� � ������ �� ������.
		AI_Output(self,other,"DIA_GrayBeard_StartCompetition_17_03");	//� �������� �������������� ���� �������� �� ����. ��� ����? ����� �����, ��������� ���������, �������� ����������!
	}
	else
	{
		TRIA_Next(Karah);
		AI_Output(self,other,"DIA_GrayBeard_StartCompetition_17_04");	//����, ������ ���� � �����. ���� ������ �����, ��������� � ����� ���� ����������, ��������� � ������ �� ������.
		AI_Output(self,other,"DIA_GrayBeard_StartCompetition_17_05");	//� �������� �������������� ���� �������� �� ����. ��� ����? ����� �����, ��������� ���������, �������� ����������!
	};
	DIAG_Reset();
	TRIA_Finish();
	// ������ ������ ���������� ��� ����� ������
	B_StartOtherRoutine(self,"COMP_SHADOWBEAST_01");
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_07);
	// �������������� ������������, ����� ����� ������ ��� �������� ���� ���������� � �������� ��
	GB_CompetitionState = 1;
	GB_CompetitionTime_01 = C_GetTime_Plus(6,0,1);
	AI_StopProcessInfos(self);
};

// �����������, ���� ���������� ���������� � ����� ������� �� ����� ������� ���������
// nr = 1

instance DIA_GrayBeard_Comp01GoAway(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = TRUE;
	important = TRUE;
	condition = DIA_GrayBeard_Comp01GoAway_condition;	
	information = DIA_GrayBeard_Comp01GoAway_info;
	description = " ";
};

func int DIA_GrayBeard_Comp01GoAway_condition()
{	
	if ((GB_CompetitionState == 1) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_Comp01GoAway_info()
{
	AI_Output(self,other,"DIA_GrayBeard_Comp01GoAway_13_00");	//��-��, � ����� ������!
	AI_StopProcessInfos(self);
};

// �����������, ���� �� ����� ���� ���������� ������, ��� �� 6 ��c��
// nr = 1

instance DIA_GrayBeard_KilledShadowBeast_01(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_KilledShadowBeast_01_condition;	
	information = DIA_GrayBeard_KilledShadowBeast_01_info;
	description = " ";
};

func int DIA_GrayBeard_KilledShadowBeast_01_condition()
{	
	if ((Npc_HasItems(hero,ItAt_DS2P_ShadowHorn_Competition) >= 3)
		 && (GB_CompetitionTime_01 < Wld_GetPassedTime(0)) && (GB_CompetitionState == 1))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_KilledSHadowBeast_01_info()
{
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_01_13_00");	//����! ��� �� �������� ����� ������ ����?
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_01_15_01");	//������� ���� ����, ������. �����, ����� ��������� ���� ���������?
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_01_13_02");	//��� ���! � � ����� ������! � � ���������� ���� ������ ��� ������, ����� � ����� ���� ����.
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_01_15_03");	//��� ���? �� ����� �������� ������ �� �����!
	// ����� ������ �������� �� ��
	B_Attack(self,other,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// �����������, ���� �� �������� ����� ������ �� ������ ������� � ������
// nr = 1

instance DIA_GrayBeard_KilledShadowBeast_02(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_KilledShadowBeast_02_condition;	
	information = DIA_GrayBeard_KilledShadowBeast_02_info;
	description = " ";
};

func int DIA_GrayBeard_KilledShadowBeast_02_condition()
{	
	if ((GB_CompetitionState == 4) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_KilledSHadowBeast_02_info()
{
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_02_13_00");	//��-��! � ����� ������ ����! ����� ������ �������, ��� � ������!
	Info_ClearChoices(DIA_GrayBeard_KilledShadowBeast_02);
	Info_AddChoice(DIA_GrayBeard_KilledShadowBeast_02,"����� ��� ���� ����������.",DIA_GrayBeard_KilledShadowBeast_02_Fight);
	Info_AddChoice(DIA_GrayBeard_KilledShadowBeast_02,"���� �������.",DIA_GrayBeard_KilledShadowBeast_02_NoFight);
};

// �����������, ���� ������� ������� "���� �������." � ������� � ����� �������

func void DIA_GrayBeard_KilledShadowBeast_02_NoFight()
{
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_02_NoFight_15_00");	//���� ������ �������.
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_02_NoFight_13_01");	//��-��, �������� �������! ������ ��������! ���� ���� �������� � ����� �������, ���������!
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "����� ��� ���� ����������." � ������� � ����� �������

func void DIA_GrayBeard_KilledShadowBeast_02_Fight()
{
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_02_Fight_15_00");	//����� ��� ���� ����������.
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_02_Fight_13_01");	//���?! � �� �����, ���� ��� ������.
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_02_Fight_15_02");	//�� ������ ��-��������, ����� ��-�������.
	// ����� ������ �������� �� ��
	B_Attack(self,other,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// �������������, ���� ����� ������� ��������� ����� ������ ��� � ������
// nr = 1

instance DIA_GrayBeard_KilledShadowBeast_03(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_KilledShadowBeast_03_condition;	
	information = DIA_GrayBeard_KilledShadowBeast_03_info;
	description = " ";
};

func int DIA_GrayBeard_KilledShadowBeast_03_condition()
{	
	if (GB_CompetitionState > 1 && Npc_IsInState(self,ZS_Talk) && Hlp_StrCmp(Npc_GetNearestWP(self),"TEST_WP")) //UNFINISHED - ���� ������� �������� �� ���������� START
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_KilledShadowBeast_03_info()
{
	TRIA_Start();
	TRIA_Invite(GrayBeard);
	if (!Npc_IsDead(PIR_201_DS2P_Greg)) // ���� ���� �����, �� ������� ������� �����
	{
		TRIA_Invite(Greg);
	}
	else
	{
		TRIA_Invite(Karah);
	};
	if ((GB_CompetitionState == 6) || (GB_CompetitionState == 2)) // ���� �� ������ ����, � �� ������� �� � ����� ������
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_00");	//����, ��, � ����, �������� � �����. � ������ ����� ����� ������ ������ ���������, ��� ���������� ���� �������� ���� ����.
			GB_Comp_01_Winner = 1;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_12);
		}
		else
		{
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_01");	//����, ��, � ����, �������� � �����. � ������ ����� ����� ������ ������ ���������, ��� ���������� ���� �������� ���� ����.
			GB_Comp_01_Winner = 1;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_12);
		};
	}
	else if (GB_CompetitionState == 3)
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_02");	//����, ����������� ����������� ����� ������. �� �������� ���� ����.
			AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_03_15_03");	//��� ��������, � ����� ������� �� ���������� ������, � �� ������� � ���� ������.
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_04");	//������� � �� ������ ������ ������, �� � �������� ������ � �����, ������.
			GB_Comp_01_Winner = 2;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_13);
		}
		else
		{
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_05");	//����, ����������� ����������� ����� ������. �� �������� ���� ����.
			AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_03_15_03");	//��� ��������, � ����� ������� �� ���������� ������, � �� ������� � ���� ������.
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_06");	//������� � �� ������ ������ ������, �� � �������� ������ � �����,
			GB_Comp_01_Winner = 2;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_13);
		};
	}
	else if ((GB_CompetitionState == 7) || (GB_CompetitionState == 8))
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_07");	//����, ����������� ����������� ����� ������. �� �������� ���� ����.
			GB_Comp_01_Winner = 2;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_14);
		}
		else
		{
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_08");	//����, ����������� ����������� ����� ������. �� �������� ���� ����.
			GB_Comp_01_Winner = 2;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_14);
		};
	}
	else if (GB_CompetitionState == 5)
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_09");	//������ � ���� ����� ������������ ������ ����������� �����, �� �������� ���� ����.
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(self,Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_13_10");	//���������! �� ��������� ����!!!
			TRIA_Next(Greg);
			AI_TurnToNpc(self,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_11");	//������, � ��������� ��� �� ������ ����� � ������� ������.
			AI_TurnToNpc(self,other);
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_15);
		}
		else
		{
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_12");	//������ � ���� ����� ������������ ������ ����������� �����, �� �������� ���� ����.
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(self,Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_13_10");	//���������! �� ��������� ����!!!
			TRIA_Next(Greg);
			AI_TurnToNpc(self,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_13");	//������, � ��������� ��� �� ������ ����� � ������� ������.
			AI_TurnToNpc(self,other);
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_15);
		};
	};
	if (!Npc_IsDead(PIR_201_DS2P_Greg))
	{
		GB_CompetitionState = 9;
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_14");	//������ ���� ����� �������. ��� �� �������� ������ �� ����� � �����, ����� ����� ����������. ��� ��������� ��������� ���� � ������. � ������� �������� �� �� ��������� ���� �� ���������� ���, �� ��� ��� �� ������������ ������� ������������ ����, �������� ������� �� �����. ������?
		AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_03_15_15");	//�����.
		TRIA_Next(GrayBeard);
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_13_16");	//� ��� ������ �����.
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_17");	//����� ������!
	}
	else
	{
		GB_CompetitionState = 9;
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_18");	//������ ���� ����� �������. ��� �� �������� ������ �� ����� � �����, ����� ����� ����������. ��� ��������� ��������� ���� � ������. � ������� �������� �� �� ��������� ���� �� ���������� ���, �� ��� ��� �� ������������ ������� ������������ ����, �������� ������� �� �����. ������?
		AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_03_15_15");	//�����.
		TRIA_Next(GrayBeard);
		AI_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_13_16");	//� ��� ������ �����.
		TRIA_Next(Karah);
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_19");	//����� ������!
	};
	DIAG_Reset();
	TRIA_Finish();
	// ����� ������ ������� �� ��
	B_Attack(self,other,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// �����������, ����� ���-���� ������� �� ������ ���������
// nr = 1

instance DIA_GrayBeard_SecondCompetition(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_SecondCompetition_condition;	
	information = DIA_GrayBeard_SecondCompetition_info;
	description = " ";
};

func int DIA_GrayBeard_SecondCompetition_condition()
{	
	if ((GB_CompetitionState == 9) && (GB_Comp_02_Winner > 0) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_SecondCompetition_info()
{
	TRIA_Start();
	TRIA_Invite(GrayBeard);
	if (!Npc_IsDead(PIR_201_DS2P_Greg)) // ���� ���� �����, �� ������� �����
	{
		TRIA_Invite(Greg);
		if (GB_Comp_02_Winner == 1)
		{
			AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_00");	//����� ������ ��������. ��� ��������� �������� ���� ����.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_16);
		}
		else
		{
			AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_01");	//������ ������������ ����� ������.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_17);
		};
		AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_02");	//������ ������ ����. ��������� �������� � ��������. ��������� ������������ ����� ���� �� ��� ���, ���� ���� �� ��� �� �������� �� �����. �� ������?
		AI_Output(other,self,"DIA_GrayBeard_SecondCompetition_15_03");	//��.
		TRIA_Next(GrayBeard);
		AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_13_04");	//������ �����. �� � ���� � ���������� �������.
		Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
		Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(������)",DIA_GrayBeard_DrinkCompetition);
		DIAG_Reset();
		TRIA_Finish();
	}
	else
	{
		TRIA_Invite(Karah);
		if (GB_Comp_02_Winner == 1)
		{
			AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_03");	//����� ������ ��������. ��� ��������� �������� ���� ����.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_16);
		}
		else
		{
			AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_04");	//������ ������������ ����� ������.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_17);
		};
		AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_05");	//������ ������ ����. ��������� �������� � ��������. ��������� ������������ ����� ���� �� ��� ���, ���� ���� �� ��� �� �������� �� �����. �� ������?
		AI_Output(other,self,"DIA_GrayBeard_SecondCompetition_15_03");	//��.
		TRIA_Next(GrayBeard);
		AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_13_04");	//������ �����. �� � ���� � ���������� �������.
		Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
		Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(������)",DIA_GrayBeard_DrinkCompetition);
		DIAG_Reset();
		TRIA_Finish();
	};
};

func void DIA_GrayBeard_DrinkCompetition()
{
	var int UnconTime;
	if (GB_DrinkCompetition == 0)
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		CreateInvItem(self,ItFo_Addon_Grog);
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_DrinkCompetition_13_00");	//��! ������ �����. ���!
		GB_DrinkCompetition = GB_DrinkCompetition + 1;
		Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
		Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(������)",DIA_GrayBeard_DrinkCompetition);
	}
	else if (GB_DrinkCompetition == 1)
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		CreateInvItem(self,ItFo_Addon_Grog);
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(other,self,"DIA_GrayBeard_DrinkCompetition_15_01");	//��! �� ����� ��� �������, ����������?
		GB_DrinkCompetition = GB_DrinkCompetition + 1;
		Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
		Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(������)",DIA_GrayBeard_DrinkCompetition);
	}
	else if (GB_DrinkCompetition == 2)
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		if (C_Random(100) < GG_Fallen)
		{
			UnconTime = other.aivar[AIV_TIME_UNCONSCIOUS];
			other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
			Npc_DropUnconscious(other,0,other);
			other.aivar[AIV_TIME_UNCONSCIOUS] = UnconTime;
			GB_Comp_03_Winner = 2;
			AI_StopProcessInfos(self);
		}
		else
		{
			CreateInvItem(self,ItFo_Addon_Grog);
			B_UseItem(self,ItFo_Addon_Grog);
			AI_Output(self,other,"DIA_GrayBeard_DrinkCompetition_13_02");	//���-�� �������� ��������, �� ������.
			GB_DrinkCompetition = GB_DrinkCompetition + 1;
			Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
			Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(������)",DIA_GrayBeard_DrinkCompetition);
		};
	}
	else if (GB_DrinkCompetition == 3)
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		if (C_Random(100) < GG_Fallen)
		{
			UnconTime = other.aivar[AIV_TIME_UNCONSCIOUS];
			other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
			Npc_DropUnconscious(other,0,other);
			other.aivar[AIV_TIME_UNCONSCIOUS] = UnconTime;
			GB_Comp_03_Winner = 2;
			AI_StopProcessInfos(self);
		}
		else
		{
			CreateInvItem(self,ItFo_Addon_Grog);
			B_UseItem(self,ItFo_Addon_Grog);
			AI_Output(other,self,"DIA_GrayBeard_DrinkCompetition_15_03");	//� ��� ��� ����� ����.
			GB_DrinkCompetition = GB_DrinkCompetition + 1;
			Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
			Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(������)",DIA_GrayBeard_DrinkCompetition);
		};
	}
	else
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		if (C_Random(100) < GG_Fallen)
		{
			UnconTime = other.aivar[AIV_TIME_UNCONSCIOUS];
			other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
			Npc_DropUnconscious(other,0,other);
			other.aivar[AIV_TIME_UNCONSCIOUS] = UnconTime;
			GB_Comp_03_Winner = 2;
			AI_StopProcessInfos(self);
		}
		else
		{
			CreateInvItem(self,ItFo_Addon_Grog);
			B_UseItem(self,ItFo_Addon_Grog);
			if (C_Random(100) < GrayBeard_Fallen)
			{
				UnconTime = self.aivar[AIV_TIME_UNCONSCIOUS];
				self.aivar[AIV_TIME_UNCONSCIOUS] = 3;
				Npc_DropUnconscious(self,0,other);
				self.aivar[AIV_TIME_UNCONSCIOUS] = UnconTime;
				GB_Comp_03_Winner = 1;
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(other,self,"DIA_GrayBeard_DrinkCompetition_15_04");	//���!
				GB_DrinkCompetition = GB_DrinkCompetition + 1;
				Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
				Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(������)",DIA_GrayBeard_DrinkCompetition);
			};
		};
	};
};

// �����������, ����� ���-���� ������� � ������� ���������
// nr = 1

instance DIA_GrayBeard_ThirdCompetition(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_ThirdCompetition_condition;	
	information = DIA_GrayBeard_ThirdCompetition_info;
	description = " ";
};

func int DIA_GrayBeard_ThirdCompetition_condition()
{	
	if (GB_Comp_03_Winner > 0)
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_ThirdCompetition_info()
{
	const int GB_Wins = 0; // ������ ����� ������
	const int GG_Wins = 0; // ������ ��
	if (GB_Comp_01_Winner == 1)
	{
		GG_Wins = GG_Wins + 1;
	}
	else
	{
		GB_Wins = GB_Wins + 1;
	};
	if (GB_Comp_02_Winner == 1)
	{
		GG_Wins = GG_Wins + 1;
	}
	else
	{
		GB_Wins = GB_Wins + 1;
	};
	if (GB_Comp_03_Winner == 1)
	{
		GG_Wins = GG_Wins + 1;
	}
	else
	{
		GB_Wins = GB_Wins + 1;
	};
	TRIA_Start();
	TRIA_Invite(GrayBeard);
	if (!Npc_IsDead(PIR_201_DS2P_Greg)) // ���� ���� �����, �� ������� �����
	{
		TRIA_Invite(Greg);
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_00");	//����, ������ ����� �������� �����.
		if (GB_Comp_03_Winner == 1) // ���� ������� ��
		{
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_01");	//������ � ���� ����� ������������ ������ ����������� �����. ��, ������, ���������-�� ������ ������� � �������.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_18);
		}
		else
		{
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_02");	//� ���� ��� ������ ������� ����� ������.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_19);
		};
		if (GG_Wins > 1) // ���� � ������������ ������� ��
		{
			AI_TurnToNpc(Greg,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_03");	//������ � ������������ ������� ��� ���������� ����. ����� ������, ��������� �� �� ���� ���������?
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(GrayBeard,Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_04");	//��
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_05");	//�� ��������.
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_06");	//��, ���� ������! �������! ��������?
			AI_TurnToNpc(other,GrayBeard);
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_07");	//������.
			TRIA_Next(Greg);
			AI_TurnToNpc(Greg,other);
			AI_TurnToNpc(other,Greg);
			AI_TurnToNpc(GrayBeard,other);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_07");	//����, ��� �� �� ���������� �� ������������?
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_08");	//�� ��� �����. �������� ����, ��� ���� ��������� �, �� �� �������� ������� �� ������� ���.
			AI_TurnToNpc(Greg,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_09");	//������, ������? ��������� ��������, ����� �� ��������� ����, ��� ��������, �� ������������ ����� ������������. ���� ������������, ����� ����������� ���� �������?
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(GrayBeard,Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_10");	// ���, � ������� �� ��� � �� ������ � ��� �������� �� ��� ���, ���� ��� ���� �� ��������� �� ����. ��� ������?
			AI_TurnToNpc(other,GrayBeard);
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_11");	//������.
			AI_TurnToNpc(Greg,other);
			AI_TurnToNpc(GrayBeard,other);
			AI_TurnToNpc(other,Greg);
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_12");	//� ����� ������ ������������ ����������� ���������. ����� �����������.
			GB_CompetitionState = 10;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_20);
			B_StartOtherRoutine(Greg,"START");
			B_StartOtherRoutine(Karah,"START");
			B_StartOtherRoutine(Symon,"START");
			DIAG_Reset();
			TRIA_Finish();
			AI_StopProcessInfos(self);
		}
		else // � ������������ ������� ����� ������
		{
			AI_TurnToNpc(other,Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_13");	//������ � ������������ ������������ ����� ������.
			AI_TurnToNpc(GrayBeard,other);
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_14");	//��-��! � �� �������, ��� �� ���� �� ���� ��������, �����!
			AI_TurnToNpc(Greg,GrayBeard);
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_15");	//��� �� ���������� �� ������������?
			AI_TurnToNpc(GrayBeard,Greg);
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_16");	//�� �������� �� ����� ������� ���, � ��� ����� �������� ������ ����, �� ��.
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_17");	//��� �, �����������. ����� � � �� � ��� ��������� � ��� ����, ��� �� ���������� �� ���.
			AI_TurnToNpc(Greg,other);
			AI_TurnToNpc(GrayBeard,other);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_18");	//��� �������� � ����� ������� ������������?
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_19");	//������� ���� ��������.
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_20");	//����� ����� �����������.
			GB_CompetitionState = 11;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_21);
			B_StartOtherRoutine(Greg,"START");
			B_StartOtherRoutine(Karah,"START");
			B_StartOtherRoutine(Symon,"START");
			DIAG_Reset();
			TRIA_Finish();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		TRIA_Invite(Karah);
		TRIA_Next(Karah);
		AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_21");	//����, ������ ����� �������� �����.
		if (GB_Comp_03_Winner == 1) // ���� ������� ��
		{
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_22");	//������ � ���� ����� ������������ ������ ����������� �����. ��, ������, ���������-�� ������ ������� � �������.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_18);
		}
		else
		{
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_23");	//� ���� ��� ������ ������� ����� ������.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_19);
		};
		if (GG_Wins > 1) // ���� � ������������ ������� ��
		{
			AI_TurnToNpc(Karah,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_24");	//������ � ������������ ������� ��� ���������� ����. ����� ������, ��������� �� �� ���� ���������?
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(GrayBeard,Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_04");	//��
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_25");	//�� ��������.
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_06");	//��, ���� ������! �������! ��������?
			AI_TurnToNpc(other,GrayBeard);
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_07");	//������.
			TRIA_Next(Karah);
			AI_TurnToNpc(Karah,other);
			AI_TurnToNpc(other,Karah);
			AI_TurnToNpc(GrayBeard,other);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_26");	//����, ��� �� �� ���������� �� ������������?
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_08");	//�� ��� �����. �������� ����, ��� ���� ��������� �, �� �� �������� ������� �� ������� ���.
			AI_TurnToNpc(Karah,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_27");	//������, ������? ��������� ��������, ����� �� ��������� ����, ��� ��������, �� ������������ ����� ������������. ���� ������������, ����� ����������� ���� �������?
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(GrayBeard,Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_10");	// ���, � ������� �� ��� � �� ������ � ��� �������� �� ��� ���, ���� ��� ���� �� ��������� �� ����. ��� ������?
			AI_TurnToNpc(other,GrayBeard);
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_11");	//������.
			AI_TurnToNpc(Karah,other);
			AI_TurnToNpc(GrayBeard,other);
			AI_TurnToNpc(other,Karah);
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_28");	//� ����� ������ ������������ ����������� ���������. ����� �����������.
			GB_CompetitionState = 10;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_20);
			B_StartOtherRoutine(Karah,"START");
			B_StartOtherRoutine(Symon,"START");
			DIAG_Reset();
			TRIA_Finish();
			AI_StopProcessInfos(self);
		}
		else // � ������������ ������� ����� ������
		{
			AI_TurnToNpc(other,Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_29");	//������ � ������������ ������������ ����� ������.
			AI_TurnToNpc(GrayBeard,other);
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_14");	//��-��! � �� �������, ��� �� ���� �� ���� ��������, �����!
			AI_TurnToNpc(Karah,GrayBeard);
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_30");	//��� �� ���������� �� ������������?
			AI_TurnToNpc(GrayBeard,Karah);
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_16");	//�� �������� �� ����� ������� ���, � ��� ����� �������� ������ ����, �� ��.
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_31");	//��� �, �����������. ����� � � �� � ��� ��������� � ��� ����, ��� �� ���������� �� ���.
			AI_TurnToNpc(Karah,other);
			AI_TurnToNpc(GrayBeard,other);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_32");	//��� �������� � ����� ������� ������������?
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_19");	//������� ���� ��������.
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_33");	//����� ����� �����������.
			GB_CompetitionState = 11;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_21);
			B_StartOtherRoutine(Karah,"START");
			B_StartOtherRoutine(Symon,"START");
			DIAG_Reset();
			TRIA_Finish();
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_GrayBeard_AfterCompetition(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	condition = DIA_GrayBeard_AfterCompetition_condition;	
	information = DIA_GrayBeard_AfterCompetition_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};
func int DIA_GrayBeard_AfterCompetition_condition()
{
	if (GB_CompetitionState > 9)
	{	
		return TRUE;	
	};
};	

func void DIA_GrayBeard_AfterCompetition_info()
{
	if (GB_CompetitionState == 10) // ������ ��
	{
		AI_Output(self,other,"DIA_Karah_AfterCompetition_13_00");	//������� ����� ������, ������. � ������ ������� �� ����, ���� � ���� ������� �� ������.
	}
	else // �������� ��
	{
		AI_Output(self,other,"DIA_Karah_AfterCompetition_13_01");	//����� ������ ����� �������, ��� �� ������. � �� ���, ������� ��� ����� ��������� ������, ���������.
	};
};

/* UNFINISHED

����� - ��� ���������

*/
