instance DIA_Harok_EXIT(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Harok_EXIT_condition;	
	information = DIA_Harok_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Harok_EXIT_condition(){	return TRUE;};
func void DIA_Harok_EXIT_info(){	AI_StopProcessInfos(self);};
//
instance DIA_Harok_Start(C_Info)	//��������� ������
{
	npc = BAU_101_DS2P_HAROK;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Harok_Start_condition;	
	information = DIA_Harok_Start_info;
	description = "����������, �����!";
};
func int DIA_Harok_Start_condition(){	return TRUE;};
func void DIA_Harok_Start_info()
{
	AI_Output(other,self,"DIA_Harok_Start_15_00");	//����������, �����!
	AI_Output(self,other,"DIA_Harok_Start_01_00");	//� ���� �� �������, ������ �������! 
	AI_Output(self,other,"DIA_Harok_Start_01_01");	//������ ����, �� ���� �� ���, ��� ������� �� ������� �������. ��� ��� ������ �������� ��� � �����?
	AI_Output(other,self,"DIA_Harok_Start_15_01");	//�� ����, � ���� �� ������� ������������. � �������� ������� ������������, ������� ���� ��� ��� �� ������.
	AI_Output(self,other,"DIA_Harok_Start_01_02");	//��� ���� �����, �� ���� ��! ��� ������ ���������. ��� ��������� ��� �������, ������ � ���������� ����� ������.
	AI_Output(self,other,"DIA_Harok_Start_01_03");	//�������, ����� ����� �������� ��!
};
//----
//���������� ����� ����������
//----
instance DIA_Harok_WhatIsYourName(C_Info)	//��� ���� �����?
{
	npc = BAU_101_DS2P_HAROK;
	nr = 3;
	permanent = FALSE;
	condition = DIA_Harok_WhatIsYourName_condition;	
	information = DIA_Harok_WhatIsYourName_info;
	description = "��� ���� �����?";
};
func int DIA_Harok_WhatIsYourName_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_WhatIsYourName_info()
{
	AI_Output(other,self,"DIA_Harok_WhatIsYourName_15_00");	//��� ���� �����?
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_00");	//� �� ������������? ������ ��� ������������, ���� ����� ����.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_01");	//���� ����� �����, � ��� ������ ������ ��� ��������� ������ ������.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_02");	//� ��� ��� ���, � ������� �� ������ ������ ����� ������ ����, ����� ��� ������� � ����� ��� �������.
	AI_Output(other,self,"DIA_Harok_WhatIsYourName_15_01");	//�� ����� �������, �����.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_03");	//������ � ���� �� ��� ����� ������ �����.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_04");	//� �������� �� ��� �������� �� �������, ��� ��� ��� � �����, ����� ������� ����� � ���������� �����.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_05");	//������ �������� ����, ���� � ������ �����, � ���� ��� ��������� ����� ����� ����. (���������) ��...
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_06");	//� �����, ����� ���� ����� �� ������. ������� � ��� ������ �������, ����, �������, �� �� ������ ��� �����.
};
//----
//���������� ����� ����������
//----
instance DIA_Harok_WhatCatchOfFish(C_Info)	//��� ����? (����������)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 990;
	permanent = TRUE;
	condition = DIA_Harok_WhatCatchOfFish_condition;	
	information = DIA_Harok_WhatCatchOfFish_info;
	description = "��� ����?";
};
func int DIA_Harok_WhatCatchOfFish_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_WhatCatchOfFish_info()
{
	AI_Output(other,self,"DIA_Harok_WhatCatchOfFish_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Harok_WhatCatchOfFish_01_00");	//�� ����� ��� ����?! ��� �� ������� ���� ��������� ��� ����. � ��� ���, �����...
};
//----
//���������� ����� ����������
//----
instance DIA_Harok_YouHaveSadLook(C_Info)	//� ���� ��������� ���.
{
	npc = BAU_101_DS2P_HAROK;
	nr = 4;
	permanent = TRUE;
	condition = DIA_Harok_YouHaveSadLook_condition;	
	information = DIA_Harok_YouHaveSadLook_info;
	description = "� ���� ��������� ���.";
};
func int DIA_Harok_YouHaveSadLook_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_YouHaveSadLook_info()
{
	AI_Output(other,self,"DIA_Harok_YouHaveSadLook_15_00");	//� ���� ��������� ���.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_00");	//(��������) ��� ��� �������? ��, � ���� ��������� ����.
	AI_Output(other,self,"DIA_Harok_YouHaveSadLook_15_01");	//��������, ��� ���������.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_01");	//� ���� ���� ����, �����. �� ��� �����, �� ��� ����� ��������� ������.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_02");	//��, ��� � �, ����� ����� ����, ����� ������� ������ �� ������ � �������� �� �����, ����� ��� ����, ����� ������� ����� ����...
	AI_PlayAni(self,"R_SCRATCHHEAD");
	AI_Wait(self,1);
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_03");	//����� �� �������� �����, � ������ ������� ��� � ����� ����.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_04");	//�� ������ ������ � ������� ���. ��� �������, ��� �� �� ������� ��������.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_05");	//� ��������, ��� ������ �����, �� � ������� ������ � ��� ���, �� � ����� ������� ���� ������� �� ����.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_06");	//� ����� ��������� �� ����� ������. �� ����� ������ � ���������� �������, � ��� ������� ����� �� ���� ������� ������.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_07");	//� �� ����, ����� ����� ���� ��������� ����� ������.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_08");	//����������, ������ ���. � ����, ��� �� ������� �������, � ���� �� ����� ����� ����. ����� ������!
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);
	Info_AddChoice(DIA_Harok_YouHaveSadLook,"� ������ ���, ��� � ���� �����.",DIA_Harok_YouHaveSadLook_Help);
	Info_AddChoice(DIA_Harok_YouHaveSadLook,"��� ����, � ���� � ��� ���� ����� �������.",DIA_Harok_YouHaveSadLook_Deny);
};
func void DIA_Harok_YouHaveSadLook_Help()
{
	AI_Output(other,self,"DIA_Harok_YouHaveSadLook_Help_15_00");	//� ������ ���, ��� � ���� �����, ������!
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_Start);
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);
};
func void DIA_Harok_YouHaveSadLook_Deny()
{
	AI_Output(other,self,"DIA_Harok_YouHaveSadLook_Deny_15_00");	//��� ����, �� ������ � ���� � ��� ���� ����� �������.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_Deny_01_00");	//(���������) � �������. ����� ���� �����!
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);
};
//----
//���������� ����� ����������
//----
instance DIA_Harok_TellAboutYourIsland(C_Info)	//�������� � ����� �������.
{
	npc = BAU_101_DS2P_HAROK;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Harok_TellAboutYourIsland_condition;	
	information = DIA_Harok_TellAboutYourIsland_info;
	description = "�������� � ����� �������.";
};
func int DIA_Harok_TellAboutYourIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_TellAboutYourIsland_info()
{
	AI_Output(other,self,"DIA_Harok_TellAboutYourIsland_15_00");	//�������� � ����� �������.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_00");	//�, ��� ����� ������� ������! ���������� �� �����.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_01");	//��� ��� �����������, ��� ����� ����� ����� ��� ������� ����, ����� ������� ��� ������� ���� �� ������� � ����� �������� � ��������.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_02");	//������ ��� � ��������� ��� ������. � ������ ����� ��� ����������� ������� ���������� ������ ������ � ���������� �����.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_03");	//����� ��������� ����� �����������, � ��� ����� � ��������, ����� ����������, ������� ����������� ������� ��� ������� ���� � �����������.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_04");	//��, ������ ����, ������� ��������, ��� ��������, � ������� ������������ �������, ������� �� �����.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_05");	//������, ��� ����� ��� ��� ��� ��������� � ��� �������� ��������� ���������� �������, ����� ������� ���� ����� ���������. (��������)
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_06");	//���� �������, ����� ���� ��������� �������, ����������� �� ������ ��������.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_07");	//�� ��������� ������� � �� ����� �������� ���� �� ���������, ������� � ������� ����� � ������, � ������, ��� ������������ �������.
};
//----
//���������� ����� ����������� ("�������� � ����� �������.")
//----
instance DIA_Harok_IsYourVillageBig(C_Info)	//� ��� ������� �������?
{
	npc = BAU_101_DS2P_HAROK;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Harok_IsYourVillageBig_condition;	
	information = DIA_Harok_IsYourVillageBig_info;
	description = "� ��� ������� �������?";
};
func int DIA_Harok_IsYourVillageBig_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_TellAboutYourIsland)){	return TRUE;};	};
func void DIA_Harok_IsYourVillageBig_info()
{
	AI_Output(other,self,"DIA_Harok_IsYourVillageBig_15_00");	//� ��� ������� �������?
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_00");	//���, ������ ���������.
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_01");	//� ������� ��������� �����, ������, ��� ������ ������������ ��� ��������, � ������ ����� ������� ���� �������� �������, ���� ������� ��� ����� � �����.
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_02");	//�� �������� ������������� ���� ��� ������� �� ��������. ��� � ��� ���� ���������������������. (�������)
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_03");	//�� ��� �����, � ����� ���� �������. ��� ��� ���, ����� ���� � ������.
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_04");	//� ������� � ����� ����� ������ �� ������. ���� � ��� ����������.
};
//----
//���������� ����� ����������
//----
instance DIA_Harok_HowManyPiratesOnIsland(C_Info)	//����� �� ������� �� �������?
{
	npc = BAU_101_DS2P_HAROK;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Harok_HowManyPiratesOnIsland_condition;	
	information = DIA_Harok_HowManyPiratesOnIsland_info;
	description = "����� �� ������� �� �������?";
};
func int DIA_Harok_HowManyPiratesOnIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_HowManyPiratesOnIsland_info()
{
	AI_Output(other,self,"DIA_Harok_HowManyPiratesOnIsland_15_00");	//����� �� ������� �� �������?
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_00");	//���� ������ �������. ��� ��� ��������� � �������, ���� ��� �������� ������ �� �����.
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_01");	//��, ��� ���� ��������� �������, ���������� ������� ��������.
	AI_Output(other,self,"DIA_Harok_HowManyPiratesOnIsland_15_01");	//������ �������?
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_02");	//��, ��������� ������� ���������� �� �������. ��� ��� ������ ����� ������.
	AI_Output(other,self,"DIA_Harok_HowManyPiratesOnIsland_15_02");	//� ������ ��� ������ ��� ����� ������?
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_03");	//�� ��� ��? �� ���� � ������ �����, �� �� �������� ������� �������� � ���� ����.
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_04");	//����� ������ ������, �� ���� ����� ��� �����, �� �� ��������� ������� ������, � ����� ������ ���� �� ����� � �����.
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_05");	//������ ����� ��������, ��� ���� �������� ���������, �� ��������� ������ �������.
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_06");	//������� ��� ����� ����������� ����� ������ � ����� � ������. ��� ��� � ������ �� ��� ���������� ����������.
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_07");	//������, ���� ���-�� ����� �� �����������, �� ��� ����� ��.
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Hostages);
};
//----
//���������� ����� ����������� ("����� �� ������� �� �������?")
//----
instance DIA_Harok_WhyCaveIsCalledHaltViator(C_Info)	//� ������ ������ ���������� ������� ��������?
{
	npc = BAU_101_DS2P_HAROK;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Harok_WhyCaveIsCalledHaltViator_condition;	
	information = DIA_Harok_WhyCaveIsCalledHaltViator_info;
	description = "� ������ ������ ���������� ������� ��������?";
};
func int DIA_Harok_WhyCaveIsCalledHaltViator_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_HowManyPiratesOnIsland)){	return TRUE;};	};
func void DIA_Harok_WhyCaveIsCalledHaltViator_info()
{
	AI_Output(other,self,"DIA_Harok_WhyCaveIsCalledHaltViator_15_00");	//� ������ ������ ���������� ������� ��������?
	AI_Output(self,other,"DIA_Harok_WhyCaveIsCalledHaltViator_01_00");	//� ��� ����� ��������. ����� ���� ������� ���� �� ��������, � �������, �� ���� �������� �� ����������, � ������� ������ � ��������� ��������.
	AI_Output(self,other,"DIA_Harok_WhyCaveIsCalledHaltViator_01_01");	//��� ��� ������ ����������� �� ����.
	AI_Output(self,other,"DIA_Harok_WhyCaveIsCalledHaltViator_01_02");	//� ���� ��������� ��� ������ ������ �� �������� ������� ���������, ��� �������� � ���� ������, � ��� ������ ��� � �����.
};

