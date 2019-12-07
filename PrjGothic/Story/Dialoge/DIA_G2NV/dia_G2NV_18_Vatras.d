//*--------------------------------------------------------------------
//*---------   ������ �� ������� �� ��������� ����		-------------------
//*--------------------------------------------------------------------
prototype DIA_Vatras_EXIT(C_Info)	//�����
{
	npc = none_18_Vatras;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Vatras_EXIT_condition;	
	information = DIA_Vatras_EXIT_info;
	description = Dialog_Ende;
};
instance DIA_Vatras_EXIT_pre(DIA_Vatras_EXIT){npc = pre_none_18_Vatras;};
instance DIA_Vatras_EXIT_main(DIA_Vatras_EXIT){};
func int DIA_Vatras_EXIT_condition(){	return TRUE;};
func void DIA_Vatras_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_VATRAS_REINIT(C_Info)
{
	npc = pre_none_18_Vatras;
	nr = 1;
	permanent = TRUE;
	condition = DIA_VATRAS_REINIT_condition;	
	information = DIA_VATRAS_REINIT_info;
	description = "test_dialog";
};
func int DIA_VATRAS_REINIT_condition(){	return FALSE;};
func void DIA_VATRAS_REINIT_info(){	Print("1111111111111");};

instance DIA_Vatras_PreStart(C_Info)	//��������� ������ �� �������
{
	npc = pre_none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_PreStart_condition;	
	information = DIA_Vatras_PreStart_info;
	important = TRUE;
};
func int DIA_Vatras_PreStart_condition(){	return TRUE;};
func void DIA_Vatras_PreStart_info()
{	
	AI_Output(self,other,"DIA_Vatras_PreStart_05_00");	//� ��� ��������!
	AI_Output(self,other,"DIA_Vatras_PreStart_05_01");	//� ������� � �����, �� ���� �� ����� ������ � �������. ������, ���� ������������ � �� ����.
	AI_Output(self,other,"DIA_Vatras_PreStart_05_02");	//������� �������, ����� �������, ������, ������ ����. ��� ���������?
	AI_Output(other,self,"DIA_Vatras_PreStart_15_00");	//��... ��� �������� ����� �������. ���� ��� ����� ������������, �� ����� ������������ ����������� � �������-�������.
	AI_Output(other,self,"DIA_Vatras_PreStart_15_01");	//�� ������ ���-������ �����������?
	AI_Output(self,other,"DIA_Vatras_PreStart_05_03");	//�����, ��� ��� ���� ���� ������������.
	AI_Output(self,other,"DIA_Vatras_PreStart_05_04");	//� ���������� ��� ���, ����� ���� ���-�� �������� �������� � �������� � ������� �����. ��, ���...
	AI_Output(other,self,"DIA_Vatras_PreStart_15_02");	//����� �������� ������ ���� ������� � ������ ���� � ���������, ��� ��� ������� ��������, ���������� ������� ��������.
	AI_Output(self,other,"DIA_Vatras_PreStart_05_05");	//�� ����, ����� ������� �� ���� �����.
	AI_Output(other,self,"DIA_Vatras_PreStart_15_03");	//� ������� ����, � �� ���� ������ � ���������.
	AI_Output(self,other,"DIA_Vatras_PreStart_05_06");	//��, �������. � �������� ��� ���� ����������, ���� �����, ��� ���������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_Start);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_Talk2Jack);
	B_Kapitelwechsel(1,DSG_PREPROLOG_ZEN);
	AI_StopProcessInfos(self);
};

instance DIA_Vatras_AfterStart_Const(C_Info)	//���������� ������ � �������� �� �������
{
	npc = pre_none_18_Vatras;
	nr = 998;
	permanent = TRUE;
	condition = DIA_Vatras_AfterStart_Const_condition;
	information = DIA_Vatras_AfterStart_Const_info;
	description = "���� ���������?";
};
func int DIA_Vatras_AfterStart_Const_condition(){		if(Npc_KnowsInfo(other,DIA_Vatras_PreStart))	{	return TRUE;}	;};
func void DIA_Vatras_AfterStart_Const_info()
{	
	AI_Output(other,self,"DIA_Vatras_AfterStart_Const_15_00");	//���-������ ����������? ���� ���������?
	AI_Output(self,other,"DIA_Vatras_AfterStart_Const_05_00");	//���� ���, �� � ���� ����������!	
};
instance DIA_Vatras_BlaBlaBla(C_Info)	//��������
{
	npc = pre_none_18_Vatras;
	nr = 998;
	permanent = TRUE;
	condition = DIA_Vatras_BlaBlaBla_condition;
	information = DIA_Vatras_BlaBlaBla_info;
	description = "�������";
};
func int DIA_Vatras_BlaBlaBla_condition(){	return TRUE;};
func void DIA_Vatras_BlaBlaBla_info()
{	
	
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(�����4)",dia_BlaBlaBla);
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(�����3)",dia_BlaBlaBla);
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(�����2)",dia_BlaBlaBla);
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(�����1)",dia_BlaBlaBla);
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(�����)",dia_BlaBlaBla);
	//oCInfo_AddChoice(DIA_Vatras_BlaBlaBla,"123",2);
	//Npc_OpenInventory(hero,0);
	
	//var zCViewDialogChoice dialogchoices;
	//dialogchoices = _^(MEM_zCViewDialogChoicePtr);
	//dialogchoices.activeTextColor = COL_Aqua;
	//MEM_zCViewDialogChoicePtr = MEM_ReadInt(MEMINT_oCInformationManager_Address + 20);
	
	
	MEM_zCViewDialogMessage.fontColor = COL_Aqua;
	//MEM_zCViewDialogMessage.fontColor
	MEM_SendToSpy(zERR_TYPE_FAULT,"____");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_InformationMan.DlgChoice));
	MEM_SendToSpy(zERR_TYPE_FAULT,"____");
	
