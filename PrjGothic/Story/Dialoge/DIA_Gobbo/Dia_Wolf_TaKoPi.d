instance DIA_TaKoPi_EXIT(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;
	nr = 999;
	permanent = TRUE;
	condition = DIA_TaKoPi_EXIT_condition;	
	information = DIA_TaKoPi_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_TaKoPi_EXIT_condition(){	return TRUE;};
func void DIA_TaKoPi_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// ����� �� ������ 
//===========================
instance DIA_TaKoPi_Hello(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;						nr = 1;
	condition = DIA_TaKoPi_Hello_condition;	
	information = DIA_TaKoPi_Hello_info;
	important = TRUE;
};
func int DIA_TaKoPi_Hello_condition(){	return TRUE;};
func void DIA_TaKoPi_Hello_info()
{	
		AI_Output(self,other,"DIA_TaKoPi_Hello__01");	//(���������� �������)
		AI_PlayAni(self,"T_WARN");
	AI_Output(other,self,"DIA_TaKoPi_Hello_15_02");	//��, ���������, � �� ���� ����.
		AI_Output(self,other,"DIA_TaKoPi_Hello__03");	//(���������) ����.
		AI_PlayAni(self,"R_GROWL");
	//UNFINISHED ���� �� ����� �����
	AI_Output(other,self,"DIA_TaKoPi_Hello_15_04");	//� ����, �����.
	Info_ClearChoices(DIA_TaKoPi_Hello);
	Info_AddChoice(DIA_TaKoPi_Hello, "��-��... �� �����.", DIA_TaKoPi_Hello_Wrong3);
	Info_AddChoice(DIA_TaKoPi_Hello, "��-��-��-��. ��-��-��-��-��.", DIA_TaKoPi_Hello_Wrong2);
	Info_AddChoice(DIA_TaKoPi_Hello, "��-��-��-��. ��-��-��-��-��.", DIA_TaKoPi_Hello_Right);
	Info_AddChoice(DIA_TaKoPi_Hello, "��-��-��-��. ��-��-��-��-��.", DIA_TaKoPi_Hello_Wrong1);
};
func void DIA_TaKoPi_Hello_Right()
{	
	AI_Output(other,self,"DIA_TaKoPi_Hello_Right_15_01");	//��-��-��-��. ��-��-��-��-��.
		AI_Output(self,other,"DIA_TaKoPi_Hello_Right__02");	//(�������������) ���?
		AI_PlayAni(self,"T_PERCEPTION");
	AI_Output(other,self,"DIA_TaKoPi_Hello_Right_15_03");	//��-��, ������, � �������.
		AI_Output(self,other,"DIA_TaKoPi_Hello_Right__04");	//���.
		AI_PlayAni(self,"R_GROWL");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	TaKoPi_Follows = TRUE;
	B_StartOtherRoutine(self,"FOLLOW");
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend, LOG_MISSION, LOG_Running, TOPIC_DS2P_MissingFriend_Found);
};
func void DIA_TaKoPi_Hello_WrongAll()
{	
	//�� ���� ��������� �������, ���� �������� � �������.
		AI_Output(self,other,"DIA_TaKoPi_Hello_Wrong__01");	//(�������) �����.
		AI_PlayAni(self,"T_WARN");
	AI_StopProcessInfos(self);
	Npc_SetTrueGuild(self, GIL_WOLF);
	B_Attack(self,other,AR_NONE,1);
};
func void DIA_TaKoPi_Hello_Wrong1()
{	
	AI_Output(other,self,"DIA_TaKoPi_Hello_Wrong1_15_01");	//��-��-��-��. ��-��-��-��-��.
	DIA_TaKoPi_Hello_WrongAll();
};
func void DIA_TaKoPi_Hello_Wrong2()
{	
	AI_Output(other,self,"DIA_TaKoPi_Hello_Wrong2_15_01");	//��-��-��-��. ��-��-��-��-��.
	DIA_TaKoPi_Hello_WrongAll();
};
func void DIA_TaKoPi_Hello_Wrong3()
{	
	AI_Output(other,self,"DIA_TaKoPi_Hello_Wrong3_15_01");	//��-��... �� �����.
	DIA_TaKoPi_Hello_WrongAll();
};

//NS - 18/03/2016 ===========
// ����� 
//===========================
// ��� ----------------------------------
instance DIA_TaKoPi_Follow(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;						nr = 10;
	condition = DIA_TaKoPi_Follow_condition;	
	information = DIA_TaKoPi_Follow_info;
	description = "��� �� ����!";
	permanent = TRUE;
};
func int DIA_TaKoPi_Follow_condition()
{	
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE) && !TaKoPi_Follows)	{
		return TRUE;
	};
};
func void DIA_TaKoPi_Follow_info()
{	
	AI_Output(other,self,"DIA_TaKoPi_Follow_15_01");	//��� �� ����!
		//������ ������, ����� ����������� ������ �� �����
		AI_Output(self,other,"XXX");	//
		AI_StandUp(self);
		AI_PlayAni(self,"R_GROWL");
	AI_StopProcessInfos(self);
	TaKoPi_Follows = TRUE;
	B_StartOtherRoutine(self,"FOLLOW");
	//AI_StartState(self,ZS_Follow_Player,1,"");
};
// ��� ----------------------------------
instance DIA_TaKoPi_Wait(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;						nr = 11;
	condition = DIA_TaKoPi_Wait_condition;	
	information = DIA_TaKoPi_Wait_info;
	description = "��� ���.";
	permanent = TRUE;
};
func int DIA_TaKoPi_Wait_condition()
{	
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE) && TaKoPi_Follows)	{
		return TRUE;
	};
};


