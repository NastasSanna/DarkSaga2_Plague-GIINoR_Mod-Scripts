instance DIA_Ado_EXIT(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Ado_EXIT_condition;	
	information = DIA_Ado_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Ado_EXIT_condition(){	return TRUE;};
func void DIA_Ado_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 01/05/2013 ===========
// �������� ���� 
//===========================
instance DIA_Ado_KillKara(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 0;
	condition = DIA_Ado_KillKara_condition;	
	information = DIA_Ado_KillKara_info;
	important = TRUE;
};
func int DIA_Ado_KillKara_condition(){	return TRUE;};
func void DIA_Ado_KillKara_info()
{	
	var C_NPC Kara;	Kara = Hlp_GetNpc(BAU_112_DS2P_Kara);
	var C_NPC Ado;	Ado = Hlp_GetNpc(PIR_211_DS2P_Ado);
	TRIA_Invite(Kara);
	TRIA_Start();
	
	AI_TurnToNpc(self,Kara); Mdl_StartFaceAni(self, "S_ANGRY",1,-1);
	AI_TurnToNpc(Kara,self); Mdl_StartFaceAni(Kara, "S_ANGRY",1,-1);
	
	// self = Ado, other = Hero
	TRIA_Next(Ado);
	AI_Output(self,other, "DIA_Ado_KillKara_13_00");	//�� ���, ���� �������, ������ �� ���� ����� ������?! ��� �������, ��� �� ����, ����� ����� ������!

	// self = Kara, other = Hero
	TRIA_Next(Kara);
	AI_Output(self,other, "DIA_Ado_KillKara_17_00");	//�� ����� �� � �����, �������! ����� ���� ����� �������!

	// self = Ado, other = Hero
	TRIA_Next(Ado);
	AI_Output(self,other, "DIA_Ado_KillKara_13_01");	//��� ���� �����...

	// self = Kara, other = Hero
	TRIA_Next(Kara);
	AI_Output(self,other, "DIA_Ado_KillKara_17_01");	//������� �������, � �� ���������, ���� �� ��������� ���� �����, ����������� �������!

	// self = Ado, other = Hero
	TRIA_Next(Ado);
	AI_Output(self,other, "DIA_Ado_KillKara_13_02");	//�� ���� �����������...

	DIAG_Reset();
	TRIA_Finish();
	// ��� �������� �� ����, ��� ������� � ������ �����
	Mdl_StartFaceAni(self, "S_NEUTRAL",1,-1);
	Kara.flags = 0; Kara.attribute[ATR_HITPOINTS] = 1;
	B_StartOtherRoutine(self, "START");	// ������� ����������
	B_Attack(self,Kara, AR_KILL, 1);
	// ������ ����� ����� �� ����� ���������
	AI_StopProcessInfos(self);
};


//NS - 01/05/2013 ===========
// ����� ������� ����, �� ������ ��� (����� "�������� ��������")
//===========================
instance DIA_Ado_Supplies(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 0;
	condition = DIA_Ado_Supplies_condition;	
	information = DIA_Ado_Supplies_info;
	important = TRUE;
};
func int DIA_Ado_Supplies_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_KillKara))
	{	return TRUE;	};
};
func void DIA_Ado_Supplies_info()
{	
	AI_Output(self,other, "DIA_Ado_Supplies_13_00");	//���� ���������? ��� ���� �����������.
	//(���������� � ���������) 
	AI_TurnToNpc(self,BAU_110_DS2P_Viola); 
	AI_Output(self,other, "DIA_Ado_Supplies_13_01");	//�������, ��� ����� ��� ���� ��� ������� ������!
	AI_TurnToNpc(self,other); 
		AI_Output(other,self, "DIA_Ado_Supplies_15_00");	//�� ������� ���� � ���, ��� ��������� ����?
	AI_Output(self,other, "DIA_Ado_Supplies_13_02");	//�� ��� ������� �� �� �����. ��� �������� ���� ���������� �� ���, ����� � ��������, � ������ ��������.
	AI_Output(self,other, "DIA_Ado_Supplies_13_03");	//� ��� ��� ��� ������ ������ ����. � �� ���� �������� ���� ������� ��-�� �����-�� ��������� �����!
	AI_Output(self,other, "DIA_Ado_Supplies_13_04");	//� �� ��� ��� ��������, � ��� �� ������ �����?
		AI_Output(other,self, "DIA_Ado_Supplies_15_01");	//���� ������� ����. � ������ ��� ��� �������.
	AI_Output(self,other, "DIA_Ado_Supplies_13_05");	//�, �� �� �������, ��� ���� ����������. ����� ��� �����, ������ ��� ����� ���������� ��������.
		AI_Output(other,self, "DIA_Ado_Supplies_15_02");	//� �� ����������.
	AI_Output(self,other, "DIA_Ado_Supplies_13_06");	//� ��� �����, ���� ���� ����!
		AI_Output(other,self, "DIA_Ado_Supplies_15_03");	//� ������� ������� �� ������, ����� ����� ��������� �� ����, ���������� ��� �������.
	AI_Output(self,other, "DIA_Ado_Supplies_13_07");	//��� �� ������. � �� ����� ��� ������. ��� �� ������� ��������� �� ���� �����-������ ������!
		AI_Output(other,self, "DIA_Ado_Supplies_15_04");	//�� �����, � �� �����.
	AI_Output(self,other, "DIA_Ado_Supplies_13_08");	//�������, ��� ��� ���.
	// � �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_KaraDead);
};


