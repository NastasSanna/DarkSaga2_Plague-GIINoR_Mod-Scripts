instance DIA_SueBaby_EXIT(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 999;
	permanent = TRUE;
	condition = DIA_SueBaby_EXIT_condition;	
	information = DIA_SueBaby_EXIT_info;
	description = Dialog_Ende;
};

func int DIA_SueBaby_EXIT_condition()
{	
	return TRUE;
};

func void DIA_SueBaby_EXIT_info()
{	
	AI_StopProcessInfos(self);
};

// ������ ��������. �������� ������. nr = 1

instance DIA_SueBaby_Hello(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_Hello_condition;	
	information = DIA_SueBaby_Hello_info;
	description = " ";
};

func int DIA_SueBaby_Hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_Hello_info()
{	
	AI_Output(self,other,"DIA_SueBaby_Hello_13_00");	//���� ���������? ������� ������ �� �����?
	AI_Output(other,self,"DIA_SueBaby_Hello_15_01");	//������-�������? ���.
	AI_Output(self,other,"DIA_SueBaby_Hello_13_02");	//�� ��� ��� �, ���������� ����������� �������! (�������)
};

// "��� ���� �����, �������?" nr = 1

instance DIA_SueBaby_WhatsYourName(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_WhatsYourName_condition;	
	information = DIA_SueBaby_WhatsYourName_info;
	description = "��� ���� �����, �������?";
};

func int DIA_SueBaby_WhatsYourName_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_Hello))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_WhatsYourName_info()
{
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName_15_00");	//��� ���� �����, �������?
	// ���������� ������
	AI_EquipBestMeleeWeapon(self);
	// ����� ������ � ����
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_SueBaby_WhatsYourName_13_01");	//������� �� ������� ���� ���! ����� ���� ������. � ���. � ��, ��� ����. �����?
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName_15_02");	//(�������������) �����-�����. ����� ��� ����������-��?
	AI_Output(self,other,"DIA_SueBaby_WhatsYourName_13_03");	//�� �����, ����� ���� �������� ��������. ������ ��� ���� �� ����.
	// ������� ������ �� ���
	AI_RemoveWeapon(self);
};

// "������ �� �� ������, ����� ���� �������� ���?" - ���������� �����
// ������� "��� ���� �����, �������?". nr = 1

instance DIA_SueBaby_CalledBaby(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_CalledBaby_condition;	
	information = DIA_SueBaby_CalledBaby_info;
	description = "������ �� �� ������, ����� ���� �������� ���?";
};

func int DIA_SueBaby_CalledBaby_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_WhatsYourName))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_CalledBaby_info()
{
	AI_Output(other,self,"DIA_SueBaby_CalledBaby_15_00");	//������ �� �� ������, ����� ���� �������� ���?
	AI_Output(self,other,"DIA_SueBaby_CalledBaby_13_01");	//�� ������ ��� ����! � ������, ��� �� ������� � ������ �������?
};

// "�� ��� � �� �������������." - ���������� ����� �������
// "��� ���� �����, �������?". nr = 2

instance DIA_SueBaby_WhatsYourName2(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 2;
	permanent = FALSE;
	condition = DIA_SueBaby_WhatsYourName2_condition;	
	information = DIA_SueBaby_WhatsYourName2_info;
	description = "�� ��� � �� �������������.";
};

func int DIA_SueBaby_WhatsYourName2_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_WhatsYourName))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_WhatsYourName2_info()
{
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName2_15_00");	//�� ��� � �� �������������.
	AI_Output(self,other,"DIA_SueBaby_WhatsYourName2_13_01");	//������ ����� ���� ���. ������ ���.
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName2_15_02");	//����� �������. � �����
	AI_Output(self,other,"DIA_SueBaby_WhatsYourName2_13_03");	//���� ��� �� ����������!
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName2_15_02");	//(������) �� ��� ���������.
};

// "��� ����� �������� ������� ������ ����� �������?" - ���������� ����� ������� �������
// �� ���. nr = 3.

instance DIA_SueBaby_BeautifulGirl(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	condition = DIA_SueBaby_BeautifulGirl_condition;	
	information = DIA_SueBaby_BeautifulGirl_info;
	description = "��� ����� �������� ������� ������ ����� �������?";
};

func int DIA_SueBaby_BeautifulGirl_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_Hello))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_BeautifulGirl_info()
{
	AI_Output(other,self,"DIA_SueBaby_BeautifulGirl_15_00");	//��� ����� �������� ������� ������ ����� �������?
	AI_Output(self,other,"DIA_SueBaby_BeautifulGirl_13_01");	//��� �� �������� ������? � ���� �� ������ ����, ��� �������� ������� �� ����� ������� � ��������� �������?
	AI_Output(other,self,"DIA_SueBaby_BeautifulGirl_15_02");	//��, ��� �� � ����� ������. �� ����������� ���� ������. � ������ ����� ������, ��� �� ������� ����� �������.
	AI_Output(self,other,"DIA_SueBaby_BeautifulGirl_13_03");	//� ��� ��� ��� ���������� ������? � ���� ��������, �������, �� ����, ��� �� ���� ����� � ��������� ���, ������� ������ ������ ����� �����. ����� ������ ���������� �� �������� �������, ������� ������������ �������� ������� ����. ��� � � ��������� � ��� �������.
	AI_Output(other,self,"DIA_SueBaby_BeautifulGirl_15_04");	//����� ���������� �������. � ������� ������������ � �������. � ���� �� ������.
	AI_Output(self,other,"DIA_SueBaby_BeautifulGirl_13_05");	//�� �������, ����� ����� ����� ��������.
};

// "���� ���� ����� � ������" - ���������� ����� ������� ������� �� ���.
// nr = 4.

instance DIA_SueBaby_NiceClothes(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	condition = DIA_SueBaby_NiceClothes_condition;	
	information = DIA_SueBaby_NiceClothes_info;
	description = "���� ���� ����� � ������.";
};

