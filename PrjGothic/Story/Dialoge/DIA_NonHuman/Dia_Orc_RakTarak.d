instance DIA_RakTarak_EXIT(DIA_Proto_End)
{
	npc = Orc_DS2P_RakTarak;
};


/////////////////////////// ����� ///////////////////////////

//===================================================
//���������� ���
//���������: ���������
//���������: ���� ��������� ���-������ ��� ��-����
instance DIA_RakTarak_Start(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_RakTarak_Start_Info;
	description = "*(����, �����!)";
	important = TRUE;
};
func void DIA_RakTarak_Start_Info()
{
	AI_Output(self,other,"DIA_RakTarak_Start_99_01");	//����, �����. ���-����� �� ���� �����.
		AI_Output(other,self,"DIA_RakTarak_Start_15_02");	//������� ��� ����������� ����, �� ����������� �� ����� ��� ���� ��������.
	AI_Output(self,other,"DIA_RakTarak_Start_99_03");	//���-����� ����. �� ���� �����. ��� ������ ���.
		AI_Output(other,self,"DIA_RakTarak_Start_15_04");	//�������� �� ������.
};


//===================================================
//��� ������� ����������
//����������
instance DIA_RakTarak_Sorrow(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 0;
	condition = DIA_RakTarak_Sorrow_Cond;
	information = DIA_RakTarak_Sorrow_Info;
	description = "*(�������)";
	permanent = TRUE;
	important = TRUE;
};
//�������: ��-��� ���� �� ����� ��������
//���������: ���� ����� ������� ��� ����������, ���� ������ ��� ���� �� ���� ���
func int DIA_RakTarak_Sorrow_Cond()
{
	if (DIA_WhenAsked_cond() && 
		Npc_IsDead(Orc_DS2P_ArTush) && (!MIS_DS2P_Protection4LittleOnes || !DIA_RakTarak_Sorrow_Once)
	)	{
		return TRUE;
	};
};
var int DIA_RakTarak_Sorrow_Once;
func void DIA_RakTarak_Sorrow_Info()
{
	//������ ���� ���
	if (!DIA_RakTarak_Sorrow_Once) {
		AI_Output(self,other,"DIA_RakTarak_Sorrow_99_01");	//��-��� ������� � ���-����� �������� ������ ����.
		AI_Output(self,other,"DIA_RakTarak_Sorrow_99_02");	//������� ������ � ������ ���-�����. ���, ��������, ���� ����� �������.
		DIA_RakTarak_Sorrow_Once = TRUE;
	}		
	//���������
	else {
		AI_Output(self,other,"DIA_RakTarak_Sorrow_99_03");	//����� ����� �������� ���-����� � ��� ����.
	};
	//�������� ����������
	AI_StopProcessInfos(self);
};


//===================================================
//���������: ����� ����������
instance DIA_RakTarak_WhoAU(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 2;
	condition = DIA_RakTarak_WhoAU_Cond;
	information = DIA_RakTarak_WhoAU_Info;
	description = "��� ��?";
};
func int DIA_RakTarak_WhoAU_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_Start))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhoAU_Info()
{
		AI_Output(other,self,"DIA_RakTarak_WhoAU_15_01");	//��� ��?
	AI_Output(self,other,"DIA_RakTarak_WhoAU_99_02");	//���� ��� ���-�����, ��� ������� ������. �� ���� �����-����� ��� ����� � ������� � ��� � ���.
		AI_Output(other,self,"DIA_RakTarak_WhoAU_15_03");	//���? �������� ��������.
	AI_Output(self,other,"DIA_RakTarak_WhoAU_99_04");	//��� - ����� ������� � ������� ����� � ���, ������ �� ����� � ����. ������� ����� ����� ���. 
	AI_Output(self,other,"DIA_RakTarak_WhoAU_99_05");	//������ ���-����� ���� ����� ���, �� ������� ��� �� ���� ��� ������ ���. �� ���� ������� ����.
};


//===================================================
//���������: ����� ����������
instance DIA_RakTarak_WhereLearnedLanguage(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 3;
	condition = DIA_RakTarak_WhereLearnedLanguage_Cond;
	information = DIA_RakTarak_WhereLearnedLanguage_Info;
	description = "������ �� ������ ��� ����?";
};
func int DIA_RakTarak_WhereLearnedLanguage_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhoAU))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhereLearnedLanguage_Info()
{
		AI_Output(other,self,"DIA_RakTarak_WhereLearnedLanguage_15_01");	//������ �� ������ ��� ����?
	AI_Output(self,other,"DIA_RakTarak_WhereLearnedLanguage_99_02");	//���-����� ����� �������� � ��������� � �����, ����� ��� �� ���� �����.
};


