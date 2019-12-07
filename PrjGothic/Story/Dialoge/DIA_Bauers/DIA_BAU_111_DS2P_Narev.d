instance DIA_Narev_EXIT(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Narev_EXIT_condition;	
	information = DIA_Narev_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Narev_EXIT_condition(){	return TRUE;};
func void DIA_Narev_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 02/07/2013 ===========================
//  ��������� 
//===========================================
instance DIA_Narev_Start(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 0;
	condition = DIA_Narev_Start_condition;	
	information = DIA_Narev_Start_info;
	important = TRUE;
};
func int DIA_Narev_Start_condition()
{
	if (Npc_IsInState(self, ZS_Talk)){	return TRUE;};
};
func void DIA_Narev_Start_info()
{
		AI_Output(self,other,"DIA_Narev_Start_16_00");	//�����, � ���� ������ �� �����. �� �� �� ���� �� �������, � ���� ��������� �����?
	AI_Output(other,self,"DIA_Narev_Start_15_01");	//��, ���������. � ������� ������ �� ������.
		AI_Output(self,other,"DIA_Narev_Start_16_02");	//(�������) ��-��... (���������)
		AI_Output(self,other,"DIA_Narev_Start_16_03");	//�������� � ���� ���� ������������ �������. �����, ���-�� ����� � � ������� �����. ���������� ���� �� ���� ����� � ��� � ����� �����. ������� ��� ���, ������.
		AI_Output(self,other,"DIA_Narev_Start_16_04");	//���, ������, �� ���� � ��� ����� ���. ����� ���� ������ �� ����� �����. � ��� ���� ���� �� ������ �����, � �� ����-�� �� ��������.
		AI_Output(self,other,"DIA_Narev_Start_16_05");	//������� � ������� � �������, ��� ��������-��, �����, � � �������, ������ ���������� ��� ����� ��� ���� �� ��������. �� � ��� ���� � ������� �������.
		AI_Output(self,other,"DIA_Narev_Start_16_06");	//���� �� ����. ��� ������ � � ����� �� �����. � � ������ ����� �����... ����� ���, ������. (�������)
		AI_Output(self,other,"DIA_Narev_Start_16_07");	//� ��� ������:  �������� � ������� �����, �������� ��� ������ ������. ������ ����� ���: ���� ����� �� ������� � �������� ��������...
	AI_Output(other,self,"DIA_Narev_Start_15_08");	//� ��� �� �� ������?
		AI_Output(self,other,"DIA_Narev_Start_16_09");	//� � ����� ����� ��������, ���� ��� �� ���������, ���� � ���� � �������. � �����-�� ��� �����������.
		AI_Output(self,other,"DIA_Narev_Start_16_10");	//��, � �����, ����� � ��� ���� �� �������. ������: ��� �� ������, �� ���������. �� �� �� �� ������ ������ � �������, �� �� ����� ���������. ��� �����?!
	AI_Output(other,self,"DIA_Narev_Start_15_11");	//� � ���� �� ��� ��� ���������?
		AI_Output(self,other,"DIA_Narev_Start_16_12");	//� ����? �� ���, �����������... ���! ������� � ����� ������, ��� ����� ��� ������.
		AI_Output(self,other,"DIA_Narev_Start_16_13");	//���� ��� �����. ����� �����. (�������)
		AI_Output(self,other,"DIA_Narev_Start_16_14");	//��� ���� ������ �������, ��� ����� ���� ��������, �� ���� � ������� ���� ��������. �� ��� �� ��� ���� ��������, � ������-��?
};


//NS - 02/07/2013 ===========================
//  ����� �������, ����� ����������
//===========================================
//-------------------------------------------
//	���� ���, ���� ����	 (+����)	nr = 1;
instance DIA_Narev_GiveHoney(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 1;
	condition = DIA_Narev_GiveHoney_condition;	
	information = DIA_Narev_GiveHoney_info;
	description = "� ���� ���� ���.";
};
func int DIA_Narev_GiveHoney_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start) && (Npc_HasItems(other,ItFo_Honey) > 0))
	{	return TRUE;};
};
func void DIA_Narev_GiveHoney_info()
{
	var int x;
	AI_Output(other,self,"DIA_Narev_GiveHoney_15_00");	//� ���� ���� ���.
	//(+����)
	B_GivePlayerXP(XP_Narev_GiveHoney);
		AI_Output(self,other,"DIA_Narev_GiveHoney_16_01");	//�� �� �������, �� �� ������� ������. ������� ����!
		AI_Output(self,other,"DIA_Narev_GiveHoney_16_02");	//� � �� �����, ��� ����� �� �������! ������ ����� ����� �� �������� �����.
	//�������� ���
	x = 1; if (x == 1)	{
		B_DS_GiveRemoveItems(other,self,ItFo_Honey,1);
	};
		AI_Output(self,other,"DIA_Narev_GiveHoney_16_03");	//���� �� ��������� ���� �� ������, �� � ���� ����� ����� ����� ������ � ���.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"������ �� �����, �� ������� �������������.",DIA_Narev_GiveHoney_Nothing);
	Info_AddChoice(DIA_Narev_GiveHoney,"���� ���� ����� �� ��������?",DIA_Narev_GiveHoney_Money);
};
func void DIA_Narev_GiveHoney_Money()
{
	var int x;
	AI_Output(other,self,"DIA_Narev_GiveHoney_Money_15_00");	//���� ���� ����� �� ��������?
		AI_Output(self,other,"DIA_Narev_GiveHoney_Money_16_01");	//������ �����, ������ ��������. ������, � �������, ���� �������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Money_16_02");	//� ��� ��� ��� � �����. �� ������ ���� ��������. �� ���� �� ��� ������. ����.
	//���� 50 �����
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};
};
func void DIA_Narev_GiveHoney_Nothing()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Nothing_15_00");	//������ �� �����, �� ������� �������������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Nothing_16_01");	//�� ����� ��������� ������ �����. � ����� ����� ������ ��������, ��������, ����� ��� �� ����� ������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Nothing_16_02");	//� ���� � ���� ������ ���, ���� � ���� ����� ���������� �������. ����� � ���� �������� ���� �������.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"� ������������� ��������.",DIA_Narev_GiveHoney_Listen1);
	Info_AddChoice(DIA_Narev_GiveHoney,"����� � ������ ���.",DIA_Narev_GiveHoney_Later);
};
func void DIA_Narev_GiveHoney_Later()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Later_15_00");	//����� � ������ ���.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Later_16_01");	//� ������, �� ����� ���. ��� ��� ������� ����.
	Info_ClearChoices(DIA_Narev_GiveHoney);
};
func void DIA_Narev_GiveHoney_Listen()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Listen_15_00");	//� ������������� ��������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen_16_01");	//(�������) � ���� �� ������? �, ���, �����.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen_16_02");	//���� ��� ����� ��� ���������� ��� ���� ������. �� � ����� ������ ����������� �� ��������. ��, �����, ������ � ���� � ��� ������, �������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen_16_03");	//�� ���, ����������� ������, �� � ������ ����������. ����� �� �����, ��� ��� ������ ������ ����� � ������ ��� ���������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen_16_04");	//��� ���, �����, �����. ������. ����� �����, �����. ������. �������-�� ����� ���������� � �� ��� ������ �� �������.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"������, �� ��� ����� ����.",DIA_Narev_GiveHoney_Interrupt1);
	Info_AddChoice(DIA_Narev_GiveHoney,"���������.",DIA_Narev_GiveHoney_Listen1);
};
func void DIA_Narev_GiveHoney_Interrupt1()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Interrupt1_15_00");	//������, �� ��� ����� ����.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Interrupt1_16_01");	//������. �������, � ���� ���� ���. �� ���� ���� �����������.
	Info_ClearChoices(DIA_Narev_GiveHoney);
};
func void DIA_Narev_GiveHoney_Listen1()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Listen1_15_00");	//���������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen1_16_01");	//������ ��������� �����. � ��� ����� �, ����-����, ����-����.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen1_16_02");	//�� ������ ��������� ��������� � ����� ���������. ���������-�� ���� �� ��������. ������� �������� � ������, �� ����� �� �����. �������������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen1_16_03");	//���� ����� �� ���� �� ����� ��������� � ��� ����� ���� ����� ������ � �����.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"��� ������� ��� �������, ������.",DIA_Narev_GiveHoney_Interrupt2);
	Info_AddChoice(DIA_Narev_GiveHoney,"���������.",DIA_Narev_GiveHoney_Listen2);
};
func void DIA_Narev_GiveHoney_Interrupt2()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Interrupt2_15_00");	//��� ������� ��� �������, ������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Interrupt2_16_01");	//��, �������. ���-�� � ����������. ����� ����������.
	Info_ClearChoices(DIA_Narev_GiveHoney);
};
func void DIA_Narev_GiveHoney_Listen2()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_Listen2_15_00");	//���������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen2_16_01");	//����, �������, � ���� �� ��������� �������. ��-�� � ����� ��������� ������� �������� �����.
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen2_16_02");	//�� �� �� �������� � ��� � ������. (�������)
		AI_Output(self,other,"DIA_Narev_GiveHoney_Listen2_16_03");	//��������� �����, ������� � ����� �����. ��� ����� ��� �������.

	Info_ClearChoices(DIA_Narev_GiveHoney);
	Info_AddChoice(DIA_Narev_GiveHoney,"���� �����-��.",DIA_Narev_GiveHoney_BadStory);
	Info_AddChoice(DIA_Narev_GiveHoney,"���������� �������.",DIA_Narev_GiveHoney_GoodStory);
};
func void DIA_Narev_GiveHoney_BadStory()
{
	AI_Output(other,self,"DIA_Narev_GiveHoney_BadStory_15_00");	//���� �����-��.
		AI_Output(self,other,"DIA_Narev_GiveHoney_BadStory_16_01");	//��, ������� ���������� �� ����� �������������. � ���� � ��� �������� � ����� ���.
	Info_ClearChoices(DIA_Narev_GiveHoney);
};
func void DIA_Narev_GiveHoney_GoodStory()
{
	var int x;
	AI_Output(other,self,"DIA_Narev_GiveHoney_GoodStory_15_00");	//���������� �������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_01");	//�� ������� ���� ��� ���� ������. � ��� ���������� ����� �����.
	AI_Output(other,self,"DIA_Narev_GiveHoney_GoodStory_15_02");	//� ��� ��?
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_03");	//������� �� ������ ��� ���, ���� � �� ������ ���� �� ����, � ����� ����� �� �� �������� ������ �� ���� �����. �� �������� ������ ������� � �� ���� �� ������� ����, � ���� �������� � �����.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_04");	//� ��� ����� �� �������� ����� �����, ������� ����� �� �� �����������, ������� �� ����� �������� � �������, ���������� � ��������� �������.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_05");	//� ���� ������������ ���� �� ���. �� ��������. ������ ���� ���� � ��� �� ������, ��� ������� � �����������.
	// UNFINISHED ������� ������ � �������
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_06");	//��� ��������� /*Redleha: ���-�� � ���-��. ���� ���������*/. ��, � ������ �������� � �����.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_07");	//��� ������� ������ ������������ ������, ��� ����� ���� ����� ������. ����� ������� ������, � � ������� ����� ���-��� ��� ����.
	AI_Output(other,self,"DIA_Narev_GiveHoney_GoodStory_15_08");	//��� � �������?
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_09");	//� ��� �� ����. ���� ��� ��� ���� � ������, ��� �� ����� �����-�� ������� ��������, �� ��� ��� ������� �� ����������� � ������ � ���� ������ ��, ����� �������� � �����, ����� �� ��������� ����.
		AI_Output(self,other,"DIA_Narev_GiveHoney_GoodStory_16_10");	//� ����� ������ ������� ��� ������� ��������. �� � ����� ���� ����, � �������� ���� ��� ������ � ����� �, ���, �� �����. �������, ���� �������� ������� ���� � ����� �����������.
	//���� ����  ��� ������� �� ������
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ITKE_KEY_DS2P_NAREV,1);
	};
	Narev_GaveKey = TRUE;
};


