//*--------------------------------------------------------------------
//*---------   ����� �� ������� �� ��������� ����		-------------------
//*--------------------------------------------------------------------
prototype DIA_Diego_EXIT(C_Info)
{
	npc = none_15_Diego;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Diego_EXIT_condition;	
	information = DIA_Diego_EXIT_info;
	description = Dialog_Ende;
};
instance DIA_Diego_EXIT_pre(DIA_Diego_EXIT){npc = pre_none_15_Diego;};
instance DIA_Diego_EXIT_main(DIA_Diego_EXIT){};
func int DIA_Diego_EXIT_condition(){	return TRUE;};
func void DIA_Diego_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Diego_PreStart(C_Info)	//��������� ������ �� �������
{
	npc = pre_none_15_Diego;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Diego_PreStart_condition;	
	information = DIA_Diego_PreStart_info;
	important = TRUE;
};
func int DIA_Diego_PreStart_condition(){	return TRUE;};
func void DIA_Diego_PreStart_info()
{	
	AI_Output(self,other,"DIA_Diego_PreStart_11_00");	//���� �� ������ ����, ������� �������� ���.
	AI_Output(other,self,"DIA_Diego_PreStart_15_01");	//��, �� ����, ��� ����. ���� ���� ������� �����, ��� � ��� ��������� �� ���� � ������������.
	AI_Output(self,other,"DIA_Diego_PreStart_11_02");	//��� ����� ������ ������?
	AI_Output(self,other,"DIA_Diego_PreStart_11_03");	//� �� �����, ��� �� ������ ����� �������������� ���� �������, � ���� ��� ������ �������� � ��� �� ���������, ��� � ���������.
	AI_Output(other,self,"DIA_Diego_PreStart_15_04");	//�� � �������� ������ � ���� �� ������, ������� ������ ������ ������ �� ����� �� ����������� ��������.
	AI_Output(other,self,"DIA_Diego_PreStart_15_05");	//��� �������, �� ��� ��� ���������� ���� ������ �� ��� ���� ��� ��� �����.
	AI_Output(self,other,"DIA_Diego_PreStart_11_06");	//��, �� ����, ���� �� �� ���������. �������, ��� �� ������� ������.
	AI_Output(other,self,"DIA_Diego_PreStart_15_07");	//� ���� �� ��� �������.
	AI_StopProcessInfos(self);
};

instance DIA_Diego_AfterStart_Const(C_Info)	//���������� ������ � �����
{
	npc = pre_none_15_Diego;
	nr = 998;
	permanent = TRUE;
	condition = DIA_Diego_AfterStart_Const_condition;	
	information = DIA_Diego_AfterStart_Const_info;
	description = "��� ��?";
};
func int DIA_Diego_AfterStart_Const_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Diego_PreStart))	{	return TRUE;};
};
func void DIA_Diego_AfterStart_Const_info()
{	
	AI_Output(other,self,"DIA_Diego_AfterStart_Const_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Diego_AfterStart_Const_11_00");	//�������, ���� ��� ������ �� ������. ���� ����� ���� ����������� ���� ��� ������, � �� ���� �� ��������� � ��������.
};
//*--------------------------------------------------------------------
//*---------   ����� �� �������� ����		-------------------
//*--------------------------------------------------------------------

instance DIA_Diego_GoToPirates(C_Info)	//���������� ������ �� ���������� � ������� ������
{
	npc = none_15_Diego;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Diego_GoToPirates_condition;	
	information = DIA_Diego_GoToPirates_info;
	description = "���� ���-�� ������ �� ���...";
};
func int DIA_Diego_GoToPirates_condition()
{	
	if(!Npc_KnowsInfo(other,DIA_Greg_Start))
	{	return TRUE;	};
};
func void DIA_Diego_GoToPirates_info()
{	
	AI_Output(other,self,"DIA_Diego_GoToPirates_15_00");	//�� ���, ����� ���������?!
	AI_Output(self,other,"DIA_Diego_GoToPirates_11_00");	//���� ������� �� ������ � ����� ������, ��� �� �����.
	AI_StopProcessInfos(self);
};
