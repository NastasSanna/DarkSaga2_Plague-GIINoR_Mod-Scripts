instance DIA_Tamir_EXIT(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Tamir_EXIT_condition;	
	information = DIA_Tamir_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Tamir_EXIT_condition(){	return TRUE;};
func void DIA_Tamir_EXIT_info(){	AI_StopProcessInfos(self);};
//**--��������� ������----***//
instance DIA_Tamir_Start(C_Info)	//��������� ������
{
	npc = BAU_105_DS2P_Tamir;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Tamir_Start_condition;	
	information = DIA_Tamir_Start_info;
	description = "������! ��� ��?";
};
func int DIA_Tamir_Start_condition(){	return TRUE;};
func void DIA_Tamir_Start_info()
{
	AI_Output(other,self,"DIA_Tamir_Start_15_00");	//������! ��� ��?
	AI_Output(self,other,"DIA_Tamir_Start_12_00");	//(����������) ���� ����? �� ���� �� ���, ��������� �������, � �� � ����� �� ��� �������������� � ������ ���� �����!
	AI_PlayAni(self,"T_IGETYOU");
	AI_Output(other,self,"DIA_Tamir_Start_15_01");	//���������, � �� �����.
	AI_Output(self,other,"DIA_Tamir_Start_12_01");	//(���������) � ��� �����?
	AI_Output(self,other,"DIA_Tamir_Start_12_02");	//��������� � ����, �� ������� ����� ���, ������� � �������� ������ ���. ��� �� � ���� ����?
	AI_PlayAni(self,"T_LAUGH_01");
	AI_Output(other,self,"DIA_Tamir_Start_15_02");	//����� � ����? � �� ������ �������� ������� ������� �� �������. �� ����� �� ��������.
	AI_Output(other,self,"DIA_Tamir_Start_15_03");	//���� �� ������, ������ ��� ������� � ����������.
	AI_Output(self,other,"DIA_Tamir_Start_12_03");	//�� �������? �! ��� �� �����������! ������, ������ �� ��� �� ���� �������� ������!
	AI_Output(other,self,"DIA_Tamir_Start_15_04");	//�� �������, � ��� ������ ����� �� �������?
	AI_Output(self,other,"DIA_Tamir_Start_12_04");	//��! � ��� ���� ���������� �����? ��� �� �������, � �� ����, �� ��� ���� �������.
	AI_Output(self,other,"DIA_Tamir_Start_12_05");	//�� �����, ��� �� ���������� � ����� ���������� ��������.
	AI_Output(other,self,"DIA_Tamir_Start_15_05");	//�� ��� ��� ������. �� ������� ����, ����� ��� ������� � ����. ������ ���� ������� ������ ���������� ��������.
	AI_Output(other,self,"DIA_Tamir_Start_15_06");	//��� ��� ������� � ������ �� ������. ��� ����� ������ ��������.
	AI_Output(self,other,"DIA_Tamir_Start_12_06");	//(����������) ���... ����� ���� ����� ���� � �����. �� � ��� ������� ������� � �������.
};
//----
//���������� ����� ����������
//----
instance DIA_Tamir_WhatIsYourName(C_Info)	//��� ���� �����?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Tamir_WhatIsYourName_condition;	
	information = DIA_Tamir_WhatIsYourName_info;
	description = "��� ���� �����?";
};
func int DIA_Tamir_WhatIsYourName_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_Start)){	return TRUE;};	};
func void DIA_Tamir_WhatIsYourName_info()
{
	AI_Output(other,self,"DIA_Tamir_WhatIsYourName_15_00");	//��� ���� �����?
	AI_Output(self,other,"DIA_Tamir_WhatIsYourName_12_00");	//���� ����� �����. � �������, ���� �� ������ �������� ���� �� ���� �������.
	AI_Output(self,other,"DIA_Tamir_WhatIsYourName_12_01");	//����� � ������ ���� ����������� ��������, ������� �� ��� ������ �������� ������. 
	AI_Output(self,other,"DIA_Tamir_WhatIsYourName_12_02");	//���� ���� ����� ������� ������� � ���� �������, �� �� ��������� �� ������.
};
//----------------------
//���������� ����� ����������� ("��� ���� �����?")
//----------------------
instance DIA_Tamir_TellMeAboutPeasants(C_Info)	//�������� ��� � ���, ��� ����� � �������.
{
	npc = BAU_105_DS2P_Tamir;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Tamir_TellMeAboutPeasants_condition;	
	information = DIA_Tamir_TellMeAboutPeasants_info;
	description = "�������� ��� � ���, ��� ����� � �������.";
};
func int DIA_Tamir_TellMeAboutPeasants_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_TellMeAboutPeasants_info()
{
	AI_Output(other,self,"DIA_Tamir_TellMeAboutPeasants_15_00");	//�������� ��� � ���, ��� ����� � �������.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_00");	//������� � ��� ���������, ���� ������ ������� �������.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_01");	//�������� � ��� � �����. �� ������� ��� ����� ����� �� ������ �������. �� ����� ����� � �������� ������� � ������� �� ������� � ������.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_02");	//���� � ��� �������, ������� ����� �������� ����������� ����� �����.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_03");	//��� ���� ������ ������, �� ������ ��� ��� � �������. ����� ������ ������, �� � �������� ������ ���������� �������, �� ��� �����.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_04");	//�����, �� ������ ���������� � ���� ������ � �����, ������ � ������. ��� � ���� ��������, ��� � �.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_05");	//�����, ���� �������, � ��� ������� ��������, � ������ ��� ������� � ������� ��� ���������.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_06");	//���� ��� ����� � ��������, � ���� � ������. 
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_07");	//�� �, ������� ��, ��� ����������� ���. �� ����� �� ������� � ����� ������ ����. ������, ������� ��� ���������.
	AI_Output(other,self,"DIA_Tamir_TellMeAboutPeasants_15_01");	//� ����� ����� ������� � ��� ����?
	if(Npc_IsDead(BAU_112_DS2P_Kara))
	{
		AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_08");	//(�������) �������. ���� - ���� ����, ����� - ���� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_09");	//(�������) �������. ���� - ���� ����, ����� - ���� �����, � ����� ���� - ���� ������.
	};
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_10");	//������ ��� �������� � ����, �� ������ ������ ������ �� � ������ ���������� �� �������.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_11");	//���� ��� �����, �� �� ������� � ��� �����������. � ��� ������ ����������� ��������, ������� ��� ����� ����, � �� ����� ��� � ������� �������� �� ������ �����.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_12");	//��, � ������ ����� � ������. �� � ����� ������ ������� � �������, �� � ����� �� ����� ���. ��������, �� ���� ����� � ������ ������ � ���������.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_13");	//����� ������� ���� �� �������?!
};
//----------------------
//���������� ����� ����������� ("��� ���� �����?")
//----------------------
instance DIA_Tamir_DoUHaveMapOfIsland(C_Info)	//� ���� ���� ����� �������?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 9;
	permanent = FALSE;
	condition = DIA_Tamir_DoUHaveMapOfIsland_condition;	
	information = DIA_Tamir_DoUHaveMapOfIsland_info;
	description = "� ���� ���� ����� �������?";
};
func int DIA_Tamir_DoUHaveMapOfIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_DoUHaveMapOfIsland_info()
{
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_00");	//� ���� ���� ����� �������?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_00");	//� ������� � ��� ����� ����, �� � �� � ���� ���. ��, ��������, ����� ��� ��� ���� ���� �������, � ��������� ��� �� �����, ��� ��� ��� ����� �� �������� ����������� �������.
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_01");	//�� ���� � ��� ��� �� ����� �����?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_01");	//(���������)  ����� � �� �������.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_02");	//���� ��������� � ���� �������. ��� ��������� ��� ����, ����, ������ ����� ��� ����.
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_02");	//�� �����?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_03");	//��, ��� �������� ������. � ���� ���� � ��� ����.
	
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_03");	//��� ��� ���������?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_04");	//�� ���� ������� � �������������, ��������� � ��� �������, ��� ������ �������.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_05");	//������ ����� ���� �� ��� �������, ������ � �� ����.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_06");	//� ����� ������, �� ������, ��� ������ ���������� ����� ����� �� ������, �� �� ��������, � �������.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_07");	//� �������������� ����� ���� �������� ��� �����. ��� ���� ������ ����.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_08");	//� ����� ����� �������� � ������ ����� � ����, ������� ������ ������� �������� � �����.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_09");	//��� ����, �������, �� ������� ������, ������� � ���������� ���. ���� �� ���� ���� �� ������� ������� � �����, ��� ���� ���������.	
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_04");	//������ �������� �������?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_10");	//(�������) ��, ����� ����� ����� � ������ ������ ������, ��� ������ ������.
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_05");	//��� ����� ����.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_11");	//��� ����. �� ������ � ���� �� ���������.
};
//---------------------
//���������� ����� ����������� ("� ���� ���� ����� �������?")
//---------------------
instance DIA_Tamir_HowMuchMoneyForMap(C_Info)	//������� �� ������ �� ����� �������?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 90;
	permanent = FALSE;
	condition = DIA_Tamir_HowMuchMoneyForMap_condition;	
	information = DIA_Tamir_HowMuchMoneyForMap_info;
	description = "������� �� ������ �� ����� �������?";
};
func int DIA_Tamir_HowMuchMoneyForMap_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_DoUHaveMapOfIsland)){	return TRUE;};	};
func void DIA_Tamir_HowMuchMoneyForMap_info()
{
	AI_Output(other,self,"DIA_Tamir_HowMuchMoneyForMap_15_00");	//������� �� ������ �� ����� �������?
	AI_Output(self,other,"DIA_Tamir_HowMuchMoneyForMap_12_00");	//� �����, ���� �� �����, ����� ��� ����� �� �������� � ���� �������, � ��������� ������ �����.
	AI_Output(self,other,"DIA_Tamir_HowMuchMoneyForMap_12_01");	//������� � �� ������ � ���� ������ �� ���. � ������� �����, ��� ������� ������ ������.
	AI_Output(self,other,"DIA_Tamir_HowMuchMoneyForMap_12_02");	//�������, �� �� ��������� ������ ����� �����.
	B_GiveInvItems(self,other,ItWr_DS2P_Map_Tamir,1);
};
//----
//���������� ����� ����������� ("������� �� ������ �� ����� �������?")
//----
const int XP_DIA_Tamir_BlackTrollIsDead = 0;
instance DIA_Tamir_BlackTrollIsDead(C_Info)	//������ ������ �����!
{
	npc = BAU_105_DS2P_Tamir;
	nr = 900;
	permanent = FALSE;
	condition = DIA_Tamir_BlackTrollIsDead_condition;	
	information = DIA_Tamir_BlackTrollIsDead_info;
	description = "������ ������ �����!";
};
func int DIA_Tamir_BlackTrollIsDead_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Tamir_HowMuchMoneyForMap) && (Npc_HasItems(other,ItAt_TrollBlackFur) || Npc_HasItems(other,ItAt_DS_TrollBlackFur_H)))
	{	return TRUE;};	
};
func void DIA_Tamir_BlackTrollIsDead_info()
{
	AI_Output(other,self,"DIA_Tamir_BlackTrollIsDead_15_00");	//������ ������ �����!
	B_GivePlayerXP(XP_DIA_Tamir_BlackTrollIsDead);
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_00");	//(���������) �� ������?
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(other,self,"DIA_Tamir_BlackTrollIsDead_15_01");	//��� ��� �����.
	if(B_GiveInvItem_red(other,self,ItAt_TrollBlackFur,1,34)){}
	else{B_GiveInvItem_red(other,self,ItAt_DS_TrollBlackFur_H,1,34);};
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_01");	//����������. ��� ������������� ����� ������� ������.
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_02");	//������ ���� �������. ����� ��� �� ����� ������� �������� ��� ����, �� ��� ��.
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_03");	//� �� ����� ������ � ���� �����.
	AI_Output(other,self,"DIA_Tamir_BlackTrollIsDead_15_02");	//����� ��� ����?
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_04");	//� ���� ������� �� �� ������ �����.
	AI_Output(other,self,"DIA_Tamir_BlackTrollIsDead_15_03");	//�������.
	B_GiveInvItem_red(self,other,ItMi_Gold,350,37);	
};
//----
//���������� ����� ����������� ("��� ���� �����?")
//----
instance DIA_Tamir_WhatDoUDoWithSkins(C_Info)	//��� �� ������� �� ������� ��������?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Tamir_WhatDoUDoWithSkins_condition;	
	information = DIA_Tamir_WhatDoUDoWithSkins_info;
	description = "��� �� ������� �� ������� ��������?";
};
func int DIA_Tamir_WhatDoUDoWithSkins_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_WhatDoUDoWithSkins_info()
{
	AI_Output(other,self,"DIA_Tamir_WhatDoUDoWithSkins_15_00");	//��� �� ������� �� ������� ��������?
	AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_00");	//�� ����� ����. ������������ �� ��������� ������, � ����� � ���� ������, ������, �����. ����� ������ �� ���, ����� ���� ������ � ������ ������.
	AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_01");	//����� ���� ������������ �� ������ �������, ������� ������������ ����� � ���������.
	AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_02");	//� ���� �����?
	AI_Output(other,self,"DIA_Tamir_WhatDoUDoWithSkins_15_01");	//���� � ������� ��������� ����, ��� � ���� ������� ��?
	if(Npc_IsDead(BAU_100_DS2P_KADAR))
	{
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_03");	//������, ����� ����� �����, � ���� �� ����, ��� ����� ������� �� ���������� � ������ �������. ������ ��� ���� ��� �����������.
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_04");	//��� ������ ������� � �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_05");	//��� ���� ����� ���� �������� � ������.
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_06");	//��, ��� ����� �������, ������ ����� ������� ������������ �� ���� ��������, ���������� �� �������, � ����� �� ���� ������ ��������� � �������.
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_07");	//�� �����, ��� �� ���� ���� �� ��������� ������ ���� ������, �� ��� �����, ��� ������. ���� ���?! (���������)
	};
};

