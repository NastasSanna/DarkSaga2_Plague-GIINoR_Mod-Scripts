instance DIA_Symon_EXIT(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Symon_EXIT_condition;	
	information = DIA_Symon_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Symon_EXIT_condition(){	return TRUE;};
func void DIA_Symon_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 29/07/2013 ===================================
//  ����������
//===================================================
//	"������, ���� �����..."	 	nr = 1;
instance DIA_Symon_Start(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_Start_condition;	
	information = DIA_Symon_Start_info;
	description = "������, ���� �����...";
};
func int DIA_Symon_Start_condition()
{
	return TRUE;
};
func void DIA_Symon_Start_info()
{
	AI_Output(self,other,"DIA_Symon_Start_15_00");	//������, ���� �����...
		AI_Output(self,other,"DIA_Symon_Start_13_01");	//(����������) �, ��� ���� ���������, ���� ����?
	AI_Output(self,other,"DIA_Symon_Start_15_02");	//����� ����?
		AI_Output(self,other,"DIA_Symon_Start_13_03");	//������� ����: ������, �����, ����������, ���������� �������! ����� ����, ��� ���!
	AI_Output(self,other,"DIA_Symon_Start_15_04");	//� �� ���������, � ���� � ���� ���. � ���� ���� �� � �������, �� � ���� �� ��� ��� ��������?
		AI_Output(self,other,"DIA_Symon_Start_13_05");	//� � ����, ��� ���� �� ������ ��� �������, �������� �� �����, �� ���� � ������, ������ ���������� ������!
	TEACH_Symon_2H = TRUE;
};


//NS - 29/07/2013 ===================================
//  ��������
//===================================================
//	"� ���� ��� �� ����� ��������?"	 	nr = 10;
instance DIA_Symon_WhyUASoHungry(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 10;
	condition = DIA_Symon_WhyUASoHungry_condition;	
	information = DIA_Symon_WhyUASoHungry_info;
	description = "� ���� ��� �� ����� ��������?";
};
func int DIA_Symon_WhyUASoHungry_condition()
{
	if (Npc_KnowsInfo(other,DIA_Symon_Start))
	{	return TRUE;	};
};
func void DIA_Symon_WhyUASoHungry_info()
{
	AI_Output(self,other,"DIA_Symon_WhyUASoHungry_15_00");	//� ���� ��� �� ����� ��������?
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_01");	//��� ������ � ����? ����� ����� ����� � ���� �������� ������� ������ ������.
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_02");	//��� �������� �������� �������� � ����, ������ ���� ����� �������� ��� �����. ������������ ������ ����� ���� �������� �� ������ ����. 
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_03");	//� �����, ������, ������ ���������, ��� �� ��� ����� �������� ������� � ����� ������ ������ ����.
	AI_Output(self,other,"DIA_Symon_WhyUASoHungry_15_04");	//� ��� ������ ����� ������ �� �����?
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_05");	//� ����� �� ����������? � ���� ����� �������, ������ � ����������. ���-�� �� ������ �������, ��� ���������� �� �������� ����� ������.
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_06");	//�, �������, ����� ���� �����, �� ������� ��-�� ������ ������� �� �������.
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_07");	//������, �����, �������� ������? �� ��� ��������� ������� ����, � � ������� ��� � ���� �� ����� ���������� ����. ��� �������?
	AI_Output(self,other,"DIA_Symon_WhyUASoHungry_15_08");	//� �������.
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_09");	//������ ���� ����, ���� ��� ������?! �����, ������ ������ � ���!
	AI_StopProcessInfos(self);
	//������ � �������� � ������� ���. ���� "�������� � �������" 
	B_DSG_Log_OpenClose(TOPIC_PiratTrader,LOG_NOTE,-1,"����� ������ ����� �������� � ���� ������� ���� �� ����� ������� ����.");
};

//----------------------------------------------------
//	"�� ������ ����..."	 	nr = 50;
instance DIA_Symon_AboutMeat(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 50;
	condition = DIA_Symon_AboutMeat_condition;	
	information = DIA_Symon_AboutMeat_info;
	description = "�� ������ ����...";
};
func int DIA_Symon_AboutMeat_condition()
{
	if (Npc_KnowsInfo(other,DIA_Symon_WhyUASoHungry))
	{	return TRUE;	};
};
func void DIA_Symon_AboutMeat_info()
{
	Info_ClearChoices(DIA_Symon_AboutMeat);
	Info_AddChoice(DIA_Symon_AboutMeat,Dialog_Back,DIA_Symon_AboutMeat_back);
	Info_AddChoice(DIA_Symon_AboutMeat,"������ ��� ������� ����.",DIA_Symon_AboutMeat_All);
	Info_AddChoice(DIA_Symon_AboutMeat,"������ 10 ������  �������� ����.",DIA_Symon_AboutMeat_10);
	Info_AddChoice(DIA_Symon_AboutMeat,"������ 5 ������  �������� ����.",DIA_Symon_AboutMeat_5);
	Info_AddChoice(DIA_Symon_AboutMeat,"������ 1 ����� �������� ����.",DIA_Symon_AboutMeat_1);
};
func void DIA_Symon_AboutMeat_back()
{
	Info_ClearChoices(DIA_Symon_AboutMeat);
};
func void DIA_Symon_AboutMeat_Give(var int cnt)
{
	if((Npc_HasItems(other,ItFoMutton) < cnt) || (cnt == 0))
	{
		AI_Output(self,other,"DIA_Symon_AboutMeat_13_00");	//(����������) ��� ����, ������ ���� ����? ����� ������ �������?!
	}
	else
	{
		AI_Output(self,other,"DIA_Symon_AboutMeat_13_01");	//�������, ����� ���������!
		B_GiveInvItems(other, self,ItFoMutton,cnt);
	};
	Info_ClearChoices(DIA_Symon_AboutMeat);
};
func void DIA_Symon_AboutMeat_All()
{
	DIA_Symon_AboutMeat_Give(Npc_HasItems(other,ItFoMutton));
};
func void DIA_Symon_AboutMeat_10()
{
	DIA_Symon_AboutMeat_Give(10);
};
func void DIA_Symon_AboutMeat_5()
{
	DIA_Symon_AboutMeat_Give(5);
};
func void DIA_Symon_AboutMeat_1()
{
	DIA_Symon_AboutMeat_Give(1);
};


//NS - 29/07/2013 ===================================
//  ����� "��� ���� ������!" 
//===================================================
//	"������ ���� ����������� � ������?"	 	nr = 20;
instance DIA_Symon_WhatsUrJob(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 20;
	condition = DIA_Symon_WhatsUrJob_condition;	
	information = DIA_Symon_WhatsUrJob_info;
	description = "������ ���� ����������� � ������?";
};
func int DIA_Symon_WhatsUrJob_condition()
{
	if (Npc_KnowsInfo(other,DIA_Symon_Start))
	{	return TRUE;	};
};
func void DIA_Symon_WhatsUrJob_info()
{
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_00");	//������ ���� ����������� � ������?
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_01");	//����� ������� � � ������, ����� ��������� ������ ��, ��� ������, � �� �������� ������ ��������!
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_02");	//��� � ���� ��������. �� ���� �����?
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_03");	//� ��� ���� �������, ��� � �� ����������! �� �� ��� �� �������� � ��� �����, ��� � ������� �� �������.
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_04");	//� ���? ���� �� ������� �� �������, �� �������� ���� ������������?
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_05");	//�� ���, ��� �� � ����� ��� �� �� ���� ������ ��� �� ����� ����� ������! (������ �������)
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_06");	//�� �����, ��� ������ �� ���, ���� ��� �������� �����, ����������� �� � �����.
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_07");	//��? ����� ����, �� ��� � � ����������� ������ ����������? ��! �� � ����� ���� ����� �����!
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_08");	//� ��� �� �����.
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_09");	//������, ����� ���� � ���� �������� �, �� �����������, ������� ��� ���� �������, �� ��� ��� �� ���, �� ������� ��������� �� �������. ��� ����� ������! (������ �������)
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_10");	//��... � ���� �������� � � �� �������� �� ������ � ������ ����� ��� ���������� ������. ��� ���� ����� �����������?
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_11");	//�� �� ������ ��������!
	//������ ����������, ������ ��������
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Symon_Fight = TRUE;
	//������ � �������� "��� ���� ������!" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_Running,TOPIC_DS2P_MyFriendSymon_Start);
};

//----------------------------------------------------
//	�� �������� (� ���� ��� ��� �����)	 	important
instance DIA_Symon_WonBattle(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 0;
	condition = DIA_Symon_WonBattle_condition;	
	information = DIA_Symon_WonBattle_info;
	important = TRUE;
};
func int DIA_Symon_WonBattle_condition()
{
	if ((Symon_Fight == TRUE)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{	return TRUE;	};
};
func void DIA_Symon_WonBattle_info()
{
	self.aivar[AIV_LastFightComment] = TRUE;
	Symon_Fight = FALSE;
		AI_Output(self,other,"DIA_Symon_WonBattle_13_00");	//�� �� �����! ����� � �� �������� ����� ������ ������! ������!
		AI_Output(self,other,"DIA_Symon_WonBattle_13_01");	//���� �� �� ���� ������� ��� ������ � ������� �������� ��������� ��� ������, ���� �� ��������.
	//(+����)
	B_GivePlayerXP(XP_MIS_MyFriendSymon_WonFight);
	AI_Output(self,other,"DIA_Symon_WonBattle_15_02");	//(����� ���������) ��, �� �� ������ ������... � ������ �������� ���� �����..
		AI_Output(self,other,"DIA_Symon_WonBattle_13_03");	//�����, �����. � ���� ��� � ������ ���� ���� ������� ������ ���, �� � ������� ���� �������� �������������.
	//����������� �������� ��������� � �������� �� 4
	B_RaiseFightTalent(other,NPC_TALENT_1H,4);
	B_RaiseFightTalent(other,NPC_TALENT_2H,4);

	//������ � �������� "��� ���� ������!" ����� ��������
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_MyFriendSymon_SuccessWon);
};
//----------------------------------------------------
//	������ ������� ��� �� �������	 	important
instance DIA_Symon_LostBattle(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 0;
	condition = DIA_Symon_LostBattle_condition;	
	information = DIA_Symon_LostBattle_info;
	important = TRUE;
};
func int DIA_Symon_LostBattle_condition()
{
	if ((Symon_Fight == TRUE)
		&& ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)))
	{	return TRUE;	};
};
func void DIA_Symon_LostBattle_info()
{
		AI_Output(self,other,"DIA_Symon_LostBattle_13_00");	//������ �� ������, ��� ����� �������? ��-�� ��. � �� ���� �������� �� ������ ��� ��������� ������� �����. 
		AI_Output(self,other,"DIA_Symon_LostBattle_13_01");	//�� ��� � ���� ���� ��� ���. ���� ����� ��� ��� � �� ������ ������, �� � ���� ����� ������� ��������.
	Symon_Gold500 = TRUE;
	Symon_Gold_Day = Wld_GetDay_Plus(7);
	Symon_Gold_TalkDay = Symon_Gold_Day + 1;
	self.aivar[AIV_LastFightComment] = TRUE;
	Symon_Fight = FALSE;
	//������ � �������� "��� ���� ������!" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_Running,TOPIC_DS2P_MyFriendSymon_Lost);
};

