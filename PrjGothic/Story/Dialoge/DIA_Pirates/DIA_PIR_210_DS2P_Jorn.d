instance DIA_Jorn_EXIT(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Jorn_EXIT_condition;	
	information = DIA_Jorn_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Jorn_EXIT_condition(){	return TRUE;};
func void DIA_Jorn_EXIT_info(){	AI_StopProcessInfos(self);};
//
//	��������� ������
//
var int Jorn_GetDistToWP_GG;	//���������� �� �� ���������, ��� ��������.
const string Jorn_GuardWP = "";
var int Jorn_RightAnswer;	//����������, ���������� �� ��, ��� ���� ����� ��������� ������������� � ��.
instance DIA_Jorn_Start(C_Info)	//��������� ������ "� ��, ����!"  //nr = 1
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_Start_condition;	
	information = DIA_Jorn_Start_info;
	important = TRUE;
};
func int DIA_Jorn_Start_condition(){	return TRUE;};
func void DIA_Jorn_Start_info()
{
	If(Npc_HasEquippedRangedWeapon(self))
	{
		AI_ReadyRangedWeapon(self);
		AI_AimAt(self,other);
	}
	else if(Npc_HasEquippedMeleeWeapon(self))
	{
		AI_ReadyMeleeWeapon(self);
	};
	AI_Output(self,other,"DIA_Jorn_Start_13_00");	//� �� ����! �� ��� �����? ��� ���� ���, � � �������.
	AI_Output(other,self,"DIA_Jorn_Start_15_00");	//� ������ �� �������.
	AI_Output(self,other,"DIA_Jorn_Start_13_01");	//��� � ���������� �������, ��� �� � ������ ����!
	AI_Output(self,other,"DIA_Jorn_Start_13_02");	//��� �������� ������ ���������� � ������� � ��� ������ �����!
	AI_Output(self,other,"DIA_Jorn_Start_13_03");	//����, �  ����� �� �� ����, ������? � ������, ��� ��������� ����� ������� ��������� ������� �������.
	
	AI_Output(other,self,"DIA_Jorn_Start_15_01");	//��-������, � ����� �� �����������?
	AI_Output(self,other,"DIA_Jorn_Start_13_04");	//� ��� ��� ��������? � �� ���������� �� ����������.
	AI_Output(self,other,"DIA_Jorn_Start_13_05");	//� �����, � ���� ���� ���� ������, ����� �������� ������ ���� �������� ���, ��� �� �� �� ���� �������� ���������.
	Jorn_GetDistToWP_GG = Npc_GetDistToWP(other,Jorn_GuardWP);
};
//
//	���������� ����� ����������, �� �� ���� �������, ���� �� ������ ������ �����
//
instance DIA_Jorn_DoNotTemptFate(C_Info)	//	"�� ������� ������!"  //nr = 1
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Jorn_DoNotTemptFate_condition;	
	information = DIA_Jorn_DoNotTemptFate_info;
	important = TRUE;
};
func int DIA_Jorn_DoNotTemptFate_condition(){	
	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && C_Npc_GetDistToWP(other,Jorn_GuardWP,Jorn_GetDistToWP_GG,less) && !Jorn_RightAnswer)
	{return TRUE;};
};
func void DIA_Jorn_DoNotTemptFate_info()
{
	AI_Output(self,other,"DIA_Jorn_DoNotTemptFate_13_00");	//��� ���� ���... �� ������� ������!
	AI_StopProcessInfos(self);
};
//
//	���������� ����� ����������, �� �� ���� �������, ���� �� ������ ������ �����
//
instance DIA_Jorn_IwarnedU(C_Info)	//	"� ���� ������������..."  //nr = 1
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Jorn_IwarnedU_condition;	
	information = DIA_Jorn_IwarnedU_info;
	important = TRUE;
};
func int DIA_Jorn_IwarnedU_condition(){	
	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && C_Npc_GetDistToWP(other,Jorn_GuardWP,Jorn_GetDistToWP_GG-100,less) && !Jorn_RightAnswer)
	{return TRUE;};
};
func void DIA_Jorn_IwarnedU_info()
{
	AI_Output(self,other,"DIA_Jorn_IwarnedU_13_00");	//� ���� ������������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
//
//	���������� ����� ����������, �� �� ���� �������, ���� �� ������ ������ �����
//
instance DIA_Jorn_ISailedOnShip(C_Info)	//	"� ������ ������� ������� �� �������."  //nr = 900
{
	npc = PIR_210_DS2P_Jorn;
	nr = 900;
	permanent = FALSE;
	condition = DIA_Jorn_ISailedOnShip_condition;	
	information = DIA_Jorn_ISailedOnShip_info;
	description = "� ������ ������� ������� �� �������.";
};
func int DIA_Jorn_ISailedOnShip_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && !Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_ISailedOnShip_info()
{
	AI_Output(other,self,"DIA_Jorn_ISailedOnShip_15_00");	//� ������ ������� ������� �� �������.
	AI_Output(self,other,"DIA_Jorn_ISailedOnShip_13_00");	//��? � ��� ���� �������? �� ��, �� �� ������� �� � �������... ��-��...
	AI_Output(self,other,"DIA_Jorn_ISailedOnShip_13_01");	//�� ���� ��� �����! ���� �� � ���� ��� �������, ��� �� ����� ��� ����� �� ����. �� �-�� ���� �����, �� �� ������� ���� ����.	
	AI_Output(other,self,"DIA_Jorn_ISailedOnShip_15_01");	//��...
	AI_Output(self,other,"DIA_Jorn_ISailedOnShip_13_02");	//����� ��-�������� ����������� � �������.
	AI_StopProcessInfos(self);
};
//
//	���������� ����� ����������, �� �� ���� �������, ���� �� ������ ������ �����
//
instance DIA_Jorn_AskGreg(C_Info)	//	"���� �� ������, ������ � �����."  //nr = 901
{
	npc = PIR_210_DS2P_Jorn;
	nr = 901;
	permanent = FALSE;
	condition = DIA_Jorn_AskGreg_condition;	
	information = DIA_Jorn_AskGreg_info;
	description = "���� �� ������, ������ � �����.";
};
func int DIA_Jorn_AskGreg_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && !Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_AskGreg_info()
{
	AI_Output(other,self,"DIA_Jorn_AskGreg_15_00");	//���� �� ������, ������ � �����.
	AI_Output(self,other,"DIA_Jorn_AskGreg_13_00");	//���, ��� ����. ��� ������ ���� ������� ���������, ��� ��� �!
	AI_Output(self,other,"DIA_Jorn_AskGreg_13_01");	//��! �������� ���-������ ����� �����.
	AI_StopProcessInfos(self);
};
//
//	���������� ����� ����������, �� �� ���� �������, ���� �� ������ ������ �����
//
instance DIA_Jorn_WhatWouldUDoIfImHunter(C_Info)	//	"��, � ��� �� ��� ��������, ���� � �������?"  //nr = 902
{
	npc = PIR_210_DS2P_Jorn;
	nr = 902;
	permanent = FALSE;
	condition = DIA_Jorn_WhatWouldUDoIfImHunter_condition;	
	information = DIA_Jorn_WhatWouldUDoIfImHunter_info;
	description = "��, � ��� �� ��� ��������, ���� � �������?";
};
func int DIA_Jorn_WhatWouldUDoIfImHunter_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && !Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_WhatWouldUDoIfImHunter_info()
{
	AI_Output(other,self,"DIA_Jorn_WhatWouldUDoIfImHunter_15_00");	//��, � ��� �� ��� ��������, ���� � �������?
	AI_Output(self,other,"DIA_Jorn_WhatWouldUDoIfImHunter_13_00");	//������ ������? � ���� ������ �������.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
//
//	���������� ����� ����������, �� �� ���� �������, ���� �� ������ ������ ����� (��� �����)
//
instance DIA_Jorn_IKnowAboutCursedIsland(C_Info)	//	"� ���� � ��������� �������."  //nr = 903
{
	npc = PIR_210_DS2P_Jorn;
	nr = 903;
	permanent = FALSE;
	condition = DIA_Jorn_IKnowAboutCursedIsland_condition;	
	information = DIA_Jorn_IKnowAboutCursedIsland_info;
	description = "� ���� � ��������� �������.";
};
func int DIA_Jorn_IKnowAboutCursedIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && !Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_IKnowAboutCursedIsland_info()
{
	AI_Output(other,self,"DIA_Jorn_IKnowAboutCursedIsland_15_00");	//� ���� � ��������� �������, ��� � ��� ��� ������. ��� ���� ������� �������� ���.
	AI_Output(self,other,"DIA_Jorn_IKnowAboutCursedIsland_13_00");	//��� ������ ���?
	AI_Output(other,self,"DIA_Jorn_IKnowAboutCursedIsland_15_01");	//�� � ������. �� ������� ��������� ���������� �����, ��� ���������.
	AI_Output(other,self,"DIA_Jorn_IKnowAboutCursedIsland_15_02");	//��� ���� �������� � ������ � ����� ������ � ����� �������� ���. �� �� ��� ���������� �������...
	AI_Output(other,self,"DIA_Jorn_IKnowAboutCursedIsland_15_03");	//����� �� ���������, � �����, ��� ������ ���������� ������ ��� ����. �����, �� ����� ������ ����������� ���� �� ����� ������ ������ ��� ������ ���������� ����� ������.
	AI_Output(self,other,"DIA_Jorn_IKnowAboutCursedIsland_13_01");	//��� ����! ������, �� ������������� ����� ������ ��� �������� ��������.
	Jorn_RightAnswer = TRUE;
};
//
//	���������� ����� �����, ���� �� �������
//
instance DIA_Jorn_AfterWinGG(C_Info)	//	"� �� ������� �����!"  important
{
	npc = PIR_210_DS2P_Jorn;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Jorn_AfterWinGG_condition;	
	information = DIA_Jorn_AfterWinGG_info;
	important = true;
};
func int DIA_Jorn_AfterWinGG_condition(){	
	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && !Jorn_RightAnswer)
	{return TRUE;};
};
func void DIA_Jorn_AfterWinGG_info()
{
	AI_Output(self,other,"DIA_Jorn_AfterWinGG_13_00");	//� �� ������� �����! �� ������.
	AI_Output(self,other,"DIA_Jorn_AfterWinGG_13_01");	//������, �� �� �����. �� �����, ��� ����� �������� ���-�� ���� �� ��� �� ����� ���������.
	B_GivePlayerXP(XP_Ambient);
	Jorn_RightAnswer = TRUE;
};
///-------------------------------------------------------------------------------------------------
//--����� ������� ����� ����, ��� ������ ������ �����: "� ���� � ��������� �������." ��� ����� �����.
//--���������� �Ĩ� ����� �����
////////////////////////////////////////////////////////////////////////////////////////////////////

instance DIA_Jorn_WhoAU(C_Info)	//	"��� ��?"  //nr = 1
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_WhoAU_condition;	
	information = DIA_Jorn_WhoAU_info;
	description = "��� ��?";
};
func int DIA_Jorn_WhoAU_condition(){	if(Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_WhoAU_info()
{
	AI_Output(other,self,"DIA_Jorn_WhoAU_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_00");	//���� ����� ����, � ���� �� ������������ �� ����� �������� �����!
	AI_Output(other,self,"DIA_Jorn_WhoAU_15_01");	//�� �����?
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_01");	//���� ��! � ��� �� ����� ��������.
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_02");	//������ ���� �������� �������� ����� ����� ��������� �������, �� ������� �� ��������.
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_03");	//�� ��� ������ �� ������! ��� ������� � ����, � ���� ��� �������!
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_04");	//���� ��������������� ������ � ���� ��� ��� �������������, ������, � ��� � ������.
};
//
//	���������� �����: ���������� "��� ��?"
//
instance DIA_Jorn_WhatAUDoingHere(C_Info)	//	"��� �� ����� �������?"  //nr = 3
{
	npc = PIR_210_DS2P_Jorn;
	nr = 3;
	permanent = FALSE;
	condition = DIA_Jorn_WhatAUDoingHere_condition;	
	information = DIA_Jorn_WhatAUDoingHere_info;
	description = "��� �� ����� �������?";
};
func int DIA_Jorn_WhatAUDoingHere_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_WhatAUDoingHere_info()
{
	AI_Output(other,self,"DIA_Jorn_WhatAUDoingHere_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Jorn_WhatAUDoingHere_13_00");	//� �� �� ������ ��� ��? ������� ��� ������� �����.
	AI_Output(self,other,"DIA_Jorn_WhatAUDoingHere_13_01");	//���� �������, ��� ���� �� ����� ������� �������� ��������� ������ �� �������, � ������� �� ����� ������� ������ �������� ��� ������������.
	AI_Output(self,other,"DIA_Jorn_WhatAUDoingHere_13_02");	//�������� ����, ��� ���� ��� ����� ������� ����, �� ������ �� �������, �� ���� ����� ������ ���������?!
	AI_PlayAni(self,"T_LAUGH_01");
};
//
//	���������� �����: ���������� "��� ��?"
//
instance DIA_Jorn_HowManyPeasantsUHold(C_Info)	//	"������� �������� �� �����������?"  //nr = 4
{
	npc = PIR_210_DS2P_Jorn;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Jorn_HowManyPeasantsUHold_condition;	
	information = DIA_Jorn_HowManyPeasantsUHold_info;
	description = "������� �������� �� �����������?";
};
func int DIA_Jorn_HowManyPeasantsUHold_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_HowManyPeasantsUHold_info()
{
	AI_Output(other,self,"DIA_Jorn_HowManyPeasantsUHold_15_00");	//������� �������� �� �����������?
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_00");	//������� � ��� ���� � ������. �����, ����� �����, ��� ����������.
	AI_Output(other,self,"DIA_Jorn_HowManyPeasantsUHold_15_01");	//� �� �� �������, ��� ��� ����� ������ ���������?
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_01");	//���, �� �����. (�������)
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_02");	//��-������, � ���� �������� ����, � ��-������, � ����������� ������� �� ����.
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_03");	//�������-�� ���� ���� � ������ ��� ������. �����, ��� � �� �������!
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_04");	//�� � ��� ������������ ������ ����� ���, ��� ������.
	AI_PlayAni(self,"T_LAUGH_01");
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_05");	//���� ���� � ���� �� ���������, �� ������ ���!
};
//
//	���������� �����: ���������� "��� ��?"
//
instance DIA_Jorn_WhyDoULookSoIntently(C_Info)	//	"������ �� ��� ���������� ��������?"  //nr = 5
{
	npc = PIR_210_DS2P_Jorn;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Jorn_WhyDoULookSoIntently_condition;	
	information = DIA_Jorn_WhyDoULookSoIntently_info;
	description = "������ �� ��� ���������� ��������?";
};
func int DIA_Jorn_WhyDoULookSoIntently_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_WhyDoULookSoIntently_info()
{
	AI_Output(other,self,"DIA_Jorn_WhyDoULookSoIntently_15_00");	//������ �� ��� ���������� ��������?
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_00");	//������, ����� � ���� ���� ���� ������?
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_01");	//����� ���, ���������, ������� ������ ���� ����� � ���, � ��� ���������� ������ ����� ������ ���� ����������� �� �����.
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_02");	//� ��� ��� ������������ �����. � ��� ��� ������ ������! (�������)
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_03");	//�, �������, ���� ���� ������ ���� �� ����� ���� �� ���� � ������� ���, ��� � ���� ����, �� ����� �� ������ �� ���������.
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_04");	//� ��� ����� ����� �������!
};
//
//	���������� �����: ����������� "������ �� ��� ���������� ��������?"
//
instance DIA_Jorn_AboutAlcohol(C_Info)	//	"�� ������ �������..."  //nr = 50
{
	npc = PIR_210_DS2P_Jorn;
	nr = 50;
	permanent = TRUE;
	condition = DIA_Jorn_AboutAlcohol_condition;	
	information = DIA_Jorn_AboutAlcohol_info;
	description = "�� ������ �������...";
};
func int DIA_Jorn_AboutAlcohol_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhyDoULookSoIntently)){return TRUE;};};
func void DIA_Jorn_AboutAlcohol_info()
{
	//������� B_Build_TrdString ���������� ������ "%text% �����: xxx ����"
	Info_ClearChoices(DIA_Jorn_AboutAlcohol);
	Info_AddChoice(DIA_Jorn_AboutAlcohol, "���� ������...", DIA_Jorn_AboutAlcohol_Back);
	If(Npc_HasItems(other,ItFo_Addon_Grog))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("� ���� ���� ����.",ItFo_Addon_Grog), DIA_Jorn_AboutAlcohol_Grog);
	};
	If(Npc_HasItems(other,ItFo_Addon_Rum))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("� ���� ���� ���.",ItFo_Addon_Rum), DIA_Jorn_AboutAlcohol_Rum);
	};
	If(Npc_HasItems(other,ItFo_Wine))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("� ���� ���� ����.",ItFo_Wine), DIA_Jorn_AboutAlcohol_Wine);
	};
	If(Npc_HasItems(other,ITFO_SAMOGON))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("� ���� ���� �������.",ITFO_SAMOGON), DIA_Jorn_AboutAlcohol_Samogon);
	};
	If(Npc_HasItems(other,ItFo_Booze))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("� ���� ���� �����.",ItFo_Booze), DIA_Jorn_AboutAlcohol_Booze);
	};	
};
func void DIA_Jorn_AboutAlcohol_Back()
{
	Info_ClearChoices(DIA_Jorn_AboutAlcohol);
};
func void B_DSG_TransferAlcohol_Jorn(var int itemInstance,var int count)
{
	if(count == -1){count = Npc_HasItems(other,itemInstance);};
	B_GivePlayerXP(XP_Ambient);
	Npc_GetInvItem(other,itemInstance);
	B_DS_GiveRemoveItems_Red(other,self, itemInstance, count, 34);
	B_GiveInvItem_red(self,other, ItMi_Gold, count * item.value * 2, 37);
	DIA_Jorn_AboutAlcohol_info();
};
func void DIA_Jorn_AboutAlcohol_Grog()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Grog_15_00");	//� ���� ���� ����.
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Grog_13_00");	//��� ��, ��� ��� ������ �����.
	B_DSG_TransferAlcohol_Jorn(ItFo_Addon_Grog,1);
};
func void DIA_Jorn_AboutAlcohol_Rum()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Rum_15_00");	//��� ������ ������� ����?
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Rum_13_00");	//��� �����������! ����� ����.
	B_DSG_TransferAlcohol_Jorn(ItFo_Addon_Rum,1);
};
func void DIA_Jorn_AboutAlcohol_Wine()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Wine_15_00");	//� ���� ���� ����.
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Wine_13_00");	//������� �������. �������, ������� ���.
	B_DSG_TransferAlcohol_Jorn(ItFo_Wine,-1);
};
func void DIA_Jorn_AboutAlcohol_Samogon()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Samogon_15_00");	//� ���� ���� �������.
	Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Samogon_13_00");	//(����������) ����� ��� �����! � ���� �� ��� ����� ����� �����. ��, �� �����.
	B_DSG_TransferAlcohol_Jorn(ITFO_SAMOGON,1);
};
func void DIA_Jorn_AboutAlcohol_Booze()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Booze_15_00");	//� ���� ���� �����.
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Booze_13_00");	//�, ��� �� � �� ���� ����������!
	B_DSG_TransferAlcohol_Jorn(ItFo_Booze,1);
};
//
//	���������� �����: ���������� "��� ��?"
//
instance DIA_Jorn_MayIGoToPrisoners(C_Info)	//	"� ���� ������ � �������?"  //nr = 6
{
	npc = PIR_210_DS2P_Jorn;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Jorn_MayIGoToPrisoners_condition;	
	information = DIA_Jorn_MayIGoToPrisoners_info;
	description = "� ���� ������ � �������?";
};
func int DIA_Jorn_MayIGoToPrisoners_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_MayIGoToPrisoners_info()
{
	AI_Output(other,self,"DIA_Jorn_MayIGoToPrisoners_15_00");	//� ���� ������ � �������?
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_00");	//��� ��� �����? ��� ������� �������� � ������ ������ �� ����.
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_01");	//� ���� �� �������, ��� ������� ����� ����������� �� ��� � ��������, �� �� ����������.
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_02");	//� ��� ����� ���� ������, �� ������ ���. �� ���� ���� � ���� ��������� �� ���� ����������, ���� ��� �� �������.
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_03");	//����� � ���� ��� ����� ���.
	
	AI_Output(other,self,"DIA_Jorn_MayIGoToPrisoners_15_01");	//� ��� �� �� ��� �������� ������?
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_04");	//������ ���, ������. �� ������ ������ � ��������� �����.
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_05");	//�� ��-�� ������ �� ������, � � ���� �� �����. (�������) ����� ����!
};
//
//	���������� �����: ����������� "� ���� ������ � �������?"
//
instance DIA_Jorn_AUOK(C_Info)	//	"��� ������? (����������)"  //nr = 6
{
	npc = PIR_210_DS2P_Jorn;
	nr = 60;
	permanent = true;
	condition = DIA_Jorn_AUOK_condition;	
	information = DIA_Jorn_AUOK_info;
	description = "��� ������?";
};
func int DIA_Jorn_AUOK_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_MayIGoToPrisoners)){return TRUE;};};
func void DIA_Jorn_AUOK_info()
{
	AI_Output(other,self,"DIA_Jorn_AUOK_15_00");	//��� ������?
	AI_Output(self,other,"DIA_Jorn_AUOK_13_00");	//����� ��� ������? � �� �����!
	AI_Output(self,other,"DIA_Jorn_AUOK_13_01");	//�� ���� �� ��� �� ������� ������� ���������!
};
//
//	���������� �����: ���������� "��� ��?" � ���� ���� ����� "�������� ������"
//
instance DIA_Jorn_NikkiWantsMeToKillU(C_Info)	//	"����� ��������� ����� ����."  //nr = 7
{
	npc = PIR_210_DS2P_Jorn;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Jorn_NikkiWantsMeToKillU_condition;	
	information = DIA_Jorn_NikkiWantsMeToKillU_info;
	description = "����� ��������� ����� ����.";
};
func int DIA_Jorn_NikkiWantsMeToKillU_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU) && (MIS_DS2P_BrokenHeart == LOG_Running)){return TRUE;};};
func void DIA_Jorn_NikkiWantsMeToKillU_info()
{
	AI_Output(other,self,"DIA_Jorn_NikkiWantsMeToKillU_15_00");	//����� ��������� ����� ����.
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_00");	//�� ��� ������? ����� ��� �����?
	
	AI_Output(other,self,"DIA_Jorn_NikkiWantsMeToKillU_15_01");	//����������, ������� �� ����������.
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_01");	//���� ���, ����� ��� ����� ����?
	AI_PlayAni(self,"R_SCRATCHHEAD");
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_02");	//(���������) �, ������! ��, ��������, �������� �� ���� ����������� ����, ������� ������ ��� ���?
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_03");	//�����, �����! (�������)
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_04");	//� ��� ���� �������, ��� � �� ����������? ��! �� ��� ���� ����... ��...
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_05");	//��, � �����, ���� ���� ��� �������� �����, ������� ������ �����!
	
	AI_Output(other,self,"DIA_Jorn_NikkiWantsMeToKillU_15_02");	//�� ������ �������, ��� ����� ���������� ���� �����������?
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_06");	//��, ���� ����� ���� � ��������� � ������ � ������-�� ������� � ������������������! (������ �������)
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_07");	//� ����� ����� ������� ���������, �� ��� ��� �������.
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_08");	//��� ����������� �� ���� ��� ������� ����, ����������, �������, �������� ��� ������.
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_09");	//������ ���� � ��� ������ � ������� �������. � ����� ����������� ���� ��� �� ��������!
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_10");	//� ����� �� ���� ����� �� ����������, � �� ��� ���� ���������, ��� �� �� � ���, � ��� � �����, � ���� ���� ������ ��� ����� ��� � ������...
	
	AI_Output(other,self,"DIA_Jorn_NikkiWantsMeToKillU_15_03");	//����� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_Running,TOPIC_DS2P_BrokenHeart_JornVersion);
};
//
//	���������� �����: ���������� "��� ��?"
//
instance DIA_Jorn_WhatHappenedToUrFace(C_Info)	//	"��� � ���� � �����?"  //nr = 8
{
	npc = PIR_210_DS2P_Jorn;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Jorn_WhatHappenedToUrFace_condition;	
	information = DIA_Jorn_WhatHappenedToUrFace_info;
	description = "��� � ���� � �����?";
};
func int DIA_Jorn_WhatHappenedToUrFace_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_WhatHappenedToUrFace_info()
{
	AI_Output(other,self,"DIA_Jorn_WhatHappenedToUrFace_15_00");	//��� � ���� � �����?
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_00");	//(����������) ������� �������!
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_01");	//����� ������� ��� ������ ������ �� ��� ��� ��� ����� �������, ����� ������ ������� � �����.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_02");	//������� � �� ������� �� �����, ��� ��� � ���������������.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_03");	//�� �� ����, ��� �� ��� �� ��������, �� ��� ��������� ��� �������, ��������� ���-�� ������� �� ����� �����.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_04");	//� �����, �� � ���� �� �������.
	
	AI_Output(other,self,"DIA_Jorn_WhatHappenedToUrFace_15_01");	//������� �� ����?
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_05");	//������ ������� �����. ������� ����� ��� ������� ��������, ��������� ������ � ���.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_06");	//���� �� �� ������ �����, � �� ������ �� ����, �� � �� ���� �������� ����, � ���� �� ����� �������� ����, � ���� ����� �� ���������, ���� �������� ���������.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_07");	//������, � ����� �� ������� ��? � �� ���� ��, ����� ��� ����� ������� ����� � �������.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_08");	//��� ���-�� �� ����� �������� �����, ��� ���-�� ������ ���������� ��� ������.
	Info_ClearChoices(DIA_Jorn_WhatHappenedToUrFace);
	Info_AddChoice(DIA_Jorn_WhatHappenedToUrFace, "� ����������� � ���������.", DIA_Jorn_WhatHappenedToUrFace_Help);
	Info_AddChoice(DIA_Jorn_WhatHappenedToUrFace, "���������� ��� �� ������ ����������.", DIA_Jorn_WhatHappenedToUrFace_Deny);
};
func void DIA_Jorn_WhatHappenedToUrFace_Deny()
{
	AI_Output(other,self,"DIA_Jorn_WhatHappenedToUrFace_Deny_15_00");	//���������� ��� �� ������ ����������.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_Deny_13_00");	//����... �����, ���� � �����. �������, ��� � �����!
	Info_ClearChoices(DIA_Jorn_WhatHappenedToUrFace);
};
func void DIA_Jorn_WhatHappenedToUrFace_Help()
{
	AI_Output(other,self,"DIA_Jorn_WhatHappenedToUrFace_Help_15_00");	//� ����������� � ���������.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_Help_13_00");	//�������! ����� ��������� ��� ������ /*Redleha: ��� ����...*/
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_Help_13_01");	//������� ���� ������, � � �������� �������������� ������� ��� ��� ��� �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CunningGoblins, LOG_MISSION, LOG_Running, TOPIC_DS2P_CunningGoblins_Start);
};

