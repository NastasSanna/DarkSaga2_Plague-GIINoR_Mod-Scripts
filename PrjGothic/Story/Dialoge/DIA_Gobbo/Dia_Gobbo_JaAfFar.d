instance DIA_JaAfFar_EXIT(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;
	nr = 999;
	permanent = TRUE;
	condition = DIA_JaAfFar_EXIT_condition;	
	information = DIA_JaAfFar_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_JaAfFar_EXIT_condition(){	return TRUE;};
func void DIA_JaAfFar_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 07/05/2016 ===========
// ���������� 
//===========================
instance DIA_JaAfFar_Hello(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 1;
	condition = DIA_JaAfFar_Hello_condition;	
	information = DIA_JaAfFar_Hello_info;
	important = TRUE;
};
func int DIA_JaAfFar_Hello_condition(){	return TRUE;};
func void DIA_JaAfFar_Hello_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_Hello_15_01");	//�����? ������ ��������� ������ ����� � �������. ������. ���-��-���-��-��-����!
};
// --------------------------------------------
instance DIA_JaAfFar_HowAU(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 2;
	condition = DIA_JaAfFar_HowAU_condition;	
	information = DIA_JaAfFar_HowAU_info;
	description = "��� ����?";
	permanent = TRUE;
};
func int DIA_JaAfFar_HowAU_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_Hello)) {
		return TRUE;
	};
};
func void DIA_JaAfFar_HowAU_info()
{	
		AI_Output(other,self,"DIA_JaAfFar_HowAU_15_01");	//��� ����?
	AI_Output(self,other,"DIA_JaAfFar_HowAU_18_02");	//���� ���.
};

