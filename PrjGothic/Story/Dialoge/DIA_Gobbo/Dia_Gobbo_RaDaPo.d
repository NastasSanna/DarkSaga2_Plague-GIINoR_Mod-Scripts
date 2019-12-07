instance DIA_RaDaPo_EXIT(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;
	nr = 999;
	permanent = TRUE;
	condition = DIA_RaDaPo_EXIT_condition;	
	information = DIA_RaDaPo_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_RaDaPo_EXIT_condition(){	return TRUE;};
func void DIA_RaDaPo_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// ���������� 
//===========================
instance DIA_RaDaPo_Hello(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 1;
	condition = DIA_RaDaPo_Hello_condition;	
	information = DIA_RaDaPo_Hello_info;
	description = "�� ���?";
};
func int DIA_RaDaPo_Hello_condition(){	return TRUE;};
func void DIA_RaDaPo_Hello_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_Hello_15_01");	//�� ���?
		AI_Output(self,other,"DIA_RaDaPo_Hello_18_02");	//���� ����� ��-��-��, � ����� �������, �������.
};

//NS - 06/03/2016 ===========
// ����� �������
//===========================
// ��� ����� ------------------------------
//���� ���� ��� �������� � ������
instance DIA_RaDaPo_AboutChief(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 2;
	condition = DIA_RaDaPo_AboutChief_condition;	
	information = DIA_RaDaPo_AboutChief_info;
	description = "���-�� ����� � ��� �������������.";
};
func int DIA_RaDaPo_AboutChief_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello)
		 && Gobbo_DS2P_TsaHaNauh.aivar[AIV_TalkedToPlayer])	{
		return TRUE;
	};
};
func void DIA_RaDaPo_AboutChief_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_AboutChief_15_01");	//���-�� ����� � ��� �������������. �� ����� �� �����-�� �����.
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_02");	//��� ��� � ����. � � ���� ���� ������� ��� �����, ����� � ����.
	AI_Output(other,self,"DIA_RaDaPo_AboutChief_15_03");	//����������?
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_04");	//������ �� � ���, ��� �� �����. ����� ��� ����� � ��-��-���� ������� ���, ���������� ������� � ������� ������. ����, � ���������, ������ ��� �����, � ���� ����� ������ ����.
	AI_Output(other,self,"DIA_RaDaPo_AboutChief_15_05");	//� �� � ��� ���� �� ����, ���?
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_06");	//��. ��-��-���� ����� ����, �������� ������ � ����� �������� ������. ����� ����� ������� ������, �� ��� ����� ����������� �� ������� ���� � �������� ������, �������� ���� �� ����.
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_07");	//���, ���� ����� ������� ���������������. �� ���� �������, ��� ��� ��� ������ � ������� �, ����� ������ �����, ��� ��� ����� ��������� ��� ������� �������� �� ����� ������, ��� ����������� ������� �� ��������. � ��������.
	AI_Output(other,self,"DIA_RaDaPo_AboutChief_15_08");	//� �����������, ��� ���� ������. ���� ����� ���, ��?
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_09");	//��� ���. ��� ���� ���� ����������, ������������ ������. ��� ������ ����������� �������� ������, ��� ���� ������ ������� �� �����. ������� ����������� ����, ���� ����.
		AI_Output(self,other,"DIA_RaDaPo_AboutChief_18_10");	//� ��� ��� ��� ����� ���� ��������� �����. � ���� �������, ��� �� ������� � �����, � �� ������� ������. ������ ����, ����� ��������� ����� ���������.
	//������ � �������� "������� �����"
	if (MIS_DS2P_GobboLeaderTrust == LOG_Running)	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_RageReason);
	};
};
// ������������ ���� ------------------------------
instance DIA_RaDaPo_SpeakWell(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 3;
	condition = DIA_RaDaPo_SpeakWell_condition;	
	information = DIA_RaDaPo_SpeakWell_info;
	description = "��� ������� �� �������������� �� ���������� ������ �����������.";
};
func int DIA_RaDaPo_SpeakWell_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_SpeakWell_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_SpeakWell_15_01");	//��� ������� �� �������������� �� ���������� ������ �����������.
		AI_Output(self,other,"DIA_RaDaPo_SpeakWell_18_02");	//�������. ���� ���� ��� ������� ��-��-���, �������� ���� ��� ����������� ������� ���-��, � ����...
	AI_Output(other,self,"DIA_RaDaPo_SpeakWell_15_03");	//� �����.
		AI_Output(self,other,"DIA_RaDaPo_SpeakWell_18_04");	//(����������) ����� ��... ������, ��� ���������� ��������?
	AI_Output(other,self,"DIA_RaDaPo_SpeakWell_15_05");	//����, �� �� ������ ������� ����������� ���� ������ �������� �� ���������� ������.
		AI_Output(self,other,"DIA_RaDaPo_SpeakWell_18_06");	//���, ������ �� �������. ������ ����� ����� ����� ���� ����������-�������� � ��������� ������� ����� ������ �������.
		AI_Output(self,other,"DIA_RaDaPo_SpeakWell_18_07");	//� ��� ��� �� ����� ������ �����. �� ���� �� ������� ���������� �������� �� ���, ������ �� ����� ��������.
};
// ��� �������� ------------------------------
instance DIA_RaDaPo_AboutGobbos(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 4;
	condition = DIA_RaDaPo_AboutGobbos_condition;	
	information = DIA_RaDaPo_AboutGobbos_info;
	description = "�������� ��� � ��������.";
};
func int DIA_RaDaPo_AboutGobbos_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_AboutGobbos_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_15_01");	//�������� ��� � ��������.
		AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_18_02");	//��� ������ �� ������ ��������?
	Info_ClearChoices(DIA_RaDaPo_AboutGobbos);
	Info_AddChoice(DIA_RaDaPo_AboutGobbos,Dialog_Back,DIA_RaDaPo_AboutGobbos_Back);
	if (Hero_Knows_OdDiOn)	{
		Info_AddChoice(DIA_RaDaPo_AboutGobbos,"��� ����� ��-��-��?",DIA_RaDaPo_AboutGobbos_OdDiOn);
	};
	if (Hero_Knows_Gurun)	{
		Info_AddChoice(DIA_RaDaPo_AboutGobbos,"�������� ��� � ������.",DIA_RaDaPo_AboutGobbos_Gurun);
	};
	Info_AddChoice(DIA_RaDaPo_AboutGobbos,"�������� ��� � �������.",DIA_RaDaPo_AboutGobbos_Tribe);
};
func void DIA_RaDaPo_AboutGobbos_Back()
{	
	Info_ClearChoices(DIA_RaDaPo_AboutGobbos);
};
func void DIA_RaDaPo_AboutGobbos_Tribe()
{	
		AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_Tribe_15_01");	//�������� ��� � �������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_02");	//���� ����� ����� ����� ��� ��������� ����� ���. ����� ���� ������ �������� �� ���� ������, ����� ��� �� ���� �����.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_03");	//����� ���� ����� ����, ������ ���� � ���������� �����. ����� ������ ��� ����������� �� ����� �������, � ������������ ��������� ������: ������, ��� ����������, �������� � ������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_04");	//���� ��� � ���� ���� � ������ � ������� �� �������, ���� �������� ���� �����. ����� �� ���� �������� ����� � �����������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_05");	//�� ����� ���� ������� ����������� �� ���. ����� ��� ������ ���������� ���� �� �������, ���� �������� ����.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_06");	//������� ��� ��� ��������� �����, � ���� ������ ��������� ������ �������� ��.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_07");	//�� ���� ��������� �������� ������� � ��������� ���������� ���� �� ���������� ������. �� ����� �����.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_08");	//����� ���� ������ ������������ � ���������� �� �����.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_09");	//������ ��� ��� ���� ���� ��������� �����. ������ ������ ��� ��� ��� ������� ������� �����. � ����� � ����� ��� ������ �� �������, ��������� ���� �� ����� ����.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_10");	//���� ��������� ������ � ������ �������� ������ ����� ��������, ��������� � �������� �������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_11");	//������ ������ ���� �����: ������ ������ ��������� ����������� ��� ���������� � ����� ������. ���� ���������. �� ��� ����� ����� ��� ���� � ������� ���� ������ ������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_12");	//������ ��� ������ ������� ���������� ��������� � �������� ����� �����, ����� ���� ����������� � ����������� ����� ���� ������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Tribe_18_13");	//� ��� ����� ���� ��������� ��������� ������� �������������, ����� ������� ���� ��� ����, � ����������� ���� ������� ����� ����������. ������ �� ��� ����� �������� ���� �����.
};
func void DIA_RaDaPo_AboutGobbos_Gurun()
{	
		AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_Gurun_15_01");	//�������� ��� � ������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_02");	//����� - ������������ ��� ����� � �����. ��� �� ����� ��������� �����.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_03");	//� �� ������� �� ���� ������ ������ ���� �������� ������ ������ � �������� �������, ������. ��� ���������� ������ ��������, � ���� ������ ������ �� ����� � ���� �������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_04");	//�� �������� �� ������ ���� ������, �� �������, �� ������. ������ ������ �� ������������� � ���� �����, � ��� ���� �������������, ��������� ����� ������� ������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_05");	//�����-�� ����� � ������� �� ��������� ���: ����� ��� �� ���, ��� ��������� ��� ����, ���������� � ��� �� �������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_06");	//�����, ����� ����� ��������� ������� ����� ������, ����� ���������� � ����, ������� ������ �������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_07");	//����� �������� �������� ����� � � ��������� ���� ���� ������ ������ �� � ������� �����, � � ������ ����������, � ������� ��� ���-���������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_08");	//������� ��� �������� ������ �� ������� ����������, �� ����� �� ������� ������ ���� ����� � ��� ���������� ����� ������ � �������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_09");	//����� �� ����� ��������� ����� ���������� �����. ������ ����� ������ �� � �������� ����� ������� ���� ������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_10");	//��������� ��� ������� ������ ������. �� �������� ��� ��-��-��, ��� ������ ��������������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_Gurun_18_11");	//������ ���� � ������� � ����, � �� ������ ������ �� ���� ���� �����.
};
func void DIA_RaDaPo_AboutGobbos_OdDiOn()
{	
		AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_OdDiOn_15_01");	//��� ����� ��-��-��?
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_02");	//��� ������������ ���, ������ �� � ������� ������ ������ �������� ������ ������, ����������� ���� ������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_03");	//��-��-�� ����� ���� � ������ �����. �� ������� ������, �������, ���� �������. ��� ���� ����� �������� � ������������� � �� ����� ����������� �� ���.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_04");	//� ������ ������� �� ������ ��� � ���-��, � ����� ��� ����� ��� ��������, ������ ��� �� ������, ��� ������ �� ����� ��� ������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_05");	//������ ������� � ��� ������� ������ ������� ����������� ��� ����� ��������� � �����, ��� ����� ��������� ���� � ������� ��������.
	AI_Output(self,other,"DIA_RaDaPo_AboutGobbos_OdDiOn_18_06");	//������ ������� ���� ��������� ������ � ��� � �������, � �� ����� ��� �� �����.
		AI_Output(other,self,"DIA_RaDaPo_AboutGobbos_OdDiOn_15_07");	//(��� ������� ����)
};

