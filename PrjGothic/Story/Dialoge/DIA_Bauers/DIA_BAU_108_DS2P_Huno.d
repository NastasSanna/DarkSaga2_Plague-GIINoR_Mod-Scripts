instance DIA_Huno_EXIT(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Huno_EXIT_condition;	
	information = DIA_Huno_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Huno_EXIT_condition(){	return TRUE;};
func void DIA_Huno_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 23/06/2013 ===========
//  ���������: ��� ��? 
//===========================
instance DIA_Huno_Start(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 0;
	condition = DIA_Huno_Start_condition;	
	information = DIA_Huno_Start_info;
	description = "��� ��?";
};
func int DIA_Huno_Start_condition()
{
	return TRUE;
};
func void DIA_Huno_Start_info()
{
	AI_Output(other,self,"DIA_Huno_Start_15_00");	//��� ��?
		AI_Output(self,other,"DIA_Huno_Start_13_01");	//� ����, ������. � ���� �� ������ ������� � ����, ��������� �������.
		AI_Output(self,other,"DIA_Huno_Start_13_02");	//������, �������, �� ������ ��������, �� ��� ��������.
		AI_Output(self,other,"DIA_Huno_Start_13_03");	//�� ������� ��� � ��� ��� ������, ��� ���� ���� �� ���� �� ��������� � �����, �������� ���� �� � ����� �������. (�������)
};


//NS - 23/06/2013 ===========
//  ����� ������� ����� ����������
//===========================

// ---------------------------------
// "� ��� ��� �������� � ����?"	nr = 1
instance DIA_Huno_WhoElseWorkOnFields(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 1;
	condition = DIA_Huno_WhoElseWorkOnFields_condition;	
	information = DIA_Huno_WhoElseWorkOnFields_info;
	description = "� ��� ��� �������� � ����?";
};
func int DIA_Huno_WhoElseWorkOnFields_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_Start)) 
	{	return TRUE;	};
};
func void DIA_Huno_WhoElseWorkOnFields_info()
{
	AI_Output(other,self,"DIA_Huno_WhoElseWorkOnFields_15_00");	//� ��� ��� �������� � ����?
		AI_Output(self,other,"DIA_Huno_WhoElseWorkOnFields_13_01");	//������ ��� �������� ������ ����� � ���� ��������. ������ ��� �������� ���� � �����, �� ������ ������� �� � ������� ��������, ��������� ������ ���������� �� �������.
		AI_Output(self,other,"DIA_Huno_WhoElseWorkOnFields_13_02");	//������� �� �����, ��� ����� ������� ������� ������ � ���� ����. ������ ��� ��� �� �� �������� ������ ����. 
	AI_Output(other,self,"DIA_Huno_WhoElseWorkOnFields_15_03");	//������ ������ ���������� �� � ������?
		AI_Output(self,other,"DIA_Huno_WhoElseWorkOnFields_13_04");	//�� ��� �������� ����, ����� �� ������ ����-�����, � �� �������� �� ���� �� ���� ���������.
		AI_Output(self,other,"DIA_Huno_WhoElseWorkOnFields_13_05");	//� ���� ����� ���� ������� � ���� ����������� �� ���.
};

// ---------------------------------
// "��� ������?" (����������)	nr = 2
instance DIA_Huno_AboutYield(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 2;
	condition = DIA_Huno_AboutYield_condition;	
	information = DIA_Huno_AboutYield_info;
	permanent = TRUE;
	description = "��� ������?";
};
func int DIA_Huno_AboutYield_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_Start)) 
	{	return TRUE;	};
};
func void DIA_Huno_AboutYield_info()
{
	AI_Output(other,self,"DIA_Huno_AboutYield_15_00");	//��� ������?
		AI_Output(self,other,"DIA_Huno_AboutYield_13_01");	//���� ��� �� ������ ������. ��� �������� � ��������! 
};