//NS - 14/06/2013 =============================================
// ����� ������ "������ �������"
//=============================================================
instance DIA_Jorn_GobboKilled(C_Info)	//	"� ���� ��������"  //nr = 8
{
	npc = PIR_210_DS2P_Jorn;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Jorn_GobboKilled_condition;	
	information = DIA_Jorn_GobboKilled_info;
	description = "� ���� ��������.";
};
func int DIA_Jorn_GobboKilled_condition()
{
	if(Npc_HasItems(self, ITMI_DS2P_GoblinEar) >= 3)
	{	return TRUE;};
};

func void DIA_Jorn_GobboKilled_info()
{
	var int x;
	AI_Output(other,self,"DIA_Jorn_GobboKilled_15_00");	//� ���� ��������.
	B_GivePlayerXP(XP_MIS_CunningGoblins_Killed);
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_01");	//�� ������ � �������� �������������� �� ���?
	AI_Output(other,self,"DIA_Jorn_GobboKilled_15_02");	//��, ��� ���.
	//������ ��� ��� �������.
	x = 1;	if (x == 1)	{
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_GoblinEar,3,35);
	};
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_03");	//�������. ������ � ���� ���� �������, ��� ����� ��������� ����� ������.
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_04");	//��� ���� � ������� � ������� ������ � �������� ����, ������� � ����� � ������.
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_05");	//���� �� ������������ � ��������� ����, ��� ���� ���������� � ������������ �������, ���� ��� � ������  ������� �� �������.
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_06");	//� ������, � ���� ���-�� ������ ��� ���������.
	//���� 500 ������� � 5 ������ �������� ����.
	x = 2;	if (x == 2)	{
		B_GiveInvItem_red(self,other,ITMI_Gold,500,40);
		B_GiveInvItem_red(self,other,ItMi_IronOre,5,45);
	};
	//������ � �������� "������ �������", ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_CunningGoblins, LOG_MISSION, LOG_SUCCESS, TOPIC_DS2P_CunningGoblins_Success);
};