//----
//���������� ����� ����������� ("��� ���� �����?")
//----
instance DIA_Tamir_TeachMeTrophiesAnimals(C_Info)	//����� ���� �������� ������ � ��������.	nr = 14;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 14;
	permanent = FALSE;
	condition = DIA_Tamir_TeachMeTrophiesAnimals_condition;	
	information = DIA_Tamir_TeachMeTrophiesAnimals_info;
	description = "����� ���� �������� ������ � ��������.";
};
func int DIA_Tamir_TeachMeTrophiesAnimals_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_TeachMeTrophiesAnimals_info()
{
	AI_Output(other,self,"DIA_Tamir_TeachMeTrophiesAnimals_15_00");	//����� ���� �������� ������ � ��������.
	AI_Output(self,other,"DIA_Tamir_TeachMeTrophiesAnimals_12_00");	//���� � ���� ���� ������, �� � ����� � ��������.
	B_DSG_Log_OpenClose(TOPIC_BauerTeacher,LOG_NOTE,-1,"������� ����� ���� �������� ��������.");
	/*������������ � ��������� ����� � ��������� �������*/
};
//***********************************************************************************************************
//----------------------------------����� � �������----------------------------------------------------------
//***********************************************************************************************************

//----
//���������� ����� ����������� ("��� ���� �����?")
//----
instance DIA_Tamir_WhyDidUWantToAttackMe(C_Info)	//������ �� ����� ������� �� ����?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_WhyDidUWantToAttackMe_condition;	
	information = DIA_Tamir_WhyDidUWantToAttackMe_info;
	description = "������ �� ����� ������� �� ����?";
};
func int DIA_Tamir_WhyDidUWantToAttackMe_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_WhyDidUWantToAttackMe_info()
{
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_00");	//������ �� ����� ������� �� ����?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_00");	//������ ��� �����, ��� �� ���� �� �������.
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_01");	//��� � �����. �� �����, ��� �� ������ ��� �� ���� �������� �� ��������, ���� ���� �� �����.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_01");	//(��������) ��, �� ����. � � ������ ������� � ��� ������ ��������������� �� ���� �� ��� ���� �����.
	
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_02");	//���-�� ���������?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_02");	//� �� �� ������?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_03");	//������� � �����, ������ ���������� ���� ��������, ����� ������� � ��������� ��� �� �������.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_04");	//������� ������ ���� �� ���. �������, ��� ����� ������. � �������� ��� ������������ �� ����� � �������� ������� ����, �������, �� ������� ������� ��� ��� ������.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_05");	//�������� ���?! �� ������ � ��� ��������?!
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_06");	//(�����) � �� ��� ��� � ������ �� ����������!
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_07");	//��� ������ ���� � ���� � ����� ���������� ���, ����� ������, ��� ������ ������ �� ��� ������� �� ����.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_08");	//�� �� �� ������-�� ��������� ����, ���� ��������, ��� ���� � �� ���������, �� �� ������ � ������ � ����� ��������� ������ ����� �� ����� ������.
	
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_03");	//� �� �����, ��� � ������ �� ���� � ��������� ���������������?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_09");	//��� � ����. ������ � �� ����, ��� ������.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_10");	//�� �����, ��� ������ ������� �� �����, �� �����?!
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_11");	//���� � ��������? ���� ���, � ������, �� ����� ��� ����.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_12");	//� �����, � � ����������� ���������.
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_04");	//����� ���� ����� ���������� ���� �������� � ������� �����������?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_13");	//����� ��� � ������� ������� ���� ��������? �� �� ���!
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_Start);
};
//
var int Tamir_First_Choice;		//����� �������� ������� (������ - ����� �� ����� � �������)
var int Tamir_Second_Choice;	//����� �������� ������� (/*�������*/)
//----
//���������� ����� ����������� ("������ �� ����� ������� �� ����?") � ���� ����� "����� ������" ��� ���
//----
instance DIA_Tamir_INeedFreshMeatToo(C_Info)	//��� ���� ����� ������ ����.
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_INeedFreshMeatToo_condition;	
	information = DIA_Tamir_INeedFreshMeatToo_info;
	description = "��� ���� ����� ������ ����.";
};
func int DIA_Tamir_INeedFreshMeatToo_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhyDidUWantToAttackMe) && (MIS_DS2P_TamirChoice == LOG_Running))	{	return TRUE;};	
};
func void DIA_Tamir_INeedFreshMeatToo_info()
{
	AI_Output(other,self,"DIA_Tamir_INeedFreshMeatToo_15_00");	//��� ���� ����� ������ ����.
	AI_Output(other,self,"DIA_Tamir_INeedFreshMeatToo_15_01");	//� ���� ����������� � ������� ������������. � �� � ������� ������� � ������� ������ ���.
	AI_Output(other,self,"DIA_Tamir_INeedFreshMeatToo_15_02");	//��������� ����� ������ � ��� � ������ ���� �����.
	AI_Output(self,other,"DIA_Tamir_INeedFreshMeatToo_12_00");	//(���������) ��... �� ����, ���� � ����� � �����, �� ��� ������, ��� � ������� ����, � �� �������� ������ �������.
	AI_Output(self,other,"DIA_Tamir_INeedFreshMeatToo_12_01");	//��� ����� ��� ����� ����� �������. �������! �����, ��� ������ �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_HuntTogether);
	Tamir_First_Choice = TRUE;
};
//----
//���������� ����� ����������� ("��� ���� ����� ������ ����.") � ���� ����� "����� ������" ��� ���.
//----
instance DIA_Tamir_LetsGoHunting(C_Info)		//������ ����������.
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_LetsGoHunting_condition;	
	information = DIA_Tamir_LetsGoHunting_info;
	description = "������, ����������.";
};
func int DIA_Tamir_LetsGoHunting_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Tamir_INeedFreshMeatToo) && (MIS_DS2P_TamirChoice == LOG_Running))	{	return TRUE;};	
};
func void DIA_Tamir_LetsGoHunting_info()
{
	var int x;x=0;
	AI_Output(other,self,"DIA_Tamir_LetsGoHunting_15_00");	//������, ����������.
	AI_Output(self,other,"DIA_Tamir_LetsGoHunting_12_00");	//������ �� ����.
	B_StartOtherRoutine(self,"HUNTING");
	AI_StopProcessInfos(self);
	x=1;	if(x==1) 	{	B_DSG_Insert_TamirScavengers();	};
};
//----
//���������� ����� ����������� ("������ ����������.") � ���� ����� "����� ������" ��� ���, � ����� >= 9 �����������.
//----
instance DIA_Tamir_MeatIsMoreThanEnough(C_Info)		//�� ���, ������ ���� ����� ��� ����������!
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_MeatIsMoreThanEnough_condition;	
	information = DIA_Tamir_MeatIsMoreThanEnough_info;
	important = TRUE;
};
func int DIA_Tamir_MeatIsMoreThanEnough_condition()
{	
	if((MIS_DS2P_TamirChoice == LOG_Running) && (Tamir_ScavengersDie_Count >= 9))	{	return TRUE;};	
};
func void DIA_Tamir_MeatIsMoreThanEnough_info()
{
	var int x;x=0;
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_00");	//�� ���, ������ ���� ����� ��� ����������!
	AI_Output(other,self,"DIA_Tamir_MeatIsMoreThanEnough_15_00");	//��, ����� ���.
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_01");	//������! (��������������) �� ����� �� ����.
	AI_Output(other,self,"DIA_Tamir_MeatIsMoreThanEnough_15_01");	//� ��� ��...
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_02");	//(����) ���������� �����?
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_03");	//��� ������� ����� ������ ���� ����� � ����! � �� � ��� �� ������. � ������, ��� �� ���� �����, � ����� ����.
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_04");	//�������� � ���!
	AI_StopProcessInfos(self);
	x=1;	if(x==1) 	{	B_DSG_Insert_TamirWargs();	};
};
//----
//���������� ����� ����������� ("�� ���, ������ ���� ����� ��� ����������!") � ���� ����� "����� ������" ��� ���, � ����� >= 9 ������.
//----
instance DIA_Tamir_ThatWasBattle(C_Info)		//��� ��� ���� �����!
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_ThatWasBattle_condition;	
	information = DIA_Tamir_ThatWasBattle_info;
	important = TRUE;
};
func int DIA_Tamir_ThatWasBattle_condition()
{	
	if((MIS_DS2P_TamirChoice == LOG_Running) && (Tamir_WargsDie_Count >= 9))	{	return TRUE;};	
};
func void DIA_Tamir_ThatWasBattle_info()
{
	B_GivePlayerXP(XP_MIS_TamirChoice_01);
	AI_Output(self,other,"DIA_Tamir_ThatWasBattle_12_00");	//��� ��� ���� �����!
	AI_Output(self,other,"DIA_Tamir_ThatWasBattle_12_01");	//������, ��� ����� ���� ��������� �� �����������, �� �� �� ���� ����������.
	AI_Output(self,other,"DIA_Tamir_ThatWasBattle_12_02");	//������� ��� �� ����� ������ ���������, ��� �� �����. ��� ���� � �� �� ���������.
	AI_Output(self,other,"DIA_Tamir_ThatWasBattle_12_03");	//�����, ������������ � �������.
	AI_StopProcessInfos(self);
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_WargAttack);
	B_StartOtherRoutine(self,"START");
};
//----
//���������� ����� ����������� ("��� ��� ���� �����!") � ���� ����� � �������.
//----
instance DIA_Tamir_IHaveFavorToAskU(C_Info)		//� ���� � ���� ����� �������.
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_IHaveFavorToAskU_condition;	
	information = DIA_Tamir_IHaveFavorToAskU_info;
	important = TRUE;
};
func int DIA_Tamir_IHaveFavorToAskU_condition()
{	
	if((MIS_DS2P_TamirChoice == LOG_Running) && Npc_KnowsInfo(other,DIA_Tamir_ThatWasBattle) && C_Npc_GetDistToWP(self,"",1000,less))	{	return TRUE;};	
};
func void DIA_Tamir_IHaveFavorToAskU_info()
{
	AI_Output(self,other,"DIA_Tamir_IHaveFavorToAskU_12_00");	//� ���� � ���� ����� �������.
	AI_Output(other,self,"DIA_Tamir_IHaveFavorToAskU_15_00");	//� ���� ���� �����.
	AI_Output(self,other,"DIA_Tamir_IHaveFavorToAskU_12_01");	//��, �� ����. �� ��� �� �� ������� ��� ���� ����� ������? � �� �������� � �����!
	AI_Output(other,self,"DIA_Tamir_IHaveFavorToAskU_15_01");	//(�������) �����, ������!
	AI_PlayAni(other,"T_FORGETIT");
	AI_Output(self,other,"DIA_Tamir_IHaveFavorToAskU_12_02");	//������� ����!
	AI_StopProcessInfos(self);
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_Meat4Symon);
};