//----
//���������� ����� ����������, ���� ������
//----
instance DIA_Harok_HelpMe(C_Info)	//
{
	npc = BAU_101_DS2P_HAROK;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Harok_HelpMe_condition;
	information = DIA_Harok_HelpMe_info;
	important = TRUE;
};
func int DIA_Harok_HelpMe_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start) && !Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE))	{	return TRUE;};	};
func void DIA_Harok_HelpMe_info()
{
	AI_Output(self,other,"DIA_Harok_HelpMe_01_00");	//������ �� ��� ������������, �� � ����� �� ��������� ���� �� ������.
	AI_Output(other,self,"DIA_Harok_HelpMe_15_00");	//� ���� ������.
	AI_Output(self,other,"DIA_Harok_HelpMe_01_01");	//���� ���� ���� � ����� � ������, � ����� ���� �� �����������, � ��������� ����.
	AI_Output(self,other,"DIA_Harok_HelpMe_01_02");	//��� ���, ������� ������ ���� ���, ��� ��������� � ����, ��������� ��� ����. 
	AI_Output(self,other,"DIA_Harok_HelpMe_01_03");	//� ������, ��� � ������ ������� ����, �������� �����. �� �� ����, � �� ���, � ����� �������.
	AI_Output(self,other,"DIA_Harok_HelpMe_01_04");	//� ��� ����, ����� ���� � ��������� � ����, �� �� - ������ ������ ����. ������ �������, ������� ��� � ������� ��� ����.
	Info_ClearChoices(DIA_Harok_HelpMe);
	Info_AddChoice(DIA_Harok_HelpMe,"� ������� ����.",DIA_Harok_HelpMe_Help);
	Info_AddChoice(DIA_Harok_HelpMe,"� ���� ��� �� ��� �������.",DIA_Harok_HelpMe_Deny);
};
func void DIA_Harok_HelpMe_Help()
{
	AI_Output(other,self,"DIA_Harok_HelpMe_Help_15_00");	//� ������� ����.
	//UNFINISHED !!!
	AI_Output(self,other,"DIA_Harok_HelpMe_Help_01_00");	//������� ����, ������ �������. ������ ��������� ������ ��������. (���-�� � ���-��)
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishingBusiness,LOG_MISSION,LOG_Running,TOPIC_DS2P_FishingBusiness_Start);
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);
};
func void DIA_Harok_HelpMe_Deny()
{
	AI_Output(other,self,"DIA_Harok_HelpMe_Deny_15_00");	//� ���� ��� �� ��� �������.
	AI_Output(self,other,"DIA_Harok_HelpMe_Deny_01_00");	//����� ����! ���� ���� �������� ��� ����� ���� ����.
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);	
};
//----
//���������� ����� ����������� � ������ ������ "������ ����"
//----
instance DIA_Harok_HereIsYourSalt(C_Info)	//��� ���� ����, �����.
{
	npc = BAU_101_DS2P_HAROK;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Harok_HereIsYourSalt_condition;	
	information = DIA_Harok_HereIsYourSalt_info;
	description = "��� ���� ����, �����.";
};
func int DIA_Harok_HereIsYourSalt_condition()
{
	if((MIS_DS2P_FishingBusiness == LOG_Running) && C_Npc_ds_HasItems(other,ITMI_DS2P_Salt,10)) {
		return TRUE;
	};	
};
func void DIA_Harok_HereIsYourSalt_info()
{
	AI_Output(other,self,"DIA_Harok_HereIsYourSalt_15_00");	//��� ���� ����, �����.
	AI_Output(self,other,"DIA_Harok_HereIsYourSalt_01_00");	//������� ����. �� ���� ������ � ��� ���� ���� ���. ���-�� � ����� ��� �� ������. �����, �� ����� ���� �������.
	B_GivePlayerXP(XP_MIS_FishingBusiness_01);
	B_GiveInvItems(self,other,ITMW_DSG_Sword_2x2_01,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishingBusiness,LOG_MISSION,LOG_Running,TOPIC_DS2P_FishingBusiness_SaltGiven);
	AI_StopProcessInfos(self);
};
//----
//���������� ����� ����������� ("��� ���� ����, �����.")
//----
instance DIA_Harok_WaitHelpMeYet(C_Info)	//
{
	npc = BAU_101_DS2P_HAROK;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Harok_WaitHelpMeYet_condition;	
	information = DIA_Harok_WaitHelpMeYet_info;
	important = TRUE;
};
func int DIA_Harok_WaitHelpMeYet_condition(){	if((MIS_DS2P_FishingBusiness == LOG_Running) && Npc_KnowsInfo(other,DIA_Harok_HereIsYourSalt)) {	return TRUE;};	};
func void DIA_Harok_WaitHelpMeYet_info()
{
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_00");	//��������, � �������� ���� �������� ������, �� ��� �� ������� ��� �� ����� ������.
	AI_Output(other,self,"DIA_Harok_WaitHelpMeYet_15_00");	//������ ���������, ������. ������.
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_01");	//���� ��������� �������, � �������� ���� � ���� � �����, � �� �������� �� �����, ��������. ������ ���������.
	AI_GotoWP(self,"");
	AI_Wait(self,2);
	AI_GotoNpc(self,other);
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_02");	//���, ������ ��� ������. �� �������, ������� ������� ���� ������� ��� ���� �� �������� �����.
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_03");	//� ������, ��� �� ���� �������� ����� ������������ ���� �������� �����.
	AI_Output(other,self,"DIA_Harok_WaitHelpMeYet_15_01");	//��� ��� ����� �����?
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_04");	//� �������, ������� ��! ��� ������ ������� � �������, ���� ����������� � ����� ���� ��� �������.
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_05");	//���� �������, �� ����, ��� � �������, ��� ������ �� �������� � ����. � �� ��� ������ ������ ��� �������� � ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishingBusiness,LOG_MISSION,LOG_Running,TOPIC_DS2P_FishingBusiness_AskDelivery);
	B_GiveInvItems(self,other,ITMI_DS2P_FishBarrel,1);
	AI_StopProcessInfos(self);
};


