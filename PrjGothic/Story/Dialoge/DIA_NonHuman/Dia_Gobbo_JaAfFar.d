instance DIA_JaAfFar_EXIT(DIA_Proto_End)
{
	npc = Gobbo_DS2P_JaAfFar;
};

//////////////////////////// ����� /////////////////////////////

//===================================================
//(���������)
//���������� ���
instance DIA_JaAfFar_Hello(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_JaAfFar_Hello_Info;
	important = TRUE;
};
func void DIA_JaAfFar_Hello_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_Hello_19_01");	//�����? ������ ��������� ������ ����� � �������. ������. ���-��-��� ��-��-����!
};


//===================================================
//����������
instance DIA_JaAfFar_HowAU(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 2;
	condition = DIA_JaAfFar_HowAU_Cond;
	information = DIA_JaAfFar_HowAU_Info;
	description = "��� ����?";
	permanent = TRUE;
	important = TRUE;
};
//���������: ��� ������ ��� ���?�
func int DIA_JaAfFar_HowAU_Cond()
{
	if (Npc_KnowsInfo(other, DIA_JaAfFar_WhoAU))	{
		return TRUE;
	};
};
func void DIA_JaAfFar_HowAU_Info()
{
		AI_Output(other,self,"DIA_JaAfFar_HowAU_15_01");	//��� ����?
	AI_Output(self,other,"DIA_JaAfFar_HowAU_19_02");	//���� ���!
};

//===================================================
//(�� ������� � �����)
//���������� ���
instance DIA_JaAfFar_BecameGobbo(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 3;
	condition = DIA_JaAfFar_BecameGobbo_Cond;
	information = DIA_JaAfFar_BecameGobbo_Info;
	important = TRUE;
};
//���������: �� ������� � ����� � ��� ������ ��� ���?�
func int DIA_JaAfFar_BecameGobbo_Cond()
{
	if (Gobbos_Attitude == Gobbos_Attitude_Gobbo)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_BecameGobbo_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_BecameGobbo_19_00");	//����� ��������� �������? �� ����� ���, ��� ���� ���� ����.
		AI_Output(other,self,"DIA_JaAfFar_BecameGobbo_15_01");	//� �� ���� ����-������ � ����� ����� �������?
	AI_Output(self,other,"DIA_JaAfFar_BecameGobbo_19_02");	//��-��. ����� �������� � ������ �����, ����� ������. ��� ��� ��������, � �� ����� ���� ������.
	//�������� +1
	B_RaiseAttribute(other, ATR_DEXTERITY, 1);
};

//===================================================
instance DIA_JaAfFar_WhoAU(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 4;
	condition = DIA_NoCond_cond;
	information = DIA_JaAfFar_WhoAU_Info;
	description = "�� ���?";
};
func void DIA_JaAfFar_WhoAU_Info()
{
		AI_Output(other,self,"DIA_JaAfFar_WhoAU_15_01");	//�� ���?
	AI_Output(self,other,"DIA_JaAfFar_WhoAU_19_02");	//��� ����� ���-��-���, ����� ��� �������. ��� ���� �������� ��� ������.
	//����� �������� (������ ����):
	Info_ClearChoices(DIA_JaAfFar_WhoAU);
	Info_AddChoice(DIA_JaAfFar_WhoAU, "�������.", DIA_JaAfFar_WhoAU_ISee);
	//(���� ���� ���� �� 20 ������� ��� �����-�� ������� ����)
	if (C_CanStealWealth_FromHero(other)) {
		Info_AddChoice(DIA_JaAfFar_WhoAU, "����� �� ������?", DIA_JaAfFar_ReallyBest);
	};
};

//�������.
func void DIA_JaAfFar_WhoAU_ISee() {
	Info_ClearChoices(DIA_JaAfFar_WhoAU);
	AI_Output(other,self,"DIA_JaAfFar_WhoAU_Isee_15_01");	//�������.
};

//////////////////////////// �����: ����� ��� //////////////////////////// 

