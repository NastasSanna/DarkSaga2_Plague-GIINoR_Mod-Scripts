instance DIA_DIL_EXIT(C_Info)
{
	npc = BAU_102_DS2P_DIL;
	nr = 999;
	permanent = TRUE;
	condition = DIA_DIL_EXIT_condition;	
	information = DIA_DIL_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_DIL_EXIT_condition(){	return TRUE;};
func void DIA_DIL_EXIT_info(){	AI_StopProcessInfos(self);};
//
instance DIA_Dil_Start(C_Info)	//��������� ������
{
	npc = BAU_102_DS2P_DIL;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Dil_Start_condition;	
	information = DIA_Dil_Start_info;
	description = "������! ��� ��?";
};
func int DIA_Dil_Start_condition(){	return TRUE;};
func void DIA_Dil_Start_info()
{
	AI_Output(other,self,"DIA_Dil_Start_15_00");	//������! ��� ��?
	AI_Output(self,other,"DIA_Dil_Start_12_00");	//�, ���? ���-���. ��� ��� �� ������!
	AI_Output(other,self,"DIA_Dil_Start_15_01");	//� ��� �� ��������?
	AI_Output(self,other,"DIA_Dil_Start_12_01");	//������ ���� - ����� ��� ���� ������� �������� �� �������� ���! ��, �� ����� �� ����!
	AI_Output(self,other,"DIA_Dil_Start_12_02");	//(������) � ����! ����!
	AI_Output(other,self,"DIA_Dil_Start_15_02");	//� ���� ��� ������?
	AI_Output(self,other,"DIA_Dil_Start_12_03");	//��� ��������, � ����� ����� � ����� ����, � ������ ��� � ������. � ���? �� ������!
	AI_PlayAni(self,"T_DONTKNOW");
	AI_PlayAni(self,"T_COMEOVERHERE");
	AI_Output(self,other,"DIA_Dil_Start_12_04");	//�� ������, ��, �� ������! � �� ���� � ����� ��������! ������ ���� �����!
	AI_StopProcessInfos(self);
};
//----
//���������� ����� ����������
//----
var int Dil_randy_dialog_6_once;
instance DIA_Dil_RandyDialog(C_Info)	//��������� ������
{
	npc = BAU_102_DS2P_DIL;
	nr = 2;
	permanent = TRUE;
	condition = DIA_Dil_RandyDialog_condition;	
	information = DIA_Dil_RandyDialog_info;
	important = TRUE;
};
func int DIA_Dil_RandyDialog_condition(){	if(Npc_KnowsInfo(other,DIA_Dil_Start) && Npc_IsInState(self,ZS_Talk)) {return TRUE;};	};
func void DIA_Dil_RandyDialog_info()
{
	var int randy_dialog; randy_dialog = Hlp_Random(13);
	if(randy_dialog == 0)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_00");	//��� ������, � ��� � �������, ��� ��� �������, ����, ����� � ������.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_01");	//� ��� ������? �� ������? ������ ��� ����� ���! ������ ���! ������!
		AI_PlayAni(self,"R_SCRATCHHEAD");
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_02");	//(���������) ������ ������?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_03");	//���������? � � �� ����. ����� ������... ��� �������... ���...
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_04");	//(������ � �����) �, ����!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_00");	//����!
		AI_StopProcessInfos(self);
		AI_SetWalkMode(self,NPC_RUN);
		Npc_SetTarget(self,other);
		AI_Flee(self);
	}
	else if(randy_dialog == 1)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_05");	//��� �������, ��� �������. � �������������, ����� �������� ���������, � �� ������� ��� �����, � ��� ������.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_06");	//� ��� ��� �� �� ���, ���� �� �����.
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_01");	//� �����, �� �����������.
		AI_PlayAni(self,"T_COMEOVERHERE");
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_07");	//(����������� �������) �� ���� ��� ��� ������ ������!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_08");	//������, � ������ ������� ������ �������. ����� ������ ���, � ����� �����!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_09");	//� ����� ��, ������! �� ��� ������? � ��� � ����� �����, �� ������ � �������. ��, ���-�� ��� �� �� ����...
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 2)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_10");	//��� ������ ���: �������, ����������, � ����������, ���� �� �����. � ������...
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_11");	//� ����� �����! ����, ����� ����!
		AI_PlayAni(self,"T_CRY");
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 3)
	{
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_02");	//��� ����?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_12");	//������� ��� ���, ����� �������! � ����� ����� ��� �����, � ����� �����, ��� ����� ������ �� ���.
		AI_PlayAni(self,"R_SCRATCHHEAD");
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_13");	//(���������) ����� ��� �������, �� ������... ����, ������ ���, � ��� ���� ���.
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_03");	//� ��� ����?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_14");	//�����, �� � �������! �����, �����! � ����� ����� ���������.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_15");	//(������� ������) �����...
		AI_StopProcessInfos(self);
		AI_SetWalkMode(self,NPC_RUN);
		Npc_SetTarget(self,other);
		AI_Flee(self);
	}
	else if(randy_dialog == 4)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_16");	//���...
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_04");	//��� ���?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_17");	//��������, �� ���� ���� �� ������, ����� ���������� ���-�� � ����. 
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_18");	//� - ������, � - ���, � - ������, � - ������...
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_19");	//��! �����, ��� � ����� � ���� ������!
		AI_PlayAni(self,"T_IGETYOU");
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 5)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_20");	//�� ����������? ����! ��� ������ ���� ���!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_05");	//������ �� ������ ��� ����?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_21");	//������ - ��������, ���� - ����, ��� - �����! 
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_22");	//�� ����� ����? � ����� �� ����� ����! ��������, ������ ���� ����� ������...
		AI_StopProcessInfos(self);
	}
	else if((randy_dialog == 6) && !Dil_randy_dialog_6_once)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_23");	//������, ��� ���� �����. � ������! ��, ��� ������ � �������� ���!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_24");	//��� ������ ���! ��� ��� �����! ��-��-��! �� ������, ��������!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_06");	//�� ��� �������?
		AI_StopProcessInfos(self);
		Dil_randy_dialog_6_once = TRUE;
		B_Attack(self,other,AR_NONE,1);
	}
	else if(randy_dialog < 8)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_25");	//� ����� ����, ����� �����, ��� ������� � ������. � ��� ��� ������ �����.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_26");	//������! ������ ���� ������! �� ��� ��� ��� �����. ������!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_07");	//� ��� �� ��������?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_27");	//��� ��� ������� �����, ���������, �������, �������������! 
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_28");	//������� ��������� ���� ���� � ���� ���������! �� ����� ���, ������ ���!
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 8)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_29");	//� � ���� ����! �� ���, ��� ������� �����. ������ �� �����!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_08");	//��� ������������?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_30");	//��� ����! (���� �� ����)
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_31");	//������, ��� � ��� ��!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_32");	//����� ����� ��� ����, �� �� ��������� ������ �� ����... ��� ��������. � �� ���� �������. �� ������� �����, � ���� � ���...
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 9)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_33");	//�� �����-������ ����� �� ������? ���? � � �����.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_34");	//� �� ������, ��� ������! ��-��-��! ��-��-��!
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 10)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_35");	//�������? ������� ��? ����� �������������� ������!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_36");	//���-���-���...�����-���-���-���...
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 11)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_37");	//�� ������, ��� �? ���, � �� ���. ��� ������, ���������?! ������!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_38");	//���� ����� �������! ��, ������ �����  ��� �����, ��� � - ��� �������!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_39");	//��, ��, ��! ������, � ��� ���� ��� ��� ������. �� �� �������...
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 12)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_40");	//������ ��� ����, ������������� ��� ������ � �����? ��� ����� ����, �����!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_41");	//�����-������ � ����� ����� � ������ � ��������!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_42");	//� �� ����� �� ����� ������ � �������?
		AI_PlayAni(self,"T_GETLOST");
		AI_PlayAni(self,"T_IGETYOU");
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_43");	//(������) �����! � �� ���� ���� �������!
		AI_StopProcessInfos(self);
	};
};

//NS - 27/06/2013 ===========
// �� ������ "��� ����� ��� ������?" 	nr=101
//===========================

instance DIA_Dil_AboutStolenIron(C_Info)
{
	npc = BAU_102_DS2P_DIL;
	nr = 101;
	condition = DIA_Dil_AboutStolenIron_condition;	
	information = DIA_Dil_AboutStolenIron_info;
	description = "��� �� ������ � ������� �������� ����?";
};
func int DIA_Dil_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Dil_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Dil_AboutStolenIron_15_00");	//��� �� ������ � ������� �������� ����?
		AI_Output(self,other,"DIA_Dil_AboutStolenIron_12_01");	//������, �������, �����... � ��� ���� ��� �����?
		AI_Output(self,other,"DIA_Dil_AboutStolenIron_12_02");	//�����, � ������� ������, � �����, � ������, � ������ �������� ����! ��� �����?!
	AI_StopProcessInfos(self);
	B_DSG_Bauers_AboutStolenIron_Counter();
};
