instance DIA_TsaHaNauh_EXIT(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;
	nr = 999;
	permanent = TRUE;
	condition = DIA_TsaHaNauh_EXIT_condition;	
	information = DIA_TsaHaNauh_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_TsaHaNauh_EXIT_condition(){	return TRUE;};
func void DIA_TsaHaNauh_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// ���������� � ����� "������� �����"
//===========================
//����������� ----------------------------
instance DIA_TsaHaNauh_Hello(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 1;
	condition = DIA_TsaHaNauh_Hello_condition;	
	information = DIA_TsaHaNauh_Hello_info;
	important = TRUE;
};
func int DIA_TsaHaNauh_Hello_condition(){	return TRUE;};
func void DIA_TsaHaNauh_Hello_info()
{	
	//����� �� ����� - �������!
	B_GivePlayerXP(XP_Ambient);
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_18_01");	//�������? ������� � ��� �������?
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_15_02");	//��. ���� �����...
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_18_03");	//��� �� ������ �����, ��� ���� �����. ���� ��������, ��� ���� � ��� �������, ����� ��� ������� ����.
	//����� ���� ��� �������� ������� (� ����������� �� ����, ��� ������ � �������)
	Info_ClearChoices(DIA_TsaHaNauh_Hello);
	if (MIS_ReturnedStatues_Cnt > 0) 	{
		Info_AddChoice(DIA_TsaHaNauh_Hello,"� ����� ������ �������� ��-��-��.",DIA_TsaHaNauh_Hello_BaBaPo);
	}
	else if (Npc_KnowsInfo(other, DIA_YahYah_SharksKilled)) 	{
		Info_AddChoice(DIA_TsaHaNauh_Hello,"� ��������� ���� �������� ����.",DIA_TsaHaNauh_Hello_Sharks);
	}
	else {	//��������! ����������� �������
		Info_AddChoice(DIA_TsaHaNauh_Hello,"�� ���, ������ �����...",DIA_TsaHaNauh_Hello_Cheating);
	};
};
func void DIA_TsaHaNauh_Hello_BaBaPo()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_01");	//� ����� ������ �������� ��-��-��.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_BaBaPo_18_02");	//(�����������) � ��� ������� ����� ������� ������ ���� �� ������ ������� �����?
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_03");	//��, ������������ � ������ - �, �����, � �������, �� �� �����. � � �� �����, ����� ���� ����������. 
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_04");	//� ����� ������ �������� ���, ��� ������ ��� ���������� ��������� ������. ��-��-�� ������ ��� ��������� � ����� � ���� �������.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_BaBaPo_18_05");	//��? ����� ������� �� ����� �������, �� ��� ����� �������.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_06");	//(��� ����) ��, �� � �����.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_07");	//(�����) ������ �� ��� ������?
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_BaBaPo_18_08");	//���. �� ������� ��� �� �����. ����� ������.
	Info_ClearChoices(DIA_TsaHaNauh_Hello);
	Info_AddChoice(DIA_TsaHaNauh_Hello,"� ����� ������ �������� ��-��-��.",DIA_TsaHaNauh_Hello_BaBaPo);
};
func void DIA_TsaHaNauh_Hello_Sharks()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_01");	//� ��������� ���� �������� ����. ���, ��� ����������� ����� ������ � �������. � ��-�� ��������� ����.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_02");	//��� ����� ���� �������.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_03");	//(��� ����) � �����, ������ ���������� ������� ��� � �� ������� ��� ������� �������.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_04");	//(�����) ������ �� ��� �� ������?
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_05");	//���� �����, �������, �������. ���� ����� ������ ����� � �������. ������� ���, ��� ������.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_06");	//�� ��������� � �����. ���� ����������� ������.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_07");	//��������� ������ ����� ��������� ����� ������� �� ������, ��� ����� ����� ������, �������� ����� ���������.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_08");	//��� ������. �� ��� �������� �� ������ �������, �� � ���� ����.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_09");	//���! ��� ��������, ��� ������� �������. ������� ���� ���� ��������. 
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_10");	//������ ������ ���� ������� �� ���������! ���� ������ ���� � ���� � ������ �����, �� �������.
};
func void DIA_TsaHaNauh_Hello_BothEnd()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BothEnd_15_01");	//� ��� ��� �������, ����� �� ��� ����� �������� ���� �� ����-����?
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_BothEnd_18_02");	//��, ���� ������ �� �������, �������� ������ ������� ��������. ���� ������� �������� ���� ������, �� � ��� ����� ���������� � �������.
	//������ � �������� "������� �����"
	B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust, LOG_MISSION, LOG_Running, TOPIC_DS2P_GobboLeaderTrust_Start);
};
func void DIA_TsaHaNauh_Hello_Cheating()
{	
	//NS �� ����, ����������. ������ ������� � ����������
	// -�����, ��� � �� ���������-�� �������� �����? 
	// -�� ���, �������, ������� [������] �������! 
	// -������ ���, ������!
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Cheating_15_01");	//�� ���, ������ �����...
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Cheating_18_02");	//������� �����! ������� ������ ������ ����� ������� �������.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Cheating_18_03");	//�����!!! ����� � �������! ��� ������!
	Gobbos_Attitude = Gobbos_Attitude_Hostile;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};