//NS - 14/06/2013 ==================================================
// �������� ��� ��������� 
//==================================================================
instance DIA_Jorn_AboutStatue(C_Info)	//	"� ������, ��� �� ����������� ��������� ��������."  //nr = 9
{
	npc = PIR_210_DS2P_Jorn;
	nr = 9;
	condition = DIA_Jorn_AboutStatue_condition;	
	information = DIA_Jorn_AboutStatue_info;
	description = "� ������, ��� �� ����������� ��������� ��������.";
};
func int DIA_Jorn_AboutStatue_condition()
{
	if (MIS_DS2P_FigurinesGurun == LOG_Running)
	{	return TRUE;};
};
func void DIA_Jorn_AboutStatue_info()
{
	var C_NPC Jorn; Jorn = Hlp_GetNpc(PIR_210_DS2P_Jorn);
	var C_NPC Hobo; Hobo = Hlp_GetNpc(PIR_215_DS2P_Hobo);
	
	if (!Npc_IsDead(Hobo))
	{
		TRIA_Invite(Hobo);
		TRIA_Start();
		
		// self = Jorn, other = Hero
		TRIA_Next(Jorn);
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_00");	//� ������, ��� �� ����������� ��������� ��������.
		B_GivePlayerXP(XP_MIS_FigurinesGurun_AscJorn);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_01");	//���! ��� ���� ������?
			AI_TurnToNpc(self, Hobo);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_02");	//����, ��� �� ��� �� ���������, �?!
		
		// self = Hobo, other = Hero
		TRIA_Next(Hobo);
			AI_TurnToNpc(Hobo, Jorn);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_03");	//���?

		// self = Jorn, other = Hero
		TRIA_Next(Jorn);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_04");	//�����! 
			AI_TurnToNpc(self, hero);
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_05");	//���� ��� �� ��� ���, ���� ������ �� ���� ������.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_06");	//(������) �� ���� �� ������� �������? ���� ���� ����?
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_07");	//���������, ������� ��.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_08");	//� ������ �� �������, ��� � �� ���� �����? ��� ��� ������!
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_09");	//��� ��������, ��� � ��� ������, �� �������� ��� ������ ������� �������.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_10");	//(������) ���-�� �� �����... �����. ����� ���. ������ ��� � �� ���� �� �����.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_11");	//��� ����� �������, ��� ��� ������� �������� ����, ��� ���. ������� ����� ��� ������ �������, � ��������� ����.
		DIAG_Reset();
		TRIA_Finish();
	}
	// ���� ���� �����, ������� �������
	else
	{
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_00");	//� ������, ��� �� ����������� ��������� ��������.
		B_GivePlayerXP(XP_MIS_FigurinesGurun_AscJorn);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_01");	//���! ��� ���� ������?
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_05�");	//���� ������ �� ���� ������.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_06");	//(������) �� ���� �� ������� �������? ���� ���� ����?
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_07");	//���������, ������� ��.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_08");	//� ������ �� �������, ��� � �� ���� �����? ��� ��� ������!
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_09");	//��� ��������, ��� � ��� ������, �� �������� ��� ������ ������� �������.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_10");	//(������) ���-�� �� �����... �����. ����� ���. ������ ��� � �� ���� �� �����.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_11");	//��� ����� �������, ��� ��� ������� �������� ����, ��� ���. ������� ����� ��� ������ �������, � ��������� ����.
		
	};
};