//NS - 07/05/2016 ===========
// ����� "����� ���" 
//===========================
func void B_JaAfFar_StealGold(var int sum)
{
	Npc_RemoveInvItems(other, ItMi_Gold, MIS_DS2P_QuirkyThief_Sum);
	MIS_DS2P_QuirkyThief_Sum = sum;
	var string txt;	txt = CS3("�������� ",IntToString(MIS_DS2P_QuirkyThief_Sum)," �������");
	AI_PrintScreen(txt, -1,YPOS_ItemGiven, FONT_ScreenSmall, 2);
};
instance DIA_JaAfFar_WhoAreU(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 10;
	condition = DIA_JaAfFar_WhoAreU_condition;	
	information = DIA_JaAfFar_WhoAreU_info;
	description = "�� ���?";
};
func int DIA_JaAfFar_WhoAreU_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_Hello)) {
		return TRUE;
	};
};
func void DIA_JaAfFar_WhoAreU_info()
{	
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_15_01");	//�� ���?
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_18_02");	//��� ����� ���-��-���, ����� ��� �������. ��� ���� �������� ��� ����.
	Info_ClearChoices(DIA_JaAfFar_WhoAreU);
	Info_AddChoice(DIA_JaAfFar_WhoAreU,"�������.",DIA_JaAfFar_WhoAreU_OK);
	if (Npc_HasItems(other,ItMi_Gold) >= 75)	{
		Info_AddChoice(DIA_JaAfFar_WhoAreU,"����� �� ������?",DIA_JaAfFar_WhoAreU_Steal1);
	};
};
func void DIA_JaAfFar_WhoAreU_OK()
{	
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_OK_15_01");	//�������.
	Info_ClearChoices(DIA_JaAfFar_WhoAreU);
};
// ������������ ��� 1 ��� -----------------------------------------
func void DIA_JaAfFar_WhoAreU_Steal1()
{	
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_Steal1_15_01");	//����� �� ������?
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_Steal1_18_02");	//��-��, ��-��.
	AI_PointAt(self,Npc_GetNearestWP(other));
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_Steal1_18_03");	//������ ����� ����.
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_Steal1_15_04");	//��� ���?
	AI_TurnToWP(other,Npc_GetNearestWP(other));
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_Steal1_18_05");	//����������.
	//������ 36 �������
	B_JaAfFar_StealGold(36);
	AI_TurnToNpc(other,self);
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_Steal1_15_06");	//(��� ����) �� ���� ������ ������� �������� ��������� ����!
	//������ � �������� "����� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Start);
	Info_ClearChoices(DIA_JaAfFar_WhoAreU);
	Info_AddChoice(DIA_JaAfFar_WhoAreU,"��, �����, ����� ��� ������!",DIA_JaAfFar_GiveBackMyGold);
	//���� ����� ������� �������
	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 50))	{
		Info_AddChoice(DIA_JaAfFar_WhoAreU,"(�������)",DIA_JaAfFar_WhoAreU_StealBack1);
	};
};
func void DIA_JaAfFar_WhoAreU_StealBack1()
{	
	MIS_DS2P_QuirkyThief_StealBack = TRUE;
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack1_15_01");	//������, � ��� ��� �� ����� �����, �������� ����� ��� �������? � ����� ������ �� �����.
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_StealBack1_18_02");	//����?
	AI_TurnAway(self,other);
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_StealBack1_18_03");	//������ �����. ������ �������.
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack1_15_04");	//�, ��� ��� ���������, � � �� ����� �����. ������, ������.
	//�� �������� 49 �������.
	B_GiveInvItems(self,other,ItMi_Gold,49);
	B_GiveThiefXP();
	Snd_Play("Geldbeutel");
	//������ � �������� "����� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_StealBack1);
	AI_StopProcessInfos(self);
};
// ������������ ��� 2 ��� -----------------------------------------
instance DIA_JaAfFar_Steal2(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 11;
	condition = DIA_JaAfFar_Steal2_condition;	
	information = DIA_JaAfFar_Steal2_info;
	important = TRUE;
};
func int DIA_JaAfFar_Steal2_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_WhoAreU) && MIS_DS2P_QuirkyThief_StealBack) {
		return TRUE;
	};
};
func void DIA_JaAfFar_Steal2_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_Steal2_15_01");	//����, �����. ��� � ���� ���� �������.
		AI_Output(self,other,"DIA_JaAfFar_Steal2_18_02");	//���������.
	AI_Output(other,self,"DIA_JaAfFar_Steal2_15_03");	//�����, ����� ����������. ��� ���� ������: ���� �� ������ ����� �� ������ ����.
		AI_Output(self,other,"DIA_JaAfFar_Steal2_18_04");	//���� �� ������ �����, ����� ������ �������? �������. �� ����� �����. �� ����� ����...
	//�� ����� ��������� ������� ������, �� ���� ��� 77 �����.
	B_JaAfFar_StealGold(77);
	AI_Output(other,self,"DIA_JaAfFar_Steal2_15_05");	//������� �����. ��� ������ ���, ��� �������.
		AI_Output(self,other,"DIA_JaAfFar_Steal2_18_06");	//(��� ����) ���� ��������� �������� ����� �� ����������.
	//������ � �������� "����� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Steal2);
	Info_ClearChoices(DIA_JaAfFar_Steal2);
	Info_AddChoice(DIA_JaAfFar_Steal2,"��, �����, ����� ��� ������!",DIA_JaAfFar_GiveBackMyGold);
	//���� ����� ������� �������
	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 70))	{
		Info_AddChoice(DIA_JaAfFar_Steal2,"(�������)",DIA_JaAfFar_WhoAreU_StealBack2);
	};
};
func void DIA_JaAfFar_WhoAreU_StealBack2()
{	
	MIS_DS2P_QuirkyThief_StealBack = TRUE;
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack2_15_01");	//� ������ � �� ���� � ��� � ������� ����� ��������?
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_StealBack2_18_02");	//������ ��� ���� ������� ������ ������������ �����.
	//�� ������ 96 �������.
	B_GiveInvItems(self,other,ItMi_Gold,96);
	B_GiveThiefXP();
	Snd_Play("Geldbeutel");
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack2_15_03");	//�������. ��� ���, ��� � ����� �����.
	//������ � �������� "����� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_StealBack2);
	AI_StopProcessInfos(self);
};
// ������������ ��� 3 ��� -----------------------------------------
instance DIA_JaAfFar_Steal3(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 12;
	condition = DIA_JaAfFar_Steal3_condition;	
	information = DIA_JaAfFar_Steal3_info;
	important = TRUE;
};
func int DIA_JaAfFar_Steal3_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_Steal2) && MIS_DS2P_QuirkyThief_StealBack) {
		return TRUE;
	};
};
func void DIA_JaAfFar_Steal3_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_Steal3_18_01");	//�����, ����� ����. ���-��-��� ������� ���������� ����� �����.
		AI_Output(other,self,"DIA_JaAfFar_Steal3_15_02");	//����� �����?
	AI_Output(self,other,"DIA_JaAfFar_Steal3_18_03");	//������ �����. ������ ������. ��� ���� ������ ������� ���������. ����� ����� ���������.
		AI_Output(other,self,"DIA_JaAfFar_Steal3_15_04");	//��? � ��� �� ������ �� ��� �����?
	AI_Output(self,other,"DIA_JaAfFar_Steal3_18_05");	//����� ���� ���-��-��� ������. ����� ������. 100 �����.
		AI_Output(other,self,"DIA_JaAfFar_Steal3_15_06");	//������-�� ��, ������, ������� ��� ��� �����.
	AI_Output(self,other,"DIA_JaAfFar_Steal3_18_07");	//(����) ��� �������� ����� ����. ����� ��������� ������.
	//�� ��������� 97 ������� �������.
	B_JaAfFar_StealGold(97);
		AI_Output(other,self,"DIA_JaAfFar_Steal3_15_08");	//(��� ����) ���� ����� � �� ������������� ��� ����������.
	//������ � �������� "����� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Steal3);
	Info_ClearChoices(DIA_JaAfFar_Steal3);
	Info_AddChoice(DIA_JaAfFar_Steal3,"��, �����, ����� ��� ������!",DIA_JaAfFar_GiveBackMyGold);
	//���� ����� ������� �������
	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 90))	{
		Info_AddChoice(DIA_JaAfFar_Steal3,"(�������)",DIA_JaAfFar_WhoAreU_StealBack3);
	};
};
func void DIA_JaAfFar_WhoAreU_StealBack3()
{	
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack3_15_01");	//������, � ���� �� ����� ������? �� �� ����� ��� ������, ��� ��� ������� �� ������! 
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack3_15_02");	//� �����? ������ ����� �� �� ���� ������� �� ���������, ������� �������! � ��� �� ������ ����� ������� ������, �? 
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack3_15_03");	//� ����� �� ��� �������. ������?
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_StealBack3_18_04");	//�����. ���-��-��� �� ����� �������.
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack3_15_05");	//��, �� ��� � ���� ���.
	//�� ������ 117 �������.
	B_GiveInvItems(self,other,ItMi_Gold,117);
	B_GiveThiefXP();
	Snd_Play("Geldbeutel");

	//������ � �������� "����� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_StealBack3);
	AI_StopProcessInfos(self);
};