//*****************************************************************************
	
	/*var oCInfo info;
	info = _^(MEM_InstToPtr(DIA_Vatras_BlaBlaBla) - oCInfo_C_INFO_Offset);
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_InstToPtr(info)));
	var oCInfoChoice choice;
	choice = _^(info.listChoices_next);
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(info.listChoices_next));
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(choice.Function));*/
	
	
	//Info_ClearChoices(DIA_Vatras_BlaBlaBla);
	/*var int x; 	//�������
	var oCInfo info;	//��� ������
	var int symbIDfunc;	//������-������ ���������� ������� � ������
	var oCInfoChoice InfoChoice;	//���� ����-�����
	var int InfoChoice_ListPtr;		//��������� �� ���� � ����-������
	var zCList InfoChoice_List;		//��� ���� � ����-������
	var string funcName_str;				//��� �������, ������ �� �������.
	
	
	x=2;
	
	while(x);
		//�������� ���� - 1,2,3,4,5.
		Info_Addchoice(DIA_Vatras_BlaBlaBla,IntToString(x),dia_BlaBlaBla);
		x-=1;
	end;
	
	x=1;
	
	info = _^(MEM_InstToPtr(DIA_Vatras_BlaBlaBla) - oCInfo_C_INFO_Offset );
	InfoChoice_ListPtr = info.listChoices_next;
	InfoChoice_List = _^(info.listChoices_next);
	
	while(InfoChoice_ListPtr);
		
		funcName_str="dia_BlaBlaBla_";
		funcName_str = ConcatStrings(funcName_str,IntToString(x));
		symbIDfunc = MEM_FindParserSymbol(funcName_str);
		MEM_WARN(IntToString(InfoChoice_List.data));
		InfoChoice = _^(InfoChoice_List.data);
		InfoChoice.Function = symbIDfunc;
		
		if(InfoChoice_List.next)
		{
			InfoChoice_ListPtr = InfoChoice_List.next;
			InfoChoice_List = _^(InfoChoice_ListPtr);
		}
		else
		{
			InfoChoice_ListPtr = 0;
		};
		x+=1;
	end;*/
};
func void dia_BlaBlaBla()
{
	Npc_CloseInventory(hero);
	Info_ClearChoices(DIA_Vatras_BlaBlaBla);
	//Print("������� dia_BlaBlaBla_   DEFAULT");
};
func void dia_BlaBlaBla_1(var int itemInstance)
{
	//Print("������� dia_BlaBlaBla_   1");
};
func void dia_BlaBlaBla_2(var int itemInstance)
{
	//Print("������� dia_BlaBlaBla_   2");
};
func void dia_BlaBlaBla_3(var int itemInstance)
{
	//Print("������� dia_BlaBlaBla_   3");
};
func void dia_BlaBlaBla_4(var int itemInstance)
{
	//Print("������� dia_BlaBlaBla_   4");
};
func void dia_BlaBlaBla_5(var int itemInstance)
{
	//Print("������� dia_BlaBlaBla_   5");
};
func void dia_BlaBlaBla_6(var int itemInstance)
{
	//Print("������� dia_BlaBlaBla_   6");
};
//*--------------------------------------------------------------------
//*---------   ������ �� �������� ����		-------------------------------
//*--------------------------------------------------------------------
instance DIA_Vatras_GoToPirates(C_Info)	//���������� ������ �� ���������� � ������� ������
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Vatras_GoToPirates_condition;	
	information = DIA_Vatras_GoToPirates_info;
	important = TRUE;
};
func int DIA_Vatras_GoToPirates_condition()
{	
	if(!Npc_KnowsInfo(other,DIA_Greg_Start) && Npc_IsInState(self,ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Vatras_GoToPirates_info()
{	
	AI_Output(self,other,"DIA_Vatras_GoToPirates_05_00");	//������, ������ ���������� �� ���.
	AI_Output(other,self,"DIA_Vatras_GoToPirates_15_00");	//� ��� ������� ��� ����?
	AI_Output(self,other,"DIA_Vatras_GoToPirates_05_01");	//������� ����� ���������� ����������...
	AI_Output(other,self,"DIA_Vatras_GoToPirates_15_01");	//��� ����� ������������ ��� ���� �����.
	AI_Output(self,other,"DIA_Vatras_GoToPirates_05_02");	//�� ��������, � �� ������ ����� �����, ��� ��� ������� �� ������� �� ����, ���� �������, �������.
	AI_StopProcessInfos(self);
};
//
//������, ���� ���� �������
//
instance DIA_Vatras_JackFellIll(C_Info)	//(�������) ����...
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_JackFellIll_condition;	
	information = DIA_Vatras_JackFellIll_info;
	important = TRUE;
};
func int DIA_Vatras_JackFellIll_condition()
{	
	if(Npc_IsInRoutine(none_11_Jack,Rtn_SleepDeep_11))
	{	return TRUE;	};
};
func void DIA_Vatras_JackFellIll_info()
{	
	AI_Output(self,other,"DIA_Vatras_JackFellIll_05_00");	//(�������) ����...
	AI_Output(other,self,"DIA_Vatras_JackFellIll_15_00");	//����, ����� ���� ������ ��� � �������, ��� �� � ����� �� ���������.
	AI_Output(self,other,"DIA_Vatras_JackFellIll_05_01");	//����� �� �������������, ��� ����.
};
//
//������, ����� ������� � ��������.
//
instance DIA_Vatras_WhatEndedNegotiations(C_Info)	//��� ����������� ����������? 	nr = 2;
{
	npc = none_18_Vatras;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Vatras_WhatEndedNegotiations_condition;	
	information = DIA_Vatras_WhatEndedNegotiations_info;
	important = TRUE;
};
func int DIA_Vatras_WhatEndedNegotiations_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Vatras_WhatEndedNegotiations_info()
{	
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_00");	//��� ����������� ����������? � ������, �� ��� �� ���� �� ������� �� ����� �������� ��� � �����.
	AI_Output(other,self,"DIA_Vatras_WhatEndedNegotiations_15_00");	//���� � ���� � ���������� �������, �� ������ �� �����. ���, ��� � ���, �� � ���� �������, �� ������� ��� ������� �� ����� ������.
	AI_Output(other,self,"DIA_Vatras_WhatEndedNegotiations_15_01");	//�� ������, ����� � ���� ��������, � ����� ������ �� ��� �������.
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_01");	//(������� �������) �������� �������.
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_02");	//� ��� ����� ������? ������, � ��� ����������� ��������.
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_03");	//������ �� �� �����, �� � �������� ����. � ��� �� ����, ��� ��� ������� ���������� � �����.
	AI_Output(other,self,"DIA_Vatras_WhatEndedNegotiations_15_02");	//� �����, ����� ������ ������ �� �������. ��� ������ � �������� ����������.
	AI_Output(other,self,"DIA_Vatras_WhatEndedNegotiations_15_03");	//������, ������ ������������� � ��������� �������, ������������� ����������. ����� ��������� ������ � �������.
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_04");	//��, �� ����. � �������� �� ������� � ���� ������� �� ��������. ��������� �� ��� � ����� �����, ���� ������������ ������.
};
//----------------------------------------------------------------------------------------

instance DIA_Vatras_BlessMe(C_Info)	//���������� ����! 	//nr = 50;
{
	npc = none_18_Vatras;
	nr = 50;
	permanent = TRUE;
	condition = DIA_Vatras_BlessMe_condition;	
	information = DIA_Vatras_BlessMe_info;
	description = "���������� ����!";
};
func int DIA_Vatras_BlessMe_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{	return TRUE;	};
};
func void DIA_Vatras_BlessMe_info()
{	
	AI_Output(other,self,"DIA_Vatras_BlessMe_15_00");	//���������� ����!
	AI_Output(self,other,"DIA_Vatras_BlessMe_05_00");	//�� �������� � ����� ��������� �������, ��� ���!
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_PlayFX(self,other,"SPELLFX_HEALSHRINE");
	/*Redleha: ����� �� ���� ���� �����-�� �����. � ��: "�� 1 ��� ������������� �������� +30 � ���� +10" ����������*/
};
//
instance DIA_Vatras_DoYouNeedAnything(C_Info)	//���� ���-������ �����?	nr = 4;
{
	npc = none_18_Vatras;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Vatras_DoYouNeedAnything_condition;	
	information = DIA_Vatras_DoYouNeedAnything_info;
	description = "���� ���-������ �����?";
};
func int DIA_Vatras_DoYouNeedAnything_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{	return TRUE;	};
};
func void DIA_Vatras_DoYouNeedAnything_info()
{	
	AI_Output(other,self,"DIA_Vatras_DoYouNeedAnything_15_00");	//���� ���-������ �����?
	AI_Output(self,other,"DIA_Vatras_DoYouNeedAnything_05_00");	//��� �� �������� �������� ����� � ����� ����. ��������� �������� � ���������� ���������� �� ���� ��� ����.
	AI_Output(self,other,"DIA_Vatras_DoYouNeedAnything_05_01");	//���� �� ���� ����� ����, �� � ������ ������� �������� �� ����������� ���������.
	AI_Output(other,self,"DIA_Vatras_DoYouNeedAnything_15_01");	//� ������� ���, ��� �����.
	AI_Output(self,other,"DIA_Vatras_DoYouNeedAnything_05_02");	//������ �� ����� ��������� �������� � ���������, ��� ���� �� ������ ������� ������. ��� ����� ������ ��������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_ElixirForVatras,LOG_NOTE,-1,"������ �������� ���� �������� ��� ��������� ��������� ���� � �����.");
};
instance DIA_Vatras_IBroughtPotion(C_Info)	//� ������ �����. ��������.	nr = 4;
{
	npc = none_18_Vatras;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Vatras_IBroughtPotion_condition;	
	information = DIA_Vatras_IBroughtPotion_info;
	description = "� ������ �����. ��������.";
};
func int DIA_Vatras_IBroughtPotion_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_DoYouNeedAnything))
	{	return TRUE;	};
};
func void B_DIA_Vatras_IBroughtPotion_Choice()
{
	Info_ClearChoices(DIA_Vatras_IBroughtPotion);
	Info_AddChoice(DIA_Vatras_IBroughtPotion,Dialog_Back,DIA_Vatras_IBroughtPotion_BACK);
	if(Npc_HasItems(other,ItPo_Mana_03))
	{
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"������ 1 ������� ����",DIA_Vatras_IBroughtPotion_Mana1);
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"������ ��� �������� ����",DIA_Vatras_IBroughtPotion_ManaAll);
	};
	if(Npc_HasItems(other,ItPo_Health_03))
	{
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"������ 1 ������� �����",DIA_Vatras_IBroughtPotion_HP1);
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"������ ��� �������� �����",DIA_Vatras_IBroughtPotion_HPAll);
	};
	if(Npc_HasItems(other,ItPo_Mana_03) || Npc_HasItems(other,ItPo_Health_03))
	{
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"������ ��� ��������",DIA_Vatras_IBroughtPotion_All);
	};
};
func void DIA_Vatras_IBroughtPotion_BACK()
{
	Info_ClearChoices(DIA_Vatras_IBroughtPotion);
};
func void b_GiveVatrasElixir(var int potionName, var int mount)
{
	B_DS_GiveRemoveItems_Red(other,self,potionName,mount,34);
	B_GiveInvItem_red(self,other,ItMi_Gold,100*mount,37);	/*����� �� ���� �� ������*/
	B_GivePlayerXP(300*mount);
};
func void DIA_Vatras_IBroughtPotion_Mana1()
{
	b_GiveVatrasElixir(ItPo_Mana_03,1);
	B_DIA_Vatras_IBroughtPotion_Choice();
};
func void DIA_Vatras_IBroughtPotion_ManaAll()
{
	b_GiveVatrasElixir(ItPo_Mana_03,Npc_HasItems(other,ItPo_Mana_03));
	B_DIA_Vatras_IBroughtPotion_Choice();
};
func void DIA_Vatras_IBroughtPotion_HP1()
{
	b_GiveVatrasElixir(ItPo_Health_03,1);
	B_DIA_Vatras_IBroughtPotion_Choice();
};
func void DIA_Vatras_IBroughtPotion_HPAll()
{
	b_GiveVatrasElixir(ItPo_Health_03,Npc_HasItems(other,ItPo_Health_03));
	B_DIA_Vatras_IBroughtPotion_Choice();
};
func void DIA_Vatras_IBroughtPotion_All()
{
	var int x; x = Npc_HasItems(other,ItPo_Health_03) + Npc_HasItems(other,ItPo_Mana_03);
	B_DS_GiveRemoveItems_Red(other,self,ItPo_Health_03,Npc_HasItems(other,ItPo_Health_03),34);
	B_DS_GiveRemoveItems_Red(other,self,ItPo_Mana_03,Npc_HasItems(other,ItPo_Mana_03),37);
	B_GiveInvItem_red(self,other,ItMi_Gold,100*x,40);	/*����� �� ���� �� ������*/
	B_GivePlayerXP(300*x);
	Info_ClearChoices(DIA_Vatras_IBroughtPotion);
};
func void DIA_Vatras_IBroughtPotion_info()
{	
	AI_Output(other,self,"DIA_Vatras_IBroughtPotion_15_00");	//� ������ �����. ��������.
	if(!Npc_HasItems(other,ItPo_Health_03) &&  !Npc_HasItems(other,ItPo_Mana_03))
	{
		AI_Output(self,other,"DIA_Vatras_IBroughtPotion_05_00");	//�����, ��� � ���� ��� ������ �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_IBroughtPotion_05_01");	//�, ��� ��, ��� �����! ������� ����!
		B_DIA_Vatras_IBroughtPotion_Choice();
	};
};
//
//�������� �����
//
	