//NS - 14/06/2013 ==============================================
// ������� ���������, 
//����� ���� ���� �� ����������, �� ������ ���� ��� ������ �����
//==============================================================
var int THIEF_Jorn_EmeraldStatue;
instance DIA_Jorn_PICKPOCKET(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 900;
	condition = DIA_Jorn_PICKPOCKET_Condition;
	information = DIA_Jorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(������� ��� ��������� ����� �����)";
};
func int DIA_Jorn_PICKPOCKET_Condition()
{
	if((MIS_DS2P_FigurinesGurun == LOG_Running) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) > 0) 
		&& (THIEF_Jorn_EmeraldStatue == FALSE) && (Npc_HasItems(self,ITMI_DS2P_GobStatue_Emerald) > 0))
	{	return TRUE;	};
};
func void DIA_Jorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jorn_PICKPOCKET);
	Info_AddChoice(DIA_Jorn_PICKPOCKET,Dialog_Back,DIA_Jorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jorn_PICKPOCKET_DoIt);
};
func void DIA_Jorn_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= C_DS_GetTheftChanceMultiplier(other,40))
	{
		B_GiveInvItems(self,other,ITMI_DS2P_GobStatue_Emerald,1);
		THIEF_Jorn_EmeraldStatue = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Jorn_PICKPOCKET);
		//������ � �������� "��������� ������" 
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_EmeraldGot);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};
func void DIA_Jorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jorn_PICKPOCKET);
};