// �������� ������ ����� - ����� ����������� -----------------------------------------
func void DIA_JaAfFar_GiveBackMyGold()
{	
	MIS_DS2P_QuirkyThief_StealBack = FALSE;
	//���������� ������ 2-�� �������
	var int sum1;	sum1 = MIS_DS2P_QuirkyThief_Sum * 2 / 3;
	var int sum2;	sum2 = MIS_DS2P_QuirkyThief_Sum - sum1; 
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_01");	//��, �����, ����� ��� ������!
	AI_Output(self,other,"DIA_JaAfFar_GiveBackMyGold_18_02");	//����? ���-��-��� �� �������� �����. ����� �������� �������. �����-��-��-��-��!
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_03");	//� ��, ��������� �������, �� �����������, ��� �� ��������� ����!
	AI_Output(self,other,"DIA_JaAfFar_GiveBackMyGold_18_04");	//(���������) �� ��� �� ���������, ��� �������� �����.
	//�� ������� ������.
	if (Npc_HasEquippedMeleeWeapon(other))	{
		AI_ReadyMeleeWeapon(other);
	}
	else {
		Npc_SetToFistMode(other);
	};
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_05");	//�� ���, ��������� ��������. ���� � �� ����� ���� ������, �� ���� ������ ����� ������, ������.
	AI_Output(self,other,"DIA_JaAfFar_GiveBackMyGold_18_06");	//����, �����, ����� ������� ������, �� �� ���� ���-��-���.
	//������ ���� ����� ������
	B_GiveInvItems(self,other,ItMi_Gold,sum1);
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_07");	//��, ��� �� ���.
	//������ ���������� ���������
	B_GiveInvItems(self,other,ItMi_Gold,sum2);
	AI_Output(self,other,"DIA_JaAfFar_GiveBackMyGold_18_08");	//���, ��� ���. � ���-��-��� ���� ������.
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_09");	//���-��.
	//������� ������.
	if (Npc_IsInFightMode(other,FMODE_MELEE))	{
		AI_RemoveWeapon(other);
	}
	else {
		Npc_SetToFightMode(other,FMODE_NONE);
	};
	//������ � �������� "����� ���" - ����� ������
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_QuirkyThief_BruteForce);
};
// �������, ��� �� ������ ���, ��� �� -----------------------------------------
instance DIA_JaAfFar_BestThief(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 13;
	condition = DIA_JaAfFar_BestThief_condition;	
	information = DIA_JaAfFar_BestThief_info;
	important = TRUE;
};
func int DIA_JaAfFar_BestThief_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_Steal3) && MIS_DS2P_QuirkyThief_StealBack) {
		return TRUE;
	};
};
func void DIA_JaAfFar_BestThief_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_01");	//����, �����.
		AI_Output(other,self,"DIA_JaAfFar_BestThief_15_02");	//� �����, ������ ���! � ���� �� ������� ��� �������� ���� ���������, �?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_03");	//�����-�����. ��� ������� �������� � �����. ��� ������� �������, ��� ����� ������ ������ ����, ���� ���-��-���.
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_04");	//��� ������� ����� ������ ���.
		AI_Output(other,self,"DIA_JaAfFar_BestThief_15_05");	//������? � ���?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_06");	//��� ������� ������� ���� � ����� � ������� �� ������.
		AI_Output(other,self,"DIA_JaAfFar_BestThief_15_07");	//� �� ���� ��� ���������? ������ ��� �� ������ ������� ����� � �����?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_08");	//�������� � ���� �������� ���� �����. ��� ��� ��������, �� ��� �������. ���� ������� ���� �����, � ��� ������.
	Info_ClearChoices(DIA_JaAfFar_BestThief);
	Info_AddChoice(DIA_JaAfFar_BestThief,"������� ��� � ����� ��������.",DIA_JaAfFar_BestThief_No);
	Info_AddChoice(DIA_JaAfFar_BestThief,"������.",DIA_JaAfFar_BestThief_Yes);
};
func void DIA_JaAfFar_BestThief_No()
{	
		AI_Output(other,self,"DIA_JaAfFar_BestThief_No_15_01");	//������� ��� � ����� ��������.
	AI_Output(self,other,"DIA_JaAfFar_BestThief_No_18_02");	//����� �� ������ ������?
		AI_Output(other,self,"DIA_JaAfFar_BestThief_No_15_03");	//���.
	Info_ClearChoices(DIA_JaAfFar_BestThief);
	//������ � �������� "����� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_QuirkyThief_Failed_FlourNo);
	AI_StopProcessInfos(self);
};
func void DIA_JaAfFar_BestThief_Yes()
{	
		AI_Output(other,self,"DIA_JaAfFar_BestThief_Yes_15_01");	//������. � ������ ����. ��� ���� ������ ������� ���������?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_Yes_18_02");	//��-��. ���� ���� ������� �����.
	AI_Output(self,other,"DIA_JaAfFar_BestThief_Yes_18_03");	//� ��� ������ ��� �� ������� �����. � �����. ������� ������ ������ ����.
		AI_Output(other,self,"DIA_JaAfFar_BestThief_Yes_15_04");	//������, ����� ����?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_Yes_18_05");	//����. ������ ������� ����. ���� ��������� � ��� ������ ����.
	Info_ClearChoices(DIA_JaAfFar_BestThief);
	//������ � �������� "����� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_QuirkyThief_Flour);
	MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_Pre;
};
instance DIA_JaAfFar_LetsGo(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 14;
	condition = DIA_JaAfFar_LetsGo_condition;	
	information = DIA_JaAfFar_LetsGo_info;
	description = "�����.";
	permanent = TRUE;
};
func int DIA_JaAfFar_LetsGo_condition()
{
	if (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_Pre) {
		return TRUE;
	};
};
func void DIA_JaAfFar_LetsGo_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_LetsGo_15_01");	//�����.
	if (Wld_IsTime(22,0, 2, 0))	{
		AI_Output(self,other,"DIA_JaAfFar_LetsGo_18_02");	//����� ���� ������.
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		self.aivar[AIV_EnemyOverride] = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_JaAfFar_LetsGo_18_03");	//��-��! ����� ���� ���� �����.
	};
};
// -----------------------------------------
instance DIA_JaAfFar_CameToMill(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 15;
	condition = DIA_JaAfFar_CameToMill_condition;	
	information = DIA_JaAfFar_CameToMill_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_JaAfFar_CameToMill_condition()
{
	if ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)
		 && (Npc_GetDistToWP(self, PIR_223_DS2P_GuardMill.wp) < 3000)) { //UNFINISHED WP � ��������, ��������� ����������
		return TRUE;
	};
};
func void DIA_JaAfFar_CameToMill_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_CameToMill_15_01");	//����, �� ������.
	//UNFINISHED �������� ������� - �������� ������ �� ��������
	if (!C_NpcIsDown(PIR_223_DS2P_GuardMill))	{	//���� �������� �� �����
			AI_Output(other,self,"DIA_JaAfFar_CameToMill_18_02");	//�������� ���-������, ���� � ���� ��������� ���������. � �� �����!
		AI_Output(self,other,"DIA_JaAfFar_CameToMill_15_03");	//��� ������ ���.
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(self,"MILL");
		self.aivar[AIV_NoFightParker] = TRUE;	//���������, ����� ��� �� �����, �� �� ��������
		MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_CameTo;
	}
	else	{//��������� ��� ���
			AI_Output(other,self,"DIA_JaAfFar_CameToMill_18_04");	//������, ������ �������� ����� �� ��������.
		AI_Output(self,other,"DIA_JaAfFar_CameToMill_15_05");	//����� ��� ������� ����, � ����� �������� ������.
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(self,"MILL");
		MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GotIt;
		Npc_SetRefuseTalk(self, 5);
	};
};
//����� ���� -----------------------------------------
instance DIA_JaAfFar_GotIt(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 16;
	condition = DIA_JaAfFar_GotIt_condition;	
	information = DIA_JaAfFar_GotIt_info;
	important = TRUE;
};
func int DIA_JaAfFar_GotIt_condition()
{
	if (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GotIt) {
		return TRUE;
	};
};
func void DIA_JaAfFar_GotIt_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_GotIt_15_01");	//����� �������! ������� ��� ��� ����! ��� ������� ����.
};
//����� ����� -----------------------------------------
instance DIA_JaAfFar_GoBack(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 16;
	condition = DIA_JaAfFar_GoBack_condition;	
	information = DIA_JaAfFar_GoBack_info;
	description = "������ �����.";
};
func int DIA_JaAfFar_GoBack_condition()
{
	if (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GotIt) {
		return TRUE;
	};
};
func void DIA_JaAfFar_GoBack_info()
{	
		AI_Output(other,self,"DIA_JaAfFar_GoBack_18_01");	//������ �����.
	AI_Output(self,other,"DIA_JaAfFar_GoBack_15_02");	//��-��. ����� �����, ��� ����� ����. ������ �����, �����. 
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"FOLLOW");
	self.aivar[AIV_NoFightParker] = FALSE;	//������ �� ��������
	self.aivar[AIV_EnemyOverride] = TRUE;	//�� � ����� �� ����� ��� ����� � �����
	MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GoBack;
};
//��������� � ������� �������� -----------------------------------------
instance DIA_JaAfFar_CameBack(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 17;
	condition = DIA_JaAfFar_CameBack_condition;	
	information = DIA_JaAfFar_CameBack_info;
	important = TRUE;
};
func int DIA_JaAfFar_CameBack_condition()
{
	if ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoBack)
		 && (Npc_GetDistToWP(self,"") < 5000)) {//UNFINISHED ������ � �������
		return TRUE;
	};
};
func void DIA_JaAfFar_CameBack_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_CameBack_15_02");	//�� ���������! �������, �����, ������ ������ ����. ������ �� ��� ������ ����.
		AI_Output(other,self,"DIA_JaAfFar_CameBack_18_01");	//��� �� ���.
	B_StartOtherRoutine(self,"START");
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GoBack;
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_QuirkyThief_Success);
	//UNFINISHED ������� ���� � �������
};