instance DIA_Vatras_Teach(C_Info)
{
	npc = none_18_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};
func int DIA_Vatras_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{
		return TRUE;
	};
};
func void B_DIA_Vatras_Teach_choice()
{
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX,1)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX,5)),DIA_Vatras_Teach_5);
};
func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//� ���� �������� ��� ���������� �����������.
	AI_Output(self,other,"DIA_Vatras_Teach_05_01");	//�������, � � ����� �������.
	B_DIA_Vatras_Teach_choice();
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//���� ���������� ������� ����� ������� ������, ����� � ��� ��� �������� ��.
	};
	Info_ClearChoices(DIA_Vatras_Teach);
};
func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX);
	B_DIA_Vatras_Teach_choice();
};
func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX);
	B_DIA_Vatras_Teach_choice();
};
//
//��������� ����.�����
//
instance DIA_Vatras_TeachHPMax(C_Info)
{
	npc = none_18_Vatras;
	nr = 101;
	condition = DIA_Vatras_TeachHPMax_Condition;
	information = DIA_Vatras_TeachHPMax_Info;
	permanent = TRUE;
	description = "� �� ����� �������� ���� ��������.";
};
func int DIA_Vatras_TeachHPMax_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{
		return TRUE;
	};
};
func void B_DIA_Vatras_TeachHPMax_choice()
{
	Info_ClearChoices(DIA_Vatras_TeachHPMax);
	Info_AddChoice(DIA_Vatras_TeachHPMax,Dialog_Back,DIA_Vatras_TeachHPMax_BACK);
	Info_AddChoice(DIA_Vatras_TeachHPMax,B_BuildLearnString(PRINT_LearnHITPOINTS10,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX,10)),DIA_Vatras_TeachHPMax_10);
	Info_AddChoice(DIA_Vatras_TeachHPMax,B_BuildLearnString(PRINT_LearnHITPOINTS20,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX,20)),DIA_Vatras_TeachHPMax_20);
	Info_AddChoice(DIA_Vatras_TeachHPMax,B_BuildLearnString(PRINT_LearnHITPOINTS50,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX,50)),DIA_Vatras_TeachHPMax_50);
};
func void DIA_Vatras_TeachHPMax_Info()
{
	AI_Output(other,self,"DIA_Vatras_TeachHPMax_15_00");	//� �� ����� �������� ���� ��������.
	AI_Output(self,other,"DIA_Vatras_TeachHPMax_05_01");	//�������. � ��� ������ ���� � ����.
	B_DIA_Vatras_TeachHPMax_choice();
};

func void DIA_Vatras_TeachHPMax_BACK()
{
	if(other.attribute[ATR_HITPOINTS_MAX] >= T_HP_MEGA)
	{
		AI_Output(self,other,"DIA_Vatras_TeachHPMax_05_00");	//���� ��������� ������� ����� ������� ������, ����� � ��� ��� �������� ��.
	};
	Info_ClearChoices(DIA_Vatras_TeachHPMax);
};
func void DIA_Vatras_TeachHPMax_10()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,10,T_HP_MEGA);
	B_DIA_Vatras_TeachHPMax_choice();
};
func void DIA_Vatras_TeachHPMax_20()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,20,T_HP_MEGA);
	B_DIA_Vatras_TeachHPMax_choice();
};
func void DIA_Vatras_TeachHPMax_50()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,50,T_HP_MEGA);
	B_DIA_Vatras_TeachHPMax_choice();
};