//NS - 17/07/2013 ================================================
// �� ������ "���� ������"
//================================================================
// "� ����� ������." (+����), ����� ���� �������			nr = 20
instance DIA_Harok_GaronBecomePirat(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 20;
	permanent = FALSE;
	condition = DIA_Harok_GaronBecomePirat_condition;	
	information = DIA_Harok_GaronBecomePirat_info;
	description = "� ����� ������.";
};
func int DIA_Harok_GaronBecomePirat_condition()
{
	if(Garon_Choice == Garon_Choice_Pirate)
	{	return TRUE;};
};
func void DIA_Harok_GaronBecomePirat_info()
{
	AI_Output(other,self,"DIA_Harok_GaronBecomePirat_15_00");	//� ����� ������. 
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_Pirat_ToldHakon);
		Mdl_StartFaceAni(self,"S_FRIENDLY",1,5);
		AI_Output(self,other,"DIA_Harok_GaronBecomePirat_01_01");	//(��������) ��? � ��� �� ��? � ����� ����������, ��� �� �������� ��� �������!
		Mdl_StartFaceAni(self,"S_FRIGHTENED",1,1);
	AI_Output(other,self,"DIA_Harok_GaronBecomePirat_15_02");	//��... �� ����� ����� �������, ������� �� �� ��������.
		AI_Output(self,other,"DIA_Harok_GaronBecomePirat_01_03");	//(���������) ���? �� ���� ����� ����! ����� ���� �������?
	AI_Output(other,self,"DIA_Harok_GaronBecomePirat_15_04");	//��, �� �����, ��� ��� ����� ����� ��� ����.
		Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
		AI_Output(self,other,"DIA_Harok_GaronBecomePirat_01_05");	//(�������) ��� ������� ������� ���� �������.
		AI_Output(self,other,"DIA_Harok_GaronBecomePirat_01_06");	//(���� ������) �����, �����, ��� �� �� ���?.. ������, ��� ����� ������ ������.
	//������ ����������
	AI_StopProcessInfos(self);

	//������ � �������� "���� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GrandsonOfFisherman_SuccessPirat);
};


