instance DIA_Garon_EXIT(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Garon_EXIT_condition;	
	information = DIA_Garon_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Garon_EXIT_condition(){	return TRUE;};
func void DIA_Garon_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 17/07/2013 ===========================
//  ��������� ������� � ������
//===========================================
// ��� ������������					nr = 0;	
instance DIA_Garon_Start(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 0;
	condition = DIA_Garon_Start_condition;	
	information = DIA_Garon_Start_info;
	important = TRUE;
};
func int DIA_Garon_Start_condition()
{
	return TRUE;
};
func void DIA_Garon_Start_info()
{
		AI_Output(self,other,"DIA_Garon_Start_12_00");	//�� �������! ��� ���� ��� � � �������� ���� ������ ���� ������. ��� ��� ������ ������!
	AI_Output(other,self,"DIA_Garon_Start_15_01");	//������. � �� ���� ��������� ���� ����. ���� ������� �����.
		AI_Output(self,other,"DIA_Garon_Start_12_02");	//��� ������? � �����, �� ���� �� �������.
	AI_Output(other,self,"DIA_Garon_Start_15_03");	//��� ������, ���� ��� ����� ��������� � ����.
		AI_Output(self,other,"DIA_Garon_Start_12_04");	//����� ������! � �� � ��� �����, ��� ��� �� ������.
};
//--------------------------------------------
// "��� �� ����� ��������?"			nr = 1;	
instance DIA_Garon_HowDidUGetThere(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 1;
	condition = DIA_Garon_HowDidUGetThere_condition;	
	information = DIA_Garon_HowDidUGetThere_info;
	description = "��� �� ����� ��������?";
};
func int DIA_Garon_HowDidUGetThere_condition()
{
	return TRUE;
};
func void DIA_Garon_HowDidUGetThere_info()
{
	AI_Output(other,self,"DIA_Garon_HowDidUGetThere_15_00");	//��� �� ����� ��������?
	// UNFINISHED ��������� ������ �������, ��� �� ���������������� � ������
	if (Npc_KnowsInfo(other, DIA_Karah_WhereIsGaron))
	{
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_01");	//�����, ����� ��� � ��. 
	};
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_02");	//��� ������ �����. ����� ������ � ��������� ��� ������ ���� � ��������� � ������, � �������� � ������������ ��������� ����. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_03");	//����� � ����, ���������, ��� ����� �� �����, � ���, ������� ��� ��������, ��� �������. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_04");	//� �������� ������� � ����� �� ������, �� ��� ���� ��������������. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_05");	//���� ������ ��������� ������� �� ����, ��� ����� ��������� ���� �������, � ������� �� ������� �� �������� �����, ������� ���� ����� �� �������. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_06");	//� ����� �������� ���-������ �� ��� ����� ������ � ������. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_07");	//������ ��������� ��� �� ��������, ���� � ����� ����� ����� �������, ������� ��� � �������� ����� �� �� ��������, ��� ��� �� ������� ����������, ����������� � �������. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_08");	//� ������� ������� � ���, � �������� ��������� ���������� �������� � ���� ���������. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_09");	//������� � ��������� � �������� ��������� �� ���� ��������, �� ����� ��� � ����������� ����������. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_10");	//� ���������� �� �������� ����� � ��������� ��� ��������, � ����� ������ � ��������� ������ �����. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_11");	//��� ������� ��������� ������, � ����� � �������� �����, � ������.
	//������ � �������� "���� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,"");
};
//--------------------------------------------
// "������ �� �� ���� �� ������?", ����� �����������		nr = 2;	
instance DIA_Garon_WhyNotGo(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 2;
	condition = DIA_Garon_WhyNotGo_condition;	
	information = DIA_Garon_WhyNotGo_info;
	description = "������ �� �� ���� �� ������?";
};
func int DIA_Garon_WhyNotGo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_HowDidUGetThere))
	{	return TRUE;	};
};
func void DIA_Garon_WhyNotGo_info()
{
	AI_Output(other,self,"DIA_Garon_WhyNotGo_15_00");	//������ �� �� ���� �� ������?
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_01");	//� ����� ��� �������, �� ����� � ������ ��������� �������� �����, �� ������� �����-�� �������. � ������� � �� ��������, ������ ���� ����.
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_02");	//������� ���������. � �����, ����� ������� ���� ���. � ��� �� �������� �� ���� �� �������.
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_03");	//� ���� � ����, � ����� �������, ��� � ������ �����������! � �����, ��� ������ ��������� �� �����.
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_04");	//���� �� �� ����� � ��� �������, �� �������� �� ��� � �����.
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_05");	//� ��� ���� �����, � �����, ��� �������� ����� �����������, ��������� �� ������ � ����� ��������. 
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_06");	//�� ��� ����� �� ����� ���� ������������ � ���������� � �������, �� � ����� ����, ��� ������ ��� �� ����. � ��������� ��� ������, ��� ��� �����.
	// ���� ��� �� ����� "�����"
	if (!Npc_IsDead(Shadowbeast_Addon_Fire_Garon))
	{
	AI_Output(other,self,"DIA_Garon_WhyNotGo_15_07");	//���� �� ������?
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_08");	//��� ��������� ��� ������, ������� � ������ �� ���������. 
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_09");	//���� ������, ��� ��� ����� ������� � �������� � ������ �������� � �������. 
	};
};

