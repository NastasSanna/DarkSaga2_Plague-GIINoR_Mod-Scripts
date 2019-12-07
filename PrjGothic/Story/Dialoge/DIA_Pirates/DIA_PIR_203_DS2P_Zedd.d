instance DIA_Zedd_EXIT(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Zedd_EXIT_condition;	
	information = DIA_Zedd_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Zedd_EXIT_condition(){	return TRUE;};
func void DIA_Zedd_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 28/06/2013 ====================================================
// �� ������ "����� �������"
//====================================================================

//----------------------------
//  ������ ������� ����������, ������������ ��� ����		nr=1
instance DIA_Zedd_Start_Gluk1(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Gluk1_condition;	
	information = DIA_Zedd_Start_Gluk1_info;
	important = TRUE;
};
func int DIA_Zedd_Start_Gluk1_condition()
{
	return TRUE;
};
func void DIA_Zedd_Start_Gluk1_info()
{
	var int x;
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_00");	//�, �� ��� �����? � ���� ��� �������� ��� �������, ����� ������ � ���� �����.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_01");	//��� ��� �� �����, ���� ������?
	AI_Output(other,self,"DIA_Zedd_Start_Gluk1_15_02");	//���� �����...
	x = 1; if (x == 1) {
		Mdl_StartFaceAni(self,"S_FRIGHTENED",1.0,2.0);
	};
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_03");	//(��������� �����) � ����, ���-���� �������. ������������, �� ��� � �� ������.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_04");	//���, ���... � ����������� ��� ���� ���� �� ��� ������� ���� ������... ���, �� ���! ������!
	AI_Output(other,self,"DIA_Zedd_Start_Gluk1_15_05");	//� �� ������������!
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_06");	//��, ��! � �� �� �� ������ ��-�������! �����, ��-�������� �����!
	AI_StopProcessInfos(self);
};

