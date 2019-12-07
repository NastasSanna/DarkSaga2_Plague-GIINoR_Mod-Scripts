instance DIA_BaBaPo_EXIT(C_Info)
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 999;
	permanent = TRUE;
	condition = DIA_BaBaPo_EXIT_condition;	
	information = DIA_BaBaPo_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_BaBaPo_EXIT_condition(){	return TRUE;};
func void DIA_BaBaPo_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 14/06/2013 ===========
// ���������� 
//===========================
instance DIA_BaBaPo_WhyNotAttack(C_Info)	//"������ �� �� ��������� �� ����?"	//nr = 1;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 1;
	condition = DIA_BaBaPo_WhyNotAttack_condition;	
	information = DIA_BaBaPo_WhyNotAttack_info;
	description = "������ �� �� ��������� �� ����?";
};
func int DIA_BaBaPo_WhyNotAttack_condition(){	return TRUE;};
func void DIA_BaBaPo_WhyNotAttack_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_WhyNotAttack_15_01");	//������ �� �� ��������� �� ����?
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_02");	//��-��-�� - ����� �������. ��-��-�� �� ������ ��� �������!
	AI_Output(other,self,"DIA_BaBaPo_WhyNotAttack_15_03");	//�� �� � ���� ����� ������ �� �������, ������� �������� ������.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_04");	//����� ����, ����� ������� ��� ������. ����� ������� ��� ���� � ������� � ���� ���. ��-��-�� ������ ���������!
	AI_Output(other,self,"DIA_BaBaPo_WhyNotAttack_15_05");	//�� ��� ����� �������� ��� �����.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_06");	//��-��-�� ��������, ��-��-�� �� ����� ������������ ������ � �������. ��-��-�� ������� �����, � ��� ���� �����, ���� ������!
	AI_Output(other,self,"DIA_BaBaPo_WhyNotAttack_15_07");	//�� ����� ������� ���� �����? �� ����, ��� � �������� ���� ������ �����.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_08");	//(���������) ��-��-�� ������, ��� ������, ������� � ������� �������� ������.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_09");	//�� ������ ������� ���� �������� - ���� �� ��������� ���� ������ - �������� �������, ���� � ����������.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_10");	//������ ������� � ��� ���� ���������. �� �������� �� � ����� � ��� ������ �� ������. ����� ����� ���� � ������� ��������� ����.
		AI_Output(self,other,"DIA_BaBaPo_WhyNotAttack_18_11");	//� �� ���� ��������� ��� ���. ������� �������� ���?
	Hero_Knows_Gurun = TRUE;
};

//NS - 14/06/2013 ===========
// ��� ��������� ������, ����� ���������� 
//===========================
instance DIA_BaBaPo_WhereLager(C_Info)	//"��� ��������� ��� ������?"	//nr = 2;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 2;
	condition = DIA_BaBaPo_WhereLager_condition;	
	information = DIA_BaBaPo_WhereLager_info;
	description = "��� ��������� ��� ������?";
};
func int DIA_BaBaPo_WhereLager_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_WhyNotAttack)) {	return TRUE;};};
func void DIA_BaBaPo_WhereLager_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_WhereLager_15_00");	//��� ��������� ��� ������?
		AI_Output(self,other,"DIA_BaBaPo_WhereLager_18_01");	//�� ���� �� ������ � ������� ������. // UNFINISHED ���-�� � ���-��.
		AI_Output(self,other,"DIA_BaBaPo_WhereLager_18_02");	//� ��� ������� ���������, ���� �����, ������ � ������. �� ���� ����� ����� ������ ���.
		AI_Output(self,other,"DIA_BaBaPo_WhereLager_18_03");	//������ �� �� ������� � ������, �� ������ �����.
		AI_Output(self,other,"DIA_BaBaPo_WhereLager_18_04");	//�� ��� ������ ������� ��� ������, ������� �� ���������!
};