//NS - 17/07/2013 ===========================
//  ������� ������ �� �������� "�����"
//===========================================
// "���� �����, � ����� ��������.", ����� �����������, � ���� ��� �� ����� "�����"		nr = 3;	
instance DIA_Garon_IllLook(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 3;
	condition = DIA_Garon_IllLook_condition;	
	information = DIA_Garon_IllLook_info;
	description = "���� �����, � ����� ��������.";
};
func int DIA_Garon_IllLook_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_WhyNotGo) && !Npc_IsDead(Shadowbeast_Addon_Fire_Garon))
	{	return TRUE;	};
};
func void DIA_Garon_IllLook_info()
{
	AI_Output(other,self,"DIA_Garon_IllLook_15_00");	//������� �����, � �����, ��������.
		AI_Output(self,other,"DIA_Garon_IllLook_12_01");	//(� ������) ���, �� ����! ��� ����� ����! � �� ���� ����� �������� ����� ����!
	AI_Output(other,self,"DIA_Garon_IllLook_15_02");	//���� �� ������ �� ����������, �� ����� �� ������.
		AI_Output(self,other,"DIA_Garon_IllLook_12_03");	//� ��� � ���� ������ ���������...
	AI_Output(other,self,"DIA_Garon_IllLook_15_04");	//�� ��������, ��� ����� ������!
	//������ � �������� "���� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_Demon);

};

//--------------------------------------------
// "��� ��?", ���������� ����� �����������, ���� �� ���������, ��� "�����" ������		nr = 4;	
instance DIA_Garon_HowAU(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 4;
	condition = DIA_Garon_HowAU_condition;	
	information = DIA_Garon_HowAU_info;
	description = "��� ��?";
	permanent = TRUE;
};
func int DIA_Garon_HowAU_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_IllLook) && !Npc_KnowsInfo(other,DIA_Garon_IKilledDeamon))
	{	return TRUE;	};
};
func void DIA_Garon_HowAU_info()
{
	AI_Output(other,self,"DIA_Garon_HowAU_15_00");	//��� ��?
		AI_Output(self,other,"DIA_Garon_HowAUk_12_01");	//������ ������ � ��� ������� �� ���������. �� ��� ����� ����������� �� ����?!
};

//--------------------------------------------
// "�����, � ���� ������ ������." (+����), ����� �������� ��� "�����", � ���� ����� ��		nr = 5;	
instance DIA_Garon_IKilledDeamon(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 5;
	condition = DIA_Garon_IKilledDeamon_condition;	
	information = DIA_Garon_IKilledDeamon_info;
	description = "�����, � ���� ������ ������.";
};
func int DIA_Garon_IKilledDeamon_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_WhyNotGo) && Npc_IsDead(Shadowbeast_Addon_Fire_Garon))
	{	return TRUE;	};
};
func void DIA_Garon_IKilledDeamon_info()
{
	AI_Output(other,self,"DIA_Garon_IKilledDeamon_15_00");	//�����, � ���� ������ ������.
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_KilledDeamon);
		AI_Output(self,other,"DIA_Garon_IKilledDeamon_12_01");	//�� ������? � ���� �� ����!
	AI_Output(other,self,"DIA_Garon_IKilledDeamon_15_02");	//��������� �������� ��� ���������� �������. �����, � ��� ��� �������.
		AI_Output(self,other,"DIA_Garon_IKilledDeamon_12_03");	//(������� ����) ������. � ������ � � ���� ���� ����������. � �� ��������� ������� �������, � ���... 
		AI_Output(self,other,"DIA_Garon_IKilledDeamon_12_04");	//(��������) ��� �� ����! 
	//������ ����������, ����� ����� �� ������
	B_StartOtherRoutine(self,"RUNAWAY");
	Npc_SetRefuseTalk(self, 3);	//3 ���. ��� ������, ����� ��������? TEST NEEDED
	AI_StopProcessInfos(self);
};