//NS - 30/07/2013----------------------------
// "� ����� ������� ����."		nr=20
// ������� ������� ���� (+����)
instance DIA_Tamir_GaveMeatToSymon(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 20;
	condition = DIA_Tamir_GaveMeatToSymon_condition;	
	information = DIA_Tamir_GaveMeatToSymon_info;
	description = "� ����� ������� ����.";
};
func int DIA_Tamir_GaveMeatToSymon_condition()
{
	if ((MIS_DS2P_TamirChoice == LOG_Running) && (Npc_KnowsInfo(other,DIA_Symon_MeatFromTamir)))
	{	return TRUE;	};
};
func void DIA_Tamir_GaveMeatToSymon_info()
{
	AI_Output(other,self,"DIA_Tamir_GaveMeatToSymon_15_00");	//� ����� ������� ����.
	//(+����)
	B_GivePlayerXP(XP_MIS_TamirChoice_Success);
		AI_Output(self,other,"DIA_Tamir_GaveMeatToSymon_12_01");	//�������! � ��� �� ������?
	AI_Output(other,self,"DIA_Tamir_GaveMeatToSymon_15_02");	//�� ��������� �������, ��� ���� �� ����� ���������� � ����. �����, � ��������� ��� �� � ���� ����� �� �����.
		AI_Output(self,other,"DIA_Tamir_GaveMeatToSymon_12_03");	//� �� ��� �������! �� ����� ����� ���, ������� � ���� ���� �������� ���� ���������� ������� ���������. ����� �� �����.
	Info_ClearChoices(DIA_Tamir_GaveMeatToSymon);
	//���� ���������, ���� ��� �� �����
	var int KnownTalents;
	if (!player_talent_takeanimaltrophy[TROPHY_BFSting])	{
		Info_AddChoice(DIA_Tamir_GaveMeatToSymon,TXT_DS_TROPHYS_6,DIA_Tamir_GaveMeatToSymon_BFSting);
		KnownTalents += 1;
	};
	if (!player_talent_takeanimaltrophy[TROPHY_BFWing])	{
		Info_AddChoice(DIA_Tamir_GaveMeatToSymon,TXT_DS_TROPHYS_7,DIA_Tamir_GaveMeatToSymon_BFWing);
		KnownTalents += 1;
	};
	if (!player_talent_takeanimaltrophy[TROPHY_DragonBlood])	{
		Info_AddChoice(DIA_Tamir_GaveMeatToSymon,TXT_DS_TROPHYS_12,DIA_Tamir_GaveMeatToSymon_Blood);
		KnownTalents += 1;
	};
	// ���� ��� ��� ��������
	if (KnownTalents == 0)	{
		Info_AddChoice(DIA_Tamir_GaveMeatToSymon,"� ��� ��� ����.",DIA_Tamir_GaveMeatToSymon_Nothing);
	};
};
func void DIA_Tamir_GaveMeatToSymon_BFSting()
{
	B_TeachPlayerTalentTakeAnimalTrophy_LogEntry(other,TROPHY_BFSting);
	//������ � �������� "����� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TamirChoice_Success);
};
func void DIA_Tamir_GaveMeatToSymon_BFWing()
{
	B_TeachPlayerTalentTakeAnimalTrophy_LogEntry(other,TROPHY_BFWing);
	//������ � �������� "����� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TamirChoice_Success);
};
func void DIA_Tamir_GaveMeatToSymon_Blood()
{
	B_TeachPlayerTalentTakeAnimalTrophy_LogEntry(other,TROPHY_DragonBlood);
	//������ � �������� "����� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TamirChoice_Success);
};
func void DIA_Tamir_GaveMeatToSymon_Nothing()
{
	var int x;
	AI_Output(other,self,"DIA_Tamir_GaveMeatToSymon_Nothing_15_00");	//� ��� ��� ����.
		AI_Output(self,other,"DIA_Tamir_GaveMeatToSymon_Nothing_12_01");	//����, ��� �� ���� ���� ������. ������ ����� ���� ������� �����. ��� ���, ��� � ���� ���� ������.
	//���� 50 �����
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItRw_Arrow,50);
	};
	//������ � �������� "����� ������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TamirChoice_Success);
};



