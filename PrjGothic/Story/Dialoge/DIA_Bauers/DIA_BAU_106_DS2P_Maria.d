instance DIA_Maria_EXIT(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Maria_EXIT_condition;	
	information = DIA_Maria_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Maria_EXIT_condition(){	return TRUE;};
func void DIA_Maria_EXIT_info(){	AI_StopProcessInfos(self);};
//
//**--��������� ������----***//
//
instance DIA_Maria_Start(C_Info)	//��������� ������ "������. ��� ��?"	nr=1;
{
	npc = BAU_106_DS2P_Maria;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Maria_Start_condition;	
	information = DIA_Maria_Start_info;
	description = "������! ��� ��?";
};
func int DIA_Maria_Start_condition(){	return TRUE;};
func void DIA_Maria_Start_info()
{
	AI_Output(other,self,"DIA_Maria_Start_15_00");	//������. ��� ��?
	AI_Output(self,other,"DIA_Maria_Start_17_00");	//���� ����� �����, � � ���� �������, ������ �������, � ����� ������� ���������.
	AI_Output(self,other,"DIA_Maria_Start_17_01");	//� ������ �� ������ ���� � ����� �������. �� ���� �� �������?
	AI_Output(other,self,"DIA_Maria_Start_15_01");	//���, � ������ ������ ������� �� �������. � ������� � �� ���� �������� ���������.
	AI_Output(self,other,"DIA_Maria_Start_17_02");	//���-�� � ��������� ����� ��� ������ ���������� ���������� �������������. (������� �������)
};
//----
//���������� ����� ���������� "������. ��� ��?"
//----
instance DIA_Maria_TellMeWhatHappenedToU(C_Info)	//��������, ��� � ��� ���������.	nr=5;
{
	npc = BAU_106_DS2P_Maria;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Maria_TellMeWhatHappenedToU_condition;	
	information = DIA_Maria_TellMeWhatHappenedToU_info;
	description = "��������, ��� � ��� ���������.";
};
func int DIA_Maria_TellMeWhatHappenedToU_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_TellMeWhatHappenedToU_info()
{
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_00");	//��������, ��� � ��� ���������.
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_00");	//� ����� �� �� ������?
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_01");	//������ ������ ����� ������ � ������� � ����������, � �� ��������� ��� ��� ������� � ����������� ���� ��������.
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_02");	//� ��� ����� ��������, � ���� �� ����, ��� ��� ����� ����������.
	
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_01");	//����� ���� ��� ������� ����? � ������� �� ���� ������� �������?!
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_02");	//���� ������ �������� �� ������ � ����������� ����������, ������ �������� �� �������.
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_03");	//���� ����� ���� � ������ �������������, �� ����� ���������� ������.
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_03");	//(���������� �������) �� ��������? �������, � ��� ���������?
	
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_04");	//�� ������ ������, � �� ���������. ����� ������� � ���, ��� �� ������, �������� ��� ������� ������� �������.
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_04");	//��, �� ����.
};
//----
//���������� ����� ���������� "������. ��� ��?"
//----
instance DIA_Maria_CanIBuyUMeal(C_Info)	//� ���� ������ � ���� ���?	nr=6;
{
	npc = BAU_106_DS2P_Maria;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Maria_CanIBuyUMeal_condition;	
	information = DIA_Maria_CanIBuyUMeal_info;
	description = "� ���� ������ � ���� ���?";
};
func int DIA_Maria_CanIBuyUMeal_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_CanIBuyUMeal_info()
{
	AI_Output(other,self,"DIA_Maria_CanIBuyUMeal_15_00");	//� ���� ������ � ���� ���?
	AI_Output(self,other,"DIA_Maria_CanIBuyUMeal_17_00");	//��, �������.
	AI_Output(self,other,"DIA_Maria_CanIBuyUMeal_17_01");	//��� ����������, ��� ������ � ������������� �� ������� ����� ������� � ������ � ��������� �������� �������.
	AI_Output(self,other,"DIA_Maria_CanIBuyUMeal_17_02");	//�������, ���� ���� ���-�� �����, ���������. ��� � ���� �������������.
	B_DSG_Log_OpenClose(TOPIC_BauerTrader,LOG_NOTE,-1,"�������� ����� ������� ��������.");
};
//----
//���������� ����� ����������� "� ���� ������ � ���� ���?".  ��������
//----
instance DIA_Maria_Trade(C_Info)	//������ ���� ������.		nr=6;
{
	npc = BAU_106_DS2P_Maria;
	nr = 6;
	permanent = TRUE;
	condition = DIA_Maria_Trade_condition;	
	information = DIA_Maria_Trade_info;
	description = "������ ���� ������.";
	trade = TRUE;
};
func int DIA_Maria_Trade_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_Trade_info()
{
	AI_Output(other,self,"DIA_Maria_Trade_15_00");	//������ ���� ������.
	AI_Output(self,other,"DIA_Maria_Trade_17_00");	//�������.
	B_GiveTradeInv(self);
};
//----
//���������� ����� ���������� "������. ��� ��?"
//----
instance DIA_Maria_HasVillageWitchDoctor(C_Info)	//� ������� ���� �������?		nr=7;
{
	npc = BAU_106_DS2P_Maria;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Maria_HasVillageWitchDoctor_condition;	
	information = DIA_Maria_HasVillageWitchDoctor_info;
	description = "� ������� ���� �������?";
};
func int DIA_Maria_HasVillageWitchDoctor_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_HasVillageWitchDoctor_info()
{
	AI_Output(other,self,"DIA_Maria_HasVillageWitchDoctor_15_00");	//� ������� ���� �������? �� ���� ������� ����, � ��� ������ �������� ��� �������� ������ ���� ��������.
	AI_Output(self,other,"DIA_Maria_HasVillageWitchDoctor_17_00");	//����������!
	AI_Output(self,other,"DIA_Maria_HasVillageWitchDoctor_17_01");	//������ ������� ����� ����. ��� ��� ��������� /*Redleha: ���-�� � ���-��. ���� ���������*/.
	AI_Output(self,other,"DIA_Maria_HasVillageWitchDoctor_17_02");	//� �������, ��� �� �� ������� ���� � ������. ������, ���� �������� �������������. ���� ������� �� ������ ������ ������ ���, �� ����� �� �������.
	AI_Output(other,self,"DIA_Maria_HasVillageWitchDoctor_15_01");	//� ��� ����.
};
//----
//���������� ����� ���������� "������. ��� ��?"
//----
var int C_DIA_Maria_ImVeryHungry_FirstDialog;
instance DIA_Maria_ImVeryHungry(C_Info)	//� ����� �������. (����������)		nr=8;
{
	npc = BAU_106_DS2P_Maria;
	nr = 8;
	permanent = TRUE;
	condition = DIA_Maria_ImVeryHungry_condition;	
	information = DIA_Maria_ImVeryHungry_info;
	description = "� ����� �������.";
};
func int DIA_Maria_ImVeryHungry_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_ImVeryHungry_info()
{
	AI_Output(other,self,"DIA_Maria_ImVeryHungry_15_00");	//� ����� �������. ��� �� � ���� ����-������ ������?
	if(!C_DIA_Maria_ImVeryHungry_FirstDialog)
	{
		AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_00");	//(���������) �� ������ �� ������.
		AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_01");	//������� �����, ��-����� ��� ����� ����,  �������� ������� ����, ��� ��������� � ������.
		AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_02");	//���� �� � �� ���� �� �������� ��� �������, �����, �� �� ���� �� ������, ���� � ��� ���� ������� ������� �� ����� ���������� �������.
		B_GiveInvItems(self,other,ItFo_DS2P_StewMaria,1);
		C_DIA_Maria_ImVeryHungry_FirstDialog = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_MariaSoups,LOG_NOTE,-1,"��� � ���� ����� �������� � �������� ����� ������ ����.");
	}
	else
	{
		if(Wld_GetDay() > Maria_GiveStew_Day)
		{
			AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_03");	//����� ���� ������.
			B_GiveInvItems(self,other,ItFo_Stew,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_04");	//�� ��� ������� ���� ������ �������, ������� ������.
		};
	};
	Maria_GiveStew_Day = Wld_GetDay();
};
//----
//���������� ����� ���������� "������. ��� ��?" � (���� ���� ����� "���� � ����")
//----
instance DIA_Maria_WhereCanIFindGustav(C_Info)	//��� ��� ����� �������?		nr=9;
{
	npc = BAU_106_DS2P_Maria;
	nr = 9;
	permanent = FALSE;
	condition = DIA_Maria_WhereCanIFindGustav_condition;	
	information = DIA_Maria_WhereCanIFindGustav_info;
	description = "��� ��� ����� �������?";
};
func int DIA_Maria_WhereCanIFindGustav_condition()
{	if(Npc_KnowsInfo(other,DIA_Maria_Start) && (MIS_DS2P_TerrorInNight == LOG_Running))
		{	return TRUE;};	
};
func void DIA_Maria_WhereCanIFindGustav_info()
{
	AI_Output(other,self,"DIA_Maria_WhereCanIFindGustav_15_00");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Maria_WhereCanIFindGustav_17_00");	//�� ������ � ������� ���������� ���������� � ����. �������, � ��� ��� � �������.
	AI_Output(self,other,"DIA_Maria_WhereCanIFindGustav_17_01");	//�� �� �������� ��� ����� �����. ���� ���� ������� � ��� �����������, ����� ��� �� ����. � �� �������� � �����.
};
//----
//���������� ����� ���������� "������. ��� ��?" � (���� ���� ����� ������� ����)
//----
instance DIA_Maria_IBroughtFishFromHarok(C_Info)		//��� ��� ����� �������?		nr=10;
{
	npc = BAU_106_DS2P_Maria;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Maria_IBroughtFishFromHarok_condition;	
	information = DIA_Maria_IBroughtFishFromHarok_info;
	description = "� ������ ���� �� ������.";
};
func int DIA_Maria_IBroughtFishFromHarok_condition()
{	if(Npc_KnowsInfo(other,DIA_Maria_Start) && (MIS_DS2P_FishingBusiness == LOG_Running) && Npc_HasItems(other,ITMI_DS2P_FishBarrel))
		{	return TRUE;};	
};
func void DIA_Maria_IBroughtFishFromHarok_info()
{
	AI_Output(other,self,"DIA_Maria_IBroughtFishFromHarok_15_00");	//� ������ ���� �� ������.
	AI_Output(self,other,"DIA_Maria_IBroughtFishFromHarok_17_00");	//�, ��� ����� ������! � �� ��� ������ ����������� �����������. ����� �� ����.
	B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_FishBarrel,1,34);
	B_GiveInvItem_red(self,other,ItFo_DS2P_StewMaria,1,37);
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishingBusiness,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_FishingBusiness_Success);
};
//----
//���������� ����� ���������� "������. ��� ��?" � (���� ���� ����� ����� �������) 
//----
instance DIA_Maria_AboutGaron(C_Info)		//���� ��������, ��� ��������� � �������?		nr=11;
{
	npc = BAU_106_DS2P_Maria;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Maria_AboutGaron_condition;	
	information = DIA_Maria_AboutGaron_info;
	description = "���� ��������, ��� ��������� � �������?";
};
func int DIA_Maria_AboutGaron_condition()
{	if(Npc_KnowsInfo(other,DIA_Maria_Start) && (MIS_DS2P_GrandsonOfFisherman == LOG_Running))
		{	return TRUE;};	
};
func void DIA_Maria_AboutGaron_info()
{
	AI_Output(other,self,"DIA_Maria_AboutGaron_15_00");	//���� ��������, ��� ��������� � �������? ����� ������, ��� ������ ������� ��� � ���� �� ������.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_00");	//(��������) ��, ��� ���.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_01");	//���� ���� ����� ��� ��������� ��� � �������. �� ��������, �������, �������� ������, �� ������� ��� ������ ��� ������ �����������.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_02");	//��� ������� ��� � ������ � ����� ����, ���� �� �� ������� ��������. � ��� ��� � ��� ����� ���� � ������, �������� ��� �������.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_03");	//����� ����� ������ � ����, ������� ������� �������� ������� � ���� �� � ����, ���� ��� ������ � ��� ��������������� ��-������. � ���, ��� ���� �� �����, ������ ������� ������.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_04");	//� ������� ������ ��������� �� �������. �� �������� � ������������ ��������� ����.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_05");	//��� ������ �� ������ � ����, �� ��� ������. ����� ���� ��������������, ������������ ����� ��������� � ������.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_06");	//��, ��� ��� �� ��� ����, ������ ������ ��� �� �������. ����� ��������� ����� ������ ����� ���.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_07");	//�����, ��� ����� ������ �� ����������.
	
	AI_Output(other,self,"DIA_Maria_AboutGaron_15_01");	//��� ������ �����?
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_08");	//� ����� ��� ������. ���� � �� ���� ����� ��������� � ����.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_09");	//������ �������, ��� ���-������ �� ����������� ������� ������� ������.
	AI_Output(other,self,"DIA_Maria_AboutGaron_15_02");	//� ��� ����� ��� ������?
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_10");	//���� �� �������. ��-�����, ��� ����� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_MariaSeen);
};


