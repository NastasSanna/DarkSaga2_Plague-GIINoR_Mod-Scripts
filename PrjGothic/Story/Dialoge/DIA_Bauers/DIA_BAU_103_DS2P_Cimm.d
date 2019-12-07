instance DIA_Cimm_EXIT(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Cimm_EXIT_condition;	
	information = DIA_Cimm_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Cimm_EXIT_condition(){	return TRUE;};
func void DIA_Cimm_EXIT_info(){	AI_StopProcessInfos(self);};
//
instance DIA_Cimm_Start(C_Info)	//��������� ������
{
	npc = BAU_103_DS2P_Cimm;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Cimm_Start_condition;	
	information = DIA_Cimm_Start_info;
	important = TRUE;
};
func int DIA_Cimm_Start_condition(){	return TRUE;};
func void DIA_Cimm_Start_info()
{
	AI_Output(self,other,"DIA_Cimm_Start_03_00");	//�, ����������. ���� ������ ��� ������!
	AI_Output(self,other,"DIA_Cimm_Start_03_01");	//������ � ��� �������� ������, ����, ������� � ������, ����� ���� ������� �������� ����������� ����� ����� �����.
};
//----
//���������� ����� ����������
//----
instance DIA_Cimm_WhatDoUDo(C_Info)	//��� �� �����������?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Cimm_WhatDoUDo_condition;	
	information = DIA_Cimm_WhatDoUDo_info;
	description = "��� �� �����������?";
};
func int DIA_Cimm_WhatDoUDo_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_Start)){	return TRUE;};	};
func void DIA_Cimm_WhatDoUDo_info()
{
		AI_Output(other,self,"DIA_Cimm_WhatDoUDo_15_00");	//��� �� �����������?
	AI_Output(self,other,"DIA_Cimm_WhatDoUDo_03_01");	//�, ���� ���, � ���� ����� ������� �������, ������� ����� � ���� ������� ������� ��������.
	AI_Output(self,other,"DIA_Cimm_WhatDoUDo_03_02");	//� ������� ����������, ���� �� �������, ��� ������ ������.
		AI_Output(other,self,"DIA_Cimm_WhatDoUDo_15_03");	//�� ��������?
	AI_Output(self,other,"DIA_Cimm_WhatDoUDo_03_04");	//��, ��������, �������, ���� ������� ������. (�������)
	AI_PlayAni(self,"T_LAUGH_01");
};
//----
//���������� ����� ����������� ("��� �� �����������?")
//----
instance DIA_Cimm_HelpMeToHealTeam(C_Info)	//������ ��� �������� �������.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 50;
	permanent = FALSE;
	condition = DIA_Cimm_HelpMeToHealTeam_condition;	
	information = DIA_Cimm_HelpMeToHealTeam_info;
	description = "������ ��� �������� �������.";
};
func int DIA_Cimm_HelpMeToHealTeam_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_WhatDoUDo)){	return TRUE;};	};
func void DIA_Cimm_HelpMeToHealTeam_info()
{
		AI_Output(other,self,"DIA_Cimm_HelpMeToHealTeam_15_00");	//� ��� �� ������� ����, ������ ���� ���-�� �� ������ ������� ������� � ����. � �� ����, ��� ������ ��. ������ ��� �� ��������.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_01");	//�������, �������! � � �������� ������ ����, ���� �� �������� ���. (����� ���������)
	
		AI_Output(other,self,"DIA_Cimm_HelpMeToHealTeam_15_02");	//��� � ������ �������?
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_03");	//��� �� ��� �����, �� ��������� � ��������� ��������������� ���������.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_04");	//��� ������ ��������� ��������� � ���� ����������� �����, � ���������� ���������� ������ �������. ������ �� ����� �� �������� - ��� �������, ��� � ����.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_05");	//������, ��������, ����� ����������� �� ���� ������ ��������.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_06");	//��� ���, ���� ���� ����� ���� �� ���� ����������� �� ����� ������, ��������� �� ��� ����������, �������� �� ��� � ��� � ������, ��� ������ � ������ ������� ��� �����.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_07");	//�������, � ���� ������ ���� �� �����, ��� � ���������� ����� ��������� � �� ���� ��������.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_08");	//� ���� � �������� ������� ��� ����, �� �� ����� ������ ���� �������� ���� � ��������� ��������������� ������, � ����� ������ - ����.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_09");	//� ������� ������ � �� ������� �������, ������� ���������������� ��� ������ �� ����.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_10");	//� ��, ��� ����� �� �����������, ������ ����� �� �����, ��� ��� ������ ���������� ����� ������ � �����.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_11");	//� �����, � ����� � ������� ���������, � ����� ���� ��� ����� �� ������ ������ �������� ���� �� ���� ��������.
		AI_Output(other,self,"DIA_Cimm_HelpMeToHealTeam_15_12");	//� �������, ��� ����� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_CimmHelp);
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_Start);
};
//----
//���������� ����� ����������� ("������ ��� �������� �������.") ��� ���������� ������
//----
instance DIA_Cimm_SymonIsNotYourProblem(C_Info)	//������ ������ �� ����������� ������ �������, �� ��������� �� ����.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 50;
	condition = DIA_Cimm_SymonIsNotYourProblem_condition;	
	information = DIA_Cimm_SymonIsNotYourProblem_info;
	description = "������ ������ �� ����������� ������ �������.";
};
func int DIA_Cimm_SymonIsNotYourProblem_condition(){	
	if((MIS_DS2P_UnhappyHealer == Log_Running) && Symon_IsNot_Problem_4Cimm)
	{	return TRUE;};	
};
func void DIA_Cimm_SymonIsNotYourProblem_info()
{
		AI_Output(other,self,"DIA_Cimm_SymonIsNotYourProblem_15_00");	//������ ������ �� ����������� ������ �������, �� ��������� �� ����.
	AI_Output(self,other,"DIA_Cimm_SymonIsNotYourProblem_03_00");	//�������? ��� ������. �������-�� � ����� ������� �����������, � �� ������ � ���� ����� � �����.
		AI_Output(other,self,"DIA_Cimm_SymonIsNotYourProblem_15_01");	//��� ������ ������ � ������ ��������� �� ����?
	AI_Output(self,other,"DIA_Cimm_SymonIsNotYourProblem_03_01");	//�������, �������, � ��� �����, � ������� ��� ���� ���������, ����� ������ ����� �������. ����� �� ��� ����� �����-������. ��������, ��� �������� ��������...
	AI_Output(self,other,"DIA_Cimm_SymonIsNotYourProblem_03_02");	//���, �������� ��� � ������� ������ ����.	
		AI_Output(other,self,"DIA_Cimm_SymonIsNotYourProblem_15_02");	//� ��������� �� ���� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_UnhappyHealer_Success);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_CimmHelp_1);
	Cimm_HelpDay = Wld_GetDay();
};
//----
//���������� ����� ����������� ("������ ������ �� ����������� ������ �������.")
//----
instance DIA_Cimm_FindingCure(C_Info)	//��� ���� ������ ���������?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 50;
	condition = DIA_Cimm_FindingCure_condition;	
	information = DIA_Cimm_FindingCure_info;
	description = "��� ���� ������ ���������?";
};
func int DIA_Cimm_FindingCure_condition(){	
	if((MIS_DS2P_UnhappyHealer == LOG_SUCCESS) && (Wld_GetDay() > Cimm_HelpDay))
	{	return TRUE;};	
};
func void DIA_Cimm_FindingCure_info()
{
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_00");	//��� ���� ������ ���������?
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//���� ���, ��� ��������� ������� �������. � ������ ���� ������� ��� ������� �� ������������ ��������� ��������, � ���� ������ ���.
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_01");	//� �������, �� ������ ������������ ������� ��������. �����, ��� ������� ����� �� �������.
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_01");	//(��������) � ��� � ����, ��� ��-�������� �� ���������. ����� ���-�� �������� ���� ������?
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_02");	//: (��������) ���� ������ �� �� ������������� ������� ��� ������� ���, ����� ������ ��� ������ ������ ��������.
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_03");	//�� ���� ������� ���� ������ ���� �������, ������� ������ ��� ������.
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_02");	//������-�� ���� ��� ������, � ���� ���������� �� ����...
	if(Npc_KnowsInfo(other,DIA_Cimm_WhoIsEkor))	
	{
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_03");	//� ��� �������, �� ��� �����? �� ��� �������� ��� ���.
		AI_Output(self,other,"DIA_Cimm_FindingCure_03_04");	//��, ��� ����, ����� ������� ������ � ����. 
	}
	else
	{
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_04");	//� ��� �� �������?
		AI_Output(self,other,"DIA_Cimm_FindingCure_03_05");	//��� ����� ����, �� ��������� � ����� ���������, �� ��� ���� ������� �� ������� ����� ����.
	};
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_06");	//� ������ �������� ������, � �� ��� ��������.
	
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_00");	//������? �� � � ��� ����� ��� ������������. ��� �� �����?
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//(��������) �������� �������, ������ ���� �� �� ���� ������ �������. 
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//���������, �� ��� ��� ���������� ��� ��������... ���� � �� ���� �������, ����� ����, � �������� �� ����� � ���� ����� �� ����.
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//���� �� ��� �������, ��������� �������, �� � ����� ���� �� ������ �������� � ��� ����� ��������.
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_00");	//(���������) ���� ����� ���. ����� �� ����� ������� � ���� ������� �� ����?
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//�������? ��� ��� ��� ���������. ������ ���� ��, ���� �������, � ������ �������� ��� �� �������.
	/*UNFINISH*/
	B_UseFakeBook();
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//���� ������� /*REDLEHA: ���-��*. ��� ������, �������� ���, � �� ������ ������.
	B_GiveInvItems(self,other,ITWr_DS2P_Letter_fCimm_tEkor,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_CimmGoToEkor);
	/*��������� ����� ������*/
	Wld_InsertNpc(OUT_400_DS2P_Ekor,"");
};
//----
//���������� ����� ����������� ("������ ��� �������� �������.")
//----
instance DIA_Cimm_HowIsTheTrade(C_Info)	//��� ���� ��������?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 501;
	permanent = TRUE;
	condition = DIA_Cimm_HowIsTheTrade_condition;	
	information = DIA_Cimm_HowIsTheTrade_info;
	description = "��� ���� ��������?";
};
func int DIA_Cimm_HowIsTheTrade_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_HelpMeToHealTeam)){	return TRUE;};	};
func void DIA_Cimm_HowIsTheTrade_info()
{
		AI_Output(other,self,"DIA_Cimm_HowIsTheTrade_15_00");	//��� ���� ��������?
	AI_Output(self,other,"DIA_Cimm_HowIsTheTrade_03_01");	//������ �� �����. ������� ��������� ������ �������, ������ ��� ��������.
};
//----
//���������� ����� ����������� ("������ ��� �������� �������.")
//----
instance DIA_Cimm_CanUMakePotions4Me(C_Info)	//�� ������ ���������� ��� ���� �����? /*������������ � ��������� ����� � ��������� �������*/
{
	npc = BAU_103_DS2P_Cimm;
	nr = 502;
	permanent = FALSE;
	condition = DIA_Cimm_CanUMakePotions4Me_condition;	
	information = DIA_Cimm_CanUMakePotions4Me_info;
	description = "�� ������ ���������� ��� ���� �����?";
};
func int DIA_Cimm_CanUMakePotions4Me_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_HelpMeToHealTeam)){	return TRUE;};	};
func void DIA_Cimm_CanUMakePotions4Me_info()
{
		AI_Output(other,self,"DIA_Cimm_CanUMakePotions4Me_15_00");	//�� ������ ���������� ��� ���� �����?
	AI_Output(self,other,"DIA_Cimm_CanUMakePotions4Me_03_01");	//� ��������, ��. ���� �� ��������� ��� ����������� ����� � ������� ������, �� � � �������� ����� ��� ���� ��������� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_MakingPotionsInVillage,LOG_NOTE,-1,"������� ���� ����� ���������� ��� ���� �����, ���� � ������� ��� ����������� �����������.");
	/*������������ � ��������� ����� � ��������� �������*/
};
//----
//���������� ����� ����������� ("��� �� �����������?")
//----
instance DIA_Cimm_PreTeachAlchemy(C_Info)	//����� ���� �������. /*�������� � ��������� �����*/
{
	npc = BAU_103_DS2P_Cimm;
	nr = 51;
	permanent = FALSE;
	condition = DIA_Cimm_PreTeachAlchemy_condition;	
	information = DIA_Cimm_PreTeachAlchemy_info;
	description = "����� ���� �������.";
};
func int DIA_Cimm_PreTeachAlchemy_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_WhatDoUDo)){	return TRUE;};	};
func void DIA_Cimm_PreTeachAlchemy_info()
{
	AI_Output(other,self,"DIA_Cimm_PreTeachAlchemy_15_00");	//����� ���� �������.
	AI_Output(self,other,"DIA_Cimm_PreTeachAlchemy_03_01");	//�� ������ ������� ��������� �������? ����� ���������! � ������ ���, ��� ���� �����.
	AI_Output(self,other,"DIA_Cimm_PreTeachAlchemy_03_02");	//�� �������� ����� � ����� ���� ������������� ��� ��������� � ����������� �����.
	AI_Output(self,other,"DIA_Cimm_PreTeachAlchemy_03_03");	//����� ������, ������ ������� ���������, � ����, ��� ���������� ����� �������, ������� �� ��������� ����� �������� ���� �����������, � ����� ������� ��� � ����.
	AI_Output(self,other,"DIA_Cimm_PreTeachAlchemy_03_04");	//�� � ��� ��� �� ���, � ���� ��������, ��� ������������� ��� � �����������! � ���, ���� ���, ����� ������ �� ������ �������.
	B_DSG_Log_OpenClose(TOPIC_BauerTeacher,LOG_NOTE,-1,"������� ���� ����� ������� ���� �������.");
	/*�������� � ��������� �����*/
	//UNFINISHED
};
//----
//���������� ����� ����������� ("��� �� �����������?")
//----
instance DIA_Cimm_CanIBuyPotions(C_Info)	//� ���� ������ � ���� �����?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 52;
	permanent = FALSE;
	condition = DIA_Cimm_CanIBuyPotions_condition;	
	information = DIA_Cimm_CanIBuyPotions_info;
	description = "� ���� ������ � ���� �����?";
	trade = TRUE;
};
func int DIA_Cimm_CanIBuyPotions_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_WhatDoUDo)){	return TRUE;};	};
func void DIA_Cimm_CanIBuyPotions_info()
{
	AI_Output(other,self,"DIA_Cimm_CanIBuyPotions_15_00");	//� ���� ������ � ���� �����?
	AI_Output(self,other,"DIA_Cimm_CanIBuyPotions_03_00");	//�������! � ���� ��������� ������ ��������, ������ � �����. ��� ���� ������� � ������. ������, �������.
	B_GiveTradeInv(self);
	B_DSG_Log_OpenClose(TOPIC_BauerTrader,LOG_NOTE,-1,"�������� ���� ������� ����� � �����.");
};
instance DIA_Cimm_Trade(C_Info)	//��������
{
	npc = BAU_103_DS2P_Cimm;
	nr = 52;
	permanent = TRUE;
	condition = DIA_Cimm_Trade_condition;	
	information = DIA_Cimm_Trade_info;
	description = "������ ��� ���� ����� � �����.";
	trade = TRUE;
};
func int DIA_Cimm_Trade_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_CanIBuyPotions)){	return TRUE;};	};
func void DIA_Cimm_Trade_info()
{
	AI_Output(other,self,"DIA_Cimm_Trade_15_00");	//������ ��� ���� ����� � �����.
	AI_Output(self,other,"DIA_Cimm_Trade_03_00");	//� ���� ����� ������� �����. ������, �������.
	B_GiveTradeInv(self);
};
//**------------------------------------------------------------------------------
//--------------------�����-------------------------------------------------------
//**------------------------------------------------------------------------------