//***********************************************************************************************************
//--------------------------����� ����� � �������----------------------------------------------------------
//***********************************************************************************************************


//----
//���������� ����� ����� ����������� ("��� ���� �����?") � ������ ������ "���� � ����"
//----
instance DIA_Tamir_WhereCanIFindGustav(C_Info)	//��� ��� ����� �������?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Tamir_WhereCanIFindGustav_condition;	
	information = DIA_Tamir_WhereCanIFindGustav_info;
	description = "��� ��� ����� �������?";
};
func int DIA_Tamir_WhereCanIFindGustav_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && (MIS_DS2P_TerrorInNight == LOG_Running) )	{return TRUE;};	
};
func void DIA_Tamir_WhereCanIFindGustav_info()
{
	AI_Output(other,self,"DIA_Tamir_WhereCanIFindGustav_15_00");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Tamir_WhereCanIFindGustav_12_00");	//� ��������� ��� � ����� ��� �����, ����� ������ ������. ����� ����� � ������� ��� �� ����.
	AI_Output(other,self,"DIA_Tamir_WhereCanIFindGustav_15_01");	//����� �� ������, ��� �� ����� ����?
	AI_Output(self,other,"DIA_Tamir_WhereCanIFindGustav_12_01");	//��������, �� ���������� � ���� ������ � �����, ������ � ������. �� ��� ������ �������������.
};
//----
//���������� ����� ����� ����������� ("��� ���� �����?")
//----
instance DIA_Tamir_WhereCanIBuyWeaponsAndProvisions(C_Info)	//��� � ���� ������ ������ � ��������?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_condition;	
	information = DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_info;
	description = "��� � ���� ������ ������ � ��������?";
};
func int DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && (MIS_DS2P_TerrorInNight == LOG_Running) )	{return TRUE;};	
};
func void DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_info()
{
	AI_Output(other,self,"DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_15_00");	//��� � � ������� ���� ������ ������ � ��������?
	AI_Output(self,other,"DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_12_00");	//�������� ����� ������ � ����� � �������, ����� � �������� � �����.
	AI_Output(self,other,"DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_12_01");	//� ��� ������ � ��� ����� �� �������, ����� �������. � ��� � ������� ���. �������� ���������� � ��������.
};