//NS - 27/06/2013 ===========
// �� ������� "��� ����� ��� ������?" + "������ ��� ������" + "������ � �����"
//===========================

//----------------------------
// "��� ������ �� �������?"		nr=21
instance DIA_Maria_AboutStolenIron(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 21;
	condition = DIA_Maria_AboutStolenIron_condition;	
	information = DIA_Maria_AboutStolenIron_info;
	description = "��� ������ �� �������?";
};
func int DIA_Maria_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Maria_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Maria_AboutStolenIron_15_00");	//��� ������ �� �������?
		AI_Output(self,other,"DIA_Maria_AboutStolenIron_17_01");	//� � ������ ����? 
	AI_Output(other,self,"DIA_Maria_AboutStolenIron_15_02");	//�� ��� �� ���� ���, � �� ��������� ������, ��� ��� �����!
		AI_Output(self,other,"DIA_Maria_AboutStolenIron_17_03");	//��� ��� �������. ���� �� ��� � ��� �����. � ���� � ���� �������, �� ��� ��� �� ������, ��� � ����������� ������� ����������.
		AI_Output(self,other,"DIA_Maria_AboutStolenIron_17_04");	//����� �������� ���� ������ ��������.
	B_DSG_Bauers_AboutStolenIron_Counter();
};