//----
//���������� ����� ���������� (���� ���� ����� ����� �������)(���� ��� �� ������� ���������� � �����))
//----
instance DIA_Cimm_ImLookingForGaron(C_Info)	//� ��� ������.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Cimm_ImLookingForGaron_condition;	
	information = DIA_Cimm_ImLookingForGaron_info;
	description = "� ��� ������.";
};
func int DIA_Cimm_ImLookingForGaron_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Cimm_Start) && (MIS_DS2P_GrandsonOfFisherman == LOG_Running) && !Npc_KnowsInfo(other,DIA_Maria_AboutGaron))
	{return TRUE;};	
};
func void DIA_Cimm_ImLookingForGaron_info()
{
	AI_Output(other,self,"DIA_Cimm_ImLookingForGaron_15_00");	//� ��� ������.
	AI_Output(self,other,"DIA_Cimm_ImLookingForGaron_03_00");	//�����? ��� ���� ������, � ���� �� ������?!
	AI_Output(other,self,"DIA_Cimm_ImLookingForGaron_15_01");	//��, �� �����. �� ����� ���?
	AI_Output(self,other,"DIA_Cimm_ImLookingForGaron_03_01");	//���� ���� ����� �� ������� �� ��� �� �������. �� ��� ���� � �����, � �������� � �������.
	AI_Output(self,other,"DIA_Cimm_ImLookingForGaron_03_02");	//� ��� ��������� �������. ����� �� ���� �������� �� ��� ������� � ����� ������.
	AI_Output(self,other,"DIA_Cimm_ImLookingForGaron_03_03");	//������ � � ��� ������ �� ����.
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_01);
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_CimmSeen);
};

