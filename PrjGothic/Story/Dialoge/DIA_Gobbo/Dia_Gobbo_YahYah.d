instance DIA_YahYah_EXIT(C_Info)
{
	npc = Gobbo_DS2P_YahYah;
	nr = 999;
	permanent = TRUE;
	condition = DIA_YahYah_EXIT_condition;	
	information = DIA_YahYah_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_YahYah_EXIT_condition(){	return TRUE;};
func void DIA_YahYah_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// ���������� 
//===========================
//������������ ��� ��� ������ �������
instance DIA_YahYah_Hello(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 1;
	condition = DIA_YahYah_Hello_condition;	
	information = DIA_YahYah_Hello_info;
	important = TRUE;
};
func int DIA_YahYah_Hello_condition(){	return TRUE;};
func void DIA_YahYah_Hello_info()
{	
		AI_Output(self,other,"DIA_YahYah_Hello_18_01");	//(���������) ����! ���-���-����!
	AI_Output(other,self,"DIA_YahYah_Hello_15_02");	//��, � �� ������� ���� �����. ����� �����.
		AI_Output(self,other,"DIA_YahYah_Hello_18_03");	//�����! �����, �����. ���� ��� ����� � ��� �������.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_Start);
};
//----------------------------------
instance DIA_YahYah_WowTalkingGobbo(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 2;
	condition = DIA_YahYah_WowTalkingGobbo_condition;	
	information = DIA_YahYah_WowTalkingGobbo_info;
	description = "�� ��! ��������� ������!";
};
func int DIA_YahYah_WowTalkingGobbo_condition(){	return TRUE;};
func void DIA_YahYah_WowTalkingGobbo_info()
{	
	AI_Output(other,self,"DIA_YahYah_WowTalkingGobbo_15_01");	//�� ��! ��������� ������!
		AI_Output(self,other,"DIA_YahYah_WowTalkingGobbo_18_02");	//�� ��! ��������� �������!
};
//----------------------------------
instance DIA_YahYah_WhoAU(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 3;
	condition = DIA_YahYah_WhoAU_condition;	
	information = DIA_YahYah_WhoAU_info;
	description = "��� ��?";
};
func int DIA_YahYah_WhoAU_condition(){	return TRUE;};
func void DIA_YahYah_WhoAU_info()
{	
	AI_Output(other,self,"DIA_YahYah_WhoAU_15_01");	//��� ��?
		AI_Output(self,other,"DIA_YahYah_WhoAU_18_02");	//��-�� - ��������. �������� �������.
};
//----------------------------------
instance DIA_YahYah_HumanSpeech(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 4;
	condition = DIA_YahYah_HumanSpeech_condition;	
	information = DIA_YahYah_HumanSpeech_info;
	description = "������ �� ������ ��� ����?";
};
func int DIA_YahYah_HumanSpeech_condition(){	return TRUE;};
func void DIA_YahYah_HumanSpeech_info()
{	
	AI_Output(other,self,"DIA_YahYah_HumanSpeech_15_01");	//������ �� ������ ��� ����?
		AI_Output(self,other,"DIA_YahYah_HumanSpeech_18_02");	//��-�� ����� �����. ��-�� ������� ��-��-��.
	AI_Output(other,self,"DIA_YahYah_HumanSpeech_15_03");	//� ��-��-�� ���?..
		AI_Output(self,other,"DIA_YahYah_HumanSpeech_18_04");	//��-��-�� ���� ������� �����.
};


//NS - 10/03/2016 ===========
// ���� � ������� 
//===========================
//----------------------------------
instance DIA_YahYah_FromBaBaPo(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 11;
	condition = DIA_YahYah_FromBaBaPo_condition;	
	information = DIA_YahYah_FromBaBaPo_info;
	description = "� ������ �� ��-��-��.";
};
func int DIA_YahYah_FromBaBaPo_condition()
{
	if ((Gobbos_Attitude == Gobbos_Attitude_None)
		&& (MIS_DS2P_FigurinesGurun == LOG_SUCCESS))	{
		return TRUE;
	};
};
func void DIA_YahYah_FromBaBaPo_info()
{	
	AI_Output(other,self,"DIA_YahYah_FromBaBaPo_15_01");	//� ������ �� ��-��-��. �� ������, ��� �� ���� ����������.
		AI_Output(self,other,"DIA_YahYah_FromBaBaPo_18_02");	//��-��-�� ������� �������. ��-�� ���������� �����. � ������� ��������� ��-��-����, ��� �����. ����� �������� � ���.
	Gobbos_Attitude = Gobbos_Attitude_Friendly;
	self.aivar[AIV_PASSGATE] = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_EnterGobboVillage_Success2);
	B_GivePlayerXP(XP_MIS_EnterGobboVillage_Gurun);
};
//----------------------------------
instance DIA_YahYah_LetMeIn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 12;
	condition = DIA_YahYah_LetMeIn_condition;	
	information = DIA_YahYah_LetMeIn_info;
	description = "� ���� ������.";
	permanent = TRUE;
};
func int DIA_YahYah_LetMeIn_condition()
{
	if (Gobbos_Attitude == Gobbos_Attitude_None)	{
		return TRUE;
	};
};
func void DIA_YahYah_LetMeIn_info()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_15_01");	//� ���� ������.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_18_02");	//������ �����. ����� �������.
	Info_ClearChoices(DIA_YahYah_LetMeIn);
	Info_AddChoice(DIA_YahYah_LetMeIn,"��� � ������ �������, ����� �� ���� ���������?",DIA_YahYah_LetMeIn_What);
	Info_AddChoice(DIA_YahYah_LetMeIn,"� ���� ���� ���� ��� ��� ��������.",DIA_YahYah_LetMeIn_Necklace);
	Info_AddChoice(DIA_YahYah_LetMeIn,"����� ���: �� ���� �� �����, ���� ��� �� ����.",DIA_YahYah_LetMeIn_NoSee);
	Info_AddChoice(DIA_YahYah_LetMeIn,"�, ������, ����� �������� ����!",DIA_YahYah_LetMeIn_Female);
	Info_AddChoice(DIA_YahYah_LetMeIn,"��� ���� ��� �������. �������� ����.",DIA_YahYah_LetMeIn_100Gold);
};
func void DIA_YahYah_LetMeIn_100Gold()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_100Gold_15_01");	//��� ���� ��� �������. �������� ����.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_100Gold_18_02");	//����� �������. ��-�� �� ����� ������.
};
func void DIA_YahYah_LetMeIn_Female()
{	
	AI_PointAt(other,WP_GobboEntrance_Checkpoint);
	AI_Output(other,self,"DIA_YahYah_LetMeIn_Female_15_01");	//�, ������, ����� �������� ����!
		AI_Output(self,other,"DIA_YahYah_LetMeIn_Female_18_02");	//��-�� ���� ����.
	AI_StopPointAt(other);
};
func void DIA_YahYah_LetMeIn_NoSee()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_NoSee_15_01");	//����� ���: �� ���� �� �����, ���� ��� �� ����.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_NoSee_18_02");	//����� ����. ����� �������.
};
func void DIA_YahYah_LetMeIn_Necklace()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_Necklace_15_01");	//� ���� ���� ���� ��� ��� ��������. ��� ������� �� ������ �������. ������ ��������� ����, ����� �������� �� ������� � ����� �������.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_Necklace_18_02");	//���. ��-�� ������� �������, ������ �������. ��-�� �� ���� ��������, ���� �����. ����� �������.
	AI_Output(other,self,"DIA_YahYah_LetMeIn_Necklace_15_03");	//(��� ����) ��� �������������.
};
func void DIA_YahYah_LetMeIn_What()
{	
	AI_Output(other,self,"DIA_YahYah_LetMeIn_What_15_01");	//��� � ������ �������, ����� �� ���� ���������?
		AI_Output(self,other,"DIA_YahYah_LetMeIn_What_18_02");	//������. ����� �������.
	AI_Output(other,self,"DIA_YahYah_LetMeIn_15_What_03");	// �� �����, �� ����� ������ ����, ��� ��� ����� ����� ������.
		AI_Output(self,other,"DIA_YahYah_LetMeIn_What_18_04");	//�����, ����� ����. ���� ����� ������. ���� ������� ��������� �������� ����. ����� ����. 
		AI_Output(self,other,"DIA_YahYah_LetMeIn_What_18_05");	//����� ����� ��� ����, ��������� ��-�� �� ����, � ��-�� ���������� �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_SharkTeeth);
	Info_ClearChoices(DIA_YahYah_LetMeIn);
	MIS_DS2P_EnterGobboVillage_SharkTeeth = TRUE;
	//������� ����
	Wld_InsertNpc(Swampshark,WP_GobboEntrance_Shark1);
	Wld_InsertNpc(Swampshark,WP_GobboEntrance_Shark1);
	Wld_InsertNpc(Swampshark,WP_GobboEntrance_Shark1);
};
//����� ����� ------------------------------
instance DIA_YahYah_SharksKilled(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 13;
	condition = DIA_YahYah_SharksKilled_condition;	
	information = DIA_YahYah_SharksKilled_info;
	description = "���, � ������ �����.";
};
func int DIA_YahYah_SharksKilled_condition()
{
	if ((MIS_DS2P_EnterGobboVillage == LOG_Running) && MIS_DS2P_EnterGobboVillage_SharkTeeth
		 && (Npc_HasItems(other,ItAt_SharkTeeth) >= 3))
	{
		return TRUE;
	};
};
func void DIA_YahYah_SharksKilled_info()
{	
	AI_Output(other,self,"DIA_YahYah_SharksKilled_15_01");	//���, � ������ �����.
	//���� �����
	B_DS_GiveRemoveItems(other,self, ItAt_SharkTeeth, 3);
	AI_Output(other,self,"DIA_YahYah_SharksKilled_15_02");	//������ �� ���� ����������?
		AI_Output(self,other,"DIA_YahYah_SharksKilled_18_03");	//��, ������ ��-�� ���������� �����. ����� ��������, ��� ���� ������. ����� ���������, �������� � ��-��-����, ��� �����.
	Gobbos_Attitude = Gobbos_Attitude_Friendly;
	self.aivar[AIV_PASSGATE] = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_EnterGobboVillage_Success);
	B_GivePlayerXP(XP_MIS_EnterGobboVillage);
};

