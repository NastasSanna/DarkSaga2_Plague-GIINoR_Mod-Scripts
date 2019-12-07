//*--------------------------------------------------------------------
//*---------   ���� �� ������� �� ��������� ����		-------------------
//*--------------------------------------------------------------------
prototype DIA_Jack_EXIT(C_Info)
{
	npc = none_11_Jack;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Jack_EXIT_condition;	
	information = DIA_Jack_EXIT_info;
	description = Dialog_Ende;
};
instance DIA_Jack_EXIT_pre(DIA_Jack_EXIT){npc = pre_none_11_Jack;};
instance DIA_Jack_EXIT_main(DIA_Jack_EXIT){};
func int DIA_Jack_EXIT_condition(){	return TRUE;};
func void DIA_Jack_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Jack_PreStart(C_Info)	//��������� ������ �� �������
{
	npc = pre_none_11_Jack;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jack_PreStart_condition;	
	information = DIA_Jack_PreStart_info;
	description = "��� ����� ������ ����� ������.";
};
func int DIA_Jack_PreStart_condition(){	return TRUE;};
func void DIA_Jack_PreStart_info()
{	
	AI_Output(other,self,"DIA_Jack_PreStart_15_00");	//��� ����� ������ ����� ������. ��� ���� ����, � ��������� �������� ����� ������.
	AI_Output(self,other,"DIA_Jack_PreStart_11_00");	//��� �������?
	AI_Output(other,self,"DIA_Jack_PreStart_15_01");	//����. �� ������� �����, �� ���� ������� � ���.
	AI_Output(self,other,"DIA_Jack_PreStart_11_01");	//�� ���� ��� �������� ����?! �� �����.
	AI_Output(self,other,"DIA_Jack_PreStart_11_02");	//�� �� ����� ����������� �� ��� ������� ���������� �������� ������� � ���� �������� �������������� �� ������. (�������)
	AI_Output(self,other,"DIA_Jack_PreStart_11_03");	//�����, � ��� ���� ���� ������� �� ���� � ��� ���� �� ������� ����������� � ����.
	AI_Output(self,other,"DIA_Jack_PreStart_11_04");	//��� ��� ���� ����� ����� �� ���������� ��������� ������. � ���� ����� ���������� �� ���� �������� ������. � ��� ������, ��� �� �������.
	AI_Output(other,self,"DIA_Jack_PreStart_15_02");	//��� ��� ��������� ����. ��������, ����!
	AI_Output(self,other,"DIA_Jack_PreStart_11_05");	//�������� ���� ������!
	AI_StopProcessInfos(self);
};
//*--------------------------------------------------------------------
//*---------   ���� �� �������� ����		-------------------------------
//*--------------------------------------------------------------------
instance DIA_Jack_Start(C_Info)	//��������� ������ �� �������
{
	npc = none_11_Jack;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jack_Start_condition;	
	information = DIA_Jack_Start_info;
	important = TRUE;
};
func int DIA_Jack_Start_condition(){	return TRUE;};
func void DIA_Jack_Start_info()
{	
	AI_Output(self,other,"DIA_Jack_Start_11_00");	//������, ��� ���������. � ���-�� ��� ������������, ��� ��� ������� ����� �� ����� ��������.
	AI_Output(self,other,"DIA_Jack_Start_11_01");	//�� �������� �� �� ����. ��� �� ������, � ���� ������ ������ �� � ��� �� ������ ����� ���� ������ � ������.
	AI_Output(other,self,"DIA_Jack_Start_15_00");	//�� ����, ����, ��� ������.
	AI_Output(self,other,"DIA_Jack_Start_11_02");	//(���������) ������? ����� �� �� ��� ��������� �� ����, ������� ���� ����!
	AI_Output(other,self,"DIA_Jack_Start_15_01");	//�����, ��� �� ��� ��������, �����!
	AI_StopProcessInfos(self);
};
//
instance DIA_Jack_GoToPirates(C_Info)	//���������� ������ �� ���������� � ������� ������
{
	npc = none_11_Jack;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Jack_GoToPirates_condition;	
	information = DIA_Jack_GoToPirates_info;
	description = "���� ���-�� ������ �� ���...";
};
func int DIA_Jack_GoToPirates_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Jack_Start) && !Npc_KnowsInfo(other,DIA_Greg_Start))
	{	return TRUE;	};
};
func void DIA_Jack_GoToPirates_info()
{	
	AI_Output(other,self,"DIA_Jack_GoToPirates_15_00");	//���� ���-�� ������ �� ���... �� ����� �������...
	AI_Output(self,other,"DIA_Jack_GoToPirates_11_00");	//� ��� �����. �� ������ ���������� �� ����.
	AI_StopProcessInfos(self);
};
//
instance DIA_Jack_WhatDoYouThink_Const(C_Info)	//������ (����������) ������ ����� ���������� � ������� ������
{
	npc = none_11_Jack;
	nr = 998;
	permanent = TRUE;
	condition = DIA_Jack_WhatDoYouThink_Const_condition;	
	information = DIA_Jack_WhatDoYouThink_Const_info;
	description = "��� �� �� ���� �������?";
};
func int DIA_Jack_WhatDoYouThink_Const_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Jack_WhatDoYouThink_Const_info()
{	
	AI_Output(other,self,"DIA_Jack_WhatDoYouThink_Const_15_00");	//��� �� �� ���� �������?
	AI_Output(self,other,"DIA_Jack_WhatDoYouThink_Const_11_00");	//� �����, ��� �� ��������� � ������� �������! � ��������� �� ��� ����� ����� ������.
};
instance DIA_Jack_INeedSupplies(C_Info)	//��� ����� �������.
{
	npc = none_11_Jack;
	nr = 997;
	permanent = FALSE;
	condition = DIA_Jack_INeedSupplies_condition;	
	information = DIA_Jack_INeedSupplies_info;
	description = "��� ����� �������.";
};
func int DIA_Jack_INeedSupplies_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Jack_INeedSupplies_info()
{	
	AI_Output(other,self,"DIA_Jack_INeedSupplies_15_00");	//��� ����� �������.
	AI_Output(self,other,"DIA_Jack_INeedSupplies_11_00");	//�������� � �����, � ��������. � ������� ���� ���, ������� ����� � ������.
	AI_Output(self,other,"DIA_Jack_INeedSupplies_11_01");	//���������, ��� �� �������, �� ���������� �� ����� ��������. ��� �� ��� ��������, ��� ��� ��� ���������.
};
instance DIA_Jack_HowDoYouFeel(C_Info)	//��� �� ���� ����������?
{
	npc = none_11_Jack;
	nr = 996;
	permanent = FALSE;
	condition = DIA_Jack_HowDoYouFeel_condition;	
	information = DIA_Jack_HowDoYouFeel_info;
	description = "��� �� ���� ����������?";
};
func int DIA_Jack_HowDoYouFeel_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Jack_HowDoYouFeel_info()
{	
	AI_Output(other,self,"DIA_Jack_HowDoYouFeel_15_00");	//��� �� ���� ����������?
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_00");	//���� �������.
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_01");	//�� ������, ��� ��������������� ������ ����������. ���� ����, ����� �� ������: ��� ���� ��������� � ������ ��� ������; � ������ ������ � ����� ����� ������ �������, �������������.
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_02");	//�� ������, ����� �������� ���� � �����.
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_03");	//��� �� � �� ��������� � �������, ��� ���� �� ������� �� ����� � �����, � � ���� ���� ���� ���������, �� ���� ������. � ���...
	AI_Output(other,self,"DIA_Jack_HowDoYouFeel_15_01");	//�� ����������� ���-������ ���������, ����. � ����, �����, ���� �������� �������? � ���������� ����� �������� �����.
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_04");	//��, ��������, �� ����. ������ �� ���� ����� ����.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"START");	//������ ���� � ����� ������.
};
instance DIA_Jack_IsShipReadyToSail(C_Info)	//������� ����� ��������? (����������)
{
	npc = none_11_Jack;
	nr = 995;
	permanent = TRUE;
	condition = DIA_Jack_IsShipReadyToSail_condition;	
	information = DIA_Jack_IsShipReadyToSail_info;
	description = "������� ����� ��������?";
};
func int DIA_Jack_IsShipReadyToSail_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Jack_IsShipReadyToSail_info()
{	
	AI_Output(other,self,"DIA_Jack_IsShipReadyToSail_15_00");	//������� ����� ��������?
	AI_Output(self,other,"DIA_Jack_IsShipReadyToSail_11_00");	//���� �� �������, ��� ��� ������ ������, � ��� �������, �� ��, �����. ������� �������� � ���, � ����� ����������.
};
//
//���� � ������ ����, �� ������������ ��� � ��� ��� ��� �� ����
//
instance DIA_Jack_FishAsGift(C_Info)
{
	npc = none_11_Jack;
	nr = 990;
	permanent = TRUE;
	condition = DIA_Jack_FishAsGift_condition;	
	information = DIA_Jack_FishAsGift_info;
	important = TRUE;
};
func int DIA_Jack_FishAsGift_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Jack_HowDoYouFeel) && (Wld_GetDay() > 2) && (Wld_GetDay() > (Jack_GiveFish_Day + 1)) 
	&& Npc_IsInState(self,ZS_Talk) && Wld_IsTime(7,0,22,0))
	{	return TRUE;	};
};
func void DIA_Jack_FishAsGift_info()
{	
	AI_Output(self,other,"DIA_Jack_FishAsGift_11_00");	//���, � ������� ������� ����. �����, �����, ���� ����������.
	var int x, var int y;  x = Hlp_Random(4) + 2; y = Hlp_Random(x+1);
	B_GiveInvItem_Red(self,other,ItFo_DS2P_FishSea_1,x-y,34);
	B_GiveInvItem_Red(self,other,ItFo_DS2P_FishSea_2,y,37);
};