//----------------------------
// "���� ������� ������."	�� ����� �������	nr=22
instance DIA_Maria_ImFromGustav(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 22;
	condition = DIA_Maria_ImFromGustav_condition;	
	information = DIA_Maria_ImFromGustav_info;
	description = "���� ������� ������.";
};
func int DIA_Maria_ImFromGustav_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_NooneConfess))
	{	return TRUE;	};
};
func void DIA_Maria_ImFromGustav_info()
{
	AI_Output(other,self,"DIA_Maria_ImFromGustav_15_00");	//���� ������� ������. � ������ ������� ��� ������.
		AI_Output(self,other,"DIA_Maria_ImFromGustav_17_01");	//(���������� �������) � ��� ������, ��� � ����-�� �������� � �������? �� ���-�� �������.
	AI_Output(other,self,"DIA_Maria_ImFromGustav_15_02");	//�� ������ �������, ��� � ���� ��� ������?
		AI_Output(self,other,"DIA_Maria_ImFromGustav_17_03");	//������ ��� � � ���� �������. � ���������� �� �������, � ��� �� ��������.
	AI_StopProcessInfos(self);
};

//----------------------------
// "��������. ���� �� �� ������� ������..."	����� �����������	nr=23
instance DIA_Maria_IfUWontReturnIron(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 23;
	condition = DIA_Maria_IfUWontReturnIron_condition;	
	information = DIA_Maria_IfUWontReturnIron_info;
	description = "��������. ���� �� �� ������� ������...";
};
func int DIA_Maria_IfUWontReturnIron_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_NooneConfess))
	{	return TRUE;	};
};
func void DIA_Maria_IfUWontReturnIron_info()
{
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_00");	//��������. ���� �� �� ������� ������ � ��������� �����, ������ ������ ����������� ��� �������, � ���� ����� ����� ������ �� ������, ������ ������ �������� �� ������, ���� ���-������ �� ���������.
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_01");	//���� �� ����������� �� ����� ���. ���� ������.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_02");	//(��������) ��� ������? � ���! ��� �� ������?
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_03");	//������� ����������.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_04");	//�� �... ����� �� ����� ��������. � ��� ��� ������, ������ �����... �� ��������!
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_05");	//� ���� ��� ������. �� ����������, ��� �� �������� ������, � � ������ ���, ��� ������ ����� ����������� �������� � �������, ��������� ������ �������.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_06");	//�� ������������� ��� ��������?
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_07");	//�������. � �� ����� ��� ������������� � ���������� �� �������.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_08");	//������, � ��������. ������ ����� ������ �������, ��������� ������� � ���.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_10");	//����� � ������ �������� � ���������� ������� � ����������.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_11");	//� ������ � �����, ��� ���� ����� ��������, � ��������� ������ ��� �� ����� � ����� ��������, � ����� ���� �����. ���� ��������.

	//�������� �������� � �������� ���������
	B_GiveInvItems(self,other,ItWr_DS2P_Message_Maria2Gustav,1);
	B_GiveInvItems(self,other,ItMi_DS2P_ProductsPacket_Maria,1);
	
	AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_12");	//��� � ���� ����� ���������?
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_13");	//� �����, ��� ����� ������� � ����, �������� �� �������. 
	// UNFINISHED ������� ������ � ����
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_14");	// /*Redleha: ��������� ���-�� � ���-��. ���� ���������*/

	//������ � �������� "������ � �����" 
	// UNFINISHED ������� ������ � ����
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Hunters);

	//������ � �������� "������ ��� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WeaponsToFight,LOG_MISSION,LOG_Running,TOPIC_DS2P_WeaponsToFight_Start);
	
	//������ � �������� "��� ����� ��� ������?" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WeaponsToFight,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_ReturnPart);
};

