instance DIA_Viola_EXIT(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Viola_EXIT_condition;	
	information = DIA_Viola_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Viola_EXIT_condition(){	return TRUE;};
func void DIA_Viola_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 01/07/2013 ===========
//  ��������� 
//===========================
instance DIA_Viola_Start(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 0;
	condition = DIA_Viola_Start_condition;	
	information = DIA_Viola_Start_info;
	important = TRUE;
};
func int DIA_Viola_Start_condition()
{
	if (Npc_IsInState(self,ZS_Talk)){	return TRUE;};
};
func void DIA_Viola_Start_info()
{
		AI_Output(self,other,"DIA_Viola_Start_16_00");	//������ �� �� ��������� ���?! �� �� ��� �� ������! (������) ������ ����...
	AI_Output(other,self,"DIA_Viola_Start_15_01");	//������, � �� ����, ��� �� ����� ��. ��� ����.
		AI_Output(self,other,"DIA_Viola_Start_16_02");	//��, �� ����. ������ ���� ����. �� �� �������, ��� ���� ����� ��� ��������, ���� �� �������!
		AI_Output(self,other,"DIA_Viola_Start_16_03");	//���� ������� ������, ����� ���, ��� ���������. �� ������ �����.
};


//NS - 01/07/2013 ===========
//  ���������� 
//===========================
//"��� ���� �����?"		nr = 1
instance DIA_Viola_WhatsUrName(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 1;
	condition = DIA_Viola_WhatsUrName_condition;	
	information = DIA_Viola_WhatsUrName_info;
	description = "��� ���� �����?";
};
func int DIA_Viola_WhatsUrName_condition(){	return TRUE;};
func void DIA_Viola_WhatsUrName_info()
{
	AI_Output(other,self,"DIA_Viola_WhatsUrName_15_00");	//��� ���� �����?
		AI_Output(self,other,"DIA_Viola_WhatsUrName_16_01");	//������, � �� �������������. ���� ����� �����, � ���� �����, �������� �������.
};


//NS - 01/07/2013 ===========
//  ����� ����������
//===========================
//"��� �� ���������� ������?"		nr = 1
instance DIA_Viola_WhatWasUrJob(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 1;
	condition = DIA_Viola_WhatWasUrJob_condition;	
	information = DIA_Viola_WhatWasUrJob_info;
	description = "��� �� ���������� ������?";
};
func int DIA_Viola_WhatWasUrJob_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_WhatWasUrJob_info()
{
	AI_Output(other,self,"DIA_Viola_WhatWasUrJob_15_00");	//��� �� ���������� ������?
		AI_Output(self,other,"DIA_Viola_WhatWasUrJob_16_01");	//�� ����, ��� �������� ������, � �������� � ����, �������� ���� ������������ �����, �������� �������.
		AI_Output(self,other,"DIA_Viola_WhatWasUrJob_16_02");	//� �� ������� ������ � ������ � ����� �������� ����� ������ ������� �����. ������� ���� �������.
};
//----------------------------------------------
//"��� ����� �����?"		nr = 3
// ���� ��� �� ����� ���
instance DIA_Viola_WhosKadar(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 3;
	condition = DIA_Viola_WhosKadar_condition;	
	information = DIA_Viola_WhosKadar_info;
	description = "��� ����� �����?";
};
func int DIA_Viola_WhosKadar_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName) && Npc_KnowsInfo(other,DIA_Kadar_WhoAU))
	{	return TRUE;};
};
func void DIA_Viola_WhosKadar_info()
{
	AI_Output(other,self,"DIA_Viola_WhosKadar_15_00");	//��� ����� �����?
		AI_Output(self,other,"DIA_Viola_WhosKadar_16_01");	//��� �������� ����� ������� � ��� ����. ������ ��� ������ ���...
		AI_Output(self,other,"DIA_Viola_WhosKadar_16_02");	//�� ������� ��� �� ������, ������� ���������� ��� � ���� ���. ����� ���������, �������������� �������. ������� �� �� ���� �� ������, ��������� �������� ��� ������ �������.
		AI_Output(self,other,"DIA_Viola_WhosKadar_16_03");	//����� �� ������� �����������, ������, ����� � ������� ������ ���� ���������� ���������, ����, ������������. � �����, � ������ ��� ����� ������� ���������.
};
//----------------------------------------------
//"������ ����� ������."	(+����)		nr = 3
instance DIA_Viola_KadarDead(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 3;
	condition = DIA_Viola_KadarDead_condition;	
	information = DIA_Viola_KadarDead_info;
	description = "������ ����� ������.";
};
func int DIA_Viola_KadarDead_condition()
{
	//UNFINISHED ������� ������, ����� ������ �������
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_KadarDead_info()
{
	AI_Output(other,self,"DIA_Viola_KadarDead_15_00");	//������ ����� ������. 
	//(+����)
	B_GivePlayerXP(XP_News_KadarDead);
		AI_Output(self,other,"DIA_Viola_KadarDead_16_01");	//(�� ������� �� ������) ���?.. � �����! ������? �� ���?
	AI_Output(other,self,"DIA_Viola_KadarDead_15_02");	//�� ����� ��������� �� ���� ���� � ���������� �� ���. ���� ���� ���.
		AI_Output(self,other,"DIA_Viola_KadarDead_16_03");	//���� ������� ���� ����, ���� �������� ��� ��� ������� ������! ����� ������� �� �� ���! (������)
};


//NS - 01/07/2013 ===========
//  �� ������ "������ ��� �����" 
//===========================
//"�� ������, ��� ������ ���������?"		nr = 2
instance DIA_Viola_WhereAHunters(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 2;
	condition = DIA_Viola_WhereAHunters_condition;	
	information = DIA_Viola_WhereAHunters_info;
	description = "�� ������, ��� ������ ���������?";
};
func int DIA_Viola_WhereAHunters_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_WhereAHunters_info()
{
	var int x;
	AI_Output(other,self,"DIA_Viola_WhereAHunters_15_00");	//�� ������, ��� ������ ���������?
		AI_Output(self,other,"DIA_Viola_WhereAHunters_16_01");	//���, ���. ����� ���������� ���� � ����� � ������ ���� �� �����. ������ � ������ �� ��� �� ������. � �������, � ���� ��� � �������!
		AI_Output(self,other,"DIA_Viola_WhereAHunters_16_02");	//��������, ���� ��������� �����, ������� ��� ���� ������ � ����� ���, ��� � ����� ���.
	//���� ������� ������ +5 � ����� � +5 � ��������
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItAm_DS2P_Viola,1);
	};
		AI_Output(self,other,"DIA_Viola_WhereAHunters_16_03");	//��� ��� ��� ��������� �������. �� ������, ��� ������ ������������ � ������ ����� �������� ���� �� ������� � ����������. � �����, ��� ����� �� ������ ����� ���������.
	AI_Output(other,self,"DIA_Viola_WhereAHunters_15_04");	//� ����������� ������� ������.

	//������ � �������� "������ ��� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Amulette4Jinn,LOG_MISSION,LOG_Running,TOPIC_DS2P_Amulette4Jinn_Start);
};


