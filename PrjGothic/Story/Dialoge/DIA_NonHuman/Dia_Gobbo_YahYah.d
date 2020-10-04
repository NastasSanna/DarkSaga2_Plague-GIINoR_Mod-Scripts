instance DIA_YahYah_EXIT(DIA_Proto_End)
{
	npc = Gobbo_DS2P_YahYah;
};


//////////////////////////// ����� /////////////////////////////
// *��� ������ �������
// ���������� ���
var int YahYah_LastDistToWP;
instance DIA_YahYah_Hello(C_Info)
{
	npc = Gobbo_DS2P_YahYah;
	condition = DIA_YahYah_Hello_Cond;
	information = DIA_YahYah_Hello_Info;
	important = TRUE;
};
// �������: ���� ��-��-�� ��� �� �������� � �������
func int DIA_YahYah_Hello_Cond()
{
	if (MIS_DS2P_FigurinesGurun != LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_YahYah_Hello_Info()
{
	AI_Output(self,other,"DIA_YahYah_Hello_19_01");	//����! ���-���-����!
	// ��������� �����
	AI_PlayAni(self, "T_WARN");
		AI_Output(other,self,"DIA_YahYah_Hello_15_02");	//��, � �� ������� ���� �����. ����� �����.
	// �������� ����� UNFINISHED
	//AI_PlayAni(self, "T_LOOK");
	AI_Output(self,other,"DIA_YahYah_Hello_19_03");	//�����! �����, �����. �������� ��� ����� � ���� �������.
	// ������ � ��������. ����� ������� � ������� ��������: ������
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_Start);
	YahYah_LastDistToWP = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
};


// ������ ��������, ��� � �����
func void DIA_YahYah_AccessGranted_GoToChief()
{
	// ���� � ������� �������� ��������
	B_DS2P_GobboVillage_GrantAccess();
	AI_Output(self,other,"DIA_YahYah_AccessGranted_GoToChief_19_01");	//������ ��-�� �������� �����. ����� ���� �������, ������ � ��-��-����, ��� �����.
	AI_Output(self,other,"DIA_YahYah_AccessGranted_GoToChief_19_02");	//����� ������ � ����� �������, ����� ���-��-���� ��-��-��, ��-��.
	// ������ � �������� �������� ��������: ��������� � �����
	B_LogNote(TOPIC_GobboVillage, TOPIC_GobboVillage_HelloChief);
};


// *����� �� ��-��-��
// ���������� ���
instance DIA_YahYah_BaBaPoReturned(C_Info)
{
	npc = Gobbo_DS2P_YahYah;
	condition = DIA_YahYah_BaBaPoReturned_Cond;
	information = DIA_YahYah_BaBaPoReturned_Info;
	description = "*����� �� ��-��-��";
	important = TRUE;
};
// �������: ���� ��-��-�� ��� �������� � �������
func int DIA_YahYah_BaBaPoReturned_Cond()
{
	if (MIS_DS2P_FigurinesGurun == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_YahYah_BaBaPoReturned_Info()
{
	AI_Output(self,other,"DIA_YahYah_What_19_01");	//��-��! ������, �������!
	AI_Output(self,other,"DIA_YahYah_What_19_02");	//��-��-�� ������ ������� ��� ���� � ���� �������.
	
	if (Gobbos_Attitude == Gobbos_Attitude_None) {
		AI_Output(self,other,"DIA_YahYah_What_19_03");	//��-��-�� ������� ������� � ����� �������. ������� ����� ���� ��� �������.
		//������ � ��������. ����� ������� � ������� ��������: �� ���������
		B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_Figurines);
		// ���� � ������� �������� ��������, ��� � �����
		DIA_YahYah_AccessGranted_GoToChief();
	};
};


// �� ��! ��������� ������!
instance DIA_YahYah_WowSpeakingGobbo(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 1;
	condition = DIA_YahYah_WowSpeakingGobbo_Cond;
	information = DIA_YahYah_WowSpeakingGobbo_Info;
	description = "�� ��! ��������� ������!";
};
// ���������: ����� ����������
// ���������: ����� ���������� ������ ������� � �������� ��� ���������� ������
func int DIA_YahYah_WowSpeakingGobbo_Cond()
{
	if (MIS_DS2P_EnterGobboVillage != LOG_SUCCESS && MIS_DS2P_FigurinesGurun != LOG_SUCCESS 
		&& !Npc_KnowsInfo(other, DIA_YahYah_WhoAreYou))	
	{
		return TRUE;
	};
};
func void DIA_YahYah_WowSpeakingGobbo_Info()
{
		AI_Output(other,self,"DIA_YahYah_WowSpeakingGobbo_15_01");	//�� ��! ��������� ������!
	// ����� ���������� �������, �������������
	AI_Output(self,other,"DIA_YahYah_WowSpeakingGobbo_19_02");	//(�������������) �� ��! ��������� �������!
};


// ��� ��?
// ���������: ��� �������
instance DIA_YahYah_WhoAreYou(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_YahYah_WhoAreYou_Info;
	description = "��� ��?";
};
func void DIA_YahYah_WhoAreYou_Info()
{
		AI_Output(other,self,"DIA_YahYah_WhoAreYou_15_01");	//��� ��?
	AI_Output(self,other,"DIA_YahYah_WhoAreYou_19_02");	//��-�� ��������. �������� ������� �� ����� � �������� ����.
	B_LogNote(TOPIC_GobboVillage,TOPIC_GobboVillage_YahYah);
};


// ������ �� ������ ��� ����?
// ���������: ��� �������
instance DIA_YahYah_HowKnowsLanguage(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 3;
	condition = DIA_NoCond_cond;
	information = DIA_YahYah_HowKnowsLanguage_Info;
	description = "������ �� ������ ��� ����?";
};
func void DIA_YahYah_HowKnowsLanguage_Info()
{
			AI_Output(other,self,"DIA_YahYah_HowKnowsLanguage_15_00");	//������ �� ������ ��� ����?
	AI_Output(self,other,"DIA_YahYah_HowKnowsLanguage_19_01");	//��-�� ����� ����. ��-��-�� ����� ��-��.
			AI_Output(other,self,"DIA_YahYah_HowKnowsLanguage_15_02");	//� ��-��-�� ���?..
	AI_Output(self,other,"DIA_YahYah_HowKnowsLanguage_19_03");	//��-��-�� - ��� ������� �����.
	B_LogNote(TOPIC_GobboVillage,TOPIC_GobboVillage_RaDaPo);
};


// �� ����� ��������?
// ����������
instance DIA_YahYah_ArentTired(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 4;
	condition = DIA_YahYah_ArentTired_Cond;
	information = DIA_YahYah_ArentTired_Info;
	description = "�� ����� ��������?";
	permanent = TRUE;
};
// ���������: ����� ���� ��?�
func int DIA_YahYah_ArentTired_Cond()
{
	if (Npc_KnowsInfo(self,DIA_YahYah_WhoAreYou))	{
		return TRUE;
	};
};
func void DIA_YahYah_ArentTired_Info()
{
		AI_Output(other,self,"DIA_YahYah_ArentTired_15_01");	//�� ����� ��������?
	AI_Output(self,other,"DIA_YahYah_ArentTired_19_02");	//��-�� ������� ������. ��-�� �� �������.
};


// (������� � �����)
instance DIA_YahYah_BecameGobbe(C_Info)
{
	npc = Gobbo_DS2P_YahYah;
	condition = DIA_YahYah_BecameGobbe_Cond;
	information = DIA_YahYah_BecameGobbe_Info;
	description = "(������� � �����)";
	important = TRUE;
};
// �������: �� ������� � �����
func int DIA_YahYah_BecameGobbe_Cond()
{
	if (Gobbos_Attitude == Gobbos_Attitude_Gobbo)	{
		return TRUE;
	};
};
func void DIA_YahYah_BecameGobbe_Info()
{
	AI_Output(self,other,"DIA_YahYah_BecameGobbe_19_01");	//��-�� �������, ��� ����� ���� ����� ������� � ����� ������ ��� ������.
	AI_Output(self,other,"DIA_YahYah_BecameGobbe_19_02");	//��-�� ������ ����� �� ������. ��-��-�� ������, ��� ������� �����, ���� ����.
	// ���� ������� ������
	// UNFINISHED ����� ������� ��������?
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
};


///////////////////////////// �����: ������ � ������� �������� ///////////////////////////////
// � ���� ������.
// ����������
instance DIA_YahYah_IWantInside(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 10;
	condition = DIA_YahYah_IWantInside_Cond;
	information = DIA_YahYah_IWantInside_Info;
	description = "� ���� ������.";
	permanent = TRUE;
};
// ���������: ����� ���� ��?�
// ���������: �������� ������ � �������
func int DIA_YahYah_IWantInside_Cond()
{
	if (Npc_KnowsInfo(self,DIA_YahYah_WhoAreYou) && Gobbos_Attitude == Gobbos_Attitude_None && !MIS_DS2P_EnterGobboVillage_SharkTeeth)	{
		return TRUE;
	};
};
func void DIA_YahYah_IWantInside_Info()
{
		AI_Output(other,self,"DIA_YahYah_IWantInside_15_01");	//� ���� ������.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_02");	//������ �����. ����� �����.
	// ����� �������� (���������, ������ ���� ��� �� ���������):
	Info_ClearChoices(DIA_YahYah_IWantInside);
	Info_AddChoice(DIA_YahYah_IWantInside,Dialog_Back,DIA_YahYah_IWantInside_Back);
	if (!DIA_YahYah_IWantInside_WhatDoYouWant_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"��� � ������ �������, ����� �� ���� ���������?",DIA_YahYah_IWantInside_WhatDoYouWant);
	};
	if (!DIA_YahYah_IWantInside_Necklace_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"� ���� ���� ���� ��� ��� ��������.",DIA_YahYah_IWantInside_Necklace);
	};
	if (!DIA_YahYah_IWantInside_Niente_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"����� ���: �� ���� �� �����, ���� ��� �� ����.",DIA_YahYah_IWantInside_Niente);
	};
	if (!DIA_YahYah_IWantInside_SheGobbo_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"�, ������, ����� �������� ����!",DIA_YahYah_IWantInside_SheGobbo);
	};
	if (!DIA_YahYah_IWantInside_100Gold_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"��� ���� ��� �������. �������� ����.",DIA_YahYah_IWantInside_100Gold);
	};
};
func void DIA_YahYah_IWantInside_Back()
{
	Info_ClearChoices(DIA_YahYah_IWantInside);
};
// ��� ���� ��� �������. �������� ����.
var int DIA_YahYah_IWantInside_100Gold_Once;
func void DIA_YahYah_IWantInside_100Gold()
{
	DIA_YahYah_IWantInside_100Gold_Once = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_100Gold_15_01");	//��� ���� ��� �������. �������� ����.
	AI_Output(self,other,"DIA_YahYah_IWantInside_100Gold_19_02");	//����� �����. ��-�� �� ���� ������.
};
// �, ������, ����� �������� ����!
var int DIA_YahYah_IWantInside_SheGobbo_Once;
func void DIA_YahYah_IWantInside_SheGobbo()
{
	DIA_YahYah_IWantInside_SheGobbo_Once = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_SheGobbo_15_01");	//�, ������, ����� �������� ����!
	// �� ��������� ����� � �������
	AI_PointAt(other,"DP_FOREST_GOBBOVIL_01");
	AI_Wait(self,0.8);
	AI_Output(self,other,"DIA_YahYah_IWantInside_SheGobbo_19_02");	//��-�� ���� ����.
	AI_StopPointAt(other);
};
// ����� ���: �� ���� �� �����, ���� ��� �� ����.
var int DIA_YahYah_IWantInside_Niente_Once;
func void DIA_YahYah_IWantInside_Niente()
{
	DIA_YahYah_IWantInside_Niente_Once = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_Niente_15_01");	//����� ���: �� ���� �� �����, ���� ��� �� ����.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_Niente_02");	//����� ����. ����� �����!
};
// � ���� ���� ���� ��������.
var int DIA_YahYah_IWantInside_Necklace_Once;
func void DIA_YahYah_IWantInside_Necklace()
{
	DIA_YahYah_IWantInside_Necklace_Once = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_Necklace_15_01");	//� ���� ���� ���� ��������. ��� ������� �� ������ �������.
		AI_Output(other,self,"DIA_YahYah_IWantInside_Necklace_15_02");	//������ ��������� ����, ����� �������� �� ������� � ����� �������.
	AI_Output(self,other,"DIA_YahYah_IWantInside_Necklace_19_03");	//���. ��-�� ������� �������, ������ �������.
	AI_Output(self,other,"DIA_YahYah_IWantInside_Necklace_19_04");	//��-�� �� ���� ��������, ���� �����. ����� �����.
};
// ��� � ������ �������, ����� �� ���� ���������?
var int DIA_YahYah_IWantInside_WhatDoYouWant_Once;
func void DIA_YahYah_IWantInside_WhatDoYouWant()
{
	DIA_YahYah_IWantInside_WhatDoYouWant_Once = TRUE;
	MIS_DS2P_EnterGobboVillage_SharkTeeth = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_15_01");	//��� � ������ �������, ����� �� ���� ���������?
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_02");	//������. ����� �����.
		AI_Output(other,self,"DIA_YahYah_IWantInside_15_03");	//�� �����, �� ����� ������ ����, ��� ��� ����� ����� ������.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_04");	//�����, ����� ����. ���� ���� ������.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_05");	//�������� ���� ����� ������� ���� �������. ��-�� ��� ������, ������ ���� ����.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_06");	//����� ���� ��� ����, ������� ��-�� �� ����, � ��-�� ��������� �����.
	// ���������� ���� ���� �������� �� �������
	Wld_InsertNpc(Swampshark, WP_GobboEntrance_Shark1);
	Wld_InsertNpc(Swampshark, WP_GobboEntrance_Shark2);
	Wld_InsertNpc(Swampshark, WP_GobboEntrance_Shark3);
	// ������ � ��������. ����� ������� � ������� ��������: �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_Problem);
	Info_ClearChoices(DIA_YahYah_IWantInside);
};