//----------------------------------------------------
// �������� ��������, ����� ������ ������� �����,
// ������� 500, ����� ��� 1000 �������
func void DIA_Symon_GiveGold500_menu()		//������ - ������ ������� 500 ���.
{
	Info_ClearChoices(DIA_Symon_GiveGold);
	Info_AddChoice(DIA_Symon_GiveGold,"�� ����� �� � �����!",DIA_Symon_GiveGold_GoToHell);
	Info_AddChoice(DIA_Symon_GiveGold,"� ���� ��� ������� ������.",DIA_Symon_GiveGold_NoGold);
	if (Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(DIA_Symon_GiveGold,"��� ������.",DIA_Symon_GiveGold_Give500);
	};
	if (Wld_GetDay_Plus(12) < (Symon_Gold_Day + 3))
	{
		Info_AddChoice(DIA_Symon_GiveGold,"� ��� �� ����� ��������� ����.",DIA_Symon_GiveGold_NotReady);
	};
};
func void DIA_Symon_GiveGold1000_menu()		//������ - ������ ������� 1000 ���.
{
	Info_ClearChoices(DIA_Symon_GiveGold);
	Info_AddChoice(DIA_Symon_GiveGold,"�� ����� �� � �����!",DIA_Symon_GiveGold_GoToHell);
	if (Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Symon_GiveGold,"��� ������.",DIA_Symon_GiveGold_Give1000);
	};
};
func void DIA_Symon_GiveGold_Attack()		//�� ������� ������
{
		//UNFINISHED (� �������)
		//AI_TurnToNpc(self,);
		AI_Output(self,other,"DIA_Symon_GiveGold_GoToHell_13_02");	// ��, �����, ������ ������������? ����� ������!
	//UNFINISHED ������, � ��� 3 ���� ������ �������� �� ��, ���� ���������, �� ����� �� 
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Kill,1);
	//B_Attack(,other,AR_Kill,1);
	//B_Attack(,other,AR_Kill,1);
	//B_Attack(,other,AR_Kill,1);
	Symon_Fight = TRUE;
	Symon_Gold500 = FALSE;
	Symon_Gold1000 = FALSE;
	//������ � �������� "��� ���� ������!" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_MyFriendSymon_FailNoGold);
};

