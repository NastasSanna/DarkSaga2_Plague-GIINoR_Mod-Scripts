/***************************************************************
						�������� �� ��������
  �������� ����, ������� ����� ������� ������ ���-��-���.
  ��� ���� �������, �������� ��� ������.
***************************************************************/

instance DIA_GuardMill_EXIT(DIA_Proto_End)
{
	npc = PIR_223_DS2P_GuardMill;
};

///////////////////////////// ����� /////////////////////////////
//��� � ���������� �������

/////////////////////// �����: ����� ��� ////////////////////////
//===================================================
instance DIA_GuardMill_Distract(C_Info)
{
	npc = PIR_223_DS2P_GuardMill;				nr = 1;
	condition = DIA_GuardMill_Distract_Cond;
	information = DIA_GuardMill_Distract_Info;
	description = "��! ����� ��� ������? (�������)";
	permanent = TRUE;
};
//���������: ����� ������ ��� - ����� �������� ����
//�������: � 23 �� 4, ���� �������� ����� �� ��������, ���� ��� ������� ��������, ����, ����� ��� ������� ���������
//���������: ������ ����
func int DIA_GuardMill_Distract_Cond()
{
	if (MIS_DS2P_QuirkyThief_GuardMill && !MIS_DS2P_QuirkyThief_GuardMill_Down
		&& Wld_IsTime(23,0,4,0)
	)	{
		return TRUE;
	};
};
var int DIA_GuardMill_Distract_AlcoholToGive;
var int DIA_GuardMill_Distract_BottlesGiven;
func void DIA_GuardMill_Distract_Menu()
{
	Info_ClearChoices(DIA_GuardMill_Distract);
	//����� �������� (���� ��):
	//(������ ������� �������, ������� ���� � �������)
	if (Npc_HasItems(other, ItFo_DS2P_BullSeed)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ������� ������", DIA_GuardMill_Distract_Give_BullSeed);
	};
	if (Npc_HasItems(other, ItFo_DS2P_GobboSmile)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ������ �������", DIA_GuardMill_Distract_Give_GobboSmile);
	};
	if (Npc_HasItems(other, ItFo_DS2P_Berserker)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ��������", DIA_GuardMill_Distract_Give_Berserker);
	};
	if (Npc_HasItems(other, ItFo_DS2P_TrollBooze)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ���������� �����", DIA_GuardMill_Distract_Give_TrollBooze);
	};
	if (Npc_HasItems(other, ItFo_DS2P_MagicGrog)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ����������� �����", DIA_GuardMill_Distract_Give_MagicGrog);
	};
	if (Npc_HasItems(other, ItFo_DS2P_Kamikaze)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ���������", DIA_GuardMill_Distract_Give_Kamikaze);
	};
	
	if (Npc_HasItems(other, ITFO_SAMOGON)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ��������", DIA_GuardMill_Distract_Give_SAMOGON);
	};
	if (Npc_HasItems(other, ItFo_Addon_SchnellerHering)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ������� �������", DIA_GuardMill_Distract_Give_SchnellerHering);
	};
	if (Npc_HasItems(other, ItFo_Addon_SchlafHammer)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� �������� ������ ��", DIA_GuardMill_Distract_Give_SchlafHammer);
	};
	if (Npc_HasItems(other, ItFo_Addon_LousHammer)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ������ ��", DIA_GuardMill_Distract_Give_LousHammer);
	};
	if (Npc_HasItems(other, ItFo_Addon_Grog)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� �����", DIA_GuardMill_Distract_Give_Grog);
	};
	if (Npc_HasItems(other, ItFo_Addon_Rum)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ����", DIA_GuardMill_Distract_Give_Rum);
	};
	if (Npc_HasItems(other, ItFo_Beer)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ����", DIA_GuardMill_Distract_Give_Beer);
	};
	if (Npc_HasItems(other, ItFo_Booze)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ������", DIA_GuardMill_Distract_Give_Booze);
	};
	if (Npc_HasItems(other, ItFo_Wine)) {
		Info_AddChoice(DIA_GuardMill_Distract, "���� ������� ����", DIA_GuardMill_Distract_Give_Wine);
	};
};