//
instance DIA_Vatras_IBeganToFeelFaint(C_Info)	//� ��������� ����� � ���� ����������� ��������.	nr = 5;
{
	npc = none_18_Vatras;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Vatras_IBeganToFeelFaint_condition;	
	information = DIA_Vatras_IBeganToFeelFaint_info;
	description = "� ��������� ����� � ���� ����������� ��������.";
};
func int DIA_Vatras_IBeganToFeelFaint_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{	return TRUE;	};
};
func void DIA_Vatras_IBeganToFeelFaint_info()
{	
	AI_Output(other,self,"DIA_Vatras_IBeganToFeelFaint_15_00");	//� �� ����� ������ ��������, �� � ��������� ����� � ���� ����������� ��������. ����� ������ �����������, � ����� ��� �� ��� ����, ��� ������.
	AI_Output(other,self,"DIA_Vatras_IBeganToFeelFaint_15_01");	//� ���� ���-��� ���� ��������. ��� �������, ��� ���� ����� ��������� � �� ����.
	AI_Output(self,other,"DIA_Vatras_IBeganToFeelFaint_05_00");	//�������, � ��� �� ��������, � ��� �������� ����� ��������. �� � ������, ��� ���� �������� ���.
	AI_Output(self,other,"DIA_Vatras_IBeganToFeelFaint_05_01");	//��� ������������ ���� � ��������������� ���������� ���������. ��, �����, ������� �������� �� ��� �����.
	AI_Output(other,self,"DIA_Vatras_IBeganToFeelFaint_15_02");	//��� �� �������, ������� ��� ��������?
	AI_Output(self,other,"DIA_Vatras_IBeganToFeelFaint_05_02");	//�� ���� �������, ���� ���. �����������, ��� ���� ����� �� �� ���, � �� ����.
};
//
//���������� ��� ������� ������� �� ������
//
instance DIA_Vatras_IGotOneArtifact(C_Info)	//��� ������� �������� ���� ��������.		//nr = 15
{
	npc = none_18_Vatras;
	nr = 15;
	permanent = FALSE;
	condition = DIA_Vatras_IGotOneArtifact_condition;	
	information = DIA_Vatras_IGotOneArtifact_info;
	description = "��� ������� �������� ���� ��������.";
};
func int DIA_Vatras_IGotOneArtifact_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations) && Npc_HasItems(other,ItAm_DS2P_WispDetector))
	{	return TRUE;	};
};
func void DIA_Vatras_IGotOneArtifact_info()
{	
	AI_Output(other,self,"DIA_Vatras_IGotOneArtifact_15_00");	//��� ������� �������� ���� ��������. �� �� �� ��������. ����� ����, �� ������, ��� ��������� ��� ����?
	AI_Output(self,other,"DIA_Vatras_IGotOneArtifact_05_00");	//���-�� ����������.
	B_GiveInvItems(other,self,ItAm_DS2P_WispDetector,1);
	B_DSG_UseFakeAmulet();
	AI_Output(self,other,"DIA_Vatras_IGotOneArtifact_05_01");	//�, ��� ����������! ��� �� ��� ���� ������� ������. � �����, ��� ������ �����, ��� ����� �������� ���������, � ������, ���.
};
//
//���������� ����� �����������: "��� ������� �������� ���� ��������."
//
instance DIA_Vatras_CanUAactivateItsEffect(C_Info)	//�� ������ ��������� ��� ����?		//nr = 150
{
	npc = none_18_Vatras;
	nr = 150;
	permanent = FALSE;
	condition = DIA_Vatras_CanUAactivateItsEffect_condition;	
	information = DIA_Vatras_CanUAactivateItsEffect_info;
	description = "�� ������ ��������� ��� ����?";
};
func int DIA_Vatras_CanUAactivateItsEffect_condition(){	
	if(Npc_KnowsInfo(other,DIA_Vatras_IGotOneArtifact))	{	return TRUE;	};
};
func void DIA_Vatras_CanUAactivateItsEffect_info()
{	
	AI_Output(other,self,"DIA_Vatras_CanUAactivateItsEffect_15_00");	//�� ������ ��������� ��� ����?
	AI_Output(self,other,"DIA_Vatras_CanUAactivateItsEffect_05_00");	//��, �������! ��� ���������� ������� ����������. ������-�� � ��������.
	AI_DropItem(self,ItAm_DS2P_WispDetector);
	AI_PlayFX(self,ItAm_DS2P_WispDetector,"SPELLFX_INCOVATION_BLUE");
	AI_Output(self,other,"DIA_Vatras_CanUAactivateItsEffect_05_01");	//������, ������, �������! ������ �������, ����! ���� ����� �����!
	AI_PlayFX(self,ItAm_DS2P_WispDetector,"SPELLFX_INCOVATION_RED");
	AI_Output(self,other,"DIA_Vatras_CanUAactivateItsEffect_05_02");	//���, ������� ������. ������ ������ ��������� ����� � �������������.
	AI_TakeItem(self,ItAm_DS2P_WispDetector);
	CreateInvItems(other,ItAm_DS2P_WispDetector,1);
	AI_Output(other,self,"DIA_Vatras_CanUAactivateItsEffect_15_01");	//� ��� �� �����?
	AI_Output(self,other,"DIA_Vatras_CanUAactivateItsEffect_05_03");	//�, ����� �����! �� ����� ������ ���� ����� ������� ����, �������� ������� � ������ ������. �� ��� ��� �������, ����� �������� ���.
};
//
//���������� ����� �����������: "�� ������ ��������� ��� ����?"
//
instance DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay(C_Info)	//��� �� ����� ����� ���������� ����� ����������?		//nr = 151
{
	npc = none_18_Vatras;
	nr = 151;
	permanent = FALSE;
	condition = DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_condition;
	information = DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_info;
	description = "��� �� �����, ����� ���������� ����� ����������?";
};
func int DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_condition(){	
	if(Npc_KnowsInfo(other,DIA_Vatras_CanUAactivateItsEffect))	{	return TRUE;	};
};
func void DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_info()
{	
	AI_Output(other,self,"DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_15_00");	//��� �� �����, ����� ���������� ����� ����������? �� �� ������, ��� ��� ����� ���� �������, �������.
	AI_Output(self,other,"DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_05_00");	//(�������) ��� ����� ������! ���������� �������� �� ����� �������. ������ ���� ����� �������, � ������ ��� ����� ������ ������ ����.
	AI_Output(self,other,"DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_05_01");	//� ������ �������� ��� � ������ ������� ����� ����. ��� ����� ������.
};
//
//���������� ����� �����������: "��� ������� �������� ���� ��������."
//
instance DIA_Vatras_WhatHappensIfUFind3Amul(C_Info)	//� ��� �����, ���� ����� ��� ������ �������?		//nr = 152
{
	npc = none_18_Vatras;
	nr = 152;
	permanent = FALSE;
	condition = DIA_Vatras_WhatHappensIfUFind3Amul_condition;	
	information = DIA_Vatras_WhatHappensIfUFind3Amul_info;
	description = "� ��� �����, ���� ����� ��� ������ �������?";
};
func int DIA_Vatras_WhatHappensIfUFind3Amul_condition(){	
	if(Npc_KnowsInfo(other,DIA_Vatras_IGotOneArtifact))	{	return TRUE;	};
};
func void DIA_Vatras_WhatHappensIfUFind3Amul_info()
{	
	AI_Output(other,self,"DIA_Vatras_WhatHappensIfUFind3Amul_15_00");	//� ��� �����, ���� ����� ��� ������ �������?
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_00");	//���� ������ ��� �� �������, �� �� ��� ����� �������� ������� ������, ��������� ������� ��������, �������� ����������-������� ���������.
	AI_Output(other,self,"DIA_Vatras_WhatHappensIfUFind3Amul_15_01");	//� ��� ��� ����?
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_01");	//� �� ����, ��� ������, ��� ���������� ��������������.
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_02");	//���� �������, ��� �� ������� ��������� ������� �����������, ������ � ��� ������� ������� ������� ���������. ������ �� ����������, ��� �� �������� ������� ������, ��� �� ���� �������� ���� �� ������ �������.
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_03");	//� �� ������� ������ �� ����� �� ���� ������. �� ���� ����� � ����, ������� ���� ���� ��������, ����� �������� � �������� �����.
	AI_Output(other,self,"DIA_Vatras_WhatHappensIfUFind3Amul_15_02");	//����, ��� ��� ������� ������� ������ � ������� ����������� �� ����� ��������.
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_04");	//���� ����� ������������, ���� ���!
};