func void DIA_Symon_GiveGold_GoToHell()		//������� � ������ �������� - �� ������� ������
{
	AI_Output(self,other,"DIA_Symon_GiveGold_GoToHell_15_00");	//�� ����� �� � �����!
		AI_Output(self,other,"DIA_Symon_GiveGold_GoToHell_13_01");	//�� �����, ��������, �������� ������� ���� �������!
	DIA_Symon_GiveGold_Attack();
};
func void DIA_Symon_GiveGold_NotReady()
{
	AI_Output(self,other,"DIA_Symon_GiveGold_NotReady_15_00");	//� ��� �� ����� ��������� ����.
		AI_Output(self,other,"DIA_Symon_GiveGold_NotReady_13_01");	//���� ����� ��������, ������.
	Info_ClearChoices(DIA_Symon_GiveGold);
};
func void DIA_Symon_GiveGold_NoGold()
{
	AI_Output(self,other,"DIA_Symon_GiveGold_NoGold_15_00");	//� ���� ��� ������� ������.
		AI_Output(self,other,"DIA_Symon_GiveGold_NoGold_13_01");	//�� ��� ���, ���������! � �� ������ ����, ��� �� ��� �����!
};
func void DIA_Symon_GiveGold_500()		//������ 500, ������ ����� ��� 1000
{
	var int x;
	AI_Output(self,other,"DIA_Symon_GiveGold_Give500_15_00");	//��� ������. 
	//(+����)
	B_GivePlayerXP(XP_MIS_MyFriendSymon_GiveGold500);
	//������ 500 �����
	x = 1; if (x == 1) {
		B_GiveInvItems(other,self,ItMi_Gold,500);
	};
		AI_Output(self,other,"DIA_Symon_GiveGold_Give500_13_01");	//�������, �� �������� ������ ����� ����� �������...
	AI_Output(self,other,"DIA_Symon_GiveGold_Give500_15_02");	//���? �� �� ��������������...
		AI_Output(self,other,"DIA_Symon_GiveGold_Give500_13_03");	//(����������) ������ ���� �����, �����! � � ����� �� � ��� �� �������������.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give500_13_04");	//������ �� ��������� ��� ��� ������ �����. �, ��������, ����� � ����� ����

	Symon_Gold500 = FALSE;
	Info_ClearChoices(DIA_Symon_GiveGold);
	Info_AddChoice(DIA_Symon_GiveGold,"�� ����� �� � �����!",DIA_Symon_GiveGold_GoToHell);
	Info_AddChoice(DIA_Symon_GiveGold,"������, � ������� ������.",DIA_Symon_GiveGold_OK1000);
};
func void DIA_Symon_GiveGold_OK1000()
{
	AI_Output(self,other,"DIA_Symon_GiveGold_OK1000_15_00");	//������, � ������� ������.
	Mdl_StartFaceAni(self,"S_FRIENDLY",1,3);
		AI_Output(self,other,"DIA_Symon_GiveGold_OK1000_13_01");	//(����������) ���-�� �����. �� ������, ��� ���� �����.

	Symon_Gold1000 = TRUE;
	Symon_Gold_Day = Wld_GetDay_Plus(7);
	Symon_Gold_TalkDay = Symon_Gold_Day + 1;
	//������ � �������� "��� ���� ������!" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_Running,TOPIC_DS2P_MyFriendSymon_WantMoreGold);
	Info_ClearChoices(DIA_Symon_GiveGold);
};

func void DIA_Symon_GiveGold_1000()
{
	var int x;
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_00");	//��� ������. 
	Mdl_StartFaceAni(self,"S_FRIENDLY",1,5);
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_01");	//(���������) ������� �������! � ���� �� ��� � ��������, ��� � ������� ��� �������� ������� � ����������� ����.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_02");	//��! � ��������� ��� ����� �������, ��� ����� ���� ���� ���������!
	//�������� ������
	x = 1; if (x == 1) {
		B_GiveInvItems(other,self,ItMi_Gold,1000);
	};
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_03");	//(� ����������) ���������? � �����������, ��� �� ����� �� ����...
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_04");	//�, �������, ����� ������, �� �� ���������, ����� ������ ��� ���� ������!
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_05");	//���� � �������� ���, �� ��������� ������ ������ ������ ���� � ���. ��������, ����� � ���� �����.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_06");	//��� ����� ������ �������� ����� ��-�� ����� �������� ��������.
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_07");	//������ �������.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_08");	//��� ���, ����� � ���� �� ���� ������ ������� ������� � ����� ��� ��������, � ����� ������� ���� �������� �������. 
	//���� ������� �����
	x = 2; if (x == 2) {
		B_GiveInvItems(self,other,ItAm_DSG_Chaos_Discharged,1);
	};
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_09");	//� ��� ���? 
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_10");	//� ������ ��� �����! (�������)
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_11");	//��� �������� � ���� � ����� ������ �� ����� ���� ����� �������� ��������� �����.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_12");	//����� ��������, ��� ��� ������ ���������, �� ��� ��� �������� � � �� ���� �������� �������. �����, �� �����������.
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_13");	//�������. ���� ������� � ��������! �� ������ � �����������.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_14");	//(������� �������) ��� ��, ����! ��� �����. ��� ������� ������, ������ ���! ��-��-��! (������ �������)
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_15");	//��, ��... (��� ����) ����� �������� ��� ������ �������.

	//������ � �������� "��� ���� ������!" ����� ��������
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_MyFriendSymon_Success);
	Symon_Gold1000 = FALSE;
};

//	������� ������	 	important
instance DIA_Symon_GiveGold(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 0;
	condition = DIA_Symon_GiveGold_condition;	
	information = DIA_Symon_GiveGold_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Symon_GiveGold_condition()
{
	if (((Symon_Gold500 == TRUE) || (Symon_Gold1000 == TRUE))
		&& (Wld_GetDay_Plus(12) >= Symon_Gold_TalkDay))
	{	return TRUE;	};
};
func void DIA_Symon_GiveGold_info()
{
	if (Symon_Gold1000 == TRUE)	//1000���.
	{
		if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 1))	{	// � ����
			AI_Output(self,other,"DIA_Symon_GiveGold_13_00");	//��� ������, ������?
			Symon_Gold_TalkDay += 1;
			DIA_Symon_GiveGold1000_menu();
		}
		else	if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 2))	{	// ������� ����
			AI_Output(self,other,"DIA_Symon_GiveGold_13_01");	//��� ���� ��������� ����. ��� ������?
			DIA_Symon_GiveGold1000_menu();
		}
		else{	//��������
			AI_Output(self,other,"DIA_Symon_GiveGold_13_02");	//������, �� ��� � �� �����, ��� ���� �����, �����.
			DIA_Symon_GiveGold_Attack();
		};
	}
	else {	//500���.
		if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 1))	//� 1 ����
		{
			AI_Output(self,other,"DIA_Symon_GiveGold_13_03");	//������ ��� ����, � � ��� ��� �� ���� ������ ������.
			DIA_Symon_GiveGold500_menu();
			Symon_Gold_TalkDay += 1;
		}
		else if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 2))	//�� 2 ����
		{
			AI_Output(self,other,"DIA_Symon_GiveGold_13_04");	//��� ��� ������, ������� �����?
			DIA_Symon_GiveGold500_menu();
			Symon_Gold_TalkDay += 1;
		}
		else if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 3))	//�� 3 ����
		{
			AI_Output(self,other,"DIA_Symon_GiveGold_13_05");	//���� ����� �������, ������. � ��������� ��� ��������� - ��� ��� ������?
			DIA_Symon_GiveGold500_menu();
		}
		else	//���� �������
		{
			AI_Output(self,other,"DIA_Symon_GiveGold_13_06");	//���� ����� �������, ������.
			DIA_Symon_GiveGold_Attack();
		};
	};
};
//	�� ��� ������ 500 �����		nr = 1;	 	
instance DIA_Symon_GiveGold_Give500(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_GiveGold500_condition;	
	information = DIA_Symon_GiveGold_500;
	description = "��� ������.";
};
func int DIA_Symon_GiveGold500_condition()
{
	if ((Symon_Gold500 == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 500)
		&& (Wld_GetDay() >= Symon_Gold_Day) && (Wld_GetDay() <= (Symon_Gold_Day + 2)))
	{	return TRUE;	};
};
//	�� ��� ������ 1000 �����		nr = 1;	 	
instance DIA_Symon_GiveGold_Give1000(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_GiveGold1000_condition;	
	information = DIA_Symon_GiveGold_1000;
	description = "��� ������.";
};
func int DIA_Symon_GiveGold1000_condition()
{
	if ((Symon_Gold1000 == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 1000)
		&& (Wld_GetDay() >= Symon_Gold_Day) && (Wld_GetDay() <= (Symon_Gold_Day + 1)))
	{	return TRUE;	};
};