//-------------------------------------------------------------------
// "��� ������, ����� � ������ �������." (+����)		important	
// �������: �����, �����, �����, ������
// TEST NEEDED ��������, ����� ������� �� 2 �����
instance DIA_Harok_GaronReturned(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 0;
	condition = DIA_Harok_GaronReturne_condition;	
	information = DIA_Harok_GaronReturne_info;
	description = "��� ������, ����� � ������ �������.";
	important = TRUE;
};
func int DIA_Harok_GaronReturne_condition()
{
	var C_NPC Garon;	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
	if((Garon_Choice == Garon_Choice_GoHome) && (Npc_GetDistToNpc(self, Garon) < PERC_DIST_ACTIVE_MAX)
		&& (Npc_GetDistToNpc(other, Garon) <= PERC_DIST_ACTIVE_MAX))
	{	return TRUE;	};
};
func void DIA_Harok_GaronReturne_info()
{
	var C_NPC Garon;	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
	var C_NPC Harok;	Harok = Hlp_GetNpc(BAU_101_DS2P_HAROK);
	var C_NPC Karah;	Karah = Hlp_GetNpc(Pir_204_DS2P_Karah);
	var C_NPC Symon;	Symon = Hlp_GetNpc(PIR_202_DS2P_Symon);
	
	// UNFINISHED ������ ��������������� ����� ����� ������
	AI_StartState(Karah, ZS_Stand_WP, 0, "");	AI_Teleport(Karah, "");
	AI_StartState(Karah, ZS_Stand_WP, 0, "");	AI_Teleport(Symon, "");

	// ���� � �������� ��������� ������ ����� � �����
	TRIA_Invite(Garon);
	TRIA_Invite(Karah);
	TRIA_Invite(Symon);
	TRIA_Start();

	AI_Output(other,self,"DIA_Harok_GaronReturne_15_00");	//��� ������, ����� � ������ �������.
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_GoHome);
	
	TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_12_01_Garon");	//��, ���� �� ������� ��, ��� ������ ����������� ��� �����. (�������)
	
	// UNFINISHED ������ ���� ������
	AI_GotoNpc(Karah, Garon);
	AI_GotoNpc(Symon, Garon);
	
	TRIA_Next(Harok);
		AI_Output(self,other,"DIA_Harok_GaronReturne_01_02_Harok");	//��, �� ������� �������! �����, ��� �� � ���, ��� �� ��������! � ������� ����� ��� �����...

	
	///���������� ����� � ������
	DIAG_Reset();
	
	
	TRIA_Next(Karah);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_03_Karah");	//(����������) ��� �� ���, ������ �����! � ��� � ����, ��� �� ��������� ����, ������ �� �� ���� ��������� ������� ���� ������ ������! 
	
	TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_12_04_Garon");	//��� ����...

	TRIA_Next(Symon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_05_Symon");	//�������, �� ������ �� ��������� ���������, �����. � �� ��������� ������ �� ����� �� ����� �������! � ���� ����� � ������ ���!
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_06_Symon");	//������ ����� � �������, ��� �� � ����� ���������, �� ����� �������� ������ ���� ��� ������. (������ �������)
	
	TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_12_07_Garon");	//� � ���� ������ �� �����! 

	TRIA_Next(Karah);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_08_Karah");	//������� ��� ���������! � ���� �� �������� ��-�������, �� ������ ����� ����� �������� �� ���� ����!
	
	TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_12_09_Garon");	//�� ������ ����� ����, �� � ���� � �� �����!

	TRIA_Next(Symon);
		AI_DrawWeapon(self);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_10_Symon");	//�����, ������, ������ ���������� ���, � ����� ��� � ������� �� �����. ���� ������� ���!

	AI_Output(other,self,"DIA_Harok_GaronReturne_15_11");	//������� ����� �� ������. ����� ����� ���� ��� ��������� ������� � ������ ���� �����!

	TRIA_Next(Symon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_12_Symon");	//�� ���, ���������, ����� ������� ���? ������, �������� ��������� ���� � ����!
		AI_DrawWeapon(Garon);
		AI_DrawWeapon(Karah);
		AI_DrawWeapon(Harok);
	
	TRIA_Finish();
	AI_StopProcessInfos(self);

	//����� ����� ������ �������� �� ���� �����
	AI_ContinueRoutine(Karah);
	AI_ContinueRoutine(Symon);
	// ���������� ������ � ������, ���� �������
	B_StartOtherRoutine(Harok,"GARONRETURNED");
	B_StartOtherRoutine(Garon,"HOME");
	
	//���������� �����
	Garon_FightPirates = Garon_FightPirates_Started;
	B_Attack(Symon,hero,AR_NONE, 1);
	B_Attack(Garon,Karah,AR_NONE, 1);
	B_Attack(Karah,Garon,AR_NONE, 1);
	B_Attack(Harok,Karah,AR_NONE, 1);
};


//-------------------------------------------------------------------
// ��� ������������, ���� ����� ����� ����� ����� (+����)		important
instance DIA_Harok_GaronReturnedAllAlive(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Harok_GaronReturnedAllAlive_condition;	
	information = DIA_Harok_GaronReturnedAllAlive_info;
	important = TRUE;
};
func int DIA_Harok_GaronReturnedAllAlive_condition()
{
	if((Garon_FightPirates == Garon_FightPirates_Finished) && !Npc_IsDead(BAU_117_DS2P_Garon)
		&& Npc_IsInState(self, ZS_Talk))
	{	return TRUE;};
};
func void DIA_Harok_GaronReturnedAllAlive_info()
{
	var int x;
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_00");	//�� ����� ��� ������, � ������ ���, ����� ������ �� ��� ������� ������, � ������, ����� ���� ���� �����.
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_01");	//������� �������� ��������, ������� ������ ��� �������� ���������� �����. ��������, ��� ����� ������ ����.
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_Pirat_ToldHakon);
	
	AI_Output(other,self,"DIA_Harok_GaronReturnedAllAlive_15_02");	//� ��...
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_03");	//(����������) �� � �� ���� ���� � ����� ����� �����.
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_04");	//������ ���� ���� � ��� � ������� ������, ��� � ����� �� ������ ������� ������. ��� ���, ��� ��� ������� ����� �� ���� ������ ����������.
	//���� ���� ��� ������� � ������� ������
	x = 1; if (x == 1)	{
		B_GiveInvItems(self, other, ITKE_Key_DS2P_GARON, 1);
	};
	//������ � �������� "���� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GrandsonOfFisherman_SuccessReturned);
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_05");	//����� �� ������ ��������� �� ��� ������ ���� �� ������ �����. �������� ���� �� ������.
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_06");	//�����, ��� ��, ��� ������� ������� �������.
	//���� 10 ���
	x = 2; if (x == 2)	{
		B_GiveInvItems(self, other, ItFo_Fish, 10);
	};

	//������ � �������� � ������� ���. ���� "���� �� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishFromHarok,LOG_NOTE,-1,"� ���� ��������� � ������ ��� � ���� �� �����.");
	Harok_FishGetDay = Wld_GetDay() + 1;
};