//NS - 30/07/2013 ===================================
//  ��������� �����
//===================================================
func void DIA_Vatras_ChaosArtefacts_info(var int ArtefactIsAmulet)
{	
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_00");	//���������, ���������...
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_01");	//���-�� �� ���?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_02");	//� ������ ���������, ��� ���� ������� �������� �� ������ ������������.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_03");	//� ��� ��?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_04");	//��������� ��� � ������� ������ ���������� ����� ���� � ��������, � ������� �������� ��������� ������� ������.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_05");	//��� �� ����� � ������� �� ����� ��� �� ����� ���� ��������� ��� �������.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_06");	//��� ���, � ����� �� ������� ���� �������� ��� ���� ������.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_07");	//�������� ������, ��� ���� �� ��������� ����������, ��������� �������� ��������� �� ��������� �����.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_08");	//��������� �����?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_09");	//��, ���� ������� ��-�������, �����, ������������ � ����.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_10");	//���-�� �������, ��� ��� ����� ������, ���-�� �������� ������� �������. � ������, ����� ���������������� �� �����, �������, ��� ��� ������� ������ �����.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_11");	//�� ��� �� ��� �����. ����� ��, ��� ���� ������ �������� ����� ��������� ������, ������� �� �������� � ������ ���� ����� ������ �� �����. ���� �� ��� - �� ������ �� ��������� ��� �����.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_12");	//����� ������ ���������, ��� ����� ����������� ������������� ��� ������ �� ������� ������ ������ ���� � ��������� ���������� ���� �����������, ��������.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_13");	//��� ����� ����� ����?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_14");	//������������ ��� ��������. ���� ���� ���������� ��� ���������� � ����� ������ ���������, �� ������ ���� ���-��, ��� �������� ������������, ��� ���� � ����, ���� � ����
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_15");	//�� ������ �������, ��� ��� �������� �����?

	if (ArtefactIsAmulet)	{
	//���� ������
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_16");	//��, ������ �� ���� � � ������. ������� ��� ����� ��� �����������, ��� ����� ������ ���� ����� ���� � �������� ���� ����, ����� ���� �� ������ ������� �����.
	}
	else	{
	//���� ������
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_17");	//��, ������ �� ���� � � ������. ������� ��� ����� ��� �����������, ��� ����� ������ ���� ����� ��������� �� ���� �������.
	};
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_18");	//�����, � ��� � ���� ������������ ���� ������?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_19");	//(���������) ������������? �� ���� �� ����� ��� ���; � ������, � �� �����, ����� ����� ���� ����������� ��� ����������.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_20");	//�� ����� ����. ������ �����, ������ ����, ������, ��� ������� � ������. � ������, ��� � ������ �������� ����� ������������ ��� ��������� ��������, ����� ���� ���-�� �������� ����.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_21");	//(���������) � ����� ������� �� ����, ��... ����, �����.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_22");	//��������� � �����, � ������ ���� ��������, ��� ���� ������ ����� ���� ��������� ���� ��� ������� �� � ����, ��� ����� ��������.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_23");	//����� ����?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_24");	//������ ��� - ������.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_25");	//� �� �������.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_26");	//��� ��������� ������. ��� � ��� ������� ����, ��� ����� �����, ������� ��� ��� ����-�� �����������.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_27");	//������ ��� ������ ����� ���� ���� ���-�� ��������. ��������, ��������� ���� ���������� ����, � ����� �������� � ������� ����� ����� ������ ��� ��������.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_28");	//�� ����� ������� � �������� ����� ������������. ��� ����� ����� �����. 
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_29");	//� ������ ������ ����� ����� ���� �����?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_30");	//���, ����� ��?! �������� ����� ������ ���������. �����, ����� ������� ������ ���� �� ��������. ���� �����, �������� � ������, �� ������ ���������� ��� �� �����.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_31");	//���� ��������� ������������� ����� �������������, ������ ����������� ��� ���.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_32");	//�������. � ��������.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_33");	//����� ���� ����� � ���� ��������! �� �� ����� ���� ����������� ���������� ���� �����.
	//������ � �������� � ������� ���. ���� "��������� �����" 
	B_DSG_Log_OpenClose(TOPIC_ChaosArtefacts,LOG_NOTE,-1,"����� ������������ �������� ���������� �� ������������ ����� ������������ �������� � ����� ������ ���������. ��������� ������������� ����� ���� ����� ������ � ��� �������������, ��� � �������������. �� � ����� ������ ����� ����������� ��� ���.");
	PLAYER_TALENT_ALCHEMY[CHARGE_DSG_ChaosArtefacts] = TRUE;
	if (ArtefactIsAmulet)	{
		//������ � �������� � ������� ���. ���� "��������� �����" 
		B_DSG_Log_OpenClose(TOPIC_ChaosArtefacts,LOG_NOTE,-1,"��� ������� ����� ������ �����.");
	}
	else	{
		//������ � �������� � ������� ���. ���� "��������� �����" 
		B_DSG_Log_OpenClose(TOPIC_ChaosArtefacts,LOG_NOTE,-1,"��� ������� ����� ������ �����.");
	};
};
//----------------------------
// "�������� ���� ������." ���� �� ���� � ��� �� ����� ��� ���������		nr = 161
instance DIA_Vatras_ChaosAmulette(C_Info)
{
	npc = none_18_Vatras;
	nr = 161;
	permanent = FALSE;
	condition = DIA_Vatras_ChaosAmulette_condition;	
	information = DIA_Vatras_ChaosAmulette_info;
	description = "�������� ���� ������.";
};
func int DIA_Vatras_ChaosAmulette_condition()
{	
	if(Npc_HasItems(other,ItAm_DSG_Chaos_Discharged)
		&& !Npc_KnowsInfo(other,DIA_Vatras_ChaosRing))
	{	return TRUE;	};
};
func void DIA_Vatras_ChaosAmulette_info()
{	
	AI_Output(other,self,"DIA_Vatras_ChaosAmulette_15_00");	//�������� ���� ������.
		AI_Output(self,other,"DIA_Vatras_ChaosAmulette_05_01");	//(���������� �������) ������ � ���� ���?
	AI_Output(other,self,"DIA_Vatras_ChaosAmulette_15_02");	//��� ��� ��� ���� �� �������. �������, ��� ����� ��� � �������� ���� ����.
	DIA_Vatras_ChaosArtefacts_info(TRUE);
};
//----------------------------
// "�������� ��� ������." ���� �� ���� � ��� �� ����� ��� ���������		nr = 162
instance DIA_Vatras_ChaosRing(C_Info)
{
	npc = none_18_Vatras;
	nr = 162;
	permanent = FALSE;
	condition = DIA_Vatras_ChaosRing_condition;	
	information = DIA_Vatras_ChaosRing_info;
	description = "�������� ��� ������.";
};
func int DIA_Vatras_ChaosRing_condition()
{	
	if((Npc_HasItems(other,ItRi_DSG_Chaos1_Discharged)
			|| Npc_HasItems(other,ItRi_DSG_Chaos2_Discharged))
		&& !Npc_KnowsInfo(other,DIA_Vatras_ChaosAmulette))
	{	return TRUE;	};
};
func void DIA_Vatras_ChaosRing_info()
{	
	AI_Output(other,self,"DIA_Vatras_ChaosRing_15_00");	//�������� ��� ������.
		AI_Output(self,other,"DIA_Vatras_ChaosRing_05_01");	//(���������� �������) ������ � ���� ���?
	AI_Output(other,self,"DIA_Vatras_ChaosRing_15_02");	//� ����� ��� �� �������.
	DIA_Vatras_ChaosArtefacts_info(FALSE);
};


//------------------------------------------------------------------
//REDLEHA: 09/03/2016
//	����������� � ��������.
//	"��� ��������� � �������� (���� ��� ���� ������� �� ��������)."