//NS - 18/07/2013 ===================================
//  �� ������ "���� ������"
//===================================================
// C�� ���������� � ��, ���� ������ ��� �� ������				important	
instance DIA_Symon_FightAgainstGaronLost(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 0;
	condition = DIA_Symon_FightAgainstGaronLost_condition;	
	information = DIA_Symon_FightAgainstGaronLost_info;
	important = TRUE;
};
func int DIA_Symon_FightAgainstGaronLost_condition()
{
	if ((Garon_FightPirates == Garon_FightPirates_Finished)
		//&& (self.aivar[AIV_LastFightComment] == FALSE)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{	return TRUE;};
};
func void DIA_Symon_FightAgainstGaronLost_info()
{
		AI_Output(self,other,"DIA_Symon_FightAgainstGaronLost_13_00");	//����, ���� �����! �����, ������ ���� ������ ����� �����... ����...
	self.aivar[AIV_LastFightComment] = TRUE;
	AI_StopProcessInfos(self);
};



//NS - 30/07/2013 ===================================
//  �� ������ "���������� ��������" UNFINISHED
//===================================================
// 	"��������� �������� ������ � �����." ���� ���� �����				nr = 30;	
instance DIA_Symon_StopExtortMoneyFromCimm(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 30;
	condition = DIA_Symon_StopExtortMoneyFromCimm_condition;	
	information = DIA_Symon_StopExtortMoneyFromCimm_info;
	description = "��������� �������� ������ � �����.";
};
func int DIA_Symon_StopExtortMoneyFromCimm_condition()
{
	if (MIS_DS2P_UnhappyHealer == LOG_Running)
	{	return TRUE;};
};
func void DIA_Symon_StopExtortMoneyFromCimm_info()
{
	AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_15_00");	//��������� �������� ������ � �����.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_01");	//� �� ���? �� ����������� �� ���� ����� �������? (������ �������)
	AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_15_02");	//�...
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_03");	//(����������) ���� ������. ���� � ���� ���� ����. ���� ��� ����� ����������! (����� ���������)
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_04");	//����� �� ������ ������� �� ������, � ����� �������� � ������������ �������, ���������� ��� ��� � ���, ����� ���� ���-������ ����������... ��, �� ���������.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_05");	//��� ���, ����� � ��������� ������ ��������, �� ��� ���������� ������� ������� � ������� ������ �� �������.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_06");	//������� � ���� ����� ���, � �������� ����� ������, ������ ���� ��� �� �������, ��������� ������.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_07");	//� � ����, ����� ������, ���� �� ������ �������� ������� � ���������� �����.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_08");	//������� ��, � ���� ����������� ������� ����� ����� ��������. (�������)

	//������ � �������� "���������� ��������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_SymonCondition);
};

//----------------------------------------------------
// 	"��� ������ ���� ��������?" ����� �����������				nr = 30;	
//17.03.2016 Redleha
instance DIA_Symon_WhereAGoblins(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 30;
	condition = DIA_Symon_WhereAGoblins_condition;	
	information = DIA_Symon_WhereAGoblins_info;
	description = "��� ������ ���� ��������?";
};
func int DIA_Symon_WhereAGoblins_condition()
{
	if ((MIS_DS2P_UnhappyHealer == LOG_Running) && Npc_KnowsInfo(other,DIA_Symon_StopExtortMoneyFromCimm))
	{	return TRUE;};
};
func void DIA_Symon_WhereAGoblins_info()
{
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_00");	//��� ������ ���� ��������?
		AI_Output(self,other,"DIA_Symon_WhereAGoblins_13_01");	//� � ������ ����?! �� ���� ������������, ��� ��� ���������� � �����-������ ������ ����������.
		AI_Output(self,other,"DIA_Symon_WhereAGoblins_13_02");	//���������, � ��� ������ �� ������� �������� ��������.

	//������ � �������� "���������� ��������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_GobbosNearMill);
	//UNFINISH / ��������� �������� ���������, ���������.
	Wld_InsertNpc(Gobbo_Warrior,"");
	Wld_InsertNpc(Gobbo_Warrior,"");
};
//----------------------------------------------------
// 	"����� � ����� ��������" ����� "��� ������ ���� ��������?" ��� �������� ��������				nr = 31;
//17.03.2016 Redleha
instance DIA_Symon_IveFoundYourGoblins(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 31;
	condition = DIA_Symon_IveFoundYourGoblins_condition;	
	information = DIA_Symon_IveFoundYourGoblins_info;
	description = "����� � ����� ��������.";
};
func int DIA_Symon_IveFoundYourGoblins_condition()
{
	if ((MIS_DS2P_UnhappyHealer == LOG_Running) && Npc_KnowsInfo(other,DIA_Symon_WhereAGoblins) && Npc_IsDead(Gobbo_Warrior) /*&& Npc_IsDead(Gobbo_Warrior)*/)
	{	return TRUE;};
};
func void DIA_Symon_IveFoundYourGoblins_info()
{
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_00");	//����� � ����� ��������, ����, �� ������ ��� ��� �� ����.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_00");	//�����������, �� �� �������� ��� ����.
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_01");	//������ ��� ���� �����, ��� ��� ������ ��� ������, ������� ������, ��� ���� �� ������ ������� ��� ���� ������ ����������.
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_02");	//(� ���������) �� � ���� ��, ���� �� ������� ������ ���� �� ������, � ����������� ���� � �� ��������� ��������, ��������� � ������ ���� ������, ������ ����������, �� ������ �� �� ����� �� � �� ������������ �� ����.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_01");	//(������� ��������) ���, ��. ������ ����� �� ������, ��� � ����������...
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_02");	//�� �����, ��� �� �� �������� �� ���� ��� ������, �� � ��� � ����, �������� ���� ��� ��� ��� ������.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_03");	//���������, �� ��� ����� � ����� ��� ������ ���� ������ ����������, �� �������� �������� �, � �������, ����� ���� ���-������ � ���� ���� �������� ��� �����, ����� ��������� ������� � ����.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_04");	//������ ������ ������ ��, ������� � �� ��� �� ��������. ������ ��� ���? 
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_05");	//������ ��������, ����� �� ������� � �������, � �������, ����� ������� ������ � �������, � ������ �� ������ ��������, ������ ��� �� �������� ����������� � ���� �������. 
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_06");	//� ����� ������ ���� ������ � �������� �����, ��� ������ ���� ��������.
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_03");	//��, � ��� �����, ��� ������?
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_07");	//������ ��� ��� ���� �������, ������ �������� � ����, ��������� � ������ ����������� ����� �������� � �������.
	Symon_IsNot_Problem_4Cimm = TRUe;
	//������ � �������� "���������� ��������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_PreSuccess);
};
//----------------------------------------------------
// 	"��� ������, ������� �� ����� ��������." ����� "��� ������ ���� ��������?" ��� �������� ��������				nr = 31;
//17.03.2016 Redleha
instance DIA_Symon_YourGold(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 31;
	condition = DIA_Symon_YourGold_condition;	
	information = DIA_Symon_YourGold_info;
	description = "��� ������, ������� �� ����� ��������.";
};
func int DIA_Symon_YourGold_condition()
{
	if ((MIS_DS2P_UnhappyHealer == LOG_Running) && Npc_KnowsInfo(other,DIA_Symon_WhereAGoblins) && C_Npc_DS_HasItems(other,ItMi_Gold,600) && !(Npc_IsDead(Gobbo_Warrior) /*&& Npc_IsDead(Gobbo_Wariior)*/))
	{	return TRUE;};
};
func void DIA_Symon_YourGold_info()
{
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_00");	//��� ������, ������� �� ����� ��������.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_01");	//�� ��? � ��� �� ��� ��������?
	Info_ClearChoices(DIA_Symon_YourGold);
	Info_AddChoice(DIA_Symon_YourGold, "�� ����� ������� �����.", DIA_Symon_YourGold_true);
	Info_AddChoice(DIA_Symon_YourGold, "��� ���? � ����� ��������.", DIA_Symon_YourGold_false);
};
func void DIA_Symon_YourGold_false()
{
	AI_Output(self,other,"DIA_Symon_YourGold_false_15_00");	//���  ���? � ����� ��������.
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_00");	//(������) �� ��? �������? � ���, �������� ���� �������?
	AI_Output(self,other,"DIA_Symon_YourGold_false_15_01");	//(���������) �� �����, � ���� �� ��� ������� �������.
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_01");	//�������� �� � ����, ��� ��� � ���� �����...
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_02");	//�� �� �����, ��� ����� ���� ��������, ������ ��� ������. �������� ����� �� ������ ��� - �������, ���������.
	AI_Output(self,other,"DIA_Symon_YourGold_false_15_02");	//(�������) �� ���������! ��� ������ �����?
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_03");	//(������) �� ��� ��������� � ���, �� �� ������� �������� � ���� ������ ��� ������, ������� ���� ������. �����, � �� ������ ��� �������� ���������������?
	AI_Output(self,other,"DIA_Symon_YourGold_false_15_03");	//����� � �������!
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_04");	//��� ���, ���������.
	Symon_IsNot_Problem_4Cimm = TRUe;
	//������ � �������� "���������� ��������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_PreSuccess_1);
	Info_ClearChoices(DIA_Symon_YourGold);
};
func void DIA_Symon_YourGold_true()
{
	AI_Output(self,other,"DIA_Symon_YourGold_true_15_00");	//�� ����� ������� �����, ��� ������ � ���� ������� �� ������ �������, ����� � ��� �����.
		AI_Output(self,other,"DIA_Symon_YourGold_true_13_00");	//(������� ��������) �������,  �� ���� ����� �����, ��� �� ������� �������, �� ��� �� �� ��������� � ����, � �� � ���� ���� ��������, � ��� ������ �� �������������.
	AI_Output(self,other,"DIA_Symon_YourGold_true_15_01");	//(� ���������) ����� �����-�� ������ �������, ������� ����� ������� ������?
		AI_Output(self,other,"DIA_Symon_YourGold_true_13_01");	//������, ��� �����, ��� ��� � ����� ������� �������� ��������.
	AI_Output(self,other,"DIA_Symon_YourGold_true_15_02");	//�� �� ������.
		AI_Output(self,other,"DIA_Symon_YourGold_true_13_02");	//(����� �������) �� ��� ���� ������. �� ���� � ���� ������� ������� ��� ��� ���������, �� ����� �� �������� �� ���. ����?
		AI_Output(self,other,"DIA_Symon_YourGold_true_13_03");	//��, ������, ������ �������� ������ ��������, ����� �� �������� �������.
	Symon_IsNot_Problem_4Cimm = TRUe;
	//������ � �������� "���������� ��������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_PreSuccess_2);
	Info_ClearChoices(DIA_Symon_YourGold);
};