var int DIA_JaAfFar_ReallyBest_Once;
instance DIA_JaAfFar_ReallyBest(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 10;
	condition = DIA_NoCond_cond;
	information = DIA_JaAfFar_ReallyBest_Info;
	description = "����� �� ������?";
};
//���������: ���� ��-�� �������� ������ �� ������� ������ ������� � �������, �� ����� �������� �����
//����, ��� ������� � ��� �� �����
func int DIA_JaAfFar_ReallyBest_Cond()
{
	if (C_CanStealWealth_FromHero(other) && !DIA_JaAfFar_ReallyBest_Once) {
		return TRUE;
	};
};
func void DIA_JaAfFar_ReallyBest_Info()
{
	Info_ClearChoices(DIA_JaAfFar_WhoAU);
	DIA_JaAfFar_ReallyBest_Once = TRUE;
		AI_Output(other,self,"DIA_JaAfFar_What_15_01");	//����� �� ������?
	AI_Output(self,other,"DIA_JaAfFar_What_19_02");	//��-��.
	//�������������� � �������, ���������� �����
	AI_TurnRight(self);
	AI_Output(self,other,"DIA_JaAfFar_What_19_03");	//�-�-��! �����, ������ ����� ����!
	//�������������� ���� ��
	AI_TurnLeft(self);
		AI_Output(other,self,"DIA_JaAfFar_What_15_04");	//��� ���?
	//���-��-��� ������ ������ (�� ������ ��������) ��� ������� ������� �� ��������� ��
	B_TrySteal_FromHero(self, other);
	//�������������� �����
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_Output(self,other,"DIA_JaAfFar_What_19_05");	//����������.
	//������ � ��������. ����� ������ ���: ������
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Start);
	MIS_DS2P_QuirkyThief_Round = 1;
};

//===================================================
instance DIA_JaAfFar_BruteForce(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 11;
	condition = DIA_JaAfFar_BruteForce_Cond;
	information = DIA_JaAfFar_BruteForce_Info;
	description = "��, �����, ����� ��� ������! (����������)";
	permanent = TRUE;
};
//���������: ���-��-��� ����� ���-�� � ��
func int DIA_JaAfFar_BruteForce_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round % 2 == 1)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_BruteForce_Info()
{
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_01");	//��, �����, ����� ��� ������!
	AI_Output(self,other,"DIA_JaAfFar_BruteForce_19_02");	//����? ���-��-��� �� �������� �����. ����� �������� �������. �����-��-��-��-��!
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_03");	//��������� �������! �� �����������, ��� �� ��������� ����!
	AI_Output(self,other,"DIA_JaAfFar_BruteForce_19_04");	//(���������) ��-��, ��� �� ���������, ��� �������� �����.
	//�� ������� ������
	AI_DrawWeapon(other);
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_05");	//�� ���, ��������� ��������. ���� � �� ����� ���� ������, �� ���� ������ ����� ������, ������.
	AI_Output(self,other,"DIA_JaAfFar_BruteForce_19_06");	//�-�-��! ����, ������, ����� ������ ������! �� ���� ���-��-���.
	//���� 80% �� �����������, ���� �������
	if (StolenItem == ItMi_Gold) {
		var int firstPortion; firstPortion = StolenGoldAmount / 10 * 8;
		B_GiveInvItems(self, other, ItMi_Gold, firstPortion);
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_07");	//��, ��� �� ���.
		//���� ����������
		B_GiveInvItems(self, other, ItMi_Gold, StolenGoldAmount - firstPortion);
			AI_Output(self,other,"DIA_JaAfFar_BruteForce_19_08");	//���, ��� ���. � ���-��-��� ���� ������.
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_09");	//���-��.
	}
	else {
		B_GiveInvItems(self, other, StolenItem, 1);
	};
	//�� ������� ������
	AI_RemoveWeapon(other);
	//������ � ��������. ����� ������ ���: ������ ����
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Failed,TOPIC_DS2P_QuirkyThief_BruteForce);
	StolenItem = 0;
	StolenGoldAmount = 0;
	MIS_DS2P_QuirkyThief_Round = -1000;
	//�������� ����������
	AI_StopProcessInfos(self);
};

