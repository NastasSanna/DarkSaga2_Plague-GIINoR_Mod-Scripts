instance DIA_Vales_EXIT(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Vales_EXIT_condition;	
	information = DIA_Vales_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Vales_EXIT_condition(){	return TRUE;};
func void DIA_Vales_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Vales_Start(C_Info)	//��������� ������ �� ��������
{
	npc = PIR_209_DS2P_Vales;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vales_Start_condition;	
	information = DIA_Vales_Start_info;
	important = TRUE;
};
func int DIA_Vales_Start_condition(){	if(Npc_IsInState(self,ZS_Talk)){return TRUE;}; };
func void DIA_Vales_Start_info()
{	
	AI_Output(self,other,"DIA_Vales_Start_13_00");	//� �-���� �������� ��-�-�-�����! �-�����, ����� �� �-����� ��-�� ����. (������ �������)
	AI_Output(other,self,"DIA_Vales_Start_15_00");	//�����? � ����� ��� ������� �� ����?
	AI_Output(self,other,"DIA_Vales_Start_13_01");	//����? ���, ���� �-�-�-���������� �������� ����� ���� �-�-������ ��������. ��������� � ��� ���� ����!
	AI_Output(self,other,"DIA_Vales_Start_13_02");	//���� ���� ��-�-������ � ��� �����������, ��� ���� ����� - �� ��-�-�-����� ��� �-�������, ����� ������ �-�-�-������� ������ � �-�����!
};
//----
//���������� ����� ����������
//----
instance DIA_Vales_WhatIsYourName(C_Info)	//��� ���� �����?
{
	npc = PIR_209_DS2P_Vales;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Vales_WhatIsYourName_condition;	
	information = DIA_Vales_WhatIsYourName_info;
	description = "��� ���� �����?";
};
func int DIA_Vales_WhatIsYourName_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_Start)){return TRUE;}; };
func void DIA_Vales_WhatIsYourName_info()
{	
	AI_Output(other,self,"DIA_Vales_WhatIsYourName_15_00");	//��� ���� �����?
	AI_Output(self,other,"DIA_Vales_WhatIsYourName_13_00");	//�-������ �������� ���� �����. ��� ��� ��-��������� �� ��� � �-�������.
	AI_Output(other,self,"DIA_Vales_WhatIsYourName_15_01");	//��� ���� �� ��������� ���?
	AI_Output(self,other,"DIA_Vales_WhatIsYourName_13_01");	//� � �� ���� �-������ �-���������� �����, ��� ��� �-������� �� ����� �� ����, �� ������.
	Mdl_StartFaceAni(self,"S_FRIENDLY",1,-1);
	AI_Output(self,other,"DIA_Vales_WhatIsYourName_13_02");	//� ��� �-����� ��� �-�����������, ������ �-�������. (���������)
};
//----
//���������� ����� ����������
//----
instance DIA_Vales_WhereIsYourCamp(C_Info)	//��� ��� ������?
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Vales_WhereIsYourCamp_condition;	
	information = DIA_Vales_WhereIsYourCamp_info;
	description = "��� ��� ������?";
};
func int DIA_Vales_WhereIsYourCamp_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_WhereIsYourCamp_info()
{	
	AI_Output(other,self,"DIA_Vales_WhereIsYourCamp_15_00");	//��� ��� ������?
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_00");	//�-�����, ���-�-��������, �� �����. �� �-������ ������� �-������� ��������, �-������ ��� ������ ���.
	AI_Output(other,self,"DIA_Vales_WhereIsYourCamp_15_01");	//� ��� ������� ������ � ����� ���������? �� �����, ��� ��� ���� ����� ���� ����� ������.
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_01");	//�-�-��� �� ���������? (������ �������) 
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_02");	//�� �-�-������ � ����� ��, ��� ��-�-�� �����. �-������ �-��������� ���-������ �� ���, � �� �-��������� �� ����. (�������)
	AI_Output(other,self,"DIA_Vales_WhereIsYourCamp_15_02");	//� ��������� ��� ������? ������ �� ������� ����?
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_03");	//��� �-�����? ��!
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_04");	//�� ��� �-����� ������ � ����� �-�-������ �� �������! �� �-��������� �� ��� �����!
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_05");	//�-������, �-�-���� �� ��� �-�-�������� � �����. � �-���� ���� ��� �-�������� ���-�-�����, �� �� �-������ ��-�-��������, ��� �-�-�-����� �������!
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Villagers);
};
//----
//���������� ����� ����������
//----
instance DIA_Vales_WhyDoYouStutter(C_Info)	//������ �� ����������?
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Vales_WhyDoYouStutter_condition;	
	information = DIA_Vales_WhyDoYouStutter_info;
	description = "������ �� ����������?";
};
func int DIA_Vales_WhyDoYouStutter_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_WhyDoYouStutter_info()
{	
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_00");	//������ �� ����������?
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_00");	//(����������) �-�-������!
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_01");	//��� ���?
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_01");	//� �-�-���� ��� �� �-������ �� ����? (����������) � �-�-������� ������ �-��-�-�������!
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_02");	//�� ��������?
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_02");	//�� ���, �-�-�-�-������ ��� ��? �-�-������� ���!
	
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_03");	//��������, ��� ���������.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_03");	//���-���... � �-�-�-���� ������ ������. ��� ������ �-�-����� � ������-��� ����.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_04");	//��, ��� ���-�� �� �-�-� ������� �-������ ������� ��������-�-������. �-������� ��-����� �� ������, � �-�-����� �-�-������� ����� ��-��������� ���.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_05");	//��, � � ���� ��-������ ��-����-����� � ����� �-���� ���� �� �-������. �-����� ������, ��� � ���-����, �� ������� ��-��-�� ���� ��� � �� ������.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_06");	//� �����, ����� ��� �-������ �� ���, ����-�� � ����. � �� �-������ ������, � � �-�-�������� �� ��������, ��� �-�����������-��� ������ ���-�-�����.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_07");	//� �-�-��������� ��-�-������, ��� ��� ���� ������ �-��������� ����... � �����, �����-������� ���, ��� �-�-����� ���������.
	
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_04");	//�������, ��� ����� ������� ������ �������.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_08");	//��-��� �� ���� �-�������... ����� ���-�� ������ � ��� ���-���� �� �����!
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_Start);
};
//----
//���������� ����� �����������
//----
instance DIA_Vales_WhoMadeJoke(C_Info)	//� �� �� ������� ��� �� ������� �������� ��� �����?
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Vales_WhoMadeJoke_condition;	
	information = DIA_Vales_WhoMadeJoke_info;
	description = "� �� �� ������� ��� �� ������� �������� ��� �����?";
};
func int DIA_Vales_WhoMadeJoke_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhyDoYouStutter)){return TRUE;}; };
func void DIA_Vales_WhoMadeJoke_info()
{	
	AI_Output(other,self,"DIA_Vales_WhoMadeJoke_15_00");	//� �� �� �������, ��� �� ������� �������� ��� �����?
	AI_Output(self,other,"DIA_Vales_WhoMadeJoke_13_00");	//�-�-�������, ��-���� � ��� ��� ������ � ����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_Talk2JosephZedd);
};
//----2 �������:
//���������� ����� ����������� ("� �� �� ������� ��� �� ������� �������� ��� �����?")
//----
instance DIA_Vales_Scare(C_Info)	//��������.
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Vales_Scare_condition;	
	information = DIA_Vales_Scare_info;
	description = "(��������)";
};
func int DIA_Vales_Scare_condition()	{
	if(Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && (MIS_DS2P_Gambler != LOG_SUCCESS))
	{return TRUE;};
};
func void DIA_Vales_Scare_info()
{	
	Info_ClearChoices(DIA_Vales_Scare);
	Info_AddChoice(DIA_Vales_Scare,Dialog_Back,DIA_Vales_Scare_Back);
	Info_AddChoice(DIA_Vales_Scare,"������, �����! ������ �� ������� �� �����!",DIA_Vales_Scare_Octopus);
	Info_AddChoice(DIA_Vales_Scare,"��� � ���� � �����?",DIA_Vales_Scare_Face);
	Info_AddChoice(DIA_Vales_Scare,"���� ���� ����. � �� ����� ���������!",DIA_Vales_Scare_Gard);
	Info_AddChoice(DIA_Vales_Scare,"����!",DIA_Vales_Scare_Buuu);
};
func void DIA_Vales_Scare_Back()
{
	Info_ClearChoices(DIA_Vales_Scare);
};
func void DIA_Vales_Scare_Octopus()
{
	AI_Output(other,self,"DIA_Vales_Scare_Octopus_15_00");	//(��������) ������, �����! ������ �� ������� �� �����! �� ��� ���� ������!
	AI_Output(self,other,"DIA_Vales_Scare_Octopus_13_00");	//(����������) � ���?
	AI_Output(other,self,"DIA_Vales_Scare_Octopus_15_01");	//���, ������...
};
func void DIA_Vales_Scare_Face()
{
	AI_Output(other,self,"DIA_Vales_Scare_Face_15_00");	//��� � ���� � �����?
	AI_Output(self,other,"DIA_Vales_Scare_Face_13_00");	//� ��� � ���?
	AI_Output(other,self,"DIA_Vales_Scare_Face_15_01");	//��� ����� �������! ��� �������, ��� �� ���� ���������. ���� ���� �������... ���, ���, �� ������ ���������!
	AI_Output(self,other,"DIA_Vales_Scare_Face_13_01");	//�� � ����� ���? �� ���� ��� � �������. ��-�������!
};
func void DIA_Vales_Scare_Gard()
{
	AI_Output(other,self,"DIA_Vales_Scare_Gard_15_00");	//���� ���� ����. � �� ����� ���������!
	AI_Output(self,other,"DIA_Vales_Scare_Gard_13_00");	//� ���? ���� ��-�-����� ���-�� ���������.
};
func void DIA_Vales_Scare_Buuu()
{
	AI_Output(other,self,"DIA_Vales_Scare_Buuu_15_00");	//(����������) ����!
	AI_Output(self,other,"DIA_Vales_Scare_Buuu_13_00");	//��� ��� ��-�� ��������, ��-�-������� �� ����!
	Info_ClearChoices(DIA_Vales_Scare);
	AI_StopProcessInfos(self);
};
//----
//���������� ����� ����������� ("� �� �� ������� ��� �� ������� �������� ��� �����?")
//----
instance DIA_Vales_PlaySomeDominoes(C_Info)	//�-�������� � �-�-��������!
{
	npc = PIR_209_DS2P_Vales;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Vales_PlaySomeDominoes_condition;	
	information = DIA_Vales_PlaySomeDominoes_info;
	description = "�-�������� � �-�-��������!";
};
func int DIA_Vales_PlaySomeDominoes_condition()	{
	if(Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && (MIS_DS2P_Gambler != LOG_SUCCESS))
	{return TRUE;};
};
func void DIA_Vales_PlaySomeDominoes_info()
{	
	AI_Output(other,self,"DIA_Vales_PlaySomeDominoes_15_00");	//�-�������� � �-�-��������!
	AI_Output(self,other,"DIA_Vales_PlaySomeDominoes_13_00");	//�� ���, �-�-����� ������������ �-�-���� ����? ��������!
	AI_StopProcessInfos(self);
};
//----
//���������� ����� ����������� ("�-�������� � �-�-��������!")
//----
instance DIA_Vales_DoUKnowWhereGregNow(C_Info)	//�-�� ������, �-��� �-�-������ ����?
{
	npc = PIR_209_DS2P_Vales;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Vales_DoUKnowWhereGregNow_condition;	
	information = DIA_Vales_DoUKnowWhereGregNow_info;
	description = "�-�� ������, �-��� �-�-������ ����?";
};
func int DIA_Vales_DoUKnowWhereGregNow_condition()	{
	if(Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && (MIS_DS2P_Gambler != LOG_SUCCESS))
	{return TRUE;};
};
func void DIA_Vales_DoUKnowWhereGregNow_info()
{	
	AI_Output(other,self,"DIA_Vales_DoUKnowWhereGregNow_15_00");	//�-�� ������, �-��� �-�-������ ����?
	AI_Output(self,other,"DIA_Vales_DoUKnowWhereGregNow_13_00");	//��� ��-��� �����, � � �-�-���� ������ ���-�-�����!
	AI_StopProcessInfos(self);
};
//----
//���������� ����� ����������� ("�-��������, �-��� �-�-������ ����?")
//----
instance DIA_Vales_GreatWeatherToday(C_Info)	//��-�-������� �������� �-�������!
{
	npc = PIR_209_DS2P_Vales;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Vales_GreatWeatherToday_condition;	
	information = DIA_Vales_GreatWeatherToday_info;
	description = "��-�-������� �������� �-�������!";
};
func int DIA_Vales_GreatWeatherToday_condition()	{
	if(Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && (MIS_DS2P_Gambler != LOG_SUCCESS))
	{return TRUE;};
};
func void DIA_Vales_GreatWeatherToday_info()
{	
	AI_Output(other,self,"DIA_Vales_GreatWeatherToday_15_00");	//��-�-������� �������� �-�������!
	AI_Output(self,other,"DIA_Vales_GreatWeatherToday_13_00");	//�� ���, �� ��� ���-�-��������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

//----
//���������� ����� ����������
//----
instance DIA_Vales_WhatAreUdoingOnIsland(C_Info)	//��� �� ������� �� �������?
{
	npc = PIR_209_DS2P_Vales;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Vales_WhatAreUdoingOnIsland_condition;	
	information = DIA_Vales_WhatAreUdoingOnIsland_info;
	description = "��� �� ������� �� �������?";
};
func int DIA_Vales_WhatAreUdoingOnIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_WhatAreUdoingOnIsland_info()
{
	if (MIS_DS2P_Gambler != LOG_SUCCESS)	{	// � ���������
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_00");	//��� �� ������� �� �������?
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_00");	//�� �-����� � ���������� �����, ����� �� �-�-��������� �-��������� ������ ��-�-����!
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_01");	//����, ��� ��-�-�����, �������� �� ��-�-������� � ���. �� ������� ��� �-�-������ � ����� � �-�-������ ����, ���-�-������� ������. 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_02");	//�� ���� ��-�������� ������. ��� �-�-����, ��� �� ����� ���-�-�������, � ����-�������� �������. �� ����� ��� ��� ����� ��� ��� �-�������.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_03");	//��� ��� �-�-����������, ���� �������� �-�-�������� ��������. ������������, ��� ��� ��-�-���������, �������� �-�-�� ����� ������� � ��-�-�-������ � �����.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_04");	//���� �� ����� ������������ � ��� ��-�-������ �������. 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_05");	//����� �� ����� �-�-���������, ��� ��������� ���� �� ����.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_06");	//�-������ ��� �-����� ����� �������, ����� ��������� � ��� ������, �� ������� �-�-����������.
	
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_01");	//����� ���� ��������, ������ ������ ������ ���, ��� � ����� ����� �������.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_07");	//� ��� �� �-�-��������?
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_02");	//�� ������� ��������� ���������� �����, �, ��������� � ����, ����� ������ ���� �������.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_08");	//����� ����-�-������� ���������� �� ���� �����!
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_03");	//��� ���� �� �����? 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_09");	//� �-�-������ �������� �������! � ��� ���� ������ �� ������ ��� �������!
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_04");	//� ������� �� ����.
	}
	else	{//��� ��������
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_00");	//��� �� ������� �� �������?
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_00a");	//�� ����� � ���������� �����, ����� �� ��������� ��������� ������ �����!
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_01a");	//����, ��� �������, �������� �� �������� � ���. �� ������� ��� ������ � ����� � ������� ����, ���������� ������. 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_02a");	//�� ���� ��������� ������. ��� �����, ��� �� ����� ���������, � ����������� �������. �� ����� ��� ��� ����� ��� ��� ������.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_03a");	//��� ��� �����������, ���� �������� �������� ��������. ������������, ��� ��� ����������, �������� �� ����� ������� � �������� � �����.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_04a");	//���� �� ����� ������������ � ��� ������� �������. 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_05a");	//����� �� ����� ���������, ��� ��������� ���� �� ����.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_06a");	//������ ��� ����� ����� �������, ����� ��������� � ��� ������, �� ������� ����������.
	
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_01");	//����� ���� ��������, ������ ������ ������ ���, ��� � ����� ����� �������.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_07a");	//� ��� �� ��������?
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_02");	//�� ������� ��������� ���������� �����, �, ��������� � ����, ����� ������ ���� �������.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_08a");	//����� ���������� ���������� �� ���� �����!
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_03");	//��� ���� �� �����? 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_09a");	//� ������ �������� �������! � ��� ���� ������ �� ������ ��� �������!
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_04");	//� ������� �� ����.
	};
};
//----
//���������� ����� ����������
//----
instance DIA_Vales_HowDidUBecomePirate(C_Info)	//��� �� ���� �������?
{
	npc = PIR_209_DS2P_Vales;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Vales_HowDidUBecomePirate_condition;	
	information = DIA_Vales_HowDidUBecomePirate_info;
	description = "��� �� ���� �������?";
};
func int DIA_Vales_HowDidUBecomePirate_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_HowDidUBecomePirate_info()
{	
		AI_Output(other,self,"DIA_Vales_HowDidUBecomePirate_15_00");	//��� �� ���� �������?
	if (MIS_DS2P_Gambler != LOG_SUCCESS)	{	// � ���������
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_00");	//���-���?! ��� � ������...
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_01");	//���� ��-�-����, ���� ���-�-���� � ����� �� �����. ��� �-������� ������ ���� � �����������, ���� �-��������� ������ ����������.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_02");	//��� ������, �-�-������� ����� �� �������� �����. ������ �-�������, � ������� ����� �-�����.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_03");	//� ����� �� �-������� � ��������� �� ��� ���-�-���� ������. ����� ��-�-������, ��� ������� ��������, ��������� �-���������� ��������� ���� �-������������ �����.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_04");	//� ���� ����� ������ �����, ���-�-�������, ��� ����������, �-����� ��� �������� ������ �-������� ������� ���.
	}
	else	{//��� ��������
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_00a");	//���-���?! ��� � ������...
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_01a");	//���� ������, ���� ������� � ����� �� �����. ��� ������� ������ ���� � �����������, ���� ��������� ������ ����������.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_02a");	//��� ������, ������� ����� �� �������� �����. ������ �������, � ������� ����� �����.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_03a");	//� ����� �� ������� � ��������� �� ��� ������ ������. ����� �������, ��� ������� ��������, ��������� ���������� ��������� ���� ������������ �����.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_04a");	//� ���� ����� ������ �����, ���������, ��� ����������, ����� ��� �������� ������ ������� ������� ���.
	};
};
//----
//���������� ����� ����������
//----
instance DIA_Vales_WhatAreYourResponsibilities(C_Info)	//����� ���� ����������� � �������?
{
	npc = PIR_209_DS2P_Vales;
	nr = 12;
	permanent = FALSE;
	condition = DIA_Vales_WhatAreYourResponsibilities_condition;	
	information = DIA_Vales_WhatAreYourResponsibilities_info;
	description = "����� � ���� ����������� � �������?";
};
func int DIA_Vales_WhatAreYourResponsibilities_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_WhatAreYourResponsibilities_info()
{	
		AI_Output(other,self,"DIA_Vales_WhatAreYourResponsibilities_15_00");	//����� � ���� ����������� � �������?
	if (MIS_DS2P_Gambler != LOG_SUCCESS)	{	// � ���������
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_00");	//� ������, ��-�-�-��������. ����� �-���� ������� �� ������� �-�����, ����� ���, ��-�-��������� �-�-�������, ����� �� ������ �-����������!
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_01");	//(���������) � ���� �-�-������ ��� ������� �� �����������, ���� �-������ �� � ���� �����.
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_02");	//��� �-������ � �-������� � ���, �����, ���� ��, ���� �-����! � ����� �-������� ��-���������� �-���������, ��� ����� �����!	
		AI_Output(other,self,"DIA_Vales_WhatAreYourResponsibilities_15_01");	//� �� ��������...
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_03");	//�-�-������ ������ �� �-�-������ �� �-�-������ �� ����. (������ �������)
	}
	else	{//��� ��������
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_00a");	//� ������, ����������. ����� ���� ������� �� ������� �����, ����� ���, ���������� �������, ����� �� ������ ����������!
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_01a");	//(���������) � ���� ������ ��� ������� �� �����������, ���� ������ �� � ���� �����.
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_02a");	//��� ������ � ������� � ���, �����, ���� ��, ���� ����! � ����� ������� ��-���������� ���������, ��� ����� �����!	
		AI_Output(other,self,"DIA_Vales_WhatAreYourResponsibilities_15_01");	//� �� ��������...
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_03a");	//������ ������ �� ������ �� ������ �� ����. (������ �������)
	};
};