//===================================================
//���������: ����� ����������
instance DIA_RakTarak_OtherOrcs(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 4;
	condition = DIA_RakTarak_OtherOrcs_Cond;
	information = DIA_RakTarak_OtherOrcs_Info;
	description = "� �� ���� ������� ��� ������ �����?";
};
func int DIA_RakTarak_OtherOrcs_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhoAU))	{
		return TRUE;
	};
};
func void DIA_RakTarak_OtherOrcs_Info()
{
		AI_Output(other,self,"DIA_RakTarak_OtherOrcs_15_01");	//� �� ���� ������� ��� ������ �����?
	AI_Output(self,other,"DIA_RakTarak_OtherOrcs_99_02");	//���, ���� ����� �� ����. ���� ������� ��� �����.
		AI_Output(other,self,"DIA_RakTarak_OtherOrcs_15_03");	//������?
	AI_Output(self,other,"DIA_RakTarak_OtherOrcs_99_04");	//����� �� ����� ���� ���� ������. ������ ������ � ������. �� �������.
};


//===================================================
//���������: ����� �� �� ���� ������� ��� ������ �����?�
instance DIA_RakTarak_AboutDragon(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 5;
	condition = DIA_RakTarak_AboutDragon_Cond;
	information = DIA_RakTarak_AboutDragon_Info;
	description = "������ ���������� ��� ��������� � �������?";
};
func int DIA_RakTarak_AboutDragon_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_OtherOrcs))	{
		return TRUE;
	};
};
func void DIA_RakTarak_AboutDragon_Info()
{
		AI_Output(other,self,"DIA_RakTarak_AboutDragon_15_01");	//������ ���������� ��� ��������� � �������?
	AI_Output(self,other,"DIA_RakTarak_AboutDragon_99_02");	//�� ������, �����-����� ��� ������. � �������. ���-����� ����� ���� ���� ���. 
		AI_Output(other,self,"DIA_RakTarak_AboutDragon_15_03");	//��� ���� ����� �������? ������� �� �� ��������� �� ���� �����?!
	AI_Output(self,other,"DIA_RakTarak_AboutDragon_99_04");	//���, ��� �� ���� ��� ������. ���-����� �� ����� ���. ������ ���� ��� ���� � ���� ��� ������ ������, ��� ��� ���.
	AI_Output(self,other,"DIA_RakTarak_AboutDragon_99_05");	//���-����� ������ �� ��������� ���� ������, ��������. �� �� ���� �� ������, ������� �������� � ��� ����.
};


//===================================================
//���������: ����� ����������
instance DIA_RakTarak_WhyAlone(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 6;
	condition = DIA_RakTarak_WhyAlone_Cond;
	information = DIA_RakTarak_WhyAlone_Info;
	description = "��� �� ��� ������� ������ ����?";
};
func int DIA_RakTarak_WhyAlone_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhoAU))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhyAlone_Info()
{
		AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_01");	//��� �� ��� ������� ������ ����? ���� ������ �������� ������.
		AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_02");	//����� ����� ����� ������, � ������� �������� ���� �� ���������� � ������ �������.
		AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_03");	//� ������� �� ������ ���������� ������, � ��� � ������ ������ �����.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_04");	//� � ��� ���� �������� � ������� �����, ��� ���� � �����-����� ������.
		AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_05");	//�� �������� ��� ����? �������?
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_06");	//���, ����� �������� ����-���. ��� ������� ����� ��� ���� � ��������� ����� �����. � ������ ��� ������ ��� ����.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_07");	//�� ������� �� ������� � ����� � ���� ��������� ���� � ������ � ������ �����.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_08");	//�� ����� ��������� ������ ���� � �������� ����� � �����. �� �� ������ �����, �� ������ ������ ����� ���. 
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_09");	//�� ����� �� ��������� ����. ���� ���� �� ��� ������� �����-��������. ����� ���� ���������. 
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_10");	//�� ������ ���� � ����, �� ����� ���� ��� ���. ��� ����� ���� �������.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_11");	//����� �� �������� ����� � ����� �� ����. �� ��� ������ ���������, ���� ������� �����, � ����� ������.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_12");	//������ ���-����� � ��-��� ��������, ���� ������� �� ���� ������.
};


