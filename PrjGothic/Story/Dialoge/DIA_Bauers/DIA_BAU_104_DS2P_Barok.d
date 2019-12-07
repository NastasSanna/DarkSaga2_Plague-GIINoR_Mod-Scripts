instance DIA_Barok_EXIT(C_Info)
{
	npc = BAU_104_DS2P_Barok;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Barok_EXIT_condition;	
	information = DIA_Barok_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Barok_EXIT_condition(){	return TRUE;};
func void DIA_Barok_EXIT_info(){	AI_StopProcessInfos(self);};

//
//**--��������� ������----***//
//
var int C_DIA_Barok_Start_Done;
instance DIA_Barok_Start(C_Info)	//��������� ������;  nr=1;
{
	npc = BAU_104_DS2P_Barok;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Barok_Start_condition;	
	information = DIA_Barok_Start_info;
	important = TRUE;
};
func int DIA_Barok_Start_condition(){	
	//(���� ������� � ����, ����� �� �� � ������)	|| (���� �� � ������)	
	if(((C_Npc_GetDistToWP(self,"",700,more) && Npc_IsInState(self,ZS_Talk)) || C_Npc_GetDistToWP(self,"",700,less)) && !C_DIA_Barok_Start_Done)
	{return TRUE;};
};
func void DIA_Barok_Start_info()
{
	if(C_Npc_GetDistToWP(self,"",700,more))	//��������, �� � ������
	{
		AI_Output(self,other,"DIA_Barok_Start_01_00");	//�����! �� ����� ��� ��������!
		AI_StopProcessInfos(self);
	}
	else if(C_Npc_GetDistToWP(self,"",700,less))
	{
		B_StartOtherRoutine(PIR_202_DS2P_Symon,"GoToBarok");		//����� ������ �������� � ������ � ������� ����.
		
		AI_Output(self,other,"DIA_Barok_Start_01_01");	//��, ���� ���� �����? ����� �� ������� ��� ��������!
		AI_Output(other,self,"DIA_Barok_Start_15_00");	//� ��� �� ���?
		AI_Output(self,other,"DIA_Barok_Start_01_02");	//����� ��� �����, ��� �� ���?! ��� ������ �� ����� ����� �������� ������!
		AI_Output(other,self,"DIA_Barok_Start_15_01");	//� ��� �������, �� � ��������?
		AI_Output(self,other,"DIA_Barok_Start_01_03");	//��, ���� ����� ��� ������� � ����� � ���������� ���������.
		AI_Output(other,self,"DIA_Barok_Start_15_02");	//� ��� ���������?
		AI_Output(self,other,"DIA_Barok_Start_01_04");	//������ � ���, ��� ���������.
		AI_Output(self,other,"DIA_Barok_Start_01_05");	//��� ��������� ���������� ���� ������ � �����. �������, �� ����� ������ ����.
		AI_Output(self,other,"DIA_Barok_Start_01_06");	//� ��� �������, �� ������ �� ���� �� ����� �������. ��� � ������ ������ ��������, ����� ������������ ���������?
		AI_Output(self,other,"DIA_Barok_Start_01_07");	//�� ��� �� ��� ���������? ��� ���� �����, ����� ������ ������� � �������, � ������� �� ����� �������.
		AI_Output(self,other,"DIA_Barok_Start_01_08");	//���, �������� ������ ��� ���� � �� ������, ��� ���� ������. ��, �����, ��� ���������.
		if(Hlp_IsValidNpc(Sheep_Barok_01) && !Npc_IsDead(Sheep_Barok_01)) {Sheep_Barok_01.flags = 0;};
		if(Hlp_IsValidNpc(Sheep_Barok_02) && !Npc_IsDead(Sheep_Barok_02)) {Sheep_Barok_02.flags = 0;};
		if(Hlp_IsValidNpc(Sheep_Barok_03) && !Npc_IsDead(Sheep_Barok_03)) {Sheep_Barok_03.flags = 0;};
		C_DIA_Barok_Start_Done = TRUE;
	};
	
};

//����

instance DIA_Barok_SymonKillShip(C_Info)		//�������� ����� ������ � ������� ����.  nr=1;
{
	npc = BAU_104_DS2P_Barok;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Barok_SymonKillShip_condition;	
	information = DIA_Barok_SymonKillShip_info;
	important = TRUE;
};
func int DIA_Barok_SymonKillShip_condition(){	

	if(C_Npc_GetDistToWP(PIR_202_DS2P_Symon,"",500,less) && (C_DIA_Barok_Start_Done == TRUE))
	{
		other = Hlp_GetNpc(PIR_202_DS2P_Symon);
		AI_TurnToNpc(hero,other);
		AI_TurnToNpc(self,other);
		return TRUE;
	};
};
func void DIA_Barok_SymonKillShip_info()
{
	/*other - ��� ����� ������*/
	AI_Output(other,self,"DIA_Barok_SymonKillShip_13_00");	//��, ����������! ��� ����� ����!
	AI_Output(self,other,"DIA_Barok_SymonKillShip_01_00");	//�� �� �������� ��� ��� ����� � ���� ��������� ������. ���� ������ ���!
	AI_Output(other,self,"DIA_Barok_SymonKillShip_13_01");	//� ��� ���? � ���� �������� ��� ��� ����.
	AI_Output(self,other,"DIA_Barok_SymonKillShip_01_01");	//�� ��� �� ���� ������.
	AI_Output(other,self,"DIA_Barok_SymonKillShip_13_02");	//������, ���� ����� ����������.
	AI_StopProcessInfos(self);
	Sheep_Barok_01.flags = 0;
	Sheep_Barok_02.flags = 0;
	Sheep_Barok_03.flags = 0;
	if(Hlp_IsValidNpc(Sheep_Barok_01) && !Npc_IsDead(Sheep_Barok_01))
	{
		B_Attack(PIR_202_DS2P_Symon,Sheep_Barok_01,AR_NONE,1);
		
	}
	else if(Hlp_IsValidNpc(Sheep_Barok_02) && !Npc_IsDead(Sheep_Barok_02))
	{
		B_Attack(PIR_202_DS2P_Symon,Sheep_Barok_02,AR_NONE,1);
	}
	else if(Hlp_IsValidNpc(Sheep_Barok_03) && !Npc_IsDead(Sheep_Barok_03))
	{
		B_Attack(PIR_202_DS2P_Symon,Sheep_Barok_03,AR_NONE,1);
	};
	B_StartOtherRoutine(PIR_202_DS2P_Symon,"START");
};

instance DIA_Barok_DidUSee(C_Info)		//�����? ����� � ���� �� �������� ...  nr=1;
{
	npc = BAU_104_DS2P_Barok;
	nr = 1;
	permanent = FALSE;
	condition =DIA_Barok_DidUSee_condition;	
	information = DIA_Barok_DidUSee_info;
	important = TRUE;
};
func int DIA_Barok_DidUSee_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_SymonKillShip))	{return TRUE;	};};
func void DIA_Barok_DidUSee_info()
{
	AI_Output(self,other,"DIA_Barok_DidUSee_01_00");	//�����? ����� � ���� �� ��������, � ���������, ������ ���� ������������ ���������� �������.
	AI_Output(other,self,"DIA_Barok_DidUSee_15_00");	//����! �� ������ ��� ��� �������.
};

//--------------------------------------------------------
//		�Ѩ ��������� ����������� ����� ���������� ��������
//--------------------------------------------------------

instance DIA_Barok_WhatAreUPlanningToDo(C_Info)		//��� �� ���������� ������?  nr=4;
{
	npc = BAU_104_DS2P_Barok;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Barok_WhatAreUPlanningToDo_condition;	
	information = DIA_Barok_WhatAreUPlanningToDo_info;
	description = "��� �� ���������� ������?";
};
func int DIA_Barok_WhatAreUPlanningToDo_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_DidUSee))	{return TRUE;	};};
func void DIA_Barok_WhatAreUPlanningToDo_info()
{
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_15_00");	//��� �� ���������� ������?
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_00");	//���� � ���� ���� ����, ��, �����, ������ �� ������.
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_15_01");	//� ��� ��?
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_01");	//��� � ��� �������, ��������� ����� ����������, � ����� ��� ����� ����� ����������.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_02");	//����� ����� ��� ������ ���� ���� �� ���-������ ��������. ��� ������ ��� ����� �� �������� ������ �������� �����.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_03");	//� ����� ���������� �������� � ������ �� ����.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_04");	//��� ���, �� ���� ����� ������, ��� ���� �� �������, ����� ��������� � �������� ��������, �� �����, ��� ���� ������� ���-������ ������, ������ ��������.
	
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_15_02");	//�������? �� ������?
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_05");	//� ��������� ��������! �� ���������� ����� ����� � ��������� �����.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_06");	//����� ������ ������� ��� ����� ������ �����, �� � ������ ���� �������. (������ �������)
	AI_PlayAni(self,"T_LAUGH_01");
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_07");	//������, ����� �� ������� � ���?
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_15_03");	//��...
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_08");	//� ������� �������!
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_09");	//���? ����� ������ ���� ���� ������ ��������, ������� ����� ��� ��� � ������� ������ �������. �� �������� ������� �����.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_10");	// ����������, �������� ������.
	Info_ClearChoices(DIA_Barok_WhatAreUPlanningToDo);
	Info_AddChoice(DIA_Barok_WhatAreUPlanningToDo,"������, ��� � ������ ������?",DIA_Barok_WhatAreUPlanningToDo_Yes);
	Info_AddChoice(DIA_Barok_WhatAreUPlanningToDo,"� �� ���� ���� ����������.",DIA_Barok_WhatAreUPlanningToDo_No);
};
func void DIA_Barok_WhatAreUPlanningToDo_No()
{
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_No_15_00");	//� �� ���� ���� ����������.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_No_01_00");	//(������) ��, � ������ � �����. ��������!
	AI_PlayAni(self,"T_COMEOVERHERE");
	AI_StopProcessInfos(self);
};
func void DIA_Barok_WhatAreUPlanningToDo_Yes()
{
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_Yes_15_00");	//������, ��� � ������ ������?
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_01");	//�������! �� ����� �������� ����! ������, ��� ����� �������.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_02");	//����� � ������, � ���� ������ ���� �����. ����� ������ �� � ����� � ��� �� �������, /*����-�� � ����-��*/.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_03");	//� �� ��� ����� ��� ��������. ������, �� ��� ����� �������.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_04");	//���� ������ � ���������� ����� ��� ���������. ��� ������ �������� ���, ����������� �����. ������ ������ ����� ������ ���.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_05");	//�� �����, ��� ������� ��� ���� ������� � �������. ������� ����� ��������� ��������� �����, � ����� ��������� � ���������.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_06");	//� ������, ��� ���� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_DangerousHunting,LOG_MISSION,LOG_Running,TOPIC_DS2P_DangerousHunting_Start);
};
//
//-----������ ���������� ����� ����������� "��� �� ���������� ������?" � ���� ����� ������ �����
//
instance DIA_Barok_TamirWantsGold4Snares(C_Info)		//����� ����� ������ �� �����.  nr=4;
{
	npc = BAU_104_DS2P_Barok;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Barok_TamirWantsGold4Snares_condition;	
	information = DIA_Barok_TamirWantsGold4Snares_info;
	description = "����� ����� ������ �� �����.";
};
func int DIA_Barok_TamirWantsGold4Snares_condition(){	
	if((MIS_DS2P_DangerousHunting == LOG_Running) && Tamir_Trade_Snare)	{return TRUE;	};
};
func void DIA_Barok_TamirWantsGold4Snares_info()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares_15_00");	//����� ����� ������ �� �����.
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares_01_00");	//��, �� ��, �������. �� �� �����, � �� �� ������ ���� ����� ������ ���. ������� �� �����?
	Info_ClearChoices(DIA_Barok_TamirWantsGold4Snares);
	Info_AddChoice(DIA_Barok_TamirWantsGold4Snares,"500 �������",DIA_Barok_TamirWantsGold4Snares500);
	Info_AddChoice(DIA_Barok_TamirWantsGold4Snares,"400 �������",DIA_Barok_TamirWantsGold4Snares400);
	Info_AddChoice(DIA_Barok_TamirWantsGold4Snares,"300 �������",DIA_Barok_TamirWantsGold4Snares300);
	Info_AddChoice(DIA_Barok_TamirWantsGold4Snares,"200 �������",DIA_Barok_TamirWantsGold4Snares200);
};
func void B_DIA_Barok_TamirWantsGold4SnaresUni() {	
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4SnaresUni_01_00");	//��� ��������, ��������� ��������, ����� ��������� ��������.
};
func void DIA_Barok_TamirWantsGold4Snares500()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares500_15_00");	//500 �������
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares500_01_00");	//500 �������? �� �� ����� ���� ������! �� ������� ���� 300 �������.
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares500_01_01");	//��, ����, ���� �� �������� ������ ������. ������, �� ������ ���� �������� ������ ������.
};
func void DIA_Barok_TamirWantsGold4Snares400()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares400_15_00");	//400 �������
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares400_01_00");	//���-�� �� ����� ����. ���� ����� � ��� ����������.
	B_DIA_Barok_TamirWantsGold4SnaresUni();
	B_GiveInvItems(self,other,ItMi_Gold,200);
};
func void DIA_Barok_TamirWantsGold4Snares300()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares300_15_00");	//300 �������
	B_DIA_Barok_TamirWantsGold4SnaresUni();
	B_GiveInvItems(self,other,ItMi_Gold,150);
};
func void DIA_Barok_TamirWantsGold4Snares200()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares200_15_00");	//200 �������
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares200_01_00");	//��... ���-�� �� ����� ����������. ��, �� �����.
	B_DIA_Barok_TamirWantsGold4SnaresUni();
	B_GiveInvItems(self,other,ItMi_Gold,100);
};
//
//-----������ ���������� �����: ����������� "��� �� ���������� ������?"; ���� ������� ����� "������� �����"; ���� ��������� �������
//
instance DIA_Barok_IveCaughtTwoRabbits(C_Info)		//��� ������� ������� ���� ��������.  nr=4;
{
	npc = BAU_104_DS2P_Barok;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Barok_IveCaughtTwoRabbits_condition;	
	information = DIA_Barok_IveCaughtTwoRabbits_info;
	description = "��� ������� ������� ���� ��������.";
};
func int DIA_Barok_IveCaughtTwoRabbits_condition(){	
	if((MIS_DS2P_DangerousHunting == LOG_Running) && C_Npc_DS_HasItems(other,ITMI_DS2P_SnaresForHunting_Full,2))	{return TRUE;	};
};
func void DIA_Barok_IveCaughtTwoRabbits_info()
{
	var int x; x = 0;
	AI_Output(other,self,"DIA_Barok_IveCaughtTwoRabbits_15_00");	//��� ������� ������� ���� ��������.
	B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_SnaresForHunting_Full,2,34);
	AI_Output(self,other,"DIA_Barok_IveCaughtTwoRabbits_01_01");	//(����������� �������) ���! ��� �� �� �������� ���� ������!
	AI_PlayAni(self,"T_LAUGH_01");
	AI_Output(self,other,"DIA_Barok_IveCaughtTwoRabbits_01_02");	//(������ �������) � ���, ��-������, ��� ����� ������������?
	AI_Output(other,self,"DIA_Barok_IveCaughtTwoRabbits_15_03");	//(����������) � �� ���������� �� ��������.
	AI_Output(self,other,"DIA_Barok_IveCaughtTwoRabbits_01_04");	//�����, �����! �� �������� ����� ����� ������. ��� ��������� �������.
	B_GiveInvItem_red(self,other,ITMI_Gold,300,37);
	B_GiveInvItem_red(self,other,ItAm_DS2P_WispDetector,1,40);
	B_DSG_Log_OpenClose(TOPIC_DS2P_DangerousHunting,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_DangerousHunting_Success);
	x = 1;
	if(x==1)
	{
		Wld_InsertNpc(Rabbit,"");
		Wld_InsertNpc(Rabbit,"");
	};
};
//
//-----������ ���������� �����: ���������� ������ "������� �����"
//
instance DIA_Barok_HowAUGoingToBreedRabbits(C_Info)		//� ��� �� ������ ������ ��������� ��������?  nr=40;
{
	npc = BAU_104_DS2P_Barok;
	nr = 40;
	permanent = FALSE;
	condition = DIA_Barok_HowAUGoingToBreedRabbits_condition;	
	information = DIA_Barok_HowAUGoingToBreedRabbits_info;
	description = "� ��� �� ������ ������ ��������� ��������?";
};
func int DIA_Barok_HowAUGoingToBreedRabbits_condition(){	if(MIS_DS2P_DangerousHunting == LOG_SUCCESS)	{return TRUE;	};};
func void DIA_Barok_HowAUGoingToBreedRabbits_info()
{
	AI_Output(other,self,"DIA_Barok_HowAUGoingToBreedRabbits_15_00");	//� ��� �� ������ ������ ��������� ��������?
	AI_Output(self,other,"DIA_Barok_HowAUGoingToBreedRabbits_01_00");	//������� ������. �� ������� �������, ����� ������� ��� ���� �����, �� ��� �� ��������� ������.
	AI_Output(self,other,"DIA_Barok_HowAUGoingToBreedRabbits_01_01");	//�����, ����� �� �������� ��� ��� � ������� �������, � ����� ��� ���������� ����� ����� �������� �� ��� �������.
	AI_PlayAni(self,"T_LAUGH_01");		//(������ �������)
};
//
//-----������ ���������� �����: ���������� ������ "������� �����"
//
instance DIA_Barok_YouHaveDeceivedMe(C_Info)		//�� ������� ����.  nr=41;
{
	npc = BAU_104_DS2P_Barok;
	nr = 41;
	permanent = FALSE;
	condition = DIA_Barok_YouHaveDeceivedMe_condition;	
	information = DIA_Barok_YouHaveDeceivedMe_info;
	description = "�� ������� ����.";
};
func int DIA_Barok_YouHaveDeceivedMe_condition(){	if(MIS_DS2P_DangerousHunting == LOG_SUCCESS)	{return TRUE;	};};
func void DIA_Barok_YouHaveDeceivedMe_info()
{
	AI_Output(other,self,"DIA_Barok_YouHaveDeceivedMe_15_00");	//�� ������� ����.
	AI_Output(self,other,"DIA_Barok_YouHaveDeceivedMe_01_00");	//� ��� �� ��������?
	AI_Output(other,self,"DIA_Barok_YouHaveDeceivedMe_15_01");	//����� ���� � ����� ���������? ������ �������� ����������, �� �����.
	AI_Output(self,other,"DIA_Barok_YouHaveDeceivedMe_01_01");	//��� ��� �������, ��� ����, ����������� � ���, ������� �������������. � �� ���� � ���� ����, �� ������!
	AI_Output(self,other,"DIA_Barok_YouHaveDeceivedMe_01_02");	//��� ��� ��� ���������, �� �����, ��� ���� ��� ���� � ��������  �� �������!
	AI_Output(self,other,"DIA_Barok_YouHaveDeceivedMe_01_03");	//��� ���, ����� ����, ����������� � ���������, ����������, ���������� ���������� ������������ ����������. �����, ��� ������ ������� ������� ���.
};
//-----------------------------
//-----------------------------
instance DIA_Barok_DoUHaveSomeMeat(C_Info)		//(��������) � ���� �� �������� ������� �����?  nr=5;
{
	npc = BAU_104_DS2P_Barok;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Barok_DoUHaveSomeMeat_condition;	
	information = DIA_Barok_DoUHaveSomeMeat_info;
	description = "(��������) � ���� �� �������� ������� �����?";
};
func int DIA_Barok_DoUHaveSomeMeat_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_DidUSee))	{return TRUE;	};};
func void DIA_Barok_DoUHaveSomeMeat_info()
{
	AI_Output(other,self,"DIA_Barok_DoUHaveSomeMeat_15_00");	//(��������) � ���� �� �������� ������� �����?
	AI_Output(self,other,"DIA_Barok_DoUHaveSomeMeat_01_00");	//�� ���, ����� ������������ ���� ����?! ������� � ��� �������, �� �� �� ���� �� ���.
	AI_DrawWeapon(self);
	AI_Output(self,other,"DIA_Barok_DoUHaveSomeMeat_01_01");	//���������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
//-----------------------------
//-----------------------------
instance DIA_Barok_GiveMeMilk(C_Info)		//������ ���� �������.  nr=6;
{
	npc = BAU_104_DS2P_Barok;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Barok_GiveMeMilk_condition;	
	information = DIA_Barok_GiveMeMilk_info;
	description = "������ ���� �������.";
};
func int DIA_Barok_GiveMeMilk_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_DidUSee))	{return TRUE;	};};
func void DIA_Barok_GiveMeMilk_info()
{
	AI_Output(other,self,"DIA_Barok_GiveMeMilk_15_00");	//������ ���� �������.
	AI_Output(self,other,"DIA_Barok_GiveMeMilk_01_00");	//������, �� ������ ������� ���, � ��� ����� ����� �������� �����. ����� � ���, ��������, ��� ���� ���-������ �������.
};
//-----------------------------
//-----------------------------
instance DIA_Barok_WhatRumorsInVillage(C_Info)		//��� ������ � �������? (����������)  nr=7;
{
	npc = BAU_104_DS2P_Barok;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Barok_WhatRumorsInVillage_condition;	
	information = DIA_Barok_WhatRumorsInVillage_info;
	description = "��� ������ � �������?";
};
func int DIA_Barok_WhatRumorsInVillage_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_DidUSee))	{return TRUE;	};};
func void DIA_Barok_WhatRumorsInVillage_info()
{
	AI_Output(other,self,"DIA_Barok_WhatRumorsInVillage_15_00");	//��� ������ � �������?
	AI_Output(self,other,"DIA_Barok_WhatRumorsInVillage_01_00");	//������, ��� � ���� ���� �������. �����, �������� ���� � �����, �?! ����� � ������� ������ ������� ���������� �����. 
	AI_PlayAni(self,"T_LAUGH_01");
};

//NS - 27/06/2013 ===========
// �� ������ "��� ����� ��� ������?" 	nr=101
//===========================

instance DIA_Barok_AboutStolenIron(C_Info)
{
	npc = BAU_104_DS2P_Barok;
	nr = 101;
	condition = DIA_Barok_AboutStolenIron_condition;	
	information = DIA_Barok_AboutStolenIron_info;
	description = "���-�� ������� �������.";
};
func int DIA_Barok_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Barok_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Barok_AboutStolenIron_15_00");	//���-�� ������� �������.
		AI_Output(self,other,"DIA_Barok_AboutStolenIron_01_01");	//� ���� ���� ��� ��� � ��������� ������. ��� ������ � ������, ��� ������, ������ � �������!
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 02/07/2013 ================================================
// ����� ������ ������
//================================================================
instance DIA_Barok_KadarDead(C_Info)
{
	npc = BAU_104_DS2P_Barok;
	nr = 0;
	condition = DIA_Barok_KadarDead_condition;	
	information = DIA_Barok_KadarDead_info;
	important = TRUE;
};
func int DIA_Barok_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Barok_KadarDead_info()
{
		AI_Output(self,other,"DIA_Barok_KadarDead_01_00");	//������� ������! ��� �� �������� �������...
};