//NS - 03/07/2013 =======================
//  �� ������ "�������� �����"
//=======================================

//----------------------------
// ���������� �������, ���� ���� �����, � 0 �� 3 ����		nr=6
instance DIA_Vales_LetsPlay(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	condition = DIA_Vales_LetsPlay_condition;	
	information = DIA_Vales_LetsPlay_info;
	description = "����� ������� � �����.";
};
func int DIA_Vales_LetsPlay_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_GotClothes) && Npc_HasItems(other,ITMI_DS2P_Shulers_Colode)
		&& Wld_Istime(0,0,3,0))
	{	return TRUE;};
};
func void DIA_Vales_LetsPlay_info()
{
	var C_NPC Zedd;		Zedd = Hlp_GetNpc(PIR_203_DS2P_Zedd);
	var C_NPC Joseph;	Joseph = Hlp_GetNpc(PIR_205_DS2P_Joseph);
	var C_NPC Vales;	Vales = Hlp_GetNpc(PIR_209_DS2P_Vales);

	AI_Output(other,self,"DIA_Vales_LetsPlay_15_00");	//����� ������� � �����.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_01");	//� �� �-����� ����� ��-�-������ ���� ����� �-�-���� ������, � �-�-������� � ���� ���-�-��������.
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_02");	//�� ����� ����. ������� ���� ������ � ���. � ��� ������������ ������� ������. ��� ���� �������� �����.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_03");	//��... �����, ���� ������ �����.

	//����� ������ ������ ������ ����� ����� � ���� �������, ����� ����� �����
	//UNFINISHED ���� ����, �������������� � �����
	AI_GotoWP(self, "");
	AI_GotoWP(other, "");
	//� ������� ����� � �� �������, ����� �� ��������� �� ���������� �� �����
	B_StopLookAt(self);	B_StopLookAt(other);
	AI_UseMob(self,"CHAIR",1);	AI_UseMob(other,"CHAIR",1);
	Npc_RemoveInvItem(other,ITMI_DS2P_Shulers_Colode);
	// UNFINISHED ���������� ����� �� �����
	AI_LookAtNpc(self,other);	AI_LookAtNpc(other,self);

		AI_Output(self,other,"DIA_Vales_LetsPlay_13_04");	//� �-����?
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_05");	//��, ������.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_06");	//����� �� �-�-������ � ����� ��-�-�-������. �� �-������ ���� � �-�-��� ����� ���-�-�������. (�������)
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_07");	//�-������ �� ��������� �-�-�����. ��������?
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_08");	//��, ��������. 
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_09");	//�-����� �����.
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_10");	//���. ���, ��� �����. ������.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_11");	//���, ���... �-�-�������. ���� ���-���. �-����� �����.
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_12");	//���, ���... ������.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_13");	//��-��, ��� ����. ����, � ��-������!
	// UNFINISHED ������ �����-�� ������ ���
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_14");	//��� ��� ��-�-�-� �-�-�����? �� �-�-�-������?
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_15");	//��. �� ������� �� ����. ������ ����� �� �����������.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_16");	//�-�-������ �����, ��-�-����... �����, �-����� �-�����.
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_17");	//���, ���, ���... �������.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_18");	//������, �� � ��-�-���� �������.
	// UNFINISHED ����� ������ �� ������ �����
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_19");	//��� �� ������? (��� ����) ��� ��� ��� ���� ����� ���� ��������� ����.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_20");	//�� ���-�-�, ��� �� � �-�����? ���-�� �-�-��� �� �� �-�-����. �� ���-�-��� �� ��-�-���������?
	// UNFINISHED ����� ������ ���, ��� ����� ������
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_21");	//(��������) �-�-������� ���� ������! ��� �-�-�����������?
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_22");	//� ���-�� ����... ������, ��������...

	//������ ������� � ����� � ��������
	// UNFINISHED ������� WP
	CreateInvItem(Zedd,ITAR_DS2P_GHOST);	AI_EquipArmor(Zedd,ITAR_DS2P_GHOST);		AI_UnequipWeapons(Zedd);
	CreateInvItem(Joseph,ITAR_DS2P_GHOST);	AI_EquipArmor(Joseph,ITAR_DS2P_GHOST);	AI_UnequipWeapons(Joseph);
	B_StartOtherRoutine(Zedd,"SCAREVALES");	B_StartOtherRoutine(Joseph,"SCAREVALES");
	AI_Teleport(Zedd,"");					AI_Teleport(Joseph,"");
	AI_GotoNpc(Zedd,hero);					AI_GotoNpc(Joseph,hero);
	
	//���������� �����
	TRIA_Invite(Zedd);
	TRIA_Start();

	TRIA_Next(Zedd);
			AI_Output(self,other,"DIA_Vales_LetsPlay_13_23_Zedd");	//� ������ �� ����� ������� ��������, �����������! ������ �� �������� �� ��� ���� �����������! ��-��-��!

	TRIA_Next(Vales);
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_24");	//(��������� ������) �-�-�-�, ����� ���������! ����� �� ����! ������ ������ ��������! ���� � ����� ��������! �����! �����! �-�-�-�!!!!!
	//����� �������� ��������
	B_StartOtherRoutine(Zedd,"SCARED");

	DIAG_Reset();
	TRIA_Finish();
	AI_StopProcessInfos(self);
};

//----------------------------
// ��������� �� ��������, ��� ���������� � ��		nr=6
instance DIA_Vales_AfterLetsPlay(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	condition = DIA_Vales_AfterLetsPlay_condition;	
	information = DIA_Vales_AfterLetsPlay_info;
	important = TRUE;
};
func int DIA_Vales_AfterLetsPlay_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_AfterScaredVales))
	{	return TRUE;};
};
func void DIA_Vales_AfterLetsPlay_info()
{
	var int x;
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_00");	//��� �� ��� ��� ��������� �� ����?
	//(+����)
	B_GivePlayerXP(XP_MIS_Gambler_Success);
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_01");	//� ����� ���� ���������� �� ��������. ����� ����� ����?
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_02");	//�� �� ����� �� ��������! � ���� � ������� �� ������!
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_03");	//������, �� ������� ������� � �� ����.
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_04");	//�����, �����. � �����, ������� ����!
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_05");	//��� ���? 
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_06");	//�� ��, � ��� �� ��� �����? � �� �� ������ ���� ��������. �� ��� ��������.
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_07");	//�� ����. ����� � �����, �������� � �������, ����� ��� ���� ����������.
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_08");	//�-�-�... ����! �����, ��� �������� � ���� ������ �� ����� �� �� �����������, �� ����-�� ����� ����� �������.
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_09");	//����� ���: � ��� ���� ��� �����, � ��� �������.
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_10");	//��-�, ������� ����� ������� ������!
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_11");	//�����, �����. ��������� �����.
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_12");	//��� ���� ��������.
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_13");	//��, �� � ������. ��������� ��������� ����� � ������. ������������? ��, �����, ������������!
	//���� 450 ������� � ������ ��������� ����
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_Gold,450);
		B_GiveInvItems(self,other,ItRi_DS2P_Fortitude,1);
	};
	Vales_IsHeal = TRUE;
	//������ � �������� "�������� �����" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Gambler_Success);
};

