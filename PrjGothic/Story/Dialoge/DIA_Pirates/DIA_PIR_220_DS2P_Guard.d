/***************************************************************
					�������� � ����� � ������
//*NS - 19/06/2013
***************************************************************/

instance DIA_Guard_EXIT(C_Info)
{
	npc = PIR_220_DS2P_Guard;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Guard_EXIT_condition;	
	information = DIA_Guard_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Guard_EXIT_condition(){	return TRUE;};
func void DIA_Guard_EXIT_info(){	AI_StopProcessInfos(self);};

//--------------------------

instance DIA_Guard_Enter(C_Info)
{
	npc = PIR_220_DS2P_Guard;
	nr = 0;
	condition = DIA_Guard_Enter_condition;	
	information = DIA_Guard_Enter_info;
	important = TRUE;
};
func int DIA_Guard_Enter_condition(){	return TRUE;};
func void DIA_Guard_Enter_info()
{
		AI_Output(self,other,"DIA_Guard_Enter_13_00");	//���� �����?
	AI_Output(other,self,"DIA_Guard_Enter_15_01");	//� ���� ����� � ������.
		AI_Output(self,other,"DIA_Guard_Enter_13_02");	//�� ��� �� ��� �����, � �������?
	AI_Output(other,self,"DIA_Guard_Enter_15_03");	//��, �� �����. 
		AI_Output(self,other,"DIA_Guard_Enter_13_04");	//������, ���� ���� ����.
	AI_StopProcessInfos(self);
};

//--------------------------

instance DIA_Guard_AboutGard(C_Info)
{
	npc = PIR_220_DS2P_Guard;
	nr = 0;
	condition = DIA_Guard_AboutGard_condition;	
	information = DIA_Guard_AboutGard_info;
	description = "���� � ����?";
	permanent = TRUE;
};
func int DIA_Guard_AboutGard_condition(){	return TRUE;};
func void DIA_Guard_AboutGard_info()
{
	AI_Output(other,self,"DIA_Guard_AboutGard_15_00");	//���� � ����?
		AI_Output(self,other,"DIA_Guard_AboutGard_13_01");	//���� ������ � ����.
	AI_StopProcessInfos(self);
};