//----------------------------
// "��� ����� �������� ����?"	����� �����������	nr=24
instance DIA_Maria_WhoStoleIron(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 24;
	condition = DIA_Maria_WhoStoleIron_condition;	
	information = DIA_Maria_WhoStoleIron_info;
	description = "��� ����� �������� ����?";
};
func int DIA_Maria_WhoStoleIron_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_IfUWontReturnIron))
	{	return TRUE;	};
};
func void DIA_Maria_WhoStoleIron_info()
{
	AI_Output(other,self,"DIA_Maria_WhoStoleIron_15_00");	//��� ����� �������� ����?
		AI_Output(self,other,"DIA_Maria_WhoStoleIron_17_02");	//�� ��� ��� ������� � ���� �����������: �����, ����� � ���� ������ ������, � ������� �� ��������, � ��� ����� ������ �������.
	
	//������ � �������� "��� ����� ��� ������?"
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_MariaConfess);

	// ���� ��� �������� � �����
	var C_NPC Dil; Dil = Hlp_GetNpc(Bau_102_DS2P_Dil);
	if (Dil.aivar[AIV_TalkedToPlayer] == TRUE)
	{
	AI_Output(other,self,"DIA_Maria_WhoStoleIron_15_03");	//��� ����������, ��� ��� ������� �� � ����.
		AI_Output(self,other,"DIA_Maria_WhoStoleIron_17_04");	//�� ������ ������, �� ���� � ���� ���������� � ������, �� �� ��� ��������.
	};
};

//----------------------------
// "��� �� ������� ����������?"	����� ������� ��� ������� ������ (+����)	nr=25
instance DIA_Maria_WhereIsIron(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 25;
	condition = DIA_Maria_WhereIsIron_condition;	
	information = DIA_Maria_WhereIsIron_info;
	description = "��� �� ������� ����������?";
};
func int DIA_Maria_WhereIsIron_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_IfUWontReturnIron))
	{	return TRUE;	};
};
func void DIA_Maria_WhereIsIron_info()
{
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_00");	//��� �� ������� ����������?
	//(+����)
	B_GivePlayerXP(XP_MIS_WhoStoleMyIron_Found);
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_01");	//�� ��������� ��� ������ �� ��� �����: ��� ����� �������� � ���� � ���� ���� � �����, � ������ ������� � ����������� ��� ����.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_02");	//����� �� ������ ���� �������� � ����, � ��� ���� �� ���� ���� � ������. �� �� ������ ��� �� ����.
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_03");	//� ��� �� �� ������ ����� �������� ������ � ���� ����? 
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_04");	//����� ������ � � ������� ����, � ����� ���������� ������� ������. ����� �� ������ �� ����������.
	//������ � �������� "��� ����� ��� ������?"
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_3Parts);
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_05");	//��� �� �������?
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_06");	//�� ��� ���� �������?! ������ ���������. � �� ������ ���� �� ���� �������.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_07");	//� �������� �� ��������, � �����. ������� � ��� ���������, ����� ���� ������, ������� � ����������� � ������� � ������� �� �������� �����.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_08");	//�����������, ������ � ��� ��������� �� �����, � ����� ���������� ���� ���� ��� ������������ � ��������� ����� ��� ��������. � ������� ������.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_09");	//����� ���, ����� ��� ��� ����� ��� ����������, � ���������� �� �������� �����, ������� ��� � ������� ����� ���� ������.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_10");	//����� ��� ����� �����������, ��� ������� ��������� ��� � ���� ����, � ����� � ��������� ������� � ����� ���������.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_11");	//�� � ������ �������� ��������� ����� ��� �����������.
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_12");	//� ������ �� �� ��������� �����?
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_13");	//� ����� �� ��������, ������� ������ � ���������. � ����� ��������, �� ����������, ������, ��� ��� �������� ������� �� ����, ��� ��� ��� ������, � � ������ ������ �� �����.
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_14");	//����� ����.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_15");	//������. ��� ���� ����� � ����� �����.
	//���� 2 �����: ����� �� ������� ����, ����� �� ������� ������
	B_GiveInvItems(self,other,ITKE_KEY_DS2P_HUNO_CHEST,1);
	B_GiveInvItems(self,other,ITKE_KEY_DS2P_BAROK_CHEST,1);
};

//----------------------------
// "����� ����� �� � ����?"	����� ������� ��� ���������� ����	nr=26
instance DIA_Maria_AboutKadar(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 26;
	condition = DIA_Maria_AboutKadar_condition;	
	information = DIA_Maria_AboutKadar_info;
	description = "����� ����� �� � ����?";
};
func int DIA_Maria_AboutKadar_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_WhereIsIron) && !Npc_IsDead(Kadar))
	{	return TRUE;	};
};
func void DIA_Maria_AboutKadar_info()
{
	AI_Output(other,self,"DIA_Maria_AboutKadar_15_00");	//����� ����� �� � ����?
		AI_Output(self,other,"DIA_Maria_AboutKadar_17_01");	//����� � ��������� ����� ����� ���������. ������ ��� �����. � ���� �� ����, ����� �� ��� ��������. ���� � ����� ��������� ������.
		AI_Output(self,other,"DIA_Maria_AboutKadar_17_02");	//�� ������� ���� �������� ��� ���-������ ������.

};


//NS - 27/06/2013 ====================================================
// �� ������ "������ ��������"
//====================================================================