//*===================================================
instance DIA_JaAfFar_Revenge1(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 12;
	condition = DIA_JaAfFar_Revenge1_Cond;
	information = DIA_JaAfFar_Revenge1_Info;
	description = "(�������)";
	permanent = TRUE;
};
//���������: ���-��-��� ����� ������ ���
func int DIA_JaAfFar_Revenge1_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 1)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Revenge1_Info()
{
	//�������: ���� ����� ��������� ����� � �������� >= 30
	if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_NONE) {
		AI_PrintS_Ext(other, "� �� ���� ������!", COL_Red);
		return;
	};
	if (other.attribute[ATR_DEXTERITY] < 30) {
		AI_PrintS_Ext(other, "������������ ��������", COL_Red);
		return;
	};
	AI_Output(other,self,"DIA_JaAfFar_Revenge1_15_01");	//������, � ��� ��� �� ����� �����, �������� ������� ���� ��������? 
	//�� ��������� ����� � �������, �� ����� ����������
	AI_PointAt(other, "DP_FOREST_SWAMPTEMPLE_ROOM05_02_CAMPFIRE");
	AI_Output(other,self,"DIA_JaAfFar_Revenge1_15_02");	//� ����� ������ �� �����.
	AI_Output(self,other,"XXX");	//
	AI_TurnToWP(self, "DP_FOREST_SWAMPTEMPLE_ROOM05_02_CAMPFIRE");
	AI_StopPointAt(other);
		AI_Output(self,other,"DIA_JaAfFar_Revenge1_19_03");	//��� ������ �����. ���� ���� ������.
	AI_TurnToNpc(self, other);
	AI_Output(other,self,"DIA_JaAfFar_Revenge1_15_04");	//�, ���������, �� ����� ����� - ������ ������.
	//�� �������� ���� ������ +10 �����
	if (StolenItem == ItMi_Gold) {
		StolenGoldAmount += 10;
		B_GiveInvItems(self, other, ItMi_Gold, StolenGoldAmount);
	}
	else {
		B_GiveInvItems(self, other, StolenItem, 1);
		B_GiveInvItems(self, other, ItMi_Gold, 10);
		StolenGoldAmount = 10;
	};
	//������ � ��������. ����� ������ ���: ������ 1
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Revenge1);
	//�������� ����������
	AI_StopProcessInfos(self);
	MIS_DS2P_QuirkyThief_Round = 2;
};

//===================================================
//���������� ���
instance DIA_JaAfFar_Round2(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 13;
	condition = DIA_JaAfFar_Round2_Cond;
	information = DIA_JaAfFar_Round2_Info;
	description = "*(����� 2)";
	important = TRUE;
};
//���������: �� ���� ������ 1 ���
func int DIA_JaAfFar_Round2_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 2)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Round2_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_Round2_19_01");	//����, �����. ��� � ���� ���� �������.
		AI_Output(other,self,"DIA_JaAfFar_Round2_15_02");	//�������.
	AI_Output(self,other,"DIA_JaAfFar_Round2_19_03");	//�����, ������ ������. ��� ���� ������: ���� ������ ����� �� ������ ����?
		AI_Output(other,self,"DIA_JaAfFar_Round2_15_04");	//���� �� ������ �����, ����� ������ �������? �������. �� ����� �����. �� ����� ����...
	//���-��-��� ������ ��� ������ ������
	B_TrySteal_FromHero(self, other);
	AI_Output(self,other,"DIA_JaAfFar_Round2_19_05");	//�������, �����. ��� ������ ���, ��� �������.
	//������ � ��������. ����� ������ ���: ����� 2
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Round2);
	MIS_DS2P_QuirkyThief_Round = 3;
};

//===================================================
instance DIA_JaAfFar_Revenge2(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 14;
	condition = DIA_JaAfFar_Revenge2_Cond;
	information = DIA_JaAfFar_Revenge2_Info;
	description = "(������� ��� ���)";
	permanent = TRUE;
};
//���������: ���-��-��� ����� ������ ���
func int DIA_JaAfFar_Revenge2_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 3)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Revenge2_Info()
{
	//�������: ���� ����� ��������� ����� � �������� >= 50
	if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_NONE) {
		AI_PrintS_Ext(other, "� �� ���� ������!", COL_Red);
		return;
	};
	if (other.attribute[ATR_DEXTERITY] < 50) {
		AI_PrintS_Ext(other, "������������ ��������", COL_Red);
		return;
	};
		AI_Output(other,self,"DIA_JaAfFar_Revenge2_15_01");	//� ������ � �� ���� � ��� � ������� ������?
	AI_Output(self,other,"DIA_JaAfFar_Revenge2_19_02");	//(�����������) � ������� ��� ����� ����� - ��������.
		AI_Output(other,self,"DIA_JaAfFar_Revenge2_15_03");	//� ���� � ���� ������-��������.
	AI_Output(self,other,"DIA_JaAfFar_Revenge2_19_04");	//������ ��� ���� ������� ������ ������ �����.
	//�� ������ ���� +15 �������
	if (StolenItem == ItMi_Gold) {
		StolenGoldAmount += 15;
		B_GiveInvItems(self, other, ItMi_Gold, StolenGoldAmount);
	}
	else {
		B_GiveInvItems(self, other, StolenItem, 1);
		B_GiveInvItems(self, other, ItMi_Gold, 25);
		StolenGoldAmount = 25;
	};
		AI_Output(other,self,"DIA_JaAfFar_Revenge2_15_05");	//����.
	//������ � ��������. ����� ������ ���: ������ 2
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Revenge2);
	MIS_DS2P_QuirkyThief_Round = 4;
};