//----------------------------
//  ������ ������� ����������, ����� ������		nr=1
instance DIA_Zedd_Start_Gluk2(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Gluk2_condition;	
	information = DIA_Zedd_Start_Gluk2_info;
	description = "��������...";
};
func int DIA_Zedd_Start_Gluk2_condition()
{
	if (Npc_KnowsInfo(other, DIA_Zedd_Start_Gluk1) && Npc_IsInState(self,ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Zedd_Start_Gluk2_info()
{
	var C_NPC Dil;	Dil = Hlp_GetNpc(Bau_102_DS2P_Dil);
	var C_NPC Zedd;	Zedd = Hlp_GetNpc(PIR_203_DS2P_Zedd);
	
	AI_Output(other,self,"DIA_Zedd_Start_Gluk2_15_00");	//��������...
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_01");	//(����������) � �� ���� ���� �������! � �� ���� ���� ������! ����� �����, �����!
	AI_Output(other,self,"DIA_Zedd_Start_Gluk2_15_02");	//�� � �� �����! ���� ��� ����� ����������!
	//������ �������� ����
	// UNFINISHED ������� WP ��� ����
	AI_Teleport(Dil, "");
	AI_StartState(Dil, ZS_Stand_WP, FALSE, "");
	
	// ������� ----v
	TRIA_Invite(Dil);
	TRIA_Start();
	
	// self = Zedd, other = Hero
	TRIA_Next(Zedd);
	AI_TurnToNpc(self, Dil);
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_03");	//��, �������, ��-�� ������� ����.
	//��� ��������
	AI_GotoNpc(Dil, Zedd);
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_04");	//�� ������ ���? �����, ���� ������� ������������� ����������?
		
	// self = Dil, other = Hero
	TRIA_Next(Dil);
	AI_TurnToNpc(self, Dil);
			AI_Output(self,other,"DIA_Zedd_Start_Gluk2_12_05");	//������ ���, ����� �����, ��������� �����  � ������! ���������, ��������!
	//��� ������
	AI_ContinueRoutine(Dil);
	
	DIAG_Reset();
	TRIA_Finish();	
	// ������� ----^
	
	AI_TurnToNpc(self, other);
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_06");	//�����, ���� ���! ���! ���, ��� ����� ������ �����������. ��� ��� ����?
	//�������� �����
	CreateInvItem(self, ItFo_Addon_Grog);
	AI_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_07");	//����! � ���� ��������� ������� ���� ���-������ ��� ��������?!
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_08");	//����� �� ���� �� ��� ������, ������� � ���� ������� �����������!
	AI_StopProcessInfos(self);
};

//----------------------------
//  ������ ������� ����������, ����� ������		nr=1
instance DIA_Zedd_Start_Gluk3(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Gluk3_condition;	
	information = DIA_Zedd_Start_Gluk3_info;
	description = "�� �������� ����!";
};
func int DIA_Zedd_Start_Gluk3_condition()
{
	if (Npc_KnowsInfo(other, DIA_Zedd_Start_Gluk2)){	return TRUE;	};
};
func void DIA_Zedd_Start_Gluk3_info()
{
	AI_Output(other,self,"DIA_Zedd_Start_Gluk3_15_00");	//�� �������� ����! � ������ ������ ������� �� �������.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk3_13_01");	//�������? ����� �������? �� ��� ������, �������? ��� ������� �������!
		AI_Output(self,other,"DIA_Zedd_Start_Gluk3_13_02");	//� ��� ����� ��� �����, � �� ������ �����, �� � ����� ������.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk3_13_03");	//����� ���, ��� ��� �������� ���������� ������ �� ����������.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk3_13_04");	//�� ������ �� �����, ������� ��-��������.

	//������ � �������� "����� �������" 
	B_ds_LogEntry(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_Running,TOPIC_DS2P_DeliriumTremens_Start);
	AI_StopProcessInfos(self);
};

//----------------------------
//  ����������, ���� �� ������� ����� �������		nr=1
instance DIA_Zedd_Start_Gluk_Perm(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Gluk_Perm_condition;	
	information = DIA_Zedd_Start_Gluk_Perm_info;
	description = "��������...";
	permanent = TRUE;
};
func int DIA_Zedd_Start_Gluk_Perm_condition()
{
	if (Npc_KnowsInfo(other, DIA_Zedd_Start_Gluk3) && (MIS_DS2P_DeliriumTremens != LOG_SUCCESS)){	return TRUE;	};
};
func void DIA_Zedd_Start_Gluk_Perm_info()
{
	AI_Output(other,self,"DIA_Zedd_Start_Gluk_Perm_15_00");	//��������...
		AI_Output(self,other,"DIA_Zedd_Start_Gluk_Perm_13_01");	//(����������) � �� ���� ���� �������! � �� ���� ���� ������! ����� �����, �����!
};


//----------------------------
// ���� "�������������� �����", ���� ���� � ���� �����
instance DIA_Zedd_GiveSoberingPotion(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 0;
	condition = DIA_Zedd_GiveSoberingPotion_condition;	
	information = DIA_Zedd_GiveSoberingPotion_info;
	important = TRUE;
};
func int DIA_Zedd_GiveSoberingPotion_condition()
{
	if ((MIS_DS2P_DeliriumTremens == LOG_Running) && Npc_IsInState(self,ZS_Talk)
		&& (Npc_HasItems(other,ItMi_DS2P_SoberingPotion) > 0))
	{	return TRUE;	};
};
func void DIA_Zedd_GiveSoberingPotion_info()
{
	var int x;
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_00");	//� �����, ��� ��� ��� ����������, � �� ������ �� ������ ��� ����������. ����� �� ��������? �� �����, �����...
	//(+����)
	B_GivePlayerXP(XP_MIS_DeliriumTremens);
	AI_Output(other,self,"DIA_Zedd_GiveSoberingPotion_15_01");	//�� ��������� �� ��� ��������! ����� ����� ������!
	AI_Output(other,self,"DIA_Zedd_GiveSoberingPotion_15_02");	//��� �� � ���� ��� ����� ��������, ���� ��� �� �����, ���� ���?!
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_03");	//(���������) ���� ������, ������ ��� ������. 
	AI_Output(other,self,"DIA_Zedd_GiveSoberingPotion_15_04");	//���, ����� ���. ��� �����: ������ ������� �� ��� �� ���!
	//���� �����
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems(other,self, ItMi_DS2P_SoberingPotion,1);
		CreateInvItem(self, ItFo_Addon_Grog);	//����� ������ ������, �� ����� ���� ����� ����
	};
	
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_05");	//�? �� ���? �� �� ������ ����� ��������, ������� �� ���������� ����! 
	//��������
	AI_UseItem(self, ItFo_Addon_Grog);
	
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_06");	//��! �� ������ ���� � ���� � ����� ���� �����... ��... ���-�� ����������!
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_07");	//� ��� ���������-��... ����... ������ �������, � ������ �������...
	//������ ����������, ���� ������� �� ����� ����
	AI_StopProcessInfos(self);
	//UNFINISHED ������� WP, ���� �� �������, �������� ��������� ���������, ���� ����� ��� �������
	AI_StartState(self,ZS_FleeToWP,0,"");
	B_StartOtherRoutine(self, "MAIN");
	
	//������ � �������� "����� �������" ��������
	B_ds_LogEntry(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_DeliriumTremens_Success);
};

//----------------------------
//  ����� �����������, ���� � ��� ����������		nr=1
instance DIA_Zedd_Start_Sober(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Sober_condition;	
	information = DIA_Zedd_Start_Sober_info;
	important = TRUE;
};
func int DIA_Zedd_Start_Sober_condition()
{
	if ((MIS_DS2P_DeliriumTremens == LOG_SUCCESS) && (Npc_IsInState(self,ZS_Talk)))
	{	return TRUE;	};
};
func void DIA_Zedd_Start_Sober_info()
{
		AI_Output(self,other,"DIA_Zedd_Start_Sober_13_00");	//�� ���� ��� ��������? � �����, ���� ��������! 
	AI_Output(other,self,"DIA_Zedd_Start_Sober_15_01");	//(���������) ������ �� �������� ������, ��� � �����.
		AI_Output(self,other,"DIA_Zedd_Start_Sober_13_02");	//���! � ������! ���� ����� ������ ������� ���� � �����.
		AI_Output(self,other,"DIA_Zedd_Start_Sober_13_03");	//� ���� �� �����, ����� � ��������� ��� ��� ��������� �����. (�������)
	//�������� ��������
	CreateInvItem(self, ITFO_SAMOGON);
	AI_UseItem(self, ITFO_SAMOGON);
};


//NS - 28/06/2013 ====================================================
// ����� �������		����� ����������� 
//====================================================================

//--------------------------------
//  "��� �� �����������?", ���. ��������		nr=1
instance DIA_Zedd_WhatsUrJob(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_WhatsUrJob_condition;	
	information = DIA_Zedd_WhatsUrJob_info;
	description = "��� �� �����������?";
};
func int DIA_Zedd_WhatsUrJob_condition()
{
	if (MIS_DS2P_DeliriumTremens == LOG_SUCCESS)	{	return TRUE;	};
};
func void DIA_Zedd_WhatsUrJob_info()
{
	AI_Output(other,self,"DIA_Zedd_WhatsUrJob_15_00");	//��� �� �����������?
		AI_Output(self,other,"DIA_Zedd_WhatsUrJob_13_01");	//�, �� �� �� �������������. ���� ���� ������, � �������, ��������, ������� � ������, ������.
		AI_Output(self,other,"DIA_Zedd_WhatsUrJob_13_02");	//� �����, ���� ���� ����� ������� �������, �� �� ��������� �� ������.
	//������ � �������� � ������� ��� ���� "�������� � �������" 
	B_ds_LogEntry(TOPIC_PiratTrader,LOG_NOTE,-1,"����� ���� ������� �������.");
	TRADE_Zedd = TRUE;
};

//--------------------------------
//  "��� �� ������ ������� ����?", ���. ������������		nr=2
instance DIA_Zedd_DrinkSoMuch(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 2;
	condition = DIA_Zedd_DrinkSoMuch_condition;	
	information = DIA_Zedd_DrinkSoMuch_info;
	description = "��� �� ������ ������� ����?";
};
func int DIA_Zedd_DrinkSoMuch_condition()
{
	if (MIS_DS2P_DeliriumTremens == LOG_SUCCESS)	{	return TRUE;	};
};
func void DIA_Zedd_DrinkSoMuch_info()
{
	AI_Output(other,self,"DIA_Zedd_DrinkSoMuch_15_00");	//��� �� ������ ������� ����?
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_01");	//�� ����� � ����� ���? ��! ��� ��� ��� ������������� ���!
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_02");	//�� �� ����� ��� ����� � ���� ����� ����, ������ ��� ���������, �������� ���� ��������� ������ � ����� ����� �������, ��� ������� ����� �� ��, ��� �� ������� ��� ��������� � �������� ���� �����.
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_03");	//��� ��� � �������! ��� �� ���� ��� ������. (�������) 
	//�������� �����
	
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_04");	//��� ������� ���������� ��������� �������������, ����� �� ������� �������� ������������! ������, �� ������ �� ���� ���������������?
	AI_Output(other,self,"DIA_Zedd_DrinkSoMuch_15_05");	//�� � ���?
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_06");	//������, ������ ������ �� ��� �������, ���� �� ���� �������, ���� ���� �� ��� �� ������ ����.
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_07");	//��� ������ ��������� ����, ��� � �������� � ������� ��� ������. ��� �������?
	AI_Output(other,self,"DIA_Zedd_DrinkSoMuch_15_08");	//� �������.
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_09");	//��, ������� ����������. ����� ��� ����� �� ���� ��������!

	//������ � �������� � ������� ��� ���� "������"  //NS - ����������
	B_ds_LogEntry(Topic_Bonus,LOG_NOTE,-1,"� ���� ��������������� � ������� � ������� ������. ������ 100 �������.");
	Zedd_Competition = TRUE;
};

//--------------------------------
//  "��� �� �������� ������ ��� ��� �������?", ���. ��� ��������		nr=3
instance DIA_Zedd_WhoTaughtU(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 3;
	condition = DIA_Zedd_WhoTaughtU_condition;	
	information = DIA_Zedd_WhoTaughtU_info;
	description = "��� �� �������� ������ ��� ��� �������?";
};
func int DIA_Zedd_WhoTaughtU_condition()
{
	if (MIS_DS2P_DeliriumTremens == LOG_SUCCESS)	{	return TRUE;	};
};
func void DIA_Zedd_WhoTaughtU_info()
{
	AI_Output(other,self,"DIA_Zedd_WhoTaughtU_15_00");	//��� �� �������� ������ ��� ��� �������?
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_01");	//��� � ��� ��������. �� ��������� � ��������� ����������.
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_02");	//��� ��� ���-���-���-���-��� ��� ���������, ����� ��� ���, ��� ���-���-���-���, ����� ��� ���, ��� ���-���-���, ����� ��� ���...
	//�������� ������
	CreateInvItem(self,ItFo_booze);
	AI_UseItem(self,ItFo_Booze);
	AI_Output(other,self,"DIA_Zedd_WhoTaughtU_15_03");	//� �����.
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_04");	//��� ���, ������ �������� �������� � ����� ��������� ���� ��������, �������, ��� �� �� �������������, ������� ������� ����� ��������.
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_05");	//������, � ���� �������� ��� ������? 
	//�������� ����
	CreateInvItem(self,ItFo_Addon_Rum);
	AI_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_06");	//������ �����... ���� ���-������ ���������, ���� ���. ��� ���� ������, �� ��� � ����� ��������.

	//������ � �������� � ������� ��� ���� "������"  //NS - ����������
	B_ds_LogEntry(Topic_Bonus,LOG_NOTE,-1,"����� ���� �������� ������� ��������. �� ������ ������ �� ������ �������.");
	
	Zedd_Recipes = TRUE;
};


//NS - 28/06/2013 ====================================================
// ����� "�������� ��������"		����� ����������� 
//====================================================================
//--------------------------------
//  "��� ����� �������."		nr=10
instance DIA_Zedd_NeedBooze(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 10;
	condition = DIA_Zedd_NeedBooze_condition;	
	information = DIA_Zedd_NeedBooze_info;
	description = "��� ����� �������.";
};
func int DIA_Zedd_NeedBooze_condition()
{
	if ((MIS_DS2P_DeliriumTremens == LOG_SUCCESS) && (MIS_DS2P_ShippingSupplies == LOG_Running))
	{	return TRUE;	};
};
func void DIA_Zedd_NeedBooze_info()
{
	var int x;
	AI_Output(other,self,"DIA_Zedd_NeedBooze_15_00");	//���� ������� ����. � ������ ������� ������� �������, ���������� ������.
		AI_Output(self,other,"DIA_Zedd_NeedBooze_13_01");	//���� ���������? (�������) ���� ��� ��� ���� �� ������ �� ��� ������� �����.
		AI_Output(self,other,"DIA_Zedd_NeedBooze_13_02");	//�� �����, � ������ ��� ����������� �� � ����. ����� ������ �������.
	//���� 4 ������� ������.
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other, ItFo_Booze, 4);
	};
	
	//������ � �������� "�������� ��������" 
	B_ds_LogEntry(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_BoozeGot);
};