// ---------------------------------
// "�������� ��� �� �������."	nr = 3
instance DIA_Huno_AboutIsland(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 3;
	condition = DIA_Huno_AboutIsland_condition;	
	information = DIA_Huno_AboutIsland_info;
	description = "�������� ��� �� �������.";
};
func int DIA_Huno_AboutIsland_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_Start)) 
	{	return TRUE;	};
};
func void DIA_Huno_AboutIsland_info()
{
	AI_Output(other,self,"DIA_Huno_AboutIsland_15_00");	//�������� ��� �� �������.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_01");	//��, ��, ��� ������� ��� ����, �� � ��� ��� �����. (�������)
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_02");	//� ��� ������ ������� �� ������. ���� ���� ������ ����� ������ �������, �������� � ������ ������� �����. ��������, ������ �������� �� �������.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_03");	//�� ��� ��� ��������. � ������ ������, � ������, ����� ��������, ��� ���������� ���� ������ ������ ������ �����.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_04");	//�� � ��� ��� ������. ��� ���� �� ��������� ���������, �� ��� ��������� ���������, �� ��� � ������ �� ������ ������, � ������. ����� ������� ���� ����������.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_05");	//� ��� � ��� ������, ��� �� �������� ���������. � ��� ���� �� ������ ��������, �� ���. �� ������� �������, ��� ������� ������� �� � ����� ������; � ���� ������� �� �������, �������� ����� � ����� ������ ����� ������, ��� ���� ������� �� ����� �����.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_06");	//�� � ��� ����� �� ������. ��� ���� �� � ���������� ���� �������, ��... ��, ��� ���� � ������������ �� �����, ��� ��� ��� ������ ������ ���.
};

// ---------------------------------
// "� ��� �� ������� ���� �������?"	nr = 3
instance DIA_Huno_AboutDragons(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 3;
	condition = DIA_Huno_AboutDragons_condition;	
	information = DIA_Huno_AboutDragons_info;
	description = "� ��� �� ������� ���� �������?";
};
func int DIA_Huno_AboutDragons_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_AboutIsland)) 
	{	return TRUE;	};
};
func void DIA_Huno_AboutDragons_info()
{
	AI_Output(other,self,"DIA_Huno_AboutDragons_15_00");	//� ��� �� ������� ���� �������?
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_01");	//��, ��� ����?! ���� �����-��, � �������-������� ���������.
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_02");	//����� �����, ��� �� ��� ����� ����. ��� ��������� �� ����� � ������� ��������, ������� �� ������ ����� ������.
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_03");	//�������-�� ������� ����� ������� � ������� ��������� ��������. ��� �������� ��, ��� ������� �� ����� ��������� � ���������.
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_04");	//�� � ���� �������, �������. ��� ������ ����� ����� ���, �� ��� ������ ��� �������.
	AI_Output(other,self,"DIA_Huno_AboutDragons_15_05");	//� � ��������� ����� ������� �� ����������? � �������� ��� �������� ����������� � �����������.
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_06");	//(����������� �������) �� ���-���, �� �� ���������! ������ � ���� ����� ������� ��������-��!
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_07");	//�������, ���� ������ �� ��� ����� � � ����� ������ �����?
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_08");	//��� ���! ������� � ��� ������ ��� �����, ����� �� ���������, �� �� ��������������, � �� �� ����� ������� ������ �� ��� �� ������ ���������. (������ �������)

};

//NS - 24/06/2013 ===========
//  �� ������ "����������� ��� ����"
//===========================

// ---------------------------------
// "� ���� ������� ���."	nr = 1
instance DIA_Huno_USeemTired(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 1;
	condition = DIA_Huno_USeemTired_condition;	
	information = DIA_Huno_USeemTired_info;
	description = "� ���� ������� ���.";
};
func int DIA_Huno_USeemTired_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_WhoElseWorkOnFields)) 
	{	return TRUE;	};
};
func void DIA_Huno_USeemTired_info()
{
	AI_Output(other,self,"DIA_Huno_USeemTired_15_00");	//� ���� ������� ���.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_01");	//��� ��. ���� ����, ��� � ���� �������� ������, ��� ��� � ��� ������ ����� �����������.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_02");	//��� ���� ���� � �� ����� ����� ���������. ���� ������ ����� �����������. �� � ��� ��� �� ���.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_03");	//����� ������� ������, � ������ � ���� ���. � ��� ������� ����� ������ ������� ������� �����, �� �� ��� �����������, �������, �������, ����� �� �����.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_04");	//� ������ ��� �� �������, �� ������. � �����, ���� ��� ��� � ���������, ����� �� ����� �� ���� ������, � ���� �� ����� ������.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_05");	//���, �������, ����� ����������� � ���������, �� � ���-�� �� ���������.
};