//===================================================
//���������� ���
instance DIA_JaAfFar_Round3(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 15;
	condition = DIA_JaAfFar_Round3_Cond;
	information = DIA_JaAfFar_Round3_Info;
	description = "*(����� 3)";
	important = TRUE;
};
//���������: �� ���� ������ ������ ���
func int DIA_JaAfFar_Round3_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 4)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Round3_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_Round3_19_01");	//�����, ����� ����. ���-��-��� ������� ���������� ����� �����.
		AI_Output(other,self,"DIA_JaAfFar_Round3_15_02");	//����� ��� �����?
	AI_Output(self,other,"DIA_JaAfFar_Round3_19_03");	//������ �����. ������ ������. ��� ��� ���� �� ���������. ����� ���� �����, ����� ���������.
		AI_Output(other,self,"DIA_JaAfFar_Round3_15_04");	//������-�� ��, ������, ������� ��� ��� �����.
	//��������, ��� ����� ����
	AI_Output(self,other,"XXX");	//
	AI_PlayAni(self, "T_PERCEPTION");
	//������ ��� ������ ������
	B_TrySteal_FromHero(self, other);
	AI_Output(self,other,"DIA_JaAfFar_Round3_19_05");	//(����) ��-��! ��� �������� ����� ����. ����� ������� ������.
	//������ � ��������. ����� ������ ���: ����� 3
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Round3);
	//�������� ����������
	AI_StopProcessInfos(self);
	MIS_DS2P_QuirkyThief_Round = 5;
};


//===================================================
instance DIA_JaAfFar_Revenge3(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 16;
	condition = DIA_JaAfFar_Revenge3_Cond;
	information = DIA_JaAfFar_Revenge3_Info;
	description = "(����� �������)";
	permanent = TRUE;
};
//���������: ���-��-��� ����� ������ ���
func int DIA_JaAfFar_Revenge3_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 5)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Revenge3_Info()
{
	//�������: ���� ����� ��������� ����� � �������� >= 70
	if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_NONE) {
		AI_PrintS_Ext(other, "� �� ���� ������!", COL_Red);
		return;
	};
	if (other.attribute[ATR_DEXTERITY] < 70) {
		AI_PrintS_Ext(other, "������������ ��������", COL_Red);
		return;
	};
	AI_Output(other,self,"DIA_JaAfFar_Revenge3_15_01");	//������, � ���� ������ �� �����? � ���� ���� ���� ��������!
	AI_Output(other,self,"DIA_JaAfFar_Revenge3_15_02");	//�� �� �����, ��� �� �������� �� ������! �� �� ������ �� ���� ������� �� ������.
	AI_Output(self,other,"DIA_JaAfFar_Revenge3_19_03");	//�����. ���-��-��� �� ����� �������.
	//�� ������ ���� ������ + 20 �������
	//������ � ��������. ����� ������ ���: ������ 3
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Revenge3);
	MIS_DS2P_QuirkyThief_Round = 6;
};