//NS - 31/03/2016 ===========
// ����� "�������� �������� �������"
//===========================
instance DIA_RaDaPo_AnyJob(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 10;
	condition = DIA_RaDaPo_AnyJob_condition;	
	information = DIA_RaDaPo_AnyJob_info;
	description = "���� ��� ���� ������?";
};
func int DIA_RaDaPo_AnyJob_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_AnyJob_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_AnyJob_15_01");	//���� ��� ���� ������?
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_02");	//������-�� ����. � �� ����� ��������� ���� ������� ��������� �������� �������� ������ ��������.
	AI_Output(other,self,"DIA_RaDaPo_AnyJob_15_03");	//��������?
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_04");	//��. �� ����� ��� ��-��-��.
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_05");	//������ �� �����-�� ���� �������� ������. ������ � � ��� ������ � ���, ����� �� ���-�� ������������ ���, ����-�� ����. 
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_06");	//�� �� �������� �������� ���, ��������, ������ �������� ������� �������. � ������� �������� ����, � ����� ������� � ����� �����. ��� ���������� �� ���� ������ �� ������ ������ �� ���������.
		AI_Output(self,other,"DIA_RaDaPo_AnyJob_18_07");	//� �������� �������� ����, � ������. � ��� � ��� ��������� ���� � ����, �������� �� ���������, �� ��� �������� ��, ��������� ���� ������.
	Hero_Knows_OdDiOn = TRUE;
};
// --------------------------------------------
instance DIA_RaDaPo_CarryStonePlates(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 11;
	condition = DIA_RaDaPo_CarryStonePlates_condition;	
	information = DIA_RaDaPo_CarryStonePlates_info;
	description = "������, � ������ �������� ��������.";
};
func int DIA_RaDaPo_CarryStonePlates_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_AnyJob))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_CarryStonePlates_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_CarryStonePlates_15_01");	//������, � ������ �������� ��������. � ���������� ��� � ����� �������� ����?
		AI_Output(self,other,"DIA_RaDaPo_CarryStonePlates_18_02");	//���� ����� ��� ����. �� ���������, ����� �� ����� ���-������ �������, � ������� ����������.
		AI_Output(self,other,"DIA_RaDaPo_CarryStonePlates_18_03");	//�� ���� ���� ���������: ���� �� ����� �� �����, �� ��� � ������ ������ �� ������.
	AI_Output(other,self,"DIA_RaDaPo_CarryStonePlates_15_04");	//� ��� ��������� ��� �������� ��� ��������?
		AI_Output(self,other,"DIA_RaDaPo_CarryStonePlates_18_05");	//�����, ���� �������, � �� ����������� � ���. ��� ������-�� �������, ��� � �����.
	//��-��-�� �������� 4 �������� ��������.
	//�� �����, ������� �� ������� ������� � ������ 2.
	B_GiveInvItems(self,other,ITWR_ANCIENTSTONEPLATE,4);
	AI_Output(other,self,"DIA_RaDaPo_CarryStonePlates_15_06");	//(��� ����) ��, �������� ��������, � ��� ����� �����. 
	AI_Output(other,self,"DIA_RaDaPo_CarryStonePlates_15_07");	//(�����) �����, ���-������ ���������.
	//������ � �������� "�������� �������� �������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running,TOPIC_DS2P_AncientStonePlates_Start);
};