//NS - 17/07/2013 ===========================
//  �������� ������ ������� �����
//===========================================
// ������������ ���, ����� ������� �� ������ (+����)		nr = 10;	
instance DIA_Garon_WhatShouldIDo(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 10;
	condition = DIA_Garon_WhatShouldIDo_condition;	
	information = DIA_Garon_WhatShouldIDo_info;
	important = TRUE;
};
func int DIA_Garon_WhatShouldIDo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_IKilledDeamon) && (Npc_GetDistToWP(self, self.wp) < TA_DIST_SELFWP_MAX))
	{	return TRUE;	};
};
func void DIA_Garon_WhatShouldIDo_info()
{
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_00");	//��� ������� ������ �� ���������, ������� ������� �� ������.
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_15_01");	//� �����, �� �� ����� �� ������. ���� ������������, ������ ��� ����?
	//������ � �������� "���� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_Free);
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_02");	//�� � ���?
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_15_03");	//���� ���� ������ � ���� ���. 
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_04");	//�, �� �� ����? ������, ����� ����, ��� ���������, � ���� �����������, ��������� �� ������ �����, ��������� ����������� �����.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_05");	//������, ���� ���� ��� �������. ���� �� �� ��, �� � �� ����� ����� ���� �� ������, ���� ���� ����� ��� �����. 
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_06");	//� ���� �� ������ ����������� �������, �� �������� �� � ������� ���� �����, ������� �� ���� � �������, �� ������ ��, ���� ������� ���� ������ �� ���������� �����.
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_15_07");	//�� ���� ���� ������ � ��� ���� ������!
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_08");	//��, � ����, ������� �� ���� ������, ��� ������ ������. ������ ���, ������ ����� �� ����.
	Info_ClearChoices(DIA_Garon_WhatShouldIDo);
	Info_AddChoice(DIA_Garon_WhatShouldIDo,"�� ��� ������ ������� ���� ������.",DIA_Garon_WhatShouldIDo_UrChoise);
	Info_AddChoice(DIA_Garon_WhatShouldIDo,"������ � ������ ����.",DIA_Garon_WhatShouldIDo_GoHome);
	Info_AddChoice(DIA_Garon_WhatShouldIDo,"������ � �������.",DIA_Garon_WhatShouldIDo_GoPirates);
};
func void DIA_Garon_WhatShouldIDo_GoPirates()
{
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_GoPirates_15_00");	//������ � �������. 
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_Pirat);
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_GoPirates_12_01");	//��� ���� � ����! � ���� � ���� ����� ������� � ������ � ���� ������� ������. 
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_GoPirates_15_02");	//� ��� ������ ������� ��� ����?
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_GoPirates_12_03");	//(��������) ��� ������... ������. ��� ����� ����!
	//������ ����������, ����� ����� � ������.
	B_StartOtherRoutine(self,"PREPIRAT");
	AI_StopProcessInfos(self);
	//������ � �������� "���� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_JoinPirates);
	Garon_Choice = Garon_Choice_Pirate;
};
func void DIA_Garon_WhatShouldIDo_GoHome()
{
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_GoHome_15_00");	//������ � ������ ����. ����� ������� � ��� �� ������ �����, �� ������ ���.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_GoHome_12_01");	//��, �� ����. ������ � �� ������� ������, ������� ����. ������ ����� �� ����������! �����.
	//������ ����������, ����� ����� � ������.
	B_StartOtherRoutine(self,"GOHOME");
	var C_NPC Harok; Harok = Hlp_GetNpc(BAU_101_DS2P_Harok);
	B_StartOtherRoutine(Harok,"GARONTALK");
	AI_StopProcessInfos(self);
	
	Garon_Choice = Garon_Choice_GoHome;
};
func void DIA_Garon_WhatShouldIDo_UrChoise()
{
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_UrChoise_15_00");	//�� ��� ������ ������� ���� ������.
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_GoForest);
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_UrChoise_12_01");	//(���������) ��������, �� ����.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_UrChoise_12_02");	//������������ � ����? � ����� ��� ������... ���, ��� ������. �������� ��������� ������� � ������� �� ��, ��� ������, ��� ���� ���-�� �� �������.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_UrChoise_12_03");	//����� ������ ������� � ��� ���������� � ����, ���� ��� �� �������. ������� ���� �� ���.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_UrChoise_12_04");	//� ���� ����� ��� ���� ������� � ����� � ������ � �����, ��� �� ���� ��� � �������. 
	//������ � �������� "���� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_HideInForest);
	//����� ������ � ���
	B_StartOtherRoutine(self,"GOFOREST");
	AI_StopProcessInfos(self);
	Garon_Choice = Garon_Choice_GoForest;
};