//NS - 14/06/2013 =================================================
// ������ ���������, ���� ��� ��� � ����
//=================================================================
instance DIA_Jorn_BuyStatue(C_Info)		// "� ���� ������ � ���� ���������.";	//nr = 1;
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	condition = DIA_Jorn_BuyStatue_Condition;
	information = DIA_Jorn_BuyStatue_Info;
	permanent = TRUE;
	description = "� ���� ������ � ���� ���������.";
};
func int DIA_Jorn_BuyStatue_Condition()
{
	if((MIS_DS2P_FigurinesGurun == LOG_Running) && (Npc_HasItems(self,ITMI_DS2P_GobStatue_Emerald) > 0))
	{	return TRUE;	};
};
func void DIA_Jorn_BuyStatue_Info()
{
	AI_Output(other,self,"DIA_Jorn_BuyStatue_15_00");	//� ���� ������ � ���� ���������.
	if (Npc_HasItems(other, ItMi_Gold) < 200)
	{
		AI_Output(self,other,"DIA_Jorn_BuyStatue_13_01");	//������ ������� � �� ������� ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Jorn_BuyStatue_13_02");	//�������. ��� ���-���� ���������, ��� �� �����������...
		B_DS_GiveRemoveItems_Red(other,self,ItMi_Gold,100,40);
		B_GiveInvItem_red(self,other,ITMI_DS2P_GobStatue_Emerald,1,45);
		//������ � �������� "��������� ������" 
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_EmeraldGot);
	};
};