//----------------------------
// ��� ������ ���� ����� ��� ������� ��������?		nr=31
// ����� ������ ������
instance DIA_Maria_WhereGetStone4Mill(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 31;
	condition = DIA_Maria_WhereGetStone4Mill_condition;	
	information = DIA_Maria_WhereGetStone4Mill_info;
	description = "�� �� ������, ��� ���� ��� ���� ����� ��� ������� ��������?";
};
func int DIA_Maria_WhereGetStone4Mill_condition()
{
	if (MIS_DS2P_OldMill == LOG_Running){	return TRUE;	};
};
func void DIA_Maria_WhereGetStone4Mill_info()
{
	AI_Output(other,self,"DIA_Maria_WhereGetStone4Mill_15_00");	//�� �� ������, ��� ���� ��� ���� ����� ��� ������� ��������?
		AI_Output(self,other,"DIA_Maria_WhereGetStone4Mill_17_01");	//�� ���� �� ��������� �������������.
	AI_Output(other,self,"DIA_Maria_WhereGetStone4Mill_15_02");	//�� ���� ���� ��� ������ ��������� ��������.
		AI_Output(self,other,"DIA_Maria_WhereGetStone4Mill_17_03");	//��, � ����, �� ������� �� ������� � �����������. � ���� � ��� ���� ��� �� ���������, � ������� �� ������ ������ ���������� �� ��������.
	AI_Output(other,self,"DIA_Maria_WhereGetStone4Mill_15_04");	//��... ����� ����, �� ������, ��� � ���� ����� ������ ������� �� ����� �������?
		AI_Output(self,other,"DIA_Maria_WhereGetStone4Mill_17_05");	//(�������) � ��, �� ����� ������ ��, ��� ��� �� ���� �����. ��-��-��!
		AI_Output(self,other,"DIA_Maria_WhereGetStone4Mill_17_06");	//�����, �� ������, � ������� ���� �������� �� ���� ������. �� �� ������� � ����� ������������ �� �������.

	//������ � �������� "������ ��������" 
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldMill_AskTamir);
};


//NS - 28/06/2013 ====================================================
// �� ������ "�������� ��������"
//====================================================================

//----------------------------
// ����� �������� ��� �������, ����� ������ ������ 		nr=41
instance DIA_Maria_GetFoodSupplies(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 41;
	condition = DIA_Maria_GetFoodSupplies_condition;	
	information = DIA_Maria_GetFoodSupplies_info;
	description = "";
};
func int DIA_Maria_GetFoodSupplies_condition()
{
	if (MIS_DS2P_ShippingSupplies == LOG_Running){	return TRUE;	};
};
func void DIA_Maria_GetFoodSupplies_info()
{
	var int x;
	AI_Output(other,self,"DIA_Maria_GetFoodSupplies_15_00");	//���� �����, ����� � ����� ������� � ������.
		AI_Output(self,other,"DIA_Maria_GetFoodSupplies_17_01");	//��, �������-��! � �� � ��� ���������� ���� ��� �������.
		AI_Output(self,other,"DIA_Maria_GetFoodSupplies_17_02");	//�� ����, ����� ��� ������� ������� �� ������. �� � ��� �������.
		AI_Output(self,other,"DIA_Maria_GetFoodSupplies_17_03");	//����� ���� �������, ������ ��� ����. ��� ��������� ��� �� ������ � ���� ��������.
	//���� �������� ��� ��� ��������
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other, ItMi_DS2P_Packet_ProductSupplies, 1);
	};

	//������ � �������� "�������� ��������" 
	B_ds_LogEntry(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_FoodGot);
};

//----------------------------
// ����� ��� �������� ������ � ������ ���� 		nr=42
instance DIA_Maria_OnKadar_KaraDead(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 42;
	condition = DIA_Maria_OnKadar_KaraDead_condition;	
	information = DIA_Maria_OnKadar_KaraDead_info;
	important = TRUE;
};
func int DIA_Maria_OnKadar_KaraDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Kadar_KaraDead)){	return TRUE;	};
};
func void DIA_Maria_OnKadar_KaraDead_info()
{
		AI_Output(self,other,"DIA_Maria_OnKadar_KaraDead_17_00");	//��� ������? ���� ������?
	AI_Output(other,self,"DIA_Maria_OnKadar_KaraDead_15_01");	//��, ��� ��������� �� ���� ������.
		AI_Output(self,other,"DIA_Maria_OnKadar_KaraDead_17_02");	//(������) � ����, �� ���?!
	AI_StopProcessInfos(self);
};

//----------------------------
// �����, ���� �������� ������ � ������ ���� 		nr=43
instance DIA_Maria_AfterKadar_KaraDead(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 43;
	condition = DIA_Maria_AfterKadar_KaraDead_condition;	
	information = DIA_Maria_AfterKadar_KaraDead_info;
	important = TRUE;
};
func int DIA_Maria_AfterKadar_KaraDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_OnKadar_KaraDead) && (Npc_IsInState(self, ZS_Talk)))
	{	return TRUE;	};
};
func void DIA_Maria_AfterKadar_KaraDead_info()
{
		AI_Output(self,other,"DIA_Maria_AfterKadar_KaraDead_17_00");	//� �����, ����� �������� ������ � �����. �� ����� �� ������ ��� ������.
		AI_Output(self,other,"DIA_Maria_AfterKadar_KaraDead_17_01");	//�������, ������� ���� ����, � �� ������ � �����.
};

//----------------------------
// ����� ������ ������ 		nr=44
instance DIA_Maria_KadarDead(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 44;
	condition = DIA_Maria_KadarDead_condition;	
	information = DIA_Maria_KadarDead_info;
	important = TRUE;
};
func int DIA_Maria_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Maria_KadarDead_info()
{
		AI_Output(self,other,"DIA_Maria_KadarDead_17_00");	//������� ����, ������ �����...  (������) ����� �� ��� ������ �����������.
};


//NS - 03/07/2013 ================================================
// �� ������ "�������� �����"
//================================================================
// ��������� ����� ������ 		nr=50
instance DIA_Maria_CanUSewClothes(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 50;
	condition = DIA_Maria_CanUSewClothes_condition;	
	information = DIA_Maria_CanUSewClothes_info;
	description = "��� ����� ������.";
};
func int DIA_Maria_CanUSewClothes_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_GotForgeBellows))
	{	return TRUE;	};
};
func void DIA_Maria_CanUSewClothes_info()
{
	AI_Output(other,self,"DIA_Maria_CanUSewClothes_15_00");	//��� ����� ������. ����� ����, �� ������� ��� ����?
		AI_Output(self,other,"DIA_Maria_CanUSewClothes_17_01");	//� ���� ��� ���� �����, � �� ��������� �� ������ �������.
	AI_Output(other,self,"DIA_Maria_CanUSewClothes_15_02");	//��� ����� �����, � �������.
		AI_Output(self,other,"DIA_Maria_CanUSewClothes_17_03");	//�� ����� ��� ��� ������. � ��� ������ ������ ��������, � ������� ��� ���� �� �������. �����, ����� � ������� � ������� ���.
	// UNFINISHED �������, ��� ��������� ������ �� �������
		AI_Output(self,other,"DIA_Maria_CanUSewClothes_17_04");	//��� ��������� /*Redleha: ���-�� � ���-��. ���� ���������*/. ����� � ��������� � ����� ����.
	AI_Output(other,self,"DIA_Maria_CanUSewClothes_15_05");	//����� ������...
		AI_Output(self,other,"DIA_Maria_CanUSewClothes_17_06");	//���?
	AI_Output(other,self,"DIA_Maria_CanUSewClothes_15_07");	//�� ���, ������, ����������� ������...

	//������ � �������� "�������� �����" 
	// UNFINISHED �������, ��� ��������� ������ �� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_MariaBeet);
};