//NS - 01/05/2013 ===========
// ����� ������� ����, ����������
//===========================
instance DIA_Ado_WhoAreU(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 0;
	condition = DIA_Ado_WhoAreU_condition;	
	information = DIA_Ado_WhoAreU_info;
	description = "� ��� �������, �� ���.";
};
func int DIA_Ado_WhoAreU_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_Supplies))
	{
		return TRUE;
	};
};

func void DIA_Ado_WhoAreU_info()
{	
	AI_Output(other,self, "DIA_Ado_WhoAreU_15_00");	//� ��� �������, �� ���.
	AI_Output(self,other, "DIA_Ado_WhoAreU_13_00");	//��� ��������� ��� ��� ���������?
	AI_Output(other,self, "DIA_Ado_WhoAreU_15_01");	//���.
	AI_Output(self,other, "DIA_Ado_WhoAreU_13_02");	//�����, �� ����� �������� ���� ���������.
	AI_Output(self,other, "DIA_Ado_WhoAreU_13_03");	//��, � ���, ���� �� ������ ���������� ������� �������� �����.
};


//NS - 01/05/2013 ===========
// ����� ����������. ��������� ����� "� ������� ��������"
//===========================
instance DIA_Ado_WhatJob(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 0;
	condition = DIA_Ado_WhatJob_condition;	
	information = DIA_Ado_WhatJob_info;
	description = "��� �� �����������?";
};
func int DIA_Ado_WhatJob_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU))
	{	return TRUE;	};
};
func void DIA_Ado_WhatJob_info()
{	
	AI_Output(other,self, "DIA_Ado_WhatJob_15_00");	//��� �� �����������?
		AI_Output(self,other, "DIA_Ado_WhatJob_13_00");	//���� ���������, ��� � ��������� ����� ����, ��� �������� ����� �����? (�������)
		AI_Output(self,other, "DIA_Ado_WhatJob_13_01");	//� � ���������������� ���, ���� �� ������ �� ����� ��������.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_02");	//������� ��� ���� ������� ����� ������� �������� � ��� ����� ���������, � ��� �� ��, ����� ������� ������, ���� �� �������� �������.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_03");	//�� ���� ����� �� ������, �� ������ ����, ��� �� ���������, ����������, ���� �������, � ���� ��� ���������, ����� ������� ���� ���. ������� � �������� �����!
	AI_Output(other,self, "DIA_Ado_WhatJob_15_01");	//� ���� �� ����?
		AI_Output(self,other, "DIA_Ado_WhatJob_13_04");	//������ �������, ��� ��� �� ���?
	AI_Output(other,self, "DIA_Ado_WhatJob_15_02");	//������� ����.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_05");	//�����! � ����� ������� ���� ���� �����, �� �� ������ �����, � ��������� ������.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_06");	//������� ��� ����� � ����� ���������. (������ �������) ����� ��� ���-������.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_07");	//��� ���, ���� �������� ����� � ���������. �� � �������� ����� �� ����������� �������� ���� ������, �� ������ ����� ������� ���������. �� ���� �� � ����.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_08");	//���� �� � �������� ������ ��� ����� �������, ���-��� ���������� �� �������� ��� ���-���� �������.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_09");	//���� �� ����� �������� - ����� � ��� ����� ��������� - ������ ����, � ��� ��� ��������� ��� ���-�� ���������.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_10");	//����� ��������, ��� ������ � ���� ��������� ��������� ��������� �����.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_11");	//���� ������ � ����� � �������� �� ���. �����, ���������� ���� ����� ����������.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_12");	//���� �������� ���, � ��� ���� ���� ������ ������.
	// � �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_Running,TOPIC_DS2P_InSearchOfTreasure_Start);
};


//NS - 01/05/2013 ===========
// �� ������ "� ������� ��������", �������� ���������
//===========================
instance DIA_Ado_WhereToStart(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 00;
	condition = DIA_Ado_WhereToStart_condition;	
	information = DIA_Ado_WhereToStart_info;
	description = "� ���� ��� ������?";
};
func int DIA_Ado_WhereToStart_condition()
{	
	if (MIS_DS2P_InSearchOfTreasure == LOG_Running)
	{	return TRUE;	};
};
func void DIA_Ado_WhereToStart_info()
{	
	AI_Output(other,self, "DIA_Ado_WhereToStart_15_00");	//� ���� ��� ������?
		AI_Output(self,other, "DIA_Ado_WhereToStart_13_01");	//��� ���-���� ������, ������� ���� �� ����� ������� ���� ������� � �����, ��� �� ��������� �� ������. (������ �������)
		AI_Output(self,other, "DIA_Ado_WhereToStart_13_02");	//�������, � �����, �� ����� ���� ��������� ���-������ �� �������. ���� ����� ������ �������� ���.
		AI_Output(self,other, "DIA_Ado_WhereToStart_13_03");	//� ���� ��������� ���� ������ � �������� ���������� ���������, ���� � ���� ���� ������, �������.
	// � �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_Running,TOPIC_DS2P_InSearchOfTreasure_Map);
	B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"��� ����� �������� ���� ���������� ��������, �� ������, �������.");
	TEACH_Ado_Theft = TRUE;
	TEACH_Ado_Dex = TRUE;
};