//-------------------------------------------
//	"�������, ��� ��� ������ ������?"		nr = 2;
instance DIA_Narev_WheresChest(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 2;
	condition = DIA_Narev_WheresChest_condition;	
	information = DIA_Narev_WheresChest_info;
	description = "�������, ��� ��� ������ ������?";
};
func int DIA_Narev_WheresChest_condition()
{
	if (Narev_GaveKey == TRUE){	return TRUE;};
};
func void DIA_Narev_WheresChest_info()
{
	AI_Output(other,self,"DIA_Narev_WheresChest_15_00");	//�������, ��� ��� ������ ������?
	// UNFINISHED ������� ������ � �������
		AI_Output(self,other,"DIA_Narev_WheresChest_16_01");	//��� ��������� /*Redleha: ���-�� � ���-��. ���� ���������*/.
		AI_Output(self,other,"DIA_Narev_WheresChest_16_02");	//��� �� ������ ������. ������ ����� ����� ����.
};


//-------------------------------------------
//	"����� �� ������ � ���� ������?"		nr = 3;
instance DIA_Narev_HowLongAUThere(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 3;
	condition = DIA_Narev_HowLongAUThere_condition;	
	information = DIA_Narev_HowLongAUThere_info;
	description = "����� �� ������ � ���� ������?";
};
func int DIA_Narev_HowLongAUThere_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start)){	return TRUE;};
};
func void DIA_Narev_HowLongAUThere_info()
{
	AI_Output(other,self,"DIA_Narev_HowLongAUThere_15_00");	//����� �� ������ � ���� ������?
		AI_Output(self,other,"DIA_Narev_HowLongAUThere_16_01");	//�� � ��� ������� ���� �������. (�������)
		AI_Output(self,other,"DIA_Narev_HowLongAUThere_16_02");	//�� ������, ����� ������ � �������, �� ������� �������� ����, ����� ���, � ����� ���������, ��� ��� �� �������������, ������� �� ������ ������� � �� �� ����, �� �� ���.
};