//������, ������� --------------------------------------------
instance DIA_RaDaPo_StonePlatesDelivered(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 12;
	condition = DIA_RaDaPo_StonePlatesDelivered_condition;	
	information = DIA_RaDaPo_StonePlatesDelivered_info;
	description = "� �������� ���� ���������.";
};
func int DIA_RaDaPo_StonePlatesDelivered_condition()
{
	if (MIS_DS2P_AncientStonePlates_Delivered)	{
		return TRUE;
	};
};
func void DIA_RaDaPo_StonePlatesDelivered_info()
{	
	AI_Output(other,self,"DIA_RaDaPo_StonePlatesDelivered_15_01");	//� �������� ���� ���������.
		AI_Output(self,other,"DIA_RaDaPo_StonePlatesDelivered_18_02");	//����� ������. � ���� ����, ���� �� � �������. ������ ��� ������.
	//������ ���� �� 150 �������.
	B_GiveInvItems(self,other,ItMi_Gold,150);
	//��� ������ � ������
	B_GivePlayerXP(XP_Ambient);
};


//NS - 24/06/2016 ===========
// ����� "������������ ������"
//===========================
instance DIA_RaDaPo_TsaHaNauhSend(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 20;
	condition = DIA_RaDaPo_TsaHaNauhSend_condition;	
	information = DIA_RaDaPo_TsaHaNauhSend_info;
	description = "����� ������, ��� �� ����� ���� ������.";
};
func int DIA_RaDaPo_TsaHaNauhSend_condition()
{
	if (MIS_DS2P_FuriousAncestors_Stage == MIS_DS2P_FuriousAncestors_TsaHaNauhTold)	{
		return TRUE;
	};
};
func void DIA_RaDaPo_TsaHaNauhSend_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_01");	//����� ������, ��� �� ����� ���� ������.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_02");	//��, �����. �����, �� �����-������ ����������� � ����������?
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_03");	//��, �����������. 
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_04");	//� � ��� ���, �������� � ������������?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_05");	//�� ��� ����������� ���� �� ����� �������. �� ����� ��� � ���, ��� �� ��������� ���� �������, ������� � ��������� ����� ��������� ������.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_06");	//� ������, ����� �� ��������� �������� ����� � ���� �����, �� ������ �� ��� ���������.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_07");	//�� ������� ���������� � ������ � ������� ����, �� ������ ��������� � ������ � ����� ������ � �����, �� ������ ������� ����� ������ �����, ��� ���� ��������� ���� �� �����... ����� � �� �����������.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_08");	//� �� ������, ����� � ����� ��� ���������� �� ���������?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_09");	//���, �� ��� �������� ���� ���� ������ ��� ������� - �������� ��� ������ ������. ��� ����� �� ������� ����� ������, �� ����� ���� � �� �����.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_10");	//�������, � ���� ���� ����, ��� ��� �������, ������ ��� � ������� �� ����, ��� ����� ��������.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_11");	//���� ������ ��������, ������� �������� ���� �� ������ ������� ��� ������ ������, �� � ��������� ��� ���� ������� �������.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_12");	//���, �������� �����.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_13");	//��������, ������ ������ ������ �������. � ������� ���������� - ����� ����� ������, ������� �� ������� ������� ������ ��� ������.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_14");	//������ �������, ��� � ���� ������� ������ �����?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_15");	//�������, �� ������� ������ ������� ���� ����� ������� � ����� �� �� ������. 
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_16");	//��� �� �������� ���?
	
	Info_ClearChoices(DIA_RaDaPo_TsaHaNauhSend);
	Info_AddChoice(DIA_RaDaPo_TsaHaNauhSend,"���, ��� ������� ������.",DIA_RaDaPo_TsaHaNauhSend_No);
	Info_AddChoice(DIA_RaDaPo_TsaHaNauhSend,"������.",DIA_RaDaPo_TsaHaNauhSend_Yes);
};
func void DIA_RaDaPo_TsaHaNauhSend_No()
{
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_15_01");	//���, ��� ������� ������.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_18_02");	//����� ����. ������, ������, ��� ��� �� ����� ���������� �� �����.
	Info_ClearChoices(DIA_RaDaPo_TsaHaNauhSend);
	MIS_DS2P_FuriousAncestors_Stage = MIS_DS2P_FuriousAncestors_Failed;
};
func void DIA_RaDaPo_TsaHaNauhSend_Yes()
{
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_Yes_15_01");	//������.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_Yes_18_02");	//��������� ����. ���� ������ ����������� �� ������ � ��������, �� � � �������������.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_Yes_15_03");	//��� ����� ��� ������ ��������?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_Yes_18_04");	//� ���� ���� ���, ��� ����� ����� �� ������. �� ��� ����� ����� ������ ���������� - ����-��. ���� �������� ��� ��������� ����.

	Info_ClearChoices(DIA_RaDaPo_TsaHaNauhSend);
	Info_AddChoice(DIA_RaDaPo_TsaHaNauhSend,"��������� ����? � ������ � ���.",DIA_RaDaPo_TsaHaNauhSend_KnowIt);
	Info_AddChoice(DIA_RaDaPo_TsaHaNauhSend,"��������� ����? ��� ���?",DIA_RaDaPo_TsaHaNauhSend_WhatIsIt);
};
func void DIA_RaDaPo_TsaHaNauhSend_YesFinal()
{
	AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_Yes_15_01");	//� ������� ����.
	//����� ���������� ���� � ������ ������
	Wld_InsertItem(ItPl_DS2P_SunAloe,WP_ITEM_SUNALOE);
	//������ � �������� "������������ ������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_FuriousAncestors,LOG_MISSION,LOG_NOTE,TOPIC_DS2P_FuriousAncestors_Start);
	MIS_DS2P_FuriousAncestors_Stage = MIS_DS2P_FuriousAncestors_Aloe;
};	
func void DIA_RaDaPo_TsaHaNauhSend_WhatIsIt()
{
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_WhatIsIt_15_01");	//��������� ����? ��� ���?
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_WhatIsIt_18_02");	//����� ������ ��������. ��� ��������� ������ ���, ��� ����� ������ ������.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_WhatIsIt_15_03");	//������ ������. ������� �������.
	DIA_RaDaPo_TsaHaNauhSend_YesFinal();
};