// ---------------------------------
// "� ������ ���� � �������������."	nr = 1
instance DIA_Huno_HelpWithInstruments(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 1;
	condition = DIA_Huno_HelpWithInstruments_condition;	
	information = DIA_Huno_HelpWithInstruments_info;
	description = "� ������ ���� � �������������.";
};
func int DIA_Huno_HelpWithInstruments_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_USeemTired)) 
	{	return TRUE;	};
};
func void DIA_Huno_HelpWithInstruments_info()
{
	AI_Output(other,self,"DIA_Huno_HelpWithInstruments_15_00");	//� ������ ���� � �������������.
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_01");	//� ��� ���������, � ���� ��� ���������, ����� �� �������? ��� �� ��� ����� ������?
	AI_Output(other,self,"DIA_Huno_HelpWithInstruments_15_02");	//�� ��� ���� �������, � ������ �� ������...
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_03");	//��� � � � ��� ��. ���� ������ ���� ������� � ����� � ������� � ������� �� ������� ������� �����������.
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_04");	//��-�����, ��� �������� �����. �� ������ �������� � ����� �������.
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_05");	//�� ����, ��� � ���� ��������� ��� �������, �� ���� �������, �� � ����������� ���� �� ������� ������. ��, ��� ���?! ��� ������� ���� ������ ������� �����!
	AI_Output(other,self,"DIA_Huno_HelpWithInstruments_15_06");	//������, � ��� ������.
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_07");	//��� ����� ��� ����� ������ � ���� ������. ������, �� ���������.

	//������ � �������� "����������� ��� ����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_Running,TOPIC_DS2P_Tools4Huno_Start);
};

// ---------------------------------
// "��� ����������� �����������."	nr = 1
// ����� ��� �� ���� � ���� �����������, ������� ������
instance DIA_Huno_GiveInstruments(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 1;
	condition = DIA_Huno_GiveInstruments_condition;	
	information = DIA_Huno_GiveInstruments_info;
	description = "��� ����������� �����������. ";
};
func int DIA_Huno_GiveInstruments_condition()
{
	if ((MIS_DS2P_Tools4Huno == LOG_Running)
		&& (Npc_HasItems(other, ItMi_Rake) >= 2) && (Npc_HasItems(other, ItMw_1h_Bau_Axe) >= 5))
	{	return TRUE;	};
};
func void DIA_Huno_GiveInstruments_info()
{
	var int x;
	AI_Output(other,self,"DIA_Huno_GiveInstruments_15_00");	//��� ����������� �����������. 
	// ������ �����������
	x = 1; if (x == 1) {
		B_GiveInvItem_red(other,self,ItMi_Rake,2,YPOS_ItemTaken);
		B_GiveInvItem_red(other,self,ItMw_1h_Bau_Axe,5,YPOS_ItemTaken + 3);
	};
		AI_Output(self,other,"DIA_Huno_GiveInstruments_13_01");	//��� ��� ��! ��� ���� ������� ������ �����������? ����������!
		AI_Output(self,other,"DIA_Huno_GiveInstruments_13_02");	//�� ���� �� ������ ����, �� ���� ���� ���! ����� ��� ������.
	// ���� 500 �������
	x = 2; if (x == 2) {
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
		AI_Output(self,other,"DIA_Huno_GiveInstruments_13_03");	//� ����� ��� �� ���� ���, �� �����, ��� ���������, ������!
	
	//������ � �������� "����������� ��� ����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Tools4Huno_Success);
};

//NS - 27/06/2013 ===========
// �� ������ "��� ����� ��� ������?" 	nr=101
//===========================

instance DIA_Huno_AboutStolenIron(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 101;
	condition = DIA_Huno_AboutStolenIron_condition;	
	information = DIA_Huno_AboutStolenIron_info;
	description = "�� �� ����� ������ ��������������� ����� �������?";
};
func int DIA_Huno_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Huno_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Huno_AboutStolenIron_15_00");	//�� �� ����� ������ ��������������� ����� �������?
		AI_Output(self,other,"DIA_Huno_AboutStolenIron_13_01");	//�����, �������. ��� ��������� ��������� �����-�� �����. ��-�����, ��� ����� ������.
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 27/06/2013 ================================================
// ����� ������� �������� (+5 ������� �����. 50 �������)
//================================================================

instance DIA_Huno_MillRepaired(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 0;
	condition = DIA_Huno_MillRepaired_condition;	
	information = DIA_Huno_MillRepaired_info;
	important = TRUE;
};
func int DIA_Huno_MillRepaired_condition()
{
	if (Joseph_RepairMill_Done == TRUE)	{	return TRUE;	};
};
func void DIA_Huno_MillRepaired_info()
{
	var int x;
		AI_Output(self,other,"DIA_Huno_MillRepaired_13_00");	//�� ����� ���� �����, ������ �������. ���� �� �� ��, �� �������� �� ��� ������� ����.
		AI_Output(self,other,"DIA_Huno_MillRepaired_13_01");	//���, ������ ��� �������� �������.
	//���� 5 ������� ����� � 50 �����
	x = 1; if (x == 1) {
		B_GiveInvItem_red(self,other,ItFo_Bread,5,YPOS_ItemTaken);
		B_GiveInvItem_red(self,other,ItMi_Gold,50,YPOS_ItemTaken + 3);
	};
	AI_StopProcessInfos(self);
};