//NS - 17/07/2013 ===========================
//  ���� �������
//===========================================
// "�� � ��� ���� ������� ����� �������?", (+����) ����� ����, ��� ���� �������		nr = 20;
var int XP_MIS_GrandsonOfFisherman_IsPirat_Once;	//���� ������ 1 ���, � ������ ����������
instance DIA_Garon_AmongPirates(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 20;
	condition = DIA_Garon_AmongPirates_condition;	
	information = DIA_Garon_AmongPirates_info;
	description = "�� � ��� ���� ������� ����� �������?";
	permanent = TRUE;
};
func int DIA_Garon_AmongPirates_condition()
{
	if((Garon_Choice == Garon_Choice_Pirate) && (Npc_KnowsInfo(other,DIA_Greg_GaronBecomePirate)))
	{	return TRUE;	};
};
func void DIA_Garon_AmongPirates_info()
{
	AI_Output(other,self,"DIA_Garon_AmongPirates_15_00");	//�� � ��� ���� ������� ����� �������?
		AI_Output(self,other,"DIA_Garon_AmongPirates_12_01");	//��� ��������� �� ��� �����. ���� �� ������ ���� � ����� � �� ������� �� ������ ������, �� ����� �������, ��� � ������ ���������.
		AI_Output(self,other,"DIA_Garon_AmongPirates_12_02");	//��� ��� ������� ���� �� ���!
	//(+����)
	if (XP_MIS_GrandsonOfFisherman_IsPirat_Once == FALSE)
	{

		B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_IsPirat);
		XP_MIS_GrandsonOfFisherman_IsPirat_Once = TRUE;
	};
};


//NS - 18/07/2013 ===========================
//  �������� �����
//===========================================
// ��� ������������, ����� ����, ��� ������ ������� � ������, ����� ��� (+����)		important	
instance DIA_Garon_ThanksAllAlive(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 0;
	condition = DIA_Garon_ThanksAllAlive_condition;	
	information = DIA_Garon_ThanksAllAlive_info;
	important = TRUE;
};
func int DIA_Garon_ThanksAllAlive_condition()
{
	if((Garon_FightPirates == Garon_FightPirates_Finished) && !Npc_IsDead(BAU_101_DS2P_HAROK)
		&& Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Garon_ThanksAllAlive_info()
{
		AI_Output(self,other,"DIA_Garon_ThanksAllAlive_12_01");	//	������� ���� �� ������! ���� �� �� ��, ��� � ����� ����� ����� ��. � � ���� � ���������� �����.
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_HomeAllAlive);
	AI_Output(other,self,"DIA_Garon_ThanksAllAlive_15_00");	//�� ����� �������������! � ������ ������ ����� ���, ��� ���� ������ � ��� ����, ����� ����� �������� � �����-������ ���������.
};

//--------------------------------------------
// "������ �� ������������?", ���������� ����� �����������				nr = 21;
instance DIA_Garon_PiratesNotReturned(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 21;
	condition = DIA_Garon_PiratessNotReturned_condition;	
	information = DIA_Garon_PiratessNotReturned_info;
	description = "������ �� ������������?";
	permanent = TRUE;
};
func int DIA_Garon_PiratessNotReturned_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_ThanksAllAlive))
	{	return TRUE;	};
};
func void DIA_Garon_PiratessNotReturned_info()
{
	AI_Output(other,self,"DIA_Garon_PiratessNotReturned_15_00");	//������ �� ������������?
		AI_Output(self,other,"DIA_Garon_PiratessNotReturned_12_01");	//���� ���, �� �� � ����� �� ������ ������ ������ ������ �������� � �� ������� ������� �����.
		AI_Output(self,other,"DIA_Garon_PiratessNotReturned_12_02");	//���� ��� � �������, �� �� ����� ����� ������ �����. (�������)
};