//----
//���������� ����� ����������� ("��� ���� �����?") , ���� ���� ����� ����� ������� � ���� ��� �� ������� ���������� � �����
//----
instance DIA_Tamir_ImLookingForGaron(C_Info)	//�� �� ����� ������? 
{
	npc = BAU_105_DS2P_Tamir;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Tamir_ImLookingForGaron_condition;	
	information = DIA_Tamir_ImLookingForGaron_info;
	description = "�� �� ����� ������? ";
};
func int DIA_Tamir_ImLookingForGaron_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && (MIS_DS2P_GrandsonOfFisherman == LOG_Running) && !Npc_KnowsInfo(other,DIA_Maria_AboutGaron))
	{return TRUE;};	
};
func void DIA_Tamir_ImLookingForGaron_info()
{
	AI_Output(other,self,"DIA_Tamir_ImLookingForGaron_15_00");	//�� �� ����� ������?
	AI_Output(self,other,"DIA_Tamir_ImLookingForGaron_12_00");	//�������, ���� ���� ����� �� �������� ����. ������ � � ��� ������ �� ����.
};
//----
//���������� ����� ����� ����������� ("��� ���� �����?") � ������ ������ "������� �����"
//----
func void Tamir_Give_Snares_GG()
{
	AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_02");	//��� ���� �������� ��������. ���� ��������� ������ ���������� �� � ����.
	B_GiveInvItems(self,other,ITMI_DS2P_SnaresForHunting_Empty,3);
	B_DSG_Log_OpenClose(TOPIC_DS2P_DangerousHunting,LOG_MISSION,LOG_Running,TOPIC_DS2P_DangerousHunting_SnaresGot);
};
//---
instance DIA_Tamir_DoUHaveSnare(C_Info)	//� ���� ���� �����?		nr=12;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 12;
	permanent = FALSE;
	condition = DIA_Tamir_DoUHaveSnare_condition;	
	information = DIA_Tamir_DoUHaveSnare_info;
	description = "� ���� ���� �����?";
};
func int DIA_Tamir_DoUHaveSnare_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && (MIS_DS2P_DangerousHunting == LOG_Running) )	{return TRUE;};	
};
func void DIA_Tamir_DoUHaveSnare_info()
{
	AI_Output(other,self,"DIA_Tamir_DoUHaveSnare_15_00");	//� ���� ���� �����?
	AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_00");	//����, � ���� �����?
	AI_Output(other,self,"DIA_Tamir_DoUHaveSnare_15_01");	//����� �������� ���� ������� ��� ��������� ��������.
	if(MIS_DS2P_TamirChoice == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_01");	//�� ����� ����� ���, ������� � ����� ���� ����� ������ ���. 
		Tamir_Give_Snares_GG();
	}
	else
	{
		AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_03");	//��� ����� ���� ����. ���� � ���� ���� 300 �������, � �������� � ����� ����� �������. �� ����� �� �����.
		Tamir_Trade_Snare = TRUE;
	};
};
//----
//���������� ����� ����� ����������� ("� ���� ���� �����?") � ������ ������ "������� �����" � ���� ���� �������� �����
//----
var int Tamir_Give_Snares;
instance DIA_Tamir_ThatsGold4Snares(C_Info)	//��� ������ �� �����.		nr=12;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 12;
	permanent = TRUE;
	condition = DIA_Tamir_ThatsGold4Snares_condition;	
	information = DIA_Tamir_ThatsGold4Snares_info;
	description = "��� ������ �� �����.";
};
func int DIA_Tamir_ThatsGold4Snares_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_DoUHaveSnare) && (MIS_DS2P_DangerousHunting == LOG_Running) && Tamir_Trade_Snare && !Tamir_Give_Snares)	
	{return TRUE;};	
};
func void DIA_Tamir_ThatsGold4Snares_info()
{
	AI_Output(other,self,"DIA_Tamir_ThatsGold4Snares_15_00");	//��� ������ �� �����.
	if(MIS_DS2P_TamirChoice == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_01");	//�� ����� ����� ���, ������� � ����� ���� ����� ������ ���. 
		Tamir_Give_Snares_GG();
		Tamir_Give_Snares = TRUE;
	}
	else
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,300))
		{
			AI_Output(self,other,"DIA_Tamir_ThatsGold4Snares_12_00");	//������, ����� ���, ��� ���� �����. 
			Tamir_Give_Snares_GG();
			Tamir_Give_Snares = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Tamir_ThatsGold4Snares_12_01");	//� �� ������ �� ����� ������. ������� ����������� �����.
		};
	};
};
//////////////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////
//----------------------
//���������� ����� ����������� ("��� ���� �����?") � ���� ����� �� ����� "����� �������, ��� � ���� �������� ��������"
//----------------------
instance DIA_Tamir_DidUWantToMarryNikki(C_Info)	//�� ����� �������� �� �����?  //nr = 13;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 13;
	permanent = FALSE;
	condition = DIA_Tamir_DidUWantToMarryNikki_condition;	
	information = DIA_Tamir_DidUWantToMarryNikki_info;
	description = "�� ����� �������� �� �����?";
};
func int DIA_Tamir_DidUWantToMarryNikki_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && Npc_KnowsInfo(other,DIA_Nikki_TamirSaidThatUHaveBadTemper))
	{	return TRUE;};	
};
func void DIA_Tamir_DidUWantToMarryNikki_info()
{
	AI_Output(other,self,"DIA_Tamir_DidUWantToMarryNikki_15_00");	//�� ����� �������� �� �����?
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_01");	//� ����� �� �����? ����� ��� ���� ����� ��������� �� ��, ��� � �������� �� ������ ��� ��� �� ������ �� �����?!
	
	AI_Output(other,self,"DIA_Tamir_DidUWantToMarryNikki_15_02");	//�� ��������?
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_03");	//����� ���!
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_04");	//�� �������, ������ ��� ����, � �� ���� ����������� ����� ���� ������ � ��� �� ��������?
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_05");	//�� ������, ��� ��� � ��� ���� �������� ����, ������� �������� � ����� �� �������. ����� �� ��� ��� ������ ���, ����� ������� ��������, � ��� �� ���� ������� ����.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_06");	//�� �����-�� ��� ���� �����-����������, ����� ������� �� ��� �� ��������, � �� ��������� ���� ���� � ������� ��� ������ ��� �������, ��� ��� ����.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_07");	//�������� ����, ����� ���������. ���� �������, ���, �������, ����������, ��������� � ������. �� ��-�� �� ������, ��������, ��� ����� ���-�� �� ��, �� �� ������ �� ����� �������.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_08");	//���-�� ������� �� � ����� ������ ���������, ��� ��� � ��� ����������.
	
	AI_Output(other,self,"DIA_Tamir_DidUWantToMarryNikki_15_09");	//� ��� �� �� �������?
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_10");	//��� �������, ������� �� ����.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_11");	//����� ���-�� ��������� ������ ������ � ���������, �� ����-�-���� ������.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_12");	//�������� � ��� �� ����, ����� ��� �����������, ������� ��� �������, ������, ������ � ���� ������ � ����������.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_13");	//���� ������� �� ���� ��� ��������� �����. �� ����� ������, ��� � ��� �������� ���, � ������ ������ �����������. ����� �� �� �� �����������.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_14");	//����� ����� ������� ���, ������� � ������ ����, ��� �������� ��� ����, ����� �������� ������, �����������, ������ ������ ������� �� �����.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_15");	//��� ���� � ������, ��� ���-�� ������ �� ��������, �������, ��� ������ �������� ���� �� �������������.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_16");	//����� ���������� ���, ��� ���������, ���� �� ����-������ ���������� �� ���������.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_17");	//���������� ������, �� � ����� ����� �������� �������, ������� ������ ����������� �� �����. �� ��� ��� �� ���.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_18");	//����� ���� ���� ���� ���������� �� ����� � �� ��������.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_19");	//�����, �������, ������ � ������, ����� � ����� ����� ����������� �������, � ������ �� ������ ��������� �� ��������.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_20");	//�� ���� ��� ������� ���������, �� � ���� �� ��� � �� �����, ���� �������� ����� ���� ���. 
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_21");	//� �����, � ����� ��� ������, ��� ��� ��� ��� ���������, ��, ���, ������������� � ���� ���.
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_Running,TOPIC_DS2P_YouAreWitch_Start);
};
//----------------------
//���������� ����� ����������� ("�� ����� �������� �� �����?")
//----------------------
instance DIA_Tamir_DidUSearchEverywhereInForest(C_Info)	//�� ��������� ���� ���?  //nr = 13;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 13;
	permanent = FALSE;
	condition = DIA_Tamir_DidUSearchEverywhereInForest_condition;	
	information = DIA_Tamir_DidUSearchEverywhereInForest_info;
	description = "�� ��������� ���� ���?";
};
func int DIA_Tamir_DidUSearchEverywhereInForest_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_DidUWantToMarryNikki)){	return TRUE;};	};
func void DIA_Tamir_DidUSearchEverywhereInForest_info()
{
		AI_Output(other,self,"DIA_Tamir_DidUSearchEverywhereInForest_15_00");	//�� ��������� ���� ���?
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_00");	//���, �������. �� ��� �� ������� �� �� �����, �� �������.
	
		AI_Output(other,self,"DIA_Tamir_DidUSearchEverywhereInForest_15_01");	//��� �� ��� �� ������?
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_01");	//�� ������ ����� ���� ����? �� ������ ��� �� ���� ������. ���� ���� ��� ���� � ����, �� ��� �������� ��� ���� �����.
	
		AI_Output(other,self,"DIA_Tamir_DidUSearchEverywhereInForest_15_02");	//����� ����, � ���� ���� �����-������ ����, �� ������� � �� ���� ��� ��������?
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_02");	//��� ��������...
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_03");	//�� ��, �������!. �� ������� �� ����������� � ����� ������ � ������ ���������� � ������� ������ ����.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_04");	//��� ��� �������, �� ��� ���� � ������ � ������������, ����� � ��������� ��� �������� � ��������.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_05");	//�� ���������� ��� �� �������� ���������� �� �������. ���� ����� ����� ���� � ������ �����-������ ���� ����� ���������.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_06");	//��, ���, ����� �� ������� �������.
	
		AI_Output(other,self,"DIA_Tamir_DidUSearchEverywhereInForest_15_03");	//������, �������� � ������. � �������� ����� ��.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_07");	//���� ������ ��� �����, �� � �� ���� ������ ���� �� ������, ���� � �����-������ ������, ��� ����� ������� ������.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_08");	//���� � ��������, � ����� �� ��� ���, ��, ������ �����, �� ����� � ���� ��������� ��� ��� �������� �������� �����, ����� ����� ������.
	
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_Running,TOPIC_DS2P_YouAreWitch_BodySearch);
};
//----------------------
//���������� ����� ����������� ("�� ��������� ���� ���?")
//----------------------
instance DIA_Tamir_WhereIsSwamp(C_Info)	//��� ��������� ������?  //nr = 13;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 13;
	permanent = FALSE;
	condition = DIA_Tamir_WhereIsSwamp_condition;	
	information = DIA_Tamir_WhereIsSwamp_info;
	description = "��� ��������� ������?";
};
func int DIA_Tamir_WhereIsSwamp_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_DidUWantToMarryNikki)){	return TRUE;};	};
func void DIA_Tamir_WhereIsSwamp_info()
{
	//UNFINISHED
	AI_Output(other,self,"DIA_Tamir_WhereIsSwamp_15_00");	//��� ��������� ������?
	AI_Output(self,other,"DIA_Tamir_WhereIsSwamp_12_00");	// /*Redleha: ��� ��������� ���-�� � ���-��. ���� ���������*/
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_Running,TOPIC_DS2P_YouAreWitch_Swamp);
};
//-----------------------------------------------------------------------------------------------------------
//���������� ����� ����������� ("�� ��������� ���� ���?")
//----------------------
//� StoryGlobals:
		//var int DIA_Tamir_WithRegardToNikki_CHOICE;		//����� �� � �������: ������, ��� ����� ����� ���� ��� ��� "�������"
			//const int NIKKI_IS_BAD_WOMAN = 1;	//����� ������
				//const int NIKKI_IS_GOOD_WOMAN = 2;	//����� �������
var int DIA_Tamir_WithRegardToNikki_KnowsAboutRing;
var int DIA_Tamir_WithRegardToNikki_KnowsAboutSextant;
instance DIA_Tamir_WithRegardToNikki(C_Info)	//�� ������ �����...  //nr = 130;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 130;
	permanent = TRUE;
	condition = DIA_Tamir_WithRegardToNikki_condition;	
	information = DIA_Tamir_WithRegardToNikki_info;
	description = "�� ������ �����...";
};
func int DIA_Tamir_WithRegardToNikki_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_DidUWantToMarryNikki) && !DIA_Tamir_WithRegardToNikki_CHOICE)
	{	return TRUE;};	
};
func void DIA_Tamir_WithRegardToNikki_info()
{
	Info_ClearChoices(DIA_Tamir_WithRegardToNikki);
	if(DIA_Tamir_WithRegardToNikki_KnowsAboutRing && DIA_Tamir_WithRegardToNikki_KnowsAboutSextant)
	{
		Info_AddChoice(DIA_Tamir_WithRegardToNikki,"� �����, ����� �� �������.",DIA_Tamir_WithRegardToNikki_GoodWoman);
		Info_AddChoice(DIA_Tamir_WithRegardToNikki,"� ������, ��� ����� ����� ����.",DIA_Tamir_WithRegardToNikki_BadWoman);
	}
	else
	{
		Info_AddChoice(DIA_Tamir_WithRegardToNikki,"���� ������...",DIA_Tamir_WithRegardToNikki_Nothing);
		//���� ���� ������ ��������
		if(!DIA_Tamir_WithRegardToNikki_KnowsAboutSextant && Npc_HasItems(other,ItMi_Sextant) && !Npc_HasItems(other,ItRi_DS2P_Kolo))
		{
			Info_AddChoice(DIA_Tamir_WithRegardToNikki,"� ����� ��������.",DIA_Tamir_WithRegardToNikki_FindSextant);
		};
		//���� ���� ������ ������
		if(!DIA_Tamir_WithRegardToNikki_KnowsAboutRing && Npc_HasItems(other,ItRi_DS2P_Kolo) && !Npc_HasItems(other,ItMi_Sextant))
		{
			Info_AddChoice(DIA_Tamir_WithRegardToNikki,"� ����� ������ ���� ����.",DIA_Tamir_WithRegardToNikki_FindRing);
		};
		//���� ���� � ��������, � ������
		if(!(DIA_Tamir_WithRegardToNikki_KnowsAboutRing && DIA_Tamir_WithRegardToNikki_KnowsAboutSextant) && Npc_HasItems(other,ItRi_DS2P_Kolo) && Npc_HasItems(other,ItMi_Sextant))
		{
			Info_AddChoice(DIA_Tamir_WithRegardToNikki,"� ����� ������ ���� ���� � ��������.",DIA_Tamir_WithRegardToNikki_FindAll);
		};
	};
};
func void DIA_Tamir_WithRegardToNikki_Nothing()
{
	Info_ClearChoices(DIA_Tamir_WithRegardToNikki);
};
func void DIA_Tamir_WithRegardToNikki_FindSextant()
{
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindSextant_15_00");	//� ����� ��������.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindSextant_12_00");	//��� �� ����� ���?
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindSextant_15_01");	//�� ������ ����� ������ �� �������. �������� � ��� ����������.
	if(!DIA_Tamir_WithRegardToNikki_KnowsAboutRing)
	{
		AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindSextant_12_01");	//��... ����� �� ����� ���������� � ��������. ����� ������. ���� � ����, ��, ������ �����, ��� � �����.
	};
	B_GivePlayerXP(XP_MIS_YouAreWitch_01);
	DIA_Tamir_WithRegardToNikki_KnowsAboutSextant = TRUE;
	if(!DIA_Tamir_WithRegardToNikki_KnowsAboutRing)
	{
		Info_ClearChoices(DIA_Tamir_WithRegardToNikki);
	}
	else
	{
		DIA_Tamir_WithRegardToNikki_info();
	};
};
func void DIA_Tamir_WithRegardToNikki_FindRing()
{
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindRing_15_00");	//� ����� ������ ���� ����.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_00");	//� ��� ��� ����?
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindRing_15_01");	//� ������� � ���� �����.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_01");	//���, � ��� � ����. ��� ��� ��� �����!
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindRing_15_02");	//��� ������ �� ������. �� ��� ������ �������� �� ������.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_02");	//��, ��������, �� ����.
	if(!DIA_Tamir_WithRegardToNikki_KnowsAboutSextant)
	{
		AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_03");	//����� ����� ��������.
	};
	B_GivePlayerXP(XP_MIS_YouAreWitch_02);
	DIA_Tamir_WithRegardToNikki_KnowsAboutRing = TRUE;
	if(!DIA_Tamir_WithRegardToNikki_KnowsAboutSextant)
	{
		Info_ClearChoices(DIA_Tamir_WithRegardToNikki);
	}
	else
	{
		DIA_Tamir_WithRegardToNikki_info();
	};
};
func void DIA_Tamir_WithRegardToNikki_FindAll()
{
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindAll_15_00");	//� ����� ������ ���� ���� � ��������.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindAll_12_00");	//� ��� �� ��� ����?
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindAll_15_01");	//�������� - �� ������ ����� ������ �� �������. �������� � ��� ����������.
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindAll_15_02");	//������ - � ������� � ���� �����.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_01");	//���, � ��� � ����. ��� ��� ��� �����!
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindRing_15_02");	//��� ������ �� ������. �� ��� ������ �������� �� ������.
	DIA_Tamir_WithRegardToNikki_KnowsAboutRing = TRUE;
	DIA_Tamir_WithRegardToNikki_KnowsAboutSextant = TRUE;
	DIA_Tamir_WithRegardToNikki_info();
};
func void DIA_Tamir_WithRegardToNikki_GoodWoman()
{
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_GoodWoman_15_00");	//������, ����� �� ��������. ���� ������� ���� �� �������, � ����� ���� �� ������� �� ������ ����.
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_GoodWoman_15_01");	//�� ��� �������, ��� ���� ��� ��� ��� �� �����.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_GoodWoman_12_00");	//������ �� ����. � ��� ������ �� ��� ����. (�������) � ���������� ���� �� ��, ��� ������� ������.
	B_GiveInvItems(self,other,ItBe_DS2P_Sniper,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_YouAreWitch_SuccessInnocent);
	DIA_Tamir_WithRegardToNikki_CHOICE = NIKKI_IS_GOOD_WOMAN;
};
func void DIA_Tamir_WithRegardToNikki_BadWoman()
{
	B_StartOtherRoutine(BAU_107_DS2P_Nikki,"WAIT");
	AI_Teleport(BAU_107_DS2P_Nikki,"");
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_BadWoman_15_00");	//� ������, ��� ����� ����� ����.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_00");	//� ���� ��������� � ���� ������, �� � ��� ���������� ��� �������������.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_01");	//��, ��� ��� ������ ������ ����, ������ �� ������. ����� ����, ���� ��� ������� ���.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_02");	//����� ���-�� ����� ������.
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_BadWoman_15_01");	//��� �� �����������?
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_03");	//� ���� ���� ����!
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_04");	//���, ���� �� ������, ��� ���� ���? ��� �� ������ ��� �������� � ������� � ���� ��.
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_BadWoman_15_02");	//� ��� ��� ����?
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_05");	//�������, �����!
	DIA_Tamir_WithRegardToNikki_CHOICE = NIKKI_IS_BAD_WOMAN;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"GoToNikki");
};
//
//	������ ���������� �����: �������� "�����, �� ������ ���!"
//
instance DIA_Tamir_ShitShitOMG(C_Info)	//	"����! ����! ������ �� ������!"  //nr = 130
{
	npc = BAU_105_DS2P_Tamir;
	nr = 130;
	permanent = FALSE;
	condition = DIA_Tamir_ShitShitOMG_condition;	
	information = DIA_Tamir_ShitShitOMG_info;
	important = true;
};
func int DIA_Tamir_ShitShitOMG_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_KoloHasReturned)){	return TRUE;};	};
func void DIA_Tamir_ShitShitOMG_info()
{
	AI_Output(self,other,"DIA_Tamir_ShitShitOMG_12_00");	//����! ����! ������ �� ������!
	AI_Output(other,self,"DIA_Tamir_ShitShitOMG_15_00");	//�� ���� ��� �����. �� ������ ������ �� ������ � ���� �������.
	AI_Output(self,other,"DIA_Tamir_ShitShitOMG_12_01");	//���� ���� ������ ���������� �� ������� ������!
	AI_Output(other,self,"DIA_Tamir_ShitShitOMG_15_01");	//����� ���� ��������.
	AI_Output(self,other,"DIA_Tamir_ShitShitOMG_12_02");	//�� ����. ������� ���� �� ������, � ����� ���� ��, ��� �� ������. 
	AI_Output(self,other,"DIA_Tamir_ShitShitOMG_12_03");	//���, ����� ���� �������� �������.
	B_GiveInvItem_red(self,other,ItRw_DS2P_Bow_Tamir,1,34);
	B_GiveInvItem_red(self,other,ItMi_Gold,1,37);
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_YouAreWitch_SuccessGuilty);
	AI_StopProcessInfos(self);
};



