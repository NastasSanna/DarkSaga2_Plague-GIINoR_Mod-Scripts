instance DIA_KuLa_EXIT(DIA_Proto_End)
{
	npc = Gobbo_DS2P_KuLa;
};

//////////////////////////// ����� /////////////////////////////


//===================================================

instance DIA_KuLa_Hello(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_KuLa_Hello_Info;
	description = "������.";
};
//���������: ��� �������
func void DIA_KuLa_Hello_Info()
{
		AI_Output(other,self,"DIA_KuLa_Hello_15_01");	//������.
	AI_Output(self,other,"DIA_KuLa_Hello_19_02");	//��-��, �����. ��� ����� ��-��, ���� ������ ������� � �������.
};

//===================================================
instance DIA_KuLa_WhoIsMain(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 2;
	condition = DIA_KuLa_WhoIsMain_Cond;
	information = DIA_KuLa_WhoIsMain_Info;
	description = "��� � ��� �������?";
};
//���������: ����� ����������
func int DIA_KuLa_WhoIsMain_Cond()
{
	if (Npc_KnowsInfo(other, DIA_KuLa_Hello))	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsMain_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhoIsMain_15_01");	//��� � ��� �������?
	AI_Output(self,other,"DIA_KuLa_WhoIsMain_19_02");	//��-��-���� ��� ������� �����. �� ����� ��� �����, �� ���� �������. 
	AI_Output(self,other,"DIA_KuLa_WhoIsMain_19_03");	//��� ��-��-��. ��-��-�� - ������� �����. �� �������� ����� � ������� ��-��-��.
};



//===================================================
instance DIA_KuLa_WhoIsGurun(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 3;
	condition = DIA_KuLa_WhoIsGurun_Cond;
	information = DIA_KuLa_WhoIsGurun_Info;
	description = "��� ����� �����?";
};
//���������: ����� ���� � ��� �������?�)
func int DIA_KuLa_WhoIsGurun_Cond()
{
	if (Npc_KnowsInfo(other, DIA_KuLa_WhoIsMain))	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsGurun_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//��� ����� �����?
	AI_Output(self,other,"DIA_KuLa_WhoIsGurun_19_02");	//����� ��� ������, ������� ����� � ����.
	AI_Output(self,other,"DIA_KuLa_WhoIsGurun_19_03");	//�� ����� ���� ������ ���� ������� ������ �����. � ����� ����� ����� ��� ���� �����.
};

//===================================================
instance DIA_KuLa_WhoIsOdDiOn(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 4;
	condition = DIA_KuLa_WhoIsOdDiOn_Cond;
	information = DIA_KuLa_WhoIsOdDiOn_Info;
	description = "� ��-��-�� ��� �����?";
	permanent = TRUE;
	important = TRUE;
};
//���������: ����� ���� � ��� �������?�)
func int DIA_KuLa_WhoIsOdDiOn_Cond()
{
	if (Npc_KnowsInfo(other, DIA_KuLa_WhoIsMain))	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsOdDiOn_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhoIsOdDiOn_15_01");	//� ��-��-�� ��� �����? ���� ������� ������?
	AI_Output(self,other,"DIA_KuLa_WhoIsOdDiOn_19_02");	//��-��. ��-��-�� �������. �� ���� ����, ����������.
	AI_Output(self,other,"DIA_KuLa_WhoIsOdDiOn_19_03");	//��-��-�� ����� ������� ����� �������, � ������� ������� �� ������� ��-��-��.
		AI_Output(other,self,"DIA_KuLa_WhoIsOdDiOn_15_04");	//�� ��� �����?
	AI_Output(self,other,"DIA_KuLa_WhoIsOdDiOn_19_05");	//��-��. ��-��-�� �����-����� ���� � ��-��-��. ���� ��-��-�� ���������� �������, ��� ������.
};



//////////////////////////// �����: ��������� ���� ////////////////////////////