//NS - 28/06/2013 ====================================================
// �� ������ ��������		(+����, ������, �������)
//====================================================================
//--------------------------------
//  "�� ������ ��������..."		nr=11
instance DIA_Zedd_AboutRecipes(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 11;
	condition = DIA_Zedd_AboutRecipes_condition;	
	information = DIA_Zedd_AboutRecipes_info;
	description = "�� ������ ��������...";
};
func int DIA_Zedd_AboutRecipes_condition()
{
	if (Zedd_Recipes == TRUE)	{	return TRUE;	};
};
func void DIA_Zedd_AboutRecipes_info()
{
	Info_ClearChoices(DIA_Zedd_AboutRecipes);
	Info_AddChoice(DIA_Zedd_AboutRecipes,Dialog_Back,DIA_Zedd_AboutRecipes_Back);
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_BullSeed) && (Zedd_Recipe_Booze_BullSeed_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"� ����� ������ ������ �����",DIA_Zedd_AboutRecipes_BullSeed);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_GobboSmile) && (Zedd_Recipe_Booze_GobboSmile_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"� ����� ������ ������� ��������",DIA_Zedd_AboutRecipes_GobboSmile);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_Berserker) && (Zedd_Recipe_Booze_Berserker_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"� ����� ������ ����������",DIA_Zedd_AboutRecipes_Berserker);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_TrollBooze) && (Zedd_Recipe_Booze_TrollBooze_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"� ����� ������ ���������� �����",DIA_Zedd_AboutRecipes_TrollBooze);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_MagicGrog) && (Zedd_Recipe_Booze_MagicGrog_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"� ����� ������ ����������� ����",DIA_Zedd_AboutRecipes_MagicGrog);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_Kamikaze) && (Zedd_Recipe_Booze_Kamikaze_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"� ����� ������ ����������",DIA_Zedd_AboutRecipes_Kamikaze);	};
};
func void DIA_Zedd_AboutRecipes_Back()
{
	Info_ClearChoices(DIA_Zedd_AboutRecipes);
};
func int DIA_Zedd_AboutRecipes_General()	//���������� ��� ���� ��������
{
	var int x;
	//(+����)
	B_GivePlayerXP(XP_Zedd_Recipe_Booze);
		AI_Output(self,other,"DIA_Zedd_AboutRecipes_13_01");	//�������! ����� ��� ����. ��, �������������, ������ ������� � ��� �� ����. ������ ��������.
	//������ ������
	B_DIA_UseItem_Wait(self, other, Fakescroll, 0.7);
		AI_Output(self,other,"DIA_Zedd_AboutRecipes_13_02");	//���������, ���������... ������ ��������� �������. ���, ���. ��-����� ����������.
	//���� 100 �����
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	return TRUE;
};
func void DIA_Zedd_AboutRecipes_BullSeed()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_BullSeed_15_00");	//� ����� ������ ������ �����.
	//������ ������
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_BullSeed,1);
	Zedd_Recipe_Booze_BullSeed_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//���� �������
		B_GiveInvItems(self,other,ItFo_DS2P_BullSeed,1);
	};
};
func void DIA_Zedd_AboutRecipes_GobboSmile()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_GobboSmile_15_00");	//� ����� ������ ������� ��������.
	//������ ������
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_GobboSmile,1);
	Zedd_Recipe_Booze_GobboSmile_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//���� �������
		B_GiveInvItems(self,other,ItFo_DS2P_GobboSmile,1);
	};
};
func void DIA_Zedd_AboutRecipes_Berserker()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_Berserker_15_00");	//� ����� ������ ����������.
	//������ ������
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_Berserker,1);
	Zedd_Recipe_Booze_Berserker_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//���� �������
		B_GiveInvItems(self,other,ItFo_DS2P_Berserker,1);
	};
};
func void DIA_Zedd_AboutRecipes_TrollBooze()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_TrollBooze_15_00");	//� ����� ������ ���������� �����.
	//������ ������
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_TrollBooze,1);
	Zedd_Recipe_Booze_TrollBooze_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//���� �������
		B_GiveInvItems(self,other,ItFo_DS2P_TrollBooze,1);
	};
};
func void DIA_Zedd_AboutRecipes_MagicGrog()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_MagicGrog_15_00");	//� ����� ������ ����������� ����.
	//������ ������
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_MagicGrog,1);
	Zedd_Recipe_Booze_MagicGrog_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//���� �������
		B_GiveInvItems(self,other,ItFo_DS2P_MagicGrog,1);
	};
};
func void DIA_Zedd_AboutRecipes_Kamikaze()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_Kamikaze_15_00");	//� ����� ������ ����������.
	//������ ������
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_Kamikaze,1);
	Zedd_Recipe_Booze_Kamikaze_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//���� �������
		B_GiveInvItems(self,other,ItFo_DS2P_Kamikaze,1);
	};
};