func int DIA_SueBaby_NiceClothes_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_Hello))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_NiceClothes_info()
{
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_00");	//���� ���� ����� � ������.
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_01");	//� ���� ��� ������ �����!
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_02");	//���� ���?
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_03");	//� ���-���� �������! ���� � �������. � ��� ������ �� ����� ������, ��� ������� ������.
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_04");	//� ��� ����� ��������? ������ ������ �� �����.
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_05");	//(�����������) ���� ��� � ����! �� ��������� �������, ��� � ���� ����, �������� �� ����� �������� ������� � ������ ��������� �������� �� ��� �������, � ���� � �������, �� ��� ��������� ����������.
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_06");	//� � ������� �� ��������� ������?
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_07");	//(���) ��� �� �� ���������! �� ������ ��� ������ ������� ���� �������� �� ���� �� ������, � ���� �������� ��� ������ ����� �� ��������� ��������, ��� ���� �������� ���� ����� ����� ������ �� ���������. ������ ���� ��������� ������� �� ��� ������, � �, ��� ����, ������ ���!
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_08");	//��, �� ��������, ���������. �����, � ���� ���-�� ���� ������?
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_09");	//��, � ���, ��� ����� �����. ���� �� ��� ��������� ������, �� � � ����� �� ��������. �� ���, ����������?
	Info_ClearChoices(DIA_SueBaby_NiceClothes);
	Info_AddChoice(DIA_SueBaby_NiceClothes,"�������.",DIA_SueBaby_NiceClothes_OFC);
	Info_AddChoice(DIA_SueBaby_NiceClothes,"���-�� ��� ��� ���� �� ��������.",DIA_SueBaby_NiceClothes_BadIdea);
};

// ���������� ��� ������ ����� "�������." � ������� �� ��� - "���� ���� ����� � ������."

func void DIA_SueBaby_NiceClothes_OFC()
{
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_OFC_15_00");	//�������, �������. ����� ����!
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_OFC_13_01");	//�������! ���!
	// ������ � �������� "������ ��� ���"
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,LOG_Running,TOPIC_DS2P_Dress4Sue_Start);
	AI_StopProcessInfos(self);
};

// ���������� ��� ������ ����� "���-�� ��� ��� ���� �� ��������" � ������� �� ��� - "���� ���� ����� � ������."

func void DIA_SueBaby_NiceClothes_BadIdea()
{
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_BadIdea_15_00");	//���-�� ��� ��� ���� �� ��������.
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_BadIDea_13_01");	//�� � ���� �����!
	AI_StopProcessInfos(self);
};

// "��� �� ������� � �����?" - ���������� ��������� ������ ��� �������� ������ "�������".
// �������� ���������� �������. nr = 1.

instance DIA_SueBaby_AboutGard(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = TRUE;
	condition = DIA_SueBaby_AboutGard_condition;	
	information = DIA_SueBaby_AboutGard_info;
	description = "��� �� ������� � �����?";
};

func int DIA_SueBaby_AboutGard_condition()
{	
	if (MIS_DS2P_Conspiracy == Log_Running)
	{
		return TRUE;
	};
};

func void DIA_SueBaby_AboutGard_info()
{
	AI_Output(other,self,"DIA_SueBaby_AboutGard_15_00");	//��� �� ������� � �����?
	AI_Output(self,other,"DIA_SueBaby_AboutGard_13_01");	//����-�� ��� ������ �������?
	AI_Output(other,self,"DIA_SueBaby_AboutGard_15_02");	//��, ��� ������ ��������� ���� ������ �� ��� ����.
	AI_Output(self,other,"DIA_SueBaby_AboutGard_13_03");	//��� ������ � ��� ������ ��� ������ � �������� �� �� ������ ��������� ���������� � �� ��������. ����������!
	AI_StopProcessInfos(self);
};

// ���������� ��� ������� ������ ���� ����� ����� "������ ��� ���", � � �� ������� ������

instance DIA_SueBaby_BringDress(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = TRUE;
	condition = DIA_SueBaby_BringDress_condition;	
	information = DIA_SueBaby_BringDress_info;
	description = "������, ��� � ������.";
};

func int DIA_SueBaby_BringDress_condition()
{	
	if ((MIS_DS2P_Dress4Sue == Log_Running) && Npc_HasItems(other,0/*ITAR_PIR_DSG_BABE*/) >= 1) //UNFINISHED ��� ���� �������� �� ��� ������ ��� ���.
	{
		return TRUE;
	};
};

func void DIA_SueBaby_BringDress_info()
{
	// �� ������, ���� ����� ����� �� �����������
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_SueBaby_BringDress_15_00");	//������, ��� � ������.
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_01");	//��� ��� �������!
	/* ��� ���� ���� �������� �� ��� ������ ���
	B_GiveInvItems(other,self,ITAR_PIR_DSG_BABE,1);
	AI_EquipArmor(self,ITAR_PIR_DSG_BABE);
	*/
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_02");	//�������! ��� � ����?
	 // �������������� �� ��
	AI_TurnAway(self,other);
	// �������������� �������
	AI_TurnToNpc(self,other);
	AI_Output(other,self,"DIA_SueBaby_BringDress_15_03");	//����� �������, �� ����� �� ����� ������ ��� �����������.
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_04");	//���� ����, �� ��� ��� ��� ������. ���� �� ���-�� ���������� ���� ���� ��������.
	AI_Output(other,self,"DIA_SueBaby_BringDress_15_05");	//�� ��� ��������� �������?
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_06");	//� ��� �����. �������! ��� ��� ������� ���. �������� ������. ������� ��� �� �������, ������� �� �������.
	AI_Output(other,self,"DIA_SueBaby_BringDress_15_07");	//��, ����� �������� ������� ������ �� ��������.
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_08");	//(���������) ������! �� �� �����, ������ � ���� �� �����! ���, ������ ��� � �������� ��������������.
	// ������� � ��������� ��� 300 �������
	CreateInvItems(self,ItMi_Gold,300);
	// ������ 300 ������� ��
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,LOG_Success,TOPIC_DS2P_Dress4Sue_Start);
};

//"��� ����?". ������������, ���� ������ ����� "������", � ����� ������ ���.
// nr = 1

instance DIA_SueBaby_HowDoYouDo(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_HowDoYouDo_condition;	
	information = DIA_SueBaby_HowDoYouDo_info;
	description = "��� ����?";
};