func void DIA_RaDaPo_TsaHaNauhSend_KnowIt()
{
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_KnowIt_15_01");	//��������� ����? � ������ � ���.
		AI_Output(other,self,"DIA_RaDaPo_TsaHaNauhSend_KnowIt_15_02");	//����� ��, ��� ������ ������ � ������ ������� ������.
	AI_Output(self,other,"DIA_RaDaPo_TsaHaNauhSend_KnowIt_18_03");	//(� ���������) ��, ������ ����, ����� ������� �������, ���� ������, ��� ������ ����-��.
	DIA_RaDaPo_TsaHaNauhSend_YesFinal();
};
// ��� ������ ������? ---------------------------------------------------------------------
//���� �� ����� ����
instance DIA_RaDaPo_WhereIsBlackTroll(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 21;
	condition = DIA_RaDaPo_WhereIsBlackTroll_condition;	
	information = DIA_RaDaPo_WhereIsBlackTroll_info;
	description = "� ��� � ��� �� ������� ����� ������ ������?";
};
func int DIA_RaDaPo_WhereIsBlackTroll_condition()
{
	if (MIS_DS2P_FuriousAncestors_Stage == MIS_DS2P_FuriousAncestors_Aloe)	{
		return TRUE;
	};
};
func void DIA_RaDaPo_WhereIsBlackTroll_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_WhereIsBlackTroll_15_01");	//� ��� � ��� �� ������� ����� ������ ������?
	AI_Output(self,other,"DIA_RaDaPo_WhereIsBlackTroll_18_02");	//���-�� � ���-��
	//UNFINISHED - �������, ��� ������ ������
	//������ � �������� "������������ ������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_FuriousAncestors,LOG_MISSION,LOG_NOTE,TOPIC_DS2P_FuriousAncestors_WhereTroll);
};
// ��� ����� ������? ---------------------------------------------------------------------
//���� �� �������� ������
instance DIA_RaDaPo_ShouldFightAlone(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 22;
	condition = DIA_RaDaPo_ShouldFightAlone_condition;	
	information = DIA_RaDaPo_ShouldFightAlone_info;
	description = "��� �������� � �������� ��������� � �����?";
};
func int DIA_RaDaPo_ShouldFightAlone_condition()
{
	if ((MIS_DS2P_FuriousAncestors_Stage >= MIS_DS2P_FuriousAncestors_Aloe) && (MIS_DS2P_FuriousAncestors_Stage < MIS_DS2P_FuriousAncestors_Fight))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_ShouldFightAlone_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_ShouldFightAlone_15_01");	//��� �������� � �������� ��������� � �����?
	AI_Output(self,other,"DIA_RaDaPo_ShouldFightAlone_18_02");	//�� ������ � ���� ����� ���� �����. ��� ������ ������.
	AI_Output(self,other,"DIA_RaDaPo_ShouldFightAlone_18_03");	//��� ���� ����� �� ����. ��� ���� �������� �� ����� ����� �������, � ��������� ����� ������ ��� ���������.
	AI_Output(self,other,"DIA_RaDaPo_ShouldFightAlone_18_04");	//���� ����� ���������� �������������. ���, ������ ��� �������� �����.
	//���� �������� ������, 2 �������� ��������, 3 ������� �����
	B_GiveInvItems(self,other,ItPl_Health_Herb_03,1);
	B_GiveInvItems(self,other,ItPl_Health_Herb_02,2);
	B_GiveInvItems(self,other,ItPl_Temp_Herb,3);
	//������ � �������� "������������ ������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_FuriousAncestors,LOG_MISSION,LOG_NOTE,TOPIC_DS2P_FuriousAncestors_AboutGhost);
};
// �������� ���� ---------------------------------------------------------------------
instance DIA_RaDaPo_AloeGot(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 23;
	condition = DIA_RaDaPo_AloeGot_condition;	
	information = DIA_RaDaPo_AloeGot_info;
	description = "";
};
func int DIA_RaDaPo_AloeGot_condition()
{
	if ((MIS_DS2P_FuriousAncestors_Stage == MIS_DS2P_FuriousAncestors_Aloe)
		 && Npc_HasItems(other, ItPl_DS2P_SunAloe)){
		return TRUE;
	};
};
func void DIA_RaDaPo_AloeGot_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_AloeGot_15_01");	//
	AI_Output(self,other,"DIA_RaDaPo_AloeGot_18_02");	//
	//������ � �������� "������������ ������"
	B_DSG_Log_OpenClose(TOPIC_DS2P_FuriousAncestors,LOG_MISSION,LOG_NOTE,TOPIC_DS2P_FuriousAncestors_WhereTroll);
};