//===================================================
instance DIA_KuLa_WhomHunting(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 10;
	condition = DIA_KuLa_WhomHunting_Cond;
	information = DIA_KuLa_WhomHunting_Info;
	description = "�� ���� �� ���������?";
};
//���������: ����� ����������
func int DIA_KuLa_WhomHunting_Cond()
{
	if (Npc_KnowsInfo(other, DIA_KuLa_Hello))	{
		return TRUE;
	};
};
func void DIA_KuLa_WhomHunting_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhomHunting_15_01");	//�� ���� �� ���������?
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_02");	//��-�� ������� �� ���������, ����, ������� �������� ���.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_03");	//��� ���� ������ ���� �������� ����. ��-�� ������� �����-����� �������� ������ ������.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_15_04");	//�� ��, ������������� ������.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_05");	//(�����) ��-��, ��-��. 
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_06");	//(�������) ��� ������ ��������� ������ ��-��-��. �� ��-��-�� ��������.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_15_07");	//��-��-�� - ���� ����?
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_08");	//��-��. ��-��-�� ����, ��-��-�� ����.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_09");	//��-�� ����� ���� ����� ����� ��������� ����� � ����� ���. ������� ��-��-��, ��� ���.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_10");	//������ ��-��-�� �������, ����� ������� ���� � ������ ���� � ��-�� �� �����.
	//����� �������� (����):
	Info_ClearChoices(DIA_KuLa_WhomHunting);
	Info_AddChoice(DIA_KuLa_WhomHunting, "� ������, ��� �� ��� ��������.", DIA_KuLa_WhomHunting_Dismiss);
	Info_AddChoice(DIA_KuLa_WhomHunting, "���� ������� ���, �� ������� ������� � �������.", DIA_KuLa_WhomHunting_Help);
};

func void DIA_KuLa_WhomHunting_Help()
{
	Info_ClearChoices(DIA_KuLa_WhomHunting);
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Help_15_01");	//���� ������� ���, �� ������� ������� � �������.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_02");	//���� ����� ������ ���, �� ��-�� ����� ��������� �����. ��� ���� ����� ������.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Help_15_03");	//���������, ��� � ���� �������.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_04");	//����� ���� ����������, ��-��-�� �� ������ �����.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_05");	//����� ������ ��-��-��: ���-��-��-��. ��-��-��-��-��. ��-��-�� ������� � ��� �� �����.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_06");	//����� ������� �����.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Help_15_07");	//(��������) ��-��-��-��. ��-��-��-��-��.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_08");	//���, �� ���. ��-��-��-��. ��-��-��-��-��.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Help_15_09");	//��-��-��-��. ��-��-��-��-��.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_10");	//��, ��� ���������. ����� ������� �����, ����� �� ������.
	//���� ��������� � ������� ����� ������
	Wld_InsertNpc(Wolf_DS2P_TaKoPi, WP_TaKoPi_Lost);
	//������ � ��������. ����� ���������� ����: ������
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_Running,TOPIC_DS2P_MissingFriend_Start);
};
func void DIA_KuLa_WhomHunting_Dismiss()
{
	Info_ClearChoices(DIA_KuLa_WhomHunting);
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Dismiss_15_01");	//� ������, ��� �� ��� ��������.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Dismiss_19_02");	//��� ��� ���.
};