//===================================================
//����������
//���������: ����� ���� �� ��� ������� ������ ����?�
instance DIA_RakTarak_WhatNext(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 7;
	condition = DIA_RakTarak_WhatNext_Cond;
	information = DIA_RakTarak_WhatNext_Info;
	description = "��� ������ ������ ������?";
	permanent = TRUE;
};
func int DIA_RakTarak_WhatNext_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhyAlone))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhatNext_Info()
{
	AI_Output(other,self,"DIA_RakTarak_WhatNext_15_01");	//��� �� ������ ������ ������?
	//���� �������� ����� ������� ��� ����������
	if (MIS_DS2P_Protection4LittleOnes) {
		AI_Output(self,other,"DIA_RakTarak_WhatNext_99_03");	//������ ������� ���� �����. ������ ���� ���������, �� ������� �������. �����, ��� ���� �����.
	}
	else {
		AI_Output(self,other,"DIA_RakTarak_WhatNext_99_02");	//�� ���� ���� ������. ����� ��� ����� � ����-���� �����.
	};
};


//===================================================
//���������: ����� ���� ���������� ��������
instance DIA_RakTarak_RememberMeOfFriend(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 8;
	condition = DIA_RakTarak_RememberMeOfFriend_Cond;
	information = DIA_RakTarak_RememberMeOfFriend_Info;
	description = "�� ����������� ��� ������ ����� �����.";
};
func int DIA_RakTarak_RememberMeOfFriend_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhatNext))	{
		return TRUE;
	};
};
func void DIA_RakTarak_RememberMeOfFriend_Info()
{
		AI_Output(other,self,"DIA_RakTarak_RememberMeOfFriend_15_01");	//�� ����������� ��� ������ ����� �����-����. ��� ����� ��-���.
		AI_Output(other,self,"DIA_RakTarak_RememberMeOfFriend_15_02");	//�� ���� ����� ���� � ����, ���� ���� �� ������ ������� � ��� �����������... �� ��������� �������.
	AI_Output(self,other,"DIA_RakTarak_RememberMeOfFriend_99_03");	//������? �� ���� ������� �� �����?
		AI_Output(other,self,"DIA_RakTarak_RememberMeOfFriend_15_04");	//���, ������ �� ������� ���� ������. ��-�� ���� ������, ���������. ��� ����, ��� ��� �����.
};


/////////////////////////// �����: ��� � ���� ///////////////////////////

//===================================================
//���������: ����� ����������
//���������: ���� ��-��� ���
instance DIA_RakTarak_WhatWithUrFriend(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 10;
	condition = DIA_RakTarak_WhatWithUrFriend_Cond;
	information = DIA_RakTarak_WhatWithUrFriend_Info;
	description = "��� � ����� ������?";
	permanent = TRUE;
};
var int DIA_RakTarak_WhatWithUrFriend_Once;
func int DIA_RakTarak_WhatWithUrFriend_Cond()
{
	if (!DIA_RakTarak_WhatWithUrFriend_Once) {
		DIA_RakTarak_WhatWithUrFriend.description = "� ���� ���-�� ������ ������ �����?";
	};
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhoAU))	{
		return TRUE;
	};
	if (DIA_RakTarak_WhatWithUrFriend_Once && !ArTush_AgreedToHelp)	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhatWithUrFriend_Info()
{
	DIA_RakTarak_WhatWithUrFriend_Once = TRUE;
		AI_Output(other,self,"DIA_RakTarak_WhatWithUrFriend_15_01");	//��� � ����� ������?
	AI_Output(self,other,"DIA_RakTarak_WhatWithUrFriend_99_02");	//��-��� ������. ��� ������� ������.
		AI_Output(other,self,"DIA_RakTarak_WhatWithUrFriend_15_03");	//������?
	AI_Output(self,other,"DIA_RakTarak_WhatWithUrFriend_99_04");	//������� ��� � �� � ����. ����� �� ���� ��� ���, ��� ����� � ����. �� ����� ��� ����.
	//����� �������� (����):
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend,"��, ����� ������ ����� ����������.",DIA_RakTarak_WhatWithUrFriend_NoHelp);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend,"� ���� ���-�� ������ ������ �����?",DIA_RakTarak_CanIHelpU_Info);
};

