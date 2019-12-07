instance DIA_Ekor_EXIT(C_Info)
{
	npc = OUT_400_DS2P_Ekor;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Ekor_EXIT_condition;	
	information = DIA_Ekor_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Ekor_EXIT_condition(){	return TRUE;};
func void DIA_Ekor_EXIT_info(){	AI_StopProcessInfos(self);};

//----
//----
var int firstDia_Ekor_once;
instance DIA_Ekor_Start(C_Info)	//��������� ������
{
	npc = OUT_400_DS2P_Ekor;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Ekor_Start_condition;	
	information = DIA_Ekor_Start_info;
	important = TRUE;
};
func int DIA_Ekor_Start_condition(){
	
	if(Npc_IsInState(self,ZS_Talk) && !firstDia_Ekor_once)
	{	return TRUE;};
};
func void DIA_Ekor_Start_info()
{
	AI_Output(self,other,"DIA_Ekor_Start_03_00");	//� ���� ��� �������, ����� ������� ��� �� ������ �����������. �� ���� ����� �����, ��� ����� ���� ���� ������.
	AI_Output(self,other,"DIA_Ekor_Start_03_01");	//��� ������.
	If(C_Npc_DS_HasItems(other,ITWr_DS2P_Letter_fCimm_tEkor,1))
	{
		AI_Output(other,self,"DIA_Ekor_Start_15_00");	//�����, ������� �������� ��� ������.
		B_DS_GiveRemoveItems(other,self,ITWr_DS2P_Letter_fCimm_tEkor,1);
		B_UseFakeScrollTime(4.0);
		firstDia_Ekor_once = TRUE;
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};
//--------------------------------------------------------
//���������� ��������� ������ ,���� �������� ������ �� �����.
//
instance DIA_Ekor_StartNext(C_Info)	//@��� ���� ����������@
{
	npc = OUT_400_DS2P_Ekor;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Ekor_StartNext_condition;	
	information = DIA_Ekor_StartNext_info;
	important = TRUE;
};
func int DIA_Ekor_StartNext_condition(){
	
	if(firstDia_Ekor_once)
	{	return TRUE;};
};
func void DIA_Ekor_StartNext_info()
{
	AI_Output(self,other,"DIA_Ekor_StartNext_03_00");	//��� ���� ����������. ���������� ���-�� �����, � ������ ��������� �� �� ����� �����.
		AI_Output(other,self,"DIA_Ekor_StartNext_15_00");	//(����������) ������, �� ���� ������� ����� �� �������!
		AI_Output(other,self,"DIA_Ekor_StartNext_15_01");	//�� ���� �� �� �������� �������. ���� �������� ����� �������� � ������� ����������. 
		AI_Output(other,self,"DIA_Ekor_StartNext_15_02");	//���������� ������ �����, � ������� ���� ����� ��������.
	AI_Output(self,other,"DIA_Ekor_StartNext_03_01");	//��� ���� ��������.
		AI_Output(other,self,"DIA_Ekor_StartNext_15_03");	//���, ������. ���� ����? �� ��� �������� � �������� ���� ������.
	AI_Output(self,other,"DIA_Ekor_StartNext_03_02");	//(���������� ��������) � �� ���?
	Info_ClearChoices(DIA_Ekor_StartNext);
	Info_AddChoice(DIA_Ekor_StartNext, "� �� ������ ��������� �� ����� ������� ��������.", DIA_Ekor_StartNext_GoodVar);
	Info_AddChoice(DIA_Ekor_StartNext, "������ ������ ��� �������� �� ��������.", DIA_Ekor_StartNext_BadVar);
};
func void DIA_Ekor_StartNext_GoodVar()
{
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_00");	//� �� ������ ��������� �� ����� ������� ��������.
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_01");	//��� �������, ��� �������� ������, ������ ���� �������� � ����� �� ���� ����� ����� ������. ������ �������� ����� �� �������� ���.
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_00");	//����� ���� �������� � ������� �� �����, �� ��� �������� ������� ���� �����.
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_02");	//(��������) ���, � ����� �������� ��� ���� ��������.
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_03");	//���� ������ � ���� ���������, ���� ������, ��� �� ����� ������� ����. � ������, ������, ���� ��� �����?
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_01");	//�� ��������� ������� � ���� �������, ������� �������, - ��� ����������. � � ������� ������� �� ���������� - ��� ��� ������.
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_04");	//(����� �����, ��������) ����, ��� ��� �������, ����� �� ��� �����?
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_02");	//(��������) ��� �����. � �� �������� ��� ���� �� ���� � ������� ������� ����.
	
		AI_Output(other,self,"DIA_Ekor_StartNext_GoodVar_15_05");	//(����� �����, ��������) ����, ��� ��� �������, ����� �� ��� �����?
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_03");	//��� ��� �����? ��, �� ��� �� � ����.
	AI_Output(self,other,"DIA_Ekor_StartNext_GoodVar_03_04");	//����� �� �����������, ��� ���� ������ ������������, � �� ���� �� ���� �� ��� ����� �� ���������.
	B_GiveInvItems(self,other,ItWr_DS2P_EkorSpisok,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_EkorWorkGood);
	EkorStartDialogChoice = true;	//� ������ �� ����� 1000 �����.
	Info_ClearChoices(DIA_Ekor_StartNext);
};
func void DIA_Ekor_StartNext_BadVar()
{
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_00");	//������ ������, ��� �������� �� ��������.
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_01");	//����� � ���� �������� ������ ���������� ��������, �� ��� ������� ��� � ��� ������ ������� �� �����.
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_00");	//(���������) ������� �������, ��, �������, �������� ��� ��������?
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_01");	//������, ��� � ��� ��� ������� ��������, � ���� �����-�� ����� �������� ������ ������ ���� �����, �� ������� � �������, � � ���-�� ���� � �������.
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_02");	//�� ������� ����, �� �������� ������� ����� �� ������ �������� �������.
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_02");	//(����� ��������) ������, �� ����� �� �������! ���� ������� �� ���������� �������, �� ��� ��������������� � ������!
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_03");	//��� �� �� ������� ����, �� ��� ���� ������ ����� ���������.
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_03");	//(���������� ��������) � �������� � ���� ������� �������� ������, ��� ��� �� ���� ��� ��� �������� � ������ � �������� ��������.
		AI_Output(other,self,"DIA_Ekor_StartNext_BadVar_15_04");	//(������) �����, �� ������� ������� �� �� ��������. ������ �����, ��� ���� �����? ������ ������� ������, �������, �� �� ������?
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_04");	//������ ������ ��� ������ �� ������? ������� ���� ������ ����������� ����� ������� �����-�� �������?
	AI_Output(self,other,"DIA_Ekor_StartNext_BadVar_03_05");	//��� ���� ������ ������������. ����� ��� ���������, �� ��������� ��� ��������.	
	B_GiveInvItems(self,other,ItWr_DS2P_EkorSpisok,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_EkorWorkBad);
	Info_ClearChoices(DIA_Ekor_StartNext);
};

//--------->>> 
//--------------------------------------------------------
//���������� ������� �� ������ ������.
//
var int GG_PrinesTravi_Ekoru; //�������� ��, ��� ����, ���� ������� �� ����.
var int GG_Tell_Ekor_Skuperdyay;	//�� �������� ����� �������, ��� ����-���������. /*���������:Redleha*/

instance DIA_Ekor_FindPlants(C_Info)	//���, ��� ��� �� � ������.
{
	npc = OUT_400_DS2P_Ekor;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Ekor_FindPlants_condition;	
	information = DIA_Ekor_FindPlants_info;
	description = "���, ��� ��� �� � ������.";
};
func int DIA_Ekor_FindPlants_condition(){
	
	if(Npc_KnowsInfo(other,DIA_Ekor_StartNext) && !GG_PrinesTravi_Ekoru)
	{	return TRUE;};
};
func void DIA_Ekor_FindPlants_info()
{
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_00");	//���, ��� ��� �� � ������.
	If(C_Npc_DS_HasItems_Scr(other,ItPl_Perm_Herb,1,YPos_3,true) && C_Npc_DS_HasItems_Scr(other,ItPl_Health_Herb_03,5,YPos_5,true)
	&& C_Npc_DS_HasItems_Scr(other,ItPl_Mana_Herb_01,5,YPos_7,true) && C_Npc_DS_HasItems_Scr(other,ItPl_Blueplant,3,YPos_9,true)
	&& C_Npc_DS_HasItems_Scr(other,ItFo_Wine,5,YPos_11,true) && C_Npc_DS_HasItems_Scr(other,ItFo_Sausage,2,YPos_13,true)
	&& C_Npc_DS_HasItems_Scr(other,ItFo_Cheese,1,YPos_15,true))
	{
		if( (!EkorStartDialogChoice && C_Npc_DS_HasItems_Scr(other,ItMi_Gold,1000,YPos_17,true)) || EkorStartDialogChoice)
		{
			AI_Output(self,other,"DIA_Ekor_FindPlants_03_00");	//������-��, � ���... �, ��� ���. ����, � ������ ������ ������� �� ���������, ��� �������� ������� ����� �������.
			GG_PrinesTravi_Ekoru = TRUE;
			B_DS_GiveRemoveItems_Red(other,self,ItPl_Perm_Herb ,1 , 34);
			B_DS_GiveRemoveItems_Red(other,self,ItPl_Health_Herb_03 ,5 , 37);
			B_DS_GiveRemoveItems_Red(other,self,ItPl_Mana_Herb_01 ,5 , 40);
			B_DS_GiveRemoveItems_Red(other,self,ItPl_Blueplant ,3 , 43);
			B_DS_GiveRemoveItems_Red(other,self,ItFo_Wine ,5 , 46);
			B_DS_GiveRemoveItems_Red(other,self,ItFo_Sausage ,2 , 49);
			B_DS_GiveRemoveItems_Red(other,self,ItFo_Cheese ,1 , 52);
			if(!EkorStartDialogChoice)
			{
				B_DS_GiveRemoveItems_Red(other,self,ItMi_Gold ,1000 , 55);
			};
		}
		else if(!EkorStartDialogChoice && !C_Npc_DS_HasItems_Scr(other,ItMi_Gold,1000,YPos_17,true))
		{
			AI_Output(self,other,"DIA_Ekor_FindPlants_03_01");	//�������, �� ���-�� ������, ������� �������. 
			if(!GG_Tell_Ekor_Skuperdyay)
			{
				AI_Output(other,self,"DIA_Ekor_FindPlants_15_01");	//(��� ����) ��� ���� ���������.
				AI_Output(self,other,"DIA_Ekor_FindPlants_03_02");	//���-���? � �� ���������.
				AI_Output(other,self,"DIA_Ekor_FindPlants_15_02");	//�� ������, � ������� �� ������ ������� ���-��� ������ ��... ��������.
				GG_Tell_Ekor_Skuperdyay = TRUE;
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_03");	//���, �� ���, ��� ��� ���������.
	};
	
};
//------------------------------------------------
//����� �������, ����� ���� ���� �������������.
//------------------------------------------------

instance DIA_Ekor_SausageAndCheese(C_Info)	//� ������� � ��� ���� �������� ������ ���������?	nr=9
{
	npc = OUT_400_DS2P_Ekor;
	nr = 9;
	permanent = False;
	condition = DIA_Ekor_SausageAndCheese_condition;	
	information = DIA_Ekor_SausageAndCheese_info;
	description = "� ������� � ��� ���� �������� ������ ���������?";
};
func int DIA_Ekor_SausageAndCheese_condition(){
	
	if(GG_PrinesTravi_Ekoru)	{	return TRUE;};
};
func void DIA_Ekor_SausageAndCheese_info()
{
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_00");	//� ������� � ��� ���� �������� ������ ���������?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_00");	//�� ������, ��� ������ ���������� ����-������ ���������, ��� ������.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_01");	//� ������ ���������, ��� �� ��� ������ �� ���������� � ��� ��������, ��� ���� �������� ��� ����.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_01");	//(������) �������, ��� ��� ���� �� ������� ��������, ����� �� ����� ��������?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_02");	//�� ���� �������, ������� �������, � ���� ������ ����� � ��� ������ ����������.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_03");	//���� ���� �� �������� ���, � ���� ��, � ��� ����� ��������� ���-����� ������������.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_02");	//����� ������� �� ����������? ��-�... ��� ��� �������� ������?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_04");	//���� � ����� ������ �������� �������� �������� ��� �������� � ������� ���� ����������� ������������� ���������� ������� ���� �������.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_05");	//������� �������� �������� ��� ���� �� �������, ��������� ������� ����������� ����� � ������� �����, ���������� ����� ������.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_06");	//�������������, � ��������� ������ ��������� � ���� ��������������� ����������, ��������� �������������� ������ ���������� �����������.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_03");	//� ������� ��, ��� ���-�� ����� ������ � ��������� � ������� �����.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_07");	//� �����! ��� ����� ����� �������.
	
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_04");	//(�������) �����? ���� ��� ���� ��� ��������.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_05");	//� ��� ��� �� ������?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_08");	//��� ���? � �������. ����� ����� � ���� � ��������� ������� �����, ��� ���� �� � ����������.
	
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_06");	//(��� ����) ���� �� �������, �� �������.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_07");	//� ���� ������� ����� �����������, ��� ����������� �������� ���� ����� �����? � ��� � �������� ��� ���� ������� �������.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_09");	//��� ������ ������. �� ����� ������� � ������ ������� ������, �� �� ������� �� ������� �� �����.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_10");	//�� ������ ������, � ���� �� ���� �� �����, ����� �� �����. �� ��������� ���, �������� � �� �����, � ����� ��������, ��� �� ����� �� ������ ������ ������ �� ��������� ����.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_08");	//�� ���� ��� �� �������� ��� �������?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_11");	//�� ��� ��� ������, ������ ������������� �������� �� �����.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_12");	//� ������, ��� � ���� ���� ������� ���� ��������� ���� � �������� �����, ������ � �� ����, ��� �� ������� ��� �����������...
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_13");	//���� �����, ��� �� ������ �� ��������� ������� ������� ���� �� ������ ������.
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_14");	//������, ���� ���������. ���� ������ ������� �������� ��������, �� ����� ����, � ����� ������ �����.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_09");	//��������, � ���� ����. ��� ��� ����� ����� �����?
		AI_Output(self,other,"DIA_Ekor_FindPlants_03_15");	//���� �� ����, � ���� ��� ������� ��� ��������, �� �����, ��� ��� ������������ ��� � ������ ���������. ��� ����������� ��� �������� �����.
	AI_Output(other,self,"DIA_Ekor_FindPlants_15_10");	//������, ��� ��� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_EkorSendToDragon);
	
};
//
//�� �� ������ ������? //���� ��� ���� ����� ��������� ������
//
instance DIA_Ekor_AboutGurun(C_Info)	//�� �� ������ ������?	nr=8
{
	npc = OUT_400_DS2P_Ekor;
	nr = 8;
	permanent = False;
	condition = DIA_Ekor_AboutGurun_condition;	
	information = DIA_Ekor_AboutGurun_info;
	description = "�� �� ������ ������?";
};
func int DIA_Ekor_AboutGurun_condition(){
	
	if(GG_PrinesTravi_Ekoru && 	Hero_Knows_Gurun)	{	return TRUE;};
};
func void DIA_Ekor_AboutGurun_info()
{
	AI_Output(other,self,"DIA_Ekor_AboutGurun_15_00");	//�� �� ������ ������?
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_00");	//��� ���� ����������� �������? ����, ���� ����� ���������� �����, �� ������ ����������� �������� �������������.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_01");	//����� ��������� ����� �� ����� �������� ���������� ���� ������. � ������ �� ����� ���� ���������, ���� �� �� �����.
	AI_Output(other,self,"DIA_Ekor_AboutGurun_15_01");	//� �� ��� ������ ���-�� �������, ������ ������ � �������� � ������� � ������� ���������� ����?
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_02");	//� � ��� ��� �������. �� ����� �� ��� ������� ��������, �� ���� ������� � ����� � ���, ��� �����-���� ����� �������.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_03");	//�� �������� �� ������� ������ ���������� �����, ������� ������ ����������� � ��� �������. ������� �� ����, �� ���� ��� ������� � �������.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_04");	//� �� ���� ������ ��� �� �������, ��� ��� ��� ����� ������������� �� ��������� ����������, ���������� �� �������� ���������� ��������� ���������� �������, � �����.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_05");	//�� ���� ���, ��� ���� �������� �� ������.
	AI_Output(other,self,"DIA_Ekor_AboutGurun_15_02");	//� ��� �� ���������?
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_06");	//� ����� ��� � ���� ��� �����.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_07");	//����� ��������� ����� �� ������� ������������ �� ���, ������ ������� ������ ��������, ������� � ��� �� ���� �� �����, � ��� ���� ���-���� � ���� ��������.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_08");	//��������� ����� �� � ����������� ��� ����� ������� ������. ��� ����� �� ��� ������ � ��� � ���� ��� ������.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_09");	//� ���� ��� ������� ���-�� ����� ������� ���� � ���� ���� ��������. �� ��� ���� ��� ����������� ��� �������������.
	AI_Output(other,self,"DIA_Ekor_AboutGurun_15_03");	//�������� �������� ��� ����, ��� ������ ����� ������.
		AI_Output(self,other,"DIA_Ekor_AboutGurun_03_10");	//������� �������, �� ������������� �� ��� ����. ��� �������� ���� �������� ���� ��� �� ����, ��� � �� �����.
	
};