instance DIA_Vatras_WhatHappened(C_Info)
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_WhatHappened_condition;	
	information = DIA_Vatras_WhatHappened_info;
	important = TRUE;
};
func int DIA_Vatras_WhatHappened_condition()
{	
	if(War_Has_Come)
	{	return TRUE;	};
};
func void DIA_Vatras_WhatHappened_info()
{	
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_00");	//��� ���, ��� ���������? ������ �� � ����, �� � ���� ���������� ������� �� ����.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_00");	//�� � �������?
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_01");	//��, ���������.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_02");	//��� ��������� �� �������, ��������� � ������ � ����� �������, ����� ����� ��. � � ��� ������ ������ � ������������� �����, ����� ������� ���� ����� ��� ���. 
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_03");	//������ � � ����� ��������� ������. ��������� � ��� �� ���� �����, � ��������� ��� �� ���������.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_04");	//� ���� �������� � �������� ������� ������� �� �����.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_01");	//�� ��������� � �������� � ��������?
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_05");	//�������, ������� �������. ���� � ����������� ������ �� �������� ��������� ���������, ���� � ���� �������� �������� �������� ���� �������.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_06");	//��������� ���� �������, � �������� ��������� ���������.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_02");	//� ��� ��� ����?
	if(MIS_DS2P_DamnSailor == LOG_Running)
	{
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_07");	//���� ��������� �����, ����������� � ������� �������.
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_08");	//������ �� � ���������-�� �� �������.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_03");	//��, �� ��� ������-�������?
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_09");	//��, � ��� ��� �������� ������� ����������, ����� ������� ���.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_04");	//�� ������ �������, ��� ���� ���? ���������� ������������?
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_10");	//��, ���� � �� �����, ��� ��� ���� �����. �� ���� ����� �� ����������� ��� ����������, � ��������� ���� ������ ��������� �����������.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_05");	//��� ���?
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_11");	//� �� ����, ��� ���. � ��� ���� ����� ������ ���������. ������� ������, ��� ������ � ����� �����, �� ������ ��������������, ��� ��� �� ���.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_06");	//��� ����� ������ �������, �� ��� �� ��������� �� ��������?
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_12");	//� ��������� ��� ������ �� ���� ������������� ������. ��� �������, ���� � �� �����.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_07");	//��� �, ������� ���� ������, ��� ������� ���� �� ���� ��������, � �� � ����� �� ��� ������, ��� ������ � �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_13");	//C��������� ����������� �����, ����������� � ������� �������.
	};
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_08");	//��� �������� ������ ��� ����� ������ ���������� �� �������.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_09");	//������ ����. � ����� ����� ������, ����� ���� ���� � ���������� �� ������� �� ����.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_10");	//� ��������� � ��� ������, ����� ���������� � ���������� �����.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_14");	//���� ���������, ��� ���.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_11");	//�� ���-�� ���, ������������?
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_15");	//����������, ������ �� ������� ���� ����������� � �����, �� �� ������ ��� ����� ������ ���-������ ���������.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_16");	//��� ��� �� �����, ��� ���� ��� �� ������, �� ����� �� ������ ����������� ������ �����...
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_12");	//�� ��������, ������. �� ������ ���������� �� �� ���� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Vatras);
};
//
//���� ��� ������ ������
//
instance DIA_Vatras_PiratesAreDead(C_Info)	//������ ������ �� ������ �������. nr = 10;
{
	npc = none_18_Vatras;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Vatras_PiratesAreDead_condition;	
	information = DIA_Vatras_PiratesAreDead_info;
	description = "������ ������ �� ������ �������.";
};
func int DIA_Vatras_PiratesAreDead_condition()
{	
	if(All_Pirat_Killed)
	{	return TRUE;	};
};
func void DIA_Vatras_PiratesAreDead_info()
{
	AI_Output(other,self,"DIA_Vatras_PiratesAreDead_15_00");	//������ ������ �� ������ �������, ������.
	AI_Output(self,other,"DIA_Vatras_PiratesAreDead_05_00");	//������ ������ �� ������� ����. �� ����� �� ���������� � ��� �� ����.
};
//
//����� ��������� � ��������. �������� � ����.
//
var int Vatras_Dia_Dragon_day;
instance DIA_Vatras_IFoundWayToDealWithPlague(C_Info)	//�, �������, ����� ������ ����������� � �����. nr = 11;
{
	npc = none_18_Vatras;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Vatras_IFoundWayToDealWithPlague_condition;	
	information = DIA_Vatras_IFoundWayToDealWithPlague_info;
	description = "�, �������, ����� ������ ����������� � �����.";
};
func int DIA_Vatras_IFoundWayToDealWithPlague_condition()
{	
	if(Npc_KnowsInfo(other,DIA_DragonTalan_FirstDialog))
	{	return TRUE;	};
};
func void DIA_Vatras_IFoundWayToDealWithPlague_info()
{
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_00");	//�, �������, ����� ������ ����������� � �����, �� ��� ����������� ���-����� ���� � ������.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_00");	//����� ���������� ����� ������, ��� ��� �� ������?
	
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_01");	//������� ���������, ����, ������ ��� ������, �� ����� �� ����������� ��������� �������� ����� �������, � ����� �� ������, ��� ����������� ������ ���, ���������� ������ ����.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_01");	//���... ������, �� ������ �������?
	
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_02");	//��, �� ���� ������� ���� ������, �� �� ������, �� �� ���� �� ��������.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_02");	//�������, ������� ����� � ��������. ������ ������, ��� �� ��� ��������.
	
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_03");	//��� �� ��� �����, ������, ������ ������ � �����?
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_03");	//�������, ���. ����� ������� �������� ��������, ����� ���� �������� ��������������� ���������� � ��� ���� ���������� �������� �������� � ����� � � ������ ������.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_04");	//� ��� �����, � ��� ��� ������ ������������, ����� ������� ����� �������. ������� �� �������, ��� � ��������� �������� �������� ������� ��� �������� �������?
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_05");	//����� �� ��������� ������ ���� ���������.
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_04");	//�� ������ � ���? � �� ������ �����. ��, ������� ��� ���, �� ��� � ���� ������ ���.
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_05");	//�� ���� ���-�� �� ����� �������? ����� �������� ��� ������ ��������?
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_06");	//��� �� ���� �� ������� �������, � ������� ��� ����� ���� ����.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_06");	//�� ������ ��������? ����, � ��� ��� ������� ��� �������� ����������... (�����)
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_07");	//�����, ��� ���� ���� �����������, �� ��� ����� �������������.
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_07");	//� �����, ����� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_VatrasAfterDragonDia);
	Vatras_Dia_Dragon_day = Wld_GetDay();
};
//
//����� ��������� � ���� �� ����.����.
//
var int c_DIA_Vatras_HowSInvestigation_once;
instance DIA_Vatras_HowSInvestigation(C_Info)	//��� ������������ ������������? nr = 11;
{
	npc = none_18_Vatras;
	nr = 11;
	permanent = TRUE;
	condition = DIA_Vatras_HowSInvestigation_condition;	
	information = DIA_Vatras_HowSInvestigation_info;
	description = "��� ������������ ������������?";
};
func int DIA_Vatras_HowSInvestigation_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_IFoundWayToDealWithPlague) && !c_DIA_Vatras_HowSInvestigation_once)
	{	return TRUE;	};
};
func void DIA_Vatras_HowSInvestigation_info()
{
	AI_Output(other,self,"DIA_Vatras_HowSInvestigation_15_00");	//��� ������������ ������������?
	if(Wld_GetDay() <= Vatras_Dia_Dragon_day)
	{
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//��� ����� ��� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//� ���-��� �����. 
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//���� ������� ������ ���� ������ ��������, �� ����� �������� ������ �� ������� ��� � � ��������, ��, �����, ����� �� ���� ����.
			AI_Output(other,self,"DIA_Vatras_HowSInvestigation_15_00");	//��� �������, ��� ��� �� ������?
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//(��������) � ���� ��� ��������, � ��� ��� �� ��������. ��������� ���� � ������ � ��������� ���, ��� ������ ����� � ���-���� ���� ��������.
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//�� � ���� ������� ���� �����������, ����� �������������� ������� ������� �� ����� ���.	
			AI_Output(other,self,"DIA_Vatras_HowSInvestigation_15_00");	//��� ��� ��� ��������, ����� ������ ������������. ������, � ����� ��� � ������ ���� ��������?
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//�� ������ �� ���������� - � ��� ������� � ��� ����� ����������� � ��������������� ������� ����������.
		
		B_GiveInvItems(self,other, ItWr_DS2P_VatrasSpisok_4MagicSword,1);
		c_DIA_Vatras_HowSInvestigation_once = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_VatrasPotion4Sword);
	};
};

