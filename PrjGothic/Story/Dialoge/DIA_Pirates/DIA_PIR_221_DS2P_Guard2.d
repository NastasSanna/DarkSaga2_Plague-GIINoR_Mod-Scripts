/***************************************************************
						������ ��������
//*NS - 19/06/2013
***************************************************************/

instance DIA_Guard2_EXIT(C_Info)
{
	npc = PIR_221_DS2P_Guard2;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Guard2_EXIT_condition;	
	information = DIA_Guard2_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Guard2_EXIT_condition(){	return TRUE;};
func void DIA_Guard2_EXIT_info(){	AI_StopProcessInfos(self);};

//--------------------------

instance DIA_Guard2_Sleep(C_Info)
{
	npc = PIR_221_DS2P_Guard2;
	nr = 0;
	condition = DIA_Guard2_Sleep_condition;	
	information = DIA_Guard2_Sleep_info;
	description = "�� �����-������ �����?";
	permanent = TRUE;
};
func int DIA_Guard2_Sleep_condition(){	return TRUE;};
func void DIA_Guard2_Sleep_info()
{
	AI_Output(other,self,"DIA_Guard2_Sleep_15_00");	//�� �����-������ �����?
		AI_Output(self,other,"DIA_Guard2_Sleep_13_01");	//�� ���� ����. ������!
	AI_StopProcessInfos(self);
};