//===================================================
instance DIA_KuLa_WhenSeenTaKoPi(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 11;
	condition = DIA_KuLa_WhenSeenTaKoPi_Cond;
	information = DIA_KuLa_WhenSeenTaKoPi_Info;
	description = "����� �� � ��������� ��� ����� ��-��-��?";
};
//�������: ����� ���������� ���� ������� � ��� �� �������� � ������
func int DIA_KuLa_WhenSeenTaKoPi_Cond()
{
	if (MIS_DS2P_MissingFriend == LOG_Running && !Wolf_DS2P_TaKoPi.aivar[AIV_TalkedToPlayer])	{
		return TRUE;
	};
};
func void DIA_KuLa_WhenSeenTaKoPi_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhenSeenTaKoPi_15_01");	//����� � ��������� ��� ����� ��-��-��?
	AI_Output(self,other,"DIA_KuLa_WhenSeenTaKoPi_19_02");	//��� ���� ����� �� ����� �� ��� ������� �������� ����.
	AI_Output(self,other,"DIA_KuLa_WhenSeenTaKoPi_19_03");	//��-��-�� ������ � �������� � ����� �� ������. ��-�� ����� ��� ���� ������ ���, �� �� �����.
	//������ � ��������. ����� ���������� ����: ���
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_Running,TOPIC_DS2P_MissingFriend_Where);
};

//===================================================
//����������
instance DIA_KuLa_PermTaKoPi(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 12;
	condition = DIA_KuLa_PermTaKoPi_Cond;
	information = DIA_KuLa_PermTaKoPi_Info;
	description = "��-��-�� ��� �� ��������?";
	permanent = TRUE;
};
//�������: ����� ���������� ���� ������� � ��� �� �������� � ������
func int DIA_KuLa_PermTaKoPi_Cond()
{
	if (MIS_DS2P_MissingFriend == LOG_Running && !Wolf_DS2P_TaKoPi.aivar[AIV_TalkedToPlayer])	{
		return TRUE;
	};
};
func void DIA_KuLa_PermTaKoPi_Info()
{
		AI_Output(other,self,"DIA_KuLa_PermTaKoPi_15_01");	//��-��-�� ��� �� ��������?
	AI_Output(self,other,"DIA_KuLa_PermTaKoPi_19_02");	//��-��, �����. ��-�� ����� �������.
};



//===================================================
//���������� ���
//���������: ��-��-��
instance DIA_KuLa_TaKoPiReturned(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 13;
	condition = DIA_KuLa_TaKoPiReturned_Cond;
	information = DIA_KuLa_TaKoPiReturned_Info;
	description = "*� ����� ������ �������.";
	important = TRUE;
};
//�������: ������������ � ������ � �������.
func int DIA_KuLa_TaKoPiReturned_Cond()
{
	if (Npc_GetDistToNpc(self, Wolf_DS2P_TaKoPi) < PERC_DIST_ACTIVE_MAX)	{
		return TRUE;
	};
};
func void DIA_KuLa_TaKoPiReturned_Info()
{
    var c_npc TaKoPi;   TaKoPi = Hlp_GetNpc(Wolf_DS2P_TaKoPi);
	//��-�� �������������� � �����
    AI_TurnToNpc(KuLa, TaKoPi);
	//���� ��������� � ���� � ���������� ��������� �� ��
    AI_GotoNpc(TaKoPi, KuLa);
	B_StartOtherRoutine(TaKoPi, "HOME");
	TaKoPi_FollowState = FollowState_Finished;
	AI_Output(self,other,"DIA_KuLa_TaKoPiReturned_19_01");	//(�����������) ���-��-��-��! ��-��-�� ��-��-��.
	//��-�� �������������� � ���
    AI_TurnToNpc(KuLa, hero);
	AI_Output(self,other,"DIA_KuLa_TaKoPiReturned_19_02");	//��-�� ��������� �����. ����� ���� �������. ��-�� ��� �� ����, � ��� ����� ��������.
	//���� 10 ������, 10 ������ � ����� ����, ����� � ������
	B_GiveInvItems(self, other, ItAt_Claw, 10);
	B_GiveInvItems(self, other, ItAt_Teeth, 10);
	B_GiveInvItems(self, other, ItAt_SheepFur, 1);
	B_GiveInvItems(self, other, ItAt_WolfFur, 1);
	B_GiveInvItems(self, other, ItAt_Addon_KeilerFur, 1);
	//����� ���������
	//������ ���������� � ������ ������ � ��-��-�� �� �����
	B_StartOtherRoutine(KuLa, "HUNTING");
	//������ � ��������. ����� ���������� ����: ����������
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_MissingFriend_Success);
};