//NS - 01/07/2013 ===========
//  �� ������ "�������� ��������"
//===========================
//"� ������ �������." (+����)		nr = 2
instance DIA_Viola_GiveSupplies(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 2;
	condition = DIA_Viola_GiveSupplies_condition;	
	information = DIA_Viola_GiveSupplies_info;
	description = "� ������ �������.";
};
func int DIA_Viola_GiveSupplies_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName) && Npc_HasItems(other,ItMi_DS2P_Packet_ProductSupplies))
	{	return TRUE;};
};
func void DIA_Viola_GiveSupplies_info()
{
	var int x;
	AI_Output(other,self,"DIA_Viola_GiveSupplies_15_00");	//� ������ �������. 
	//(+����)
	B_GivePlayerXP(XP_MIS_ShippingSupplies);
		AI_Output(self,other,"DIA_Viola_GiveSupplies_16_01");	//�������, �� ����� ������������ � ���� ���� ������� ��������. ���� �� � ��������� ����� � ����� ���-������ ������. 
	AI_Output(other,self,"DIA_Viola_GiveSupplies_15_02");	//�� ��� ��� �� ������.
		AI_Output(self,other,"DIA_Viola_GiveSupplies_16_03");	//����� ����, ��� ��� ����� � �����... 
	AI_Output(other,self,"DIA_Viola_GiveSupplies_15_04");	//�� ������ ��������. � ������, ��� ��� ������ � ������� �������� �����������, ��� ������� � ������� � ������� ��� � �����.
	AI_Output(other,self,"DIA_Viola_GiveSupplies_15_05");	//�� ������ ���� �������, ����� ������ ��������� ����� ���������� �������.
		AI_Output(self,other,"DIA_Viola_GiveSupplies_16_06");	//�� ��� �������? ��������, �� ����. � ������ ��������.
	//�������� ������� (���� ���� �����, �� ������� �������� � ��)
	x = 1; if (x == 1)	{
		B_DS_GiveRemoveItems(other,self,ItMi_DS2P_Packet_ProductSupplies,1);
	};
	//������ � �������� "�������� ��������" //NS - ����������
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_FoodDelivered);
	//�������� ��������
	B_StartOtherRoutine(self, "COOKING");
	
	Viola_SuppliesGiven = TRUE;
};