func int DIA_SueBaby_HowDoYouDo_condition()
{	
	if ((MIS_DS2P_Dress4Sue == Log_Success) && !Npc_IsDead(PIR_208_DS2P_GrayBeard))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_HowDoYouDo_info()
{
	AI_SetWalkMode(GrayBeard,NPC_RUN);
	AI_GotoNpc(GrayBeard,other);
	B_StartOtherRoutine(GrayBeard,"SUEATTACK");
	AI_Output(other,self,"DIA_SueBaby_HowDoYouDo_15_00");	//��� ����?
	AI_Output(self,other,"DIA_SueBaby_HowDoYouDo_13_01");	//��� ������...
	AI_StopProcessInfos(self);
};

//������������ � ������, ���� � ����� ����� ���, �� � ����� ������� ���� ��� �������� ���� ����� ������
// nr = 1

instance DIA_SueBaby_GrayBeardFight_Win(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_GrayBeardFight_Win_condition;	
	information = DIA_SueBaby_GrayBeardFight_Win_info;
	description = " ";
};

func int DIA_SueBaby_GrayBeardFight_Win_condition()
{	
	if ((SueBaby_GrayBeard_Fight == 2) && (SueBaby_GrayBeard_Fight_End == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardFight_Win_info()
{
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Win_13_00");	//���, �������� ���� �����. ���� ��������� ������� ������� ������ ��� ������! ��� �����.
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_Win_15_01");	//�������� ��������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Win_13_02");	//�� ��, ������, ��������. ����, ��� �� �������!
};

//������������ � ������, ���� � ����� ����� ���, �� � ����� ������� ���� ��� �������� ����� ������ � ��
// nr = 1

instance DIA_SueBaby_GrayBeardFight_SueWin(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_GrayBeardFight_SueWin_condition;	
	information = DIA_SueBaby_GrayBeardFight_SueWin_info;
	description = " ";
};

func int DIA_SueBaby_GrayBeardFight_SueWin_condition()
{	
	if ((SueBaby_GrayBeard_Fight == 3) && (SueBaby_GrayBeard_Fight_End == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardFight_SueWin_info()
{
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_SueWin_13_00");	//�� ���, �����. � �������?
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_SueWin_15_01");	//����� ��� �������� ����� �� ����� �������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_SueWin_13_02");	//��-��, � �� ������� ������ ������. �������?
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_SueWin_15_03");	//�� ��� �������. ���� ���� �� ������, �� ������������� ������ � �������� �� �����. ������ ��������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_SueWin_13_04");	//(����)
};

//������������ � ������, ���� � ����� ����� ���, �� � ����� ������� ���� ��� �������� ����� ������ � ���
// nr = 1

instance DIA_SueBaby_GrayBeardFight_GGWin(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_GrayBeardFight_GGWin_condition;	
	information = DIA_SueBaby_GrayBeardFight_GGWin_info;
	description = " ";
};

func int DIA_SueBaby_GrayBeardFight_GGWin_condition()
{	
	if ((SueBaby_GrayBeard_Fight == 4) && (SueBaby_GrayBeard_Fight_End == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardFight_GGWin_info()
{
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_GGWin_13_00");	//��, ��� ������!
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_GGWin_15_01");	//��� ��?
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_GGWin_13_02");	//���� ��������� ����� ��� ������ ��� ������� ����� ������. ��� �������! ������ �������� ����������, ����� ������ � �� �������� ������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_GGWin_15_03");	//��, ������ �� ��������� ����� ����� ������.
};

//������������ � ������, ���� � ����� ����� ���, �� � ����� ������� ���� ��� �������� �� � ���
// nr = 1

instance DIA_SueBaby_GrayBeardFight_Lose(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_GrayBeardFight_Lose_condition;	
	information = DIA_SueBaby_GrayBeardFight_Lose_info;
	description = " ";
};

func int DIA_SueBaby_GrayBeardFight_Lose_condition()
{	
	if ((SueBaby_GrayBeard_Fight == 5) && (SueBaby_GrayBeard_Fight_End == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardFight_Lose_info()
{
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Lose_13_00");	//��, �������� ���� ������, ���� ��� ������� ������ �� ��������� �� ������, ��� �� �������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_Lose_15_01");	//�� ���?
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Lose_13_02");	//���-�� �� ������?! �������� �� ������ ��� ��������, �� � ��������� ������, � ����� ����������. ������ �� ������ ������� ���� ��������� ������. �����!
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_Lose_15_03");	//�� �����, �� ����� ������������ ��� ��������� ������ � ������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Lose_13_04");	//����-�� ����� ��������! �� �� �� ������ � �������� �������, ������� ������� ���� ������ � �����, ����� ������ ��� �������� ��������. � �� ���, �������, ������� ����� �������, ���� ������ ���� � �������������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_Lose_15_05");	//�� ��������, ��� ����� � �������.
};

//"� �� ������� �������� ������.". ������������ ����� ������� � ��������� ��� � ��
//nr = 1

instance DIA_SueBaby_FightStyle(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_FightStyle_condition;	
	information = DIA_SueBaby_FightStyle_info;
	description = "� �� ������� �������� ������.";
};

func int DIA_SueBaby_FightStyle_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_GrayBeardFight_Lose))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_FightStyle_info()
{
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_00");	//� �� ������� �������� ������.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_01");	//���� ����, ���������, ����� ������ ����� ������ �����.
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_02");	//� ����� ����� ���������?
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_03");	//�� ������, �������, �� ������. ����� ������ ��� �� ����� ��� ��������, ��� � ���������� ����� ��� ���� ����������. ��� � ����� ��� ��� ������ ������.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_04");	//��� ��������, ��� ����� ����� ����������� ��� ���. ���� ����� �����, ������� ��� �� �����������. ���� ������ � ����� �� ������ �����.
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_05");	//����� � ���� ���-�� ������?
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_06");	//� ���? ��� ���� �� ����������� �� ����� ������ � �� ������ � ���������� ��������.
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_07");	//�����, � ���� ������� ���, ����� ������ �� ���� ������ ��� � ��������?
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_08");	//���? ������ ���� �� �� ��������, � ��� ������ �������� ��� �������. �� ����� ��������� �������� � ����, ��� ����� ������ � �������!
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_09");	//�����, � ���-������ ��������.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_10");	//������? �� ��� ��������?
	Info_ClearChoices(DIA_SueBaby_FightStyle);
	Info_AddChoice(DIA_SueBaby_FightStyle,"��, ���-�� � ���������.",DIA_SueBaby_FightStyle_Deciline);
	Info_AddChoice(DIA_SueBaby_FightStyle,"��.",DIA_SueBaby_FightStyle_Accept);
};

// ����������� ��� ������ ������� "��, ���-�� � ���������." � ������� ��� "� �� ������� �������� ������."

func void DIA_SueBaby_FightStyle_Deciline()
{
	AI_Output(other,self,"DIA_SueBaby_FightStyle_Deciline_15_00");	//��, ���-�� � ���������.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_Deciline_13_01");	//������ � ��������, ��� �� ���������� �������, � �� �����������, ��� � ���. ������ ����, � ���� ������ ����.
	//��� ���������� ��������� �� �� ����� �����
	SueBaby_DecilineQuestTime = C_GetTime_Plus(24,0,1);
	AI_StopProcessInfos(self);
};

// ����������� ��� ������ ������� "��." � ������� ��� "� �� ������� �������� ������."

func void DIA_SueBaby_FightStyle_Accept()
{
	AI_Output(other,self,"DIA_SueBaby_FightStyle_Accept_15_00");	//��.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_Accept_13_01");	//������. � ������� ����, ���� ���� �� ����� ����� ������ �� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Start);
};

// �����������, ���� ��� ��������� �� ��

instance DIA_SueBaby_DontWantTalk(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = TRUE;
	important = TRUE;
	condition = DIA_SueBaby_DontWantTalk_condition;	
	information = DIA_SueBaby_DontWantTalk_info;
	description = " ";
};

func int DIA_SueBaby_DontWantTalk_condition()
{	
	if (SueBaby_DecilineQuestTime < Wld_GetPassedTime(0) && Npc_IsInState(self,ZS_Talk)) // ������ ������ 24 �����
	{
		return TRUE;
	};
};

func void DIA_SueBaby_DontWantTalk_info()
{
	if (MIS_DS2P_TeachGrayBeard == Log_Failed)
	{
		AI_Output(self,other,"DIA_SueBaby_DontWantToTalk_13_01");	//� ���� ������ ����.
	}
	else
	{
		AI_Output(self,other,"DIA_SueBaby_DontWantToTalk_13_02");	//������ ����, � ���� ������ ����.
	};
	AI_StopProcessInfos(self);
};

//"�� ������ ����� ������.".������������, ��� ������ ������ "�������� ����� ������"
//nr = 2

instance DIA_SueBaby_GrayBeardSituation(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 2;
	permanent = TRUE;
	condition = DIA_SueBaby_GrayBeardSituation_condition;	
	information = DIA_SueBaby_GrayBeardSituation_info;
	description = "�� ������ ����� ������.";
};

func int DIA_SueBaby_GrayBeardSituation_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) || (MIS_DS2P_TeachGrayBeard == Log_Failed) && (GrayBeardSituation_IsOver == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardSituation_info()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_15_00");	//�� ������ ����� ������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_13_01");	//��? ���� ���-�� ���������?
	Info_ClearChoices(self);
	Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"������ ������.",DIA_SueBaby_GrayBeardSituation_NothingNew);
	if (MIS_DS2P_TeachGrayBeard == Log_Failed) // ���� ������� ���������, �.�. �� �������� � ����� � ����� �������
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"� ���������, � �� ���������.",DIA_SueBaby_GrayBeardSituation_Failed);
	};
	if ((GrayBeard_AttackWinner == 2) && (GrayBeard_AttackNum == 3) && (SueBaby_IsKnownContinue == FALSE)) // ���� �� ������� 3 ��� � ����� �������
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"� � ������.",DIA_SueBaby_GrayBeardSituation_Continue);
	};
	if ((SueBaby_WaitingIsOver == TRUE) && (SueBaby_AboutGrayBeardSolution == FALSE)) // ���� ������ 24 ����
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"� ���-��� ��������.",DIA_SueBaby_GrayBeardSituation_Solution);
	};
	if (GB_CompetitionState == 10) // ������ ��
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"�������, ���������.",DIA_SueBaby_GrayBeardSituation_Win);
	};
	if (GB_CompetitionState == 11) // �������� ��
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"��� ����� ����.",DIA_SueBaby_GrayBeardSituation_Lose);
	};
	if (Npc_IsDead(GrayBeard)) // ���� ����� ������ �����
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"��, ����� ������ �����.",DIA_SueBaby_GrayBeardSituation_Dead);
	};
};