//NS - 14/06/2013 ==================================================
// �� ������ ���� 
//==================================================================
instance DIA_Jorn_AboutHobo(C_Info)	//	"���� ���� ������ ���������������."  //nr = 9
{
	npc = PIR_210_DS2P_Jorn;
	nr = 9;
	condition = DIA_Jorn_AboutHobo_condition;	
	information = DIA_Jorn_AboutHobo_info;
	description = "���� ���� ������ ���������������.";
};
func int DIA_Jorn_AboutHobo_condition()
{
	if (Npc_KnowsInfo(other, DIA_Hobo_WhoAreU) && !Npc_IsDead(Hobo))
	{	return TRUE;};
};
func void DIA_Jorn_AboutHobo_info()
{	
	AI_Output(other,self,"DIA_Jorn_AboutHobo_15_00");	//���� ���� ������ ���������������.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_01");	//(�������) �� ��� ����? ��, ���� �����. �� ������� ��������, ��� ��� ����� ������ �����.
	AI_Output(other,self,"DIA_Jorn_AboutHobo_15_02");	//��� ���?
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_03");	//��, ���. �� ����� ��������� �� ����� �������� �� ������ �������� ����.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_04");	//������, ���� �������� ��e� ��� �������� ��������, �� ������������ ������� ��� ���. ���� ����� ���� ������, ��� ������ �������.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_05");	//��� ��� ���� ������� ����� �� ���� �� ����� ������ �����.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_06");	//� ��� ������� �������� �� ��� �����, ����� ��������������, ������� ������ ����� ����.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_07");	//���, �������, ��� �� �������, �� ��� �������� ���� �� ���� ������� ��� ����.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_08");	//(�������) �� �����, ��� �� ������ ��� ����� �����������, �� ����� ����� ������ ��������� �����, ������, ��������. 
};

//NS - 01/07/2013 ==================================================
// �� ������ "�������� ��������" 
//==================================================================
//	"� ������ �������� � �������." (+����)		nr = 1
//���� ���� ����� "�������� ��������" � ������� � �����
instance DIA_Jorn_GiveSupplies(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	condition = DIA_Jorn_GiveSupplies_condition;	
	information = DIA_Jorn_GiveSupplies_info;
	description = "";
};
func int DIA_Jorn_GiveSupplies_condition()
{
	if ((MIS_DS2P_ShippingSupplies == LOG_Running) && (Npc_HasItems(other,ItFo_Booze) >= 4))
	{	return TRUE;};
};
func void DIA_Jorn_GiveSupplies_info()
{	
	var int x;
	AI_Output(other,self,"DIA_Jorn_GiveSupplies_15_00");	//� ������ �������� � �������.
	//(+����)
	B_GivePlayerXP(XP_MIS_ShippingSupplies_Booze);
		AI_Output(self,other,"DIA_Jorn_GiveSupplies_13_01");	//�, �����������. ����� ������� ����, � ��� ���� � ������. � ���� �� �������.
	//�������� 4 ������� ������
	x = 1; if (x == 1) {
		B_GiveInvItems(other,self, ItFo_Booze, 4);
	};
		AI_Output(self,other,"DIA_Jorn_GiveSupplies_13_02");	//������, ������ ��� ���� �������?! ��� ���� �������� ��������� �� ������?!
	AI_Output(other,self,"DIA_Jorn_GiveSupplies_15_03");	//� ��...
		AI_Output(self,other,"DIA_Jorn_GiveSupplies_13_04");	//(����������) �����, ����. � �� ������� ������� ���, ��� �� ������ ���-������ ����� ���!
	if (!Npc_IsDead(Hobo))	{
		AI_Output(self,other,"DIA_Jorn_GiveSupplies_13_05");	//������ �������� �������, ������ ����?! (�������)
	};
	//������ � �������� "�������� ��������" //NS - ����������
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_BoozeDelivered);
};