//�� ������ �� ����, ������ �������� ����� -----------------------------------------
instance DIA_JaAfFar_Late(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 18;
	condition = DIA_JaAfFar_Late_condition;	
	information = DIA_JaAfFar_Late_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_JaAfFar_Late_condition()
{
	if (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_Late) {
		return TRUE;
	};
};
func void DIA_JaAfFar_Late_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_CameBack_15_01");	//����� ������? ������� ���� ���� ����. 
	if (JaAfFar_Waits)	{
		AI_Output(self,other,"DIA_JaAfFar_CameBack_15_01");	//��� ����� �����, �� ��� ���� - ��������� �����.
		JaAfFar_Waits = FALSE;
	};
	AI_Output(self,other,"DIA_JaAfFar_CameBack_15_02");	//���� ���� �����.
	B_StartOtherRoutine(self,"START");
	self.aivar[AIV_NoFightParker] = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GoBack;
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_QuirkyThief_Success);
	//UNFINISHED ������� ���� � �������
};
//����� ---------------------
instance DIA_JaAfFar_WaitHere(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;						nr = 20;
	condition = DIA_JaAfFar_WaitHere_condition;	
	information = DIA_JaAfFar_WaitHere_info;
	description = "��� �����!";
	permanent = TRUE;
};
func int DIA_JaAfFar_WaitHere_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		&& ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)
		  || (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoBack))) {
		return TRUE;
	};
};
func void B_DSG_JaAfFar_Wait()
{
	B_StartOtherRoutine(self,"WAIT");
	B_SetWaitWP(self, WP_JaAfFar_Wait);
	JaAfFar_Waits = TRUE;
};
func void DIA_JaAfFar_WaitHere_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_WaitHere_15_01");	//��� �����!
		AI_Output(self,other,"DIA_JaAfFar_WaitHere_18_02");	//��� ����� ���� ����.
	AI_StopProcessInfos(self);
	B_DSG_JaAfFar_Wait();
};
//���� ������ ---------------------
instance DIA_JaAfFar_TooClose(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;						nr = 21;
	condition = DIA_JaAfFar_TooClose_condition;	
	information = DIA_JaAfFar_TooClose_info;
	important = TRUE;
	permanent = TRUE;
};
func int C_DSG_JaAfFarTooClose()
{
	//UNFINISHED ������� ������ � ������ �������
	if (Npc_GetDistToWP(self,"DP_VILL_VILLAGE_01") < 5000)	{
		return FALSE;
	};
	if (Npc_GetDistToWP(self,"DP_VILL_VILLAGE_02") < 5000)	{
		return FALSE;
	};
	//UNFINISHED ������� ������ � �������
	if (Npc_GetDistToWP(self,"") < 5000)	{
		return FALSE;
	};
	return FALSE;
};
func int DIA_JaAfFar_TooClose_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)
		  || (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoBack))
		 && C_DSG_JaAfFarTooClose())	{
		return TRUE;
	};
};
func void DIA_JaAfFar_TooClose_info()
{	
		AI_Output(self,other,"DIA_JaAfFar_TooClose_18_01");	//����� ���� �� ����! ���� ���� � ������� ��������.
	AI_StopProcessInfos(self);
	B_DSG_JaAfFar_Wait();
};