//-------------------------------------------
//	"�� ������, ��� ������ ���������?" (���� ��� �� �����)		nr = 4;
instance DIA_Narev_WhereAHunters(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 4;
	condition = DIA_Narev_WhereAHunters_condition;	
	information = DIA_Narev_WhereAHunters_info;
	description = "�� ������, ��� ������ ���������?";
};
func int DIA_Narev_WhereAHunters_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start)){	return TRUE;};
};
func void DIA_Narev_WhereAHunters_info()
{
	AI_Output(other,self,"DIA_Narev_WhereAHunters_15_00");	//�� ������, ��� ������ ���������?
		AI_Output(self,other,"DIA_Narev_WhereAHunters_16_01");	//���... ����� ���������� ������� ����������� �� ��� ���� � ����, ���������.
		AI_Output(self,other,"DIA_Narev_WhereAHunters_16_02");	//� ��� ����� ��� ���������, ������, ��� ���, ��� ��� ���, ��� ��������, � ��� ����� �������, �� �������������� ���������. ���� � ������ ����� ������� ���� � ������.
		AI_Output(self,other,"DIA_Narev_WhereAHunters_16_03");	//� ���� �� ����, ��� ������ ��� ����������. ����� ����, �� ��� ���������� � ��������� �������?
	AI_Output(other,self,"DIA_Narev_WhereAHunters_15_04");	//� ����� ��� ��������. ������, �������, �� ������ ������, �� � ����� ����� ���� ��������. � �� �����, ����� ��� ���-�� ���������� ��� ������������ ��������� ����.
		AI_Output(self,other,"DIA_Narev_WhereAHunters_16_05");	//�� ���� ��������. ������, � ��� ��� ���� ���� ������. ������� ���� �� ��� �������.
};