// ������������, ���� ���� ����� "�������"
// nr = 1

instance DIA_Vales_HaveADeal(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 1;
	condition = DIA_Vales_HaveADeal_condition;	
	information = DIA_Vales_HaveADeal_info;
	permanent = FALSE;
	description = "���� ����.";
};

func int DIA_Vales_HaveADeal_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && C_DIA_Greg_OurIdea_Know_AboutVales)
	{	
		return TRUE;
	};
};

func void DIA_Vales_HaveADeal_info()
{
	if (Vales_IsHeal == TRUE) // ���� ����� ��������� �� ��������
	{
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_00");	//���� ����.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_01");	//���� ���� ����� ���������. � ���� ���� � ���� �������.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_02");	//�����?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_03");	//� �����, ���� �����: � ���� �������� � ����������, ����� �������� ��� ���� �����. ������ ���� ���� ��������� ���.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_04");	//�����?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_05");	//����. � ��������� ����� �� ������� ������ ��������, � �� ���� ���� �� �������� �� ������ ����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_06");	//� �� ���� �� ��� ������?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_07");	//�� ������ � ��� ����������? ��������� ���� ��� ���������, ������� ��� ��������� �����, ���������, �������. ������ ����� �� �������� ����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_08");	//� ��� ������ �� ���������?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_09");	//����� �, ������ ������, ���. ������� ��� ���� � ������ �����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_10");	//� ����, ������, �� �������? ��-��.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_11");	//�� ��� �����. ���� �� �� ���������� �� ���� �� ����� �������, �� �� ��� ��� � ��������� �� ���� ����������� ������ ����. ��������.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_12");	//������ �� ������� ������������. � ���� ���� � ���� ������ �����������, ������� ������ � ����, � ���. ������ ���� ���������.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_13");	//������.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_14");	//���� ����� �������� �������� �������, ����� �������� ����� � ������ ��� �����. ��� ����� ���� �����. ����� � �������� � ������ �, ��� ������ ���������� �����������, �� ����� �� �������� ���� �� ��� ������ �������. ��������?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_15");	//��, ���� ����������� � ������ ����������. �� ��� ���� ���� ������� ������ �������?
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_16");	//� ���������� � ���, ����� �� � ���� ���� ��� ����� ������.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_17");	//�����, ���� ���� ����� ����� �����������, ���������� ��������� ����, � ���������� �� ����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_18");	//������������!
		B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,LOG_MISSION,LOG_Running,TOPIC_DS2P_FromPiratesToPeasants_Start);
		Vales_InConspiracy = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_ValesIn);
		AI_StopProcessInfos(self);
	}
	else // ���� ����� �� ��������� �� ��������
	{
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_00");	//���� ����.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_19");	//�-���� �-�-���� �-����� ��-��-���������. �-� �-���� ���� � ��-��� �-�������.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_02");	//�����?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_20");	//�-� �����, �-���� �����: �-�-� �-���� �������� �-� ���-�-��������, �-�-����� �������� ��� �-�-���� �����. �-������ ���� ���� �-�-��������� ���.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_04");	//�����?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_21");	//�-����. �-� ��������� ����� �-�� �-������� ������ �-�-��������, � �� �-���� ���� �� �-�-�������� �-�� ������ �-����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_06");	//� �� ���� �� ��� ������?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_22");	//�-�� ������ �-� ��� �-�-����������? �-�-�-��������� �-���� ��� ���������, �-�-������� ��� �-�-��������� �-�-�����, �-�-���������, �������. �-�-������ ����� �-�� ��-�-������� ����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_08");	//� ��� ������ �� ���������?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_23");	//�-�-����� �-�-�, �-�-������ ������, �-���. �-�-�-������� ��� ���� �-�-� ������ �-�-�����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_10");	//� ����, ������, �� �������? ��-��.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_24");	//�-�� ��� �-�-�����. ���� �-�-�� �� ��-�-��������� �-�-�� ���� �� �-����� �������, �-�-�� �� ��� �-�-��� �-�-� ��������� �-�-�� ���� �-�-����������� �-�-������ �-�-����. ��������.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_12");	//������ �� ������� ������������. � ���� ���� � ���� ������ �����������, ������� ������ � ����, � ���. ������ ���� ���������.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_25");	//�-�-�����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_14");	//���� ����� �������� �������� �������, ����� �������� ����� � ������ ��� �����. ��� ����� ���� �����. ����� � �������� � ������ �, ��� ������ ���������� �����������, �� ����� �� �������� ���� �� ��� ������ �������. ��������?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_26");	//�-�-���� �-����������� �-�-� ������ �-�-����������. �-�-�� ��� ���� �-�-���� ������� �-�-������ �-�-�������?
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_16");	//� ���������� � ���, ����� �� � ���� ���� ��� ����� ������.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_27");	//�-�-�����, �-�-���� �-���� ����� �-�-����� �-�-�������-�����, �-���������� �-�-�-��������� �-�-����, �-�-� ���������� �-�-�� ����.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_18");	//������������!
		B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,LOG_MISSION,LOG_Running,TOPIC_DS2P_FromPiratesToPeasants_Start);
		Vales_InConspiracy = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_ValesIn);
		AI_StopProcessInfos(self);
	};
};