//
//� ���� ���� �����-������ ����� �� �������? + ��������
//
instance DIA_Ekor_AboutTrade(C_Info)	//� ���� ���� �����-������ ����� �� �������?	nr=900
{
	npc = OUT_400_DS2P_Ekor;
	nr = 900;
	permanent = False;
	condition = DIA_Ekor_AboutTrade_condition;	
	information = DIA_Ekor_AboutTrade_info;
	description = "� ���� ���� �����-������ ����� �� �������?";
};
func int DIA_Ekor_AboutTrade_condition(){
	
	if(GG_PrinesTravi_Ekoru)	{	return TRUE;};
};
func void DIA_Ekor_AboutTrade_info()
{
	AI_Output(other,self,"DIA_Ekor_AboutTrade_15_00");	//� ���� ���� �����-������ ����� �� �������?
		AI_Output(self,other,"DIA_Ekor_AboutTrade_03_00");	//� ��� � ��-������ ��������� ��� ��� �����?	
};
//��������
var int DIA_Ekor_Trade_once;
instance DIA_Ekor_Trade(C_Info)	//� ���� ���� �����-������ ����� �� �������?	nr=900
{
	npc = OUT_400_DS2P_Ekor;
	nr = 900;
	permanent = TRUE;
	condition = DIA_Ekor_Trade_condition;	
	information = DIA_Ekor_Trade_info;
	description = "������, ��� � ���� ���� �� �������.";
};
func int DIA_Ekor_Trade_condition(){
	
	if(Npc_KnowsInfo(other,DIA_Ekor_AboutTrade))	{	return TRUE;};
};
func void DIA_Ekor_Trade_info()
{
	AI_Output(other,self,"DIA_Ekor_Trade_15_00");	//������, ��� � ���� ���� �� �������.
		AI_Output(self,other,"DIA_Ekor_Trade_03_00");	//�������.
	B_GiveTradeInv(self);
	if(!DIA_Ekor_Trade_once){
		B_DSG_Log_OpenClose(TOPIC_TraderOther,LOG_NOTE,-1,"��������� ���� ������� ����� � �����.");
		DIA_Ekor_Trade_once = TRUE;
	};
};
//
//����� ����-������ � ���� ���������? + �������� � ��������� �����
//
instance DIA_Ekor_TeachPre(C_Info)	//����� ����-������ � ���� ���������?	nr=800
{
	npc = OUT_400_DS2P_Ekor;
	nr = 800;
	permanent = False;
	condition = DIA_Ekor_TeachPre_condition;	
	information = DIA_Ekor_TeachPre_info;
	description = "����� ����-������ � ���� ���������?";
};
func int DIA_Ekor_TeachPre_condition(){
	
	if(GG_PrinesTravi_Ekoru)	{	return TRUE;};
};
func void DIA_Ekor_TeachPre_info()
{
	AI_Output(other,self,"DIA_Ekor_TeachPre_15_00");	//����� ����-������ � ���� ���������?
		AI_Output(self,other,"DIA_Ekor_TeachPre_03_00");	//�����, �� �� ���������.	
};