// ��� ��� ��� ������ � ���������? ----------------------------
//���� ���� ����� "������� �����"
//����������
instance DIA_TsaHaNauh_Reputation(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 12;
	condition = DIA_TsaHaNauh_Reputation_condition;	
	information = DIA_TsaHaNauh_Reputation_info;
	description = "��� ��� ��� ������ � ���������?";
	permanent = TRUE;
};
func int DIA_TsaHaNauh_Reputation_condition()
{
	if (MIS_DS2P_GobboLeaderTrust == LOG_Running){
		return TRUE;
	};
};
var int DIA_TsaHaNauh_Reputation_Once;	//������ � ������ - ������ ���� ���
	const int DIA_TsaHaNauh_Reputation_Once_BaBaPo	= 1;
	const int DIA_TsaHaNauh_Reputation_Once_RaDaPo	= 1 << 1;
	const int DIA_TsaHaNauh_Reputation_Once_KuLa	= 1 << 2;
	const int DIA_TsaHaNauh_Reputation_Once_YahYah	= 1 << 3;
	const int DIA_TsaHaNauh_Reputation_Once_JaAfFar	= 1 << 4;
func void DIA_TsaHaNauh_Reputation_info()
{	
	var int Help_Count;	Help_Count = 0;
	AI_Output(other,self,"DIA_TsaHaNauh_Reputation_15_01");	//��� ��� ��� ������ � ���������?

	if (MIS_DS2P_FigurinesGurun == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_02");	//��-��-�� ��������, ��� ���� ������ ������ ��������� ������.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_BaBaPo))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_BaBaPo);
		};
		Help_Count += 1;
	};
	//���� �������?
	if (MIS_DS2P_AncientStonePlates == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_03");	//���� ������ ��-��-�� ������� ������ �������� ��������.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_RaDaPo))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_RaDaPo);
		};
		Help_Count += 1;
	};
	if (MIS_DS2P_MissingFriend == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_04");	//���� ����� ��-��-��, ���� ��-��.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_KuLa))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_KuLa);
		};
		Help_Count += 1;
	};
	if (MIS_DS2P_EnterGobboVillage == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_05");	//����� ����� ��� �������� �����.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_YahYah))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_YahYah);
		};
		Help_Count += 1;
	};
	if (MIS_DS2P_QuirkyThief == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_06");	//���-��-��� ����������, ��� ���� ������ ��� ������� ����� ����. ��� �� ������� ���.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_JaAfFar))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_JaAfFar);
		};
		Help_Count += 1;
	};
	//���������� �������?
	if (Help_Count >= 3)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_07");	//����� ����� ������� ��� �������, ���� � ���� �������. ��� ���� ������, ��� ������ ����.
		//������ � �������� "������� �����". ����� ��������.
		B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GobboLeaderTrust_Success);
		B_GivePlayerXP(XP_MIS_GobboLeaderTrust_Success);
	}
	else	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_08");	//���� ���� ������� ��� �������. ��� ���� �� ������.
	};
};