// ������������, ���� � ��������� ���� ������ �������, � ������� ����� "���������� �����"

instance DIA_Jorn_BringCimmSamogon(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_BringCimmSamogon_condition;	
	information = DIA_Jorn_BringCimmSamogon_info;
	description = "";
};

func int DIA_Jorn_BringCimmSamogon_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Running) && (Npc_HasItems(other,ItMi_DS2P_SamogonForJorn) >= 1) && !Npc_KnowsInfo(other,DIA_Jorn_AlternativeSamogon))
	{	
		return TRUE;
	};
};

func void DIA_Jorn_BringCimmSamogon_info()
{
	AI_Output(other,self,"DIA_Jorn_BringCimmSamogon_15_00");	//�� ����� ��� ����� ��� ������?
	AI_Output(self,other,"DIA_Jorn_BringCimmSamogon_13_01");	//��� ��� �����! ������ �����������.
	// ������� � ��������� �� ������� � �������� ���
	CreateInvItems(other,ItFo_Samogon,1);
	B_UseItem(other,ItFo_Samogon);
	AI_Output(other,self,"DIA_Jorn_BringCimmSamogon_15_02");	//��� ������ �����, ��� �������� ���� � ����� ������.
	AI_Output(self,other,"DIA_Jorn_BringCimmSamogon_13_03");	//(�����������) ������, � ���� ������ ������ �� ��������?
	AI_Output(other,self,"DIA_Jorn_BringCimmSamogon_15_04");	//������, ����� ���-�� ����. ��� ��� ����, � ��� ��� ��������� � ��������� ��� ����.
	// ������ ������� ����� �����
	B_GiveInvItems(other,self,ItMi_DS2P_SamogonForJorn,1);
	// ������� ������� ����� �� ��������� �����
	Npc_RemoveInvItems(self,ItMi_DS2P_SamogonForJorn,1);
	// ������� � ��������� �� ������� � �������� ���
	CreateInvItems(other,ItFo_Samogon,1);
	B_UseItem(other,ItFo_Samogon);
	// ������� � ��������� ����� ������� � �������� ���
	CreateInvItems(self,ItFo_Samogon,1);
	B_UseItem(self,ItFo_Samogon);
	AI_Output(self,other,"DIA_Jorn_BringCimmSamogon_13_05");	//�����������! (���� ����������) � ���� ������ �������.
	AI_Output(other,self,"DIA_Jorn_BringCimmSamogon_15_06");	//������, ���-������ ��������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_DrinkSamogon);
	Jorn_LastTalkDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};

// ���� ���������� � ��� ������ �����, ����� ����, ��� ����� ������� �� ������������
	
instance DIA_Jorn_AfterSamogonTalk(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Jorn_AfterSamogonTalk_condition;	
	information = DIA_Jorn_AfterSamogonTalk_info;
	description = "";
};

func int DIA_Jorn_AfterSamogonTalk_condition()
{
	if (Npc_KnowsInfo(other,DIA_Jorn_BringCimmSamogon) && (Jorn_LastTalkDay - Wld_GetDay()) >= 1)
	{	
		return TRUE;
	};
};

func void DIA_Jorn_AfterSamogonTalk_info()
{
	AI_Output(self,other,"DIA_Jorn_AfterSamogonTalk_13_00");	//��� �� ��� ����� ��� ������?
	AI_Output(other,self,"DIA_Jorn_AfterSamogonTalk_15_01");	//���-�� �� ���?
	AI_Output(self,other,"DIA_Jorn_AfterSamogonTalk_13_02");	//���� ���� ������� ������! ��! �� ���! � �� ���������� ��� �� ������ �� �������.
	AI_Output(other,self,"DIA_Jorn_AfterSamogonTalk_15_03");	//�����, �� ������ ��������� ���-��? ����� ������ ������. �� ���� �� ��� � �������, � ���� �� ������.
	AI_Output(self,other,"DIA_Jorn_AfterSamogonTalk_13_04");	//��, �������, ����� ���������
	// "���� ������� � ������� ��������� ������."
	// ��� ���� ���������� ���, ��� ������ �� ������� �� ������, � �������� �������?
	AI_StopProcessInfos(self);
};
	
// ������������, ����� �� ������, ��� ��� ����� ���������� �����
// nr = 1
	
instance DIA_Jorn_AlternativeSamogon(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_AlternativeSamogon_condition;	
	information = DIA_Jorn_AlternativeSamogon_info;
	description = "� ���� ���� ��� ���� �������.";
};

func int DIA_Jorn_AlternativeSamogon_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Running) && !Npc_KnowsInfo(other,DIA_Jorn_BringCimmSamogon))
	{	
		return TRUE;
	};
};

func void DIA_Jorn_AlternativeSamogon_info()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_00");	//� ���� ���� ��� ���� �������.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_01");	//������.
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_02");	//500 �����.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_03");	//���?! �� �� ����� ������
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_04");	//������, ������� ����� ���� �����.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_05");	//��, �����. �� ���� ��� ��� �������� ���������, �� �� ���� ���������.
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_06");	//�������.
	// ������� � ��������� ����� 500 ����� � ������ ��
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_07");	//������ ������.
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_08");	//��� ����� ���� ����������. �� �������� ����, ����� � ���� � �������� �������� ������������, ������ ��� � ��������� � ��� ������ ����. �� �� ����� �������� �������� ������� �, ����� �� ���� ������, ��� ���� ��� �� �����, ����� ������� � ������� ������������ ��������. ���� �� ��������, ����� ����������� ��� �� ����� ��� ����?
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_09");	//��� �� ������� ���! ������ ����� � �����! � ��� ������ ����, ����. � ���� ���� ����.
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_10");	//�����?
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_11");	//�� ��������� ������� ���, �� ������ ������ ������� ���� �� ���, � ���. ���������� �������� ��� ���������� �����. �� ���?
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_12");	//� ��� ���-�� �� ��� �����? ������ �� ����?
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_13");	//�����, � ��� ���� �� ����� ���� ������. ����?
	Info_ClearChoices(DIA_Jorn_AlternativeSamogon);
	Info_AddChoice(DIA_Jorn_AlternativeSamogon,"���, ���������� ���.",DIA_Jorn_AlternativeSamogon_Deciline);
	Info_AddChoice(DIA_Jorn_AlternativeSamogon,"�� �����.",DIA_Jorn_AlternativeSamogon_Accept);
};