//NS - 14/06/2013 ===========
// � ������, ����� ���������� 
//===========================
instance DIA_BaBaPo_AboutGurun(C_Info)	//"�������� � ���� ������."	//nr = 3;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 3;
	condition = DIA_BaBaPo_AboutGurun_condition;	
	information = DIA_BaBaPo_AboutGurun_info;
	description = "�������� � ���� ������.";
};
func int DIA_BaBaPo_AboutGurun_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_WhyNotAttack)) {	return TRUE;};};
func void DIA_BaBaPo_AboutGurun_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_AboutGurun_15_00");	//�������� � ���� ������.
		AI_Output(self,other,"DIA_BaBaPo_AboutGurun_18_01");	//�� ��� ���. ����� �������� ������� �� ���, ���� ����� � ��������.
		AI_Output(self,other,"DIA_BaBaPo_AboutGurun_18_02");	//�� ����� ��� ������� ����� ���� �����, ����� ��� �� ���� ����� �� ������.
		AI_Output(self,other,"DIA_BaBaPo_AboutGurun_18_03");	//����� ����� ���������, ����� ���������. �� ����� ������� ������. �� ����������� ��� � ����� ������.
};

//NS - 14/06/2013 ===========
//  ��������� ������
//===========================
instance DIA_BaBaPo_AboutStatue(C_Info)	//"�������� � ���������."	//nr = 4;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 4;
	condition = DIA_BaBaPo_AboutStatue_condition;	
	information = DIA_BaBaPo_AboutStatue_info;
	description = "�������� � ���������.";
};
func int DIA_BaBaPo_AboutStatue_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_WhyNotAttack)) {	return TRUE;};};
func void DIA_BaBaPo_AboutStatue_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_AboutStatue_15_00");	//�������� � ���������.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_01");	//��� ��������� ������. �� ����� ��� - �������, ���������� � ����������, ������� ������ �� ����� ���� �����.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_02");	//�� ��� �������� ������� � �������� � ������� ��. ������� ������ ����� ���� � �����, �� �� �����.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_03");	//������ �����-����� �������. �� �������� ������� � ����������.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_04");	//�� �� �� ����� ���������, ������� ������ �������. �� ������ � ���, �� ���������� ������ ����.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_05");	//�� ������, ��� ��������� �������� ��������, �� ������� � ������ ��� ���� �������� ����.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_06");	//�� �������� � ����� � ������. � ������, ��� ��������� ��� ��������� ���� ���-�� �� ������.
		AI_Output(self,other,"DIA_BaBaPo_AboutStatue_18_07");	//���� �� ������ �����, ��-��-�� ������ ����� ������ ��������.
	//������ � �������� "��������� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun,LOG_MISSION,LOG_Running,TOPIC_DS2P_FigurinesGurun_Start);
	
	//����� ������� ��������� � �����
	var C_NPC Jorn;	Jorn = Hlp_GetNpc(PIR_210_DS2P_Jorn);
	CreateInvItems(Jorn,ITMI_DS2P_GobStatue_Emerald,1);
};

//NS - 14/06/2013 ===========
//  ������� ��������� ���������, ����� �������� ��� ���
//===========================

// ������ - �� 400 ����� �� ������ 2 ���������, 500 �� ���������
func void DIA_BaBaPo_ReturnStatues_GiveGold()
{
	if (MIS_ReturnedStatues_Cnt < 3)
	{
		B_GiveInvItem_red(self,other,ITMI_Gold,400,40);
	}
	else
	{
		B_GiveInvItem_red(self,other,ITMI_Gold,500,40);
	};
	MIS_ReturnedStatues_Cnt += 1;
};
instance DIA_BaBaPo_ReturnStatues(C_Info)	//"�� ������ ���������..."	//nr = 5;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 5;
	condition = DIA_BaBaPo_ReturnStatues_condition;	
	information = DIA_BaBaPo_ReturnStatues_info;
	description = "�� ������ ���������...";
};
func int DIA_BaBaPo_ReturnStatues_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_AboutStatue) 
		&& ((Npc_HasItems(other,ITMI_DS2P_GobStatue_Gold) > 0) || (Npc_HasItems(other,ITMI_DS2P_GobStatue_Silver) > 0)))
	{	return TRUE;};
};
func void DIA_BaBaPo_ReturnStatues_info()
{	
	Info_ClearChoices(DIA_BaBaPo_ReturnStatues);
	if (Npc_HasItems(other,ITMI_DS2P_GobStatue_Gold) > 0) {
		Info_AddChoice(DIA_BaBaPo_ReturnStatues, "� ����� ������� ���������.",DIA_BaBaPo_ReturnStatues_Gold);};
	if (Npc_HasItems(other,ITMI_DS2P_GobStatue_Gold) > 0) {
		Info_AddChoice(DIA_BaBaPo_ReturnStatues, "� ����� ���������� ���������.",DIA_BaBaPo_ReturnStatues_Silver);};
};

