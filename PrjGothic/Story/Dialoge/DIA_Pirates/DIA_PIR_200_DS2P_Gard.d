instance DIA_Gard_EXIT(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Gard_EXIT_condition;	
	information = DIA_Gard_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Gard_EXIT_condition(){	return TRUE;};
func void DIA_Gard_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 19/06/2013 ===========
//  �������� � ������
//===========================
instance DIA_Gard_WithGregStart(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 0;
	condition = DIA_Gard_WithGregStart_condition;	
	information = DIA_Gard_WithGregStart_info;
	important = TRUE;
};
func int DIA_Gard_WithGregStart_condition(){	return TRUE;};
func void DIA_Gard_WithGregStart_info()
{
	var C_NPC Gard;	Gard = Hlp_GetNpc(PIR_200_DS2P_Gard);
	var C_NPC Greg;	Greg = Hlp_GetNpc(PIR_201_DS2P_Greg);
	TRIA_Invite(Greg);
	TRIA_Start();
	
	AI_TurnToNpc(Gard,Greg); Mdl_StartFaceAni(Gard, "S_ANGRY",1,-1);
	AI_TurnToNpc(Greg,Gard); Mdl_StartFaceAni(Greg, "S_ANGRY",1,-1);
	
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_00");	//(���������) ��� ��� ���� ����� ������ �� ����? �? �� ����� ���� ������ ��������, ������� ���� �����!
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_01");	//�� ���, �����, ��� ����� �������? �? �������, ����� �����!

	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Gard_WithGregStart_11_02");	//� �� ��� ��������� ��������. ��� ����... � ��� �����, ��� �� ������� ��������� ��������.

	TRIA_Next(Gard);
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_03");	//����� � ����� � ��������. �� ������ ��� �����������, � �� ������ ����� ������ ����� �������� �������!

	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Gard_WithGregStart_11_04");	//(������) � ����� ������� � ������ ��� ������ ���� ������? �� �� ������ ����� � ������!

	TRIA_Next(Gard);
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_05");	//�� ����� �� ���� ������� ������! ���� ���� ������� �� ��� ��������. ��� �� ������� ������� � �����������.
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_06");	//���� �� �, ��� ������ ���� ������ � ����, ������ �� ����� ������� ��� �� ����, ��� � �� ����� ����� ������ ����� ������ ���! �������� � ���� ����!

	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_07");	//(������ ������ ���� ��� ���) �� ��� � ����� �������... �����...

	//���� ���� ����� ������� ���������!
	Npc_SetToFistMode(Gard);
	Npc_SetTarget(Gard, Greg);
	AI_Attack(Gard);
	B_RemoveWeapon(Gard);

	TRIA_Next(Gard);
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_08");	//�� ������� � ���� ������ ���-�� �������, ������ ��� � ���� � ������! �� ���� �����?

	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Gard_WithGregStart_11_09");	//��, �����...

	DIAG_Reset();
	TRIA_Finish();
	// UNFINISHED ���� ������ � �������� � �����-������ ����
	B_StartOtherRoutine(Greg, "START");
	// ������� ���������� �����
	B_StartOtherRoutine(Gard, "START");
};

//NS - 19/06/2013 ===========
//  ����� ������ � ������ ���� ��� ���������� � ��
//===========================
instance DIA_Gard_Start(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 0;
	condition = DIA_Gard_Start_condition;	
	information = DIA_Gard_Start_info;
	important = TRUE;
};
func int DIA_Gard_Start_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_WithGregStart)){	return TRUE;	};
};
func void DIA_Gard_Start_info()
{
		AI_Output(self,other,"DIA_Gard_Start_01_00");	//��� � ��� ���������? ��� ��������� ����������� ��������. 
	AI_Output(other,self,"DIA_Gard_Start_15_01");	//� ��...
		AI_Output(self,other,"DIA_Gard_Start_01_02");	//��� ��� �������� ���� ��������, � � ������ ���� ������, ������ �� ������� � ����, ������� �������� ����.
		AI_Output(self,other,"DIA_Gard_Start_01_03");	//�������, ��������� �� ��������. � �� ������ ����� �� �����! ��� ��� � ���� �� ���� �� �������? �������!
	AI_Output(other,self,"DIA_Gard_Start_15_04");	//�� �� �����. ��� �������� ����� ��������� ���� ����� ����, ��� �� ������� � ������� ����������...
		AI_Output(self,other,"DIA_Gard_Start_01_05");	//(����������) ������� ����������? �� ������ ����� �������?
	AI_Output(other,self,"DIA_Gard_Start_15_06");	//��. ��� ��������� ��������, ������ ��� ��������. ����� ����� � ����� ������ ��������� ���������� �����, ������� �������� ��� ������.
	AI_Output(other,self,"DIA_Gard_Start_15_07");	//����� �� ���������, ������ ��� �������� ����� ������� ��� ����. 
		AI_Output(self,other,"DIA_Gard_Start_01_08");	//(���������) ���� �� �� �����... ��... ���� ��� �����������... ���, �� �� ������� �� ��� ������. ��� � �����?
	AI_Output(other,self,"DIA_Gard_Start_15_09");	//��� �� ���...
		AI_Output(self,other,"DIA_Gard_Start_01_10");	//(������) ������ ����� � ������� �� ������!
	AI_Output(other,self,"DIA_Gard_Start_15_11");	//��� ��������� ����� ��������� ���� ����� ��������. ������� ���� ������, ����� �������. ������ ���� ���-�� �� ������� ������ � ����.
	AI_Output(other,self,"DIA_Gard_Start_15_12");	//�� � ��������, ����� �����, ������������� ������ ����������, �� ��� ��� ����������. �������, �� ������ ������ ������ �� ����� �� ����������� ��������.
	AI_Output(other,self,"DIA_Gard_Start_15_13");	//��� ���������, ��� ��� �������� ������ ���� ������.
		AI_Output(self,other,"DIA_Gard_Start_01_14");	//�������. � ��� ���� ���� �� ����������� �� ���? �� �� ���� ��� ����� �������.
	AI_Output(other,self,"DIA_Gard_Start_15_15");	//� ������� ���� ��������. ��������, ���� �������� �����, � ��������� ������, � ��� �� ����� ������� �� ������ ����.
		AI_Output(self,other,"DIA_Gard_Start_01_16");	//��, ���� ��� ���-��� ����������� � ����� ������������. �������, ��� �� ���� � ��������� ��������. (�������) ���� ���� ������ � �������� �������.
		AI_Output(self,other,"DIA_Gard_Start_01_17");	//��, �� �����. � �����, � ����� ��������� ��� ����� ������� ������ �������� � �����. ����� ����� �� ������� ��� �������, � �� ��������.
		AI_Output(self,other,"DIA_Gard_Start_01_18");	//�� ��� � ������� ���� � ����� ������ � �����. ��-�����, �������� ������. (������ �������)
	AI_Output(other,self,"DIA_Gard_Start_15_19");	//�� ��� �������?
		AI_Output(self,other,"DIA_Gard_Start_01_20");	//�������! � �� ����� ���� �����. ������, ���� �� �� ������ �������� � ����� � ��������� �����, � ���� �� ��� � ��-������.
		AI_Output(self,other,"DIA_Gard_Start_01_21");	//��, �����, ���� ��� �� ����������.

	//������ � �������� "������ � �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Gard);
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_UnPirate);

	AI_StopProcessInfos(self);
};