//NS - 01/05/2013 ===========
// ���������� ������ "� ������� ��������", ������ 15 ������� �����
//===========================
instance DIA_Ado_GiveTreasure(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 00;
	condition = DIA_Ado_GiveTreasure_condition;	
	information = DIA_Ado_GiveTreasure_info;
	description = "� ������ ��������� ������.";
};
func int DIA_Ado_GiveTreasure_condition()
{	
	if ((MIS_DS2P_InSearchOfTreasure == LOG_Running) && (Npc_HasItems(self, ItMi_OldCoin) >= 15))
	{	return TRUE;	};
};
func void DIA_Ado_GiveTreasure_info()
{	
	var int x;
	AI_Output(other,self, "DIA_Ado_GiveTreasure_15_00");	//� ������ ��������� ������.
	B_GivePlayerXP(XP_MIS_InSearchOfTreasure);
		AI_Output(self,other, "DIA_Ado_GiveTreasure_13_01");	//� � ���� �� ����������. ����� �� ����. ������, ����� �������, ��� ������������. � ��������� ������ �� ��� ���� ������.
		AI_Output(self,other, "DIA_Ado_GiveTreasure_13_02");	//����� ��������, ��� �������� ������ ����������� � ��������, � ������ ��������.
	x = 1;	if (x == 1)	//�������� 15 ������� �����
	{
		B_DS_GiveRemoveItems_Red(other,self,ItMi_OldCoin,15,34);
	};
	AI_Output(other,self, "DIA_Ado_GiveTreasure_15_03");	//��� ������ ���� �������?
		AI_Output(self,other, "DIA_Ado_GiveTreasure_13_04");	//��, �������. ���, ����� ���� ������. �� �� ��� ������ ��� �����. ���� ����� � ��� ������������, ��, �����, ��� ���� �����.
		AI_Output(self,other, "DIA_Ado_GiveTreasure_13_05");	//������������ � ���� � �������� ��������, �� ��� ������ ������� ��. �������, ���� �� �� ������ ��������� � ��� ���������� � ����������, ���� ����� ����� ����� ��������.
	x = 2;	if (x == 2)	//���� ������ ����� ������ �����������
	{
		B_GiveInvItem_red(self,other, ItMw_DS2P_ViperSting ,1,37);	// UNFINISHED ������� ������
	};
	// � �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_SUCCESS,"");
};


//NS - 01/05/2013 ===========
// ����� ����������, � ��������� � �����
//===========================
instance DIA_Ado_WhyPirate(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 20;
	condition = DIA_Ado_WhyPirate_condition;	
	information = DIA_Ado_WhyPirate_info;
	description = "��� �� ���� �������?";
};
func int DIA_Ado_WhyPirate_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU))
	{	return TRUE;	};
};
func void DIA_Ado_WhyPirate_info()
{	
	AI_Output(other,self, "DIA_Ado_WhyPirate_15_00");	//��� �� ���� �������?
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_01");	//�� ��� � ��� - ����� ����� ������, �����, ������� �����������. ���������!
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_02");	//� �����, �������, ��� ��������� �� ���, ��� ��������� � �������, �� ���� �������.
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_03");	//� ������ �� ������ �������� ������� ���� �� ����� ������, ���������� ������� � �������� ����. ��� ��� ��� ������� �����?! (�������)
	AI_Output(other,self, "DIA_Ado_WhyPirate_15_04");	//���� � ������������ �������?
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_05");	//��, �� ����� �������, �� ������ �������������, ����� � ���� �� ��������, �� ���� ������ ��� �� ����� - ��� ����� � ������ ����.
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_06");	//�������, ��� ���� ����� - ������� �� ������ �����, ���� ������ ������� ��������.
};


//NS - 01/05/2013 ===========
// ����� ����������, ��� ����������
//===========================
instance DIA_Ado_WhyHostage(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 21;
	condition = DIA_Ado_WhyHostage_condition;	
	information = DIA_Ado_WhyHostage_info;
	description = "������ �� ����������� ���� �����?";
};
func int DIA_Ado_WhyHostage_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU))
	{	return TRUE;	};
};
func void DIA_Ado_WhyHostage_info()
{	
	AI_Output(other,self, "DIA_Ado_WhyHostage_15_00");	//������ �� ����������� ���� �����?
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_00");	//� �� ��� ��� �� �����?
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_01");	//��� ���������, �������, �� �����, � � ������ ���� �� ������ �� ��������, �� ����� ���������?!
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_02");	//���� � �� ����� � �����, ��� ���� ��������� ���� ����������� ������, �� ������� �� ����� ���������, ���� ���� �� � ������ ��� ������. � ����� ����!
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_03");	//��� ���� ����� �� ����� ������������ ������� ������� ���������� � ����, � ���� ��� ������ ��� ������� ���������.
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_04");	//� ��� � ������� �������� � �����, ����� �� ���� � ������.
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_05");	//� �����, ������, ��� ���� �������������� ��������, ��� ��� ����� ���� ������ ���, ��� ����. (�����������)
};


