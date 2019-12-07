instance DIA_KuLa_EXIT(C_Info)
{
	npc = Gobbo_DS2P_KuLa;
	nr = 999;
	permanent = TRUE;
	condition = DIA_KuLa_EXIT_condition;	
	information = DIA_KuLa_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_KuLa_EXIT_condition(){	return TRUE;};
func void DIA_KuLa_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// ���������� 
//===========================
//������. -----------------------------
instance DIA_KuLa_Hello(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 1;
	condition = DIA_KuLa_Hello_condition;	
	information = DIA_KuLa_Hello_info;
	description = "������.";
};
func int DIA_KuLa_Hello_condition(){	return TRUE;};
func void DIA_KuLa_Hello_info()
{	
	AI_Output(other,self,"DIA_KuLa_Hello_15_01");	//������.
		AI_Output(self,other,"DIA_KuLa_Hello_18_02");	//��-��, �����. ��� ����� ��-��, ���� ������ ������� � �������.
};
//��� � ��� �������? -----------------------------
instance DIA_KuLa_WhoIsChief(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 2;
	condition = DIA_KuLa_WhoIsChief_condition;	
	information = DIA_KuLa_WhoIsChief_info;
	description = "��� � ��� �������?";
};
func int DIA_KuLa_WhoIsChief_condition()
{	
	if (Npc_KnowsInfo(other,DIA_KuLa_Hello))
	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsChief_info()
{	
	AI_Output(other,self,"DIA_KuLa_WhoIsChief_15_01");	//��� � ��� �������?
		AI_Output(self,other,"DIA_KuLa_WhoIsChief_18_02");	//��� ����� ��-��-����. ���� ������� �����, �� ����� ��� �����, �� ���� �������. ���� ��� ��-��-��. ��-��-�� ���� ������� ����� �����.
	Hero_Knows_Gurun = TRUE;
};

//��� � ��� �������? -----------------------------
instance DIA_KuLa_WhoIsGurun(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 3;
	condition = DIA_KuLa_WhoIsGurun_condition;	
	information = DIA_KuLa_WhoIsGurun_info;
	description = "��� � ��� �������?";
};
func int DIA_KuLa_WhoIsGurun_condition()
{	
	if (Npc_KnowsInfo(other,DIA_KuLa_WhoIsChief))
	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsGurun_info()
{	
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//��� ����� �����?
		AI_Output(self,other,"DIA_KuLa_WhoIsGurun_18_02");	//����� ���� ��� ������. ���� ������� ����� � ����. �� ������ ������� ���� ������� ������ ������-�����.
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//(���������) ����?
		AI_Output(self,other,"DIA_KuLa_WhoIsGurun_18_02");	//��-��. �� ������� � ��-��-��, ������� ��� ������� ����� ���� �����.
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//(��� ����) ��� �� ������, �� �������... 
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//(�����) � ��-��-�� ��� �����?
		AI_Output(self,other,"DIA_KuLa_WhoIsGurun_18_02");	//�������. ���� ����, ���� ���������. �� ���� ����������� ��� ������.
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//�� ��� �����?
		AI_Output(self,other,"DIA_KuLa_WhoIsGurun_18_02");	//��, ���� ���. ��-��-�� ������ ������ � ����, �����-�����. ���� ��-��-�� ���������� �������, �� ��������� ���.
	Hero_Knows_OdDiOn = TRUE;
};

//NS - 11/03/2016 ===========
// ����� "��������� ����" 
//===========================
//����� ���������� -----------------------------
instance DIA_KuLa_WhoHunt(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 10;
	condition = DIA_KuLa_WhoHunt_condition;	
	information = DIA_KuLa_WhoHunt_info;
	description = "�� ���� �� ���������?";
};
func int DIA_KuLa_WhoHunt_condition()
{	
	if (Npc_KnowsInfo(other,DIA_KuLa_Hello))
	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoHunt_info()
{	
	AI_Output(other,self,"DIA_KuLa_WhoHunt_15_01");	//�� ���� �� ���������?
		AI_Output(self,other,"DIA_KuLa_WhoHunt_18_02");	//��-�� ��������� �� ���������, ����, ������� �������� ���. ��� ���� �������� ���� �������� ����. ��-�� ����� ����� �������� ������ ������ �� ���.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_15_03");	//�� ��, ������������� ������ ��� ������ ������ ��� ��.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_18_04");	//(������) ��-��, ��-��. ��� ������ ��������� ������ ��-��-��, �� ��-��-�� ��������.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_15_05");	//��-��-�� - ���� ����?
		AI_Output(self,other,"DIA_KuLa_WhoHunt_18_06");	//��-��. ��-��-�� ����, ��-��-�� ����. ��-�� ����� ���� ��� ����� � ��� ��������� ����� � �������� ����, ������� ��-��-��, ��� ���. �� �������, ����� �������, ������� ���� � ������ ������ � ��-�� �� �����.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_15_07");	//����� �� ������?
		AI_Output(self,other,"DIA_KuLa_WhoHunt_18_08");	//���� ���� �����, ����� ��-�� ��������� � �������� ����. ����� ��-��-�� �������� �� ������. ��-�� ����� ��� ������ ������ ���, �� �� ����� ���� ����.
	Info_ClearChoices(DIA_KuLa_WhoHunt);
	Info_AddChoice(DIA_KuLa_WhoHunt,"� ������, ��� �� ��� ��������.",DIA_KuLa_WhoHunt_Refuse);
	Info_AddChoice(DIA_KuLa_WhoHunt,"���� ������� ���, �� ������� ������� � �������.",DIA_KuLa_WhoHunt_Help);
	//����� �����
	Wld_InsertNpc(Wolf_DS2P_TaKoPi,WP_TaKoPi_Lost);
};
func void DIA_KuLa_WhoHunt_Help()
{	
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_01");	//���� ������� ���, �� ������� ������� � �������.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_02");	//���� ����� ������� ���, �� ��-�� ����� ����������� �����. ��� ���� ����� ������.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_03");	//���������, ��� � ���� �������.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_04");	//����� ���� ����������, ��-��-�� �� ������ �����. ����� �������� ��-��-��: ���-��-��-��. ��-��-��-��-��.� ��-��-�� ������ � ���� �� �����. ����� ��������� �����.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_05");	//(�� ������) ��-��-��-��. ��-��-��-��-��.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_06");	//���, �����������. ��-��-��-��. ��-��-��-��-��.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_07");	//��-��-��-��. ��-��-��-��-��.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_08");	//��, ��� ���������. ����� �������� �����, ����� �� ������.
	Info_ClearChoices(DIA_KuLa_WhoHunt);
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_Running,TOPIC_DS2P_MissingFriend_Start);
};
func void DIA_KuLa_WhoHunt_Refuse()
{	
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_01");	//� ������, ��� �� ��� ��������.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_02");	//��� ������ ���.
	Info_ClearChoices(DIA_KuLa_WhoHunt);
};
//������������ ����� -----------------------------
//����� ������� ������
instance DIA_KuLa_RepeatPassword(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 11;
	condition = DIA_KuLa_RepeatPassword_condition;	
	information = DIA_KuLa_RepeatPassword_info;
	description = "������� ��� ���, ��� ����� ������� �����?";
	permanent = TRUE;
};
func int DIA_KuLa_RepeatPassword_condition()
{	
	//��� �� ������� ��-��-��, �� �������
	if ((MIS_DS2P_MissingFriend == LOG_Running)
		&& !((Npc_GetDistToNpc(self, Wolf_DS2P_TaKoPi) <= PERC_DIST_INTERMEDIAT) || Npc_CanSeeNpc(self,Wolf_DS2P_TaKoPi)))
	{
		return TRUE;
	};
};
func void DIA_KuLa_RepeatPassword_info()
{	
	AI_Output(other,self,"DIA_KuLa_RepeatPassword_15_01");	//������� ��� ���, ��� ����� ������� �����?
		AI_Output(self,other,"DIA_KuLa_RepeatPassword_18_02");	//� ������� ������ ����� ������. ���� ��������: ��-��-��-��. ��-��-��-��-��.
};
//������� ����� -----------------------------
instance DIA_KuLa_WolfReturned(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 12;
	condition = DIA_KuLa_WolfReturned_condition;	
	information = DIA_KuLa_WolfReturned_info;
	description = "� ����� ������ �������.";
};
func int DIA_KuLa_WolfReturned_condition()
{	
	//������� ��-��-��: �� ������ ��� ��-�� ��� �����
	if ((MIS_DS2P_MissingFriend == LOG_Running)
		&& ((Npc_GetDistToNpc(self, Wolf_DS2P_TaKoPi) <= PERC_DIST_INTERMEDIAT) || Npc_CanSeeNpc(self,Wolf_DS2P_TaKoPi)))
	{
		return TRUE;
	};
};
func void DIA_KuLa_WolfReturned_info()
{	
	//���������� ����� �����
	var C_NPC TaKoPi;	TaKoPi = Hlp_GetNpc(Wolf_DS2P_TaKoPi);
	B_StartOtherRoutine(TaKoPi,"HOME");
	Npc_ClearAIQueue(TaKoPi);
	TaKoPi.aivar[AIV_PARTYMEMBER] = FALSE;
	TaKoPi.aivar[AIV_StoryFlags] = TaKoPi.aivar[AIV_StoryFlags] | AIV_StoryFlag_SwampGoblin;
	TaKoPi_Follows = FALSE;

	AI_Output(other,self,"DIA_KuLa_WolfReturned_15_01");	//� ����� ������ �������.
		AI_Output(self,other,"DIA_KuLa_WolfReturned_18_02");	//(�����������) ���-��-��-��! ��-�� ����������� �����. ��-�� ��� ���������.
	//���� ��������� � �������
	AI_SetWalkmode(TaKoPi,NPC_RUN);
	AI_GotoNpc(TaKoPi,self);
	AI_PlayAni(TaKoPi,"R_HOWL");
		AI_Output(self,other,"DIA_KuLa_WolfReturned_18_03");	//����� ����� �������. ��-�� ��� �� ����, � ����� �����������.
	//���� ������� ������, ������� ������ � ����� ������ ����.
	B_GiveInvItems(self,other,ItAt_Claw,8);
	B_GiveInvItems(self,other,ItAt_Teeth,10);
	B_GiveInvItems(self,other,ItAt_WolfFur,3);
	B_GiveInvItems(self,other,itAt_LurkerSkin,1);
	B_GiveInvItems(self,other,ItAt_SheepFur,1);
	//������ � �������� "��������� ����". ����� ��������
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION, LOG_SUCCESS,TOPIC_DS2P_MissingFriend_Success);
	B_GivePlayerXP(XP_MIS_MissingFriend);
};