//-------------------------------------------------------------------
// "� ����� ������." (+����), ����� ���� � ���		nr = 22
instance DIA_Harok_GaronGoForest(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 22;
	permanent = FALSE;
	condition = DIA_Harok_GaronGoForest_condition;	
	information = DIA_Harok_GaronGoForest_info;
	description = "� ����� ������.";
};
func int DIA_Harok_GaronGoForest_condition()
{
	if(Garon_Choice == Garon_Choice_GoForest)
	{	return TRUE;};
};
func void DIA_Harok_GaronGoForest_info()
{
	var int x;
	AI_Output(other,self,"DIA_Harok_GaronGoForest_15_00");	//� ����� ������ � ����� ��� ������� �� �������.
	AI_Output(other,self,"DIA_Harok_GaronGoForest_15_01");	//�� ����� ���� �� ������������ ����, ��� ��� ������, ��� ������ ����� ����� ��� � ����� ����.
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_GoForest_ToldHakon);
		AI_Output(self,other,"DIA_Harok_GaronGoForest_01_02");	//� ���������� ���� �� ������. (��������) ����, �������, ��� ����� ���� �� ������� �� ������� ���� ���������, �� ��� ����� ����� ��� ����. � ���� � � ��� ��������.
		AI_Output(self,other,"DIA_Harok_GaronGoForest_01_03");	//������ �� ���� � �������� ������� ���� ���� � ��� � ������� ������, ��� � ����� �� ������ ������� ������. ��� ���, ��� ��� ������� ����� �� ���� ������ ����������.
	//���� ���� ��� ������� � ������� ������
	x = 1; if (x == 1)	{
		B_GiveInvItems(self, other, ITKE_Key_DS2P_GARON, 1);
	};

	//������ � �������� "���� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GrandsonOfFisherman_SuccessHide);
};