//�����������, ��� ������ ������� "������ ������" � ������� ��� "�� ������ ����� ������."

func void DIA_SueBaby_GrayBeardSituation_NothingNew()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_NothingNew_15_00");	//���, ������ ������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_NothingNew_13_01");	//����� ���� � �����.
	Info_ClearChoices(DIA_SueBaby_GrayBeardSituation);
};

//�����������, ��� ������ ������� "� ���������, � �� ���������." � ������� ��� "�� ������ ����� ������,"

func void DIA_SueBaby_GrayBeardSituation_Failed()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Failed_15_00");	//� ���������, � �� ���������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Failed_13_01");	//��� �, ��������, ���� � ��������. �������, ��� ���� ���������. ���� ����������� ������ ������.
	GrayBeardSituation_IsOver = TRUE;
	AI_StopProcessInfos(self);
};

//�����������, ��� ������ ������� "� � ������" � ������� ��� "�� ������ ����� ������,"

func void DIA_SueBaby_GrayBeardSituation_Continue()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Continue_15_00");	//� � ������. ��� ��������� ��� ������� ���������� ����� ������, �� ��� ��� �����, ��� � ��������� ��������� ������. ���� �������, � ������� ����.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Continue_13_01");	//� �� ��������, ��� ������ ����� ��� ������ �� ��������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Continue_15_02");	//�����, � ���� ���� �����-�� ����, ��� ��� ����������� ����� �������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Continue_13_03");	//������ � ������ ������ �� �����. ������� ������, ������� � ����� ������� ���-������ ���������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Continue_15_04");	//������.
	SueBaby_WaitTimeQuest = C_GetTime_Plus(24,0,1); // ������ �������� �� 24 ����
	SueBaby_IsKnownContinue = TRUE;
	AI_StopProcessInfos(self);
};

// �����������, ��� ������ ������� "� ���-��� ��������." � ������� ��� "�� ������ ����� ������."