// ���, � ������ �����.
// ���������: ����� �������
// �������: ���� ��� ����� �������� �����
instance DIA_YahYah_GiveSharkTeeth(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 11;
	condition = DIA_YahYah_GiveSharkTeeth_Cond;
	information = DIA_YahYah_GiveSharkTeeth_Info;
	description = "���, � ������ �����.";
};
func int DIA_YahYah_GiveSharkTeeth_Cond()
{
	if (MIS_DS2P_EnterGobboVillage_SharkTeeth && Npc_HasItems(other, ItAt_SharkTeeth) >= 3)	{
		return TRUE;
	};
};
func void DIA_YahYah_GiveSharkTeeth_Info()
{
		AI_Output(other,self,"DIA_YahYah_GiveSharkTeeth_15_01");	//���, � ������ �����.
	// ������ 3 ����� �������� �����
	B_GiveInvItems(other, self, ItAt_SharkTeeth, 3);
	AI_Output(self,other,"DIA_YahYah_GiveSharkTeeth_19_00");	//����� �������, ��� ���� �������.
	if (MIS_DS2P_EnterGobboVillage == LOG_Running) {
		// ������ � ��������. ����� ������� � ������� ��������: ����� �����
		B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage, LOG_MISSION, LOG_Running, TOPIC_DS2P_EnterGobboVillage_GaveTeeth);
		// ������ ��������, ��� � �����
		DIA_YahYah_AccessGranted_GoToChief();
	};
};