//NS - 30/07/2013 ===================================
//  �� ������ "����� ������"
//===================================================
// 	"� ���� ���� �� ������." ���� ���� ����� � ���� ���� (+����)				nr = 40;	
instance DIA_Symon_MeatFromTamir(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 40;
	condition = DIA_Symon_MeatFromTamir_condition;	
	information = DIA_Symon_MeatFromTamir_info;
	description = "� ���� ���� �� ������.";
};
func int DIA_Symon_MeatFromTamir_condition()
{
	if((MIS_DS2P_TamirChoice == LOG_Running) && (Npc_HasItems(other,ItFoMutton) > 10))
	{	return TRUE;};
};
func void DIA_Symon_MeatFromTamir_info()
{
	var int x;
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_15_00");	//� ���� ���� �� ������.
	//������ 10 ������
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems(other,self,ItFoMutton,10);
	};
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_13_01");	//��� ������, ��� ����� ������!
	//(+����)
	B_GivePlayerXP(XP_MIS_TamirChoice_GiveMeat);
	//��������, ���
	CreateInvItems(self,ItFoMutton,2);
	AI_UseItem(self,ItFoMutton);
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_13_02");	//������ ���� ����, � ����� ��� �� ��...
	//���
	AI_UseItem(self,ItFoMutton);
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_13_03");	//(����������) ��... (����������) ����� ��� ���������, �, ��-�����, ���������! (�����)
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_13_04");	//� ���� ���� ���-������ ������?
	Info_ClearChoices(DIA_Symon_MeatFromTamir);
	Info_AddChoice(DIA_Symon_MeatFromTamir,"������, ������ ���.",DIA_Symon_MeatFromTamir_NoDrink);
	if (Npc_HasItems(other,ItFo_Milk))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(���� ������)",DIA_Symon_MeatFromTamir_Milk);
	};
	if (Npc_HasItems(other,ItFo_Wine))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(���� ����)",DIA_Symon_MeatFromTamir_Wine);
	};
	if (Npc_HasItems(other,ItFo_Addon_Rum))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(���� ���)",DIA_Symon_MeatFromTamir_Rum);
	};
	if (Npc_HasItems(other,ItFo_Addon_Grog))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(���� ����)",DIA_Symon_MeatFromTamir_Grog);
	};
	if (Npc_HasItems(other,ITFO_SAMOGON))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(���� �������)",DIA_Symon_MeatFromTamir_Samogon);
	};
	if (Npc_HasItems(other,ItFo_Booze))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(���� �����)",DIA_Symon_MeatFromTamir_Booze);
	};
	if (Npc_HasItems(other,ItFo_Beer))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(���� ����)",DIA_Symon_MeatFromTamir_Beer);
	};
	if (Npc_HasItems(other,ItFo_Water))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(���� ����)",DIA_Symon_MeatFromTamir_Water);
	};
};
func void DIA_Symon_MeatFromTamir_AboutTamir()
{
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_AboutTamir_15_00");	//��! � ��� �� ������ ������?
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_AboutTamir_13_01");	//������ ������? ���� �������!
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_AboutTamir_15_02");	//������� �����. �� ������ �� ������ ��������� � ���� ����?
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_AboutTamir_13_03");	//�� ������ � ���, � ����� �������. � ������� ������! � ������ ������ �� ����. (����������)
	AI_StopProcessInfos(self);
	//������ ���� ���������� UNFINISHED
	AI_StartState(self,ZS_Sleep,1,"");
	//������ � �������� "����� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_MeatDelivered);
	Info_ClearChoices(DIA_Symon_MeatFromTamir);
};
func void DIA_Symon_MeatFromTamir_NoDrink()
{
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_NoDrink_15_00");	//������, ������ ���
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_NoDrink_13_01");	//������ ���� ����! ��� �������!
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_NoDrink_15_02");	//� ����� ��� ������� ����? �� ������ �� ������� ���� ����� ���� ����������.
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_NoDrink_13_03");	//(����������) ����, �����. ����� ����� � ���� ������!
	DIA_Symon_MeatFromTamir_AboutTamir();
};
func void DIA_Symon_MeatFromTamir_GiveDrink(var int ItemInst)
{
	var int x;
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_GiveDrink_15_00");	//���, �����.
	//(+����)
	B_GivePlayerXP(XP_MIS_TamirChoice_GiveDrink);
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_GiveDrink_13_01");	//���� ������ ��� �����!
	//��������, ����
	x = 1; if (x == 1) {
		B_GiveInvItems(other,self,ItemInst,1);
		AI_UseItem(self,ItemInst);
	};
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_GiveDrink_13_02");	//��, ��� ������. � ������ ���� ����������. ������ � ������!
	DIA_Symon_MeatFromTamir_AboutTamir();
};
func void DIA_Symon_MeatFromTamir_Water()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Water);
};
func void DIA_Symon_MeatFromTamir_Beer()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Beer);
};
func void DIA_Symon_MeatFromTamir_Booze()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Booze);
};
func void DIA_Symon_MeatFromTamir_SAMOGON()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ITFO_SAMOGON);
};
func void DIA_Symon_MeatFromTamir_Grog()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Addon_Grog);
};
func void DIA_Symon_MeatFromTamir_Rum()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Addon_Rum);
};
func void DIA_Symon_MeatFromTamir_Wine()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Wine);
};
func void DIA_Symon_MeatFromTamir_Milk()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Milk);
};