//NS - 25/04/2016 ===========
// ����� "�������� �������� �������"
//===========================

//��� ������� ���� 4 �������� ��������
instance DIA_Ekor_GiveAncientPlates(C_Info)
{
	npc = OUT_400_DS2P_Ekor;					nr = 20;
	condition = DIA_Ekor_GiveAncientPlates_condition;	
	information = DIA_Ekor_GiveAncientPlates_info;
	description = "� ���� ��� ���� �������.";
};
func int DIA_Ekor_GiveAncientPlates_condition(){
	
	if((MIS_DS2P_AncientStonePlates == LOG_Running) 
		&& (Npc_HasItems(other, ITWR_ANCIENTSTONEPLATE) >= 4))
	{	return TRUE;};
};
func void DIA_Ekor_GiveAncientPlates_info()
{
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_15_01");	//� ���� ��� ���� �������.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_02");	//�������? �� �����?
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_15_03");	//���, �� ������ ������� ��������.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_04");	//��� ���? �� �����, ��� �� � ��� ������. ������ ����� - ������, ��� ������ ���������� ��� �� ����� ������ � ������ ������ �� ���������.
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_15_05");	//��� ���� �� ����� �������? ������ ����� �������. ������!
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_06");	//��, ����! ����, ��� ���� ��� - ���� ���. ��� ��� �� �������?
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_15_07");	//��������� �������� ��������. ��� ���.
	//�� �������� �������� ��������.
	B_GiveInvItems(other,self,ITWR_ANCIENTSTONEPLATE,4);
	MIS_DS2P_AncientStonePlates_Delivered = TRUE;
	//������ � �������� "�������� �������� �������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running,TOPIC_DS2P_AncientStonePlates_Delivered);
	B_GivePlayerXP(XP_MIS_AncientStonePlates_Plates);
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_08");	//���! ����� ��� ��� ��. 
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_03_09");	//���, �� ��� �����? �� ��, ����� ��� �� ���� �� �������� �� �������. ���, ������ ��� ����� ����.
	//�������� ���� ������������ �����, ���������� ����.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Ekor_GiveAncientPlates);
	Info_AddChoice(DIA_Ekor_GiveAncientPlates,"����� � �����.",DIA_Ekor_GiveAncientPlates_Ciao);
	Info_AddChoice(DIA_Ekor_GiveAncientPlates,"����� ������?",DIA_Ekor_GiveAncientPlates_Question);
};
func void DIA_Ekor_GiveAncientPlates_Ciao()
{
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Ciao_15_01");	//����� � �����.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Ciao_03_02");	//��, ��. ���� �����, � ���� ��� ��� ������� ������ ������ �� ���������...
	Info_ClearChoices(DIA_Ekor_GiveAncientPlates);
	//������ � �������� "�������� �������� �������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_AncientStonePlates_Success1);
};
func void DIA_Ekor_GiveAncientPlates_Question()
{
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//����� ������?
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//(��������� � ����) �����, �� �������� ���� �� ����� ����������� ����? 
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//�����, ���������, ������ ������ - � ���� �����������.
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//�����, �� �� ������, ������ ��� �������� �������� ������� �� ���� �������?
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//��� � � ������� ��������. � ��� ����� ����� ������������ ��� ����� ��������, � ������ ���� ������ ��� ��� �������.
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//������ ��� ���-��� �������� � �����������, ����� ������� �������� ����� ��������. 
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//������ - ��� �� ����� ���� ���� - ���� �� �������� ����� ����� ��� �����. ����� ��� �������� ���� ����� � ����� ��� ��������.
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//�� � �� ����� �� ���� ������� ������, �������� �� �� ���������. ������ ��� � ���������, ������ ��� ������� ��������.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//(��������) �����������, ������ �� �������� ���������� � ������� ������������. ���� ���������. 
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//� ��� ���-������ ������ ���������� �� ���� ������? ����� ����, �� � ���� �� ������?
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//��, � ���-��� ���� �� �� ����� � �������, �� ������� �� ���� �����������. 
		AI_Output(other,self,"DIA_Ekor_GiveAncientPlates_Question_15_01");	//������� ����� ���� ����� ���������� � ��� ��� ����, ������� ������� �� ����. �� ������ �� �� ����� �������� ������� ��� ���������.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//��, ����� ������, ���������� �� �� ���������� ������ �������� �� �� �����? � ��������� � ��������� �����������, ����������� ��������� ��������.
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//���� ������ ����� ������� ������ ������� ������, ����� � � ��������� ��������� �������, ��� ������ ������������ ������� ������ ����� 
	AI_Output(self,other,"DIA_Ekor_GiveAncientPlates_Question_03_02");	//�, ������������ ���� ��������� ������: ������� ����� �������.
	Info_ClearChoices(DIA_Ekor_GiveAncientPlates);
	//������ � �������� "�������� �������� �������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running,TOPIC_DS2P_AncientStonePlates_AskVatras);
};
// --------------------------------------------
instance DIA_Ekor_GiveVatrasNotes(C_Info)
{
	npc = OUT_400_DS2P_Ekor;					nr = 21;
	condition = DIA_Ekor_GiveVatrasNotes_condition;	
	information = DIA_Ekor_GiveVatrasNotes_info;
	description = "� ������ ���� ������ �������.";
};
func int DIA_Ekor_GiveVatrasNotes_condition(){
	
	if((MIS_DS2P_AncientStonePlates == LOG_Running) 
		&& (Npc_HasItems(other, ItWr_DS2P_VatrasNotes)))
	{	return TRUE;};
};
func void DIA_Ekor_GiveVatrasNotes_info()
{
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_15_01");	//� ������ ���� ������ �������.
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_15_02");	//����� ����������� �������� ������ � ������ ��� ������� �� �� �������� � �������.
	//���� ������ �������
	B_GiveInvItems(other,self,ItWr_DS2P_VatrasNotes,1);
	AI_UseItem(self,Fakescroll_Addon);
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_03");	//(���������) ��� ������������� ��������� ���. ������� �����...
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_04");	//� ����� �������� �� ����� � ����� �������� ������������ � �������� �������� ���������.
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_05");	//� ��� ��� ����� �����������������... ����, �����, ������, ���, �����������, �������...
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_15_06");	//���...
	//������ � �������� "�������� �������� �������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running,TOPIC_DS2P_AncientStonePlates_NotesGiven);
	B_GivePlayerXP(XP_MIS_AncientStonePlates_Notes);
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_07");	//���? �� ��, ���� �������. 
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_03_08");	//� ���� ���������� ���� ��������� ������� ����� ��� ������. ��� ��������?
	Info_ClearChoices(DIA_Ekor_GiveVatrasNotes);
	Info_AddChoice(DIA_Ekor_GiveVatrasNotes,"������.",DIA_Ekor_GiveVatrasNotes_Knowledge);
	Info_AddChoice(DIA_Ekor_GiveVatrasNotes,"�����.",DIA_Ekor_GiveVatrasNotes_Potions);
};
func void DIA_Ekor_GiveVatrasNotes_Potions()
{
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_Potions_15_01");	//�����.
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_Potions_03_02");	//���, ������. � ������ ������ ����.
	//���� ���� ����� ��������� ����, ���� ����� � ���� ������� �����, ����������������� ����.
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Mana_03,2);
	//������ � �������� "�������� �������� �������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_AncientStonePlates_Success2);
	AI_StopProcessInfos(self);
};
func void DIA_Ekor_GiveVatrasNotes_Knowledge()
{
		AI_Output(other,self,"DIA_Ekor_GiveVatrasNotes_Knowledge_15_01");	//������.
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_Knowledge_03_02");	//� �� �� ��� ����, ��� ��������. 
	AI_Output(self,other,"DIA_Ekor_GiveVatrasNotes_Knowledge_03_03");	//������, � ������ ����, ��� ����� ��������� ����������� �������� � ����� ������ ������ �����.
	//���������� ��������� ���� +5 � ��������
	B_RaiseAttribute(other, ATR_MANA_MAX, 5);
	Teach_Ekor = TRUE;
	//������ � �������� "�������� �������� �������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_AncientStonePlates_Success3);
	//������ � �������� � ������� "������� ��� �������"
	B_DSG_Log_OpenClose(TOPIC_TeacherOther,LOG_NOTE,-1,"��������� ���� �������� ���� � ������ ����� �����.");
	Info_ClearChoices(DIA_Ekor_GiveVatrasNotes);
};