//NS - 03/07/2013 =========================
//  �� ������ "�������� �����"
//=========================================

//----------------------------
// "����� �������, ��� �� ������� � ��� ��������."		nr=20
instance DIA_Zedd_UAStutterReason(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 20;
	condition = DIA_Zedd_UAStutterReason_condition;	
	information = DIA_Zedd_UAStutterReason_info;
	description = "����� �������, ��� �� ������� � ��� ��������.";
};
func int DIA_Zedd_UAStutterReason_condition()
{
	if (Npc_KnowsInfo(other,DIA_Vales_WhyDoYouStutter)){	return TRUE;};
};
func void DIA_Zedd_UAStutterReason_info()
{
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_00");	//����� �������, ��� �� ������� � ��� ��������.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_01");	//���, �� ��� � ����� ���� �������. ��, �� ����� ������ ���������� � ��������.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_02");	//��� ������� ����� ��� ����� �������, ��� �� ��� � �� ������ ��� ���������. �� �������� ��� �� ������.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_03");	//��, �� ����, �������� �������, � ��� ��� ������ ���������� ���� � ��������� ����� �������.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_04");	//����� ��������, ���������� ����� �������� ����, � ����� ������ ������ ����� � ����. ���� �� ���� �������, ��� ���������� �� �� �������.
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_05");	//��-�� ��� ����� ������ ���������.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_06");	//���� � � ����� �� ������. ����� ���� ������ �� ����� ������ ����� ������ ������ � ������. (�������)
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_07");	//� �� ����� ������ ��� ��������� �� ��������.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_08");	//� �� ���, ���������? ���-�� � �� ����, ����� ����� ������ ���������� �� ���� � ������� ������.
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_09");	//� ����� ����� ������, ��� ��������� �� ��� ������.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_10");	//���! ����� ���������� �� ������ ������. ��-��! �� ����� ������ ����� �� ����, ���� � �����-������ ��������.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_11");	//�� ���� �� ������ ���� ����� ����������� �� ���������. �� �� �����. ����-�� ����������, ���� �����������.
	//�������� �����
	CreateInvItem(self,ItFo_Addon_Grog);
	AI_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_12");	//�, ��������! ���� ���, ������...
	//�������� ����
	CreateInvItem(self,ItFo_Addon_Rum);
	AI_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_13");	//��, ����� ��������! ��� ���...
	//�������� ��������
	CreateInvItem(self,ITFO_SAMOGON);
	AI_UseItem(self,ITFO_SAMOGON);
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_14");	//������ ��� �� � ��������! ������ ����. ���� �������������!
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_15");	//����������� ���.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_16");	//�� ��������� ����! ��� ���, ������ �� ����� � ������� �� ���������� ������.
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_17");	//�����?
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_18");	//�� ��� ��� ����������� ��� ����! ��� ���. ���� ���� �����, � ������ ����� ������ �� �����. ��!
	//�������� ����
	CreateInvItem(self,ItFo_Wine);
	AI_UseItem(self,ItFo_Wine);

	//������ � �������� "�������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_ZeddBellows);
};


//----------------------------
// "� ������ ��������� ����."	(+����)		nr=21
instance DIA_Zedd_GotForgeBellows(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 21;
	condition = DIA_Zedd_GotForgeBellows_condition;	
	information = DIA_Zedd_GotForgeBellows_info;
	description = "� ������ ��������� ����.";
};
func int DIA_Zedd_GotForgeBellows_condition()
{
	if ((MIS_DS2P_Gambler == LOG_Running) && Npc_HasItems(other,ITMI_DS2P_ForgeBellows))
	{	return TRUE;};
};
func void DIA_Zedd_GotForgeBellows_info()
{
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_00");	//� ������ ��������� ����. 
	//(+����)
	B_GivePlayerXP(XP_MIS_Gambler_ForgeBellows);
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_01");	//�������, ����� ����.
	//�������� ����
	CreateInvItem(self,ItFo_Addon_Grog);
	AI_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_02");	//���, ������ ��� ����� �������.
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_03");	//����� ��� �������?
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_04");	//�� �����, ������� ����� ���� ����� � �� ��������� ������.
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_05");	//��� �� ����� ����� ��� �������� ��� � ������ ���?
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_06");	//�� ��� ��� ������! ������ ��� ����� ��-����������!
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_07");	//��� ���?
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_08");	//(��������) �� ���� ��� ������ ������ ���������.
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_09");	//������ ������� ��� �������, ������ ��� ����-������ ���������. ������� ����� ��� ���� ������.
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_10");	//� ��� � �� ������?
	//�������� ��������
	CreateInvItem(self,ITFO_SAMOGON);
	AI_UseItem(self,ITFO_SAMOGON);
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_11");	//���� �� � ��� �����, � �� ���� ��� ��������. ����� � �����-������ ���������� ��� ��. ��� ��� � ��� ������ ����?! ������� ���� �������� �������.
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_12");	//(������) ��� ����� �������� �����, ���� �������� �� ���������� �� �����, �������, ���� ���, �� �� ������ �� �����������, ���� ��� ���� � ��� ��� ������...

	//������ � �������� "�������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_ZeddCostumes);
};


//----------------------------
// "� ������ �������."	(+����)		nr=22
instance DIA_Zedd_GotClothes(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 22;
	condition = DIA_Zedd_GotClothes_condition;	
	information = DIA_Zedd_GotClothes_info;
	description = "� ������ �������.";
};
func int DIA_Zedd_GotClothes_condition()
{
	if ((MIS_DS2P_Gambler == LOG_Running) && Npc_HasItems(other,ItMi_DS2P_Packet_WhiteClothes))
	{	return TRUE;};
};
func void DIA_Zedd_GotClothes_info()
{
	var int x;
	AI_Output(other,self,"DIA_Zedd_GotClothes_15_00");	//� ������ �������.
	//(+����)
	B_GivePlayerXP(XP_MIS_Gambler_Clothes);
		AI_Output(self,other,"DIA_Zedd_GotClothes_13_01");	//���-�� ��������. �, �� �����. ���, ������ �� ���-��� ���������, ���. �����, ������� ����������. ������ ������ ����.
	//�������� �����, �������� �������
	CreateInvItem(self,ItFo_Addon_Grog);
	AI_UseItem(self,ItFo_Addon_Grog);
	x = 1; if (x == 1)	{
		B_DS_GiveRemoveItems(other,self,ItMi_DS2P_Packet_WhiteClothes,1);
	};
		AI_Output(self,other,"DIA_Zedd_GotClothes_13_02");	//��� ���� ������ ��������. � ������� ��� � ������ � �������� �������. ��, ������� ��, ���������, �� �� ��� ����� ���������.
		AI_Output(self,other,"DIA_Zedd_GotClothes_13_03");	//� ������, ��� �������� ��������� �����. �� � ������, ����� �� ����������� ��������, ���������� � ������ �� ���������.
	//���� ������ ����
	x = 2; if (x == 2)	{
		B_GiveInvItems(self,other,ITMI_DS2P_Shulers_Colode,1);
	};
	AI_Output(other,self,"DIA_Zedd_GotClothes_15_04");	//� ��� ��?
		AI_Output(self,other,"DIA_Zedd_GotClothes_13_05");	//������� �����. ������� � ������� ����������!
	//�������� ��������
	CreateInvItem(self,ITFO_SAMOGON);
	AI_UseItem(self,ITFO_SAMOGON);

	//������ � �������� "�������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_ZeddPlayCards);
};