//NS - 30/07/2013 ===================================
//  ��������
//===================================================
// 	"����� ���� ����� ���������� � ��������� �������."				nr = 40;	
var int Symon_TeachMe_Once;
func void DIA_Symon_Teach_2H_Menu()
{
	Info_ClearChoices(DIA_Symon_TeachMe);
	Info_AddChoice(DIA_Symon_TeachMe,Dialog_Back,DIA_Symon_Teach_2H_Back);
	Info_AddChoice(DIA_Symon_TeachMe,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_2H,1,-1),DIA_Symon_Teach_2H_1);
	Info_AddChoice(DIA_Symon_TeachMe,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_2H,5,-1),DIA_Symon_Teach_2H_5);
};
instance DIA_Symon_TeachMe(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 40;
	condition = DIA_Symon_TeachMe_condition;	
	information = DIA_Symon_TeachMe_info;
	description = "����� ���� ����� ���������� � ��������� �������.";
	permanent = TRUE;
};
func int DIA_Symon_TeachMe_condition()
{
	if (TEACH_Symon_2H == TRUE)
	{	return TRUE;	};
};
func void DIA_Symon_TeachMe_info()
{
	AI_Output(self,other,"DIA_Symon_TeachMe_15_00");	//����� ���� ����� ���������� � ��������� �������.
	if (Symon_TeachMe_Once == FALSE)	{
		AI_Output(self,other,"DIA_Symon_TeachMe_13_01");	//���� � ���� ���� ������, � ���� �������� ���� ���� �������.
		Symon_TeachMe_Once = TRUE;
		//������ � �������� � ������� ��� ���� "������� � �������" 
		B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"����� ������ ����� ������� ���� ����� ���������� � ��������� �������.");
	};
	DIA_Symon_Teach_2H_Menu();
};
func void DIA_Symon_Teach_2H_Back()
{
	Info_ClearChoices(DIA_Symon_TeachMe);
};
func void DIA_Symon_Teach_2H_DoIt(var int points)
{
	var int cost;
	cost = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_2H,points);
	if(Npc_HasItems(other,ItMi_Gold) >= cost)
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,points,T_MAX))
		{
			b_giveInvItems(other,self,ItMi_Gold,cost);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Symon_NoGold_13_00");	//� �� ���� ������.
	};
	DIA_Symon_Teach_2H_Menu();
};
func void DIA_Symon_Teach_2H_1()
{
	DIA_Symon_Teach_2H_DoIt(1);
};
func void DIA_Symon_Teach_2H_5()
{
	DIA_Symon_Teach_2H_DoIt(5);
};

//"� ���� � ���� ������� �����������.". ������������, ����� ������� � ����� ������� � ������������
// nr = 1

instance DIA_Symon_GrayBeardCompetition(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_GrayBeardCompetition_condition;	
	information = DIA_Symon_GrayBeardCompetition_info;
	description = "� ���� � ���� ������� �����������.";
	permanent = FALSE;
};
func int DIA_Symon_GrayBeardCompetition_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_AgainAboutSue))
	{	
		return TRUE;	
	};
};

func void DIA_Symon_GrayBeardCompetition_info()
{
	AI_Output(other,self,"DIA_Symon_GrayBeardCompetition_15_00");	//� ���� � ���� ������� �����������.
	AI_Output(self,other,"DIA_Symon_GrayBeardCompetition_13_01");	//���� ��� ����� �������, �� � ��.
	AI_Output(other,self,"DIA_Symon_GrayBeardCompetition_15_02");	//� �����-�� �������. � ��������� ��������������� � ����� �������.
	AI_Output(self,other,"DIA_Symon_GrayBeardCompetition_13_03");	//�� �� �� �� �����. �� �� ������ ����������� � ������������.
	AI_Output(other,self,"DIA_Symon_GrayBeardCompetition_15_04");	//� ���� ����������� �� ����� ������� ���, ��� �����. ���� �������� �, �� ����� ������ �������� ������� ������� ��� � �����. � ����, ����� �� ��� ���������� ���� ������.
	AI_Output(self,other,"DIA_Symon_GrayBeardCompetition_13_05");	//�� ��� ������ � ����� ������?
	AI_Output(other,self,"DIA_Symon_GrayBeardCompetition_15_06");	//�������. ����� ������ ��� �� ��������. ������� ���� � ����.
	AI_Output(self,other,"DIA_Symon_GrayBeardCompetition_13_07");	//�����, � ��������. ����� �������� ����������, ��� ����� ����������� �������� �� �����. � ���� ������ ����� � ����� �������, ����� �� ���������� �����.
	// ������ ���������� ������� ��� ������������
	B_StartOtherRoutine(self,"GB_COMPETITION");
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_02);
	if (Npc_KnowsInfo(other,DIA_Karah_GrayBeardCompetition) && Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition_Gold)) // ���� �� ��� ��������� ������� � �����
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_06);
	};
	AI_StopProcessInfos(self);
};

// ����������� ����� ��������� ������������
// nr = 1
	
instance DIA_Symon_AfterCompetition(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_AfterCompetition_condition;	
	information = DIA_Symon_AfterCompetition_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};
func int DIA_Symon_AfterCompetition_condition()
{
	if (GB_CompetitionState > 9)
	{	
		return TRUE;	
	};
};	

func void DIA_Symon_AfterCompetition_info()
{
	if (GB_CompetitionState == 10) // ������ ��
	{
		AI_Output(self,other,"DIA_Symon_AfterCompetition_13_00");	//��! �������-�� � ����� ����������� ����� �����. ��� �������, ������!
	}
	else // �������� ��
	{
		AI_Output(self,other,"DIA_Symon_AfterCompetition_13_01");	//��, � �������, ��� �������� ���.
	};
};

// ������������, ���� ���� ����� "�������"
// nr = 1
	
instance DIA_Symon_AboutConspiracy(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_AboutConspiracy_condition;	
	information = DIA_Symon_AboutConspiracy_info;
	description = "������.";
	permanent = FALSE;
};
func int DIA_Symon_AboutConspiracy_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && C_DIA_Greg_OurIdea_Know_AboutSymon)
	{	
		return TRUE;	
	};
};