//----
//���������� ����� ����������
//----
instance DIA_Cimm_TellMeAboutVillage(C_Info)	//�������� ��� � �������.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Cimm_TellMeAboutVillage_condition;	
	information = DIA_Cimm_TellMeAboutVillage_info;
	description = "�������� ��� � �������.";
};
func int DIA_Cimm_TellMeAboutVillage_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Cimm_Start)) 	{return TRUE;};	
};
func void DIA_Cimm_TellMeAboutVillage_info()
{
	AI_Output(other,self,"DIA_Cimm_TellMeAboutVillage_15_00");	//�������� ��� � �������.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_00");	//���� ������� ����� �������. ���� ������ �������� ����� ��������� ����� �������� �����.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_01");	//��� ��� ������� �������� ����.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_02");	//�� ����� � �������������� ����� ������ ����� �������.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_03");	//����� ��� ������� �� �������� � ��������, � ������, ��� ��������, ��� ��������, ���� ������.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_04");	//�� �������� ������ �� �����, � ��������, ��� �����.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_05");	//�� � �� ����������, ��������, ���� ���� ������ ������������ ��� ��, ��� �� ��������.
};
//----
//���������� ����� ���������� (���� ���� �� ��� ������� � �����)
//----
instance DIA_Cimm_IMetDil(C_Info)	//� �������� ����.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Cimm_IMetDil_condition;	
	information = DIA_Cimm_IMetDil_info;
	description = "� �������� ����.";
};
func int DIA_Cimm_IMetDil_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Cimm_Start) && (Bau_102_DS2P_Dil.aivar[AIV_TalkedToPlayer] == TRUE)) 	{return TRUE;};	
};
func void DIA_Cimm_IMetDil_info()
{
	AI_Output(other,self,"DIA_Cimm_IMetDil_15_00");	//� ������� � �������� �����������, ������, �� �������� ����.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_00");	//�, ������ ����, �� �������� � ����, ����� ��������. �� �� �������� �������� ��� �����������.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_01");	//������, ����������� � ���, ��� �������, ��� ��� �� ����� ��� ����� � ���, � �� ����� �������� ������� �� ���, ���� � �������� � �����.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_02");	//������ � ���� ��� ����� ������, ��� �� �� ����� �� ����������� � ���������� ������� � �������� ��� �� �������� �����, �� ��� �� ������� �� ������.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_03");	//�������� ��� �� �������!� - ������ ��� �� ������� ������ ���.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_04");	//����� ����� � �������� ������� ��� ��������.
	
	AI_Output(other,self,"DIA_Cimm_IMetDil_15_01");	//� ��� � ��� ���������? ��� �� ������ ��� �����?
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_05");	//������. ������ �� ��� ������ ������� ������� ���������, � ����� ������� �� ������� �� ��� ������� �����������.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_06");	//�� ���� ��� ����� ��������� ���������. �� ���� ���� ������ ���������.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_07");	//�������  ������������� ���������� ��� ����, ����� ���� ���� ����. ����� ����������, ��� ����� ������� ��� �� �� ��� �� ���������� � ���� ���� ��� ������.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_08");	//����� ����������� � �������� �� ���� � �� ����� ������ ����������.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_09");	//��� ������ ��������. �� ����� ����������, ��� ������ �� �������� � ������ ��������� ����.
	
	AI_Output(other,self,"DIA_Cimm_IMetDil_15_02");	//�� ��� ��������� �� ���.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_10");	//��. ������� ����� ����������� ����������.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_11");	//�� ����, ��� ���� ����� ���� �� ����� ����� ��������� �������� �����.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_12");	//�� ������, ��� ��� ��� ������ � ����� ��� ���� ������ �� �������� ���������.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_13");	//�� ����� ���� ���� ����� �����������, �� ������ ��� ������ �������� �� ��� ��� ���� �����.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_14");	//� �����, ����� � ������� ��� �����, � ���� ������� �� ���� ��������. 
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_15");	//���� �������� �� �������� �� ����� ����� � �������� � ���� ����. �� ����� �� �������� �����.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_16");	//������ ������� ��� ������ ������. �� �� ����, ��� ��� �� ������, �� ����� �� �������� c �������������� �����, �� ��� ��������� �����.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_17");	//���� � ��������� ����� ������, �� �������� � ������� ��� � �� ����.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_18");	//�������� ���� � ��� � �������� ����� ������ ����� ��� ������ �����, ������ �������� �����-�� ��� ��������� ��������� ����.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_19");	//����� ������� ���� ��������, �� �� ������ ������� �����... (��������)
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_20");	//����� �� �� ��� ������������� �������, ��� ��������� � �� ����, �� �� ������ ������� �� ��� ������������� ������� � ����� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TerrorInNight,LOG_MISSION,LOG_Running,TOPIC_DS2P_TerrorInNight_Start);
};
//----
//���������� ����� ����������� ("� �������� ����."), ���������� ������ ������ "���� � ����"
//----
instance DIA_Cimm_WhereCanIFindGustav(C_Info)	//��� � ���� ����� ������� �������?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 80;
	permanent = FALSE;
	condition = DIA_Cimm_WhereCanIFindGustav_condition;	
	information = DIA_Cimm_WhereCanIFindGustav_info;
	description = "��� � ���� ����� ������� �������?";
};
func int DIA_Cimm_WhereCanIFindGustav_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_IMetDil)) 	{return TRUE;};	};
func void DIA_Cimm_WhereCanIFindGustav_info()
{
	AI_Output(other,self,"DIA_Cimm_WhereCanIFindGustav_15_00");	//��� � ���� ����� ������� �������?
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_00");	//��� ������� ������.
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_01");	//����� ������ ������, ���� ����, �� ���� ������, � ����� ������� ����� - ���, ���� � ���� �� ���� �� ���� ���� � ��� �� �����.
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_02");	//������ � ��� ��������� ������ ���������� ������� �������������, �� ��� ���� ������.
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_03");	//� �����, ��� ������ ������� ��������� �������, �� ��� �����, � � �������� �������� � ������� ��� �� ����.
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_04");	//�������, ��� �� � ��� ��, ������ � �� ����.
};
//----
//���������� ����� ����������� ("� �������� ����.")
//----
instance DIA_Cimm_WhoIsEkor(C_Info)	//��� ����� ����?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 81;
	permanent = FALSE;
	condition = DIA_Cimm_WhoIsEkor_condition;	
	information = DIA_Cimm_WhoIsEkor_info;
	description = "��� ����� ����?";
};
func int DIA_Cimm_WhoIsEkor_condition(){	
	if(Npc_KnowsInfo(other,DIA_Cimm_IMetDil) && !Npc_KnowsInfo(other,DIA_Cimm_FindingCure))
	{return TRUE;};	
};
func void DIA_Cimm_WhoIsEkor_info()
{
	AI_Output(other,self,"DIA_Cimm_WhoIsEkor_15_00");	//��� ����� ����?
	AI_Output(self,other,"DIA_Cimm_WhoIsEkor_03_00");	//��� ���������, ������� � ���� �� ������ ����� �������. �� ����� ������ � ���������� �������.
	AI_Output(self,other,"DIA_Cimm_WhoIsEkor_03_01");	//� ��������� ��� ����� � ���� �� ������� � �������, � �� ������� ��� �� ���������.
	AI_Output(other,self,"DIA_Cimm_WhoIsEkor_15_01");	//��� ��� ����� ���?
	AI_Output(self,other,"DIA_Cimm_WhoIsEkor_03_02");	//(/*UNFINISHED ��������� �����*/)
};
//----
//���������� ����� ����������� ("� �������� ����.")
//----
instance DIA_Cimm_WhoNowLivesInDilHouse(C_Info)	//��� ������ ����� � ���� ����?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 82;
	permanent = FALSE;
	condition = DIA_Cimm_WhoNowLivesInDilHouse_condition;	
	information = DIA_Cimm_WhoNowLivesInDilHouse_info;
	description = "��� ������ ����� � ���� ����?";
};
func int DIA_Cimm_WhoNowLivesInDilHouse_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_IMetDil)) 	{return TRUE;};	};
func void DIA_Cimm_WhoNowLivesInDilHouse_info()
{
	AI_Output(other,self,"DIA_Cimm_WhoNowLivesInDilHouse_15_00");	//��� ������ ����� � ���� ����?
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_00");	//����� ���� ������ �� ���-�� � ������� ����� ���������� � ����� ����. �� ���� ���� �����-�� ������ �������.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_01");	//� ���� �� ���� ��� ��� ���������... (���������)
	AI_PlayAni(self,"R_SCRATCHHEAD");
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_02");	//������� � ����� ����� � ���. �� ������ ����������� �����, ��� ���� ������ ����������� ����� � ����.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_03");	//� �����, ��� ��� ������������, � ������ ��� ��������� �����. ����� ������� � ����� ����, ��� ���� ������ ������, � ������ ����������� �������� �����.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_04");	//� �� �������� � ������ ������. �� ���� �������� - ��� ������� � �� ��� ������� � �����.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_05");	//��� �������, ��� �������� �����-�� ������� ����, ������� ������ ��������� �� ������� � ���������� ���� ��� � �������� �������.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_06");	//����� ����� ������ �����, ��� ��������, �������� ������ ������� ��� ����, � �� ����� ��������� �����.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_07");	//������ ���� ����� �� ����� �������, ���� ���� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TerrorInNight,LOG_MISSION,LOG_Running,TOPIC_DS2P_TerrorInNight_DilsHouseKey);
};