//NS - 11/03/2016 ===========
// ���� �������� 
//===========================
//������ �������������� ------------------------------
instance DIA_YahYah_FirstWarn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 20;
	condition = DIA_YahYah_FirstWarn_condition;	
	information = DIA_YahYah_FirstWarn_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_FirstWarn_condition()
{
	if ((Gobbos_Attitude == Gobbos_Attitude_None)
		 && (self.aivar[AIV_Guardpassage_Status] == GP_NONE)
		 && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};
func void DIA_YahYah_FirstWarn_info()
{	
		AI_Output(self,other,"DIA_YahYah_FirstWarn_18_01");	//���, ������ ������, �����.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};
//������ �������������� ------------------------------
instance DIA_YahYah_SecondWarn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 21;
	condition = DIA_YahYah_SecondWarn_condition;	
	information = DIA_YahYah_SecondWarn_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_SecondWarn_condition()
{
	if ((Gobbos_Attitude == Gobbos_Attitude_None)
		 && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
		 && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		 && (Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};
func void DIA_YahYah_SecondWarn_info()
{	
		AI_Output(self,other,"DIA_YahYah_SecondWarn_18_01");	//�����, ��� ���, � ��-�� �������.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
};
//��� ����������  ------------------------------
instance DIA_YahYah_Attack(C_Info)
{
	npc = Gobbo_DS2P_YahYah;					nr = 22;
	condition = DIA_YahYah_Attack_condition;	
	information = DIA_YahYah_Attack_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_Attack_condition()
{
	if ((Gobbos_Attitude == Gobbos_Attitude_None)
		 && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
		 && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		 && (Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};
func void DIA_YahYah_Attack_info()
{	
		AI_Output(self,other,"DIA_YahYah_Attack_18_01");	//����-��-��!
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	//������ ��������, ����������� ���������� � ��� ��������� �������.
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	B_Attack(Gobbo_withYahYah_1,other,AR_GuardStopsIntruder,1);
	B_Attack(Gobbo_withYahYah_2,other,AR_GuardStopsIntruder,1);
	Gobbos_Attitude = Gobbos_Attitude_Hostile;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage, LOG_MISSION, LOG_FAILED, TOPIC_DS2P_EnterGobboVillage_Fail);
};