func void DIA_SueBaby_GrayBeardSituation_Solution()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_00");	//� ���-��� ��������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_01");	//� ����, �� ����� ������� �� �������� ���� ����.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_02");	//��� ���� ��� ����������� ������� ��������� �� ����� ������? �� ���� ��������� �� ������ ���� �� ����.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_03");	//(�������) �� ������. ���� �� ��� ���� ��������, �� � �� ��� ��� ����� �������. ���� �� ������������� ����� �������, ���� ������ ��������� ����� ���������, �� ������������. ������ � ������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_04");	//� ��� ��� ����� ������? �� ��������, � ���� ���� ������. ����������?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_05");	//��, ������. � ������� ���� ���� ������: ���� ���� ����� �� ����� ��������� ������� ������, �� ��� ���������� ������������. ����������� ������ ��������� ���� ��� ���� �����������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_06");	//�� ������ �������� ����� ������������?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_07");	//��. ������ ��������� ������ ��, �� ����� �����. ������������ �������� � ��� �����: �������, ����� � ��������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_08");	//��, � ��� ������� ����� ������. ������, ��� ����.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_09");	//������, � ���� � ���� ������� �� �����. �������� �������� ��� ���� �� � ����� ����������. ���� �� �������� ��� ���� �� ����, �� ������ ����� �� �����. �� �������� ������?
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_10");	//�� � ���� ���� ������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_11");	//���������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_12");	//� ������ �� ������ �� �������� ����� ������������? ���� �������, ����� ���� �� �������� ���������� �� ��������� �������� ����� ������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_13");	//�� �� ������ ������, � ���� �� ����. ������. � ������� ����� �����. � ����� ������ ���-����� �������, ���� � ������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_14");	//������� � ������������ � ��� � ���� �� ���� ������� ������. ������� �� ������ ������� ��������� �� ����� ����� � �� ������ � ����� ��� ������ ���� ������ ��.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_15");	//����. � ���� � ��������, ��� �����?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_16");	//����� ��� �������� ��������� ����� ������� ����� ������, ���� �� ���������� �� ����� �����.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_17");	//� �� ������ ��������?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_18");	//��������. ���� ������ ���� �� �� ������ ������� ������, �� ��� ����� ����� ���������� �� ���� ���������. ������ ������ ����� � ������� ����� �������, ��� � ������ ������������ ������ ���. ������ �� ���� ������, �� ��� ������� �������� �� ���� ������� �����.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_19");	//������, ����� � ���������� ������� ����.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_20");	//������, ���� ������� ���� ����� ���� ����������, ������� ���������� ���������. �����, ��������, ����� ������ ����� ������ ������������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_21");	//� ����� �����. ����� ����������� ����?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_22");	//��, ������� �������, �� ���� �������� �� ���� ���������, ������� �� ���������� ���������� ���������, ���� �� ���������. ������ ���� ������ �������, �� �� �������. 
	if (!Npc_IsDead(PIR_201_DS2P_Greg))
	{
		AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_23");	//� ������ �� ����� � �� ������������ ������������������ ���� � �������. ���������� ���� �����, �� ����� � ����.
	};
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_StartCompetition);
	SueBaby_AboutGrayBeardSolution = TRUE;
	AI_StopProcessInfos(self);
};

//�����������, ���� ������� ������� "�������, ���������" � ������� ��� "�� ������ ����� ������."

func void DIA_SueBaby_GrayBeardSituation_Win()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Win_15_00");	//�������, ���������. ����� ������ ������ ���� �� �����������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Win_13_01");	//�������! � ����, ��� ���������� �� ����, ��� ���� � ���� �� ������ �� �����. ������ ��������?
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Win_15_02");	//�� �����, � ������� � ������� � ��������� � �������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Win_13_03");	//(�������) ������ ����. ���, ������ ���� ������, �� ������� ���� �� ������� ����� � ����� ��� ���������� �������.
	// ������� ��������� ������ � ���������
	CreateInvItems(self,ItAm_DS2P_SueBaby,1);
	// ���� ������ ��
	B_GiveInvItems(self,other,ItAm_DS2P_SueBaby,1);
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Win_15_04");	//�������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Win_13_05");	//����� ���� � ���� ������� ���� ����� ���������� � ���������� ������� � ������� ��� � �������� � ����� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TeachGrayBeard_Success);
	B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"������� ��� ����� ������� ���� ����� ���������� � ���������� �������, � ����� ������� ��� � ������ �������.");
	B_GivePlayerXP(XP_MIS_TeachGrayBeard_Success);
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "��� ����� ����." � ������� ��� "�� ������ ����� ������."

func void DIA_SueBaby_GrayBeardSituation_Lose()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Lose_15_00");	//��� ����� ����. � �������� ���.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Lose_13_01");	//��� �, �������, ��� ���� ���������.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Lose_15_02");	//������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Lose_13_03");	//������, ���-������ ��������. � ������ ������ ����, ����������, � ���� ������ ����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Failed,TOPIC_DS2P_TeachGrayBeard_Defeat);
	//��� ���������� ��������� �� �� ����� �����
	SueBaby_DecilineQuestTime = C_GetTime_Plus(24,0,1);
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "��, ����� ������ �����." � ������� ��� "�� ������ ����� ������."

func void DIA_SueBaby_GrayBeardSituation_Dead()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Dead_15_00");	//��, ����� ������ �����. �����, ������ �� �� ����� ���������� ���� ������������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Dead_13_01");	//���? �����? �� ���� ���?
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Dead_15_02");	//��, ��� ��������. ������ ������ � ������� ������, ��� ��� � �������� ��� �����������.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Dead_13_03");	//�� �����, ��� ��� ���� ���, �� �� ��� ����� �� �����. ��� �, ������ ������ ���� �������. ������� �� �������. ���, ������ � ������������� ���� ������.
	// ������� ��������� ������ � ���������
	CreateInvItems(self,ItAm_DS2P_SueBaby,1);
	// ���� ������ ��
	B_GiveInvItems(self,other,ItAm_DS2P_SueBaby,1);
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Dead_13_04");	//����� � ���� ������� ���� ����� ������� ���������� ����� � ������� ����� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TeachGrayBeard_Success_Alternative);
	B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"������� ��� ����� ������� ���� ����� ���������� � ���������� �������, � ����� ������� ��� � ������ �������.");
	B_GivePlayerXP(XP_MIS_TeachGrayBeard_Success);
	Info_ClearChoices(DIA_SueBaby_GrayBeardSituation);
};

// "���� ����� 300 ����� �� ��, ����� ���� ������������.". ������������, ���� �� ��� ������ ����� 300 �������

instance DIA_SueBaby_GoldForGreg(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 2;
	permanent = FALSE;
	condition = DIA_SueBaby_GoldForGreg_condition;	
	information = DIA_SueBaby_GoldForGreg_info;
	description = "���� ����� 300 ����� �� ��, ����� ���� ������������.";
};

func int DIA_SueBaby_GoldForGreg_condition()
{	
	if (Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition) && !Npc_KnowsInfo(self,DIA_Greg_GrayBeardCompetition_Gold))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GoldForGreg_info()
{
	AI_Output(other,self,"DIA_SueBaby_GoldForGreg_15_00");	//���� ����� 300 ����� �� ��, ����� ���� ������������.
	AI_Output(self,other,"DIA_SueBaby_GoldForGreg_13_01");	//��� ���� ����� �������! � ���� ���� ������ 200 ����� ������, ������, � ���������, ���. ���, ������.
	// ������� � ��������� ��� 200 ������� � ������ ��
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(other,self,"DIA_SueBaby_GoldForGreg_15_02");	//������, ��������� ���-������ ��� �����.
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "������ ������� ���"
// nr = 3

instance DIA_SueBaby_WinSueHand(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	condition = DIA_SueBaby_WinSueHand_condition;	
	information = DIA_SueBaby_WinSueHand_info;
	description = "������.";
};

func int DIA_SueBaby_WinSueHand_condition()
{	
	if (MIS_DS2P_WinSueHand == Log_Running)
	{
		return TRUE;
	};
};

func void DIA_SueBaby_WinSueHand_info()
{
	AI_Output(other,self,"DIA_SueBaby_WinSueHand_15_00");	//������. ��� ����������?
	AI_Output(self,other,"DIA_SueBaby_WinSueHand_13_01");	//������, ���� ������. �� ���� ������� ���������� ������� ����������� ���.
	AI_Output(other,self,"DIA_SueBaby_WinSueHand_15_02");	//���, �����, ����������� �� ����? ���� ���-�� ����� ���������.
	AI_Output(self,other,"DIA_SueBaby_WinSueHand_13_03");	//�� ���� ��� ������, ������? � ����� ���� �� �������� ������� �� �������� ����� ������. ���� ���, ��������. ������, ���� �� �������.
	AI_Output(other,self,"DIA_SueBaby_WinSueHand_15_04");	//��� �������?
	AI_Output(self,other,"DIA_SueBaby_WinSueHand_13_05");	//�����, ��� ����� ��� ����� ����� ������ ���� ����� ������� ������, ��� ���� �����-�� �����������. ���� ������?
	AI_Output(other,self,"DIA_SueBaby_WinSueHand_15_06");	//���� ����� ������. �����!
	B_StartOtherRoutine(self,"FOLLOW");
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Running,TOPIC_DS2P_WinSueHand_InForrest);
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "������ ������� ���", � �� ������ �� � ���
// nr = 3

instance DIA_SueBaby_InForrest(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_InForrest_condition;	
	information = DIA_SueBaby_InForrest_info;
	description = " ";
};

func int DIA_SueBaby_InForrest_condition()
{	
	if ((MIS_DS2P_WinSueHand == Log_Running) && Npc_KnowsInfo(other,DIA_SueBaby_WinSueHand)
		 && (Npc_GetDistToWP(other,"TESTWP") <= 600)) //UNFINISHED - ������� ��� ����������� ���� ��� � �� �� ������ "������ ������� ���"
	{
		return TRUE;
	};
};

func void DIA_SueBaby_InForrest_info()
{
	AI_Output(self,other,"DIA_SueBaby_InForrest_13_00");	//���, ���������� ���������. ��� �� �� ��������� �� ����������.
	AI_Output(other,self,"DIA_SueBaby_InForrest_15_01");	//���� �����������.
	AI_Output(self,other,"DIA_SueBaby_InForrest_13_02");	//��. ��� ����� ������� �������?
	AI_Output(other,self,"DIA_SueBaby_InForrest_15_03");	//������. �� ������ �� ����������. ������, � ��������� ��������, ������? ����� �� �������.
	AI_Output(self,other,"DIA_SueBaby_InForrest_13_04");	//������, ���.
	B_StartOtherRoutine(self,"WAITINGFORSYMON");
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "������ ������� ���", � ������ � ������ �������� � ���
// nr = 3

instance DIA_SueBaby_FailedPlan(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_FailedPlan_condition;	
	information = DIA_SueBaby_FailedPlan_info;
	description = " ";
};

func int DIA_SueBaby_FailedPlan_condition()
{	
	if ((MIS_DS2P_WinSueHand == Log_Running) && Npc_KnowsInfo(other,DIA_Symon_SueInForrest)) 
	{
		return TRUE;
	};
};

func void DIA_SueBaby_FailedPlan_info()
{
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_00");	//� ��� � ������!
	AI_Output(other,self,"DIA_SueBaby_FailedPlan_15_01");	//�, � ��� ������ ������������ ���������.
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_02");	//�� ��� ���, � ��� ���� ����. ����� ������, � ����� ������ ������ ������ �������� ���� ���������. �� �� ��� ������� ����������, ���������� ������. ��� �� ������ ���������� ����������� � ����������� �������?
	AI_Output(other,self,"DIA_SueBaby_FailedPlan_15_03");	//��� ���� �����.
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_04");	//��, �����? ��-��.
	AI_TurnToNpc(self,Symon);
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_05");	//� ������ ������ ���� �����������, ������. ���� �� ��� ���� ��� ����������� �� ��� ���������, � ���� ��� ����� ����������. �� ������, ��� � �������, � �� �������. �����?
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_06");	//� �� ���� �����������. ������, ������ �����������, ������ �������� �������, �����, ���� ���������� �������.
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "������ ������� ���", � ������ � ������ �������� � ���
// nr = 1

instance DIA_SueBaby_AboutSymonPlan(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_AboutSymonPlan_condition;	
	information = DIA_SueBaby_AboutSymonPlan_info;
	description = "������ �������.";
};

func int DIA_SueBaby_AboutSymonPlan_condition()
{	
	if ((MIS_DS2P_WinSueHand == Log_Running) && Npc_KnowsInfo(other,DIA_Symon_SueInVillage)) 
	{
		return TRUE;
	};
};

func void DIA_SueBaby_AboutSymonPlan_info()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_15_00");	//������ �������.
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_13_01");	//��� ���� ����?
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_15_02");	//�������, ��� ����� ����� �����, �� ����� �� ���������� ���� ������ ������ ����?
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_13_03");	//���, ��� � ��� ��� ���. � � ���� ������� ����������� �� ����.
	Info_ClearChoices(DIA_SueBaby_AboutSymonPlan);
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"(�����)",DIA_SueBaby_AboutSymonPlan_Back);
	if ((MIS_DS2P_Dress4Sue == Log_Success) || (MIS_DS2P_TeachGrayBeard == Log_Success)) // ���� �������� ���� 1 ����� ���
	{
		Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"� ���� ���� ����� �������.",DIA_SueBaby_AboutSymonPlan_Help);
	};
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"����� �������� ������. � ���� � �� ���.",DIA_SueBaby_AboutSymonPlan_Deal);
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"�����, �����������?",DIA_SueBaby_AboutSymonPlan_Think);
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"� ���� �������.",DIA_SueBaby_AboutSymonPlan_Pay);
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"������ �� ��� �����������?",DIA_SueBaby_AboutSymonPlan_Why);
};

