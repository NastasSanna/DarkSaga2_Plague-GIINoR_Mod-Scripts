/***************************************************************
						�������� � ������
//*NS - 01/07/2013
***************************************************************/

instance DIA_GuardCave_EXIT(C_Info)
{
	npc = PIR_222_DS2P_GuardCave;
	nr = 999;
	permanent = TRUE;
	condition = DIA_GuardCave_EXIT_condition;	
	information = DIA_GuardCave_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_GuardCave_EXIT_condition(){	return TRUE;};
func void DIA_GuardCave_EXIT_info(){	AI_StopProcessInfos(self);};

//--------------------------
instance DIA_GuardCave_GoAhead(C_Info)
{
	npc = PIR_222_DS2P_GuardCave;
	nr = 0;
	condition = DIA_GuardCave_GoAhead_condition;	
	information = DIA_GuardCave_GoAhead_info;
	important = TRUE;
};
func int DIA_GuardCave_GoAhead_condition(){	return TRUE;};
func void DIA_GuardCave_GoAhead_info()
{
	// ��� ��� �� ��� ��������, �������� �� �����
		AI_Output(self,other,"DIA_GuardCave_GoAhead_13_01");	//��� ������ � ������. ��� ���� ����.
		AI_Output(self,other,"DIA_GuardCave_GoAhead_13_02");	//� �� ������� ��������� ���������, � �� �� ������ �������� ���� �� ��� ����!
	AI_StopProcessInfos(self);
};

//--------------------------
instance DIA_GuardCave_IKnowNothing(C_Info)
{
	npc = PIR_222_DS2P_GuardCave;
	nr = 0;
	condition = DIA_GuardCave_IKnowNothing_condition;	
	information = DIA_GuardCave_IKnowNothing_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_GuardCave_IKnowNothing_condition()
{
	if (Npc_IsInState(self,ZS_Talk)){	return TRUE;	};
};
func void DIA_GuardCave_IKnowNothing_info()
{
		AI_Output(self,other,"DIA_GuardCave_IKnowNothing_13_01");	//� ������ �� ����.
	if (!Npc_IsDead(Ado))	{
		AI_Output(self,other,"DIA_GuardCave_IKnowNothing_13_02");	//�������� � ���.
	};
	AI_StopProcessInfos(self);
};