//----------------------------
// ����� ����, ��� �������� ������		nr=0
instance DIA_Zedd_AfterScaredVales(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 0;
	condition = DIA_Zedd_AfterScaredVales_condition;	
	information = DIA_Zedd_AfterScaredVales_info;
	important = TRUE;
};
func int DIA_Zedd_AfterScaredVales_condition()
{
	if (Npc_KnowsInfo(other,DIA_Vales_LetsPlay))
	{	return TRUE;};
};
func void DIA_Zedd_AfterScaredVales_info()
{
	var C_NPC Zedd;		Zedd = Hlp_GetNpc(PIR_203_DS2P_Zedd);
	var C_NPC Joseph;	Joseph = Hlp_GetNpc(PIR_205_DS2P_Joseph);
	var C_NPC Vales;	Vales = Hlp_GetNpc(PIR_209_DS2P_Vales);

	//���������� �������
	TRIA_Invite(Joseph);
	TRIA_Start();

	TRIA_Next(Zedd);
	AI_Output(other,self,"DIA_Zedd_AfterScaredVales_15_00");	//������ ���������.
	//���� � ������ ������������� � ���� �������
	Npc_RemoveInvItem(Zedd,ITAR_DS2P_GHOST);		AI_EquipBestArmor(Zedd);
	AI_EquipBestMeleeWeapon(Zedd);		AI_EquipBestRangedWeapon(Zedd);
	Npc_RemoveInvItem(Joseph,ITAR_DS2P_GHOST);	AI_EquipBestArmor(Joseph);
	AI_EquipBestMeleeWeapon(Joseph);	AI_EquipBestRangedWeapon(Joseph);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_01");	//� �����, � ������ ����� �� ����� �������, ��� ������.
	//�������� �����
	CreateInvItem(Zedd,ItFo_Addon_Grog);
	AI_UseItem(Zedd,ItFo_Addon_Grog);
	TRIA_Next(Zedd);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_02");	//������, �� ��� �����?
	TRIA_Next(Joseph);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_03_Joseph");	//� �����, � ����� ������� �� �����! ������ �������� � �� �������. ��-��-��!
	TRIA_Next(Zedd);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_04");	//� ��� ����, ������, ����-�� �������. (������ �������)
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_05");	//�����, �� ��� ������������, ��� �� ����� � ������ ������ ������. ��� ��� ���� ����, ��� � ��� ���������. ��, ������?
	TRIA_Next(Joseph);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_06_Joseph");	//(������ ����) ��... ��� ������������� �� ������ �� �� ����� ������! 
	TRIA_Next(Zedd);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_07");	//��� �����. 
	TRIA_Next(Joseph);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_08_Joseph");	//����, ������ ��� �������.
	TRIA_Next(Zedd);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_09");	//� �������������!
	//������ ����������, ���� � ������ ������.
	B_StartOtherRoutine(Zedd,"MAIN");
	B_StartOtherRoutine(Joseph,"START");
	AI_StopProcessInfos(self);
	
	//������ � �������� "�������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_ZeddSuccess);

	//����� ������������ �� ���� �����
	B_StartOtherRoutine(Vales,"START");
};


//NS - 10/03/2016 ====================================================
// �� ������ "��� � ����"
//====================================================================