//
//����� ��������� � �������� ��� ���� ����� ���������� ���� ������������.
//
instance DIA_Vatras_DoIt(C_Info)	//������ ����������, � ��� ������. nr = 11;
{
	npc = none_18_Vatras;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Vatras_DoIt_condition;	
	information = DIA_Vatras_DoIt_info;
	description = "������ ����������, � ��� ������.";
};
func int DIA_Vatras_DoIt_condition()
{	
	//UNFINISH - ���� ������
	if(c_DIA_Vatras_HowSInvestigation_once && C_Npc_DS_HasItems(other,ItMi_Nugget,3) && C_Npc_DS_HasItems(other,ItMi_MoleratLubric,1) 
	&& C_Npc_DS_HasItems(other,ItAt_WaranFiretongue,1) && C_Npc_DS_HasItems(other,ItAt_Armour_Kraur,2))
	{	return TRUE;	};
};
func void DIA_Vatras_DoIt_info()
{
	AI_Output(other,self,"DIA_Vatras_DoIt_15_00");	//������ ����������, � ��� ������.
	B_DS_GiveRemoveItems_Red(other,self,ItMi_Nugget,3,34);
	B_DS_GiveRemoveItems_Red(other,self,ItMi_MoleratLubric,1,37);
	B_DS_GiveRemoveItems_Red(other,self,ItAt_WaranFiretongue,1,40);
	B_DS_GiveRemoveItems_Red(other,self,ItAt_Armour_Kraur,2,43);
		AI_Output(self,other,"DIA_Vatras_DoIt_05_00");	//�������, �������, �� ��� �� ��������� � ���� ��������.
	
	
	CreateInvItem(self,ItMi_Flask_Stand);
	CreateInvItem(self,ItMw_DS2P_Sword_4DRAGON);
	
	AI_UseItemToState(self,ItMi_Flask_Stand,1);
	AI_Wait(self,0.5);
	AI_UseItemToState(self,ItMi_Flask_Stand,-1);
	
	AI_Output(self,other,"DIA_Vatras_DoIt_05_01");	//� ������ �� ���� ����������� �������...
	
	AI_EquipBestMeleeWeapon(self);
	//AI_ReadyMeleeWeapon_ds(self);	//������ 3.12.2013
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_LAB_STAND_2_S0");
	AI_PlayAni(self,"T_LAB_S0_2_S1");
	AI_PlayAni(self,"T_LAB_S1_2_S0");
	AI_PlayAni(self,"T_LAB_S0_2_STAND");
	//AI_RemoveWeapon_ds(self);	//������ 3.12.2013
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);	
	AI_Output(self,other,"DIA_Lafer_SwordAtMe_08_02");	//��� ������ �����!
	AI_Output(self,other,"DIA_Lafer_SwordAtMe_08_03");	//������� �� ��� �����. ���� ��������� � ���� �������.
	CreateInvItems(other,ItMw_DS2P_Sword_4DRAGON,1);
	//AI_Function_I(self,Npc_RemoveInvItem,ItMw_DSG_Sword_4DRAGON);
	
	AI_PrintScreen("������� ����������� ������",-1,-1,Font_Screen,4);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_VatrasPotion4Sword);
};

//"� ������ ������ �������� �� ����." - ������������, ���� ���� ����� "�������"
// nr = 2

instance DIA_Vatras_AboutNightmares(C_Info)
{
	npc = none_18_Vatras;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Vatras_AboutNightmares_condition;	
	information = DIA_Vatras_AboutNightmares_info;
	description = "� ������ ������ �������� �� ����.";
};

func int DIA_Vatras_AboutNightmares_condition()
{	
	if (MIS_DS2P_Nightmares == Log_Running)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AboutNightmares_info()
{
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_00");	//� ������ ������ �������� �� ����. �� ������ ����� ������.
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_01");	//� ��� �� ��� �� ������?
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_02");	//(���������) ������ ������ ��� ������� �� ������ ������������
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_03");	//��� � ���� �� ��������?
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_04");	//(������� ������������ ������� ����) �������� ������ ����� ��� ������ � ����� ������ � ������, ����� �� ����� ������ ������������ �����, ��� ������ �������� �������, ������� �� ���� ��� ����� �� ����, �� �����.
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_05");	//������� ������ ��� ����! � ������ ����, ��� ������������� ������ �� ������� �� �������� �� �����.
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_06");	//�� ������ ��� ������?
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_07");	//������� ��� ����� ���� ��������, ������ �����. ������ ��� � �������� �������� ��� ������ ����������. �����, ��� ���, ��������� ������ ����, ������� ���������� �������� � ������, ��� ������ �� ������. �������� ��� ������, ��� �������, ������ ������ ������.
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_08");	//�� ������ �������, ��� ��� ������ �������� ����� ������� ��������� �������?
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_09");	//��. ��� �� ������ ������ ����� ������. ��� ���� ���, ������� ����� ��������� ������ �������. ��� ����� �����, � ����� ���� �� ��� ��������, ������� � �������� ���������� ���������. 
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_10");	//��� ������, ��� ������ ������� ����� �������� ���������, �� ����� �� ������� ����� �������� � ���� ���, �������, ������ �������� ������ ����� � ���� ����, ������� ���� ���������.
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_11");	//� ������ ���������, ��� ���, ��� ����� ��������� ����������� ��������, �������� ��������� ��������� ���������?
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_12");	//���� ������������ �� ����. � ��� ��� ������?
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_13");	//���� ���� ����� � ��� ��� � ��� ��������� �� ������ ������� ������. ���� ������� ������� ���, �� �� �������� ������ ���� �� ������ �� ��������, �� � �� ��������� ������.
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_14");	//� ��� ��� ����� � ��� ���? ��� ������ ��������?
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_15");	//��, � ���������� ����������� �����. � ���� ���� ����� ��� ����������� ��� ����, �� �� ������� ������ �������� � �������� ������.
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_16");	//� ������� ���� ���.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_VatrasPotion4Sword);
};

// ������������, ���� �� ���� ����� "�������", ��������� � �������� ������ �����, � ������ ������� ������
	
instance DIA_Vatras_NightPotionIngredient(C_Info)
{
	npc = none_18_Vatras;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Vatras_NightPotionIngredient_condition;	
	information = DIA_Vatras_NightPotionIngredient_info;
	description = "���, � ������ ��, ��� �� ������.";
};

func int DIA_Vatras_NightPotionIngredient_condition()
{	
	if ((MIS_DS2P_Nightmares == Log_Running) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1)
		 && Npc_KnowsInfo(other,DIA_Vatras_AboutNightmares))
	{
		return TRUE;
	};
};

func void DIA_Vatras_NightPotionIngredient_info()
{
	AI_Output(other,self,"DIA_Vatras_NightPotionIngredient_15_00");	//���, � ������ ��, ��� �� ������.
	// �������� ������� ��������
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	if (Npc_KnowsInfo(other,DIA_Cimm_VatrasIngredient)) // ���� �� ���� ������ � �����
	{
		AI_Output(other,self,"DIA_Vatras_NightPotionIngredient_15_01");	//�������� � ���� � �������� �������� �����, �� ����� ����� ��������� � ���� ����-������, ������.
		AI_Output(self,other,"DIA_Vatras_NightPotionIngredient_13_02");	//������, ����� ����� ������� ������ ������� � �������� � ���.
	};
	AI_Output(self,other,"DIA_Vatras_NightPotionIngredient_13_03");	//������� ����� ���, ��� ���. � ����� ������� ����� ����� ������.
	Vatras_NightmaresPotionTime = C_GetTime_Plus(1,0,1);
};

// ������������, ���� ������ ���, ��� �� ����� ������� ������� ������
// nr = 2

instance DIA_Vatras_NightPotion(C_Info)
{
	npc = none_18_Vatras;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Vatras_NightPotion_condition;	
	information = DIA_Vatras_NightPotion_info;
	description = "������?";
};