//��, ����� ������ ����� ����������.
func void DIA_RakTarak_WhatWithUrFriend_NoHelp()
{
	AI_Output(other,self,"DIA_RakTarak_WhatWithUrFriend_NoHelp_15_01");	//��, ����� ������ ����� ����������.
	AI_Output(self,other,"DIA_RakTarak_WhatWithUrFriend_NoHelp_99_02");	//(��������) ��� ��������� ��-��� ����� �������.
	//���� ����� ��-���� 2 ���
	ArTush_Die_Day = Wld_GetDay() + ArTush_Die_DaysLeft + 1;
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
};

//� ���� ���-�� ������ ������ �����?
func void DIA_RakTarak_CanIHelpU_Info()
{
	ArTush_AgreedToHelp = TRUE;
	//��� ������� ��� ���� �� ����� ����� �����
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_15_01");	//� ���� ���-�� ������ ������ �����?
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_99_02");	//��, ����� ���� ������ ��-���. ����� ��������� �� ��, �� ��� ��� ����� �� ���� ������.
	//���� ����� ��-���� 2 ���
	ArTush_Die_Day = Wld_GetDay() + ArTush_Die_DaysLeft + 1;
	//������ � ��������. ����� ���� � ����: ������
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Start);
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_15_03");	//��� ���� �����?
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_99_04");	//��� ���-���, ��� ���-���, ���� ���-���� � ������ �����.
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_15_05");	//���, ����� �����������. � ���� �������� �� ��������.
	//������ ���������, �� ������ ������� ���� ����� ������� ���� ����� (��������� ������):
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "(������)", DIA_RakTarak_CanIHelpU_GdoBash);
};

var int DIA_RakTarak_WhatWithUrFriend_CorrectAnswer;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb1 = 1;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_ManaHerb1 = 2;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom1 = 3;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_Blueplant = 4;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb3 = 5;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_TempPlant = 6;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_PermPlant = 7;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom2 = 8;
var int DIA_RakTarak_WhatWithUrFriend_CorrectAnswersCount;
var int DIA_RakTarak_WhatWithUrFriend_AnswersCount;
	const int DIA_RakTarak_WhatWithUrFriend_AnswersCount_Max = 4;

func void DIA_RakTarak_CanIHelpU_Menu() {
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "������� �����", DIA_RakTarak_CanIHelpU_TempPlant);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "�������� �����", DIA_RakTarak_CanIHelpU_HealthHerb1);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "�������� ������", DIA_RakTarak_CanIHelpU_HealthHerb3);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "�������", DIA_RakTarak_CanIHelpU_Blueplant);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "�������� �������", DIA_RakTarak_CanIHelpU_ManaHerb1);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "������� ������", DIA_RakTarak_CanIHelpU_PermPlant);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "������ ����", DIA_RakTarak_CanIHelpU_Mushroom1);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "���� ��������", DIA_RakTarak_CanIHelpU_Mushroom2);
};

// ������� ----------------------------
func void DIA_RakTarak_CanIHelpU_GdoBash() {
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_GdoBash_99_01");	//��� ���-���. ��� �����, ����� ������ ��������� ����.
	//�������� �����
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswer = DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb1;
	DIA_RakTarak_CanIHelpU_Menu();
};

func void DIA_RakTarak_CanIHelpU_ShtiOra() {
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_ShtiOra_99_01");	//��� ���-���. ����� ������ � ������ �����. ������ ���� �����.
	//�������� �������
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswer = DIA_RakTarak_WhatWithUrFriend_Answer_ManaHerb1;
	DIA_RakTarak_CanIHelpU_Menu();
};

func void DIA_RakTarak_CanIHelpU_UrGona() {
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_UrGona_99_01");	//���� ��-����. ��� ��������� ���� ������ ����. ����� ������.
	//������ �����
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswer = DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom1;
	DIA_RakTarak_CanIHelpU_Menu();
};
func void DIA_RakTarak_CanIHelpU_Khori() {
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_Khori_99_01");	//������ �����. ����� ���� ����� ����� ����� ������� ����.
	// �������
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswer = DIA_RakTarak_WhatWithUrFriend_Answer_Blueplant;
	DIA_RakTarak_CanIHelpU_Menu();
};

// �������� ----------------------------
//���� ���-�� ��������
func void DIA_RakTarak_CanIHelpU_Wrong() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Wrong_15_01");	//������, ������� ���-�� �� ���. ����� � ������.
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswersCount = 0;
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "(������)", DIA_RakTarak_CanIHelpU_GdoBash);
};
//�����
func void DIA_RakTarak_CanIHelpU_Right() {
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Right_15_01");	//����� ��������. ��� ���?
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_Right_99_02");	//��� ���� ������� ������. ����� �������� ���-���-���.
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_Right_99_03");	//�� ������ � ����� ����� ������. ���� ������� � ������, ����� �� ����� ����� �������.
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Right_15_04");	//���������� �����. ��������� ���� ���� �� ���� �����.
	//������ � ��������. ����� ���� � ����: �����������
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Ingredients);
	//����� ����������� �������� � ��������� �������
	B_Spawn_PlantsForOrcHealing();
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_Right_99_05");	//����� ���� ���� ������. ��-��� �� ���� ������ ��� ���.
	//������ � ��������. ����� ���� � ����: �����
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Time);
};