//----------------------------
//����� ������ ������ �������
instance DIA_Zedd_OrcBooze(C_Info)
{
	npc = PIR_203_DS2P_Zedd;						nr = 50;
	condition = DIA_Zedd_OrcBooze_condition;	
	information = DIA_Zedd_OrcBooze_info;
	description = "�� ������ ��� ����������� ����� ������� �������?";
};
func int DIA_Zedd_OrcBooze_condition()
{
	if (MIS_DS2P_OrcInTrouble == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Zedd_OrcBooze_info()
{
	AI_Output(other,self,"DIA_Zedd_OrcBooze_15_01");	//�� ������ ��� ����������� ����� ������� �������? �����, ����� �������� �� ������� ������ ������ � ������� ���� � �������.
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_02");	//� ��������, ����. � ���� �����?
	AI_Output(other,self,"DIA_Zedd_OrcBooze_15_03");	//����. ���� ����������� ����� �����������.
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_04");	//�� �� ������. � ���� ��� �������, � � ���������� ������ ���� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Zedd);
};
//----------------------------
//������ ������ �������
instance DIA_Zedd_OrcBoozeBuy(C_Info)
{
	npc = PIR_203_DS2P_Zedd;						nr = 51;
	condition = DIA_Zedd_OrcBoozeBuy_condition;	
	information = DIA_Zedd_OrcBoozeBuy_info;
	description = "��� ������ �� �������. (100 ���.)";
	permanent = TRUE;
};
func int DIA_Zedd_OrcBoozeBuy_condition()
{
	if ((MIS_DS2P_OrcInTrouble == LOG_Running)
		&& Npc_KnowsInfo(other,DIA_Zedd_OrcBooze))
	{
		return TRUE;
	};
};
func void DIA_Zedd_OrcBoozeBuy_info()
{
	AI_Output(other,self,"DIA_Zedd_OrcBooze_15_01");	//��� ������ �� �������.
	if (B_GiveInvItems(other,self,ItMi_Gold,100))	{
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_01");	//�������. � ��� ���� �������.
		B_GiveInvItems(self,other,ItFo_DS2P_OrcBooze,1);
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_02");	//������ � �� �� ��������� ���� ��� ��������� - �� ������ ��������. ����� ���� ���� � ��� ������.
		B_GivePlayerXP(XP_MIS_OrcInTrouble_Booze);
	}
	else	{
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_03");	//���? � �� ��������� ����, ��! ���������...
		CreateInvItem(self,ItFo_Addon_Rum);
		AI_UseItem(self,ItFo_Addon_Rum);
	};
};


//NS - 28/06/2013 ====================================================
// ��������				nr=90
//====================================================================
instance DIA_Zedd_TRADE(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 90;
	condition = DIA_Zedd_TRADE_condition;	
	information = DIA_Zedd_TRADE_info;
	description = "������ ���� ������.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Zedd_TRADE_condition()
{
	if (TRADE_Zedd == TRUE)	{	return TRUE;	};
};
func void DIA_Zedd_TRADE_info()
{
	AI_Output(other,self,"DIA_Zedd_TRADE_15_00");	//������ ���� ������.
		AI_Output(self,other,"DIA_Zedd_TRADE_13_01");	//������, �������, �������. (�������)
	B_GiveTradeInv(self);
};


//NS - 28/06/2013 ====================================================
// ������������  

//���� ���� �����: �� ����, ���� �� ��� ���� �� ������ � �������.
//���� ������� �� ������ ������ 3� ������� �������
//�� ������� �� ������ ������ 1� ������� �������
//������ ��� ����� ���������� ����� 3� �������
//������ ��� �� ���������� ����� 1 �������.

//NS - ����������� ��������� ����� ������ ������� �������
//	1	2	3	4	5	6	7	8	9	10
//	30%	51%	66%	38%	21%	11%	6%	3%	1%	0%
// �.�. ���� �� ����������� 3 ������, ������ ����� �� ������ ����������
//====================================================================

//--------------------------------
//  "����� �������������."		nr=200
instance DIA_Zedd_Competition(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 200;
	condition = DIA_Zedd_Competition_condition;	
	information = DIA_Zedd_Competition_info;
	description = "����� �������������.";
};
func int DIA_Zedd_Competition_condition()
{
	if (Zedd_Competition == TRUE)	{	return TRUE;	};
};
func void DIA_Zedd_Competition_Drink()
{
	CreateInvItem(other,ItFo_DS2P_Booze_Zedd);
	AI_UseItem(other,ItFo_DS2P_Booze_Zedd);
	CreateInvItem(self,ItFo_DS2P_Booze_Zedd);
	AI_UseItem(self,ItFo_DS2P_Booze_Zedd);
};
func void DIA_Zedd_Competition_Menu()
{
	Info_ClearChoices(DIA_Zedd_Competition);
	Info_AddChoice(DIA_Zedd_Competition,"���.",DIA_Zedd_Competition_No);
	Info_AddChoice(DIA_Zedd_Competition,"��.",DIA_Zedd_Competition_Yes);
};
func void DIA_Zedd_Competition_info()
{
	AI_Output(other,self,"DIA_Zedd_Competition_15_00");	//����� �������������
	//���� ������ ������
	if (Wld_GetDay() < Zedd_Competition_NextDay)
	{
		AI_Output(self,other,"DIA_Zedd_Competition_13_01");	//�� ���? ����� ������������? � ��� �� ����������� �� ������.
		AI_Output(self,other,"DIA_Zedd_Competition_13_02");	//��� �� ������ ��������, ����� ����, � ����� ���������?! ��, �� ������! ������ ���������.
		return;
	};
	//���� ��� �����
	if (Npc_HasItems(other, ItMi_Gold) < 100)
	{
		AI_Output(self,other,"DIA_Zedd_Competition_13_03");	//� ���, � ������� � ����� �� ���� �������������, ������ ��� ��� ��� �� ������������, � ������� ������.
		AI_Output(self,other,"DIA_Zedd_Competition_13_04");	//� ��� �������� � ���� ���� �� �����. ��������� ��� �����, ����� ���������.
		return;
	};
	
	//�������������
	Zedd_Competition_NextDay = Wld_GetDay() + 1;
		AI_Output(self,other,"DIA_Zedd_Competition_13_05");	//�������. ���� �������, ��� � ������, � �� ���� � ���� ������ �� �������. �������!
	// ��� ��������
	DIA_Zedd_Competition_Drink();
	Zedd_Competition_Cnt = 1;
	
		AI_Output(self,other,"DIA_Zedd_Competition_13_06");	//������ �����. ���������?
	DIA_Zedd_Competition_Menu();
};
func void DIA_Zedd_Competition_No()
{
	var int x;
	AI_Output(other,self,"DIA_Zedd_Competition_No_15_07");	//���.
		AI_Output(self,other,"DIA_Zedd_Competition_No_13_08");	//��! ������! � ��� � ����. ������� ��� ���������.
	//�������� 100 �����
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems(other,self,ItMi_Gold,100);
	};
	Info_ClearChoices(DIA_Zedd_Competition);
};
func void DIA_Zedd_Competition_Yes()
{
	var C_NPC npc_nil;	//�����
	var int Unc_Time;
	var int x;
	AI_Output(other,self,"DIA_Zedd_Competition_Yes_15_09");	//��.
		AI_Output(self,other,"DIA_Zedd_Competition_Yes_13_10");	//�������!
	// ��� ��������
	DIA_Zedd_Competition_Drink();
	Wld_PlayEffect("SLOW_TIME_IMMEDIAT",other,other,0,0,0,FALSE);
	Zedd_Competition_Cnt += 1;
	if ((Zedd_Competition_Cnt > 3) && (C_Random(100) < 50))	//����, ��� ���� ��������
	{
		Unc_Time = self.aivar[AIV_TIME_UNCONSCIOUS];
		self.aivar[AIV_TIME_UNCONSCIOUS] = 3;
		Npc_DropUnconscious(self,0,npc_nil);
		AI_Wait(self,10.0);
		self.aivar[AIV_TIME_UNCONSCIOUS] = Unc_Time;
		AI_Output(self,other,"DIA_Zedd_Competition_Yes_13_11");	//� ���! ���-�� � ������� �� � �����. � �� ������� �����! ���� ��������� �����.
		//�������� 100 �����.
		x = 1; if (x == 1) {
			B_GiveInvItems(self,other,ItMi_Gold,100);
		};
		Info_ClearChoices(DIA_Zedd_Competition);
		return;
	};
	if ((Zedd_Competition_Cnt > 1) && (C_Random(100) < 25))	//����, ��� �� ��������
	{
		Unc_Time = other.aivar[AIV_TIME_UNCONSCIOUS];
		other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
		Npc_DropUnconscious(other,0,npc_nil);
		AI_Wait(self,10.0);
		other.aivar[AIV_TIME_UNCONSCIOUS] = Unc_Time;
		AI_Output(self,other,"DIA_Zedd_Competition_Yes_13_12");	//�������, ��������! ���� ���� �������� � ������! (�������)
		//�������� 100 �����
		x = 1; if (x == 1) {
			B_DS_GiveRemoveItems(other,self,ItMi_Gold,100);
		};
		Info_ClearChoices(DIA_Zedd_Competition);
		return;
	};
		AI_Output(self,other,"DIA_Zedd_Competition_Yes_13_13");	//���?
	DIA_Zedd_Competition_Menu();
};

// ������������, ���� ���� ����� "�������"
// nr = 1

instance DIA_Zedd_AboutConspiracy(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Zedd_AboutConspiracy_condition;	
	information = DIA_Zedd_AboutConspiracy_info;
	description = "����� ��� � ��� ��������?";
};

func int DIA_Zedd_AboutConspiracy_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && C_DIA_Greg_OurIdea_Know_AboutZedd)	
	{	
		return TRUE;	
	};
};