//NS - 01/05/2013 ===========
// ����� ����������, ����������
//===========================
instance DIA_Ado_NotBored(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 22;
	condition = DIA_Ado_NotBored_condition;	
	information = DIA_Ado_NotBored_info;
	permanent = TRUE;
	description = "���� �� ������� ����� ������?";
};
func int DIA_Ado_NotBored_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU))
	{	return TRUE;	};
};
func void DIA_Ado_NotBored_info()
{	
	AI_Output(other,self, "DIA_Ado_NotBored_15_00");	//���� �� ������� ����� ������?
		AI_Output(self,other, "DIA_Ado_NotBored_13_00");	//� ��� ����� �����?
		AI_Output(self,other, "DIA_Ado_NotBored_13_01");	//����� ������� ������, ����� ������ � ���� �� �������, ������ ��������. ����� ������, ��� ������� ����. �� �� ��� � ��������.
		AI_Output(self,other, "DIA_Ado_NotBored_13_02");	//��� ��� ������, ��� � ������ ���������! ��! � ������, ����� � �������� ��� ���������� ����������, ������ ����� �� ���������� � ���������.
};


//NS - 01/05/2013 ===========
// ����� ����������, ������ �����. ��������� ����� "��������� ��� ������"
//===========================
instance DIA_Ado_JornDead(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 30;
	condition = DIA_Ado_JornDead_condition;	
	information = DIA_Ado_JornDead_info;
	description = "���� ����.";
};
func int DIA_Ado_JornDead_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU) && Npc_IsDead(PIR_210_DS2P_Jorn))
	{	return TRUE;	};
};
func void DIA_Ado_JornDead_info()
{	
	AI_Output(other,self, "DIA_Ado_JornDead_15_00");	//���� ����.
	B_GivePlayerXP(XP_News_JornDead);
		AI_Output(self,other, "DIA_Ado_JornDead_13_01");	//��� ����? �����?
	AI_Output(other,self, "DIA_Ado_JornDead_15_02");	//������ �������. ��� ������ �� �������.
		AI_Output(self,other, "DIA_Ado_JornDead_13_03");	//(�����������) ��� ���� ��������, ��� ������ �� ������?
	AI_Output(other,self, "DIA_Ado_JornDead_15_04");	//�� ����, � ������ ����� ���� � ������.
		AI_Output(self,other, "DIA_Ado_JornDead_13_05");	//������� ���� ������! ��� ���-�� �� �� ����, ��� � ��� ������� ����������� � �������� ��������� ���� ���.
		AI_Output(self,other, "DIA_Ado_JornDead_13_06");	//������, ������ ���������, ������ � ����� � �������, ����� �� ������� �� ��� �����.
	// ��������
	Info_ClearChoices(DIA_Ado_JornDead);
	Info_AddChoice(DIA_Ado_JornDead, "� �� ������� �� ����������.", DIA_Ado_GuardsForCave_No);
	Info_AddChoice(DIA_Ado_JornDead, "������, ������, �� ������ ������.", DIA_Ado_GuardsForCave_Yes);
};
func void DIA_Ado_GuardsForCave_No()
{	
	AI_Output(other,self, "DIA_Ado_GuardsForCave_No_15_00");	//� �� ������� �� ����������.
		AI_Output(self,other, "DIA_Ado_GuardsForCave_No_13_01");	//���� ���� ����! �����, ��� � ��� ���������!
};
func void DIA_Ado_GuardsForCave_Yes()
{	
	var int x;
	AI_Output(other,self, "DIA_Ado_GuardsForCave_Yes_15_00");	//������, ������, �� ������ ������.
		AI_Output(self,other, "DIA_Ado_GuardsForCave_Yes_13_01");	//���! ����������� ��������. �� �����. � �� ������ �� ����� ����� ���� �����.
		AI_Output(self,other, "DIA_Ado_GuardsForCave_Yes_13_02");	//���, ����� ������ �����. ������ ����������!
	x = 1;	if (x == 1)	// ���� 200 �����
	{
		B_GiveInvItems(self,other, ItMi_Gold, 200);
	};
	// � �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_GuardsForCave,LOG_MISSION,LOG_Running,TOPIC_DS2P_GuardsForCave_Start);
};

// UNFINISHED �������� ��������

//NS - 27/06/2013 =========================================================
// �������� 
// ���� �� ���� ����� � ������
//=========================================================================
// ��������� ------------------
instance DIA_Ado_TEACH_Theft(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 500;
	condition = DIA_Ado_TEACH_Theft_condition;	
	information = DIA_Ado_TEACH_Theft_info;
	description = "����� ���� ���������� ����.";
	permanent = TRUE;
};
func int DIA_Ado_TEACH_Theft_condition()
{
	if (TEACH_Ado_Theft == TRUE)
	{	return TRUE;	};
};
func void DIA_Ado_TEACH_Theft_Menu()
{
	Info_ClearChoices(DIA_Ado_TEACH_Theft);
	Info_AddChoice(DIA_Ado_TEACH_Theft,Dialog_Back,DIA_Ado_TEACH_Theft_Back);
	var int Hero_PickpocketSkill; Hero_PickpocketSkill = Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET);
	if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_NONE)
	{
		Info_AddChoice(DIA_Ado_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_FIRST,-1),DIA_Ado_TEACH_Pickpocket1);
	}
	else if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_FIRST)
	{
		Info_AddChoice(DIA_Ado_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_SECOND,-1),DIA_Ado_TEACH_Pickpocket2);
	}
	else if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_SECOND)
	{
		Info_AddChoice(DIA_Ado_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_THIRD,-1),DIA_Ado_TEACH_Pickpocket3);
	};
	Info_AddChoice(DIA_Ado_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKLOCK,1,-1),DIA_Ado_TEACH_PickLock);
};
func void DIA_Ado_TEACH_Theft_info()
{
	AI_Output(other,self,"DIA_Ado_TEACH_Theft_15_00");	//����� ���� ���������� ����.
	DIA_Ado_TEACH_Theft_Menu();
};
func void DIA_Ado_TEACH_Theft_Back()
{
	Info_ClearChoices(DIA_Ado_TEACH_Theft);
};
func void DIA_Ado_TEACH_Theft_DoIt(var int talent, var int lvl, var int price)
{
	if(Npc_HasItems(other,ItMi_Gold) >= price)
	{
		if(B_TeachThiefTalent(self,other,talent,lvl))
		{
			b_giveInvItems(other,self,ItMi_Gold,price);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ado_NoGold_13_00");	//� ���� ������������ ������.
	};
	DIA_Ado_TEACH_Theft_Menu();
};
// UNFINISHED �������� ����
func void DIA_Ado_TEACH_Pickpocket1()
{
	DIA_Ado_TEACH_Theft_DoIt(NPC_TALENT_PICKPOCKET,1,0);
};
func void DIA_Ado_TEACH_Pickpocket2()
{
	DIA_Ado_TEACH_Theft_DoIt(NPC_TALENT_PICKPOCKET,2,0);
};
func void DIA_Ado_TEACH_Pickpocket3()
{
	DIA_Ado_TEACH_Theft_DoIt(NPC_TALENT_PICKPOCKET,3,0);
};
func void DIA_Ado_TEACH_PickLock()
{
	DIA_Ado_TEACH_Theft_DoIt(NPC_TALENT_PICKLOCK,0,0);
};
// �������� ------------------
instance DIA_Ado_TEACH_Dex(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 501;
	condition = DIA_Ado_TEACH_Dex_condition;	
	information = DIA_Ado_TEACH_Dex_info;
	description = "� ���� �������� ��������.";
	permanent = TRUE;
};
func int DIA_Ado_TEACH_Dex_condition()
{
	if (TEACH_Ado_Dex == TRUE)
	{	return TRUE;	};
};
func void DIA_Ado_TEACH_Dex_Menu()
{
	Info_ClearChoices(DIA_Ado_TEACH_Dex);
	Info_AddChoice(DIA_Ado_TEACH_Dex,Dialog_Back,DIA_Ado_TEACH_Dex_Back);
	Info_AddChoice(DIA_Ado_TEACH_Dex,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,1,-1),DIA_Ado_TEACH_Dex_1);
	Info_AddChoice(DIA_Ado_TEACH_Dex,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,5,-1),DIA_Ado_TEACH_Dex_5);
};
func void DIA_Ado_TEACH_Dex_info()
{
	AI_Output(other,self,"DIA_Ado_TEACH_Dex_15_00");	//� ���� �������� ��������.
	DIA_Ado_TEACH_Dex_Menu();
};
func void DIA_Ado_TEACH_Dex_Back()
{
	Info_ClearChoices(DIA_Ado_TEACH_Theft);
};
func void DIA_Ado_TEACH_Dex_DoIt(var int points)
{
	var int cost;
	cost = b_ds_GetTeachAtrPaymentAmount(other,ATR_DEXTERITY,points);
	if(Npc_HasItems(other,ItMi_Gold) >= cost)
	{
		if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,points,T_MAX))
		{
			b_giveInvItems(other,self,ItMi_Gold,cost);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ado_NoGold_13_00");	//� ���� ������������ ������.
	};
	DIA_Ado_TEACH_Dex_Menu();
};
func void DIA_Ado_TEACH_Dex_1()
{
	DIA_Ado_TEACH_Dex_DoIt(1);
};
func void DIA_Ado_TEACH_Dex_5()
{
	DIA_Ado_TEACH_Dex_DoIt(5);
};

// ������������, ����� ������� ��������� � ���, � ���� ���� �� ����
// nr = 2
instance DIA_Ado_UAIsFunny(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 2;
	condition = DIA_Ado_UAIsFunny_condition;	
	information = DIA_Ado_UAIsFunny_info;
	description = "���-�� �� �������.";
	permanent = FALSE;
};

