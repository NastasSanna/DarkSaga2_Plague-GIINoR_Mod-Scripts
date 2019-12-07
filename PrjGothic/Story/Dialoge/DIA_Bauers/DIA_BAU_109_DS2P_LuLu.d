instance DIA_LuLu_EXIT(C_Info)
{
	npc = BAU_109_DS2P_LuLu;
	nr = 999;
	permanent = TRUE;
	condition = DIA_LuLu_EXIT_condition;	
	information = DIA_LuLu_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_LuLu_EXIT_condition(){	return TRUE;};
func void DIA_LuLu_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 01/07/2013 ===========
//  ��������� 
//===========================
instance DIA_LuLu_Start(C_Info)
{
	npc = BAU_109_DS2P_LuLu;
	nr = 0;
	condition = DIA_LuLu_Start_condition;	
	information = DIA_LuLu_Start_info;
	description = "����������� ����.";
};
func int DIA_LuLu_Start_condition(){	return TRUE;};
func void DIA_LuLu_Start_info()
{
	AI_Output(other,self,"DIA_LuLu_Start_15_00");	//����������� ����.
		AI_Output(self,other,"DIA_LuLu_Start_16_01");	//(��������) ��� ���� �����? � �� ������� ������ �������!
	AI_Output(other,self,"DIA_LuLu_Start_15_02");	//� ������ ����� ���������� � �����. �� �����.
		AI_Output(self,other,"DIA_LuLu_Start_16_03");	//�... � ����� �������� � �� ����� ��������� ��� �������� � ���������� ������.
		AI_Output(self,other,"DIA_LuLu_Start_16_04");	//�� �� ������ ������� � ���� ���� �� ���? (�������� �������)
	AI_Output(other,self,"DIA_LuLu_Start_15_05");	//������� �� ���. � �� ����� ����.
		AI_Output(self,other,"DIA_LuLu_Start_16_06");	//�������. � �� ������ �������� ����. �� ���������?
	AI_Output(other,self,"DIA_LuLu_Start_15_07");	//��, �������. ������ �� ������������.
	AI_StopProcessInfos(self);	
};


//NS - 01/07/2013 ===========
//  ���������� 
//===========================
instance DIA_LuLu_AUOK(C_Info)
{
	npc = BAU_109_DS2P_LuLu;
	nr = 1;
	condition = DIA_LuLu_AUOK_condition;	
	information = DIA_LuLu_AUOK_info;
	description = "� ����� ��� � �������?";
	permanent = TRUE;
};
func int DIA_LuLu_AUOK_condition()
{
	if (Npc_KnowsInfo(other,DIA_LuLu_Start))
	{	return TRUE;};
};
func void DIA_LuLu_AUOK_info()
{
	AI_Output(other,self,"DIA_LuLu_AUOK_15_01");	//� ����� ��� � �������?
		AI_Output(self,other,"DIA_LuLu_AUOK_16_00");	//��, �������. �� ��� ����� �������. �������� ����, �� � ���� ������ ����.
	AI_StopProcessInfos(self);	
};