func void DIA_Zedd_AboutConspiracy_Menu()
{
	Info_ClearChoices(DIA_Zedd_AboutConspiracy);
	Info_AddChoice(DIA_Zedd_AboutConspiracy,"������, ����.",DIA_Zedd_AboutConspiracy_Nothing);
	if (Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(���� ����)",DIA_Zedd_AboutConspiracy_HasWine);
	};
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(���� ����)",DIA_Zedd_AboutConspiracy_HasGrog);
	};
	if (Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(���� ���)",DIA_Zedd_AboutConspiracy_HasRum);
	};
	if (Npc_HasItems(other,ItFo_Samogon) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(���� �������)",DIA_Zedd_AboutConspiracy_HasSamogon);
	};
	if (Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(���� ����)",DIA_Zedd_AboutConspiracy_HasBeer);
	};
};

func void DIA_Zedd_AboutConspiracy_info()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_15_00");	//����� ��� � ��� ��������?
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_13_01");	//�����!
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_15_02");	//� ������, ��� �� ����������� �� ������� �������������� ������. ��� ���?
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_13_03");	//� ��� ���� � ���?
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_15_04");	//�� ��� ��������� ������, ������� �� ��� �������������.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_13_05");	//��, ���� ���������. �� ���� �� ���� �������� ���-������ ��������, �� �, �����, � �������� ���� � ���, ��� ���� ����������.
	DIA_Zedd_AboutConspiracy_Menu();
};

// �����������, ���� ������� ������� "������, ����." � ������� �����

func void DIA_Zedd_AboutConspiracy_Nothing()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_Nothing_15_00");	//������, ����.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_Nothing_13_01");	//��� ������ ������� ������, ������� �� ���.
	AI_StopProcessInfos(self);
};

// ����������� ����� ����, ��� ���� ����� �������

func void DIA_Zedd_AboutConspiracy_Continue()
{
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_01");	//(���� ����������) ��, ����� ����������! ��� �� ��� �� ������������?
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_02");	//�� ������ ���������� ��� � ����� ����������.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_03");	//�, ��� � ������������-�� ������. ���, ������ ���������� � ��� ������� �����, ��� ��� �������� ��������: ���, ����, ������ � �������.
	// ������� ������� ����� � ������ ��
	CreateInvItems(self,ItWr_DS2P_ZeddDiary,1);
	B_GiveInvItems(self,other,ItWr_DS2P_ZeddDiary,1);
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_04");	//� �� ��� ������ ��� �� �����?
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_05");	//���, ���� �� ��� ���-�� ������.
	// �� ������ �������
	AI_StopLookAt(other);
	AI_UseItemToState(other,Fakescroll,1);
	AI_Wait(other,3);
	AI_UseItemToState(other,Fakescroll,-1);
	B_LookAtNpc(other,self);
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_06");	//(��� ����) ����� ������ �� ����� ����. � ���� ��� ��������� � ������. �� �� ����� �� ����� ���� ��������� �����������. ��� ������ � ������ �� ������������.
	// �� ������ �������
	AI_StopLookAt(other);
	AI_UseItemToState(other,Fakescroll,1);
	AI_Wait(other,3);
	AI_UseItemToState(other,Fakescroll,-1);
	B_LookAtNpc(other,self);
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_07");	//(��� ����) ���, ������ �������� �� ������.
	// ������ ������� �����
	B_GiveInvItems(other,self,ItWr_DS2P_ZeddDiary,1);
	// ������� �������
	Npc_RemoveInvItems(self,ItWr_DS2P_ZeddDiary,1);
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_08");	//�������� ���������. ����� ���� � ������ ��������, � ������� ��������� � ��� ��� ��������.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_09");	//��, ���� ���� ���� ������, �� ����������. ����� ������� ������, ��� �� ��� �����. ���������?
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_10");	//�������. ����� ���� � ��� ������� � ��������� �������.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_11");	//�� �����! � ��� ���� ������� �����?
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_12");	//��� ����������. ������ ���� ������� ����� ������ ����������� � ������ ������� �������� � ��� �� ��������.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_13");	//��� ����, �� ���� � �� ����� ������� ������ �� ���������, ����� ����. ��� ������ ��� ���� �� ����� � �� ������ ��������� � ����� �����, ���� �� ��� ���� ��� � �� �������.
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_14");	//�����, ����� �, ��� ��� �����. �����!
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_15");	//(����������)
	Zedd_IsDrunken_Conspiracy = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_Running,TOPIC_DS2P_CompromiseZedd_Start);
};

// �����������, ���� ������� ������� "(���� ����)" � ������� �����

func void DIA_Zedd_AboutConspiracy_HasWine()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//�����!
	// ������ ����� �������
	B_GiveInvItems(other,self,ItFo_Wine,1);
	// ���� ����
	AI_UseItem(self,ItFo_Wine);
	DIA_Zedd_AboutConspiracy_Continue();
};

// �����������, ���� ������� ������� "(���� ����)" � ������� �����

func void DIA_Zedd_AboutConspiracy_HasGrog()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//�����!
	// ������ ����� �������
	B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	// ���� ����
	AI_UseItem(self,ItFo_Addon_Grog);
	DIA_Zedd_AboutConspiracy_Continue();
};

// �����������, ���� ������� ������� "(���� ���)" � ������� �����

func void DIA_Zedd_AboutConspiracy_HasRum()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//�����!
	// ������ ����� �������
	B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	// ���� ����
	AI_UseItem(self,ItFo_Addon_Rum);
	DIA_Zedd_AboutConspiracy_Continue();
};

// �����������, ���� ������� ������� "(���� �������)" � ������� �����

func void DIA_Zedd_AboutConspiracy_HasSamogon()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//�����!
	// ������ ����� �������
	B_GiveInvItems(other,self,ItFo_Samogon,1);
	// ���� ����
	AI_UseItem(self,ItFo_Samogon);
	DIA_Zedd_AboutConspiracy_Continue();
};

// �����������, ���� ������� ������� "(���� ����)" � ������� �����

func void DIA_Zedd_AboutConspiracy_HasBeer()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//�����!
	// ������ ����� �������
	B_GiveInvItems(other,self,ItFo_Beer,1);
	// ���� ����
	AI_UseItem(self,ItFo_Beer);
	DIA_Zedd_AboutConspiracy_Continue();
};

// ������������, ���� � ������ ������ �� ���� ����� ������� �� ������ "�������"
// nr = 1

instance DIA_Zedd_AboutConspiracy_Again(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Zedd_AboutConspiracy_Again_condition;	
	information = DIA_Zedd_AboutConspiracy_Again_info;
	description = "�����...";
};

func int DIA_Zedd_AboutConspiracy_Again_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running)
		 && Npc_KnowsInfo(other,DIA_Zedd_AboutConspiracy) && !Zedd_IsDrunken_Conspiracy)	
	{	
		return TRUE;	
	};
};

func void DIA_Zedd_AboutConspiracy_Again_info()
{
	DIA_Zedd_AboutConspiracy_Menu();
};

// ������������ ����� ������ ������ "��������� �� �����", � � �� ���� ����� ��������� �����
// nr = 555