//NS - 19/06/2013 ===========
//  ����� ����������
//===========================
instance DIA_Gard_CanIAsk(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_CanIAsk_condition;	
	information = DIA_Gard_CanIAsk_info;
	description = "� ���� ������ ���� ��������� ��������?";
};
func int DIA_Gard_CanIAsk_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_Start)){	return TRUE;	};
};
func void DIA_Gard_CanIAsk_info()
{
	AI_Output(other,self,"DIA_Gard_CanIAsk_15_00");	//� ���� ������ ���� ��������� ��������?
	AI_Output(other,self,"DIA_Gard_CanIAsk_15_01");	//��� ����� ����������, ������� ������� ������ �������� � �����.
		AI_Output(self,other,"DIA_Gard_CanIAsk_01_02");	//���! ������ ������, ��� ����� ��������, ����� ����� ������������ ��� ������ ����?
		AI_Output(self,other,"DIA_Gard_CanIAsk_01_03");	//����! �� �� �� �������, � ���� ����� �����, ����� ��������� ������ �����! ���������, ��� �����.
};

//NS - 19/06/2013 ===========
//  ������� � �������� �� �������
//===========================

// ---------------------------------
// "��� ����� �� �� �������?"	nr = 1
instance DIA_Gard_HowLong(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_HowLong_condition;	
	information = DIA_Gard_HowLong_info;
	description = "��� ����� �� �� �������?";
};
func int DIA_Gard_HowLong_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_HowLong_info()
{
	AI_Output(other,self,"DIA_Gard_HowLong_15_00");	//��� ����� �� �� �������?
		AI_Output(self,other,"DIA_Gard_HowLong_01_01");	//��� ����� ������, ������� ���� � ������!
		AI_Output(self,other,"DIA_Gard_HowLong_01_02");	//� ��� �������� ���� ������ ������, ��� �����. � ��� ��� �����, ���� ����� �����������. (������ �������)
	AI_Output(other,self,"DIA_Gard_HowLong_15_03");	//�� ��� ���������, ��� �� ��������� �����?
		AI_Output(self,other,"DIA_Gard_HowLong_01_04");	//� ������ ��� � ����� �, ������� ����, ������� ��� �������� ���������, ���� ���� � �����.
		AI_Output(self,other,"DIA_Gard_HowLong_01_05");	//� ������ ������ ����� �� ������, ��� ����� ������ ����, ��������� ���� �� ��, ����� ������ ������� � ������� �������� ������. �� ��� ��� ���� �������, ����� �� � �����...
		AI_Output(self,other,"DIA_Gard_HowLong_01_06");	//��� ������ ������� ��������� ������� �� ����� ������� ����� � ����� ������. �� ��� ������ ����. ��� ������ ��� ������� ������, �� �����.
		AI_Output(self,other,"DIA_Gard_HowLong_01_07");	//������� ������� ����������� �� ������, ������� ����� ��� ������� �������� ����. ��, ������, � ���� ����� ��������... ���, ��������, �� ����������?
	AI_Output(other,self,"DIA_Gard_HowLong_15_08");	//������������
		AI_Output(self,other,"DIA_Gard_HowLong_01_09");	//��! �� ���� ����������� �� ������ ���� ������� ������ � ������� �� ���� �� ������.
		AI_Output(self,other,"DIA_Gard_HowLong_01_10");	//�����, ��� ������ ���������� ��������, � �� �� � ����� ������ � ����. ��� �� ���� ����� ��� ����������, ����� ������ � ������, ��� ��� �������� ���������� ����. 
};