func int DIA_Ado_UAIsFunny_condition()
{
	if (Npc_KnowsInfo(other,DIA_Ado_WhoAreU) && !Npc_IsDead(PIR_210_DS2P_Jorn))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_UAIsFunny_info()
{
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_00");	//���-�� �� �������.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_01");	//� ���� ����������? ���������� ������ ����� ������� �����, ������� ��� ����. �� ��� � ���� ������� ���� ����� �����������. �������!
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_02");	//� ��� ���������?
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_03");	//�� ��������� ��� � ���� ���� ��������. �� �����, � �����. � ��� ����� ��� �� ���� � �����������.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_04");	//�� ������� ��������, ��� � ���.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_05");	//(��������) ������ �� �������� �������� �� ���������� ������������.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_06");	//��� ����� ���. ������� � ������� ��� ���, ����� �� ����� ��� ������ ������.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_07");	//��, � �� � ���, �� ���� ��������� ���� �����, �� ���������� ��� � ���.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_08");	//����� ����������. �����, � ���� ������? ����� � ���������� ��� �� �������� �����?
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_09");	//���, ���� �� ������ ��������� �� ���� ��� �������� � � ��� �� �������, � ���� ��� ��������� ������� ������� ����������. ���� � ���� ��������� ����, � � �� ���������� ��� ����������� ���� ������.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_10");	//�����������.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_11");	//���� ������ ����� ������ � ��������� ���, ��� �� ������. ����� �����, �� ������. � ���� �� ������, ��� ���-�� �� ��������� ��� ��������, �� ��������� ���������, ��� �������������� ���� �� ���������. 
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_12");	//����� �������� ��� ��� ����� ����, � � ���� ���������� �����.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_13");	//��� ���� �� ����, ��� �� ���� ���������. ������ ����� �� ��� �����?
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_14");	//�����, �� ��������� � �������� �������� �����, ����� ������� ���� ����� ������ � ����� ������ ������, ���-�� ����� �������� �������������. ������ ��� ����� ����������� ������ � ���������, ����� �� ������ �� ����������. ������?
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_15");	//����� ���� ������ � ������, ��� ����� ��� �� �����, �� ���������, � ����� ���� �� ���������. �� �� ����?
	Info_ClearChoices(DIA_Ado_UAIsFunny);
	Info_AddChoice(DIA_Ado_UAIsFunny,"���.",DIA_Ado_UAIsFunny_No);
	Info_AddChoice(DIA_Ado_UAIsFunny,"��.",DIA_Ado_UAIsFunny_Yes);
};

// �����������, ���� ������� ������� "���." � ������� ��� "���-�� �� �������."

func void DIA_Ado_UAIsFunny_No()
{
	AI_Output(other,self,"DIA_Ado_UAIsFunny_No_15_00");	//���, ���������� ���.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_No_13_01");	//����� �� �������� ���� � ���� �����.
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "��." � ������� ��� "���-�� �� �������."

func void DIA_Ado_UAIsFunny_Yes()
{
	AI_Output(other,self,"DIA_Ado_UAIsFunny_Yes_15_00");	//��, ��� ����� ��������������.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_Yes_13_01");	//�������, ����� ��� ���� �������. � ���� � ������� ������������, � ����� ���� �����. ���� ���� �� ����� �����������.
	// ������� ������� � ��������� ��� � ������ ��
	CreateInvItems(self,ItFo_Samogon,1);
	B_GiveInvItems(self,other,ItFo_Samogon,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_Start);
	AI_StopProcessInfos(self);
};

// ������������, ����� ����, ��� ���� ������ �������
// nr = 1

instance DIA_Ado_AfterDrinkSamogon(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AfterDrinkSamogon_condition;	
	information = DIA_Ado_AfterDrinkSamogon_info;
	description = "��� ������.";
	permanent = FALSE;
};

func int DIA_Ado_AfterDrinkSamogon_condition()
{
	if (Npc_KnowsInfo(other,DIA_Jorn_BringCimmSamogon) && (MIS_DS2P_ExposeJorn == Log_Running))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AfterDrinkSamogon_info()
{
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_15_00");	//��� ������. ���� � ������������� ����� �������, ��������� �� ������������.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_13_01");	//�������! ��� ����� ���� ����� ��� ���������� �������� �� ������. ���� ���� ��� ������ ����������. ��-��, ��� �� �������, ����� ���� ������ ��� ���������!
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_15_02");	//� �������� �� ����� ������.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_13_03");	//��, ��������, ����� �������? � ���� ���� ��� ��� ��������� �����, ���, ������, ������, �� ��� ��� �������. ��� � ���� ���� ��� ��� ������ ����, ��������� ���������� ��� ��� � ����� ������. � ���, ������� �������� ���. ��� �� ��������?
	Info_ClearChoices(DIA_Ado_AfterDrinkSamogon);
	Info_AddChoice(DIA_Ado_AfterDrinkSamogon,"��� ��� ���.",DIA_Ado_AfterDrinkSamogon_RewardShield);
	Info_AddChoice(DIA_Ado_AfterDrinkSamogon,"��� ��� ��� ��� ������ ����.",DIA_Ado_AfterDrinkSamogon_Reward2x2);
	Info_AddChoice(DIA_Ado_AfterDrinkSamogon,"��� ��� �����.",DIA_Ado_AfterDrinkSamogon_RewardSabre);
};

// �����������, ���� �� ������ ������� "��� ��� �����." � ������� ��� "��� ������."