func void DIA_TaKoPi_Wait_info()
{	
	AI_Output(other,self,"DIA_TaKoPi_Wait_15_01");	//��� ���.
		//������ ������, ����� ����������� ������ �� �����
		AI_Output(self,other,"XXX");	//
		AI_PlayAni(self,"T_PERCEPTION");
	TaKoPi_Follows = FALSE;
	AI_StopProcessInfos(self);
	//UNFINISHED ��������� WP ��� �����
	B_SetWaitWP(self,WP_TaKoPi_Wait);
	B_StartOtherRoutine(self,"WAIT");
	
	MEM_Debug(CS3(self.name,"  ",self.wp));
};
// ������ ----------------------------------
instance DIA_TaKoPi_Feed(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;						nr = 12;
	condition = DIA_TaKoPi_Feed_condition;	
	information = DIA_TaKoPi_Feed_info;
	description = "(���������)";
	permanent = TRUE;
};
func int DIA_TaKoPi_Feed_condition()
{	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)	{
		return TRUE;
	};
};
func void DIA_TaKoPi_Feed_info()
{	
	Info_ClearChoices(DIA_TaKoPi_Feed);
	Info_AddChoice(DIA_TaKoPi_Feed,Dialog_Back,DIA_TaKoPi_Feed_Back);
	if (Npc_HasItems(other, ItPl_Health_Herb_01))	{
		Info_AddChoice(DIA_TaKoPi_Feed,"���� �������� ��������",DIA_TaKoPi_Feed_Herb01);
	};
	if (Npc_HasItems(other, ItPl_Health_Herb_02))	{
		Info_AddChoice(DIA_TaKoPi_Feed,"���� �������� �����",DIA_TaKoPi_Feed_Herb02);
	};
	if (Npc_HasItems(other, ItFoMutton))	{
		Info_AddChoice(DIA_TaKoPi_Feed,"���� ����� �������� ����",DIA_TaKoPi_Feed_Meat);
	};
	if (Npc_HasItems(other, ItFoMuttonRaw))	{
		Info_AddChoice(DIA_TaKoPi_Feed,"���� ����� ������ ����",DIA_TaKoPi_Feed_RawMeat);
	};
	//������ �� ��������� ����� �� �����
};
func void DIA_TaKoPi_Feed_Back()
{	
	Info_ClearChoices(DIA_TaKoPi_Feed);
};
//���� ������, ��� ����
func void DIA_TaKoPi_Feed_DoEat()
{
	if ((self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX]) && !XP_MIS_MissingFriend_Healed_Once)	{
		B_GivePlayerXP(XP_MIS_MissingFriend_Healed);
		XP_MIS_MissingFriend_Healed_Once = TRUE;
	};
	//������ ������, ����� ����������� ������ �� �����
	AI_Output(self,other,"XXX");	//
	AI_PlayAni(self,"R_ROAM2");
};
func void DIA_TaKoPi_Feed_RawMeat()
{	
	B_GiveInvItems(other,self,ItFoMuttonRaw,1);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,1);
	Use_RawMeat();
	DIA_TaKoPi_Feed_DoEat();
	DIA_TaKoPi_Feed_info();
};
func void DIA_TaKoPi_Feed_Meat()
{	
	B_GiveInvItems(other,self,ItFoMutton,1);
	Npc_RemoveInvItems(self,ItFoMutton,1);
	Use_Meat();
	DIA_TaKoPi_Feed_DoEat();
	DIA_TaKoPi_Feed_info();
};
func void DIA_TaKoPi_Feed_Herb01()
{	
	//����� ����� ����, ������ ����� �����
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])	{
		B_GiveInvItems(other,self,ItPl_Health_Herb_01,1);
		Npc_RemoveInvItems(self,ItPl_Health_Herb_01,1);
		Use_Health_Herb_01();
		DIA_TaKoPi_Feed_DoEat();
	}
	else	{
		AI_Output(self,other,"DIA_TaKoPi_Refuse");	//(�� ���)
		AI_PlayAni(self,"R_ROAM1");
	};
	DIA_TaKoPi_Feed_info();
};
func void DIA_TaKoPi_Feed_Herb02()
{	
	//����� ����� ����, ������ ����� �����
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])	{
		B_GiveInvItems(other,self,ItPl_Health_Herb_02,1);
		Npc_RemoveInvItems(self,ItPl_Health_Herb_02,1);
		Use_Health_Herb_01();
		DIA_TaKoPi_Feed_DoEat();
	}
	else	{
		AI_Output(self,other,"DIA_TaKoPi_Refuse");	//(�� ���)
		AI_PlayAni(self,"R_ROAM1");
	};
	DIA_TaKoPi_Feed_info();
};

//NS - 18/03/2016 ===========
// ������� 
//===========================
// ���������� ----------------------------------
instance DIA_TaKoPi_Perm(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;						nr = 20;
	condition = DIA_TaKoPi_Perm_condition;	
	information = DIA_TaKoPi_Perm_info;
	description = "������, ��������!";
	permanent = TRUE;
};
func int DIA_TaKoPi_Perm_condition()
{	
	if (MIS_DS2P_MissingFriend == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_TaKoPi_Perm_info()
{	
	AI_Output(other,self,"DIA_TaKoPi_Perm_15_01");	//������, ��������!
		//������ ������, ����� ����������� ������ �� �����
		AI_Output(self,other,"XXX");	//
		var int rnd;	rnd = Hlp_Random(4);
		if (rnd == 0)	{
			AI_PlayAni(self,"R_GROWL");
		}
		else if (rnd == 1)	{
			AI_PlayAni(self,"T_PERCEPTION");
		}
		else if (rnd == 2)	{
			AI_PlayAni(self,"R_SCRATCH");
		}
		else	{
			AI_PlayAni(self,"R_HOWL");
		};
	AI_StopProcessInfos(self);
};