//NS - 24/06/2013 ==========================================================
// �� ������ "�������� ����" 
//==========================================================================

//----------------------------
// ������ ���� �������� �������� �����	nr=91
instance DIA_Cimm_CrawlerEgg(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 91;
	condition = DIA_Cimm_CrawlerEgg_condition;	
	information = DIA_Cimm_CrawlerEgg_info;
	description = "� ����� ���� �������� ��������.";
};
func int DIA_Cimm_CrawlerEgg_condition()
{
	if (Npc_HasItems(other,ItAt_Egg_CrawlerQueen) > 0)
	{	return TRUE;	};
};
func void DIA_Cimm_CrawlerEgg_info()
{
	AI_Output(other,self,"DIA_Cimm_CrawlerEgg_15_00");	//� ����� ���� �������� ��������.
	//(+����)
	B_GivePlayerXP(XP_MIS_Fortitude_CrawlerEgg);
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_01");	//��� ��� ��! ��� ���� ������� ���������� ����� ������ ���������? ����������.
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_02");	//� �����, ��� ������ �������, ��� � �������� ���� ��������! ���-�� � �������� ��� �������.
	//�������� ����
	B_DS_GiveRemoveItems(other,self,ItAt_Egg_CrawlerQueen,1);
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_03");	//��, ��� ������� ������, �� �������� ������. ���� ������ ��� ��� ����, � ����� ������� ��� ���� ���� ����� ������ �������, ������� ������� ���� ������� �������.
	AI_Output(other,self,"DIA_Cimm_CrawlerEgg_15_04");	//�� �������, ��� ��� �� � ����.
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_05");	//� ��! ��� ����� ����� ���� �����! ��! � �������� ���� ����� ������ �������, � ������� ����������� ��� ����� - ����� ��������� �����.
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_06");	//�� ������� ���� ������� �������, ������� ���� ����� ���, ��� �� ���� ��� � ������ ���� ����� �� �������. �� �������� ��� ��� � ��� ��� ������. ������ ���� ����, ����� ��� �����������.
	AI_Output(other,self,"DIA_Cimm_CrawlerEgg_15_07");	//��� ��� �����?
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_08");	//����� ����� ������� � ����������, ������ ��������� ���� ��������, �������� � ���� ����, ���������� ������ ��� ���������, ���� ����� � ������ ������.
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_09");	//������ �� ����������� ���� ����� ����� ����: ��� ������������� �������� ����� ������, ���� ����� - �������� �������������� � ���������� ����� ����, � ������ ������ - ���������� ���� �����, �������� � �������� ����� ����� ��� ����������.

	//������ � �������� "�������� ����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Fortitude,LOG_MISSION,LOG_Running,TOPIC_DS2P_Fortitude_Potion);
	MIS_DS2P_Fortitude_IngredientsKnow = TRUE;
	
	//����� � �������� ��������� � ����, �������� ����� �� ������
	/* UNFINISHED
	Wld_InsertNpc(Warg, "");
	Wld_InsertNpc(Warg, "");
	Wld_InsertNpc(Warg, "");
	Wld_InsertNpc(Shadowbeast, "");
	Wld_InsertNpc(SwampGolem, "");
	//*/
};