//NS - 05/05/2016 ===========
// ��������
//===========================
instance DIA_RaDaPo_PreTeach(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 50;
	condition = DIA_RaDaPo_PreTeach_condition;	
	information = DIA_RaDaPo_PreTeach_info;
	description = "�� ������ ���� ����-������ ������� �� ��������� �����?";
};
func int DIA_RaDaPo_PreTeach_condition()
{
	if (Npc_KnowsInfo(other,DIA_RaDaPo_Hello))	{
		return TRUE;
	};
};
func void DIA_RaDaPo_PreTeach_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_PreTeach_15_01");	//�� ������ ���� ����-������ ������� �� ��������� �����?
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_02");	//���. ��� ������� ����� ����� � ��������, �������� �� ���� �� �������. 
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_03");	//��, ����, ������� ������ ����������� �� ����� � ��������, � ������ �������� ������� � ��������.
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_04");	//����� ����� ��������� �������� ������� �����, � �� ����� ������ ����.
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_05");	//����... ���-���� �, ��������, ����� ���� �������. 
	AI_Output(self,other,"DIA_RaDaPo_PreTeach_18_06");	//� ���� ��������, ��� ����� ����� ��������� ����������� �������� � ���������� �� � ������ ���� �����. ��� ������� ���� ���������� ����.
	//������ � �������� � ������� ���. ����. "������� � ������� ��������"
	B_DSG_Log_OpenClose(TOPIC_GobboTeacher,LOG_NOTE,-1,"����� ������� ��-��-�� ����� �������� ��� ���������� ����.");
	
};
// ----------------------------------------------------
instance DIA_RaDaPo_Teach_Mana(C_Info)
{
	npc = Gobbo_DS2P_RaDaPo;					nr = 51;
	permanent = TRUE;
	condition = DIA_RaDaPo_Teach_Mana_condition;	
	information = DIA_RaDaPo_Teach_Mana_info;
	description = "������ ��� ���������� �����������.";
};
func int DIA_RaDaPo_Teach_Mana_condition()
{
	if (TEACH_RaDaPo)	{
		return TRUE;
	};
};
func void DIA_RaDaPo_Teach_Mana_Menu()
{	
	Info_ClearChoices(DIA_RaDaPo_Teach_Mana);
	Info_AddChoice(DIA_RaDaPo_Teach_Mana,Dialog_Back,DIA_RaDaPo_Teach_Mana_Back);
	Info_AddChoice(DIA_RaDaPo_Teach_Mana,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_MANA_MAX,10,0),DIA_RaDaPo_Teach_Mana_10);
	Info_AddChoice(DIA_RaDaPo_Teach_Mana,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_MANA_MAX,5,0),DIA_RaDaPo_Teach_Mana_5);
	Info_AddChoice(DIA_RaDaPo_Teach_Mana,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_MANA_MAX,1,0),DIA_RaDaPo_Teach_Mana_1);
};
func void DIA_RaDaPo_Teach_Mana_info()
{	
		AI_Output(other,self,"DIA_RaDaPo_Teach_Mana_15_01");	//������ ��� ���������� �����������.
	DIA_RaDaPo_Teach_Mana_Menu();
};
func void DIA_RaDaPo_Teach_Mana_Back()
{	
	Info_ClearChoices(DIA_RaDaPo_Teach_Mana);
};
func void DIA_RaDaPo_Teach_Mana_1()
{	
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MANA_MAX);
	DIA_RaDaPo_Teach_Mana_Menu();
};
func void DIA_RaDaPo_Teach_Mana_5()
{	
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MANA_MAX);
	DIA_RaDaPo_Teach_Mana_Menu();
};
func void DIA_RaDaPo_Teach_Mana_10()
{	
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,10,T_MANA_MAX);
	DIA_RaDaPo_Teach_Mana_Menu();
};