//NS - 27/06/2013 ===========
// �� ������ "��� ����� ��� ������?" 	nr=101
//===========================

instance DIA_Tamir_AboutStolenIron(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 101;
	condition = DIA_Tamir_AboutStolenIron_condition;	
	information = DIA_Tamir_AboutStolenIron_info;
	description = "�� �� ����� ������ ���������������?";
};
func int DIA_Tamir_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Tamir_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Tamir_AboutStolenIron_15_00");	//�� �� ����� ������ ���������������?
		AI_Output(self,other,"DIA_Tamir_AboutStolenIron_12_01");	//�� � ���?
	AI_Output(other,self,"DIA_Tamir_AboutStolenIron_15_02");	//����� ���-�� ����� ��� �������� ���� �� �������. �� ���-������ ������ �� ����?
		AI_Output(self,other,"DIA_Tamir_AboutStolenIron_12_03");	//��������� ��� ���. ��� ��� ����� ������� �� ����� ������?!
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 27/06/2013 ======================================================
// �� ������ "������ ��������"
//======================================================================

//----------------------------
// ��� ����� ������?		nr=20
// ����� ������ ������ � ��������� � ������
instance DIA_Tamir_WhereGetStone4Mill(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 20;
	condition = DIA_Tamir_WhereGetStone4Mill_condition;	
	information = DIA_Tamir_WhereGetStone4Mill_info;
	description = "�� �� ������, ��� �� ������� ����� ����� ������?";
};
func int DIA_Tamir_WhereGetStone4Mill_condition()
{
	if ((MIS_DS2P_OldMill == LOG_Running) && (Npc_KnowsInfo(other,DIA_Maria_WhereGetStone4Mill)))
	{	return TRUE;	};
};
func void DIA_Tamir_WhereGetStone4Mill_info()
{
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_00");	//�� �� ������, ��� �� ������� ����� ����� ������? 
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_01");	//���-�� ��������. ���, ������� ���...
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_02");	//����� ����, ��� ����� �������� ��������, � ��� ������� ��� ����������.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_03");	//(���������) ������. ���� ���� �����, ��, �����, ���� ��� ���� �������.
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_04");	//�����������.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_05");	//���� ��� � ��� ���� �������, �� ����� ���������� �������� �� ������ �����������. ��� �����-�� ��� ������� �����.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_06");	//������, � ��������� ��� �������� ������ �����. ��� ���, ���-�� �� � ����� ������ ���������� ����, �� ���� ��, ��������� ��� �������� �����.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_07");	//� �����, ��� ���� ������ ����. �� ������ �� � ���� �����, ��� ��� ���� ����� �� ��� ������� ������ ���� ������.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_08");	//� �� ������ ���� � ����� �� �������. ��� ���� �������� ������. 
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_09");	//� ��� ��� ��������� � ���� ��������?
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_10");	//�� ����� ������! �� ����, ��� � ����� ����������, ��� ��������� ���� �������� � �� ������ �� �����, � �� �������!
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_11");	//�� � �� �� ����� ����� �� �������, ����, �������, ���� ������ �����.
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_12");	//��� ��������� ��� ������?
	// UNFINISHED ������� ���� � ������
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_13");	// /*Redleha: ��� ��������� ���-�� � ���-��. ���� ���������*/

	//������ � �������� "������ ��������" 
	// UNFINISHED ������� ���� � ������
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldMill_CaveTold);
};