//----------------------------
// "� ������ ����� ���������� ��������� �����?"	nr=92
instance DIA_Cimm_WhyFortitude(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 92;
	condition = DIA_Cimm_WhyFortitude_condition;	
	information = DIA_Cimm_WhyFortitude_info;
	description = "� ������ ����� ���������� ��������� �����?";
};
func int DIA_Cimm_WhyFortitude_condition()
{
	if (Npc_KnowsInfo(other,DIA_Cimm_CrawlerEgg))
	{	return TRUE;	};
};
func void DIA_Cimm_WhyFortitude_info()
{
	AI_Output(other,self,"DIA_Cimm_WhyFortitude_15_00");	//� ������ ����� ���������� ��������� �����?
	AI_Output(other,self,"DIA_Cimm_WhyFortitude_15_01");	//���� ��� ��������� �� ��� ���������� ������, � �������� �� ������ � �����.
		AI_Output(self,other,"DIA_Cimm_WhyFortitude_03_02");	//��� �� �� �������, ��� �� ��� �������������! ���� � ���� ������� ���, �� � ���� � ������� ����.
		AI_Output(self,other,"DIA_Cimm_WhyFortitude_03_03");	//��� ���� ������������, ����������� ��� ������� ���� ��������� �������, ��� �� ����������� ����������� ����������.

};

//----------------------------
// "��� ��� ����� ���� ������?"	nr=93
instance DIA_Cimm_WhereFindAnimals(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 93;
	condition = DIA_Cimm_WhereFindAnimals_condition;	
	information = DIA_Cimm_WhereFindAnimals_info;
	description = "��� ��� ����� ���� ������?";
};
func int DIA_Cimm_WhereFindAnimals_condition()
{
	if (Npc_KnowsInfo(other,DIA_Cimm_CrawlerEgg) && (MIS_DS2P_Fortitude == LOG_Running))
	{	return TRUE;	};
};
func void DIA_Cimm_WhereFindAnimals_info()
{
	AI_Output(other,self,"DIA_Cimm_WhereFindAnimals_15_00");	//��� ��� ����� ���� ������?
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_01");	//� �� �������, �� ���� ������������, ��� ��������� � ������ �� ������� � ����� �����.
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_02");	//� ������ �� ������, ��� � ��������� ����� �� ��������� ����� ��� ����������.
	AI_Output(other,self,"DIA_Cimm_WhereFindAnimals_15_03");	//� ������? ����� ���� ������ ���� ���������� ��������� ����?
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_04");	//(�������) ���, �������. �� ����, ��� � ����, ������ ������� �� �������.
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_05");	//��������� � ����, �� ��������� ������ ��������, � ������� ��� ������.
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_06");	//��� ����� ������� �����, ������� ������� ������ ������������� � ��������� � ���� �����. ������ ����� ������!
};

//----------------------------
// "��� ��������� ������?"	nr=94
instance DIA_Cimm_WhereFindSwamp(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 94;
	condition = DIA_Cimm_WhereFindSwamp_condition;	
	information = DIA_Cimm_WhereFindSwamp_info;
	description = "��� ��������� ������?";
};
func int DIA_Cimm_WhereFindSwamp_condition()
{
	if (Npc_KnowsInfo(other,DIA_Cimm_WhereFindAnimals) && (MIS_DS2P_Fortitude == LOG_Running))
	{	return TRUE;	};
};
func void DIA_Cimm_WhereFindSwamp_info()
{
	AI_Output(other,self,"DIA_Cimm_WhereFindSwamp_15_00");	//��� ��������� ������?
	// UNFINISHED
		AI_Output(self,other,"DIA_Cimm_WhereFindSwamp_03_01");	//��� ��������� ���-�� � ���-��.
};