func void DIA_BaBaPo_ReturnStatues_Gold()
{	
	var int x;
	AI_Output(other,self,"DIA_BaBaPo_ReturnStatues_Gold_15_00");	//� ����� ������� ���������.
	//������ ������� ��������� 
	x = 1;	if (x == 1)	{
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_GobStatue_Gold,1,35);};
	AI_Output(self,other,"DIA_BaBaPo_ReturnStatues_Gold_18_01");	//�! ��-��-�� ��������! ������� ����� ����� ������ �������. ������� ��������� ����� ������ � ������. 
	//���� ������ 
	x = 2;	if (x == 2)	{
		DIA_BaBaPo_ReturnStatues_GiveGold();};
	x = 2;	if (x == 2)	{
		//������ � �������� "��������� ������"
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_Gold);
	};
};
func void DIA_BaBaPo_ReturnStatues_Silver()
{	
	var int x;
	AI_Output(other,self,"DIA_BaBaPo_ReturnStatues_Silver_15_00");	//� ����� ���������� ���������.
	//������ ���������� ��������� 
	x = 1;	if (x == 1)	{
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_GobStatue_Silver,1,35);};
	AI_Output(self,other,"DIA_BaBaPo_ReturnStatues_Silver_18_01");	//����� ������������� ����, �������! ��� �� ������� ���� ��� � ������. 
	//���� ������ 
	x = 2;	if (x == 2)	{
		DIA_BaBaPo_ReturnStatues_GiveGold();};
	x = 2;	if (x == 2)	{
		//������ � �������� "��������� ������"
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_Silver);
	};
};

//NS - 14/06/2013 ===========
//  ������� ������ �� ����������, ���� ����� �����
//===========================
instance DIA_BaBaPo_IllHelp(C_Info)	//"� ������ ���."	//nr = 6;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 6;
	condition = DIA_BaBaPo_IllHelp_condition;	
	information = DIA_BaBaPo_IllHelp_info;
	description = "� ������ ���.";
};
func int DIA_BaBaPo_IllHelp_condition()
{	if (MIS_DS2P_FigurinesGurun == LOG_Running)
	{	return TRUE;};
};
func void DIA_BaBaPo_IllHelp_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_IllHelp_15_00");	//� ������ ���.
		AI_Output(self,other,"DIA_BaBaPo_IllHelp_18_01");	//������� ����� ����� ������, ������� �� ����� � ����� �� ��-��-��.
	//������ � �������� "������ �������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_CunningGoblins,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_CunningGoblins_Cancel);
};

//NS - 14/06/2013 ===========
//  ������� ���������� ���������
//===========================
instance DIA_BaBaPo_ReturnEmeraldStatue(C_Info)	//"�������� � ������� ������."	//nr = 7;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 7;
	condition = DIA_BaBaPo_ReturnEmeraldStatue_condition;	
	information = DIA_BaBaPo_ReturnEmeraldStatue_info;
	description = "�������� � ������� ������.";
};
func int DIA_BaBaPo_ReturnEmeraldStatue_condition()
{	if ((MIS_DS2P_FigurinesGurun == LOG_Running) && (Npc_HasItems(other,ITMI_DS2P_GobStatue_Emerald) > 0))
	{	return TRUE;};
};
func void DIA_BaBaPo_ReturnEmeraldStatue_info()
{	
	var int x;
	AI_Output(other,self,"DIA_BaBaPo_ReturnEmeraldStatue_15_00");	//�������� � ������� ������.
		AI_Output(self,other,"DIA_BaBaPo_ReturnEmeraldStatue_18_01");	//�� ������� ���������� ���������?
	AI_Output(other,self,"DIA_BaBaPo_ReturnEmeraldStatue_15_02");	//��, ��� ���.
	x = 1;	if (x == 1)	{
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_GobStatue_Emerald,1, 35);
		//���� ������
		DIA_BaBaPo_ReturnStatues_GiveGold();
	};
		AI_Output(self,other,"DIA_BaBaPo_ReturnEmeraldStatue_18_03");	//������ �� �������� ����� ���� ��-��-�� � ���� �����.
		AI_Output(self,other,"DIA_BaBaPo_ReturnEmeraldStatue_18_04");	//���� �� ����� �� ������, ����� ������, ������� �������� ������, ��� � �������� ����. ��� ������� ���� ������ � �� �������.
	x = 2;	if (x == 2)	{
		//������ � �������� "��������� ������"
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_Emerald);
	};
};