instance DIA_Zedd_ZeddCompromise_Map(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 555;
	permanent = FALSE;
	condition = DIA_Zedd_ZeddCompromise_Map_condition;	
	information = DIA_Zedd_ZeddCompromise_Map_info;
	description = "(������� ��� ����� � ���� ����� ������)";
};

func int DIA_Zedd_ZeddCompromise_Map_condition()
{
	if (MIS_DS2P_CompromiseZedd == Log_Running)	
	{
		if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) > PICKPOCKET_LEVEL_NONE)
		{
			return TRUE;
		};
	};
};

func void DIA_Zedd_ZeddCompromise_Map_info()
{
	// ������� ����� � ��������� ����� � ������ ��
	CreateInvItems(self,ItWr_DS2P_ZeddCompromise_Map,1);
	B_GiveInvItems(self,other,ItWr_DS2P_ZeddCompromise_Map,1);
	// ������� ���� � ��������� ����� � ������ ��
	CreateInvItems(self,ITKE_Key_DS2P_ZEDDCOMPROMISE,1);
	B_GiveInvItems(self,other,ITKE_Key_DS2P_ZEDDCOMPROMISE,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_Running,TOPIC_DS2P_CompromiseZedd_Map);
};

// ������������ ����� ������ ������ "��������� �� �����", � �� ������ ���� ������� �����, � �� �� ������
// nr = 1

instance DIA_Zedd_ZeddCompromise_Diary(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Zedd_ZeddCompromise_Diary_condition;	
	information = DIA_Zedd_ZeddCompromise_Diary_info;
	description = "������, ��� � �����.";
};

func int DIA_Zedd_ZeddCompromise_Diary_condition()
{
	if ((MIS_DS2P_CompromiseZedd == Log_Running)
		 && (Npc_HasItems(other,ItWr_DS2P_ZeddDiary) >= 1)
		 && (Hero_IsReadZeddDiary == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Zedd_ZeddCompromise_Diary_info()
{
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_00");	//������, ��� � �����.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_01");	//����, �����. ��, �������, � ������� �� ����� �� �� �����? ����� ���� ������������.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_02");	//� �� � ���. � ��� ����� ���������� ����������. �����-���� ����������� ����������. ��� ����-��.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_03");	//(������) �-�, �� �������, � ��� ��.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_04");	//(���������) ��? ����� ����� ������. �����, ��� ����� ���������� ���������� �����.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_05");	//����! �� �����.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_06");	//�����, �����������? ������� �� ������?
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_07");	//������ ���� ������ ���������� � ��������� �������.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_08");	//� ��� ���� ����?
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_09");	//� ����, ����� �� ������������ �� �������� �������� ������� �� �����.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_10");	//��������? ����� ��������? ������� ���� ����� ������ ������������?
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_11");	//���, �� ��������. � ���, ��� ����� ��������� ����� �������� �������, ���� ���� ��� �����. �� � ������ ����� �������� �����. ���� �� �� ����������� ������ ���� ����� �� �����, �� � ����� ���� ���� �����. ����?
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_12");	//��, ������ �� ���� ��������� �� ����. � ���� � ������-�� ���. �����, ��������. ����� ��� �����.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_13");	//�, ���, �������. ���� ����������� �� ������� �������, ����� ���� �� �� ��������.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_14");	//�����, � ��� �� ������� �� ������ � ����, �? �� ���� ������  � ��������� � ������.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_15");	//� ��� ��� ������� ������������� �� ����. ���� �� ������������ �� ����������� � �� ������� �������� �����, ���-�� ������������ ����� � ������, � �����, ���� �� ����������� � ��� �������� ����� ���� �����, � ����� ���� ���� �����. �����!
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_16");	//�����. ������ ��� ����� ���. �������� ��� �������� ��� ������� �����? ������ ����������� ����������.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_17");	//� ���, ��� �� ������ � ��������� ����������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_Running,TOPIC_DS2P_CompromiseZedd_Compr);
	Zedd_InConspiracy = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_ZeddIn);
};

// ������������, ���� ���� ����� "��������� �� �����", ����� "�������" �������� � ���� �����
// nr = 1

instance DIA_Zedd_BringBackDiary(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Zedd_BringBackDiary_condition;	
	information = DIA_Zedd_BringBackDiary_info;
	description = " ";
};

func int DIA_Zedd_BringBackDiary_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && (Conspiracy_IsStarted == TRUE) && Npc_IsDead(Gard))	
	{
		return TRUE;
	};
};

func void DIA_Zedd_BringBackDiary_info()
{
	AI_Output(self,other,"DIA_Zedd_BringBackDiary_13_00");	//(�������) ������, ����� ���� ���� ���������, ����� ��� ��� ������� �����, ��� � ������.
	Info_ClearChoices(DIA_Zedd_BringBackDiary);
	Info_AddChoice(DIA_Zedd_BringBackDiary,"� ���� �� � ����� ���.",DIA_Zedd_BringBackDiary_No);
	if (Npc_HasItems(other,ItWr_DS2P_ZeddDiary) >= 1) // ���� � �� ���� ������� �����
	{
		Info_AddChoice(DIA_Zedd_BringBackDiary,"���, �����.",DIA_Zedd_BringBackDiary_Yes);
	};
};

// �����������, ���� ������� ������� "� ���� �� � ����� ���." � ������� � ������

func void DIA_Zedd_BringBackDiary_No()
{
	AI_Output(other,self,"DIA_Zedd_BringBackDiary_No_15_00");	//� ���� �� � ����� ���.
	AI_Output(self,other,"DIA_Zedd_BringBackDiary_No_13_01");	//���? ��� ������ � ���?
	AI_Output(other,self,"DIA_Zedd_BringBackDiary_No_15_02");	//� �� �����, ����� ������ �� � �����.
	AI_Output(self,other,"DIA_Zedd_BringBackDiary_No_13_03");	//����� ������ �� �� ������ ������� � ����� ���. ������!
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "���, �����." � ������� � ������

func void DIA_Zedd_BringBackDiary_Yes()
{
	AI_Output(other,self,"DIA_Zedd_BringBackDiary_Yes_15_00");	//���, �����.
	// ������ ����� �����
	B_GiveInvItems(other,self,ItWr_DS2P_ZeddDiary,1);
	AI_Output(self,other,"DIA_Zedd_BringBackDiary_Yes_13_01");	//�������! �� ������, � �� ��� �������, ��� ��� ������ �� �� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,Log_Mission,Log_Success,TOPIC_DS2P_CompromiseZedd_Success);
	B_GivePlayerXP(XP_MIS_DS2P_CompromiseZedd);
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};
	
// ������������, ���� ���� ����� "��������� �� �����" � �� � ������ ������ �� ����� �����
// nr = 1

instance DIA_Zedd_BringBackDiary2(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Zedd_BringBackDiary2_condition;	
	information = DIA_Zedd_BringBackDiary_Yes;
	description = "���, �����.";
};

func int DIA_Zedd_BringBackDiary2_condition()
{
	if (MIS_DS2P_Conspiracy == Log_Running && Npc_KnowsInfo(other,DIA_Zedd_BringBackDiary) && Npc_HasItems(other,ItWr_DS2P_ZeddDiary) >= 1)	
	{
		return TRUE;
	};
};
	
	