//------------------------------------------
// ������ ������ (+����) 		nr=51
instance DIA_Maria_GiveBeet(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 51;
	condition = DIA_Maria_GiveBeet_condition;	
	information = DIA_Maria_GiveBeet_info;
	description = "��� ���� ������.";
};
func int DIA_Maria_GiveBeet_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_CanUSewClothes) && (Npc_HasItems(other,ItPl_Beet) >= 10))
	{	return TRUE;	};
};
func void DIA_Maria_GiveBeet_info()
{
	AI_Output(other,self,"DIA_Maria_GiveBeet_15_00");	//��� ���� ������.
	//(+����)
	B_GivePlayerXP(XP_MIS_Gambler_Beet);
	//������ ������
	B_DS_GiveRemoveItems(other,self,ItPl_Beet,10);
		AI_Output(self,other,"DIA_Maria_GiveBeet_17_01");	//������. ��� ��� ��� �� ������ ������?
	AI_Output(other,self,"DIA_Maria_GiveBeet_15_02");	//��� �����, ����� �� ����� ��� ������� �� ����� �������. �������� �� ��� �����. ����� ���� ����� �� ���������.
		AI_Output(self,other,"DIA_Maria_GiveBeet_17_03");	//�������. ����� ���� ����� �������?
	AI_Output(other,self,"DIA_Maria_GiveBeet_15_04");	//��� �� ��� ����. ������ ������.
		AI_Output(self,other,"DIA_Maria_GiveBeet_17_05");	//�����, ���-������ ��������. ������� ������.

	Maria_ClothesReady_Day = Wld_GetDay() + 1;
	//������ � �������� "�������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_MariaAgreed);
};

//------------------------------------------
// ������� ������� (�� ��������� ���� ����� 8 ����)		nr=52
instance DIA_Maria_GetClothes(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 52;
	condition = DIA_Maria_GiveBeet_condition;	
	information = DIA_Maria_GiveBeet_info;
	description = "������� ������?";
};
func int DIA_Maria_GetClothes_condition()
{
	if ((Maria_ClothesReady_Day > Wld_GetDay())
		|| ((Maria_ClothesReady_Day == Wld_GetDay()) && Wld_IsTime(8,0,0,0))
		&& (Maria_MadeClothes == FALSE))
	{	return TRUE;	};
};
func void DIA_Maria_GetClothes_info()
{
	var int x;
	AI_Output(other,self,"DIA_Maria_GetClothes_15_00");	//������� ������?
		AI_Output(self,other,"DIA_Maria_GetClothes_17_01");	//��, ���, ��� ������� ������� �� ����. �� ������, ������ ������, ������� ���������� �� �����.
	AI_Output(other,self,"DIA_Maria_GetClothes_15_02");	//��� ��, ��� ��� �����.
	//�������� ��� �������
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_DS2P_Packet_WhiteClothes,1);
	};
	Maria_MadeClothes = TRUE;
	//������ � �������� "�������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_MariaReady);
};


//NS - 27/06/2013 =========================================================
// ��������
// ���� �� ���� �����, ��� ������
//=========================================================================

//----------------------------
// "����� ���� ���������� ����."	����� ������� ��� ���������� ���� 	nr=100
instance DIA_Maria_PreTeach_Theft(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 100;
	condition = DIA_Maria_PreTeach_Theft_condition;	
	information = DIA_Maria_PreTeach_Theft_info;
	description = "����� ���� ���������� ����.";
};
func int DIA_Maria_PreTeach_Theft_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_WhereIsIron))
	{	return TRUE;	};
};
func void DIA_Maria_PreTeach_Theft_info()
{
	AI_Output(other,self,"DIA_Maria_PreTeach_Theft_15_00");	//����� ���� ���������� ����.
		AI_Output(self,other,"DIA_Maria_PreTeach_Theft_17_01");	//����� ���� ���? � ��������, ������ ��� ��� ������ ���� ����, � ��� �� ������ ������� � ����� ��������?
	AI_Output(other,self,"DIA_Maria_PreTeach_Theft_15_02");	//��� �����, ����� ������ ���� �� ���� ������� ������������ �� ���, ������� ����� ������.
		AI_Output(self,other,"DIA_Maria_PreTeach_Theft_17_03");	//��� ��������� �����. � ���� ����� ����.

	//������ � �������� � ������� ��� ���� "������� � ��������" 
	B_DSG_Log_OpenClose(TOPIC_BauerTeacher,LOG_NOTE,-1,"����� ����� ������� ���� ���������� ����.");
	TEACH_Maria_Theft = TRUE;
};