//NS - 12/03/2016 ===========
// ��������
//===========================
// -----------------------------
instance DIA_KuLa_preTrade(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 50;
	condition = DIA_KuLa_preTrade_condition;	
	information = DIA_KuLa_preTrade_info;
	description = "�� �������� ������?";
};
func int DIA_KuLa_preTrade_condition()
{	
	if (Npc_KnowsInfo(other,DIA_KuLa_Hello))
	{
		return TRUE;
	};
};
func void DIA_KuLa_preTrade_info()
{	
	AI_Output(other,self,"DIA_KuLa_preTrade_15_01");	//�� �������� ������?
		AI_Output(self,other,"DIA_KuLa_preTrade_18_02");	//��-�� ���� ������� �������, ��-�� ����� ������. ��-�� ��������� �� �����.
	TRADE_KuLa = TRUE;
	B_DSG_Log_OpenClose(TOPIC_GobboTrader,LOG_NOTE,-1,"������ ��-�� ������� ������������� ��������� ������.");
};
// -----------------------------
instance DIA_KuLa_Trade(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 51;
	condition = DIA_KuLa_Trade_condition;	
	information = DIA_KuLa_Trade_info;
	description = "������ ��� ���� ������.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_KuLa_Trade_condition()
{	
	if (TRADE_KuLa == TRUE)
	{
		return TRUE;
	};
};
func void DIA_KuLa_Trade_info()
{	
	AI_Output(other,self,"DIA_KuLa_Trade_15_01");	//������ ��� ���� ������.
		AI_Output(self,other,"DIA_KuLa_Trade_18_02");	//����� ��������.
	B_GiveTradeInv(self);	
};

//NS - 12/03/2016 ===========
// ��������
//===========================
	
	
/* UNFINISHED
�������� � �������. �������� �� ����� ����� ������ ������� ��-��.


��-��: ��� �������, ���� ����� ����� �����? ��� ������� �����. ���� ���� ������ �������, ��� ����� ������.
��: �������, ������, ��� ��� �� �������, ��� ��� ��� ����.
��-��: ��� ������� ���� �����. ������� ����, ����, ������ � ����� ������.

����� ����.
��: ����� ����.

������� �����.
������� �����.
�������� �����.
������� ������.
�������� ���.


//*/