func void DIA_Symon_AboutConspiracy_info()
{
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_00");	//������.
	// ������� ����� ��������� ���� � ��������� ������� � �� ��� ���
	CreateInvItems(self,ItFoMutton,1);
	AI_UseItem(self,ItFoMutton);
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_01");	//(����)
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_02");	//�����, ���������� ����, ���� � � ����� ������������?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_03");	//(� ������� ����) � ��������.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_04");	//�� ������ �������. � � ���� � ���� ���� ������� �����������.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_05");	//(����������) ������.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_06");	//�� ����� ������� ����������?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_07");	//� ���� �� ��������.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_08");	//����� ��������� �������� ������� �� ������ ����� ��������.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_09");	//�!
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_10");	//��, � ���� ���������� ����� ����������.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_11");	//�� ������ ������������ �� ���� ��������?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_12");	//����� �����, ���. ��������� ����� ���� ����, � ������ ��� ����� ���� �����.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_13");	//�, ���� ����������. � ���� �� ��� ���������� �� ����.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_14");	//������� ���. ��� ������� ����� ��� � ��������� ����� ���������� ������ �������, ���� �� ������: �������� �������, ��������� ��������� �� ���� ������ ����, ��� �������� ������ ������� ������ � ��������
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_15");	//����! ��� �������? ������ �� ������?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_16");	//��� ���� ��������� � �������� ����� ������ �����, ������� � ��������� ������ ��� ����. ����� ����� ���� �������.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_17");	//��� ����! ���� ���������� ������� ����� ������ ��� ��� ����� ���� �����. ���������!
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_18");	//���-���. � ���� ��� ������ ���� �������� ��� ���������� ��� ������ � ��������� � ������.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_19");	//����, �������, �� ����! ������, ���� ������������� ������������ ���� ���� ����� �����������.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_20");	//��, � ����, ��������� � ����, ���� ��� �� ������� ������� �����. ��� ���?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_21");	//��, � ���������� �� ���� ������, �� ����� ������������� �����. ��� ������ ������� �����.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_22");	//���?!
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_23");	//�� ��� ������, ��� ��� ������ �� ��� ������� ���������� � ������ ������, � ��� ��� ���������, ������� ������ ��� ��� ��� ������. ������ �������� �� �������� ����.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_24");	//����������� ������! �����, � ����� ��� ���� ���� ������� � ����� ���������, �?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_25");	//��, � ���� �������� ���� ���� ���� ���� �� �������� ��� ��������� ������� ���. ��� �������?
	Info_ClearChoices(DIA_Symon_AboutConspiracy);
	Info_AddChoice(DIA_Symon_AboutConspiracy,"� ����� ������ ���� �� ���.",DIA_Symon_AboutConspiracy_Sue);
	Info_AddChoice(DIA_Symon_AboutConspiracy,"��� ������.",DIA_Symon_AboutConspiracy_Gold);
};

// �����������, ���� ������� ������� "��� ������." � ������� � ��������

func void DIA_Symon_AboutConspiracy_Gold()
{
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Gold_15_00");	//��� ������.
	if (Npc_HasItems(other,ItMi_Gold) >= 2500) // ���� � �� ���� ������ �����
	{
		// ������ ������� ������
		B_GiveInvItems(other,self,ItMi_Gold,2500);
		AI_Output(self,other,"DIA_Symon_AboutConspiracy_Gold_13_01");	//��, ������-�� ���. ������ ������������ �� ��� �����, � �� �������.
		AI_Output(other,self,"DIA_Symon_AboutConspiracy_Gold_15_02");	//����� �������. � �������� �� ��������� ������ ��� ����� ������.
		B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_SymonIn);
		Symon_InConspiracy = TRUE;
		B_StartOtherRoutine(self,"START");
		if (MIS_DS2P_WinSueHand == Log_Running) // ���� ��� ���� ����� "������ ������� ���"
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Failed,"");
		};
		AI_StopProcessInfos(self);
	}
	else // ���� ������ ����� ���
	{
		AI_Output(self,other,"DIA_Symon_AboutConspiracy_Gold_13_03");	//��, ��� �� �������!
	};
};

// �����������, ���� ������� ������� "� ����� ������ ���� �� ���." � ������� �������

func void DIA_Symon_AboutConspiracy_Sue()
{
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_00");	//� ����� ������ ���� �� ���. ��� ���� ������?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_01");	//��� ����� �������� ��� �������, �� ��� �� �������� ��� �����������. � ��� ��� �������� �������� � ���, �� ��� ������ ��� ���������� ����. ����!!!
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_02");	//�� ������, ����� � ��������� � ���?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_03");	//���-���-���-���. � ���� ���� ����!
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_04");	//���� �� ������������������ ���������, �� �������� ������������ � �����������, ��������� ������, ��� ���� ����� ������������ ��� �� ��������� ���.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_05");	//��, ��� ������ �� ��������. � ��� � �������� ���.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_06");	//(��� ����) ����, ��� ������! � ���� �������� �� ����� �������? (������) ��� ��� ���� ������?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_07");	//�� ������ ������� ������� ��� � ���. �� ������� ����������, ������������, ����� �� �������� �� ����� � �������� ������� ����. ������ ��������?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_08");	//������-�� ���. ������ ��, ���� ����� ������������ ��� �� ��������� ������ �����.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_09");	//������ �� ��� ������� ����. ��� ��������, ��������, ������ ����� �� ������. � ��� ������ �. � ����� ������ ������ �����, � ���, ����������� � ������ ���������, ��������� ��� �����. ������, �?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_10");	//�������� ����������� ����, ������� ���, �������� � ��������������, ��� ���� �� ���� �����. �������� ��� ���������� ������ � ����������. � ���� �� �����������. 
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_11");	//��� �� ��������?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_12");	//(��������) �� ���� � � ������? ��� ����� ��������� ��� ������� ������� ��� � ���?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_13");	//�, ��� ���-������ ��������. ���� �� �������� �����. ����������� there.
	// UNFINISHED - ������� ��� �����������
	B_StartOtherRoutine(self,"WAITINIGFORSUE");
	Wld_InsertNpc(Wolf_Symon,""); // UNFINISHED - �������, ��� ��������� ���� (����� � ��������)
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Running,TOPIC_DS2P_WinSueHand_Start);
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "�������" � "������ ������� ���"
// nr = 1
	
instance DIA_Symon_AboutConspiracy_GoldAgain(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_AboutConspiracy_GoldAgain_condition;	
	information = DIA_Symon_AboutConspiracy_Gold;
	description = "��� ������.";
	permanent = TRUE;
};
func int DIA_Symon_AboutConspiracy_GoldAgain_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && MIS_DS2P_WinSueHand)
	{	
		return TRUE;	
	};
};

// ������������, ���� ���� ����� "������ ������� ���", � �� ������ ��� � ���
// nr = 1
	