//NS - 01/07/2013 ===========
//  ����� ������� ����� ����������
//===========================
//"����� �� ����� ������?"		nr = 4
instance DIA_Viola_HowLongAUThere(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 4;
	condition = DIA_Viola_HowLongAUThere_condition;	
	information = DIA_Viola_HowLongAUThere_info;
	description = "����� �� ����� ������?";
};
func int DIA_Viola_HowLongAUThere_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_HowLongAUThere_info()
{
	AI_Output(other,self,"DIA_Viola_HowLongAUThere_15_00");	//����� �� ����� ������?
		AI_Output(self,other,"DIA_Viola_HowLongAUThere_16_01");	//�� ��� ������ �����. ���� ��� ������ �� ���� ������!
		AI_Output(self,other,"DIA_Viola_HowLongAUThere_16_02");	//������� ��� ������� ���� ����������, �� ����� ���� ���� ���������� � ����� ���� ������, ����� ������.
		AI_Output(self,other,"DIA_Viola_HowLongAUThere_16_03");	//������ ��������, ��� ������� ���� � ����� ����� ������, �� � ������� � ����� �� ������. �������� �� ���� ������� ����, ������...
};
//----------------------------------------------
//"�������� � ����� �������."		nr = 5
instance DIA_Viola_AboutFriends(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 5;
	condition = DIA_Viola_AboutFriends_condition;	
	information = DIA_Viola_AboutFriends_info;
	description = "�������� � ����� �������.";
};
func int DIA_Viola_AboutFriends_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_AboutFriends_info()
{
	AI_Output(other,self,"DIA_Viola_AboutFriends_15_00");	//�������� � ����� �������.
		AI_Output(self,other,"DIA_Viola_AboutFriends_16_01");	//�� ������ � ���� ���� ������ �� ���������? �� ��� � ������������ ����� ������.
		AI_Output(self,other,"DIA_Viola_AboutFriends_16_02");	//����, ���� ����, ��� � �, �������� � ����. �����, ���������, �������� �������. �� ��� ����� �������, ����������� � ���.
		AI_Output(self,other,"DIA_Viola_AboutFriends_16_03");	//����� � ��� �����������, ������� ����������� ������. �� ��� ����� �� ��������, �������� �� ���������, �� ���� ������ ����� ���������� �����-������ ����� �������� ������� �� ����� �����.
		AI_Output(self,other,"DIA_Viola_AboutFriends_16_04");	//��� ������� �������, ��� ������� ����� �� ���������� �����, �� �� ��� ����� �� �������� �������� � ��� ������ �������, ��������, ������� ������ ������ ������.
};

//������������, ���� ���� ����� "������"
// nr = 1

instance DIA_Viola_WhereIsLulu(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Viola_WhereIsLulu_condition;	
	information = DIA_Viola_WhereIsLulu_info;
	description = "� ��� ����?";
};

func int DIA_Viola_WhereIsLulu_condition()
{
	if(MIS_DS2P_TomsLetter == Log_Running)
	{	
		return TRUE;
	};
};

func void DIA_Viola_WhereIsLulu_info()
{
	AI_Output(other,self,"DIA_Viola_WhereIsLulu_15_00");	//� ��� ����?
	AI_Output(self,other,"DIA_Viola_WhereIsLulu_16_01");	//�� ������� ������. ������ ������ �, �������� �� ����� � ������ �� ������� ��, ��������, �������� ����� ��������.
	AI_Output(other,self,"DIA_Viola_WhereIsLulu_15_02");	//�� ���?
	AI_Output(self,other,"DIA_Viola_WhereIsLulu_16_03");	//�� �������. �������� ����, ��� ��� ����, � ������ ����������. ��, ��������, �������� ��� ���������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TomsLetter,LOG_MISSION,LOG_Running,TOPIC_DS2P_TomsLetter_LuluIsGone);
};
	