//----------------------------
// �������� ��������� � �������� 	nr=101
// �� ���� �����, ��� ������
instance DIA_Maria_TEACH_Theft(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 101;
	condition = DIA_Maria_TEACH_Theft_condition;	
	information = DIA_Maria_TEACH_Theft_info;
	description = "����� ���� ���������� ����.";
	permanent = TRUE;
};
func int DIA_Maria_TEACH_Theft_condition()
{
	if (TEACH_Maria_Theft == TRUE)
	{	return TRUE;	};
};
func void DIA_Maria_TEACH_Theft_Menu()
{
	Info_ClearChoices(DIA_Maria_TEACH_Theft);
	Info_AddChoice(DIA_Maria_TEACH_Theft,Dialog_Back,DIA_Maria_TEACH_Theft_Back);
	Info_AddChoice(DIA_Maria_TEACH_Theft,"�������� ��������.",DIA_Maria_TEACH_Dex);
	var int Hero_PickpocketSkill; Hero_PickpocketSkill = Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET);
	if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_NONE)
	{
		Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_FIRST,-1),DIA_Maria_TEACH_Pickpocket1);
	}
	else if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_FIRST)
	{
		Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_SECOND,-1),DIA_Maria_TEACH_Pickpocket2);
	}
	else if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_SECOND)
	{
		Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_THIRD,-1),DIA_Maria_TEACH_Pickpocket3);
	};
	Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKLOCK,1,-1),DIA_Maria_TEACH_PickLock);
};
func void DIA_Maria_TEACH_Theft_info()
{
	AI_Output(other,self,"DIA_Maria_TEACH_Theft_15_00");	//����� ���� ���������� ����.
	DIA_Maria_TEACH_Theft_Menu();
};
func void DIA_Maria_TEACH_Theft_Back()
{
	Info_ClearChoices(DIA_Maria_TEACH_Theft);
};
// ����� ������ ------------------
func void DIA_Maria_TEACH_PickLock()
{
	AI_Output(other,self,"DIA_Maria_TEACH_PickLock_15_00");	//����� ���� ��������� �����.
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK,1))
	{
		// Bla bla bla...
	};
	DIA_Maria_TEACH_Theft_Menu();
};
// ��������� ����� ------------------
func void DIA_Maria_TEACH_Pickpocket1()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK,PICKPOCKET_LEVEL_FIRST))
	{
		// Bla bla bla...
	};
	DIA_Maria_TEACH_Theft_Menu();
};
func void DIA_Maria_TEACH_Pickpocket2()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK,PICKPOCKET_LEVEL_SECOND))
	{
		// Bla bla bla...
	};
	DIA_Maria_TEACH_Theft_Menu();
};
func void DIA_Maria_TEACH_Pickpocket3()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK,PICKPOCKET_LEVEL_THIRD))
	{
		// Bla bla bla...
	};
	DIA_Maria_TEACH_Theft_Menu();
};
// �������� ------------------
func void DIA_Maria_TEACH_Dex_Menu()
{
	Info_ClearChoices(DIA_Maria_TEACH_Theft);
	Info_AddChoice(DIA_Maria_TEACH_Theft,Dialog_Back,DIA_Maria_TEACH_Theft_Back);
	Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,1,-1),DIA_Maria_TEACH_Theft_Dex_1);
	Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,5,-1),DIA_Maria_TEACH_Theft_Dex_5);
};
func void DIA_Maria_TEACH_Dex()
{
	AI_Output(other,self,"DIA_Maria_TEACH_Dex_15_00");	//� �� ����� �������� ���� ��������.
	DIA_Maria_TEACH_Dex_Menu();
};
func void DIA_Maria_TEACH_Dex_DoIt(var int points)
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,points,T_MAX);
	DIA_Maria_TEACH_Dex_Menu();
};
func void DIA_Maria_TEACH_Theft_Dex_1()
{
	DIA_Maria_TEACH_Dex_DoIt(1);
};
func void DIA_Maria_TEACH_Theft_Dex_5()
{
	DIA_Maria_TEACH_Dex_DoIt(5);
};

//"��� ����� ������." - ����������, ���� ���� ����� "������"
// nr = 1

instance DIA_Maria_Dress4Sue(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 1;
	condition = DIA_Maria_Dress4Sue_condition;	
	information = DIA_Maria_Dress4Sue_info;
	description = "��� ����� ������.";
	permanent = FALSE;
};

func int DIA_Maria_Dress4Sue_condition()
{
	if (MIS_DS2P_Dress4Sue == Log_Running)
	{	
		return TRUE;	
	};
};

func void DIA_Maria_Dress4Sue_info()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_15_00");	//��� ����� ������.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_13_01");	//� ����� ��� ����?
	Info_ClearChoices(DIA_Maria_Dress4Sue);
	Info_AddChoice(DIA_Maria_Dress4Sue,"������� ��� ���������.",DIA_Maria_Dress4Sue_Sue);
	Info_AddChoice(DIA_Maria_Dress4Sue,"����� ���������. � ��� ��� ���������.",DIA_Maria_Dress4Sue_Nikki);
	Info_AddChoice(DIA_Maria_Dress4Sue,"���� ��������� �������� �� �� ������� �����-������ �������.",DIA_Maria_Dress4Sue_Wife);
	Info_AddChoice(DIA_Maria_Dress4Sue,"���� ���������.",DIA_Maria_Dress4Sue_Me);
};

// �����������, ���� ������� ������� "���� ���������" � ������� ����� "��� ����� ������."

func void DIA_Maria_Dress4Sue_Me()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Me_15_00");	//���� ���������.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Me_13_01");	//������-�� ���, ������. ���, ����������, ������ �������-���������. � � ������, ��� ��, �� ���� ����� ������� ���.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,Log_Running,TOPIC_DS2P_Dress4Sue_InProgress_01);
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "���� ��������� �������� �� �� ������� �����-������ �������." � ������� ����� "��� ����� ������."

func void DIA_Maria_Dress4Sue_Wife()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Wife_15_00");	//���� ��������� �������� �� �� ������� �����-������ �������.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Wife_13_01");	//� ������ � ���� �� ����? ��������!
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,Log_Running,TOPIC_DS2P_Dress4Sue_InProgress_01);
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "����� ���������. � ��� ��� ���������." � ������� ����� "��� ����� ������."

func void DIA_Maria_Dress4Sue_Nikki()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Nikki_15_00");	//����� ���������. � ��� ��� ���������.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Nikki_13_01");	//�� ��� ���. � ����� ���� �������, ��� ���� �� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,Log_Running,TOPIC_DS2P_Dress4Sue_InProgress_01);
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "������� ��� ���������." � ������� ����� "��� ����� ������."