//----------------------------
// ����� �����	nr=95
var int Cimm_FortitudeIngredients_Stage;
instance DIA_Cimm_FortitudeIngredients(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 95;
	condition = DIA_Cimm_FortitudeIngredients_condition;	
	information = DIA_Cimm_FortitudeIngredients_info;
	description = "� ����� ����������� ��� ����� ��������� �����.";
};
func int DIA_Cimm_FortitudeIngredients_condition()
{
	if ((MIS_DS2P_Fortitude == LOG_Running) && MIS_DS2P_Fortitude_IngredientsKnow 
		&& (Npc_HasItems(other,ItAt_ShadowHorn) > 0)
			&& (Npc_HasItems(other,ItAt_DS2P_Teeth_Warg) > 0)
			&& (Npc_HasItems(other,ItAt_DS2P_Heart_SwampGolem) > 0))
	{	return TRUE;	};
};
func void DIA_Cimm_FortitudeIngredients_DrinkFortitude()
{
	CreateInvItem(other, ItPo_DS2P_Perm_Fortitude);
	AI_TurnToNpc(other,self);
	AI_UseItem(other,ItPo_DS2P_Perm_Fortitude);
	Wld_PlayEffect("SLOW_TIME_IMMEDIAT",other,other,0,0,0,FALSE);
	AI_Wait(self,1.0);
	AI_StopFX(other,"SLOW_TIME_IMMEDIAT");
};
func void DIA_Cimm_FortitudeIngredients_DropUnconscious()
{
	// Ikarus/LeGo Needed
	var C_NPC npc_nil;
	other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
	Npc_DropUnconscious(other,0,npc_nil);
	AI_Wait(self,10.0);
	other.aivar[AIV_TIME_UNCONSCIOUS] = HAI_TIME_UNCONSCIOUS;
};
func void DIA_Cimm_FortitudeIngredients_BlackScreen()
{
	Wld_PlayEffect("BLACK_SCREEN_SLOW", other,other,0,0,0,FALSE);
	AI_Wait(self,1.5);
	AI_StopFX(other,"BLACK_SCREEN_SLOW");
};
func void DIA_Cimm_FortitudeIngredients_RaiseAtr()
{
	B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,Bonus_ItPo_DS2P_Perm_Fortitude_HPMax);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,Bonus_ItPo_DS2P_Perm_Fortitude_HPMax);
	B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT,Bonus_ItPo_DS2P_Perm_Fortitude_Prot);
};
func void DIA_Cimm_FortitudeIngredients_info()
{
	var int x;
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_00");	//� ����� ����������� ��� ����� ��������� �����.

	//(+����)
	B_GivePlayerXP(XP_MIS_Fortitude);
	//������ ���, ���� � ������
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems_red(other,self,ItAt_ShadowHorn,1,34);
		B_DS_GiveRemoveItems_red(other,self,ItAt_DS2P_Teeth_Warg,1,37);
		B_DS_GiveRemoveItems_red(other,self,ItAt_DS2P_Heart_SwampGolem,1,40);
	};
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_01");	//���, ���... ����� ����. ������ �������, � ������ ������.

	//���� � �������, ���������, ��������, ������.
	B_DIA_UseMob(self, other, "CHESTBIG", 0.5);	// UNFINISHED ��������� ��� �������, ������ ���� �� ������!!!
	B_DIA_UseItem_Wait(self, other, Fakescroll, 0.7);

		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_02");	//���, ���.. ���! ������ � ��������, � �� ���� �� ���!
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_03");	//� ��� ��?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_04");	//���, �� � ���. �� ������� ��� ������.

	//�� �������, ���� ���� � ����� �����, �������, ������������
	// UNFINISHED ������� WP, ���� ������� ��
	AI_GotoWP(other,Npc_GetNearestWP(other));
	B_DIA_UseMob(self, other, "LAB", 1.5);
	
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_05");	//���, ����� ���. ���, ����! � �� ����� �������� ������! ������!

	//����� ������, �������, ������������
	B_DIA_UseMob(self, other, "LAB", 0.5);
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"�� ������ ������ �� �����?",DIA_Cimm_FortitudeIngredients_info1);
};
func void DIA_Cimm_FortitudeIngredients_info1()
{
	var int x;
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_06");	//�� ������ ������ �� �����?

	//���� ������� ����������, ������
	B_DIA_UseItem_Wait(self, other, Fakescroll, 0.7);
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_07");	//����� ���.
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_08");	//�����?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_09");	//���������, ������� ����� ������, ��� �� ��� �������, ����� ������ � �� ���� ���������. 
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_10");	//���?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_11");	//�� �� ����� ��! ��� ������ ������ � ���������� ������ � ������ ������� �����. � � ������� ������� � �� ������ ������ ��������.
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_12");	//������� � ����� �������� ��� ��� ����� �� �� �������. �� ���� � ������, ���!
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_13");	//�� ������, ��� ��� ���������?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_14");	//�� ����� ���� ������, ��� ��������� � ��������, ��������� ������. ���!
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"(������)",DIA_Cimm_FortitudeIngredients_info2);
};
func void DIA_Cimm_FortitudeIngredients_info2()
{
	var int x;
	//�� ����, ��� �������� ���������
	x = 2; if (x == 2) {
		DIA_Cimm_FortitudeIngredients_DrinkFortitude();
	};	
	
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_15");	//�� ���?
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"���-�� � ���� ������ �����������.",DIA_Cimm_FortitudeIngredients_info3);
	//UNFINISHED ������� ������ ��� ��� ���������, �� ��� �����
};
func void DIA_Cimm_FortitudeIngredients_info3()
{
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_16");	//���-�� � ���� ������ �����������.
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_17");	//�� ����� ������, ������ � ��� ������ ���������. � �������� ��������, ��� ������ ���������, ��� ����� ������� ����� � �������� ����������� - ������ ��������������.

	//�� ������ � 1 �����, ������
		DIA_Cimm_FortitudeIngredients_DropUnconscious();
	
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_18");	//���-�� ���� ���� �� ������. ��� ���� ���������?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_19");	//��... �����. �� �� �� �������� ���, ������ ��� �������.
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"(������)",DIA_Cimm_FortitudeIngredients_info4);
};
func void DIA_Cimm_FortitudeIngredients_info4()
{
	var int x;
	//���� �������� ����� �������� ��������
	AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_20");	//(����� ��������) �-�-� �-�-�-� �-�-�-�-�-�-�?  �-�-�-�-� �-�-�-� ���-�-�-�-�-�-�...

	//����� �������
	x = 1; if (x == 1) {
		DIA_Cimm_FortitudeIngredients_BlackScreen();
	};
	
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_21");	//���, ������ �� ������ � ����. � �� �����... ��� ��?
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_22");	//������ � �����. ����� ��������, ��� ������� ������ ������� ������.
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_23");	//��� �������. ���, ����� � ���� �������. ��-����� ��� �� �����, ������ �� �������, ������ ���. ��� ������ ��� �� �����.
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_24");	//�� ������?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_25");	//���, ��� ��! ����� ���� �� �����, � ������ ���� ���� ����. � ������ ��� � ��������, ���� ������� �������� ����� ����, �� �� �������� �� ���� ����� ����� ������ � �������.
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_26");	//���� ��� ��� �����, �� �� ���������� �������, ���� �� ���� � �������� ���, ��� ��� ����, ���������� �������. �� �������� �������, � ��� �, � ������, � �� ����������! (���������)
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_27");	//������ �� ��� ������ �� ������ �� ����?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_28");	//� ����� �� �� ����������? ���! ��-�� ��. �� ��� ���, �� ���������� � ���� ����?
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"�������, ��������.",DIA_Cimm_FortitudeIngredients_info5);
};
func void DIA_Cimm_FortitudeIngredients_info5()
{
	var int x;
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_29");	//�������, ��������.
	//� �� ���������� ������ �� ������ � ����� +5, � ����� �� 20 ������������� ���� ��������
	B_GiveBonusProt(other, PROT_BLUNT, Bonus_Protect_Cimm);
	B_GiveBonusProt(other, PROT_EDGE, Bonus_Protect_Cimm);
	B_GiveBonusProt(other, PROT_POINT, Bonus_Protect_Cimm);
	B_RaiseAttribute(other, ATR_HITPOINTS_MAX, Bonus_HP_Cimm);
	x = 1; if (x == 1) {
		DIA_Cimm_FortitudeIngredients_RaiseAtr();
	};
	
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_30");	//�� � ����� ������. ���� ������� ��� ���� ����� ��������, �������. � ���� ��������� ���-����� �����, ��� ������� �����.
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_31");	//���, ����������.
	
	x = 2; if (x == 2) {
		//������ � �������� "�������� ����" ����� �������
		B_DSG_Log_OpenClose(TOPIC_DS2P_Fortitude,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Fortitude_Success);
	};
};


//NS - 27/06/2013 ============================================================
// �� ������ "��� ����� ��� ������?" 	nr=101
//============================================================================

instance DIA_Cimm_AboutStolenIron(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 101;
	condition = DIA_Cimm_AboutStolenIron_condition;	
	information = DIA_Cimm_AboutStolenIron_info;
	description = "�� ���-������ ������ � ����� �� �������?";
};
func int DIA_Cimm_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Cimm_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Cimm_AboutStolenIron_15_00");	//�� ���-������ ������ � ����� �� �������?
		AI_Output(self,other,"DIA_Cimm_AboutStolenIron_03_01");	//���, ��� ��� ���������� �����������. 
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 28/06/2013 ============================================================
// �� ������ "����� �������" 	nr=111
//============================================================================