// � ������ �� ��-��-��.
// �������: ������� ���������� ��������� ��-��-��
// ���������: �������� ������ � �������
instance DIA_YahYah_FromBaBaPo(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 12;
	condition = DIA_YahYah_FromBaBaPo_Cond;
	information = DIA_YahYah_FromBaBaPo_Info;
	description = "� ������ �� ��-��-��.";
};
func int DIA_YahYah_FromBaBaPo_Cond()
{
	if (MIS_DS2P_EnterGobboVillage == LOG_Running && Gobbos_Attitude == Gobbos_Attitude_None 
		&& MIS_FigurinesGurun_EmeraldReturned)	{
		return TRUE;
	};
};
func void DIA_YahYah_FromBaBaPo_Info()
{
		AI_Output(other,self,"DIA_YahYah_FromBaBaPo_15_01");	//� ������ �� ��-��-��. �� ������, ��� �� ���� ����������.
	AI_Output(self,other,"DIA_YahYah_FromBaBaPo_19_00");	//��-��-�� ������� �������. ��-�� ���� ���.
	if (MIS_DS2P_EnterGobboVillage == LOG_Running) {
		// ������ � ��������. ����� ������� � ������� ��������: �� ���������
		B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage, LOG_MISSION, LOG_Running, TOPIC_DS2P_EnterGobboVillage_Figurines);
		// ������ ��������, ��� � �����
		DIA_YahYah_AccessGranted_GoToChief();
	};
};