func void DIA_RakTarak_CanIHelpU_CheckAllCorrect(var int answer) {
	if (DIA_RakTarak_WhatWithUrFriend_CorrectAnswer == answer) {
		DIA_RakTarak_WhatWithUrFriend_CorrectAnswersCount += 1;
	};
	DIA_RakTarak_WhatWithUrFriend_AnswersCount += 1;
	if (DIA_RakTarak_WhatWithUrFriend_AnswersCount == DIA_RakTarak_WhatWithUrFriend_AnswersCount_Max) {
		if (DIA_RakTarak_WhatWithUrFriend_CorrectAnswersCount == DIA_RakTarak_WhatWithUrFriend_AnswersCount_Max) {
			DIA_RakTarak_CanIHelpU_Right();
		}
		else {
			DIA_RakTarak_CanIHelpU_Wrong();
		};
	};
};

// �������� ������ ----------------------------
//���������� ��������
func void DIA_RakTarak_CanIHelpU_HealthHerb1() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_HealthHerb1_15_01");	//�������� �����. �����.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb1);
};
func void DIA_RakTarak_CanIHelpU_ManaHerb1() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_ManaHerb1_15_01");	//��� ������ ���� �������� �������.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_ManaHerb1);
};
func void DIA_RakTarak_CanIHelpU_Mushroom1() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Mushroom1_15_01");	//���, ��� ������ �����.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom1);
};
func void DIA_RakTarak_CanIHelpU_Blueplant() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Blueplant_15_01");	//������ �� �������.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_Blueplant);
};
//������ ������
func void DIA_RakTarak_CanIHelpU_HealthHerb3() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_HealthHerb3_15_01");	//������ ��� �������� ������.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb3);
};
func void DIA_RakTarak_CanIHelpU_TempPlant() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_TempPlant_15_01");	//�������, ��� ������� �����.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_TempPlant);
};
func void DIA_RakTarak_CanIHelpU_PermPlant() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_PermPlant_15_01");	//��, ��������, �� ��� ������� ������.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_PermPlant);
};
func void DIA_RakTarak_CanIHelpU_Mushroom2() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Mushroom2_15_01");	//���� ��������? ������� ����� ����, �������.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom2);
};


//===================================================
//���� ���
instance DIA_RakTarak_GiveHealPotion(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 11;
	condition = DIA_RakTarak_GiveHealPotion_Cond;
	information = DIA_RakTarak_GiveHealPotion_Info;
	description = "� ���� ���� �������� �������. (������)";
};
//���������: ����� ���� � ���� �������
//�������: � ��������� ���� ������� ������� ��������
func int DIA_RakTarak_GiveHealPotion_Cond()
{
	if (DIA_RakTarak_WhatWithUrFriend_Once && MIS_DS2P_OrcInTrouble == LOG_Running && !ArTush_Healed 
		&& Npc_HasItems(other, ItPo_Health_03)
	)	{
		return TRUE;
	};
};
func void DIA_RakTarak_GiveHealPotion_Info()
{
		AI_Output(other,self,"DIA_RakTarak_GiveHealPotion_15_01");	//� ���� ���� �������� �������. ������.
	AI_Output(self,other,"DIA_RakTarak_GiveHealPotion_99_02");	//�������, �����. ����� �� �������� ��-��� �� ��, �� ������� ������ ���� ������.
	//���� ����� ��-���� +1 ����
	ArTush_Die_Day += 1;	
	//������ � ��������. ����� ���� � ����: �������� �����
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Potion);
};