//-----------------------------------------------------
// "� ���� ���� �������� ��� �����������?", ���� ���� �����		nr = 111;
instance DIA_Cimm_HaveSoberingPotion(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 111;
	condition = DIA_Cimm_HaveSoberingPotion_condition;	
	information = DIA_Cimm_HaveSoberingPotion_info;
	description = "� ���� ���� �������� ��� �����������?";
};
func int DIA_Cimm_HaveSoberingPotion_condition()
{
	if (MIS_DS2P_DeliriumTremens == LOG_Running)	{	return TRUE;	};
};
func void DIA_Cimm_HaveSoberingPotion_info()
{
	AI_Output(other,self,"DIA_Cimm_HaveSoberingPotion_15_00");	//� ���� ���� �������� ��� �����������?
		AI_Output(self,other,"DIA_Cimm_HaveSoberingPotion_03_01");	//�, ����� ���-�� ��������? ���! ���� � ���� ���� ��������, ��������� ��� ����������.
		AI_Output(self,other,"DIA_Cimm_HaveSoberingPotion_03_02");	//��� ��������������� ����� ��� ����������� ������� �����, ������ ����.
	AI_Output(other,self,"DIA_Cimm_HaveSoberingPotion_15_03");	//���� �� �������, ��� ��� �� �������?
		AI_Output(self,other,"DIA_Cimm_HaveSoberingPotion_03_04");	//��� ��� �������! ������ � ���� �������� ������� ����� �������� ���� ������, ���-�� � ���� ������ ������.
		AI_Output(self,other,"DIA_Cimm_HaveSoberingPotion_03_05");	//�� ����������, ��� ����� � ������ ����, �� ������� ������� �������.

	//������ � �������� "����� �������" //NS - ����������
	B_ds_LogEntry(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_Running,TOPIC_DS2P_DeliriumTremens_CimmAgreed);	
};

//-----------------------------------------------------
// ���� ���� � ����	��� �����	(+����)		nr = 112;
instance DIA_Cimm_MadeSoberingPotion(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 112;
	condition = DIA_Cimm_MadeSoberingPotion_condition;	
	information = DIA_Cimm_MadeSoberingPotion_info;
	description = "��� ���� � ����.";
};
func int DIA_Cimm_MadeSoberingPotion_condition()
{
	if ((Npc_KnowsInfo(other,DIA_Cimm_HaveSoberingPotion))
		&& (Npc_HasItems(other,ItFo_Beer) > 0) && (Npc_HasItems(other,ItFo_Addon_Grog) > 0))
	{	return TRUE;	};
};
func void DIA_Cimm_MadeSoberingPotion_info()
{
	var int x;
	AI_Output(other,self,"DIA_Cimm_MadeSoberingPotion_15_00");	//��� ���� � ����.
	//������ ���� � ����
	B_DS_GiveRemoveItems_red(other,self,ItFo_Addon_Grog,1,YPOS_ItemGiven);
	B_DS_GiveRemoveItems_red(other,self,ItFo_Beer,1,YPOS_ItemGiven + 3);
		AI_Output(self,other,"DIA_Cimm_MadeSoberingPotion_03_01");	//���, ������ �������.
	//������� � ����� �����, �������, ������������
	B_DIA_UseMob(self,other,"LAB",1.0);
		AI_Output(self,other,"DIA_Cimm_MadeSoberingPotion_03_02");	//������. ����� ��� ��������. �������� � ���� ������� ������ ���� �����, ������� ���� ������ ������ �� ����������.
	//(+����)
	B_GivePlayerXP(XP_MIS_DeliriumTremens_MadePotion);
		AI_Output(self,other,"DIA_Cimm_MadeSoberingPotion_03_03");	//��, � ���. ����� ����, ��� �� ������, ������ � ��������.
	AI_Output(other,self,"DIA_Cimm_MadeSoberingPotion_15_04");	//�����?
		AI_Output(self,other,"DIA_Cimm_MadeSoberingPotion_03_05");	//�� ��� ���� �������... ����� ������� �������� �� ���������, ����� ��� ��������, � �� ����� ������� ��� ���������� ����� ������ � ���������...
	AI_Output(other,self,"DIA_Cimm_MadeSoberingPotion_15_06");	//� �����, �������.
	//���� ��������������� �����
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ItMi_DS2P_SoberingPotion,1);
	};

	//������ � �������� "����� �������" 
	B_ds_LogEntry(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_Running,TOPIC_DS2P_DeliriumTremens_PotionReady);	
};


//NS - 02/07/2013 ================================================
// ����� ������ ������
//================================================================
instance DIA_Cimm_KadarDead(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 0;
	condition = DIA_Cimm_KadarDead_condition;	
	information = DIA_Cimm_KadarDead_info;
	important = TRUE;
};
func int DIA_Cimm_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Cimm_KadarDead_info()
{
		AI_Output(self,other,"DIA_Cimm_KadarDead_03_00");	//��� ������ ��� � ������ ��� ����� ��������. ������� ����� �� ������� ��� ������� � ���� ��������. �� ������ ���� ���� � ������.
};

// ������������, ���� ������� ����� "�������" � �� ��������� � �������� � ������� ������
// nr = 1

instance DIA_Cimm_VatrasIngredient(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Cimm_VatrasIngredient_condition;	
	information = DIA_Cimm_VatrasIngredient_info;
	description = "��� ����� ������� ������.";
};