//////////////////////////// �������� ////////////////////////////


//===================================================
instance DIA_KuLa_PreTrade(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 1000;
	condition = DIA_KuLa_PreTrade_Cond;
	information = DIA_KuLa_PreTrade_Info;
	description = "�� �������� ������?";
};
//���������: �������� ����� "��������� ����"
func int DIA_KuLa_PreTrade_Cond()
{
	if (MIS_DS2P_MissingFriend == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_KuLa_PreTrade_Info()
{
		AI_Output(other,self,"DIA_KuLa_PreTrade_15_01");	//�� �������� ������?
	AI_Output(self,other,"DIA_KuLa_PreTrade_19_02");	//��-��. ��-�� ������� �������, ���� ����� ������. ��-�� ��������� �� �����.
	//������ � �������� ����������
	B_LogNote(TOPIC_Trader,TOPIC_GobboVillage_Trade_KuLa);
	Gobbo_DS2P_KuLa_Trade = TRUE;
};

//===================================================
instance DIA_KuLa_Trade(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 1001;
	condition = DIA_KuLa_Trade_Cond;
	information = DIA_KuLa_Trade_Info;
	description = "������ ��� ���� ������.";
	trade = TRUE;

};
func int DIA_KuLa_Trade_Cond()
{
	if (Gobbo_DS2P_KuLa_Trade)	{
		return TRUE;
	};
};
func void DIA_KuLa_Trade_Info()
{
		AI_Output(other,self,"DIA_KuLa_Trade_15_01");	//������ ��� ���� ������.
	AI_Output(self,other,"DIA_KuLa_Trade_19_02");	//������.
};

//////////////////////////// �������� ////////////////////////////
//���� ���������� �������

//===================================================
//���������� ���
instance DIA_KuLa_PreTeach(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 100;
	condition = DIA_KuLa_PreTeach_Cond;
	information = DIA_KuLa_PreTeach_Info;
	important = TRUE;
};
//�������: �� ������� � ����� ��������
func int DIA_KuLa_PreTeach_Cond()
{
	if (Gobbos_Attitude == Gobbos_Attitude_Gobbo)	{
		return TRUE;
	};
};
func void DIA_KuLa_PreTeach_Info()
{
	AI_Output(self,other,"DIA_KuLa_PreTeach_19_01");	//��� �������, ���� ����� ����� �����? ��� ������� �����. ���� ������ �������, ��� ����� ������.
		AI_Output(other,self,"DIA_KuLa_PreTeach_15_02");	//�������. ���� � ��� ��� �� �������, ��� ��� ��� ����.
	AI_Output(self,other,"DIA_KuLa_PreTeach_19_03");	//��-�� ����� ���� �����. ������ ����, ����, ������ � ����� ������.
	//������ � �������� ���������
	B_DSG_Log_OpenClose(TOPIC_Teacher,LOG_NOTE,0,TOPIC_GobboVillage_Teach_KuLa);
	//����� �����
	Gobbo_DS2P_KuLa_Teach = TRUE;
};


//===================================================
//��� �����������
instance DIA_KuLa_Teach(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 101;
	condition = DIA_KuLa_Teach_Cond;
	information = DIA_KuLa_Teach_Info;
	description = "����� ����.";
};
//�������: ���������� �����
func int DIA_KuLa_Teach_Cond()
{
	if (Gobbo_DS2P_KuLa_Teach)	{
		return TRUE;
	};
};
func void DIA_KuLa_Teach_Info()
{
		AI_Output(other,self,"DIA_KuLa_Teach_15_01");	//����� ����.
	// UNFINISHED ������� LP
	//����� �������� (���� ��� ���������):
	//�	������� �����.
	//�	������� �����.
	//�	�������� �����.
	//�	������� ������.
	//�	�������� ���.
	//�	�����
};

