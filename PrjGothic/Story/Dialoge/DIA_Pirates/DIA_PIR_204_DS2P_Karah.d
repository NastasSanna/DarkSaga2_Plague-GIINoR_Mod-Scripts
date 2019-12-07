instance DIA_Karah_EXIT(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Karah_EXIT_condition;	
	information = DIA_Karah_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Karah_EXIT_condition(){	return TRUE;};
func void DIA_Karah_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 10/07/2013 ===================================
//  ��������� 
//===================================================
instance DIA_Karah_Start(C_Info)	//TESTED
{
	npc = PIR_204_DS2P_Karah;
	nr = 0;
	condition = DIA_Karah_Start_condition;	
	information = DIA_Karah_Start_info;
	description = "� ������, �� ������� ������������ � ���������.";
};
func int DIA_Karah_Start_condition()
{
	If((Npc_WasInState(self,ZS_DSG_Practice_RangedWeapon) && (self.aivar[AIV_LASTTARGET] != 0)))
	{	return TRUE;};
};
func void DIA_Karah_Start_info()
{
	//UNFINISHED
	var C_NPC tgt;	tgt = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	B_CreateAmmo(self);
	if(!Npc_HasReadiedRangedWeapon(self))
	{
		AI_WhirlAround(self, tgt);
		AI_ReadyRangedWeapon(self);
		AI_AimAt(self, tgt);
	};
	AI_StopLookAt(self);
	
	AI_Output(other,self,"DIA_Karah_Start_15_00");	//� ������, �� ������� ������������ � ���������.
		AI_Output(self,other,"DIA_Karah_Start_13_01");	//(������)
	//������� � ������
		AI_ShootAt(self, tgt);
	AI_Output(other,self,"DIA_Karah_Start_15_02");	//����� ���� �������� ���� �������?
		AI_Output(self,other,"DIA_Karah_Start_13_03");	//(������)
	//������� � ������
		AI_ShootAt(self, tgt);
	AI_Output(other,self,"DIA_Karah_Start_15_04");	//��, �� ���� �������?
	//�������� ������� � ������������ ������ � ��
		AI_StopAim(self);
		AI_TurnToNpc(self,other);
		AI_LookAtNpc(self,other);
	
		AI_Output(self,other,"DIA_Karah_Start_13_05");	//���� ����� ����� �� �������, ��� ��������� � ��������, � �������� � ����� ���������� �������, ����� ������?
		AI_Output(self,other,"DIA_Karah_Start_13_06");	//� ������ ���������� � ���� ������� ���� ������� ������, � ������� ����� ���� �� ������.
	AI_Output(other,self,"DIA_Karah_Start_15_07");	//� ���� ���������� � �����.
		AI_Output(self,other,"DIA_Karah_Start_13_08");	//�� ������, ����� ���������.
	//������� �������
		/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
		AI_Output(self,other,"DIA_Karah_Start_13_09");	//�� ��� ��� ����� ����� ���� ��������� ������������, � ��� ����� ���������� ������������ � ������������� ������� ������.

};

//NS - 10/07/2013 -----------------------------------
// "��� ���� �����?", ���� �� �����������, ��� ��� �������� ���		nr = 1;	
instance DIA_Karah_WhatsUrName(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_WhatsUrName_condition;	
	information = DIA_Karah_WhatsUrName_info;
	description = "��� ���� �����?";
};
func int DIA_Karah_WhatsUrName_condition()
{
	If(!DIA_Karah_Start_condition() || Npc_KnowsInfo(other,DIA_Karah_Start))
	{	return TRUE;};
};
func void DIA_Karah_WhatsUrName_info()
{
	AI_Output(other,self,"DIA_Karah_WhatsUrName_15_00");	//��� ���� �����?
		AI_Output(self,other,"DIA_Karah_WhatsUrName_13_01");	//������ ����� ���� �������.
	// ���� ��� �� �������������
	if (!Npc_KnowsInfo(other,DIA_Karah_Start))
	{
		AI_Output(other,self,"DIA_Karah_WhatsUrName_15_02");	//� �� ����� ���������� � �����.
			AI_Output(self,other,"DIA_Karah_WhatsUrName_13_03");	//������, ��� ����� � ���� ������� ����� ��� ������������� ������ ������, � � �� ������� ��� �������� �����.
	};
};


//===================================================
//  �� ������ "������������ �����"
//===================================================
//NS - 10/07/2013 -----------------------------------
// "�� ������ ���� ��� ���� ������?", ���� �������� �� ����������	nr = 10;	
instance DIA_Karah_CanUTeachMe(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 10;
	condition = DIA_Karah_CanUTeachMe_condition;	
	information = DIA_Karah_CanUTeachMe_info;
	description = "�� ������ ���� ��� ���� ������?";
};
func int DIA_Karah_CanUTeachMe_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_Start) && Npc_KnowsInfo(self,DIA_Karah_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Karah_CanUTeachMe_info()
{
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_00");	//�� ������ ���� ��� ���� ������?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_01");	//� ����� ��� ���? ����� ���� �����, ��� ����� � ������� ���������� ������ �������������� �����, ���� ���?!
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_02");	//� �� �� ��� �����, ��� ���� ���������� ���������, ����� ���� ���-�� ��������. ��� ��������, ������� ����� �������� ������ �� ������ �������.
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_03");	//����� ��������� ����� �� ��������� ����� �������!
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_04");	//����� ���� ���� ��, ��� ������������ ����? 
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_05");	//(���������) ��... ����� � ����... ��, ��� ����� ������ ���������� �������...
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_06");	//� ��� ��?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_07");	//����� ��������� � ��� ����� ��� ����: ����������, ������� ������� � ������������ ������ �����.
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_08");	//����������� � �������, ������� ������ ������, � ��� ���������� ������ � ���� ���.
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_09");	//���� �� ������� �������� ��� ��� ������� ������ ������, � ������ ���� ���� �������.
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_10");	//� ��� ��� �� �����?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_11");	//�� �����, � ����������! ����� � ������� � ������� �� ����������.
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_12");	//� ������ �� ��� ����� �� ��� ��� �� ������?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_13");	//�� � �������� ������� �� ��������. ������ ���, �� ����� ������ ������ �� ����� �� ���� �������������.
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_14");	//������ ������?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_15");	//� �� ���� �� ���� �������� � ���� �� ������� ��������� ��� ��� � ��� � ������.

	//������ � �������� "����������� �����" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_Running,TOPIC_DS2P_CharmedBolts_Start);
};


//===================================================
//  �� ������ "���� ������"
//===================================================
//NS - 10/07/2013 -----------------------------------
// "� ����, ��� �� ������ ��� ������." (+����)	nr = 20;	
instance DIA_Karah_IKnowAboutGaron(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 20;
	condition = DIA_Karah_IKnowAboutGaron_condition;	
	information = DIA_Karah_IKnowAboutGaron_info;
	description = "� ����, ��� �� ������ ��� ������.";
};
func int DIA_Karah_IKnowAboutGaron_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_WhatsUrName) && Npc_KnowsInfo(self,DIA_Maria_AboutGaron))
	{	return TRUE;};
};
func void DIA_Karah_IKnowAboutGaron_info()
{
	AI_Output(other,self,"DIA_Karah_IKnowAboutGaron_15_00");	//� ����, ��� �� ������ ��� ������.
	//(+����)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_AskedKarah);
		AI_Output(self,other,"DIA_Karah_IKnowAboutGaron_13_01");	//(���������� �������)
		AI_Wait(self,0.5);
		AI_Output(self,other,"DIA_Karah_IKnowAboutGaron_13_02");	//��� ����!
	AI_Output(other,self,"DIA_Karah_IKnowAboutGaron_15_03");	//��� ���������?
		AI_Output(self,other,"DIA_Karah_IKnowAboutGaron_13_04");	//� ������ ����� ��� ����� ������. ��, ������ �����, ��� ��� ���� ��������. ����, ��� ���� ������ �������!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 5);
	//����� ����� � �������, ��������� ����� (�� ����� ������� ����� �������)
	AI_SetWalkMode(self,NPC_RUN);
	Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
	// UNFINISHED ������� WP, ������� �����
	AI_GotoWP(self,"");
};

//NS - 10/07/2013 -----------------------------------
// ����� ��� ���������� � ��, ����� ���� ��� �� ����� ������	important	
instance DIA_Karah_WhereIsGaron(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 0;
	condition = DIA_Karah_WhereIsGaron_condition;	
	information = DIA_Karah_WhereIsGaron_info;
	important = TRUE;
};
func int DIA_Karah_WhereIsGaron_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_IKnowAboutGaron))
	{	return TRUE;};
};
func void DIA_Karah_WhereIsGaron_info()
{
		AI_Output(self,other,"DIA_Karah_WhereIsGaron_13_00");	//���� ����� ���� �����?! ����� ���� �������!
		AI_Output(self,other,"DIA_Karah_WhereIsGaron_13_01");	//�� ��� �� �� ������ ����� �����������! ����� ������ � ���������� ������� �������� ��� ������� ���?!
		AI_Output(self,other,"DIA_Karah_WhereIsGaron_13_02");	//�� ������� ������������ � ���, ��� �� �����. � �����, ��� ������ ������� ������� �������� � ���������, ��� ����� �������, � ������ ������. ��� ���.
		AI_Output(self,other,"DIA_Karah_WhereIsGaron_13_03");	//� ���� �������� ��� � �������� ���� ����� ����! � ��� ���� ��������� �� ����! 
	AI_StopProcessInfos(self);
	//������ � �������� "���� ������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_Escaped);
};

//NS - 18/07/2013 -----------------------------------
// C�� ���������� � ��, ���� ������ ��� �� ������				important	
instance DIA_Karah_FightAgainstGaronLost(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 0;
	condition = DIA_Karah_FightAgainstGaronLost_condition;	
	information = DIA_Karah_FightAgainstGaronLost_info;
	important = TRUE;
};
func int DIA_Karah_FightAgainstGaronLost_condition()
{
	if ((Garon_FightPirates == Garon_FightPirates_Finished)
		//&& (self.aivar[AIV_LastFightComment] == FALSE)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{	return TRUE;};
};
func void DIA_Karah_FightAgainstGaronLost_info()
{
		AI_Output(self,other,"DIA_Karah_FightAgainstGaronLost_13_00");	//������ ����� �� � ��� ��������? ������ � ���� ����� �������� � ������.
		AI_Output(self,other,"DIA_Karah_FightAgainstGaronLost_13_01");	//�����, ������ � �����. ����� ����� �����. �����, ��� ��� � ���� ������� �����, ��� ����� ����� ��������� �� �����.
	self.aivar[AIV_LastFightComment] = TRUE;
	AI_StopProcessInfos(self);
};


//NS - 10/07/2013 ===================================
//  ����� �������
//===================================================
// "��� ������ ���� �������� �� ��������?" ���� �������� �� ����������		nr = 40;	
instance DIA_Karah_WhoToughtU(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 40;
	condition = DIA_Karah_WhoToughtU_condition;	
	information = DIA_Karah_WhoToughtU_info;
	description = "��� ������ ���� �������� �� ��������?";
};
func int DIA_Karah_WhoToughtU_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_Start))
	{	return TRUE;};
};
func void DIA_Karah_WhoToughtU_info()
{
	AI_Output(other,self,"DIA_Karah_WhoToughtU_15_00");	//��� ������ ���� �������� �� ��������?
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_01");	//��� ���� ����. �����-�� �� ���� �� ������ ����, ������� � �������.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_02");	//���� ��� ����� �������� �����, ��� ��������� �� ����. ���� �� ����� �� ������ ���� � ��������, ��� �� ��� ������ ������� ������ � ����.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_03");	//�� ������� ��� ����� ���������� �������, ��� �������� � ��������, ��� ��������� ���� ����� � ������ ������.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_04");	//����� ���� ������� � �������, ��� ���� ����� �� ������ ������.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_05");	//� �� ���������� ��� �������, ��� ��� ������, ��� ������� ��������� ��������� � ������� � �������� ��������. �� ��� � ��� �����, ��� �����.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_06");	//������ ����� ������� ��� ��� ��������� �����, ������� �� ��� ���� ����� ��������, � ����� ��� ��������� �� ������� � ���������, ��� �������� ��������� �����.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_07");	//������ � � ��� ������ �� ������. ���� �� ����, ��� �� ��.
};


//---------------------------------------------------
// "������ �� �������� � ����� �����?" ����� ����������		nr = 41;	
instance DIA_Karah_WhyAUWithGard(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 41;
	condition = DIA_Karah_WhyAUWithGard_condition;	
	information = DIA_Karah_WhyAUWithGard_info;
	description = "������ �� �������� � ����� �����?";
};
func int DIA_Karah_WhyAUWithGard_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Karah_WhyAUWithGard_info()
{
	AI_Output(other,self,"DIA_Karah_WhyAUWithGard_15_00");	//������ �� �������� � ����� �����?
		AI_Output(self,other,"DIA_Karah_WhyAUWithGard_13_01");	//� ������-�� ������� �� ����. ������ �����, ���� ���������� �������.
		AI_Output(self,other,"DIA_Karah_WhyAUWithGard_13_02");	//��������� ���� ����� �� ��������, ������������� ���, ��� �����, ������ ��� ��� �������� ������.
		AI_Output(self,other,"DIA_Karah_WhyAUWithGard_13_03");	//������� �����, ��� ��������� ��������� ����� �� ����� ��������,	� �� �������.
		AI_Output(self,other,"DIA_Karah_WhyAUWithGard_13_04");	//��� ���������� �������, � � �����, ��� ����� �� ��������� � �������, ��� ��������� �� ������ �����.
};

//"���� ����.". ������������, ����� ������� � ����� ������� � ������������
// nr = 1

instance DIA_Karah_GrayBeardCompetition(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Karah_GrayBeardCompetition_condition;	
	information = DIA_Karah_GrayBeardCompetition_info;
	description = "���� ����.";
};

func int DIA_Karah_GrayBeardCompetition_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_WhatsUrName))
	{	
		return TRUE;
	};
};

func void DIA_Karah_GrayBeardCompetition_info()
{
	AI_Output(other,self,"DIA_Karah_GrayBeardCompetition_15_00");	//���� ����.
	AI_Output(self,other,"DIA_Karah_GrayBeardCompetition_13_01");	//������.
	AI_Output(other,self,"DIA_Karah_GrayBeardCompetition_15_02");	//� ���� ��������������� � ����� ������� �� ����� ������� ���. �� ������ ���� ������������?
	AI_Output(self,other,"DIA_Karah_GrayBeardCompetition_13_03");	//� ���, ��� ������� ����. ��� ��� ����� ���������� �� ��������, � ��� ���� �� ����� �����������. � ��������.
	AI_Output(other,self,"DIA_Karah_GrayBeardCompetition_15_04");	//����� ������� � ����� ������. ����� ��������.
	// ������ ���������� ������ ��� ������������
	B_StartOtherRoutine(self,"GB_COMPETITION");
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_03);
	if (Npc_KnowsInfo(other,DIA_Symon_GrayBeardCompetition) && Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition_Gold)) // ���� �� ��� ��������� ������� � �����
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_06);
	};
	AI_StopProcessInfos(self);
};

// ����������� ����� ��������� ������������
// nr = 1
	
instance DIA_Karah_AfterCompetition(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_AfterCompetition_condition;	
	information = DIA_Karah_AfterCompetition_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};
func int DIA_Karah_AfterCompetition_condition()
{
	if (GB_CompetitionState > 9 && Npc_IsInState(self,ZS_Talk))
	{	
		return TRUE;	
	};
};	

func void DIA_Karah_AfterCompetition_info()
{
	if (GB_CompetitionState == 10) // ������ ��
	{
		AI_Output(self,other,"DIA_Karah_AfterCompetition_13_00");	//���������� � �������. ����� �� ��������� ����� ���������� ������������.
	}
	else // �������� ��
	{
		AI_Output(self,other,"DIA_Karah_AfterCompetition_13_01");	//�� ������������� � � ��������� ��� �������.
	};
};
	
// ������������, ���� ��� ������ "��� ���� �����?"
// nr = 2
	
instance DIA_Karah_NiceCrossbow(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 2;
	condition = DIA_Karah_NiceCrossbow_condition;	
	information = DIA_Karah_NiceCrossbow_info;
	description = "� ���� �������� �������.";
	permanent = FALSE;
};
func int DIA_Karah_NiceCrossbow_condition()
{
	if (Npc_KnowsInfo(other,DIA_Karah_WhatsUrName))
	{	
		return TRUE;	
	};
};

func void DIA_Karah_NiceCrossbow_info()
{
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_15_00");	//� ���� �������� �������.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_01");	//��, ��� ���� ��������. ����� ������� �� ����, ��������� �� ����� ��������. ���� ����������� �� ����������� ����, � ������ �������� �� ����������� �����.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_02");	//������ ������ ����� ���������� ����� �������. ������ ������������ ������ �����.
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_15_03");	//�����?
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_04");	//(��������) ��, �����. ����� � �������, ��� �����-�� ������ ������������� �� ��� ���������� ���������. ��� ���� �����. ������� ���� �������� ����� ������, ����������� ����� ����� �������� ������, �������� ���� � �������.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_05");	//�� ���� ����� �� ������� �� ������ �����. ��� ���� ��������� ��������� �������! ��, ����, ��� � ���� ������ ���.
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_15_06");	//� � ��� ���� ��������? ������ �� ������ � ����� ���� �������?
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_07");	//�� ��� ���� ������� ������, ������� �����. �� ����� �� ���� ������� � �������� ����� � ������ ��������. ���������!�, ��� �� ����� ������. �����!
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_08");	//� ���� ������������ �������, ��������� � ���� ����� ����� � ������, �� ��� ���� ��� �� �� ������. ��� �� �������� ��� ������������ � ������ ������ �����.
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_15_09");	//��������. � ���� �, �����, ����� ����� ���������� �������, ��� �� ��� �� ���� ����?
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_10");	//��, ���� �� �� ������ ������� ����� ��������. ����� ������ �� ������ ��������, �� ���� ���� ���. �� ���� ����� ������������� �������, �� � ����� ���� �� ���� ��� ���� ����������. ��� ���?
	Info_ClearChoices(DIA_Karah_NiceCrossbow);
	Info_AddChoice(DIA_Karah_NiceCrossbow,"�������, ���.",DIA_Karah_NiceCrossbow_Deciline);
	Info_AddChoice(DIA_Karah_NiceCrossbow,"�� �����.",DIA_Karah_NiceCrossbow_Accept);
};

// �����������, ���� ������� ������� "�������, ���." � ������� ������ "� ���� �������� �������."

func void DIA_Karah_NiceCrossbow_Deciline()
{
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_Deciline_15_00");	//�������, ���.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_Deciline_13_01");	//��� ������? ��, � ���� �� ����. � ��� ����� ���� ��� ������� ������� ����.
	Info_ClearChoices(DIA_Karah_NiceCrossbow);
};

// �����������, ���� ������� ������� "�� �����." � ������� ������ "� ���� �������� �������."

func void DIA_Karah_NiceCrossbow_Accept()
{
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_Accept_15_00");	//�� �����. ���� � ����� ���������� �������, �� ������� ����������� ��� ����.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_Accept_13_01");	//������!
	B_DSG_Log_OpenClose(TOPIC_DS2P_Cbow4Karah,LOG_MISSION,LOG_Running,TOPIC_DS2P_Cbow4Karah_Start);
	AI_StopProcessInfos(self);
};
	
// ������������, ���� ���� ����� "������� ��� ������", � � ��������� � �� ���� ���������� �������
// nr = 1
	
instance DIA_Karah_BringCrossbow(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_BringCrossbow_condition;	
	information = DIA_Karah_BringCrossbow_info;
	description = "� ����� ���������� �������.";
	permanent = FALSE;
};
func int DIA_Karah_BringCrossbow_condition()
{
	if ((MIS_DS2P_Cbow4Karah == Log_Running) && Npc_HasItems(other,ITRW_DS2P_Crossbow_Karah) >= 1)
	{	
		return TRUE;	
	};
};	

func void DIA_Karah_BringCrossbow_info()
{
	AI_Output(other,self,"DIA_Karah_BringCrossbow_15_00");	//� ����� ���������� �������.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_01");	//���? ��-�� ������ ��� ���!
	// ������ ������� ������
	B_GiveInvItems(other,self,ITRW_DS2P_Crossbow_Karah,1);
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_02");	//��, ���, ���� � �� ��� ����� �������, �� ����� ����� �� ���� �������. �� ��������, ����� �� ������. � �����! � ������� �� ����� ����� ����, �������, ��� ��� ������� ����� �� �� ������. ���������, ��� �� ��������.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_03");	//���, ���� ������, � ������-�� �������� ���������� �� �����. ������, ���� �������� ��� ����������. ��� �� ����������� ���� � �� ������������ ����� ��������.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_04");	//��� ����! ������ � �� ���������, ���� �� �����, �� ���� ���������� ���� �������.
	AI_Output(other,self,"DIA_Karah_BringCrossbow_15_05");	//�� ������ �� �����?
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_06");	//� ���?
	AI_Output(other,self,"DIA_Karah_BringCrossbow_15_07");	//������� ���-�� ��������������� ������ ������ ��� ��� ���� ���������� �� ���������� �������.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_08");	//�� �����, �����.
	// ������� � ��������� ����� 2000 ������� � ������ ��
	CreateInvItems(self,ItMi_Gold,2000);
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(other,self,"DIA_Karah_BringCrossbow_15_09");	//� ����� ������� ����� ����.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_10");	//��-��. ���, ���, �� �����. � ���� ���������� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Cbow4Karah,LOG_MISSION,LOG_Success,TOPIC_DS2P_Cbow4Karah_Success);
	B_GivePlayerXP(XP_MIS_Cbow4Karah_Success);
	AI_StopProcessInfos(self);
};

// ������������, ���� ���� ����� "������������ �����", � � ��������� � �� ���� 20 ������ � ������������ �� ���������� ����
// nr = 1
	
instance DIA_Karah_BringCharmedBolts(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_BringCharmedBolts_condition;	
	information = DIA_Karah_BringCharmedBolts_info;
	description = "��� ���� �����.";
	permanent = FALSE;
};
func int DIA_Karah_BringCharmedBolts_condition()
{
	if ((MIS_DS2P_CharmedBolts == Log_Running) && Npc_HasItems(other,ITRW_ADDON_MAGICOREBOLT) >= 20)
	{	
		return TRUE;	
	};
};

func void DIA_Karah_BringCharmedBolts_info()
{
	AI_Output(other,self,"DIA_Karah_BringCharmedBolts_15_00");	//��� ���� �����.
	AI_Output(self,other,"DIA_Karah_BringCharmedBolts_13_01");	//����� ����!
	// ������ ����� ������
	B_GiveInvItems(other,self,ITRW_ADDON_MAGICOREBOLT,20);
	AI_Output(self,other,"DIA_Karah_BringCharmedBolts_13_02");	//(�������) �������, ����� �������. ����� ����� ������ �������. ��� � ������, � ���� ����� ���� �������� �� ��������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_Success,TOPIC_DS2P_CharmedBolts_Success);
	B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"����� ����� ����� ���� �������� �� ��������.");
	B_GivePlayerXP(XP_MIS_DS2P_CharmedBolts);
};
	
// ������������, ���� ������� ����� "������������ �����"
// nr = 5
	
instance DIA_Karah_TeachMe(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 5;
	condition = DIA_Karah_TeachMe_condition;	
	information = DIA_Karah_TeachMe_info;
	description = "��� ����.";
	permanent = TRUE;
};

func int DIA_Karah_TeachMe_condition()
{
	if (MIS_DS2P_CharmedBolts == Log_Success)
	{	
		return TRUE;	
	};
};

func void DIA_Karah_TeachMe_info()
{
	Info_ClearChoices(DIA_Karah_TeachMe);
	Info_AddChoice(DIA_Karah_TeachMe,Dialog_Back,DIA_Karah_TeachMe_BACK);
	Info_AddChoice(DIA_Karah_TeachMe,"�������� �� �������� + 5",DIA_Karah_TeachMe_5);
	Info_AddChoice(DIA_Karah_TeachMe,"�������� �� �������� + 1",DIA_Karah_TeachMe_1);
};

func void DIA_Karah_TeachMe_BACK()
{
	Info_ClearChoices(DIA_Karah_TeachMe);
};

func void DIA_Karah_TeachMe_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100);
	Info_ClearChoices(DIA_Karah_TeachMe);
	Info_AddChoice(DIA_Karah_TeachMe,Dialog_Back,DIA_Karah_TeachMe_BACK);
	Info_AddChoice(DIA_Karah_TeachMe,"�������� �� �������� + 5",DIA_Karah_TeachMe_5);
	Info_AddChoice(DIA_Karah_TeachMe,"�������� �� �������� + 1",DIA_Karah_TeachMe_1);
};

func void DIA_Karah_TeachMe_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100);
	Info_ClearChoices(DIA_Karah_TeachMe);
	Info_AddChoice(DIA_Karah_TeachMe,Dialog_Back,DIA_Karah_TeachMe_BACK);
	Info_AddChoice(DIA_Karah_TeachMe,"�������� �� �������� + 5",DIA_Karah_TeachMe_5);
	Info_AddChoice(DIA_Karah_TeachMe,"�������� �� �������� + 1",DIA_Karah_TeachMe_1);
};

// ������������, ���� ���� ����� "��������� ��� ������", � ���� �����
// nr = 1
	
instance DIA_Karah_JornIsDead(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_JornIsDead_condition;	
	information = DIA_Karah_JornIsDead_info;
	description = "���� �����.";
	permanent = FALSE;
};
func int DIA_Karah_JornIsDead_condition()
{
	if (MIS_DS2P_GuardsForCave == Log_Running && Npc_IsDead(Jorn))
	{	
		return TRUE;	
	};
};

func void DIA_Karah_JornIsDead_info()
{
	AI_Output(other,self,"DIA_Karah_JornIsDead_15_00");	//���� �����.
	AI_Output(self,other,"DIA_Karah_JornIsDead_13_01");	//� ���? ���� ��� ������ ���������?
	AI_Output(other,self,"DIA_Karah_JornIsDead_15_02");	//��. ���� �������� ���� ������ ���� ���� � �������� ���� � ������ � ����������.
	AI_Output(self,other,"DIA_Karah_JornIsDead_13_03");	//���������! ���� �� ���� ����� ������ �������� � ����� ������������ ������. �����, �����!
	B_StartOtherRoutine(self,"GUARDSFORCAVE"); // ���������� ������ �� ����
	B_DSG_Log_OpenClose(TOPIC_DS2P_GuardsForCave,LOG_MISSION,LOG_Running,TOPIC_DS2P_GuardsForCave_KarahIsSend);
	AI_StopProcessInfos(self);
};
	
// ������������, ���� �������� ����� "��������� ��� ������"
// nr = 1
	
instance DIA_Karah_HowAreYouAfterQuest(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_HowAreYouAfterQuest_condition;	
	information = DIA_Karah_HowAreYouAfterQuest_info;
	description = "��� ����?";
	permanent = TRUE;
};
func int DIA_Karah_HowAreYouAfterQuest_condition()
{
	if (MIS_DS2P_GuardsForCave == Log_Success)
	{	
		return TRUE;	
	};
};

func void DIA_Karah_HowAreYouAfterQuest_info()
{
	AI_Output(other,self,"DIA_Karah_HowAreYouAfterQuest_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Karah_HowAreYouAfterQuest_13_01");	//�, � �� ���������. ���� ���� ���������� ������� �� ���� ����. � ����� ������, ������������, ������� ���������� ��� ���������� ����������� � ����� ��������?
};