//===================================================
//������ ���������: ��-���
var int RakTarak_ArTush_TRIA_Phrase;
const int RakTarak_ArTush_TRIA_Phrase_End = 3;
instance DIA_RakTarak_GotEverything(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 0;
	condition = DIA_RakTarak_GotEverything_Cond;
	information = DIA_RakTarak_GotEverything_Info;
	description = "� ��� ������.";
	permanent = TRUE;
};
//���������: ����� ���� � ���� �������
//�������: ������� ��� �����������
func int DIA_RakTarak_GotEverything_Cond()
{
	if (MIS_DS2P_OrcInTrouble == LOG_Running && C_NpcHasAllIngredients_OrcInTrouble(other) &&
		RakTarak_ArTush_TRIA_Phrase < RakTarak_ArTush_TRIA_Phrase_End
	)	{
		return TRUE;
	};
};
func void DIA_RakTarak_GotEverything_Info()
{
	var C_NPC ArTush; ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
	RakTarak_ArTush_TRIA_Phrase += 1;
	if (RakTarak_ArTush_TRIA_Phrase == 0)	{
		AI_Output(other,self,"DIA_RakTarak_GotEverything_15_01");	//� ��� ������.
		//������ ����� � ������� ������� (����� �������!)
		B_GiveAllIngredients_OrcInTrouble(other, self);
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_02");	//��� �������� ����� ����� �������. ������ ������ ��-���.
		//�������� � ��-����
		AI_GotoNpc(self, ArTush);
		AI_GotoNpc(other, ArTush);
		//��� ������, ���� ������� �������
		AI_StandUp(ArTush);
		CreateInvItems(ArTush, ItFo_DS2P_OrcBooze, 1);
		AI_UseItem(ArTush, ItFo_DS2P_OrcBooze);
		
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_03");	//������! �� �������.
			DIA_RakTarak_GotEverything.npc = Hlp_GetInstanceID(Orc_DS2P_ArTush);
		AI_StopProcessInfos(self);
	}
	else if (RakTarak_ArTush_TRIA_Phrase == 1)	{
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_04");	//���� ����� �����! ����� ����� �������, ���� ��� �����.
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_05");	//����� ����� ���� �����!
			DIA_RakTarak_GotEverything.npc = Hlp_GetInstanceID(Orc_DS2P_ArTush);
		AI_StopProcessInfos(self);
	}
	else if (RakTarak_ArTush_TRIA_Phrase == 2)	{
		AI_Output(other,self,"DIA_RakTarak_GotEverything_15_06");	//� ��-��������� �����? �� ����� �� �������.
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_07");	//��-��� �������� ������� �����.
		AI_Output(other,self,"DIA_RakTarak_GotEverything_15_08");	//�� ��������, �������. �� ������ �� ��� ��� �� ������?
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_09");	//��-��� ��� ������ �����, �� ����� ���� �����. ��� ������ ����� ��-���.
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_10");	//��� ������ ���� ������� �����, �� ������ ���. ���� ������ ����� ��� ������. ��� ������ ����� ����� � ����� ���� ����.
		//���� ���� ����� � �������� �����
		CreateInvItem(self, ItMw_2H_OrcAxe_03);
		AI_EquipBestMeleeWeapon(self);
		B_GiveInvItems(self, other, ItMw_DSP_RakTarakAxe, 1);
		TEACH_RakTarak = TRUE;
		// ������ � ��������. ����� ���� � ����: ��������
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_OrcInTrouble_Success);
	};
};


//===================================================
//����� �� ����� ������, ���� �� ������� ��-���� ��� ���� �� �� �����
instance DIA_RakTarak_BusyHealing(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 0;
	condition = DIA_RakTarak_BusyHealing_Cond;
	information = DIA_RakTarak_BusyHealing_Info;
	description = "*(�������)";
	permanent = TRUE;
	important = TRUE;
};
func int DIA_RakTarak_BusyHealing_Cond()
{
	if (DIA_WhenAsked_cond() && MIS_DS2P_OrcInTrouble == LOG_Running && !ArTush_Healed
		&& !(DIA_RakTarak_GotEverything_Cond() || DIA_RakTarak_GiveHealPotion_Cond())
	)	{
		return TRUE;
	};
};
func void DIA_RakTarak_BusyHealing_Info()
{
	AI_Output(self,other,"DIA_RakTarak_BusyHealing_99_01");	//���-����� �� ���� ������ ��������, �����. ���� �������� ��� ����, ��-���.
	//�������� ����������
	AI_StopProcessInfos(self);
};


/////////////////////////// �����: ������ ��� ��������� ///////////////////////////