// ---------------------------------
// "������ ���� ����� ���� ������ ��������?"	nr = 2
instance DIA_Gard_AboutGreg(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 2;
	condition = DIA_Gard_AboutGreg_condition;	
	information = DIA_Gard_AboutGreg_info;
	description = "������ ���� ����� ���� ������ ��������?";
};
func int DIA_Gard_AboutGreg_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_AboutGreg_info()
{
	AI_Output(other,self,"DIA_Gard_AboutGreg_15_00");	//������ ���� ����� ���� ������ ��������?
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_01");	//� ��� ��� ��� ����, ������� ���� ����?!
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_02");	//���� �� �� ��� ����, ������ �����-�� ���������, � �� �� ���� ��� �� ������� ���� �����! �� ���� ������ ���� � ����� �������� ������������.
	AI_Output(other,self,"DIA_Gard_AboutGreg_15_03");	//��� ���������?
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_04");	//���� ������� ����� �����, ��� ����� ������ ��� �����! ��!
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_05");	//�����, ��� ��� ����� �� ���������, ��� � ��� ������ �������, �� �� �����������!
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_06");	//�� ����� ����������� ����� � ��� ����� � ��������� ��� �������� ������ ��� � ������. �� � �� ����� �����, ��� �� ��� �� ��������.
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_07");	//�� ������ ������� ������ � ������ ������ ��� ����. � ����� �����, ��� ���� ����������� ������ ������ ����, ������� ��������� ��������� �� ������.
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_08");	//����� ����� � ���� ���, ��� �������� ����. �� �, ������� ��, ����� ���� ��������� � ����� � ���� � ��� �����, � � ������� ��� �������� ���.
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_09");	//��! ��� ���� ������! (������ �������)
	var C_NPC Greg; Greg = Hlp_GetNpc(PIR_201_DS2P_Greg);
	// ���������� � �����
	if (Npc_GetDistToNpc(self, Greg) < PERC_DIST_ACTIVE_MAX)
	{
		AI_TurnToNpc(self, Greg);
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_10");	//����, ���� ����� ��� ������? ��-��-��!
	};
};

// ---------------------------------
// "��� ��� ����� ��������?"	nr = 3
instance DIA_Gard_AboutHealer(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 3;
	condition = DIA_Gard_AboutHealer_condition;	
	information = DIA_Gard_AboutHealer_info;
	description = "��� ��� ����� ��������?";
};
func int DIA_Gard_AboutHealer_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_AboutHealer_info()
{
	AI_Output(other,self,"DIA_Gard_AboutHealer_15_00");	//��� ��� ����� ��������?
		AI_Output(self,other,"DIA_Gard_AboutHealer_01_01");	//� � ������ ����? �� ������ �����, ��� ��? �� ��� ������, ��� ����� ������ ������� ��� ������������!
		AI_Output(self,other,"DIA_Gard_AboutHealer_01_02");	//������ ����� � ������� �����, � �� � ������� �� �����! �� ����� �� ��� ������ �� �����, ��������.
};

// ---------------------------------
// "��� �� ���������� �����������?"	nr = 4
instance DIA_Gard_AboutPlans(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 4;
	condition = DIA_Gard_AboutPlans_condition;	
	information = DIA_Gard_AboutPlans_info;
	description = "��� �� ���������� �����������?";
};
func int DIA_Gard_AboutPlans_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_AboutPlans_info()
{
	AI_Output(other,self,"DIA_Gard_AboutPlans_15_00");	//��� �� ���������� �����������?
		AI_Output(self,other,"DIA_Gard_AboutPlans_01_01");	//��� ��������? �������� � ����� �������� ������ �������.
		AI_Output(self,other,"DIA_Gard_AboutPlans_01_02");	//���� �� �� �����, � ������ ���������� ���� �� ���, �� ��� �������� �������� ����� ����� ��� ����� �������. �� �������� ��� �������, ������� ������� �� �����.
};

// ---------------------------------
// "��� ����� ������."	nr = 5
instance DIA_Gard_NeedGold(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 5;
	condition = DIA_Gard_NeedGold_condition;	
	information = DIA_Gard_NeedGold_info;
	description = "��� ����� ������.";
};
func int DIA_Gard_NeedGold_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_NeedGold_info()
{
	AI_Output(other,self,"DIA_Gard_NeedGold_15_00");	//��� ����� ������.
		AI_Output(self,other,"DIA_Gard_NeedGold_01_01");	//��! ������� ���� �����, ���� ����� ������!
		AI_Output(self,other,"DIA_Gard_NeedGold_01_02");	//��������� �������� � ���� ���� ��������� �����������, � � ���� ����� ������� ������, ��� ���� ������ ����������� ��� ������� ��� ������! (������ �������)
	AI_Output(other,self,"DIA_Gard_NeedGold_15_03");	//� �������. � ����, ����� ����, � ���� �������� �����-������ ������ ��� ����?
		AI_Output(self,other,"DIA_Gard_NeedGold_01_04");	//���� ������� ������ ����������� � �����, ������ ���� ������ �� ������ ���������! ����, �������, ���� ������ �����! (�������) 
	AI_Output(other,self,"DIA_Gard_NeedGold_15_05");	//� �� �����, ��� ������� ������ ����� ��� �������� �� ���.
		AI_Output(self,other,"DIA_Gard_NeedGold_01_06");	//� ��� �� ����� ����������? �� ���, ������ ���� ��� �� ���� ���������? � ���� ���� ���, ������ �����, ��� ������� ��!
		AI_Output(self,other,"DIA_Gard_NeedGold_01_07");	//��� �� ������ � ��������� ������, ������� ������ � ����� ������ ������ � ��������� ���� �� ������ ���, ����� ���� �� �����!
	AI_Output(other,self,"DIA_Gard_NeedGold_15_08");	//���, ��...
		AI_Output(self,other,"DIA_Gard_NeedGold_01_09");	//(����������) �����. ������ � �����, �� ������, ��� ������. ����� ����, � �� ���� ����� ����� ����.

};

//NS - 23/06/2013 ===========
//  �������� ��� ��������� �����
//===========================
instance DIA_Gard_AboutDamnedDiamond(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_AboutDamnedDiamond_condition;	
	information = DIA_Gard_AboutDamnedDiamond_info;
	description = "� ���� ������� ���� ��������� �����.";
};
func int DIA_Gard_AboutDamnedDiamond_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk) && (MIS_DS2P_DamnSailor == LOG_Running))
	{	return TRUE;	};
};
func void DIA_Gard_AboutDamnedDiamond_info()
{
	AI_Output(other,self,"DIA_Gard_AboutDamnedDiamond_15_00");	//� ���� ������� ���� ��������� �����. 
		AI_Output(self,other,"DIA_Gard_AboutDamnedDiamond_01_01");	//� ������ �� ������ �� ������? ���� ������ �� �������, ������ �� ���� ���. (�������) �� �� ������, �� �� ���������.
	AI_Output(other,self,"DIA_Gard_AboutDamnedDiamond_15_02");	//��...
		AI_Output(self,other,"DIA_Gard_AboutDamnedDiamond_01_03");	//(����������) �������� ��������! � ������������ ����: ���� ������ ���������� � ������� � ��� ���������� � ���������! � ��� ���� ������������� �� ����.
	//������ � �������� "��������� �����"
	B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_Running,TOPIC_DS2P_DamnSailor_GardChest);
	//������ ����������
	AI_StopProcessInfos(self);
};