// ������������, ���� ������� "(�����)" � ������� ���

func void DIA_SueBaby_AboutSymonPlan_Back()
{
	Info_ClearChoices(DIA_SueBaby_AboutSymonPlan);
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Running,TOPIC_DS2P_WinSueHand_NoWays);
};

// ������������, ���� ������� "� ���� ���� ����� �������." � ������� ���

func void DIA_SueBaby_AboutSymonPlan_Help()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Help_15_00");	//� ���� ���� ����� �������.
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Help_13_01");	//� � ���� ���������� �� ���, �� ����������� � �������� ��� ��, �������. �� ����� � �� �����, ���� ���� �� �� ���� ���� ��-��� ��� ������.
};

// ������������, ���� ������� "����� �������� ������. � ���� � �� ���." � ������� ���

func void DIA_SueBaby_AboutSymonPlan_Deal()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Deal_15_00");	//����� �������� ������. � ���� � �� ���. ����� ��������� ����� ���� ��������, � �� � ����� ���� �� ���� ��� ����������� � ��������.
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Deal_13_01");	//��� �� ������� �� ���? � ������� ���, ������, ���!
};

// ������������, ���� ������� "� ���� �������." � ������� ���

func void DIA_SueBaby_AboutSymonPlan_Pay()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Pay_15_00");	//� ���� �������.
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Pay_13_01");	//�� �� �, � ���� ���, �������� �����! ���� � ������� �� ������ ��������!
};

// ������������, ���� ������� "�����, �����������?" � ������� ���

func void DIA_SueBaby_AboutSymonPlan_Think()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Think_15_00");	//�����, �����������?
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Think_13_01");	//���. ���� ��� ������ �� �������� ���� � ��� �����������.
};

// ������������, ���� ������� "������ �� ��� �����������?" � ������� ���

func void DIA_SueBaby_AboutSymonPlan_Why()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Why_15_00");	//������ �� ��� �����������?
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Why_13_01");	//������, ��� ������ ����� ��������� ��������. ��� � ��� ����� ���� ���������� ������, �� ��, ��� �����������.
};

// ������������, ���� ���� ����� "�������", � ���� � ����� ��������� � ��������
// nr = 1

instance DIA_SueBaby_AboutConspiracy(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_AboutConspiracy_condition;	
	information = DIA_SueBaby_AboutConspiracy_info;
	description = " ";
};

func int DIA_SueBaby_AboutConspiracy_condition()
{	
	if ((MIS_DS2P_Conspiracy == Log_Running) && (Zedd_InConspiracy == TRUE) && (Vales_InConspiracy == TRUE)
		 && (C_DIA_Greg_OurIdea_Know_AboutSue == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_AboutConspiracy_info()
{
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_00");	//��, ����. ������� ����, ����������.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_01");	//���? ����� ��������?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_02");	//�� ������. � �������, ��� �� � ���� ������ �������� �����. ��� ���?
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_03");	//��
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_04");	//� ���������� ���� �������� � ������ � �������. ��� ����� �������� ������� ���� � ���, ��� �� ������ �� ����������.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_05");	//�����, ��, ��� ���. �� � ������ ������������� ����� ���������� �� �����. �� ��������� �� ����� �������, ������������ �� �����?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_06");	//������� � �������� � ����� ��������. � ���� ���������� �� �����, ����� ��� ������������ ������.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_07");	//��� ���? � ������ ����� ��� �������, ��� �� ��� ����� ������ �������?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_08");	//������, ��� ��� ������� ���� ��. �� ���� �� �������.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_09");	//� ���������� ������? ��� ����� ����� �������, � ����� ����� � � ���� ����� ������� ��� ������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_10");	//�����, �� ������ ����� �����. ����� ������ �� ������� ����� ������ �������� ���� �������, ��� ����� ������. ��������, �������, ��������, �����, � ����� �����������. �� ���� ��������, ��� � ��������� � ���� ��� ��������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_11");	//�� ��������� ����� ����������� � ���, ������ �� ���������. �� �� �� ����� �������� ��� ���� ���� �������, �� ������ �� ����������������.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_12");	//� ��� � ��� ���������, � ��������? �� ��� �� ����� ������� �������, ��� �� ��������� ������ � ������ � �����?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_13");	//�� ������, �� ����� ������� ������. ������ ��� ����� ����������� � ���������� ���������, � �� ������� ��������� �����. ������� �������� ������� � ��������� �����.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_14");	//�, ��� �������, �� ��� ����� ������ �� �����.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_15");	//���, �� ��. � ������ ����������� �� ���� ���������� ����������� ����� ��� ����������, � ���� ������� � �������� ��������� �������. ����� �� ��������� � ���������� �������� �������, ��� ������� ��� ����� �������� �������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_16");	//� ����� ���� �� ������ ����, ������ ���������� �� ����� � �������� ��� ������ ������, �� ����������. ������ ��� ����� ������� �� ����� ��� �������� ��� ������ �������. � ��� ����� ��� � � ���� � ���� �� ��������� � ����� � ��� ����������� �������, ����� ���������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_17");	//��, ��� �� �� ����������� � �������� ���� ���������, ������� ��� �� ����, � ���� ��� ��� ������� ���� ����� ����� �������� �����������.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_18");	//��� �, ���� ������ ��� �������. �� ������ �� ��� ����� �������? ������ ���� �� �������� ��������, ����������� ���������� �������?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_19");	//�� ���� � �������� �����. � ���� ��, �� ������� ����� ������ ����� ���� ����������� ����������, ����� � ������� ������ ���� �� ����. ������ ���������� ������� ��������� ������ ����.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_20");	//� �������, ��� � ����� ������������ ����� ���������, �� ����� ���, ��� �� �� ����� �������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_21");	//����� �� ������ �������� ��������?
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_22");	//����� � � ���� ������ ��������� ������� ��������� �� ����� �������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_23");	//�� ����, ����������. � ������ ��������� ���� � ��������, ��� ��������� ���������� ��� ������� � �������. ��� �������, � � �������� ������� � ������ ����� ������ ��� �����.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_24");	//�� ��������, ��� ����� � ������ ����.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_25");	//��, ���� �� �� ����. � ���� ���� ���� �������.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_26");	//�����?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_27");	//� ���� ����� �������� �����. ���� � ������ ����� ���� �������, �������� �� ���� �������� �����, � �������� ����� � ������ �����������, �� ���� ���� ����� ����� �� ���� ����. �� ������� �� ���� � �����-��, ���� �� ����, � ����� � ��� �������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_28");	//���� �� ������� ������� ������, ������ � �������� ����� ���. ���� �� ����� ������� ��������� �������� ��������� �� �����, �� ������������ ������� �������� ���������� �� ������ �� ��������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_29");	//��� ��� ��� �������, ��� ��� ���� ������ ���, ��� �� ���� �� ��� �������.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_30");	//������. � �������� ���� �������. �� ����������� ����� ����, ��������� �����, �������� ���, � ���� ���������� ����� ���������. � ��������� �����?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_31");	//��.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_32");	//����� �� �����.
	SueBaby_InConspiracy = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_SueBabyIn);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Punishment,LOG_MISSION,LOG_Running,TOPIC_DS2P_Punishment_Start);
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "�������", "������ �������� ���" � ��� ���������� ����������� � ��������, ��� ����������� ����������� � ��������
// nr = 1