//===================================================
//���������� ���
instance DIA_JaAfFar_TheftFinal(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 17;
	condition = DIA_JaAfFar_TheftFinal_Cond;
	information = DIA_JaAfFar_TheftFinal_Info;
	description = "*(����, �����!)";
	important = TRUE;
};
//���������: �� ���� ������ � 3 ���
func int DIA_JaAfFar_TheftFinal_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 6)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_TheftFinal_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_01");	//����, �����.
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_15_02");	//� ���� ��� �� ������� �������� ���� ���������, �?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_03");	//�����-�����. ��� ������� �������� � �����.
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_04");	//��� ������ �������, ��� ����� ������ ������ ����, ���� ���� ���-��-���.
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_05");	//����� ���� ������ ���?
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_15_06");	//������? � ���?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_07");	//��� ������� �������� ���� � ����� � ������� �� ������.
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_15_08");	//� �� ���� ��� ���������? ������ ��� �� ������ ������� ����� � �����?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_09");	//��� ����, �� ���� ������� ���� �����. ��� ���� ���� ������� � ��� ����� ������.
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_10");	//���� �������� ���� �����, ��� ���� ����. ��-�� ��?
	//����� �������� (������ ����):
	Info_ClearChoices(DIA_JaAfFar_TheftFinal);
	Info_AddChoice(DIA_JaAfFar_TheftFinal,"��� ��, � ���� ������ ��� �����.",DIA_JaAfFar_TheftFinal_No);
	//(���� �������� �������� ����)
	if (Npc_IsDead(PIR_223_DS2P_GuardMill)) {
		Info_AddChoice(DIA_JaAfFar_TheftFinal,"������ �� �������� ������ ���.",DIA_JaAfFar_NoGuard_Info);
	};
	Info_AddChoice(DIA_JaAfFar_TheftFinal,"������, � ������ ����.",DIA_JaAfFar_TheftFinal_Yes);
	MIS_DS2P_QuirkyThief_Round = -1;
};


//��� ��, � ���� ������ ��� �����.
func void DIA_JaAfFar_TheftFinal_No()
{
	AI_Output(other,self,"DIA_JaAfFar_TheftFinal_No_15_01");	//��� ��, � ���� ������ ��� �����.
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_No_19_02");	//������ ��������, �����. ������.
	//������ � ��������. ����� ������ ���: ���������� ������
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Refused);
};

//������, � ������ ����.
func void DIA_JaAfFar_TheftFinal_Yes()
{
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_Yes_15_01");	//������. � ������ ����. 
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_Yes_15_02");	//��� ���� ������ ������� ��������� ��������?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_Yes_19_03");	//��-��. ���� ���� �������� ���� �����.
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_Yes_15_04");	//������. ����� ���������?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_Yes_19_05");	//����. ������� ������ ������ ����. 
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_Yes_19_06");	//���� ��������� ���� � ��������, ��� ����� � ���� �� ����.
	//������ � ��������. ����� ������ ���: ����������� ������
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Agreed);
	//���-��-��� ����� �� ����� ����� �� ���������
	B_StartOtherRoutine(self, "MILL");
	MIS_DS2P_QuirkyThief_GuardMill = TRUE;
};

//===================================================
instance DIA_JaAfFar_NoGuard(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 18;
	condition = DIA_JaAfFar_NoGuard_Cond;
	information = DIA_JaAfFar_NoGuard_Info;
	description = "������ �� �������� ������ ���.";
};
//���������: ���-��-��� �������� ������, �������� �� �������� ����
//�������: �� ������� � �������, ����� ������ ��� �������
func int DIA_JaAfFar_NoGuard_Cond()
{
	if (MIS_DS2P_QuirkyThief == LOG_Running && MIS_DS2P_QuirkyThief_GuardMill && Npc_IsDead(PIR_223_DS2P_GuardMill))	{
		return TRUE;
	};
};
func void DIA_JaAfFar_NoGuard_Info()
{
	Info_ClearChoices(DIA_JaAfFar_TheftFinal);
	AI_Output(other,self,"DIA_JaAfFar_NoGuard_15_01");	//������ �� �������� ������ ���.
	AI_Output(self,other,"DIA_JaAfFar_NoGuard_19_02");	//����? ����� ������?
	AI_Output(other,self,"DIA_JaAfFar_NoGuard_15_03");	//��, ������ �������� �������� ����. 
	AI_Output(self,other,"DIA_JaAfFar_NoGuard_19_04");	//�������, �����!
	AI_Output(self,other,"DIA_JaAfFar_NoGuard_19_05");	//���-��-��� �������� ����� � ���� � �������� � �������. ������ �� ��� ������ ����!
	//������ � ��������. ����� ������ ���: ������ ���
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_NoGuard);
	//���-��-��� ������ �� ����� �� ����� ����� �� ���������
	B_StartOtherRoutine(self, "START");
	MIS_DS2P_QuirkyThief_GuardMill = FALSE;
};