//NS - 23/06/2013 ===========
//  "�� ������ ���������!"	nr = 6
//===========================
instance DIA_Gard_UAreSittingPretty(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 6;
	condition = DIA_Gard_UAreSittingPretty_condition;	
	information = DIA_Gard_UAreSittingPretty_info;
	permanent = TRUE;
	description = "�� ������ ���������!";
};
func int DIA_Gard_UAreSittingPretty_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_AboutDamnedDiamond)){	return TRUE;	};
};
func void DIA_Gard_UAreSittingPretty_info()
{
	AI_Output(other,self,"DIA_Gard_UAreSittingPretty_15_00");	//�� ������ ���������!
		AI_Output(self,other,"DIA_Gard_UAreSittingPretty_01_01");	//��! �������, ��� ������ ����, ���� � �����! �� ���� � ��������� ������, ����� ���� ���������!
};

//NS - 23/06/2013 ===============================
//  �� ������ ������ � �������
//===============================================
instance DIA_Gard_CaughtU(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_CaughtU_condition;	
	information = DIA_Gard_CaughtU_info;
	important = TRUE;
};
func int DIA_Gard_CaughtU_condition()
{
	if (Gard_ChestForced == TRUE) 
	{	return TRUE;	};
		
};
func void DIA_Gard_CaughtU_info()
{
		AI_Output(self,other,"DIA_Gard_CaughtU_01_00");	//�������, ����� �������!
	if (Npc_KnowsInfo(other, DIA_Gard_AboutDamnedDiamond))
	{
		AI_Output(self,other,"DIA_Gard_CaughtU_01_01");	//� ��� � ����, ��� ������ ���� ������� ��� � ������.
	};
		AI_Output(self,other,"DIA_Gard_CaughtU_01_02");	//������-�� � ���� ����� ������, ���������!
	AI_Output(other,self,"DIA_Gard_CaughtU_15_03");	//� ��...
	//������ ����������, ���������� ��� ���� �� ������� �����, ���� ������ ��
	AI_StopProcessInfos(self);
	self.flags = self.flags & ~NPC_FLAG_IMMORTAL;	//������� ����������
	B_Attack(self, other, AR_KILL, 0);
};


//NS - 23/06/2013 ===============================
//  ����� ����� � ������
//===============================================
instance DIA_Gard_AfterFight(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 0;
	condition = DIA_Gard_AfterFight_condition;	
	information = DIA_Gard_AfterFight_info;
	important = TRUE;
};
func int DIA_Gard_AfterFight_condition()
{
	if ((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)) 
	{	return TRUE;	};
		
};
func void DIA_Gard_AfterFight_info()
{
		AI_Output(self,other,"DIA_Gard_AfterFight_01_00");	//������ ���� ����, �� ��� �������� ��� ���������?
	//(+����)
	B_GivePlayerXP(XP_MIS_DamnSailor_DiamondStolen);
	AI_Output(other,self,"DIA_Gard_AfterFight_15_01");	//���� ������� �������.
		AI_Output(self,other,"DIA_Gard_AfterFight_01_02");	//�����, �� ������ ��� ���� ������, ������� ���� ������ �����.
		AI_Output(self,other,"DIA_Gard_AfterFight_01_03");	//�� ���� �� ������� ���� ����� ����, ��� ������� ����, � � ���� ������ ����� �����, �����?!
	AI_Output(other,self,"DIA_Gard_AfterFight_15_04");	//������������.
	//������ � �������� "��������� �����"
	B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_Running,TOPIC_DS2P_DamnSailor_DiamondGot);
	AI_StopProcessInfos(self);
	self.flags = self.flags | NPC_FLAG_IMMORTAL;	//����� �������� ���������� (�����������, ��� ������ ���� �������� � B_DSG_CheckLog_OnUnconscious)
	self.aivar[AIV_LastFightComment] = TRUE;
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
};

//NS - 02/07/2013 ===============================
//  ����� �������� ����� �����,
// ����� 2 ��� ����� ����, ��� ������ � ������ ����
//===============================================
instance DIA_Gard_KadarTriesToKill(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 0;
	condition = DIA_Gard_KadarTriesToKill_condition;	
	information = DIA_Gard_KadarTriesToKill_info;
	important = TRUE;
};
func int DIA_Gard_KadarTriesToKill_condition()
{
	if ((Kadar_KnowsKaraDead_Day + 2) > Wld_GetDay()) 
	{	return TRUE;	};
		
};
func void DIA_Gard_KadarTriesToKill_info()
{
	var C_NPC Kadar;	Kadar = Hlp_GetNpc(BAU_100_DS2P_KADAR);
	var C_NPC Gard;		Gard = Hlp_GetNpc(PIR_200_DS2P_Gard);
	// ���������� ������
	AI_Teleport(Kadar,"");	AI_GotoNpc(Kadar,Gard);
	TRIA_Invite(Kadar);
	TRIA_Start();
	
	AI_TurnToNpc(Gard,Kadar);
	AI_TurnToNpc(Kadar,Gard);
	Mdl_StartFaceAni(Kadar, "S_ANGRY",1,-1);

	TRIA_Next(Kadar);
	AI_Output(self,other,"DIA_Gard_KadarTriesToKill_10_00");	//�� ���� ��� ����!

	TRIA_Next(Gard);
		AI_Output(self,other,"DIA_Gard_KadarTriesToKill_01_01");	//�? �� ���-�� �������, ���������. ��� �������� ���� �� ��� ����� �� ������ ������ �����������. ����� ���!

	TRIA_Next(Kadar);
	AI_Output(self,other,"DIA_Gard_KadarTriesToKill_10_02");	//�� ��� � ������� ����, ��� ����� ������ ���� ������� �������!

	TRIA_Next(Gard);
		AI_Output(self,other,"DIA_Gard_KadarTriesToKill_01_03");	//�� ���, ����� ���������, �����? ���� �� ������ �� �� �������� ���� ����� � �� ��������� �� ������, � ���� ��� ����� �� ������ �������!

	TRIA_Next(Kadar);
	AI_Output(self,other,"DIA_Gard_KadarTriesToKill_10_04");	//����, ������ ����!

	DIAG_Reset();
	TRIA_Finish();

	//����� �������� (���� ��� ���, � �� �����) ����� ��������
	CreateInvItem(Kadar, ItMw_ShortSword3);
	AI_EquipBestMeleeWeapon(Kadar);
	
	B_Attack(Kadar,Gard,AR_KILL,1);
	B_Attack(Gard,Kadar,AR_KILL,1);
};