/* UNFINISHED


� ������ ��������� ����.
��: � ������ ��������� ����.
��-��-��: ��� �������� �������!
������ � �������� "������������ ������"



����� ������� ��� �����������, ����� ��� �������.
��-��-��: ������, ������ � ��� ���� ���, ����� ������� ��������.
��� ����� ������� �������, � ����� ����� ����� ������� �� ��������. ������� ������ � ������ ����.

������ � �������� "������������ ������"
������ �� �������� ��� ����� ������ � �� ������� ����. ����� ���������� �������������.

�� ��������� ���� ����� ��� ��������� � ���.

��-��-��: �������� ������. ���� ����� ������ ��� � ���������� ��� ������: ���-��� ��. �������.
��: ���-��� ��.
//�������� �� �����.
��-��-��: ������. �����, ����� ������ �����.

��: � �����.
//���� ����� � 4 �� 8
��-��-��: ������ ��������.
//�����
��-��-��: ������ �� ������ �����. ������� �� ��������.
//���� �����
��: ���-��� ��.
������ � �������� "������������ ������"


//����� �����, �� ���������� ��� ���� � ����� ���������� ��� ��������. ��� ����� ������������ ��, ���� ���� �� ��� �� �����
//������������ ������ ���� ��������� ��������� ����� ��������-�������� 
//���� ��� ���������� ��, � ���� ��������� �������� ����� ������ ������ �� 10%

������ � �������� "������������ ������". ����� ��������.


��-��-��: ���� �������! ���� �����������.
�� � ���������� ����� ����� �����, � �� ������� ����� �������, ��� �� ����� ������ � �����.
������, ���� �� � ��������� ���������, �� ������ ������� ���� � ���� �����, ��� �������.
������ � �������� �� ������������ � ��������� ������� ��������. ������ �� ���� �� ���, ������ ������ ���� ������, ������� � ������������ �� ���� ������. 
����� ����� ���� ������, ��� ���� ������ ����.
//���� �������� �������� ����� ������� �� �������: + 30 ��������, + 5 ����.

������ � �������� � ������� ���. ����. "������"
���� ������� � ����� ��������. ������ � ���� ������ ���� ���� � ������� � ���.

//*/