//===================================================
//��� ������� ����������, ����������
instance DIA_JaAfFar_KeepSilence(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 19;
	condition = DIA_JaAfFar_KeepSilence_Cond;
	information = DIA_JaAfFar_KeepSilence_Info;
	description = "*(���� � ��������)";
	permanent = TRUE;
	important = TRUE;
};
//���������: ������������ � ����� ����
//�������: �����, ���� ���-��-��� ���� �� �������
func int DIA_JaAfFar_KeepSilence_Cond()
{
	if (MIS_DS2P_QuirkyThief == LOG_Running && MIS_DS2P_QuirkyThief_GuardMill && Wld_IsTime(22,0,8,0) && DIA_WhenAsked_cond())	
	{
		return TRUE;
	};
};
func void DIA_JaAfFar_KeepSilence_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_KeepSilence_19_01");	//�����, �����! ������� ������, � ��� ������� ����.
	//�������� �����������
	AI_StopProcessInfos(self);
};


//===================================================
//���������� ���
instance DIA_JaAfFar_MillSuccess(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 21;
	condition = DIA_JaAfFar_MillSuccess_Cond;
	information = DIA_JaAfFar_MillSuccess_Info;
	description = "*(������� ������ ����)";
	important = TRUE;
};
//���������: �������� ��������� ����� ��������
func int DIA_JaAfFar_MillSuccess_Cond()
{
	if (MIS_DS2P_QuirkyThief == LOG_Running && MIS_DS2P_QuirkyThief_GuardMill && MIS_DS2P_QuirkyThief_GuardMill_Down)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_MillSuccess_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_MillSuccess_19_01");	//����� ��������. ������� ��� ������.
	AI_Output(other,self,"DIA_JaAfFar_MillSuccess_15_02");	//������, � ���� ���������� ������� �����?
	AI_Output(self,other,"DIA_JaAfFar_MillSuccess_19_03");	//(��������) ��-��.
	AI_Output(self,other,"DIA_JaAfFar_MillSuccess_19_04");	//���-��-��� �������� ����� � ���� � �������� � �������. ������ �� ��� ������ ����!
	//������ � ��������. ����� ������ ���: ����������
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_QuirkyThief_Success);
	//���-��-��� ������ �� ����� �� ����� ����� �� ���������
	B_StartOtherRoutine(self, "START");
	MIS_DS2P_QuirkyThief_GuardMill = FALSE;
};


//////////////////////////// �������� ////////////////////////////
//���� �����, ������ ������, ������������ � ��������
//�������: �������� ����� ������ ���
const int DIA_JaAfFar_Teach_Dex_Max = 150;

