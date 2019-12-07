instance DIA_ArTush_EXIT(C_Info)
{
	npc = Orc_DS2P_ArTush;
	nr = 999;
	permanent = TRUE;
	condition = DIA_ArTush_EXIT_condition;	
	information = DIA_ArTush_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_ArTush_EXIT_condition(){	return TRUE;};
func void DIA_ArTush_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 08/03/2016 ===========
// ����� ������� 
//===========================
instance DIA_ArTush_HowAU(C_Info)
{
	npc = Orc_DS2P_ArTush;						nr = 1;
	condition = DIA_ArTush_HowAU_condition;	
	information = DIA_ArTush_HowAU_info;
	description = "��� ����?";
	permanent = TRUE;
};
func int DIA_ArTush_HowAU_condition(){	return TRUE;};
func void DIA_ArTush_HowAU_info()
{	
	AI_Output(other,self,"DIA_ArTush_HowAU_15_01");	//��� ����?
		AI_Output(self,other,"DIA_ArTush_HowAU_18_02");	//����, ���� ������ �����.
};
//---------------------------------
instance DIA_ArTush_AUArTush(C_Info)
{
	npc = Orc_DS2P_ArTush;						nr = 2;
	condition = DIA_ArTush_AUArTush_condition;	
	information = DIA_ArTush_AUArTush_info;
	description = "���� ���� ����� ��-���?";
	permanent = TRUE;
};
func int DIA_ArTush_AUArTush_condition(){	return TRUE;};
func void DIA_ArTush_AUArTush_info()
{	
	AI_Output(other,self,"DIA_ArTush_AUArTush_15_01");	//���� ���� ����� ��-���?
		AI_Output(self,other,"DIA_ArTush_AUArTush_18_02");	//����, ���� ��-���.
};
//---------------------------------
instance DIA_ArTush_AUOk(C_Info)
{
	npc = Orc_DS2P_ArTush;						nr = 3;
	condition = DIA_ArTush_AUOk_condition;	
	information = DIA_ArTush_AUOk_info;
	description = "��� ������������?";
	permanent = TRUE;
};
func int DIA_ArTush_AUOk_condition(){	return TRUE;};
func void DIA_ArTush_AUOk_info()
{	
	AI_Output(other,self,"DIA_ArTush_AUOk_15_01");	//��� ������������?
		AI_Output(self,other,"DIA_ArTush_AUOk_18_02");	//����, ���� ������ �����.
};