func int DIA_Cimm_VatrasIngredient_condition()
{
	if ((MIS_DS2P_Nightmares == Log_Running) && Npc_KnowsInfo(other,DIA_Vatras_AboutNightmares))
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_VatrasIngredient_info()
{
	AI_Output(other,self,"DIA_Cimm_VatrasIngredient_15_00");	//��� ����� ������� ������. � ���� ����?
	AI_Output(self,other,"DIA_Cimm_VatrasIngredient_13_01");	//� ���� ��� ����?
	AI_Output(other,self,"DIA_Cimm_VatrasIngredient_15_02");	//���� �������� ��� ������ ��� ���� ������ � ����� �������.
	AI_Output(self,other,"DIA_Cimm_VatrasIngredient_13_03");	//�������, ��� ��������� ���������� � ���� ������ ���� ������� ����. ���, �����.
	//������� ������� ������ � ��������� ����� � �������� ��
	CreateInvItems(self,ItPl_Perm_Herb,1);
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	AI_Output(other,self,"DIA_Cimm_VatrasIngredient_15_04");	//��� ��� ������? � �� ������ �� ������� ������?
	AI_Output(self,other,"DIA_Cimm_VatrasIngredient_13_05");	//(���������) ���� �� �� ��� �����������, �� � �� ����� ������������ � �����, ���� �� �� ������. �����, �� ��������� �� ���� �������� ��������, �, �����, � � ����� ������� ��� ���-�� �����.
	AI_Output(self,other,"DIA_Cimm_VatrasIngredient_13_06");	//������� ������ ������ �����������, ����� �� ����� �������������. � �������� � ���� ���� ���� ������ ��� �� ������.
	AI_Output(other,self,"DIA_Cimm_VatrasIngredient_15_07");	//������, � ������� ��� ���� �������.
};

// ������������, ���� ������� ����� "���������� �����"
// nr = 2

instance DIA_Cimm_CanYouCreateJorn(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Cimm_CanYouCreateJorn_condition;	
	information = DIA_Cimm_CanYouCreateJorn_info;
	description = "� ���� � ���� ���� ���� �������.";
};

func int DIA_Cimm_CanYouCreateJorn_condition()
{
	if (MIS_DS2P_ExposeJorn == LOG_Running)
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_CanYouCreateJorn_info()
{
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_00");	//� ���� � ���� ���� ���� �������.
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_01");	//�����?
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_02");	//� ����, ����� �� ������ ������������.
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_03");	//��, � ������� ���� ��� ������� ��� ����. �� ���� ������ ������. � ����� �� ����?
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_04");	//���� ������� ��� � ��������� � ������� ������ ������.
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_05");	//��, ���� ����� � ����� ������� ���� ������ ������������.
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_06");	//���, ������ ��� ������.
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_07");	//������, ����� ������� ��� ���� ����. ������ ���� ���������� ��������, �� � ��������� ����� �������� �������� ����������.
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_08");	//����� ������ ����� ���� �����?
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_09");	//������, � ������.
	B_UseFakeScrollTime(3);
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_10");	//���, �����. ����� ��� ������.
	// ������� ������ � ��������� ����� � ������ ��
	CreateInvItems(self,ItWr_DS2P_CimmsIngredients,1);
	B_GiveInvItems(self,other,ItWr_DS2P_CimmsIngredients,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_CimmsIngredients);
};

// ������������, ���� ������� ����� "���������� �����", ������ �������� ����� �����������, � ������� ��
// nr = 2

instance DIA_Cimm_BringIngredientsJorn(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Cimm_BringIngredientsJorn_condition;	
	information = DIA_Cimm_BringIngredientsJorn_info;
	description = "���, � ��� ������.";
};

func int DIA_Cimm_BringIngredientsJorn_condition()
{
	if ((MIS_DS2P_ExposeJorn == LOG_Running)
		 && Npc_KnowsInfo(other,DIA_Cimm_CanYouCreateJorn)
		 && (Npc_HasItems(other,ItPl_Mana_Herb_01) >= 3)
		 && (Npc_HasItems(other,ItPl_SwampHerb) >= 2)
		 && (Npc_HasItems(other,ItPl_DSG_Mountmoom) >= 2)
		 && (Npc_HasItems(other,ItPl_Mushroom_01) >= 1)
		 && (Cimm_CookSamogon == FALSE))
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_BringIngredientsJorn_info()
{
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_15_00");	//���, � ��� ������.
	// ������ ����� �����������
	B_GiveInvItems(other,self,ItPl_Mana_Herb_01,3);
	B_GiveInvItems(other,self,ItPl_SwampHerb,2);
	B_GiveInvItems(other,self,ItPl_DSG_Mountmoom,2);
	B_GiveInvItems(other,self,ItPl_Mushroom_01,1);
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_13_01");	//���, ������� ����-����. � ������.
	B_DIA_UseMob(self,other,"LAB",1.0); // ������ � �����. �����, �������, ������������
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_13_02");	//��� ������. ������ ����� �������. � ���� �� ����?
	Info_ClearChoices(DIA_Cimm_BringIngredientsJorn);
	Info_AddChoice(DIA_Cimm_BringIngredientsJorn,"���.",DIA_Cimm_BringIngredientsJorn_No);
	if (Npc_HasItems(other,ITFO_SAMOGON) >= 1) // ���� � �� ���� �������
	{
		Info_AddChoice(DIA_Cimm_BringIngredientsJorn,"��.",DIA_Cimm_BringIngredientsJorn_Yes);
	};
};

// �����������, ��� ������ ������� "���." � ������� ����� "���, � ��� ������."

func void DIA_Cimm_BringIngredientsJorn_No()
{
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_No_15_00");	//���. ������ �������.
	AI_StopProcessInfos(self);
};
	
func void DIA_Cimm_BringIngredientsJorn_Yes()
{
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_Yes_15_00");	//��. ���, �����.
	// ������ ����� �������
	B_GiveInvItems(other,self,ITFO_SAMOGON,1);
	B_DIA_UseMob(self,other,"LAB",1.0); // ������ � �����. �����, �������, ������������
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_Yes_13_01");	//��� ������. ��� ���� �����. ���� ���� ���, ��� ������ ���, ����� �������� ����� �������.
	// ������� ����� ������� � ��������� ����� � ������ ��
	CreateInvItems(self,ItMi_DS2P_SamogonForJorn,1);
	B_GiveInvItems(self,other,ItMi_DS2P_SamogonForJorn,1);
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_Yes_15_02");	//�������. � ���� ���-������ ������?
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_Yes_13_03");	//���, ������ �� ����. ���� ����� � ������ ������� ��� ������� ����� ��� ������.
	Cimm_CookSamogon = TRUE;
	AI_StopProcessInfos(self);
};
	
// ������������, ���� ������� ����� "���������� �����", � �� �������� ����� ������� �������
// nr = 2

instance DIA_Cimm_BringSamogonJorn(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Cimm_BringSamogonJorn_condition;	
	information = DIA_Cimm_BringSamogonJorn_info;
	description = "���, � ������ �������.";
};

func int DIA_Cimm_BringSamogonJorn_condition()
{
	if ((MIS_DS2P_ExposeJorn == LOG_Running) && (Npc_HasItems(other,ITFO_SAMOGON) >= 1)
		 && Npc_KnowsInfo(other,DIA_Cimm_BringIngredientsJorn) && (Cimm_CookSamogon == FALSE))
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_BringSamogonJorn_info()
{
	AI_Output(other,self,"DIA_Cimm_BringSamogonJorn_15_00");	//���, � ������ �������.
	// ������ ����� �������
	B_GiveInvItems(other,self,ItFo_Samogon,1);
	AI_Output(self,other,"DIA_Cimm_BringSamogonJorn_13_01");	//������, �� ���������� ��� �������
	B_DIA_UseMob(self,other,"LAB",1.0); // ������ � �����. �����, �������, ������������
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_Yes_13_01");	//��� ������. ��� ���� �����. ���� ���� ���, ��� ������ ���, ����� �������� ����� �������.
	// ������� ����� ������� � ��������� ����� � ������ ��
	CreateInvItems(self,ItMi_DS2P_SamogonForJorn,1);
	B_GiveInvItems(self,other,ItMi_DS2P_SamogonForJorn,1);
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_Yes_15_02");	//�������. � ���� ���-������ ������?
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_Yes_13_03");	//���, ������ �� ����. ���� ����� � ������ ������� ��� ������� ����� ��� ������.
	Cimm_CookSamogon = TRUE;
	AI_StopProcessInfos(self);
};

// ������������ �� ��������� ���� ����� ���������� ������ "����� ��������� ���������"
// nr = 1

instance DIA_Cimm_AfterEscapedHunters(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Cimm_AfterEscapedHunters_condition;	
	information = DIA_Cimm_AfterEscapedHunters_info;
	description = "��� �� ��� ���������?";
};

func int DIA_Cimm_AfterEscapedHunters_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == LOG_Success) && (EscapedHunters_QuestComplete - Wld_GetDay() >= 1))
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_AfterEscapedHunters_info()
{
	AI_Output(other,self,"DIA_Cimm_AfterEscapedHunters_15_00");	//��� �� ��� ���������?
	AI_Output(self,other,"DIA_Cimm_AfterEscapedHunters_13_01");	//� ������ �� �������� �������, ����, ����� � �����. �� ���� ������ � ������ ����. ��� ������� ��� �������� �����, �������� � ������������. 
	AI_Output(self,other,"DIA_Cimm_AfterEscapedHunters_13_02");	//����� ���, �����, �������� �� �� ����� � ������, ���� � ������, �������� �����, ����� ������� ����� ��?
	AI_Output(other,self,"DIA_Cimm_AfterEscapedHunters_15_03");	//�� �����. �������, ��� ����� ��� ���������. ���� ��������� ������� ����� �������. ���� �� �� ��������� � ��������� ������, ����� ��� ������.
	AI_Output(self,other,"DIA_Cimm_AfterEscapedHunters_13_04");	//��, ������ ��� ���.
	AI_StopProcessInfos(self);
};
	