func int DIA_Vatras_NightPotion_condition()
{	
	if ((MIS_DS2P_Nightmares == Log_Running) && Npc_KnowsInfo(other,DIA_Vatras_NightPotionIngredient)
		 && (Vatras_NightmaresPotionTime > Wld_GetPassedTime(0)))
	{
		return TRUE;
	};
};

func void DIA_Vatras_NightPotion_info()
{
	AI_Output(other,self,"DIA_Vatras_NightPotion_15_00");	//������?
	AI_Output(self,other,"DIA_Vatras_NightPotion_13_01");	//��, ��� ���.
	// ������� ����� � ��������� ������� � ������
	CreateInvItems(self,ItMi_DS2P_LanNightmaresPotion,1);
	B_GiveInvItems(self,other,ItMi_DS2P_LanNightmaresPotion,1);
	AI_Output(self,other,"DIA_Vatras_NightPotion_13_02");	//������ ���� �������� ������ ����� ���� ����� � ������ ������� ���� ������ � �������� � �����. ����� �� ����� �����, ��������� ��� �����, � ���� ��������� � ��� ��� ����.
	AI_Output(other,self,"DIA_Vatras_NightPotion_15_03");	//���� ����, ��� ��� �������� ���� ���, ��� ��� ��� �������� ����� � ��� ���-�� ������? � ����-�� ���� ������ ����. ��� ���� ������. ��� � ����� �������, ���� �� ����������?
	AI_Output(self,other,"DIA_Vatras_NightPotion_13_04");	//���������� ����� ���� ������ ��� ����, � ����� �� ���. ���� �� ��������� � ��� � ������� ����, �� � ���� ���� ������� ����� ������� ���.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Nightmares,LOG_MISSION,LOG_Running,TOPIC_DS2P_Nightmares_HasPotion);
	AI_StopProcessInfos(self);
};
	
// ������������, ���� �� ��������� � �������� ������ ���������� �����
// nr = 1

instance DIA_Vatras_SelfmadeHeads(C_Info)
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_SelfmadeHeads_condition;	
	information = DIA_Vatras_SelfmadeHeads_info;
	description = "��� ����� ���� ������.";
};

func int DIA_Vatras_SelfmadeHeads_condition()
{	
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && Npc_KnowsInfo(other,DIA_Gustav_GardWantsKillYou))
	{
		return TRUE;
	};
};

func void DIA_Vatras_SelfmadeHeads_info()
{
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_00");	//��� ����� ���� ������.
	AI_Output(self,other,"DIA_Vatras_SelfmadeHeads_13_01");	//���-�� ���������, ��� ���?
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_02");	//��, ���� ����� ��� ����� ������ ��������� � ����� ��, � � �������� �������������� �������� ��� �� ������.
	AI_Output(self,other,"DIA_Vatras_SelfmadeHeads_13_03");	//�������� ��� ����� ����� ��������, ������. � �� ���� �� ��� ������, ���? �� ����� �� ��������? �������� � ���� ���� � ���� �� �����.
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_04");	//���, � � ��� ����, ��� ��� ��������. � �� ���� �� �������, ������� �� ���������, ��� �������� �����, �� � ���� ���� ��� ����� ���� ������.
	AI_Output(self,other,"DIA_Vatras_SelfmadeHeads_13_05");	//��� �� ���� ���������.
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_06");	//����, ���� �� ��������, ����� ������� ��������� ������ �� ����� � ���������� ��. �� ����� ����� ����, ���� ����� ������, ��� � ������� ��� ��������. �� ������ ������� ���, ��� �������� ������ ������ ��� ���������, ����������?
	AI_Output(self,other,"DIA_Vatras_SelfmadeHeads_13_07");	//��, � ���� �������� ������� �� ���, ������� ����������� �������� �����. � ���. �� ������� ��� ����� ����� ������������, � �� ����� � �� ���.
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_08");	//��� ��������, ������. ����� � ����� ������� ������ � ����������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Running,TOPIC_DS2P_FindEscapedHunters_SelfmadeHeads);
	AI_StopProcessInfos(self);
};

// ������������, ���� �� ������ � ����� 4 ��������� ������ ��������� �� ������ "����� ��������� ���������"
// nr = 1

instance DIA_Vatras_CreateSpellHeads(C_Info)
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_CreateSpellHeads_condition;	
	information = DIA_Vatras_CreateSpellHeads_info;
	description = "������ �������.";
};

func int DIA_Vatras_CreateSpellHeads_condition()
{	
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && Npc_KnowsInfo(other,DIA_Jinn_SelfmadeHeads_Ready)
		 && (Npc_HasItems(other,ItMi_DS2P_HuntersHead_Selfmade) >= 4))
	{
		return TRUE;
	};
};

func void DIA_Vatras_CreateSpellHeads_info()
{
	AI_Output(other,self,"DIA_Vatras_CreateSpellHeads_15_00");	//������ �������.
	// ������ ������� ������
	B_GiveInvItems(other,self,ItMi_DS2P_HuntersHead_Selfmade,4);
	// ������� ������
	Npc_RemoveInvItems(self,ItMi_DS2P_HuntersHead_Selfmade,4);
	AI_Output(self,other,"DIA_Vatras_CreateSpellHeads_13_01");	//������� ����-����.
	Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",none_18_Vatras,none_18_Vatras,0,0,0,FALSE);
	AI_PlayAni(none_18_Vatras,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Vatras_CreateSpellHeads_13_02");	//��� ������.
	// ������� ������ � ������ ��
	CreateInvItems(self,ItMi_DS2P_HuntersHead_Selfmade_Illusion,4);
	B_GiveInvItems(self,other,ItMi_DS2P_HuntersHead_Selfmade_Illusion,4);
	AI_Output(other,self,"DIA_Vatras_CreateSpellHeads_15_03");	//��� ������?
	AI_Output(self,other,"DIA_Vatras_CreateSpellHeads_13_04");	//� ��� �� ������� ����. �������� ���-���� �� ������ ���.
	AI_Output(other,self,"DIA_Vatras_CreateSpellHeads_15_05");	//�������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Running,TOPIC_DS2P_FindEscapedHunters_ReturningToGard);
	AI_StopProcessInfos(self);
};

//NS - 26/04/2016 ===========
// ����� "�������� �������� �������"
//===========================

//(�������� �� ������ �����)
instance DIA_Vatras_AskAncientNotes(C_Info)
{
	npc = none_18_Vatras;
	nr = 20;
	permanent = FALSE;
	condition = DIA_Vatras_PiratesAreDead_condition;	
	information = DIA_Vatras_PiratesAreDead_info;
	description = "������� ������ �������� ��������, ������� � �������� ���� � ��������?";
};
func int DIA_Vatras_AskAncientNotes_condition()
{	
	if(All_Pirat_Killed)
	{	return TRUE;	};
};
func void DIA_Vatras_AskAncientNotes_info()
{
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_01");	//������, ������� ������ �������� ��������, ������� � �������� ���� � ��������?
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_02");	//����������. ������ �� �����������?
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_03");	//��� �������� ��������� ����� � �� ���� �������, ���� � � �� ����� ������ �������� �� ����� ������.
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_04");	//��������� ���� ��������� ��� ��������, �� ���� �� ������ ����������� � �������� ����� ������.
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_05");	//�����, � ���� �������� ���-��, ��� ������� ���?
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_06");	//��, � ���� � ����� ���-����� ������ � ������������ �������. �����, ���������� �������� �� �������� ����� ����������� � ��� � ��������� �������.
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_07");	//��� ����� � ������� � ���� �����. ���, ������ ����.
	//���� �� ������� �������
	B_GiveInvItems(self,other,ITKE_Key_DS2P_VATRAS_CHEST,1);
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_08");	//�� �����? ������� ����� ����, ����� �� ���������.
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_09");	//������ ������ ����������������, � �� ������������ � ������� ���� �� ��� ������� ��������.
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_10");	//� ������ ����� � �� � ������������� ��������� � ���� �����������. ��, �����, ������ ���������� ���� ���� �������.
	//������ � �������� "�������� �������� �������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running, TOPIC_DS2P_AncientStonePlates_VatrasKey);
};