//NS - 14/06/2013 ===========
//  ������� ��� ���������
//===========================
instance DIA_BaBaPo_AllStatues(C_Info)	//"��� ��������� �������."	//nr = 8;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 8;
	condition = DIA_BaBaPo_AllStatues_condition;	
	information = DIA_BaBaPo_AllStatues_info;
	description = "��� ��������� �������.";
};
func int DIA_BaBaPo_AllStatues_condition()
{	if ((MIS_DS2P_FigurinesGurun == LOG_Running) && (MIS_ReturnedStatues_Cnt >= 3))
	{	return TRUE;};
};
func void DIA_BaBaPo_AllStatues_info()
{	
	var int x;
	AI_Output(other,self,"DIA_BaBaPo_AllStatues_15_00");	//��� ��������� �������.
		AI_Output(self,other,"DIA_BaBaPo_AllStatues_18_01");	//��, �������. ��-��-�� ������ ����� ���� � ������ � ������ �� �����.
		AI_Output(self,other,"DIA_BaBaPo_AllStatues_18_02");	//������ ���� ���� ����������, � ������� ���� ��� �� �������� ���� �����.
	//���� 800 ������� � ������ ����������� ������ + 15 � ��������
	x = 1; if (x == 1)	{
		B_GiveInvItem_red(self,other,ItMi_Gold,800,40);
		B_GiveInvItem_red(self,other,ItRi_DS2P_BaBaPo,1,45);
		//������ � �������� "��������� ������" ����� ������� 
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_SUCCESS, TOPIC_DS2P_FigurinesGurun_Success);
	};

	// UNFINISHED
	//����� ����� ��-��-�� � ����� ������ � ������ �� ������.
	self.aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	Gobbo_withBaBaPo_1.aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	Gobbo_withBaBaPo_2.aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_StartOtherRoutine(self,"HOME");
	B_StartOtherRoutine(Gobbo_withBaBaPo_1,"HOME");
	B_StartOtherRoutine(Gobbo_withBaBaPo_2,"HOME");
};

//NS - 14/06/2013 ===========
//  ����� ����������, ����������
//===========================
instance DIA_BaBaPo_HumanSpeech(C_Info)	//"��� �� �������� �������� ���� �����?" (����������)	//nr = 9;
{
	npc = Gobbo_DS2P_BaBaPo;
	nr = 9;
	condition = DIA_BaBaPo_HumanSpeech_condition;	
	information = DIA_BaBaPo_HumanSpeech_info;
	description = "��� �� �������� �������� ���� �����?";
	permanent = TRUE;
};
func int DIA_BaBaPo_HumanSpeech_condition()
{	if (Npc_KnowsInfo(self,DIA_BaBaPo_WhyNotAttack)) {	return TRUE;};};
func void DIA_BaBaPo_HumanSpeech_info()
{	
	AI_Output(other,self,"DIA_BaBaPo_HumanSpeech_15_00");	//��� �� �������� �������� ���� �����?
		AI_Output(self,other,"DIA_BaBaPo_HumanSpeech_18_01");	//��� ����� �����, ���������� ��� ����� ����� ��� ����� ��-��-��.
		AI_Output(self,other,"DIA_BaBaPo_HumanSpeech_18_02");	//�� ����� �����, ����� ����� � ������� � ����� ������ �����, ��� ����� ���.
		AI_Output(self,other,"DIA_BaBaPo_HumanSpeech_18_03");	//������� ����� ��������� ������ � ������� ������ � ����� � �������� ������.
};