//===================================================
instance DIA_JaAfFar_Preteach(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 50;
	condition = DIA_JaAfFar_Preteach_Cond;
	information = DIA_JaAfFar_Preteach_Info;
	description = "�� ������ ���� ����-������ �������?";
};
//���������: ������� ��������� ����� ������ ���
func int DIA_JaAfFar_Preteach_Cond()
{
	if (MIS_DS2P_QuirkyThief == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Preteach_Info()
{
	AI_Output(other,self,"DIA_JaAfFar_Preteach_15_01");	//�� ������ ���� ����-������ �������?
	AI_Output(self,other,"DIA_JaAfFar_Preteach_19_02");	//��-��. ��� ������ ������� ����� ��������� ����, ���� ���� ��������� � �����.
	//������ � �������� �������� � ������� ��������: ���-��-���
	B_LogNote(TOPIC_GobboVillage,TOPIC_GobboVillage_Teach_JaAfFar);
	Gobbo_DS2P_JaAfFar_Teach = TRUE;
};



//===================================================
//(����������)
instance DIA_JaAfFar_Teach(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 51;
	condition = DIA_JaAfFar_Teach_Cond;
	information = DIA_JaAfFar_Teach_Info;
	description = "����� ����.";
	permanent = TRUE;
};
//�������: ���-��-��� ���������� �����
func int DIA_JaAfFar_Teach_Cond()
{
	if (Gobbo_DS2P_JaAfFar_Teach)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Teach_Menu()
{
	Info_ClearChoices(DIA_JaAfFar_Teach);
	if (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) && Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) > 1 && Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK)
		&& other.aivar[REAL_DEXTERITY] < DIA_JaAfFar_Teach_Dex_Max) {
		AI_Output(self,other,"DIA_JaAfFar_Teach_19_02");	//���� ������ ����� ��� �� ����� ���-��-���. ���� ����� ����� ���!
		Gobbo_DS2P_JaAfFar_Teach = FALSE;
		return;
	};
	Info_AddChoice(DIA_JaAfFar_Teach,Dialog_Back,DIA_JaAfFar_Teach_Back);
	//(��� �� ������)
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) {
		Info_AddChoice(DIA_JaAfFar_Teach,
			b_Ds_buildString_TeachPayment_Talent(other,"����� ���� ��������.",NPC_TALENT_SNEAK,1,-1),
			DIA_JaAfFar_Teach_Sneak);
	};
	//(��� �� ������)
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) {
		Info_AddChoice(DIA_JaAfFar_Teach,
			b_Ds_buildString_TeachPayment_Talent(other,"����� ���� ����������� ��������� �����.",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_SECOND,-1),
			DIA_JaAfFar_Teach_PickPocket2);
	};
	//(��� �� ������)
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE) {
		Info_AddChoice(DIA_JaAfFar_Teach,
			b_Ds_buildString_TeachPayment_Talent(other,"����� ���� ��������� �����.",NPC_TALENT_PICKLOCK,1,-1),
			DIA_JaAfFar_Teach_Picklock);
	};
	//�� 150 = DIA_JaAfFar_Teach_Dex_Max
	Info_AddChoice(DIA_JaAfFar_Teach,"������ ��� ��������.",DIA_JaAfFar_Teach_Dex_Menu);
};
func void DIA_JaAfFar_Teach_Dex_Menu()
{
	Info_ClearChoices(DIA_JaAfFar_Teach);
	Info_AddChoice(DIA_JaAfFar_Teach,Dialog_Back,DIA_JaAfFar_Teach_Menu);
	Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,1,-1),DIA_JaAfFar_Teach_DEX_1);
	Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,5,-1),DIA_JaAfFar_Teach_DEX_5);
};
func void DIA_JaAfFar_Teach_Back()
{
	Info_ClearChoices(DIA_JaAfFar_Teach);
};
//----------------------
func void DIA_JaAfFar_Teach_Info()
{
	AI_Output(other,self,"DIA_JaAfFar_Teach_15_01");	//����� ����.
		AI_Output(self,other,"DIA_JaAfFar_Teach_19_03");	//���� �����?
	DIA_JaAfFar_Teach_Menu();
};
//----------------------
func void DIA_JaAfFar_Teach_NoGold()
{
	AI_Output(self,other,"DIA_JaAfFar_NoGold_19_00");	//����� ����� ���-��-��� ������ - ���-��-��� ��� �����.
};
func void DIA_JaAfFar_Teach_Attribute(var int attr, var int amount)
{
	var int x; x = b_ds_GetTeachAtrPaymentAmount(other,attr,amount);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachAttributePoints(self,other,attr,amount,DIA_JaAfFar_Teach_Dex_Max))
		{
			B_GiveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();			
		};
	};
	DIA_JaAfFar_Teach_Dex_Menu();
};
func void DIA_JaAfFar_Teach_DEX_1()
{
	DIA_JaAfFar_Teach_Attribute(ATR_DEXTERITY,1);
};
func void DIA_JaAfFar_Teach_DEX_5()
{
	DIA_JaAfFar_Teach_Attribute(ATR_DEXTERITY,5);
};
//----------------------
func void DIA_JaAfFar_Teach_Talent(var int talent, var int level)
{
	var int x;	x = b_ds_GetTeachPaymentAmount(other,talent,level);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachThiefTalent(self,other,talent,level))
		{
			B_GiveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		DIA_JaAfFar_Teach_NoGold();
	};
	DIA_JaAfFar_Teach_Menu();
};
func void DIA_JaAfFar_Teach_Sneak()
{
	DIA_JaAfFar_Teach_Talent(NPC_TALENT_SNEAK, 1);
};
func void DIA_JaAfFar_Teach_PickPocket2()
{
	DIA_JaAfFar_Teach_Talent(NPC_TALENT_PICKPOCKET, 2);
};
func void DIA_JaAfFar_Teach_Picklock()
{
	DIA_JaAfFar_Teach_Talent(NPC_TALENT_PICKLOCK, 1);
};