func void DIA_Ado_AfterDrinkSamogon_RewardSabre()
{
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_RewardSabre_15_00");	//��� ��� �����. ������ ������ ������� � ���������� ������.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_RewardSabre_13_01");	//���, �����. �� ������ �� ���� ������ �������, ���� �� ����� ������ �������.
	//������� ����� � ��������� ��� � ������ �� (UNFINISHED: ���� ������� �������, � �������� ���)
	CreateInvItems(self,0/*"SABRE_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"SABRE_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_Success);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};
	
// �����������, ���� �� ������ ������� "��� ��� ��� ��� ������ ����." � ������� ��� "��� ������."

func void DIA_Ado_AfterDrinkSamogon_Reward2x2()
{
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_Reward2x2_15_00");	//��� ��� ��� ��� ������ ����. ����� ������� ������ �������.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_Reward2x2_13_01");	//���, ������. ��� ������� ���, �� �� ��� ������ ���� �����.
	//������� ��� � ��������� ��� � ������ �� (UNFINISHED: ���� ������� �������, � �������� ���)
	CreateInvItems(self,0/*"2x2_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"2x2_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_Success);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};
	
// �����������, ���� �� ������ ������� "��� ��� ���." � ������� ��� "��� ������."

func void DIA_Ado_AfterDrinkSamogon_RewardShield()
{
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_RewardShield_15_00");	//��� ��� ���. ������ � ��� ���� ���.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_RewardShield_13_01");	//��� ��. �� ��� �������� � �������� ����� �� ����� ����������� ���� �����. ��� �� ���������, � ���������� ������� ��� � ������� �� �� ������, ������� ������� ������ � ���� ��������� ���� �����.
	//������� ��� � ��������� ��� � ������ �� (UNFINISHED: ���� ������� �������, � �������� ���)
	CreateInvItems(self,0/*"SHIELD_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"SHIELD_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_Success);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};	
	
// ������������, ����� ����, ��� ���� ��������� � ���� �� ��������� ����, ����� ������� ��������
// nr = 1

instance DIA_Ado_AfterJornSamogon(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AfterJornSamogon_condition;	
	information = DIA_Ado_AfterJornSamogon_info;
	description = "��� ������?";
	permanent = FALSE;
};

func int DIA_Ado_AfterJornSamogon_condition()
{
	if (Npc_KnowsInfo(other,DIA_Jorn_AfterSamogonTalk) && (MIS_DS2P_ExposeJorn == Log_Success))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AfterJornSamogon_info()
{
	AI_Output(other,self,"DIA_Ado_AfterJornSamogon_15_00");	//��� ������?
	AI_Output(self,other,"DIA_Ado_AfterJornSamogon_13_01");	//��� ������ ���������! ��� ����� ���, ��� � � ���������. ����, ��� ������ ������, ��� ����� ��� �� �����, ������ � ����� ������, ��� ��� ���� ����� ����� �����.
	AI_Output(self,other,"DIA_Ado_AfterJornSamogon_13_02");	//�� �������, ������, �� �����, � �������, ��� ������. ������ ������� ���� ����� �������� ��� �����. ��-��!
	AI_Output(other,self,"DIA_Ado_AfterJornSamogon_15_03");	//�����?
	AI_Output(self,other,"DIA_Ado_AfterJornSamogon_13_04");	//��������! ���� �������, �� ������ �������� �� �����. ��-��! ������ ��� ��� �� ����������� ������ �������.
	AI_Output(other,self,"DIA_Ado_AfterJornSamogon_15_05");	//��� �� ����. �����!
	AI_StopProcessInfos(self);
};
	
// ������������, ����� ����, ��� ����� ��� �����, � ������� ������ �������
// nr = 1

instance DIA_Ado_AlternativeSamogon(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AlternativeSamogon_condition;	
	information = DIA_Ado_AlternativeSamogon_info;
	description = "��� ����������.";
	permanent = FALSE;
};

func int DIA_Ado_AlternativeSamogon_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Running) && Npc_KnowsInfo(other,DIA_Jorn_AfterSamogonTalk))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AlternativeSamogon_info()
{
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_00");	//��� ����������.
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_01");	//���� ����� ������� �� ������������?
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_02");	//� ���� �� ����������. ��������� ����� ����� ��� ����� ���� �����.
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_03");	//�������! ������-�� ��� ����� �� �� �������� � ��� �����.
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_04");	//���������, �������� ��� ���������� �����, ���������. �������� � ������������.
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_05");	//� ���� ��� �����, ��� ������ ������� � ���� �� ��������. ��������� ������� ���� �����.
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_06");	//������ ��������, ����� ����� ���������� ���-�� �, ���, ����.
	// ������ ������ ������� ���
	B_GiveInvItems(other,self,ItMi_DS2P_SamogonForJorn,1);
	// ������� ������� �� ��������� ���
	Npc_RemoveInvItems(self,ItMi_DS2P_SamogonForJorn,1);
	// ������� � ��������� �� ������� � �������� ���
	CreateInvItems(other,ItFo_Samogon,1);
	B_UseItem(other,ItFo_Samogon);
	// ������� � ��������� ��� ������� � �������� ���
	CreateInvItems(self,ItFo_Samogon,1);
	B_UseItem(self,ItFo_Samogon);
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_07");	//��, ������ �����!
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_08");	//������ ��������� � ���� �������.
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_09");	//��, ���, ����� 200 �������.
	// ������� � ��������� ��� 200 ������� � ������ ��
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Jorn_LastTalkDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};
	
// ������������, ����� ����, ��� ���������� � ������ �� ��� �� ����. ����
// nr = 1

instance DIA_Ado_AfterSamogonAdo(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AfterSamogonAdo_condition;	
	information = DIA_Ado_AfterSamogonAdo_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ado_AfterSamogonAdo_condition()
{
	if (Npc_KnowsInfo(other,DIA_Jorn_AfterSamogonAdo))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AfterSamogonAdo_info()
{
	AI_Output(self,other,"DIA_Ado_AfterSamogonAdo_13_00");	//�� ���, ��������, ������?
	AI_Output(other,self,"DIA_Ado_AfterSamogonAdo_15_01");	//��, ������� �� ���������! � ���� ������ ����� �������?
	AI_Output(self,other,"DIA_Ado_AfterSamogonAdo_13_02");	//��, ������, ��� ��� ������������. ���! � �� �����!
	AI_Output(other,self,"DIA_Ado_AfterSamogonAdo_15_03");	//���������, ��������.
	AI_Output(self,other,"DIA_Ado_AfterSamogonAdo_13_04");	//�� � ���� ������
	AlternativeSamogon_FightAdo = 0;
	B_Attack(self,other,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// ������������, ����� ����, ��� �� ������� ��� (��� �� ��������� �������?)
// nr = 1

instance DIA_Ado_AfterSamogonFight(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AfterSamogonFight_condition;	
	information = DIA_Ado_AfterSamogonFight_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ado_AfterSamogonFight_condition()
{
	if ((AlternativeSamogon_FightAdo == 1) && Npc_IsInState(self,ZS_Talk))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AfterSamogonFight_info()
{
	AI_Output(other,self,"DIA_Ado_AfterSamogonFight_15_00");	//�����?
	AI_Output(self,other,"DIA_Ado_AfterSamogonFight_13_01");	//������ � �����!
	AI_StopProcessInfos(self);
};

// ������������, ����� ����, ��� �� ������ ������ �� ���� �� ������ "��������� ��� ������"
// nr = 1

instance DIA_Ado_GuardsForCaveComplete(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_GuardsForCaveComplete_condition;	
	information = DIA_Ado_GuardsForCaveComplete_info;
	description = "� �������� ���� �������.";
	permanent = FALSE;
};

func int DIA_Ado_GuardsForCaveComplete_condition()
{
	if ((MIS_DS2P_GuardsForCave == Log_Running) && Npc_KnowsInfo(other,DIA_Karah_JornIsDead))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_GuardsForCaveComplete_info()
{
	AI_Output(other,self,"DIA_Ado_GuardsForCaveComplete_15_00");	//� �������� ���� �������. ���� �������� � ���� � ������ ������.
	AI_Output(self,other,"DIA_Ado_GuardsForCaveComplete_13_01");	//���! �� �� ������ �������. ������� ����.
	AI_Output(other,self,"DIA_Ado_GuardsForCaveComplete_15_02");	//��, � ��� �� �������?
	AI_Output(self,other,"DIA_Ado_GuardsForCaveComplete_13_03");	//�������? ��, ���� ���� ���� ���� �������� �����. ��������?
	AI_Output(other,self,"DIA_Ado_GuardsForCaveComplete_15_04");	//�����.
	// ������� � ��������� ��� 2 �������� �����
	CreateInvItems(self,ItPo_DSG_Health_Mittel,2);
	B_GiveInvItems(self,other,ItPo_DSG_Health_Mittel,2);
	B_DSG_Log_OpenClose(TOPIC_DS2P_GuardsForCave,LOG_MISSION,LOG_Success,TOPIC_DS2P_GuardsForCave_Success);
	B_GivePlayerXP(XP_MIS_DS2P_GuardsForCave);
	AI_StopProcessInfos(self);
};

// ������������, ���� ������� ����� "������", � �� ��������� � ������
// nr = 1

instance DIA_Ado_WhereIsLulu(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_WhereIsLulu_condition;	
	information = DIA_Ado_WhereIsLulu_info;
	description = "(�� ������ ����)";
	permanent = FALSE;
};

func int DIA_Ado_WhereIsLulu_condition()
{
	if ((MIS_DS2P_TomsLetter == Log_Running) && Npc_KnowsInfo(other,DIA_Viola_WhereIsLulu))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_WhereIsLulu_info()
{
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_00");	//��-����� ������ ��������� ���� ������.
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_01");	//�, ��. ���� �� ���� ��������� ��� �������.
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_02");	//�����?
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_03");	//(���������) ���-�� �� ������ ���������, ������. �� ��������� �� ���� ������� ���?
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_04");	//�� �����, ���-�� ������ ����������, � �� �� �� ��������. ������, ��� ������ �� �����.
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_05");	//�� ������� � �����-�� � ���. ���� ����� �������� ������������� ����� ����� ���� ����, ��� �� � �������� �������� ��� ����. � ����� ��� ������ � ����, �� � �������� ��������.
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_06");	//������ ��� ��������, ����� �� �������� �� ����������� �� ������ �������, ������� ����� � ����� ������ ������?
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_07");	//(�����) ���, � ������� �� �����.
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_08");	//(������) �������, ��� ����� �� ������.
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_09");	//� �� ��� �� �������-��?
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_10");	//�� �����, ��� ���-�� �������� ��������, � ����� �� ����� �������. �������, ��� ������������� ����� �������� �� �������� ����.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TomsLetter,LOG_MISSION,LOG_Running,TOPIC_DS2P_TomsLetter_LuluIsGone_02);
	AI_StopProcessInfos(self);
};