// �����������, ���� ������� ������� "���, ���������� ���." � ������� ����� "� ���� ���� ��� ���� �������."

func void DIA_Jorn_AlternativeSamogon_Deciline()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_Deciline_15_00");	//���, ���������� ���.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_Deciline_13_01");	//����! ������� ����������! ������ ������!
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Failed,"");
	AI_StopProcessInfos(self);
};

// �����������, ���� ������� ������� "�� �����." � ������� ����� "� ���� ���� ��� ���� �������."

func void DIA_Jorn_AlternativeSamogon_Accept()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_Accept_15_00");	//�� �����.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_Accept_13_01");	//����� ��� � �� ������������.
	AI_StopProcessInfos(self);
};
	
// ������������, ����� �� ������ ��� ������� �� ������������
// nr = 1
	
instance DIA_Jorn_AlternativeSamogonForAdo(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_AlternativeSamogonForAdo_condition;	
	information = DIA_Jorn_AlternativeSamogonForAdo_info;
	description = "� �������� ���� ���������.";
};

func int DIA_Jorn_AlternativeSamogonForAdo_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Running) && Npc_KnowsInfo(other,DIA_Ado_AlternativeSamogon))
	{	
		return TRUE;
	};
};

func void DIA_Jorn_AlternativeSamogonForAdo_info()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_15_00");	//� �������� ���� ���������. ��� ����� ����� ����������� ������������� ���� � ������.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_13_01");	//��-��! �� ��� ������ ������������ ��� ��������� ������, ��� � ���� ������. � �� ��� ����� ���������, ����� ���� ������, ������ ������ ������. ��-��!
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_15_02");	//�� ������� �� ������ �� �����.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_13_03");	//��. � ���� ���� ��������� �����. ������ �������, �� ��� �� �� ����. ���� ��� ������� �������� ���, ����� �� � �������� ������� ������ �����. ���� ���� ���� ��� ��� ������ ����, ���� �� ������ ���� ����� �� ���� ������ �����. ��� �� ��������?
	Info_ClearChoices(DIA_Jorn_AlternativeSamogonForAdo);
	Info_AddChoice(DIA_Jorn_AlternativeSamogonForAdo,"��� ��� ���.",DIA_Jorn_AlternativeSamogonForAdo_RewardShield);
	Info_AddChoice(DIA_Jorn_AlternativeSamogonForAdo,"��� ��� ��� ��� ������ ����.",DIA_Jorn_AlternativeSamogonForAdo_Reward2x2);
	Info_AddChoice(DIA_Jorn_AlternativeSamogonForAdo,"��� ��� �����.",DIA_Jorn_AlternativeSamogonForAdo_RewardSabre);
};

// �����������, ���� �� ������ ������� "��� ��� �����." � ������� ����� "� �������� ���� ���������."

func void DIA_Jorn_AlternativeSamogonForAdo_RewardSabre()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_RewardSabre_15_00");	//��� ��� �����. ������ ������ ������� � ���������� ������.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_RewardSabre_13_01");	//���, �����. �� ������ �� ���� ������ �������, ���� �� ����� ������ �������.
	//������� ����� � ��������� ��� � ������ �� (UNFINISHED: ���� ������� �������, � �������� ���)
	CreateInvItems(self,0/*SABRE_INSTANCE*/,1);
	B_GiveInvItems(self,other,0/*SABRE_INSTANCE*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_AlternativeSuccess);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};
	
// �����������, ���� �� ������ ������� "��� ��� ��� ��� ������ ����." � ������� ����� "� �������� ���� ���������."

func void DIA_Jorn_AlternativeSamogonForAdo_Reward2x2()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_Reward2x2_15_00");	//��� ��� ��� ��� ������ ����. ����� ������� ������ �������.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_Reward2x2_13_01");	//���, ������. ��� ������� ���, �� �� ��� ������ ���� �����.
	//������� ��� � ��������� ��� � ������ �� (UNFINISHED: ���� ������� �������, � �������� ���)
	CreateInvItems(self,0/*"2x2_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"2x2_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_AlternativeSuccess);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};
	
// �����������, ���� �� ������ ������� "��� ��� ���." � ������� ����� "� �������� ���� ���������."

func void DIA_Jorn_AlternativeSamogonForAdo_RewardShield()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_RewardShield_15_00");	//��� ��� ���. ������ � ��� ���� ���.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_RewardShield_13_01");	//��� ��. �� ��� �������� � �������� ����� �� ����� ����������� ���� �����. ��� �� ���������, � ���������� ������� ��� � ������� �� �� ������, ������� ������� ������ � ���� ��������� ���� �����.
	//������� ��� � ��������� ��� � ������ �� (UNFINISHED: ���� ������� �������, � �������� ���)
	CreateInvItems(self,0/*"SHIELD_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"SHIELD_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_AlternativeSuccess);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};

// ������������, ����� ������ �����, ����� ����, ��� �� ������ ��� ������������
// nr = 1
	
instance DIA_Jorn_AfterSamogonAdo(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_AfterSamogonAdo_condition;	
	information = DIA_Jorn_AfterSamogonAdo_info;
	description = "��� ��� ������?";
};

func int DIA_Jorn_AfterSamogonAdo_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Success) && (Jorn_LastTalkDay - Wld_GetDay()) >= 1)
	{	
		return TRUE;
	};
};

func void DIA_Jorn_AfterSamogonAdo_info()
{
	AI_Output(other,self,"DIA_Jorn_AfterSamogonAdo_15_00");	//��� ��� ������?
	AI_Output(self,other,"DIA_Jorn_AfterSamogonAdo_13_01");	//� ��� ��� �����-�������� ������� ����������. (�������)
	AI_Output(other,self,"DIA_Jorn_AfterSamogonAdo_15_02");	//��� ��� �������.
	AI_Output(self,other,"DIA_Jorn_AfterSamogonAdo_13_03");	//��, � ��� ������ ����� �� �������� �����, ��� �� ������ ������.
	AI_StopProcessInfos(self);
};
	
	