//-------------------------------------------------------------------
// "����� �����." (+����), ���� ��� ���� �����, �� ������ �� ������		nr = 22
instance DIA_Harok_GaronDead(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 22;
	permanent = FALSE;
	condition = DIA_Harok_GaronDead_condition;	
	information = DIA_Harok_GaronDead_info;
	description = "����� �����.";
};
func int DIA_Harok_GaronDead_condition()
{
	if((MIS_DS2P_GrandsonOfFisherman == LOG_FAILED) && Npc_IsDead(BAU_117_DS2P_Garon))
	{	return TRUE;};
};
func void DIA_Harok_GaronDead_info()
{
	AI_Output(other,self,"DIA_Harok_GaronDead_15_00");	//����� �����.
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_GaronDead);
		AI_Output(self,other,"DIA_Harok_GaronDead_01_01");	//(���������) ���? ������ �� ������?
	if (Garon_DeadInForest_HeroKnows == TRUE)	//����� ��� ���� � ����
	{
		AI_Output(other,self,"DIA_Harok_GaronDead_15_02");	//� ����� ��� ���� � ����.
			AI_Output(self,other,"DIA_Harok_GaronDead_01_03");	//(�� ������� �� ������) � �� ����! �� ����� ���, ��������!
		//���� ���� � �����
		if (B_GiveInvItems(other,self,ItBe_DS2P_Garon,1))
		{
			AI_Output(other,self,"DIA_Harok_GaronDead_15_04");	//��� ���� ������. ������, �� ���� ���� �����.
				AI_Output(self,other,"DIA_Harok_GaronDead_01_05");	//(���������� ������� �� ����) ������ �����... �� ������, ������ ������...
			AI_Output(self,other,"DIA_Harok_GaronGoDead_01_06");	//������, �� ��� ����� ������ ������.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Harok_GaronDead_15_07");	//��� ������� ������� �� ������� � �������� � ������, ���������� ������.
		AI_Output(other,self,"DIA_Harok_GaronDead_15_08");	//� ����� ������ ��� ��������� � ����, �� �� ������ �� ������ � ���������... ������, �� � ������ �� ���� �������...
			AI_Output(self,other,"DIA_Harok_GaronDead_01_09");	//(�� ������� �� ������) � ���� ����... �����, �����, �� ������ � ����...
		AI_Output(self,other,"DIA_Harok_GaronDead_01_06");	//������, �� ��� ����� ������ ������.
	};
	Harok_GaronDeadDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};