// ������������, ���� �������� ����� "�������" � ���� �����
// nr = 1

instance DIA_Vales_AfterConspiracy(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 1;
	condition = DIA_Vales_AfterConspiracy_condition;	
	information = DIA_Vales_AfterConspiracy_info;
	permanent = FALSE;
	important = TRUE;
	description = " ";
};

func int DIA_Vales_AfterConspiracy_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Success) && (Conspiracy_IsStarted == TRUE))
	{	
		return TRUE;
	};
};

func void DIA_Vales_AfterConspiracy_info()
{
	TRIA_Start();
	TRIA_Invite(Greg);
	TRIA_Invite(Vales);
	if (Vales_IsHeal == TRUE) // ��������� �� ����� �� ��������
	{
		AI_GotoNpc(Greg,self);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_13_00");	//����, ��� ������. � �������� ���� ����� �������.
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_11_01");	//� � ������� ����. �� ����� �������� ������� � ������ �� ��� ������ �������, ���� ���������.
		TRIA_Next(Vales);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_13_02");	//�������. ����� � ����������, �������.
	}
	else
	{
		AI_GotoNpc(Greg,self);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_13_00");	//�-�-� �-���-�-������ �-�-���� �-�-����� �-�������. �-�-������ �-�-��� �-��-�����.
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_11_01");	//� � ������� ����. �� ����� �������� ������� � ������ �� ��� ������ �������, ���� ���������.
		TRIA_Next(Vales);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_13_02");	//�-�-�������. �-�����, �-�-���-�-�����!
	};
	B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,Log_Mission,Log_Success,TOPIC_DS2P_FromPiratesToPeasants_Success);
	DIAG_Reset();
	TRIA_Finish();
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};