//������� 1
func void DIA_GuardMill_Distract_GiveAlcohol1()
{
	DIA_GuardMill_Distract_BottlesGiven += 1;
		AI_Output(other,self,"DIA_GuardMill_Distract_GiveAlcohol1_15_01");	//��� �� ����. ���, �����.
	//������ ��������� �������, �������� ��������
	B_DS_GiveRemoveItems(other, self, DIA_GuardMill_Distract_AlcoholToGive, 1);
	AI_UseItem(self, DIA_GuardMill_Distract_AlcoholToGive);
	AI_Output(self,other,"DIA_GuardMill_Distract_GiveAlcohol1_99_02");	//(������) ��� ������ �����, ��� ������� �������� �����.
			AI_Output(other,self,"DIA_GuardMill_Distract_GiveAlcohol1_15_03");	//�����, ���?
	AI_Output(self,other,"DIA_GuardMill_Distract_GiveAlcohol1_99_04");	//�����.
	DIA_GuardMill_Distract_Menu();
};

//������� 2
func void DIA_GuardMill_Distract_GiveAlcohol2()
{
	//������ ��������� �������, �������� ��������
	B_DS_GiveRemoveItems(other, self, DIA_GuardMill_Distract_AlcoholToGive, 1);
	AI_UseItem(self, DIA_GuardMill_Distract_AlcoholToGive);
	AI_Output(self,other,"DIA_GuardMill_Distract_99_01");	//������-�� ���! � ����� ������ �����������. ��� �... (��������� �����)
	//�������� ������� ����� ����� �� �����, ����� ��� ������������ ���������� ���
	AI_StartState(self, ZS_Sleep_Deep, 0, self.wp);
	//�������� ����������
	AI_StopProcessInfos(self);
	//������ � ��������. ����� ������ ���: �������� ��������
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_DistractBooze);
};
func void DIA_GuardMill_Distract_Give_Next()
{
	if (DIA_GuardMill_Distract_BottlesGiven == 0) {
		DIA_GuardMill_Distract_GiveAlcohol1();
	}
	else {
		DIA_GuardMill_Distract_GiveAlcohol2();
	};
};
func void DIA_GuardMill_Distract_Give_BullSeed() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_BullSeed;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_GobboSmile() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_GobboSmile;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Berserker() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_Berserker;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_TrollBooze() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_TrollBooze;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_MagicGrog() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_MagicGrog;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Kamikaze() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_DS2P_Kamikaze;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_SAMOGON() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ITFO_SAMOGON;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_SchnellerHering() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_SchnellerHering;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_SchlafHammer() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_SchlafHammer;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_LousHammer() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_LousHammer;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Grog() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_Grog;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Rum() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Addon_Rum;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Beer() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Beer;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Booze() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Booze;
	DIA_GuardMill_Distract_Give_Next();
};
func void DIA_GuardMill_Distract_Give_Wine() 
{
	DIA_GuardMill_Distract_AlcoholToGive = ItFo_Wine;
	DIA_GuardMill_Distract_Give_Next();
};


func void DIA_GuardMill_Distract_Info()
{
	if (C_NpcHasAlcohol(other) < 2) {
		AI_PrintS_Ext(other, "� ���� ������������ ��������,", COL_Maroon);
		AI_PrintS_Ext(other, "����� ������ ���!", COL_Maroon);
		return;
	};
		AI_Output(other,self,"DIA_GuardMill_Distract_15_01");	//��! ����� ��� ������?
	AI_Output(self,other,"DIA_GuardMill_Distract_99_02");	//�� ������� � ������. ���� ��� ����� ����, ���� � ����� ���. 
	AI_Output(self,other,"DIA_GuardMill_Distract_99_03");	//������ ���� ���� �����, ������� ������. �-�-�, ���������� �����������!
		AI_Output(other,self,"DIA_GuardMill_Distract_15_04");	//(������������) ������. �����, �� ������ ������?
	AI_Output(self,other,"DIA_GuardMill_Distract_99_05");	//� � ���� ����?
	DIA_GuardMill_Distract_Menu();
	//��� �� �� �������, ����������� ����������
};


//�����
//������, �����
