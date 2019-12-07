/***************************************************************
						�������� �� ��������
  �������� ����, ������� ����� ������� ������ ���-��-���.
  ��� ���� �������, �������� ��� ������.
***************************************************************/

instance DIA_GuardMill_EXIT(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;
	nr = 999;
	permanent = TRUE;
	condition = DIA_GuardMill_EXIT_condition;	
	information = DIA_GuardMill_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_GuardMill_EXIT_condition(){	return TRUE;};
func void DIA_GuardMill_EXIT_info(){	AI_StopProcessInfos(self);};

//--------------------------
instance DIA_GuardMill_WhatGuard(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;				nr = 1;
	condition = DIA_GuardMill_WhatGuard_condition;	
	information = DIA_GuardMill_WhatGuard_info;
	description = "��� �� ��� �������?";
	permanent = TRUE;
};
func int DIA_GuardMill_WhatGuard_condition()
{
	//UNFINISHED ����� ��������
	if (Npc_GetDistToWP(self,""))	{
		return TRUE;
	};
};
func void DIA_GuardMill_WhatGuard_info()
{
		AI_Output(other,self,"DIA_GuardMill_WhatGuard_13_01");	//��� �� ��� �������?
	AI_Output(self,other,"DIA_GuardMill_WhatGuard_13_02");	//������� ��� ��������� ��������.
		AI_Output(other,self,"DIA_GuardMill_WhatGuard_13_03");	//�� ����?
	AI_Output(self,other,"DIA_GuardMill_WhatGuard_13_04");	//�� ��������, ����� �� ���� ���������! ������� �� ����� �������, ������ �����.
	AI_Output(self,other,"DIA_GuardMill_WhatGuard_13_05");	//������� � �������� ���� ���������. � ������, ������ ����, ����� ������ ���� � �������, � ��� ����� ��� ���� ��������!
};

//--------------------------
instance DIA_GuardMill_NoTalk(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;				nr = 2;
	condition = DIA_GuardMill_NoTalk_condition;	
	information = DIA_GuardMill_NoTalk_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_GuardMill_NoTalk_condition()
{
	if (Npc_IsInState(self,ZS_Talk) && !DIA_GuardMill_WhatGuard_condition())	{
		return TRUE;
	};
};
func void DIA_GuardMill_NoTalk_info()
{
		AI_Output(self,other,"DIA_GuardMill_NoTalk_13_01");	//������! ��� ���������.
	AI_StopProcessInfos(self);
};

//NS - 09/05/2016 ===========
// ����� "����� ���" 
//===========================
//������� ��������� ��� �����
//����� 2 ������� ���� (��� ���� ����� ������ � ���������� �������)
instance DIA_GuardMill_GiveBeer(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;				nr = 10;
	condition = DIA_GuardMill_GiveBeer_condition;	
	information = DIA_GuardMill_GiveBeer_info;
	description = "����� ��� ������? (�������)";
};
func int DIA_GuardMill_GiveBeer_condition()
{
	if (Wld_IsTime(0,0,3,30) && (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_CameTo)
		&& (Npc_HasItems(other,ItFo_Beer) >= 2))	{
		return TRUE;
	};
};
func void DIA_GuardMill_GiveBeer_info()
{
		AI_Output(other,self,"DIA_GuardMill_GiveBeer_13_01");	//����� ��� ������?
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_02");	//�� ������� � ������. ���� ��� ����� ����, ���� � ����� ���. ������ ����, ����� �����, ������� ������. �-�-�, ���������� �����������!
		AI_Output(other,self,"DIA_GuardMill_GiveBeer_13_03");	//(������������) ������. ������ ������?
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_04");	//� � ���� ����?
		AI_Output(other,self,"DIA_GuardMill_GiveBeer_13_05");	//��� �� ����. ���, �����.
	//�� �������� ������� � �����. �������� �������������� � ���.
	B_GiveInvItems(other,self,ItFo_Beer,1);
	AI_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_06");	//(������) ��� ������ �����, ��� ������� �������� �����.
		AI_Output(other,self,"DIA_GuardMill_GiveBeer_13_07");	//�����, ���?
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_08");	//�����.
	//�� �������� ������� � �����. �������� �������������� � ���.
	B_GiveInvItems(other,self,ItFo_Beer,1);
	AI_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_GuardMill_GiveBeer_13_09");	//������-�� ���! � ����� ������ �����������. ��� �... (��������� �����)
	AI_StopProcessInfos(self);
	//�������� ������� ����� ����� �� �����, ����� ��� ������������ ���������� ���.
	AI_StartState(self,ZS_MagicSleep,1,"");
};