instance DIA_Symon_SueInForrest(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_SueInForrest_condition;	
	information = DIA_Symon_SueInForrest_info;
	description = " ";
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Symon_SueInForrest_condition()
{
	if ((MIS_DS2P_WinSueHand == Log_Running) && Npc_KnowsInfo(other,DIA_SueBaby_InForrest))
	{	
		return TRUE;	
	};
};

func void DIA_Symon_SueInForrest_info()
{
	var C_NPC symonwolf;
	symonwolf = Hlp_GetNpc(WOLF_SYMON);
	AI_Output(self,other,"DIA_Symon_SueInForrest_13_00");	//�� ���?
	AI_Output(other,self,"DIA_Symon_SueInForrest_15_01");	//��� �����. � ����� ����� ���� � ��������� �����, � ����� ��� ���� ����� ��������.
	AI_Output(self,other,"DIA_Symon_SueInForrest_13_02");	//������� �� ����, �����-�� ��������� ���� ������. � ������ ������ � �������� � ������, ��� �������� �������������. ������, ���!
	AI_SetWalkMode(symonwolf,NPC_RUN);
	AI_GotoWP(symonwolf,"TESTWP"); //UNFINISHED - ������� ��������, ���� ����� ����
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"TESTWP"); //UNFINISHED - �������, ���� ����� ������
	Wld_PlayEffect("BLACK_SCREEN_SLOW", other,other,0,0,0,FALSE);
	AI_Wait(self,4);
	AI_Teleport(symonwolf,"TESTWP"); // ������������� ����� �� ��������, ���� ��� �� ����� �������� (����� �� ������ ���������� ���)
	B_KillNpc(symonwolf); // ������� �����
	AI_Teleport(self,"TESTWP"); // ������������� ������� �������
	AI_Teleport(SueBaby,"TESTWP"); // ������������� ��� � ��
	B_StartOtherRoutine(SueBaby,"NEARHERO");
	AI_TurnToNpc(self,SueBaby);
	AI_StopFX(other,"BLACK_SCREEN_SLOW");
	// UNFINISHED - ������� ����� ���������
	AI_StopProcessInfos(self);
};

// ������������, ���� ��� ���� � ������� �� ������ "������ ������� ���"
// nr = 1
	
instance DIA_Symon_SueInVillage(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_SueInVillage_condition;	
	information = DIA_Symon_SueInVillage_info;
	description = " ";
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Symon_SueInVillage_condition()
{
	if ((MIS_DS2P_WinSueHand == Log_Running)
		 && Npc_KnowsInfo(other,DIA_SueBaby_FailedPlan) && Npc_IsInState(self,ZS_TALK))
	{	
		return TRUE;	
	};
};

func void DIA_Symon_SueInVillage_info()
{
	AI_Output(self,other,"DIA_Symon_SueInVillage_13_00");	//�������, �� ����������.
	AI_Output(other,self,"DIA_Symon_SueInVillage_15_01");	//� ��� ������ ������? ��� ���� ���� ��������?
	AI_Output(self,other,"DIA_Symon_SueInVillage_13_02");	//�� ����� ���� � ��� ������ �� ����������. �����, ���� ���������.
	AI_Output(other,self,"DIA_Symon_SueInVillage_15_03");	//(��� ����) �����, ������ ���� �� ����� ������! (� ����) � ��� �� ������� ������ � ����� �����������?
	AI_Output(self,other,"DIA_Symon_SueInVillage_13_04");	//��, ��� � ��� ������ �� ����������, �� � ��� ����� �� �� ��������.
	AI_Output(other,self,"DIA_Symon_SueInVillage_15_05");	//�� �� �, ������ �������! �� �������������� � ���, ��� � ������ ���� � ���������� ������ �����.
	AI_Output(self,other,"DIA_Symon_SueInVillage_13_06");	//�� ����� ������. �� �� ��� ��� ������ ��������� ��� ��� � ��������� ������, � ����� � ���������.
	Info_ClearChoices(DIA_Symon_SueInVillage);
	Info_AddChoice(DIA_Symon_SueInVillage,"����� � �������� �� ��� ������ ����.",DIA_Symon_SueInVillage_Talk);
	Info_AddChoice(DIA_Symon_SueInVillage,"��� ������.",DIA_Symon_AboutConspiracy_Gold);
};

// �����������, ���� ������� ������� "����� � �������� �� ��� ������ ����." � ������� �������

func void DIA_Symon_SueInVillage_Talk()
{
	AI_Output(other,self,"DIA_Symon_SueInVillage_Talk_15_00");	//����� � ������� �������� �� ��� ������ ����, ����� � ����� �� �������.
	AI_Output(self,other,"DIA_Symon_SueInVillage_Talk_13_01");	//���� ����. �� ������ ��� �������.
	AI_Output(other,self,"DIA_Symon_SueInVillage_Talk_15_02");	//������, �� ���� �� ����� ����.
	AI_Output(self,other,"DIA_Symon_SueInVillage_Talk_13_03");	//�����, ������ �� ����. �, ����� ������, ������ �����.
	AI_Output(other,self,"DIA_Symon_SueInVillage_Talk_15_04");	//� �� ���������� �� ���� �������, ����� ����� �� � ��� �� ��������. ������?
	AI_StopProcessInfos(self);
};

// ������������, ���� ��� ���� � ������� �� ������ "������ ������� ���"
// nr = 1
	
instance DIA_Symon_AboutSue_AfterPlan(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_AboutSue_AfterPlan_condition;	
	information = DIA_Symon_AboutSue_AfterPlan_info;
	description = "�� ������ ���.";
	permanent = FALSE;
};

func int DIA_Symon_AboutSue_AfterPlan_condition()
{
	if (MIS_DS2P_WinSueHand == Log_Running && Npc_KnowsInfo(other,DIA_Symon_SueInVillage))
	{	
		return TRUE;	
	};
};

func void DIA_Symon_AboutSue_AfterPlan_info()
{
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_15_00");	//�� ������ ���.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_13_01");	//��? ���-�� ���������?
	Info_ClearChoices(DIA_Symon_AboutSue_AfterPlan);
	Info_AddChoice(DIA_Symon_AboutSue_AfterPlan,"���, ������.",DIA_Symon_AboutSue_AfterPlan_Nothing);
	if (Npc_KnowsInfo(other,DIA_SueBaby_AgainAboutSymon)) // ���� ��� ����������� ���������� � ��������
	{
		Info_AddChoice(DIA_Symon_AboutSue_AfterPlan,"��, � ������ ��, ��� �� � ������ ������� ��� ���.",DIA_Symon_AboutSue_AfterPlan_Done);
	};
};

// �����������, ���� ������� ������� "���, ������." � ������� � ��������

func void DIA_Symon_AboutSue_AfterPlan_Nothing()
{
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Nothing_15_00");	//���, ������.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Nothing_13_01");	//����� ���� � �����.
	Info_ClearChoices(DIA_Symon_AboutSue_AfterPlan);
};

// �����������, ���� ������� ������� "��, � ������ ��, ��� �� � ������ ������� ��� ���." � ������� � ��������

func void DIA_Symon_AboutSue_AfterPlan_Done()
{
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Done_15_00");	//��, � ������ ��, ��� �� � ������ ������� ��� ���.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Done_13_01");	//��! � ��� ������, ��� ��� ���� ��� ������ �������! ��� ���, ��������, ��������� ����. ������!
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Done_15_02");	//����! ��� ������ ������ �������?
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Done_13_03");	//�� ��, � ���������� �� �����. �� ��������.
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Done_15_04");	//������ ������� ����-���� �� ���, �� ���� � ��� ����� �  �������������.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Done_13_05");	//���? ������ ���?
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Done_15_06");	//������� � ��� ��� ���. ��� ���� ��� ������ �� ������, ��� �� ��� ��� ������ � ������ ������.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Done_13_07");	//������: �������, ����� �� ��������.
	B_StartOtherRoutine(self,"TALKWITHSUE");
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Success,TOPIC_DS2P_WinSueHand_Success);
	B_GivePlayerXP(XP_MIS_DS2P_WinSueHand);
	Symon_InConspiracy = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_SymonIn);
	AI_StopProcessInfos(self);
};