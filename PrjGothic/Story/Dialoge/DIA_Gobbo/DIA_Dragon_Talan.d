instance DIA_DragonTalan_EXIT(C_Info)
{
	npc = Dragon_Fire;
	nr = 999;
	permanent = TRUE;
	condition = DIA_DragonTalan_EXIT_condition;	
	information = DIA_DragonTalan_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_DragonTalan_EXIT_condition(){	return TRUE;};
func void DIA_DragonTalan_EXIT_info(){	AI_StopProcessInfos(self);};

//-------������� � �������� �������

//Redleha - 23/03/2016 ===========
// ���������� 
//===========================

instance DIA_DragonTalan_FirstDialog(C_Info)	//nr = 1;
{
	npc = Dragon_Fire;
	nr = 1;
	condition = DIA_DragonTalan_FirstDialog_condition;	
	information = DIA_DragonTalan_FirstDialog_info;
	important = TRUE;
	permanent = FALSE;
};
func int DIA_DragonTalan_FirstDialog_condition(){	return TRUE;};
func void DIA_DragonTalan_FirstDialog_info()
{	
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_00");	//������ ���� � ���� �� ���� �������, � �� ���� ������� ����� �� ����� �� ����������� �������� ����, ���� � � �� �������� ������ ��������.
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_00");	//��� ���� ���� �� �������, ������, �� � ������ �� ���� �����.
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_01");	//���� �����? ��� ��� ���� �� ��� � ����� ��������� �������.
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_01");	//� ��� �� ���� ������, ������, ����� �� �� ���������� ���� ������� ��� ����?
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_02");	//��� ������? � ���� ��� ������. ��� ����� �� ������ �� ���?
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_02");	//�� ����� ���� �����������, �� ��� ����� ���� �����. ��� ���������� ��� ��������� �� ����, ���������� ��� �������.
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_03");	//�� (��������), ���������� �� �� ������� ����������. (����� �����) � ������� ��� ��� ��� ��������� ����������.
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_03");	//� ����������, ��� � ���� ���-�� ���������...
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_04");	//������, ��� ���������� ������� ������� ����? � ����� �� ���� ����������, ��� ������������ ��� �����. 
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_05");	//�� �� �� ���-�� ������ ��������. ���� ����������� ������ ������, ���������� ������ ����. ����� ������ ��� ����� �� ��������.
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_04");	//�����, ���� ���������?
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_06");	//���?
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_05");	//����� �����. � ��� ��� ����� ������� ���� � ������ ���, ��������� ������� �����?
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_07");	//���� �� ���, �� ���� � ���� ��������, �� ��� ������� �� ����� ����������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_DragonFirstDia);
};
//
//���� ������� �������
//
instance DIA_DragonTalan_AfterHit(C_Info)	//nr = 1;
{
	npc = Dragon_Fire;
	nr = 1;
	condition = DIA_DragonTalan_AfterHit_condition;	
	information = DIA_DragonTalan_AfterHit_info;
	important = TRUE;
	permanent = FALSE;
};
func int DIA_DragonTalan_AfterHit_condition(){	return TRUE;};
func void DIA_DragonTalan_AfterHit_info()
{	
	AI_Output(self,other,"DIA_DragonTalan_AfterHit_18_00");	//���� �� ������� ������ ���� ���� �������. 
	AI_Output(self,other,"DIA_DragonTalan_AfterHit_18_01");	//�� ����� ���� � ����, ���� ��� ����: � ���� �� ����������� ��������, �� ���� ������ ��� ������.
	AI_StopProcessInfos(self);
};