//--------------------------------------------
// ��� ������������, ������ ������, �� ����� ����	(+����)			nr = 22;
instance DIA_Garon_HakonDead(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 22;
	condition = DIA_Garon_HakonDead_condition;	
	information = DIA_Garon_HakonDead_info;
	description = "";
	permanent = TRUE;
};
func int DIA_Garon_HakonDead_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_ThanksAllAlive))
	{	return TRUE;	};
};
func void DIA_Garon_HakonDead_info()
{
	var int x;
		AI_Output(self,other,"DIA_Garon_HakonDead_12_00");	//(�� ������� �� ������) ��� ����� ����! � ���� ���!
		AI_Output(self,other,"DIA_Garon_HakonDead_12_01");	//����� � ������ ��������, ����� ���� ����������, ��� ��� ����� �������. ����� �� � ������!
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_HomeHakonDead);
	AI_Output(other,self,"DIA_Garon_HakonDead_15_02");	//�� ������ ����, �� �� � ��� �� �������!
		Mdl_StartFaceAni(self,"S_HOSTILE",1,-1);
		AI_Output(self,other,"DIA_Garon_HakonDead_12_03");	//(������) �� �� ���! ������� �, � ������ � ���� ���� �� ���������, �� ���� �� ���������!
	AI_Output(other,self,"DIA_Garon_HakonDead_15_04");	//���� �� ����� �� ����!
		AI_Output(self,other,"DIA_Garon_HakonDead_12_05");	//��� ��� ������ ������. � �������� ������� ���� ����� ��������, � ����� ������ ���������.
	AI_Output(other,self,"DIA_Garon_HakonDead_15_06");	//�� ������ �� ����������, ������ ������ ���� ����� �� ���. ����� ����, ���� ����� ����� ��������� � ����� ���������� �����?
		AI_Output(self,other,"DIA_Garon_HakonDead_12_07");	//� ��� ��?
	AI_Output(other,self,"DIA_Garon_HakonDead_15_08");	//����� ��, ��� � ������� � ������������, ��� ���� �� �������?
		AI_Output(self,other,"DIA_Garon_HakonDead_12_09");	//(���������) ���... �������, ���! ����� ��������� ���������� � ����.
	AI_Output(other,self,"DIA_Garon_HakonDead_15_10");	//� �� �������, ��� ������ ��� ����� ��� ����� ����?
	AI_Output(other,self,"DIA_Garon_HakonDead_15_11");	//���������, ��� ������, ��� �� ��������� ������� � �������. � � ����� ��� ������, ��� ������ ������ �� �� �� �������.
		Mdl_StartFaceAni(self,"S_FRIENDLY",1,-1);
		AI_Output(self,other,"DIA_Garon_HakonDead_12_12");	//(��������) � �� ��������� ����. ����� ����� �� ����������!

	AI_Output(other,self,"DIA_Garon_HakonDead_15_13");	//��� � ������. ��� ����.
		Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
		AI_Output(self,other,"DIA_Garon_HakonDead_12_14");	//������, � �� ����� ������������� ����. ������ ���� ���� � ��� � ������� ������, ��� � ����� �� ������ ������� ������.
		AI_Output(self,other,"DIA_Garon_HakonDead_12_15");	//�� � ����� ��� ������� ���� ������� � ������. ��� ��� ������ �� � ����...
	//���� ���� ��� ������� � ������� ������
	x = 1; if (x == 1)	{
		B_GiveInvItems(self, other, ITKE_Key_DS2P_GARON, 1);
	};

	//������ � �������� "���� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GrandsonOfFisherman_SuccessHunters);

	// ������ � ���������
	B_StartOtherRoutine(self, "WITHHUNTERS");
	AI_StopProcessInfos(self);
};