//��������� ---------------------
instance DIA_JaAfFar_LetsGoFurther(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;						nr = 22;
	condition = DIA_JaAfFar_LetsGoFurther_condition;	
	information = DIA_JaAfFar_LetsGoFurther_info;
	description = "���� ������.";
	permanent = TRUE;
};
func int DIA_JaAfFar_LetsGoFurther_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		&& ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)
		  || (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoBack))
		&& JaAfFar_Waits) {
		return TRUE;
	};
};func void DIA_JaAfFar_LetsGoFurther_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_LetsGoFurther_15_01");	//���� ������.
		AI_Output(self,other,"DIA_JaAfFar_LetsGoFurther_18_02");	//��-��.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"FOLLOW");
	JaAfFar_Waits = FALSE;
};

//NS - 02/06/2016 ===========
// ������� � �����
//===========================
instance DIA_JaAfFar_JoinedTribe(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 40;
	condition = DIA_JaAfFar_JoinedTribe_condition;	
	information = DIA_JaAfFar_JoinedTribe_info;
	important = TRUE;
};
func int DIA_JaAfFar_JoinedTribe_condition()
{
	if (Joined_Gobbos_Tribe && Npc_IsInState(self,ZS_Talk)) {
		return TRUE;
	};
};
func void DIA_JaAfFar_JoinedTribe_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_JoinedTribe_18_01");	//����� ��������� �������? ��� �� ������, ��� ����� ��������.
		AI_Output(other,self,"DIA_JaAfFar_JoinedTribe_15_02");	//� �� ���� ����-������ � ����� ����� �������?
	AI_Output(self,other,"DIA_JaAfFar_JoinedTribe_18_03");	//��-��. ����� ���������� � ������ �����, ���������� ������. ��� ��� ���������, � �� ��������� ������� ������.
	//�������� +1
	B_RaiseAttribute(other,ATR_DEXTERITY,1);
};

//NS - 02/06/2016 ===========
// ��������
//===========================
instance DIA_JaAfFar_PreTeach(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 50;
	condition = DIA_JaAfFar_PreTeach_condition;	
	information = DIA_JaAfFar_PreTeach_info;
	description = "�� ������ ���� ����-������ �������?";
};
func int DIA_JaAfFar_PreTeach_condition()
{
	if (MIS_DS2P_QuirkyThief == LOG_SUCCESS) {
		return TRUE;
	};
};
func void DIA_JaAfFar_PreTeach_info()
{	
		AI_Output(other,self,"DIA_JaAfFar_PreTeach_15_01");	//�� ������ ���� ����-������ �������?
	AI_Output(self,other,"DIA_JaAfFar_PreTeach_18_02");	//��-��. ��� ������ ������� ����� ��������� ����, ���� ��������� � ���� �����.
	TEACH_JaAfFar = TRUE;
	B_DSG_Log_OpenClose(TOPIC_GobboTeacher,LOG_NOTE,-1,"���-��-��� ������ ���� ��������, �������� � ������� ��� ��������.");
};

//�������� � B_DSG_JaAfFar_Teach_Dex_Theft.d