//NS - 02/07/2013 ================================================
// ����� ������ ������
//================================================================
instance DIA_Tamir_KadarDead(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 0;
	condition = DIA_Tamir_KadarDead_condition;	
	information = DIA_Tamir_KadarDead_info;
	important = TRUE;
};
func int DIA_Tamir_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Tamir_KadarDead_info()
{
		AI_Output(self,other,"DIA_Tamir_KadarDead_12_00");	//�� ��� ������? ���� ����� � ���� �������. ����� ��� ������� ���������, �� ����� � ���� ��������� ����!
};

// ������������ �� ��������� ����, ����� ���������� ������ "����� ��������� ���������"
// nr = 1

instance DIA_Tamir_AfterEscapedHunters(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 1;
	condition = DIA_Tamir_AfterEscapedHunters_condition;	
	information = DIA_Tamir_AfterEscapedHunters_info;
	permanent = FALSE;
	description = "��������?";
};

func int DIA_Tamir_AfterEscapedHunters_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == LOG_Success) && (EscapedHunters_QuestComplete - Wld_GetDay() >= 1))
	{	
		return TRUE;	
	};
};

func void DIA_Tamir_AfterEscapedHunters_info()
{
	AI_Output(other,self,"DIA_Tamir_AfterEscapedHunters_15_00");	//��������?
	AI_Output(self,other,"DIA_Tamir_AfterEscapedHunters_12_01");	//��� ������, ��� ������ ����� ������� ������ � �������?
	AI_Output(other,self,"DIA_Tamir_AfterEscapedHunters_15_02");	//��, ������.
	AI_Output(self,other,"DIA_Tamir_AfterEscapedHunters_12_03");	//������ ���� �� ���� ������ � ����?
	AI_Output(other,self,"DIA_Tamir_AfterEscapedHunters_15_04");	//� ��� �� �� �������? ����� �� ������ � ���������� �� �� ����. � ��� � ���� ���� ���� ���������.
	AI_Output(self,other,"DIA_Tamir_AfterEscapedHunters_12_05");	//� � �� ������������! � ������ ���, ��� ����� ������� ����������� � ��.
	AI_Output(other,self,"DIA_Tamir_AfterEscapedHunters_15_06");	//������ ����� ��� ���������. ������ �� ������ �����, ���� �� ��������� �����. ���� � ���� �������� � ��������, �� ����������� ������ ����. ����?
	AI_Output(self,other,"DIA_Tamir_AfterEscapedHunters_12_07");	//�����.
	AI_StopProcessInfos(self);
};