//-------------------------------------------------------------------
// ������������ �������� � ��� ����, ����� ����� � ������ ������		important
instance DIA_Harok_GaronDead_RefuseTalk(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Harok_GaronDead_RefuseTalk_condition;	
	information = DIA_Harok_GaronDead_RefuseTalk_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Harok_GaronDead_RefuseTalk_condition()
{
	if(Npc_IsInState(self, ZS_Talk) 
		&& Npc_KnowsInfo(other, DIA_Harok_GaronDead) && (Harok_GaronDeadDay == Wld_GetDay()))
	{	return TRUE;};
};
func void DIA_Harok_GaronDead_RefuseTalk_info()
{
		AI_Output(self,other,"DIA_Harok_GaronDead_RefuseTalk_01_01");	//������, �� ��� ����� ������ ������.
	AI_Output(other,self,"DIA_Harok_GaronDead_RefuseTalk_15_00");	//� �������.
	AI_StopProcessInfos(self);
};


//NS - 17/07/2013 ================================================
// ��������� ����
//================================================================
// "� ���� ���� ����?" ����� ��������� ����������� ������		nr = 100
instance DIA_Harok_GetFish(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 100;
	permanent = FALSE;
	condition = DIA_Harok_GetFish_condition;	
	information = DIA_Harok_GetFish_info;
	description = "� ���� ���� ����?";
	permanent = TRUE;
};
func int DIA_Harok_GetFish_condition()
{
	if(Npc_KnowsInfo(other, DIA_Harok_GetFish))
	{	return TRUE;};
};
func void DIA_Harok_GetFish_info()
{
	AI_Output(self,other,"DIA_Harok_GetFish_15_00");	//� ���� ���� ����?
	if (Wld_IsTime(0,0,8,0))	//NS - ����������
	{
		AI_Output(self,other,"DIA_Harok_GetFish_01_01");	//������, ������� � ��� �� ����� �������� ����. ������� �����.
	}
	else if(Harok_FishGetDay >= Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Harok_GetFish_01_02");	//������, ������� ���� ��� ���������, ������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Harok_GetFish_01_03");	//��, �������, �����, ������ ������!
		//���� �� 5 �� 10 ����� ������.
		B_GiveInvItems(self,other,ItFo_Fish,5 + Hlp_Random(6));
		Harok_FishGetDay = Wld_GetDay() + 1;
	};
};