func void DIA_Maria_Dress4Sue_Sue()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Sue_15_00");	//������� ��� ���������.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Sue_13_01");	//���?! �� �������! ������� � �� ������ ���� ��������� ��������� ���-�� �� ����� �����!
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Sue_15_02");	//�� ������?
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Sue_13_03");	//������ ��� ��� ������ ������ ���� �������, ������� ����� �����������, � � ��� ������ ��������� � ����? �� �� � �����!
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Sue_15_04");	//�����, ��������. ��� ����� �� ��������� ���� ������ �� ������ � ���� �� ������ ���� �� ���������. �� ��� ������ ���������� � �������� � �� ������� � ��� ���� ������ ��������� � ����.
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Sue_15_05");	//����� ���� ������� ��� � ���: �� �������, ���� ���� �� ������� ��������� ������ � ������ � ������? ���! ��� � ������� ��� ���� �� ��������, �� ��� ������.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Sue_13_06");	//��, �������� �� � ����, ���������. ������ ������� �� ����. �����, � ������ �� ������. �� �� 200 �������. � �� ������� ������.
	Info_ClearChoices(DIA_Maria_Dress4Sue);
	Info_AddChoice(DIA_Maria_Dress4Sue,"� ���� ���� ��� ����� �����, �� � �������.",DIA_Maria_Dress4Sue_NoGold);
	Info_AddChoice(DIA_Maria_Dress4Sue,"���, ����� ������.",DIA_Maria_Dress4Sue_HaveGold);
};

// �����������, ���� ������� ������� "���, ����� ������." � ������� ����� "��� ����� ������."

func void DIA_Maria_Dress4Sue_HaveGold()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_HaveGold_15_00");	//���, ����� ������.
	if (Npc_HasItems(other,ItMi_Gold) >= 200)    // ���� � �� ���� 200 �������
	{
		AI_Output(self,other,"DIA_Maria_Dress4Sue_HaveGold_13_01");	//������, ��� ������.
		// ������� ������ � ��������� ����� � ������ ��
		CreateInvItems(self,0,1); // UNFINISHED - ���� �������� ��� ������
		B_GiveInvItems(self,other,0,1); // UNFINISHED - ���� �������� ��� ������
		B_GiveInvItems(other,self,ItMi_Gold,200); // ������ 200 ������� �����
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Dress4Sue_HaveGold_13_02");	//������ �����, ���������, ����� ������.
		Maria_KnowAboutDress = TRUE;
	};
	Info_ClearChoices(DIA_Maria_Dress4Sue);
};

//UNFINISWHED
func void DIA_Maria_Dress4Sue_NoGold()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_NoGold_15_00");	//� ���� ���� ��� ����� �����, �� � �������.
	Info_ClearChoices(DIA_Maria_Dress4Sue);
};

//"���, ����� ������." - ����������, ���� ���� ����� "������", � ����� ������ ������� ������ ��
// nr = 1

instance DIA_Maria_SellDress(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 1;
	condition = DIA_Maria_SellDress_condition;	
	information = DIA_Maria_SellDress_info;
	description = "���, ����� ������.";
	permanent = TRUE;
};

func int DIA_Maria_SellDress_condition()
{
	if ((MIS_DS2P_Dress4Sue == Log_Running) && Maria_KnowAboutDress)
	{	
		return TRUE;	
	};
};

func void DIA_Maria_SellDress_info()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_HaveGold_15_00");	//���, ����� ������.
	if (Npc_HasItems(other,ItMi_Gold) >= 200)    // ���� � �� ���� 200 �������
	{
		AI_Output(self,other,"DIA_Maria_Dress4Sue_HaveGold_13_01");	//������, ��� ������.
		// ������� ������ � ��������� ����� � ������ ��
		CreateInvItems(self,0,1); // UNFINISHED - ���� �������� ��� ������
		B_GiveInvItems(self,other,0,1); // UNFINISHED - ���� �������� ��� ������
		B_GiveInvItems(other,self,ItMi_Gold,200); // ������ 200 ������� �����
		Maria_KnowAboutDress = FALSE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,LOG_Running,TOPIC_DS2P_Dress4Sue_InProgress_02);
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Dress4Sue_HaveGold_13_02");	//������ �����, ���������, ����� ������.
	};
};

//������������ �� ��������� ����, ����� ���������� ������ "����� ��������� ���������"
// nr = 1

instance DIA_Maria_AfterEscapedHunters(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 1;
	condition = DIA_Maria_AfterEscapedHunters_condition;	
	information = DIA_Maria_AfterEscapedHunters_info;
	description = "���� �������?";
};

func int DIA_Maria_AfterEscapedHunters_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == LOG_Success) && (EscapedHunters_QuestComplete - Wld_GetDay() >= 1))
	{	
		return TRUE;	
	};
};

func void DIA_Maria_AfterEscapedHunters_info()
{
	AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_00");	//���� �������?
	AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_01");	//(����������) ��� ��� ����� ��� ����� ����� �������� ���-�-���
	if (Hunters_IsNotKilled == FALSE) // ���� ����� ���������
	{
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_02");	//�� ����, ����� ���� ������ ��������. ��������, ����� ������� ���������.
		AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_03");	//��, ��, ��������, ����. �� ��� ����� ����� ������. ������� ��� ������� ������.
		AI_StopProcessInfos(self);
	}
	else // ���� �� ����� ���������
	{
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_04");	//������-�� � �� ������ ����� ��������.
		AI_PlayAni(other,"T_SEARCH");
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_05");	//(�������) ������ � ��������� ����. �� � ������� ����������������� �� ������. ���� ������ ������ ��������� ������� � �� ������ � �� ���� ��.
		AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_06");	//������? �� �� �����?
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_07");	//���������� ����� �������! � ��� ����� ������ ������� ��������� �����, ��� ��� ��� ������.
		AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_08");	//���������� ���� �����! ��� ����� ��������� ������� � ���� �����.
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_09");	//������ ����� �� ����. �� ������ ���� �����, ������ ����� �������� ����������. � �� � ���� �� ������, �� �� ������ �� ���������. � ��������, ����������, ������, � �� �� ��� ���������.
		AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_10");	//�������, � ���� �������. ���� �������. ������� ����.
		AI_StopProcessInfos(self);
	};
};
	