//Redleha - 03/03/2016 ==========================
//  ��� �������� ���� ������ ������
// 
//===============================================
instance DIA_Gard_GGKillPirat(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_GGKillPirat_condition;	
	information = DIA_Gard_GGKillPirat_info;
	important = TRUE;
};
func int DIA_Gard_GGKillPirat_condition()
{
	if (CRIME_GG_KillPirat_self_inVillage_once)
	{	return TRUE;	};
};
func void DIA_Gard_GGKillPirat_info()
{
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_00");	//�� ��, ������ �����, ��� ���� �����.	
	AI_Output(other,self,"DIA_Gard_GGKillPirat_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_01");	//���� ������ ��������� ���, ��� ���� �� ���� ����� ����� � ��� ��������� � ����� ������ ��.
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_02");	//����, ���� ��� ���� ���� ��� ������� �������� �� ��� ����� ������ �����, � �� ������ ���� ����������� ����� ���� �� ��� �������, �� � ����� �� ���� ����� ������.
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_03");	//�����, ��������� �������?
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_04");	//� ����� � ����� ������� ������� ����������, � ����� � ������� �������. ��, ��� � �������, ������� �����������, ������� ��� ��� ������ ����� �� ����.
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_05");	//� ������ ������ ������ � �����!
	AI_StopProcessInfos(self);
	CRIME_GG_KillPirat_Cnt_now = CRIME_PiratesKilled_Cnt;	//��������� ���-�� ������ �������
};
//Redleha - 03/03/2016 ==========================
//  "��� �������� ���� ������ ������" - ����������
// 
//===============================================
instance DIA_Gard_GGKillPiratDop(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_GGKillPiratDop_condition;	
	information = DIA_Gard_GGKillPiratDop_info;
	important = TRUE;
};
func int DIA_Gard_GGKillPiratDop_condition()
{
	if (Npc_KnowsInfo(self,DIA_Gard_GGKillPirat))
	{	return TRUE;	};
};
func void DIA_Gard_GGKillPiratDop_info()
{
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_00");	//����, ����������� �������! ����, ������!
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_01");	//���� �� �����: ��� ��� �� ���� ����� ��������, �� ������ ��������� ��� �����.
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_15_00");	//�������?
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_02");	//1000 ������� �����.
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_15_01");	//���?! ��� �� ������� ���� �����!
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_03");	//���� � ��������� ��� ������ ������, ������ ��� ������ ����� ���������. ������ �� �� �������?
	Info_ClearChoices(DIA_Gard_GGKillPiratDop);
	Info_AddChoice(DIA_Gard_GGKillPiratDop,"���, �����.",DIA_Gard_GGKillPiratDop_Pay);
	Info_AddChoice(DIA_Gard_GGKillPiratDop,"� ���� ��� � ����� ������� �����.",DIA_Gard_GGKillPiratDop_NoPay);
};
func void DIA_Gard_GGKillPiratDop_Pay()
{
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_Pay_15_00");	//���, �����.
	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_Pay_01_00");	//�������! ����� ����!
		B_GiveInvItems(other,self,ItMi_Gold,1000);
		CRIME_PiratesKilled_Paid = CRIME_PiratesKilled_Cnt;
	}
	else
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_Pay_01_01");	//������� ������ ����������� �����, ��������! ���� � �����, ��� ��� �� ������, ��� � ������� �� ����!
	};	
};
func void DIA_Gard_GGKillPiratDop_NoPay()
{
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_NoPay_15_00");	//� ���� ��� � ����� ������� �����.
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_NoPay_01_00");	//����� �����! ������! ����� ������ � ����� ������ ������� ���� � ����!
	//GG_Dolg_PeredGardom_ZaKillPirat = TRUE;
};
//Redleha - 04/03/2016 ====================================
//  ������ ������ �� ��������, ���� �� ���� ����� �������.
// 
//=========================================================
instance DIA_Gard_PlataShtraf(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_PlataShtraf_condition;	
	information = DIA_Gard_PlataShtraf_info;
	permanent = TRUE;
	description = "���, ����� �����";
};
func int DIA_Gard_PlataShtraf_condition()
{
	if((CRIME_PiratesKilled_Cnt >= CRIME_PiratesKilled_Paid) && 
		(CRIME_GG_KillPirat_Cnt_now == CRIME_PiratesKilled_Cnt) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
	{	return TRUE;	};
};
func void DIA_Gard_PlataShtraf_info()
{
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_Pay_15_00");	//���, �����.
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_Pay_01_00");	//�������! ����� ����!
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	CRIME_PiratesKilled_Paid = CRIME_PiratesKilled_Cnt;
};
//Redleha - 04/03/2016 ====================================
//  ���� ���� ��� ������ ����� ��������������
// 
//=========================================================
var int DIA_Gard_GGKillPiratTwice_first;	//�� �������� �������. ������� ���� � ������
var int DIA_Gard_GGKillPiratTwice_second;	//�� �������� �������. ������� ������ � ����� � ������
var int DIA_Gard_GGKillPiratTwice_third;	//�� �������� �������. ��, �����. ������ ��������� ��.

instance DIA_Gard_GGKillPiratTwice(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_GGKillPiratTwice_condition;	
	information = DIA_Gard_GGKillPiratTwice_info;
	important = TRUE;
};
func int DIA_Gard_GGKillPiratTwice_condition()
{
	if (Npc_KnowsInfo(self,DIA_Gard_GGKillPirat) && (CRIME_PiratesKilled_Cnt > CRIME_GG_KillPirat_Cnt_now))
	{	return TRUE;	};
};
func void DIA_Gard_GGKillPiratTwice_info()
{
	if(!DIA_Gard_GGKillPiratTwice_first)
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_00");	//� ���� ������������, ��� ���� ��� ���� ���� ��� ������� �����, �� � ����� ������� ����������?
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_01");	//��� �������.
		AI_StopProcessInfos(self);
		B_KillNpc(BAU_109_DS2P_Lulu);	//�����!
		DIA_Gard_GGKillPiratTwice_first = TRUE;
	}
	else if(DIA_Gard_GGKillPiratTwice_first && !DIA_Gard_GGKillPiratTwice_second)
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_00");	//�� ������ �����, ����� �������?! ���� ������ �������� ��� ������ �� ����� �������!
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_01");	//������ ������� ����� ����� ��������!
		AI_StopProcessInfos(self);
		B_KillNpc(BAU_111_DS2P_Narev);	//�����!
		B_KillNpc(BAU_110_DS2P_Viola);	//�����!
		DIA_Gard_GGKillPiratTwice_second = TRUE;
	}
	else if(DIA_Gard_GGKillPiratTwice_second && !DIA_Gard_GGKillPiratTwice_third)
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_00");	//�� � �������, �����, ��-�������� �� ���������. ������, ����� ��-�������.
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_01");	//����� ��� �������� ���� ���� ����� ������ ���������. � ����� ��� ����� � ������ �������� ��������.
		B_Attack(self,other,AR_KILL,1);
		/*
		UNFINISH
		����� ��� �����, ������������� ��������� ������� � �� � ��. ������� � �������� �� �������. ���� �������.
		������ ���� �������� ���� �������
		*/
		B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_AllPiratesMyEnemies);
		Wld_SetGuildAttitude(GIL_PIR,ATT_HOSTILE,GIL_VLK);
		Wld_SetGuildAttitude(GIL_PIR,ATT_HOSTILE,GIL_KDF);
		Wld_SetGuildAttitude(GIL_PIR,ATT_HOSTILE,GIL_KDW);
		//������� ������� � �������.
		B_StartOtherRoutine(PIR_209_DS2P_Vales,"DEATH");
		B_StartOtherRoutine(PIR_207_DS2P_LanSkeleton,"DEATH");
		B_KillNpc(PIR_207_DS2P_LanSkeleton);
		B_KillNpc(PIR_209_DS2P_Vales);
		WAR_HAS_COME = TRUE;
	};
	CRIME_GG_KillPirat_Cnt_now = CRIME_PiratesKilled_Cnt;
};


/* UNFINISHED
��� �������� ���� ������ ������ (������� � ���������� ��� ��� ��� �������) ��� ��������� ��������� � ������.

����: �� ��, ������ �����, ��� ���� �����.
��: ��� ���� ����?
����: ���� ������ ��������� ���, ��� ���� �� ���� ����� ����� � ��� ��������� � ����� ������ ��. ����, ���� ��� ���� ���� ��� ������� �������� �� ��� ����� ������ �����, � �� ������ ���� ����������� ����� ���� �� ��� �������, �� � ����� �� ���� ����� ������. �����, ��������� �������? � ����� � ����� ������� ������� ����������, � ����� � ������� �������. ��, ��� � �������, ������� �����������, ������� ��� ��� ������ ����� �� ����. � ������ ������ ������ � �����!
������ ����������, �� ���� ��� �� ����� ������� ��������.
����: ����, ����������� �������! ����, ������! ���� �� �����: ��� ��� �� ���� ����� ��������, �� ������ ��������� ��� �����.
��: �������?
����: 1000 ������� �����.
��: ���?! ��� �� ������� ���� �����!
����: ���� � ��������� ��� ������ ������, ������ ��� ������ ����� ���������. ������ �� �� �������?

 ���������� ���������
���, �����.
� ���� ��� � ����� ������� �����.

� ���� ��� � ����� ������� �����.
��: � ���� ��� � ����� ������� �����.
����: ����� �����! ������! ����� ������ � ����� ������ ������� ���� � ����!
������ ����������.

���, �����.
��: ���, �����.
����: �������! ����� ����!
����, ���� ����� �� �������.
����: ������� ������ ����������� �����, ��������! ���� � �����, ��� ��� �� ������, ��� � ������� �� ����!

*/

// ������������, ���� �� ��������� � ��� ������ ����
// nr = 1

instance DIA_Gard_WhereIsLulu(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_WhereIsLulu_condition;	
	information = DIA_Gard_WhereIsLulu_info;
	permanent = FALSE;
	description = "(�� ������ ����)";
};

func int DIA_Gard_WhereIsLulu_condition()
{
	if ((MIS_DS2P_TomsLetter == Log_Running) && Npc_KnowsInfo(other,DIA_Ado_WhereIsLulu))
	{	
		return TRUE;	
	};
};

func void DIA_Gard_WhereIsLulu_info()
{
	AI_Output(other,self,"DIA_Gard_WhereIsLulu_15_00");	//���� ������.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu_01_01");	//���� ����, �������? �� ������, ��� � ����� �����?
	AI_Output(other,self,"DIA_Gard_WhereIsLulu_15_02");	//��� �� ������ ����� �������.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu_01_03");	//����, ��� ����� �� ���������. �����, ������ ������!
	AI_Output(other,self,"DIA_Gard_WhereIsLulu_15_04");	//�� ������������� ������ ������� �������?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu_01_05");	//������ ��������������� �� ���? ������ ���, � ��� ����� ����� ���������� ��� �����.
	AI_Output(other,self,"DIA_Gard_WhereIsLulu_15_06");	//�� �� ���?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu_01_07");	//�� ���� ����, �����! � ������ ����������, �� ����� ������� ��� �����.
	AI_StopProcessInfos(self);
};
	
// ������������, ���� �� �������� ���������� � ����� �� ������ ����
// nr = 1

instance DIA_Gard_WhereIsLulu2(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_WhereIsLulu2_condition;	
	information = DIA_Gard_WhereIsLulu2_info;
	permanent = FALSE;
	description = "(�����������)";
};

func int DIA_Gard_WhereIsLulu2_condition()
{
	if ((MIS_DS2P_TomsLetter == Log_Running) && Npc_KnowsInfo(other,DIA_Ado_WhereIsLulu))
	{	
		return TRUE;	
	};
};

func void DIA_Gard_WhereIsLulu2_info()
{
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_00");	//� ��� �� ��������.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_01");	//�� ��� �����, �����? ���, �� ���� ������.
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_02");	//(����������) ������, ��������� �� ������ ������. � ��� ���������� ����.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_03");	//(�����) ��, ���� ���� ������ ������!
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_04");	//��, �������, ������ ����� ���� � ��������� � ������������ � ���� �����������, �� �������� ��� ����� �� �����. �� ������ �������, �� ��� ���� �������� �� ���������.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_05");	//(���) ��� �� �����?!!
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_06");	//������� ���, ��������� �������� �� ��������� ���������� ����� �����������. ���� �� ���� �� �����, �� ��� �����������, ������ � �����, � ��� ��������� � ������ ��������. �������, ������ ���� ����� ������ � ���� ������?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_07");	//����, ��� ���� �� ���� ����, �������?
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_08");	//� ����, ����� �� ������� �����. �����, �� ��� ���� ����� ���� ������.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_09");	//����-�� ����� ����, ����������� �������?
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_10");	//�� ����� ������ �����, � �� ����� �����, ���� ���������� ����, �������� ����� ������� �����.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_11");	//� ��� ����� �� ����������, ���� ���� �������� ��������!
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_12");	//�����, � ���� ��� ���� ���-�� �������? � ���� ����� ������, � �� ��������� ����.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_13");	//(�����������) ���!.. (���������) ����� ��. ���� ���-���. ���� �������� ���, �� � ����� ������� � ��������� ���������.
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_14");	//��� ���� �������?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_15");	//(���������) ���������� ���� ������ � �����, ����� �������� ���� �������� ����, �� � ���� ��������� ���� �������. (����������) �� ������� � ���, ������� ��� ���� �������� � ������ ��, � ��� ��������� ������ ���� ��������. ����?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_16");	//� ��, ���������� �� �����������, ��� �� ��� �������. ��-��-��!
	B_DSG_Log_OpenClose(TOPIC_DS2P_TomsLetter,LOG_MISSION,LOG_Running,TOPIC_DS2P_TomsLetter_LuluIsGone);
	// ������� ������ � ��������� �������, �����, ����� � ����, ������� ����� �����
	CreateInvItems(Tom,ItMi_DS2P_HuntersHead,1);
	CreateInvItems(Jinn,ItMi_DS2P_HuntersHead,1);
	CreateInvItems(Fart,ItMi_DS2P_HuntersHead,1);
	CreateInvItems(Gustav,ItMi_DS2P_HuntersHead,1);
	AI_StopProcessInfos(self);
};

// ������������, ���� ����� "����� ��������� ���������", �������� ����� � � �� ���� �� ������
// nr = 1

instance DIA_Gard_HuntersIsKilled(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_HuntersIsKilled_condition;	
	information = DIA_Gard_HuntersIsKilled_info;
	permanent = FALSE;
	description = "� �������� ���� ���������.";
};

func int DIA_Gard_HuntersIsKilled_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && (Npc_HasItems(other,ItMi_DS2P_HuntersHead) >= 4))
	{	
		return TRUE;	
	};
};

func void DIA_Gard_HuntersIsKilled_info()
{
	AI_Output(other,self,"DIA_Gard_HuntersIsKilled_15_00");	//� �������� ���� ���������. ��� �� ������.
	// ������ ������ �����
	B_GiveInvItems(other,self,ItMi_DS2P_HuntersHead,4);
	AI_Output(self,other,"DIA_Gard_HuntersIsKilled_01_01");	//��! ��� ������ ����� ������� ��������� �� ����, ������ �� ���� ����� ������� ������, � ������ ����� ��������� �� ������ ����� �������, ����� ��� ��������� �����, ���� ����� ������ �� �������������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Success,TOPIC_DS2P_FindEscapedHunters_HuntersIsKilled);
	B_GivePlayerXP(XP_MIS_DS2P_FindEscapedHunters);
	EscapedHunters_QuestComplete = Wld_GetDay();
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "����� ��������� ���������", ��� �������� ����, � � ��������� � �� ���� 4 ��������� ������
// nr = 1

instance DIA_Gard_SelfMadeHeads(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_SelfMadeHeads_condition;	
	information = DIA_Gard_SelfMadeHeads_info;
	permanent = FALSE;
	description = "�������� ������.";
};

func int DIA_Gard_SelfMadeHeads_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && (Npc_HasItems(other,ItMi_DS2P_HuntersHead_Selfmade_Illusion) >= 4)
		 && !Npc_IsDead(Gustav) && !Npc_IsDead(Tom) && !Npc_IsDead(Jinn) && !Npc_IsDead(Fart))
	{	
		return TRUE;	
	};
};

func void DIA_Gard_SelfMadeHeads_info()
{
	AI_Output(other,self,"DIA_Gard_SelfMadeHeads_15_00");	//�������� ������. ��� �� ������.
	// ������ ��������� ������ �����
	B_GiveInvItems(other,self,ItMi_DS2P_HuntersHead_Selfmade_Illusion,4);
	//������� ������
	Npc_RemoveInvItems(self,ItMi_DS2P_HuntersHead_Selfmade_Illusion,4);
	AI_Output(self,other,"DIA_Gard_SelfMadeHeads_01_01");	//������ ������ ��� �����, ��������?! � �� ������ �����!
	AI_Output(other,self,"DIA_Gard_SelfMadeHeads_15_02");	//��� ������ ���������. ����������� �������� �� ������������ �����. ���-��� �� �����.
	AI_Output(self,other,"DIA_Gard_SelfMadeHeads_01_03");	//��� ��� ����� ���� � ���� ��?
	AI_Output(other,self,"DIA_Gard_SelfMadeHeads_15_04");	//��� ������ �� ����. ������, ������� �� ������ �� �������. � ���������.
	AI_Output(self,other,"DIA_Gard_SelfMadeHeads_01_05");	//� ����� ���� �����������! ������ ������ ������������� ����� ������� ��������, ��� ��������� ��������� ���� ������� �� ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Success,TOPIC_DS2P_FindEscapedHunters_Success);
	B_GivePlayerXP(XP_MIS_DS2P_FindEscapedHunters);
	Hunters_IsNotKilled = TRUE;
	EscapedHunters_QuestComplete = Wld_GetDay();
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "�������"
// nr = 1

instance DIA_Gard_AboutConspiracy(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_AboutConspiracy_condition;	
	information = DIA_Gard_AboutConspiracy_info;
	permanent = FALSE;
	important = TRUE;
	description = " ";
};

func int DIA_Gard_AboutConspiracy_condition()
{
	if (MIS_DS2P_Conspiracy == Log_Running)
	{	
		return TRUE;	
	};
};

func void DIA_Gard_AboutConspiracy_info()
{
	AI_Output(self,other,"DIA_Gard_AboutConspiracy_01_00");	//�� ��, �������� ����, ��� ���� ����! � ��� �� ��������� � ���� ���������? ��������!
	Info_ClearChoices(DIA_Gard_AboutConspiracy);
	Info_AddChoice(DIA_Gard_AboutConspiracy,"���� ��������� ��� ���� ����.",DIA_Gard_AboutConspiracy_Alternative);
	Info_AddChoice(DIA_Gard_AboutConspiracy,"��������, ������ ����. ��������� �����.",DIA_Gard_AboutConspiracy_Nothing);
};

// �����������, ���� ������� ������� "��������, ������ ����. ��������� �����." � ������� � ������

func void DIA_Gard_AboutConspiracy_Nothing()
{
	AI_Output(other,self,"DIA_Gard_AboutConspiracy_Nothing_15_00");	//��������, ������ ����. ��������� �����.
	AI_Output(self,other,"DIA_Gard_AboutConspiracy_Nothing_01_01");	//����� �����, ��? �����! ���� �����, ��� �� ���-�� ������ ������ ����, � � ��� ����� ����� �� ����� �������. ����?
	AI_Output(other,self,"DIA_Gard_AboutConspiracy_Nothing_15_02");	//������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Running,TOPIC_DS2P_Conspiracy_GardSee);
	Conspiracy_Mode = 1;
	AI_StopProcessInfos(self);
};
	
// �����������, ���� ������� ������� "���� ��������� ��� ���� ����." � ������� � ������

func void DIA_Gard_AboutConspiracy_Alternative()
{	
	AI_Output(other,self,"DIA_Gard_AboutConspiracy_Alternative_15_00");	//���� ��������� ��� ���� ����.
	AI_Output(self,other,"DIA_Gard_AboutConspiracy_Alternative_01_01");	//� �� ������ ������� �����! ����� ������ ������� ����� � ����������.
	AI_Output(other,self,"DIA_Gard_AboutConspiracy_Alternative_15_02");	//�� ��������� ��� ������ ��� �������� ���� � ����� ��������. ��� ����� �� ����� ���������� ���������� ������� � �������� ����� �������.
	AI_Output(self,other,"DIA_Gard_AboutConspiracy_Alternative_01_03");	//���?!! �� �� � ������� �����, ������ ����� � ����������! � ���� ������, ��� ������ ���� ������ ����!
	B_Attack(Gard,Greg,AR_NONE,0);
	Conspiracy_Mode = 2;
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "�������", ������� ������� ����� � ���� ���� �����
// nr = 1

instance DIA_Gard_GregIsDead(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_GregIsDead_condition;	
	information = DIA_Gard_GregIsDead_info;
	permanent = FALSE;
	important = TRUE;
	description = " ";
};

func int DIA_Gard_GregIsDead_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && (Conspiracy_Mode == 2) && Npc_IsDead(Greg))
	{	
		return TRUE;	
	};
};
	
func void DIA_Gard_GregIsDead_info()
{
	AI_Output(self,other,"DIA_Gard_GregIsDead_01_00");	//����, � ���� ��������� ���������. ������ �������� ��������� �� ������������ ������ ����. �������� ������ ������, ��� ������ � �����.
	AI_Output(other,self,"DIA_Gard_GregIsDead_15_01");	//� ��� ��� ��������? ������ ���������. � �� ������ ��������� ���� � ������ �����. ����� ����, ���� � �� ���� ������ � ����� �� �������, �� ����� ������ ������� �� ������.
	AI_Output(self,other,"DIA_Gard_GregIsDead_01_02");	//��, �����! ���� ����. � ���������� � � ������ ����, ��� � ������� �� ���� ��������� �������, �� ��� ������� ������� ���������� ����-������ ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Running,TOPIC_DS2P_Conspiracy_GregIsDead);
	AI_StopProcessInfos(self);
};
	
	
	