//NS - 20/03/2016 ===========
// �����
//===========================
// �� ���� ����� ����� ���������? ----------------------------
instance DIA_TsaHaNauh_AUChief(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 10;
	condition = DIA_TsaHaNauh_AUChief_condition;	
	information = DIA_TsaHaNauh_AUChief_info;
	description = "�� ���� ����� ����� ���������?";
};
func int DIA_TsaHaNauh_AUChief_condition(){	return TRUE;};
func void DIA_TsaHaNauh_AUChief_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_AUChief_15_01");	//�� ���� ����� ����� ���������?
		AI_Output(self,other,"DIA_TsaHaNauh_AUChief_18_02");	//��, ��� ���� �����. � ��� ������������ �������: ���� ������� ����� ����� ������, ��� ����� ����� �������.
};

// ������� ����� �������� � �������? ----------------------------
//����� "�� ���� ����� ����� ���������?"
instance DIA_TsaHaNauh_HowManyGobbos(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 11;
	condition = DIA_TsaHaNauh_HowManyGobbos_condition;	
	information = DIA_TsaHaNauh_HowManyGobbos_info;
	description = "������� ����� �������� � �������?";
};
func int DIA_TsaHaNauh_HowManyGobbos_condition()
{
	if (Npc_KnowsInfo(other,DIA_TsaHaNauh_AUChief))	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_HowManyGobbos_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_HowManyGobbos_15_01");	//������� ����� �������� � �������?
		AI_Output(self,other,"DIA_TsaHaNauh_HowManyGobbos_18_02");	//(�������������) ����� ������� ����������? ����� ������ �������� ������� �� ���?
		AI_Output(self,other,"DIA_TsaHaNauh_HowManyGobbos_18_03");	//���, ��� �� �������� ��� �������.
	AI_Output(other,self,"DIA_TsaHaNauh_HowManyGobbos_15_04");	//(��������) ��, ��� �� ������ � �����.
};

// �������� � ����. ----------------------------
//����� "�� ���� ����� ����� ���������?" � ����� "������� �����" ����
//����������
instance DIA_TsaHaNauh_AboutYourself(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 12;
	condition = DIA_TsaHaNauh_AboutYourself_condition;	
	information = DIA_TsaHaNauh_AboutYourself_info;
	description = "�������� � ����.";
	permanent = TRUE;
};
func int DIA_TsaHaNauh_AboutYourself_condition()
{
	if ((Npc_KnowsInfo(other,DIA_TsaHaNauh_AUChief))
		 && (MIS_DS2P_GobboLeaderTrust == LOG_SUCCESS)){
		return TRUE;
	};
};
func void DIA_TsaHaNauh_AboutYourself_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_AboutYourself_15_01");	//�������� � ����.
		AI_Output(self,other,"DIA_TsaHaNauh_AboutYourself_18_02");	//��� ���� ����� �������. ��� ����� �� ����, ����� ��� ���� ����� ����� � ����.
};

// �� ������ ���� ����-������ �������? ----------------------------
//����� "�� ���� ����� ����� ���������?" � ����� "������� �����" ����
instance DIA_TsaHaNauh_TeachNot(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 13;
	condition = DIA_TsaHaNauh_TeachNot_condition;	
	information = DIA_TsaHaNauh_TeachNot_info;
	description = "�� ������ ���� ����-������ �������?";
};
func int DIA_TsaHaNauh_TeachNot_condition()
{
	if (Npc_KnowsInfo(other,DIA_TsaHaNauh_AUChief)
		 && (MIS_DS2P_GobboLeaderTrust == LOG_SUCCESS)){
		return TRUE;
	};
};
func void DIA_TsaHaNauh_TeachNot_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_TeachNot_15_01");	//�� ������ ���� ����-������ �������?
		AI_Output(self,other,"DIA_TsaHaNauh_TeachNot_18_02");	//���, ��� ������� ������ ������.
		AI_Output(self,other,"DIA_TsaHaNauh_TeachNot_18_03");	//�� ���� ���� �������� ������ ������� � �������.
};

//NS - 20/03/2016 ===========
// ����� "������ ��� ���������"
//===========================