//===================================================
instance DIA_RakTarak_Protection4LittleOnes(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 20;
	condition = DIA_RakTarak_Protection4LittleOnes_Cond;
	information = DIA_RakTarak_Protection4LittleOnes_Info;
	description = "��� �� �����, ���� ��������?";
};
//�������: ���� ����� ������� ��� ����������. ����� ���� � ���� �������� ��� �� ���� (��-��� ����)
func int DIA_RakTarak_Protection4LittleOnes_Cond()
{
	if (MIS_DS2P_Protection4LittleOnes == LOG_Running &&
		(MIS_DS2P_OrcInTrouble == LOG_SUCCESS || Npc_IsDead(Orc_DS2P_ArTush))
	)	{
		return TRUE;
	};
};
func void DIA_RakTarak_Protection4LittleOnes_Info()
{
	//���� �� �������� ���� �� ����
	if (self.aivar[AIV_TalkedToPlayer] > Wld_GetDay() + 1) {
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_00");	//������, ���������.
	};
	AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_01");	//��� �� �����, ���� ��������?
		AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_02");	//���, ��� �� �����, ���� ����.
	AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_03");	//� ���� ���� �����������. �� ���� �������, �� �������, ����� ����� ��������. 
	AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_04");	//�� ��� ��������� �������� �������� �����, � �������� ������� �� ����� ����������. 
	//���� ��-��� ��� � ������
		if (!Npc_IsDead(Orc_DS2P_ArTush)) {
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_05");	//�� ����� ����� ���������, ��� ��.
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_06");	//� ��� � ������ �������� ���� ���, � ��� �� ���� ����� �������� � ����� �� �����.
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_07");	//��� ��������� ���� �����������. 
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_08");	//�� ���� ��������. ���-����� � ��-��� �������� ������� �������� � �������� ���� ���.
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_09");	//��� � ������.
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_10");	//������ ���� �� �����, ���� ���� ����.
		//������ � ��������. ����� ������� ��� ����������: ������������
		B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_Agreed);
	}
	//����� (��-��� ����)
	else {
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_05a");	//�� ����� ����� ��������, ��� ��. 
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_06a");	//� ���� �������� ���, � �� ������ �� ������ ����.
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_07");	//��� ��������� ���� �����������. 
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_08a");	//��� ���� ���������. ���-����� �������� ������� �������� � �������� ���� ���.
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_09");	//��� � ������.
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_10a");	//������ ��� �� �����, ���� ���� ����.
		//������ � ��������. ����� ������� ��� ����������: ������������ ����
		B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_AgreedOne);
	};
	Orcs_Agreed = TRUE;
};


//===================================================
//����������
instance DIA_RakTarak_ComeWithMe(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 21;
	condition = DIA_RakTarak_ComeWithMe_Cond;
	information = DIA_RakTarak_ComeWithMe_Info;
	description = "� ������ ���. �����!";
	permanent = TRUE;
};
//�������: ������ ����� ������� ��� ����������, ���� ����������� ����, �� ��� �� ���� �� ����
//���������: ������ �� �������
func int DIA_RakTarak_ComeWithMe_Cond()
{
	if (Npc_IsDead(Orc_DS2P_ArTush)) {
		DIA_RakTarak_ComeWithMe.description = "� ������ ����. �����!";
	};
	if (MIS_DS2P_Protection4LittleOnes == LOG_Running && Orcs_Agreed && !Orcs_Follow && !Orcs_CameToGobbos)	{
		return TRUE;
	};
};
func void DIA_RakTarak_ComeWithMe_Info()
{
	if (!Npc_IsDead(Orc_DS2P_ArTush)) {
		AI_Output(other,self,"DIA_RakTarak_ComeWithMe_15_01");	//� ������ ���. �����!
		// ��-��� �������������� � ��
		B_StartOtherRoutine(Orc_DS2P_ArTush, "FOLLOW");
	}
	else {
		AI_Output(other,self,"DIA_RakTarak_ComeWithMe_15_01a");	//� ������ ����. �����!
	};
	//���-����� �������������� � ��
	B_StartOtherRoutine(self, "FOLLOW");
};

//===================================================
//����������, ���������� ���
instance DIA_RakTarak_NoFurther(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 22;
	condition = DIA_RakTarak_NoFurther_Cond;
	information = DIA_RakTarak_NoFurther_Info;
	description = "* ������ �� ����.";
	important = TRUE;
	permanent = TRUE;
};
//�������: ����� ����� � ������� ������� ������ � ������� ��� ������ ���������
func int DIA_RakTarak_NoFurther_Cond()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)	{
		return TRUE;
	};
};
func void DIA_RakTarak_NoFurther_Info()
{
	AI_Output(self,other,"DIA_RakTarak_NoFurther_99_01");	//������ ������ ����.
	AI_Output(self,other,"DIA_RakTarak_NoFurther_99_02");	//��� ����� ����� �����, ������� ������.
	//���-����� � ��-��� �������� ����� �� �� ����� �� �����. ���� ������ - ������������ � ��������� �������
	B_StartOtherRoutine(self, "WAIT");
	if (Npc_IsDead(Orc_DS2P_ArTush)) {
		B_StartOtherRoutine(Orc_DS2P_ArTush, "WAIT");
	};
};