//-------------------------------------------
//	"��� �� ���� ����������?" (����������)		nr = 5;
instance DIA_Narev_HowAU(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 5;
	condition = DIA_Narev_HowAU_condition;	
	information = DIA_Narev_HowAU_info;
	description = "��� �� ���� ����������?";
	permanent = TRUE;
};
func int DIA_Narev_HowAU_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start)){	return TRUE;};
};
func void DIA_Narev_HowAU_info()
{
	AI_Output(other,self,"DIA_Narev_HowAU_15_00");	//��� �� ���� ����������?
		AI_Output(self,other,"DIA_Narev_HowAU_16_01");	//(�������) ������, ���� ���������, ��� � ��� ������ �� ����� � ������ �������. �� ��� �� ����, ���������!
};


//-------------------------------------------
//	"�������� ��� ���������� �������." (����������)		nr = 6;
instance DIA_Narev_TellMeStory(C_Info)
{
	npc = BAU_111_DS2P_Narev;
	nr = 6;
	condition = DIA_Narev_TellMeStory_condition;	
	information = DIA_Narev_TellMeStory_info;
	description = "�������� ��� ���������� �������.";
	permanent = TRUE;
};
func int DIA_Narev_TellMeStory_condition()
{
	if (Npc_KnowsInfo(other,DIA_Narev_Start)){	return TRUE;};
};
func void DIA_Narev_TellMeStory_info()
{
	AI_Output(other,self,"DIA_Narev_TellMeStory_15_00");	//�������� ��� ���������� �������.
		AI_Output(self,other,"DIA_Narev_TellMeStory_16_01");	//� ��� �� ������ ���������?
		AI_Output(self,other,"DIA_Narev_TellMeStory_16_02");	//� ���� ���� ����������, ��� ����� � ���� �������, ��� ��������� � ����� ��������, � ������ � ������� �����, � ����� ����� �� ��������� ������.

	Info_ClearChoices(DIA_Narev_TellMeStory);
	Info_AddChoice(DIA_Narev_TellMeStory,Dialog_Back,DIA_Narev_TellMeStory_Back);
	Info_AddChoice(DIA_Narev_TellMeStory,"�������� �� ����� �� ������.",DIA_Narev_TellMeStory_Octopus);
	Info_AddChoice(DIA_Narev_TellMeStory,"�������� � ������ � ������� �����.",DIA_Narev_TellMeStory_OldCity);
	Info_AddChoice(DIA_Narev_TellMeStory,"�������� � ������ � ��������.",DIA_Narev_TellMeStory_Gobbo);
	Info_AddChoice(DIA_Narev_TellMeStory,"�������� � ����������� � ���� �������.",DIA_Narev_TellMeStory_Dragon);
};
func void DIA_Narev_TellMeStory_Back()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};
// UNFINISHED ������� �������
func void DIA_Narev_TellMeStory_Dragon()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};
func void DIA_Narev_TellMeStory_Gobbo()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};
func void DIA_Narev_TellMeStory_OldCity()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};
func void DIA_Narev_TellMeStory_Octopus()
{
	Info_ClearChoices(DIA_Narev_TellMeStory);
};