//� ���� ���� ��� ���� �������? ----------------------------
//����� - ���
//����������, ���� �� ���������� �������
instance DIA_TsaHaNauh_AnyJob1(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 20;
	condition = DIA_TsaHaNauh_AnyJob1_condition;	
	information = DIA_TsaHaNauh_AnyJob1_info;
	description = "� ���� ���� ��� ���� �������?";
	permanent = TRUE;
};
func int DIA_TsaHaNauh_AnyJob1_condition()
{
	if (MIS_DS2P_GobboLeaderTrust != LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_AnyJob1_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_01");	//� ���� ���� ��� ���� �������?
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_02");	//������� ������� �������� ����.
};
//� ���� ���� ��� ���� �������? ----------------------------
//����� - ��
//����� ���������� �������
instance DIA_TsaHaNauh_AnyJob2(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 21;
	condition = DIA_TsaHaNauh_AnyJob2_condition;	
	information = DIA_TsaHaNauh_AnyJob2_info;
	description = "� ���� ���� ��� ���� �������?";
};
func int DIA_TsaHaNauh_AnyJob2_condition()
{
	if (MIS_DS2P_GobboLeaderTrust == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_AnyJob2_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_01");	//� ���� ���� ��� ���� �������?
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_03");	//��, ����. ������, ����� ����� ��������, ��� �� ���� �������, ��� ������� ������.
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_04");	//��� ���� �������?
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_05");	//���� ����� ����������� ����� ���������, ����� ������ ������� �� ��������� ���������. ��� ���� ���� �������� �����, ��� �������, � ���� ���������. ��� ���� ����.
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_06");	//���� ������ �� ������ �� ����� �����. ����� ����� ���� �����, �� ���� ��������� ���� ������-�������.
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_07");	//�� ������, ����� � ����� ���� �������� ������?
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_08");	//���! ����� �� ������ �����-�����, ������� ������� ���� ����, ������ ���������� ������.
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_09");	//�� ���. ���� ���� ��������. ��� ����� ���� ���� ������� � �������� ���.
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_10");	//� �� ����������� ����� ��� ���� ����������? ������, �������, �� � �� ���� ��� ����� �������� �� �������, �������� ���.
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_11");	//��� � �� ������� ���.
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_12");	//�� ��� ��������� ������, ��� �� ������ �������� ��� ����. ���� �������� � ����, ��������� �� ���� � ���.
};
//����� ����� ----------------------------
//����� �����������
instance DIA_TsaHaNauh_IWillHelp(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 22;
	condition = DIA_TsaHaNauh_IWillHelp_condition;	
	information = DIA_TsaHaNauh_IWillHelp_info;
	description = "������, � �������� � ������.";
};
func int DIA_TsaHaNauh_IWillHelp_condition()
{
	if (Npc_KnowsInfo(other, DIA_TsaHaNauh_AnyJob2))	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_IWillHelp_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_IWillHelp_15_01");	//������, � �������� � ������. �� �� ������, ��� ����� ��������� ��.
		AI_Output(self,other,"DIA_TsaHaNauh_IWillHelp_18_02");	//������� ����������.
	//� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Protection4LittleOnes_Start);
};

//�� ������ ����� �? ----------------------------
//����� ��������� ��� �����
instance DIA_TsaHaNauh_WhyMe(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 23;
	condition = DIA_TsaHaNauh_WhyMe_condition;	
	information = DIA_TsaHaNauh_WhyMe_info;
	description = "������ �� ���� �� ��������� �����?";
};
func int DIA_TsaHaNauh_WhyMe_condition()
{
	if ((MIS_DS2P_Protection4LittleOnes == LOG_Running)
		 && Npc_KnowsInfo(other, DIA_TsaHaNauh_AnyJob2) && !Orcs_CameToGobbos)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_WhyMe_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_WhyMe_15_01");	//������ �� ���� �� ��������� �����?
		AI_Output(self,other,"DIA_TsaHaNauh_WhyMe_18_02");	//���� ������ ������� � �����.
};

//������� ����� ----------------------------
instance DIA_TsaHaNauh_OrcsCame(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 24;
	condition = DIA_TsaHaNauh_OrcsCame_condition;	
	information = DIA_TsaHaNauh_OrcsCame_info;
	description = "������ ���� ����� �������� ���.";
};
func int DIA_TsaHaNauh_OrcsCame_condition()
{
	if ((MIS_DS2P_Protection4LittleOnes == LOG_Running)
		 && Orcs_CameToGobbos)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_OrcsCame_info()
{	
		AI_Output(other,self,"DIA_TsaHaNauh_OrcsCame_15_01");	//������ ���� ����� �������� ���.
		AI_Output(other,self,"DIA_TsaHaNauh_OrcsCame_15_02");	//� ��� ������ �� � �������.
	AI_Output(self,other,"DIA_TsaHaNauh_OrcsCame_18_03");	//�������, �����. ���� ��� ��� ��������, ��� �� ���� ��� �������. ��� ������, ��� ��� ��������� ����. ��� ������� ��������.
	if (Npc_KnowsInfo(other, DIA_RaDaPo_AboutChief))	{
		AI_Output(other,self,"DIA_TsaHaNauh_OrcsCame_15_04a");	//�� �����, � ���� ���� �������, � � �� �������.
	}
	else	{
		AI_Output(other,self,"DIA_TsaHaNauh_OrcsCame_15_04b");	//�����, ������.
	};
	AI_Output(self,other,"DIA_TsaHaNauh_OrcsCame_18_05");	//����� ����� ���� ���. �� ������ ������������ ������� �����, ������ ������� ���� ������� ���.
	//���� ��� ������ - ���������� � ����������� � ��������
	B_GiveInvItems(self,other,ItMw_DS2P_1H_GurunSword,1);
	//������ � �������� "������ ��� ���������". ����� ��������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Protection4LittleOnes_Success);
	B_GivePlayerXP(XP_MIS_Protection4LittleOnes_Success);
};


//NS - 20/06/2016 ===========
// ����� "������������ ������"
//===========================

//� ���� ���� ��� ���� �������? ----------------------------
//���������� � ������ �� ��������, ����� ���� �� ������
instance DIA_TsaHaNauh_RaDaPoCalls(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 30;
	condition = DIA_TsaHaNauh_RaDaPoCalls_condition;	
	information = DIA_TsaHaNauh_RaDaPoCalls_info;
	important = TRUE;
};
func int DIA_TsaHaNauh_RaDaPoCalls_condition()
{
	if (MIS_DS2P_FuriousAncestors_Stage == MIS_DS2P_FuriousAncestors_TsaHaNauhRemembered)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_RaDaPoCalls_info()
{	
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_01");	//������, �������, ��� ������. ��-��-�� ������ ������ ����.
		AI_Output(other,self,"DIA_TsaHaNauh_RaDaPoCalls_15_02");	//��� ��� ����?
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_03");	//��� �� �����. ���� ���� � ����� � ��� ��������.
	MIS_DS2P_FuriousAncestors_Stage = MIS_DS2P_FuriousAncestors_TsaHaNauhTold;
};


//NS - 20/06/2016 ===========
// ������� � �����
//===========================
instance DIA_TsaHaNauh_JoinedTribe(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;				nr = 40;
	condition = DIA_TsaHaNauh_JoinedTribe_condition;	
	information = DIA_TsaHaNauh_JoinedTribe_info;
	important = TRUE;
};
func int DIA_TsaHaNauh_JoinedTribe_condition()
{
	if (Joined_Gobbos_Tribe && Npc_IsInState(self,ZS_Talk)) {
		return TRUE;
	};
};
func void DIA_TsaHaNauh_JoinedTribe_info()
{	
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_01");	//��� �� ������, ��� ������� ����� ����, ����� ������� ����� ����� ����� ������. 
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_02");	//�� ��� ����� �� ������, ��� ���� ����, ����� ��� � ������ ���� ������. 
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_03");	//���� ��������� ���� ������.
};

/* UNFINISHED

��-��-����: ��� �� ������, ��� ������� ����� ����, ����� ������� ����� ����� ����� ������. �� ��� ����� �� ������, ��� ���� ����, ����� ��� � ������ ���� ������. ���� ��������� ���� ������.
//*/