//===================================================
//��������: ��-���
instance DIA_RakTarak_Arrived(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 1;
	condition = DIA_RakTarak_Arrived_Cond;
	information = DIA_RakTarak_Arrived_Info;
	description = "���, �� ������.";
};
//�������: ����� ����� � ������� � ������� ��������
func int DIA_RakTarak_Arrived_Cond()
{
	if (C_OrcsFollow_Arrived())	{
		return TRUE;
	};
};
func void DIA_RakTarak_Arrived_Info()
{
	AI_Output(other,self,"DIA_RakTarak_Arrived_15_01");	//���, �� ������.
	//���� ��-��� ���
	if (!Npc_IsDead(Orc_DS2P_ArTush)) {
	var C_NPC RakTarak; RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
	var C_NPC ArTush; ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
		AI_GotoNpc(ArTush, other);
		TRIA_Invite(ArTush);
		
		TRIA_Next(RakTarak);
		//������ � ��������. ����� ������� ��� ����������: ������
		B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_Arrived);
		AI_Output(self,other,"DIA_RakTarak_Arrived_99_02");	//�������, �����. ���� ����� ����� ��� ���. ��� �� ����, ��� ���� �����������.
		
		TRIA_Next(ArTush);
			AI_Output(self,other,"DIA_RakTarak_Arrived_99_03");	//��-���	��� ����, ���-�����. ���� ����� ����� ����.
		
		TRIA_Next(RakTarak);
	AI_Output(other,self,"DIA_RakTarak_Arrived_15_04");	//��� �� ������?
		AI_Output(self,other,"DIA_RakTarak_Arrived_99_05");	//��-��� �������, ��� ������� ����� ����� ��������� ������� ���.
		
		//��-��� ������� ��� � ���������� ���������� �� DS1 � ������� � �����
		TRIA_Next(ArTush);
			AI_Output(self,other,"XXX");	//
		AI_PlayAni(self,"T_1HSFREE");
		//+3 ��������� ������
		B_RaiseFightTalent(other,NPC_TALENT_2H,3);
		AI_PrintScreen(PRINT_Learn2H,-1,-1,FONT_Screen,2);
		
		TRIA_Next(RakTarak);
		AI_Output(self,other,"DIA_RakTarak_Arrived_99_06");	//����� ���������? ����� ���� ���� ������� �����.
		
		TRIA_Finish();
	}
	//����� (��-��� ����)
	else {
		//������ � ��������. ����� ������� ��� ����������: ������ ������
		B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_ArrivedOne);
		AI_Output(self,other,"DIA_RakTarak_Arrived_99_02a");	//�������, �����. ���� ������ ���-�����.
	};
};


/////////////////////////// �������� ///////////////////////////
/* ���� ���� �� 200 � �������� ������� �������
����� ���������� ������ ���� � ����
���� �� ������ ������� ����?
����������
�������: ���������� �����
���������: ������ ����� � ������ �� ����
1.	AI_Output(other,self,"DIA_RakTarak_What_15_00");	//���� �� ������ ������� ����?
������ ���� ���
2.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//��� ������� ���� ������� ����� ��� ����. ��� ������ ���� �������.
������ � ��������. ���������: ���-�����
����� (���������):
	Info_AddChoice�������� ������� ������� (10LP): ���� ��� �� �������
	Info_AddChoice���� +1
	Info_AddChoice���� +5
	Info_AddChoice�����

�������� ������� �������.
1.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//����� ���� �����, ��� ����� ���� �������. ��������� �� ���� ����� ����� ����.
2.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//����� ����� ����� � ��� ���� � �������� �� ���, ����� �� ������� ����� ����. ���� ������, ������� ���� ����.
3.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//������� ���� ���� ������ ����. ��� ���� ����� ����� ���� � ������ �� �������.
������ ����� ������� ������

���� +1 (�� 1 LP)
���� +5 (�� 5 LP)
��������� ������
���� ���� >= 200
1.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//��� ������ �� ���� ������� �����. ����� ����� ������� ��� ���.


*/