//////////////////////////// ������ /////////////////////////////
// �� ������� � �������, ���� �� �� ���� ��������
// ���������: ������� �����
// ���������: �������� ������ � �������
// ����������
// ���������� ���

// *������ �����
instance DIA_YahYah_FirstWarn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 0;
	condition = DIA_YahYah_FirstWarn_Cond;
	information = DIA_YahYah_FirstWarn_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_FirstWarn_Cond()
{
	if (Gobbos_Attitude == 0 
		&& self.aivar[AIV_Guardpassage_Status] == GP_NONE 
		&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		&& YahYah_LastDistToWP > Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint))
	{
		return TRUE;
	};
};
func void DIA_YahYah_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_YahYah_FirstWarn_19_01");	//���, ������ ������ �����.
	YahYah_LastDistToWP = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	AI_StopProcessInfos(self);
};

// *������ �����
instance DIA_YahYah_SecondWarn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 0;
	condition = DIA_YahYah_SecondWarn_Cond;
	information = DIA_YahYah_SecondWarn_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_SecondWarn_Cond()
{
	if (Gobbos_Attitude == 0 
		&& self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven
		&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		&& YahYah_LastDistToWP > Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint))	{
		return TRUE;
	};
};
func void DIA_YahYah_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_YahYah_SecondWarn_19_00");	//�����, ��� ���, � ��-�� �������.
	YahYah_LastDistToWP = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};

// *��������� �����
instance DIA_YahYah_Attack(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 0;
	condition = DIA_YahYah_Attack_Cond;
	information = DIA_YahYah_Attack_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_Attack_Cond()
{
	if (Gobbos_Attitude == 0 
		&& self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven
		&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		&& YahYah_LastDistToWP > Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint))	{
		return TRUE;
	};
};
func void DIA_YahYah_Attack_Info()
{
	YahYah_LastDistToWP = PERC_DIST_ACTIVE_MAX;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_YahYah_Attack_19_00");	//����-��-��!
	// ������� ���������� �����������
	B_DS2P_GobboVillage_Hostile();
	// ��������
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};

////////////////////////////////// �������� /////////////////////////////////////
// ��������� �����


////////////////////////////////// ����� /////////////////////////////////////
// ���� ����������, ������
