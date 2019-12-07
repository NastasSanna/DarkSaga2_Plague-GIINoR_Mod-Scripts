instance DIA_LanSkeleton_EXIT(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 999;
	permanent = TRUE;
	condition = DIA_LanSkeleton_EXIT_condition;	
	information = DIA_LanSkeleton_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_LanSkeleton_EXIT_condition(){	return TRUE;};
func void DIA_LanSkeleton_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_LanSkeleton_Start(C_Info)	//��������� ������ �� ��������	//nr = 1;
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	condition = DIA_LanSkeleton_Start_condition;	
	information = DIA_LanSkeleton_Start_info;
	important = TRUE;
};
func int DIA_LanSkeleton_Start_condition(){	if(Npc_IsInState(self,ZS_Talk)){return TRUE;}; };
func void DIA_LanSkeleton_Start_info()
{	
	AI_Output(self,other,"DIA_LanSkeleton_Start_13_00");	//���� ���������, ������� �� ����� ��� ��?
	AI_Output(other,self,"DIA_LanSkeleton_Start_15_00");	//�������� � �������� ����������, � ��� ���������� �������.
	AI_Output(self,other,"DIA_LanSkeleton_Start_13_01");	//�� ������ ������, ������� ����!
	AI_StopProcessInfos(self);
};
//----
//���������� ����� ����������	//nr = 1;
//----
instance DIA_LanSkeleton_WhatIsYourName(C_Info)	//��� ���� �����?
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	condition = DIA_LanSkeleton_WhatIsYourName_condition;	
	information = DIA_LanSkeleton_WhatIsYourName_info;
	description = "��� ���� �����?";
};
func int DIA_LanSkeleton_WhatIsYourName_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_Start)){return TRUE;};
};	
func void DIA_LanSkeleton_WhatIsYourName_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_WhatIsYourName_15_00");	//��� ���� �����?
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_00");	//� ���� ����� ���� �� ����� �����?
	AI_Output(other,self,"DIA_LanSkeleton_WhatIsYourName_15_01");	//������ ���� ���� ��������.
	AI_PlayAni(self,"R_SCRATCHHEAD");
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_01");	//(���������� �������) �����. � ������, �� �� ����������� ���� ���� ����������� �� ������ ���� ���������. ������ ����� ���� ���.
	AI_Output(other,self,"DIA_LanSkeleton_WhatIsYourName_15_02");	//� ���, ������ ��� ����� �����������?
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_02");	//�� ����� ��� �������. ���� �� �� ����, ����� �� ������� ���� �� ������.
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_03");	//��� ����� ��� ������ �� ������ �� �� ���� �������, � �� �������, � ������ ��� �� ������ ��� ����� ����. �������, � ���� � ���� �� ���...
	AI_Output(other,self,"DIA_LanSkeleton_WhatIsYourName_15_03");	//��������, ��� ���������.
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_04");	//���� ��� �� ��������, �� ���� �� � ���� ����!
	AI_StopProcessInfos(self);
};
//
//���������� ����� �����������	//nr = 1;
//
instance DIA_LanSkeleton_TellMeHowYouBecameSkeleton(C_Info)	//��������, ��� �� ���� ��������?
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	condition = DIA_LanSkeleton_TellMeHowYouBecameSkeleton_condition;	
	information = DIA_LanSkeleton_TellMeHowYouBecameSkeleton_info;
	description = "��������, ��� �� ���� ��������?";
};
func int DIA_LanSkeleton_TellMeHowYouBecameSkeleton_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_WhatIsYourName)){return TRUE;};
};	
func void DIA_LanSkeleton_TellMeHowYouBecameSkeleton_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_00");	//��������, ��� �� ���� ��������?
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_00");	//�� ���� �� �� ���� ���������?! ���� ���, ������ ���� ����, �������� ���� �����?!
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_01");	//���, ��������, � ����� ���� ������. �����, �� ����� ���� ������� ���� �����.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_01");	//�� ����, ��� �� ������ ��� ������... �� �����.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_02");	//� �����, ��� ���� ��� ���� �����. ����� � ��������� �� ������� ���������� ������ � ��������� ���������, ������ ���� ����� ��������!
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_03");	//��� ������ ��� �������, ���� ������ ������� ��������� �� �������� � ���� �����������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_04");	//��� ���, ������� ������� ����� ����� ����-�����.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_05");	//���� �� ������� �������� ��������� ��� �� ����� ������� �� ������� �����, ���, ��� ������� ������� �������, �������� ��������� ���������.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_02");	//� ��, ������� ��, ����������� ����.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_06");	//� ��� ��!
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_07");	//���� ����� ��� �������, ��� � �������� ���� ����� ��������, ���� �� ������ � ���������� ������ � ����������, ���������� ���.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_08");	//� �����, ����� ������ �� ���� �� �����. �����������, ����� �� ������, � ������ ��� ��� �� �������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_09");	//������, ��� ������� �� ������, ��� �������� ��� ������ ���������. ������, ��� �� ��� �������� �� ��� ������, ����� �� ������ ������ �� �������� � ����� ������.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_03");	//���� �������� ��� � ��������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_10");	//(�������) �� ����.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_11");	//�����������, �� ��������, ��� �������� ������, ���� ������� ������ �� ��� �� ���������� ����������� �� ���� �������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_12");	//� �� ��� ���, ���� �� ������ ��������� �������� �� �����������, ����� ����������� ����� ��� ���������, ��� ����� ������� �������� ���� ������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_13");	//��� ��� ������� �� ���� ������ ���! �� � ������ ���, �����, �������...
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_14");	//��� ������ �����, � �� ������ ��������� ����� ����������.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_04");	//� ��� ���� ������� ��������� �� ���� ���������? ������ �� �� ��������� ��� ������?
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_15");	//(����� ���������) � � �� ����� �� �����! � ����� �������, ��� ��� ���-�� �������, � ����������� �������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_16");	//������ ��������, ��� � ���� �������� �������, � ���� �� ���� ������� � �����, �� ���� ����� �����, ��� ����� �� ����� �������. (�������)
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_17");	//� � ������������� ����� ���� ������ ���, ��� ������� ������� �� ����� ��� ���������. �� ��� �� � ����� ���� ��� ��� ��� ������.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_05");	//���� �� �� ����� � ����������, �� ������ �� ���� �������?
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_18");	//������, ������?! ������ ��� ����� ������� � �������� ���������, �� ��� � ����� �������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_19");	//��� �������, ��� ���� � �� ������� ����� ��������, �� ��� ����� ����!
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_20");	//�, �����������, ����������, ������� �������� �������� ������ � ������ ��� �������� ���.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_21");	//�� ������� ��� ������ �� �����. �� ������ ��������� � �� ���� � ��� ���� �� ������� �� �������� ������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_22");	//���� ���� ����� �� ����, � ������� ��� �������, �� ���� ��������� ��� ������ � �����, � ����������� � ������ �� ������, ��� � ��� �������.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_06");	//� ��� �������, �� ������� ����� ������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_23");	//����� �������������!
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_24");	//��, ��� ������ ����. ���-�� �� ������, ��� � ����� ��� �������� � ����. �� ��������, ��� ��� ����� ������, ������� � �����������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_25");	//�����-�� �� ��� �����, �� ����� ��� � �� �����.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_07");	//��� ��� ���� ������ ������� �����? �� �� �������, ���� ���������� �����.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_26");	//�� ��� ��� ������. � ����� ��������, ������� ���, ��� �������� ���, ���������� ���� ��������.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_27");	//� �� ���� ����������� ��� ����, ���� ���� �� ������ �������. �������-�� � � ������ ��� ��� �������������� � �������� ���� �������.
};
//
//���������� ����� �����������	//nr = 1;
//
instance DIA_LanSkeleton_IllTryToHelpYou(C_Info)	//� �������� ������ ����.
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	condition = DIA_LanSkeleton_IllTryToHelpYou_condition;	
	information = DIA_LanSkeleton_IllTryToHelpYou_info;
	description = "� �������� ������ ����.";
};
func int DIA_LanSkeleton_IllTryToHelpYou_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_TellMeHowYouBecameSkeleton)){return TRUE;};
};	
func void DIA_LanSkeleton_IllTryToHelpYou_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_IllTryToHelpYou_15_00");	//� �������� ������ ����. �������, �� ��� ���� � ������� �� �������� � ������.
	AI_Output(self,other,"DIA_LanSkeleton_IllTryToHelpYou_13_00");	//������? ���� �� ������� ��� �����, � ��� ������, ��� ���������!
	B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_Running,TOPIC_DS2P_DamnSailor_Start);
};
//
//���������� ����� ����������	//nr = 3;
//
instance DIA_LanSkeleton_WhyAreUSoAggressive(C_Info)	//�� ������ ����� �����������?
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 3;
	permanent = FALSE;
	condition = DIA_LanSkeleton_WhyAreUSoAggressive_condition;	
	information = DIA_LanSkeleton_WhyAreUSoAggressive_info;
	description = "�� ������ ����� �����������?";
};
func int DIA_LanSkeleton_WhyAreUSoAggressive_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_Start) && (MIS_DS2P_DamnSailor != LOG_SUCCESS)){return TRUE;};
};	
func void DIA_LanSkeleton_WhyAreUSoAggressive_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_WhyAreUSoAggressive_15_00");	//�� ������ ����� �����������?
	AI_Output(self,other,"DIA_LanSkeleton_WhyAreUSoAggressive_13_00");	//� �� �������� ������ � ���� �����, ��� � �������� �������!
	AI_StopProcessInfos(self);
};
//
//���������� ����� ���������� (����������)	//nr = 4;
//
instance DIA_LanSkeleton_DidYouNotTireBeGuard(C_Info)	//�� ����� ���������?
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 4;
	permanent = TRUE;
	condition = DIA_LanSkeleton_DidYouNotTireBeGuard_condition;	
	information = DIA_LanSkeleton_DidYouNotTireBeGuard_info;
	description = "�� ����� ���������?";
};
func int DIA_LanSkeleton_DidYouNotTireBeGuard_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_Start)){return TRUE;};
};	
func void DIA_LanSkeleton_DidYouNotTireBeGuard_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_DidYouNotTireBeGuard_15_00");	//�� ����� ���������?
	AI_Output(self,other,"DIA_LanSkeleton_DidYouNotTireBeGuard_13_00");	//������� ����� �� �����������!
	AI_StopProcessInfos(self);
};

//NS - 23/06/2013 ===========
// ������� ���� �����, ���� ����
//===========================
instance DIA_LanSkeleton_ReturnDiamond(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 5;
	condition = DIA_LanSkeleton_ReturnDiamond_condition;	
	information = DIA_LanSkeleton_ReturnDiamond_info;
	description = "� ������ ���� ����� � �����.";
};
func int DIA_LanSkeleton_ReturnDiamond_condition(){	
	if(Npc_HasItems(other,ITMI_DS2P_CursedDiamond) > 0){return TRUE;};
};	
func void DIA_LanSkeleton_ReturnDiamond_info()
{
	var int x;
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_00");	//� ������ ���� ����� � �����.
	//(+����)
	B_GivePlayerXP(XP_MIS_DamnSailor_Success);
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_01");	//�� ������? ����� ��� ������ ����.
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_02");	//�� ��������. ������� �������.
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_03");	//�����, ������ � �����. ���, ����� ������.
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_04");	//� ����� ���� � ���� ���� ���-������ ����� �������, ��� ���� ����� �����?
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_05");	//� ��� ��?
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_06");	//�� �� ��� �������, ��� ���� ������� ������������ � ��������� ����������.
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_07");	//�� ��� ���� ������? � �������, ��� �� ������� ������� ���� �� �� ������!
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_08");	//� �����, �� �����. ����� ����� �������� ����� �� �������, ����� ��� ������� ����������� �� ����������� � ��� ������.
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_09");	//�����! �� ��, � ��������� �� ���� �����, �� ��� �� ������, ��� ��� ������� ������� ���-������ ������.
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_10");	//��, ��� � ���. ������, ����� ��������� � ����.
	//�� ���������������
	AI_TurnAway(other, self);
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_11");	//����!
	//�� �������������� �����
	AI_TurnToNpc(other, self);
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_12");	//�����, ���� �����. 

	//���� �� ��� �� ���� �����
	if (Npc_HasItems(self, ItWr_DS2P_Map_LanSkeleton))
	{
			AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_13");	//������ ��� �����. ��� �������, ��� � ������� ��������� ��������� ������. ��� ���, ��� � ���� ����.
		//���� ������ �������� ����
		x = 1; if (x == 1) {
			B_GiveInvItem_red(self,other,ItWr_DS2P_Map_LanSkeleton,1,35);
		};
		AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_14");	//��� ��� ������ ��������. ������� ���� �����.
	}
	//���� �� ���� �����
	else
	{
			AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_15");	//� ���� ���� ����� ��������, �� �����-�� ������� ������ �� � ����. ����� �� ��� �������...
			AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_16");	//�� � ���� �������� ������� ������� �������. ������, ��� ���, ��� � ���� ����.
		AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_17");	//�����, � ���� ����.
		//���� 4 ������� ������ ��� �������
		x = 2; if (x == 2) {
			B_GiveInvItem_red(self,other,ItMi_DS_Almaz,4,35);
		};
	};
	//�������� ��������� �����
	x = 3; if (x == 3) {
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_CursedDiamond,1,40);
		//���������� ���������� ������ � ��� ���������� ���������.
		Wld_PlayEffect("spellFX_HealShrine", self,self,0,0,0,FALSE);
		B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_ToughBald01,BodyTex_L,ITAR_PIR_M_DS);
		Lan_BecameHuman = TRUE;
		Lan_TalkDay = Wld_GetDay();
	};
	//������ � �������� "��������� �����" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_DamnSailor_Success);
};

//NS - 23/06/2013 ===========
// ������� �����, 
// ���� ����� ��� ��� ��� ����� ��������
//===========================
var int THIEF_LanSkeleton_Map;
instance DIA_LanSkeleton_PICKPOCKET(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 900;
	condition = DIA_LanSkeleton_PICKPOCKET_Condition;
	information = DIA_LanSkeleton_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(�������� ������� ��� ����� ����� �������� ���������)";
};
func int DIA_LanSkeleton_PICKPOCKET_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Ado_WhatJob) || (other.attribute[ATR_DEXTERITY] >= C_DS_GetTheftChanceMultiplier(other,60)))
		&& (Npc_HasItems(self,ItWr_DS2P_Map_LanSkeleton) > 0))
	{	return TRUE;	};
};
func void DIA_LanSkeleton_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_LanSkeleton_PICKPOCKET);
	Info_AddChoice(DIA_LanSkeleton_PICKPOCKET,Dialog_Back,DIA_LanSkeleton_PICKPOCKET_BACK);
	Info_AddChoice(DIA_LanSkeleton_PICKPOCKET,DIALOG_PICKPOCKET,DIA_LanSkeleton_PICKPOCKET_DoIt);
};
func void DIA_LanSkeleton_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= C_DS_GetTheftChanceMultiplier(other,60))
	{
		B_GiveInvItems(self,other,ItWr_DS2P_Map_LanSkeleton,1);
		THIEF_LanSkeleton_Map = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_LanSkeleton_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};
func void DIA_LanSkeleton_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_LanSkeleton_PICKPOCKET);
};
//Redleha - 12/09/2014 ===========
// ���� ���� ����� "� ������� ��������", � ����� ���������� ����� ��� �� ������� �/��� ����� �� ��������
//===========================
instance DIA_LanSkeleton_YouPossessGreatTreasures(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 6;
	condition = DIA_LanSkeleton_YouPossessGreatTreasures_condition;	
	information = DIA_LanSkeleton_YouPossessGreatTreasures_info;
	description = "�������, ��� �� �������� �������� �����������.";
};
func int DIA_LanSkeleton_YouPossessGreatTreasures_condition(){	
	if(Npc_HasItems(self,ITMI_DS2P_CursedDiamond) && (MIS_DS2P_InSearchOfTreasure == LOG_Running) && (MIS_DS2P_DamnSailor != LOG_SUCCESS))
	{return TRUE;};
};	
func void DIA_LanSkeleton_YouPossessGreatTreasures_info()
{
	AI_Output(other,self,"DIA_LanSkeleton_YouPossessGreatTreasures_15_00");	//�������, ��� �� �������� �������� �����������.
		AI_Output(self,other,"DIA_LanSkeleton_YouPossessGreatTreasures_13_00");	//� ���� �� ����? ���� ���� �������� �����, ������� ���������� � ���� � �������, �� ��������� ����������, �� �� � � �������� �����! (�������)
	AI_Output(other,self,"DIA_LanSkeleton_YouPossessGreatTreasures_15_01");	//���, � ������ � ������� �������.
		AI_Output(self,other,"DIA_LanSkeleton_YouPossessGreatTreasures_13_01");	//(���������) ������ ��...? (���������) 
		AI_Output(self,other,"DIA_LanSkeleton_YouPossessGreatTreasures_13_02");	//� ������ �� ���� �� ����. � ������, �� �������� ���� �� ���.
	//������ � �������� "� ������� ��������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_Running,"�����������, ��� �� � ��� �� ����������. ����� ����������� ��-�������.");
	AI_StopProcessInfos(self);
};

// ����������� ����� ���� ����, ��� ��� ���� ���������. �� ��� ���������� � ��
// nr = 1

instance DIA_LanSkeleton_AboutNightmares(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_LanSkeleton_AboutNightmares_condition;	
	information = DIA_LanSkeleton_AboutNightmares_info;
	description = " ";
};

func int DIA_LanSkeleton_AboutNightmares_condition()
{	
	if((Wld_GetDay() - Lan_TalkDay) >= 2)
	{
		return TRUE;
	};
};

func void DIA_LanSkeleton_AboutNightmares_info()
{
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_00");	//��� ����.
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_01");	//��� ���� ����?
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_02");	//�� ������ ��� ������.
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_03");	//������? � ���� �� ���? � ������ ������ �� ������.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_04");	//���� ������ �������. � ������ �� ���� ����� ����� ����, ��� �� ������ ��� ��� ����� � ������������ �����.
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_05");	//������� �� � �����, ������� �� ��������. �� ��� �� ��� ��������, � ��� �������� ������������ ��������� �� ���� �������.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_06");	//�������? � �� �����, �� ���� ������ ������?
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_07");	//���, ���������, ����� � ���� �� �������. ��� ����� �����, ������ � ������������ �� ������� �������� ���������.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_08");	//(���) �� ��� ��� �����������?!! � ����� ��������� �� ����! ����� ��������� �� ����! ���� ����������� ���������� �� �����! � �� ������� �����������!
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_09");	//��, ������ ��� � ������� ��������.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_10");	//�� ��� ��������?
	Info_ClearChoices(DIA_LanSkeleton_AboutNightmares);
	Info_AddChoice(DIA_LanSkeleton_AboutNightmares,"���.",DIA_LanSkeleton_AboutNightmares_No);
	Info_AddChoice(DIA_LanSkeleton_AboutNightmares,"��.",DIA_LanSkeleton_AboutNightmares_Yes);
};

// �����������, ���� ������� ������� "���." � ������� � ����� � ��������

func void DIA_LanSkeleton_AboutNightmares_No()
{
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_No_15_00");	//���. � ���� � ��� ����� ������� �������. �� � ��� ��������� ���� �� �������� ���������? ������ ��� ���� ��� ������ ����� � ������ � ���������� �������, ������ ������ ��� ���� �� ������, ����� �� ��������� �������? ���, ���������� ���.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_No_13_01");	//� �����, ������ � �������! ��� ���������.
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "��." � ������� � ����� � ��������

func void DIA_LanSkeleton_AboutNightmares_Yes()
{
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_Yes_15_00");	//��. ��� ���� ������? ������ ��� ���� ����� � ����� � ���� ���� ������ �� ������ ������ ���, ����� �� ��������� �������? ����� ��������?
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_Yes_13_01");	//(�����������) �������� ����������. � ���� �� ������� ����� �� ��� ���?
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_Yes_15_02");	//���� ���, �� �� ����� ������ ����.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_Yes_13_03");	//������ � ����, ����� �� ���� �������. ��� � ����� �� ������� ������� � �������� ��� ����� �����.
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_Yes_15_04");	//�����, �����, ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Nightmares,LOG_MISSION,LOG_Running,TOPIC_DS2P_Nightmares_Start);
	AI_StopProcessInfos(self);
};

// ������������, ���� ������� ����� "�������" � ����� � ������� �����
// nr = 1

instance DIA_LanSkeleton_BringNighPotion(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	important = FALSE;
	condition = DIA_LanSkeleton_BringNighPotion_condition;	
	information = DIA_LanSkeleton_BringNightPotion_info;
	description = "�������, � ����, ��� ���� ������.";
};

func int DIA_LanSkeleton_BringNighPotion_condition()
{	
	if((MIS_DS2P_Nightmares == Log_Running)
		 && Npc_KnowsInfo(other,DIA_Vatras_NightPotion) && (Npc_HasItems(other,ItMi_DS2P_LanNightmaresPotion) >= 1))
	{
		return TRUE;
	};
};

func void DIA_LanSkeleton_BringNightPotion_info()
{
	AI_Output(other,self,"DIA_LanSkeleton_BringNightPotion_15_00");	//�������, � ����, ��� ���� ������.
	AI_Output(self,other,"DIA_LanSkeleton_BringNightPotion_13_01");	//�? �� ���� ���� �� �����! ������!
	// ��� ����� ���� � ������� �������� ��������� �����, ���� ������ ���������, ��������
	AI_Wait(other,1);
	//AI_Output(other,self,"DIA_LanSkeleton_BringNightPotion_Hair");	//(�������� ���� ����� � ������ ����)
	AI_Output(self,other,"DIA_LanSkeleton_BringNightPotion_13_02");	//��! �� ��� �������?
	AI_Output(other,self,"DIA_LanSkeleton_BringNightPotion_15_03");	//��� ����. ������ � ������� �����, �� ������ �����, � ����� ����� � ���������� ������ � ����� � ���� ������, ����� �������� ���� �� ����. �������?
	AI_Output(self,other,"DIA_LanSkeleton_BringNightPotion_13_04");	//��. ��� ���������?
	AI_Output(other,self,"DIA_LanSkeleton_BringNightPotion_15_05");	//����� ���������, ��� ��. ������ ������ �����.
	AI_PlayAniBS(self,"T_STAND_2_SLEEP",BS_LIE); // ��� ������� �����. ����� �� ����, ����� �������� ��������
	CreateInvItems(other,ItPo_DSG_LansPotion,1); // ������� ����� ���� � ��������� (������� ����� ������)
	Npc_RemoveInvItems(other,ItMi_DS2P_LanNightmaresPotion,1); // ������� ����� ���� �� ��������� (������� ������ ������)
	B_UseItem(other,ItPo_DSG_LansPotion); // �������� �����
	// ��� ���� ������� ����� ������ �� ��� ����. DSG_LAN_DREAM_ZEN
	// �� ���� ��������� ����� ����� �������-����, ����� ������ ����� �� ����������
	AI_StopProcessInfos(self);
};
	
// �����������, ����� �� ����� �� ��� ����
// nr = 1

instance DIA_LanSkeleton_ReturningFromDream(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_LanSkeleton_ReturningFromDream_condition;	
	information = DIA_LanSkeleton_ReturningFromDream_info;
	description = " ";
};

func int DIA_LanSkeleton_ReturningFromDream_condition()
{	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_HM_Dream))
	{
		return TRUE;
	};
};

func void DIA_LanSkeleton_ReturningFromDream_info()
{
	// ������ ��������, ��� ��� ���������. ������, �� ���� ��� �������
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_00");	//��, ��� �� ����� ������!
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_01");	//�� � �������?
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_02");	//��, �������. ��� ��� ���� ���?
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_03");	//��� ���� ������ ����� ��������� ���� �������. ��� �������� ����� ���.
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_04");	//�����?.. �������-��, �����-�� �������� �������� ���������� ����.
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_05");	//� ������?
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_06");	//(������� �����). �� ����� ����!
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_07");	//�� ����������!
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_08");	//��� ���, � ������ ���������� �������, ������� ������������? � ��������� �����?
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_09");	//�������� ��������� ������� ������. ���������, ������������ �� �� � �������.
	// "��� ������ �������� �����, ����� ���-�� ����������. ������ �� ����������." -- ��� ������ ���� �����-�� ��������?
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_10");	//��� ��� ��! ��������� �����! ������� ����, �����. ��� ���������� ����. �������! ��� �� � �� ���� ������!
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_11");	//��� �� �� ��� ����� �� ���� ��������, �����, ��������� � ���� �������?
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_12");	//��, �������.
	// UNFINISHED -- ���� ������ �������. � �������� �� �������, ��� ������
	B_DSG_Log_OpenClose(TOPIC_DS2P_Nightmares,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Nightmares_Success);
	B_GivePlayerXP(XP_MIS_Nightmares_Success);
	AI_StopProcessInfos(self);
};