//NS - 05/05/2016 ===========
// �������� ������ �����
//===========================
instance DIA_Ekor_Teach_Mage(C_Info)
{
	npc = OUT_400_DS2P_Ekor;					nr = 50;
	permanent = TRUE;
	condition = DIA_Ekor_Teach_Mage_condition;	
	information = DIA_Ekor_Teach_Mage_info;
	description = "����� ����.";
};
func int DIA_Ekor_Teach_Mage_condition(){
	
	if(TEACH_Ekor)
	{	return TRUE;};
};
func void DIA_Ekor_Teach_Mage_info()
{
		AI_Output(other,self,"DIA_Ekor_Teach_Mage_15_01");	//����� ����.
	AI_Output(self,other,"DIA_Ekor_Teach_Mage_03_02");	//���������, �� ��� �� ��������.
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
	Info_AddChoice(DIA_Ekor_Teach_Mage,Dialog_Back,DIA_Ekor_Teach_Mage_Back);
	if (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0) {
		Info_AddChoice(DIA_Ekor_Teach_Mage,
			b_Ds_buildString_TeachPayment_Talent(hero,"1 ���� �����.",NPC_TALENT_MAGE,1,0),
			DIA_Ekor_Teach_Mage_1); 
	}
	else if (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) {
		Info_AddChoice(DIA_Ekor_Teach_Mage,
			b_Ds_buildString_TeachPayment_Talent(hero,"2 ���� �����.",NPC_TALENT_MAGE,2,0),
			DIA_Ekor_Teach_Mage_2); 
	} 
	else if (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) {
		Info_AddChoice(DIA_Ekor_Teach_Mage,
			b_Ds_buildString_TeachPayment_Talent(hero,"3 ���� �����.",NPC_TALENT_MAGE,3,0),
			DIA_Ekor_Teach_Mage_3); 
	};
};
func void DIA_Ekor_Teach_Mage_Back()
{
		AI_Output(other,self,"DIA_Ekor_Teach_Mage_Back_15_01");	//� ������ ���.
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
};
func void DIA_Ekor_Teach_Mage_1()
{
	if (B_TeachMagicCircle(self,other,1)) {
		AI_Output(self,other,"DIA_Ekor_Teach_Mage_1_03_01");	//�����, ����� �������� ������������ ������, ����� ������� ���������� ������� �����.
	};
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
};
func void DIA_Ekor_Teach_Mage_2()
{
	if (B_TeachMagicCircle(self,other,2)) {
		AI_Output(self,other,"DIA_Ekor_Teach_Mage_2_03_01");	//� �� � ������ �� ��� �� ���. �� ������ ������������ ���������� ������� �����.
	};
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
};
func void DIA_Ekor_Teach_Mage_3()
{
	if (B_TeachMagicCircle(self,other,3)) {
		AI_Output(self,other,"DIA_Ekor_Teach_Mage_3_03_01");	//���������� - �� ������ ���������� �������� �����. ��� ��� ����� ������� ��������� ������.
		AI_Output(self,other,"DIA_Ekor_Teach_Mage_3_03_02");	//�� ���� ���, ������. � � ��� �������� �� ���� ���� �������, � ��� � ���� ����.
		TEACH_Ekor = FALSE;
	};
	Info_ClearChoices(DIA_Ekor_Teach_Mage);
};