instance DIA_SueBaby_AgainAboutSymon(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_AgainAboutSymon_condition;	
	information = DIA_SueBaby_AgainAboutSymon_info;
	description = "������ �������.";
};

func int DIA_SueBaby_AgainAboutSymon_condition()
{	
	if ((MIS_DS2P_Conspiracy == Log_Running) && MIS_DS2P_WinSueHand
		 && Npc_KnowsInfo(other,DIA_SueBaby_AboutSymonPlan) && (SueBaby_InConspiracy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_AgainAboutSymon_info()
{
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_00");	//������ �������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_01");	//���� ����? � ���, ������ �������?
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_02");	//��������, ��� ����� ��� �����, ����� ������� �����. �� ���������� ������������� �� ����� � ��� ������, ���� � ������ ��� ��������� ����. � �� �� ��������� ����� � ���. ������ ���� ��� ����������� � ���, ���������� � ���, � ���.
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_03");	//������ �������� �����. � ����� �������� �������, ����� �� ������� � ���. � ���.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_04");	//����!
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_05");	//�����, ��� ��� ����� ������� �����. �� ����� ��������� ��� ����������, ��� ���������� ������ ���������.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_06");	//���������! �����! � ��������, �� ���� ���� ���� ��������� �������� �� ��� �� ������ ��� ��� ������ �����.
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_07");	//������-������. �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Running,TOPIC_DS2P_WinSueHand_SueAccept);
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "�������" � ����� ����� �� ��������
// nr = 1

instance DIA_SueBaby_ConspiracyOver(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_ConspiracyOver_condition;	
	information = DIA_SueBaby_ConspiracyOver_info;
	description = " ";
};

func int DIA_SueBaby_ConspiracyOver_condition()
{	
	if ((MIS_DS2P_Conspiracy == Log_Running) && (Conspiracy_IsStarted == TRUE) && Npc_IsDead(Gard)) 
	{
		return TRUE;
	};
};

func void DIA_SueBaby_ConspiracyOver_info()
{
	AI_Output(self,other,"DIA_SueBaby_ConspiracyOver_13_00");	//���� �����, ������ � ��� ����� �������. �� ����������� ������� ����!
	B_DSG_StopConspiracy();
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "�������" � ���� ����
// nr = 1

instance DIA_SueBaby_PunishmentOver(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_PunishmentOver_condition;	
	information = DIA_SueBaby_PunishmentOver_info;
	description = " ";
};

func int DIA_SueBaby_PunishmentOver_condition()
{	
	if ((MIS_DS2P_Conspiracy == Log_Success) && (Conspiracy_IsStarted == TRUE)
		 && Npc_IsDead(Gard) && Npc_IsInState(self,ZS_TALK)) 
	{
		return TRUE;
	};
};

func void DIA_SueBaby_PunishmentOver_info()
{
	AI_Output(self,other,"DIA_SueBaby_PunishmentOver_13_00");	//������, ����� �� �����, � ���� � ����� ����� ����� �������� �������.
	AI_Output(other,self,"DIA_SueBaby_PunishmentOver_15_01");	//����� ������ ������, ����� �� ����� ������� ���� ����� ����, � �����, ��������� ��, �� ������, ��� ���� ������ ������.
	AI_Output(self,other,"DIA_SueBaby_PunishmentOver_13_02");	//(��������) �� ����. ������ ������� �� ����������� ��� ��������� � ����, � ������� � ��� ������ ����������. �����, ����� ������ �����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Punishment,Log_Mission,Log_Running,TOPIC_DS2P_Punishment_Success);
	B_GivePlayerXP(XP_MIS_DS2P_Punishment);
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};
	
	
	
/* UNFINISHED


���������� ����� ����� (����� DIA_SueBaby_GrayBeardSituation_Win)

����� ����. (����������)
��: ����� ����.
���: ����?

���������� ������ +1
���������� ������ +2
��� � ����� � ��������
����� ���� � ����� � �������� ��������:
��� � ����� ������
���� ��� �������� ���������� ������� �� 90%. ������ ����� ��������:
���: � ������� ���� �����, ��� �����. ������ ��� ����� ����� ����� � ���� ����� ����������.

*/