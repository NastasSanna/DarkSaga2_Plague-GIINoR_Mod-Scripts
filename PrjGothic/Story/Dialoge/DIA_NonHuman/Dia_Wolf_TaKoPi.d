instance DIA_TaKoPi_EXIT(DIA_Proto_End)
{
	npc = Wolf_DS2P_TaKoPi;
};

//////////////////////////// ����� /////////////////////////////

//===================================================
//��� ������� ����������
//���������: ������� ����� � ����� �����
//����������
instance DIA_TaKoPi_Perm(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;								nr = 1;
	condition = DIA_TaKoPi_Perm_Cond;
	information = DIA_TaKoPi_Perm_Info;
	description = "*(����������)";
	permanent = TRUE;
	important = TRUE;
};
func int DIA_TaKoPi_Perm_Cond()
{
	if (DIA_WhenAsked_cond() && MIS_DS2P_MissingFriend == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_TaKoPi_Perm_Info()
{
		AI_Output(self,other,"XXX");	//
	//������ �������
	AI_PlayAni(self, "T_WARN");
	//�������� ����������
	AI_StopProcessInfos(self);
};

////////////////////// �����: ��������� ���� ////////////////////////
func void TaKoPi_DoFollow() 
{
		AI_Output(self,other,"WOL_AMBIENT_SHORT04");	//���.
	//�������� - ������ �������
	AI_PlayAni(self, "T_SNIFF");
	//���� ������� �� ��
	TaKoPi_FollowState = FollowState_Follows;
	AI_GotoNpc(self, other);
	B_StartOtherRoutine(self, "FOLLOW");
};

func void TaKoPi_DoWait() 
{
		AI_Output(self,other,"WOL_AMBIENT_SHORT02");	//
	//���� ����
	TaKoPi_FollowState = FollowState_Waits;
	B_StartOtherRoutine(self, "WAIT");
	AI_StopProcessInfos(self);
};

//===================================================
//���������� ���
//���������: ����� "��������� ����" �������
instance DIA_TaKoPi_Hello(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;								nr = 10;
	condition = DIA_TaKoPi_Hello_Cond;
	information = DIA_TaKoPi_Hello_Info;
	description = "*���������";
	important = TRUE;
};
func int DIA_TaKoPi_Hello_Cond()
{
	if (MIS_DS2P_MissingFriend == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_TaKoPi_Hello_Info()
{
		AI_Output(self,other,"WOL_AMBIENT_SHORT01");	//(���������� �������)
	//�������� ������
	AI_PlayAni(self, "T_WARN");
	AI_Output(other,self,"DIA_TaKoPi_Hello_15_02");	//��, ���������, � �� ���� ����.
		AI_Output(self,other,"WOL_GROWL01");	//(���������) ����.
	AI_Output(other,self,"DIA_TaKoPi_Hello_15_04");	//� ����, �����.
	//����� �������� (����)
	Info_ClearChoices(DIA_TaKoPi_Hello);
	Info_AddChoice(DIA_TaKoPi_Hello, "��-��... �� �����.", DIA_TaKoPi_Hello_Wrong);
	Info_AddChoice(DIA_TaKoPi_Hello, "��-��-��-��. ��-��-��-��-��.", DIA_TaKoPi_Hello_Wrong);
	Info_AddChoice(DIA_TaKoPi_Hello, "��-��-��-��. ��-��-��-��-��.", DIA_TaKoPi_Hello_Right);
	Info_AddChoice(DIA_TaKoPi_Hello, "��-��-��-��. ��-��-��-��-��.", DIA_TaKoPi_Hello_Wrong);
};


//�������� ������
func void DIA_TaKoPi_Hello_Wrong() 
{
	//�������� ������ (��������)
		AI_Output(self,other,"WOL_ATTACK01");	//
	//����� ��������
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_MissingFriend_Failed);
	//�������� ����������, ���� �������
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

//��-��-��-��. ��-��-��-��-��.
func void DIA_TaKoPi_Hello_Right()
{
	AI_Output(other,self,"DIA_TaKoPi_Hello_Right_15_00");	//��-��-��-��. ��-��-��-��-��.
	//������ � ��������. ����� ���������� ����: �����
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_Running,TOPIC_DS2P_MissingFriend_Found);
		AI_Output(self,other,"WOL_AMBIENT_SHORT03");	//(�������������) ���?
	AI_Output(other,self,"DIA_TaKoPi_Hello_Right_15_03");	//��-��, ������ � �������.
	//���� ������� �� ��
	TaKoPi_DoFollow();
	//�������� ����������
	AI_StopProcessInfos(self);
};

//===================================================
//��� �� ����.
//����������
instance DIA_TaKoPi_FollowMe(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;								nr = 11;
	condition = DIA_TaKoPi_FollowMe_Cond;
	information = DIA_TaKoPi_FollowMe_Info;
	description = "��� �� ����.";
	permanent = TRUE;
};
//�������: ����� ����� �����, �� �� ����� �������� ���������
func int DIA_TaKoPi_FollowMe_Cond()
{
	if (TaKoPi_FollowState == FollowState_Waits)	{
		return TRUE;
	};
};
func void DIA_TaKoPi_FollowMe_Info()
{
	AI_Output(other,self,"DIA_TaKoPi_FollowMe_15_01");	//��� �� ����.
	//���� ������� �� ��
	TaKoPi_DoFollow();
};


//===================================================
//��� �����.
//����������
instance DIA_TaKoPi_WaitHere(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;								nr = 12;
	condition = DIA_TaKoPi_WaitHere_Cond;
	information = DIA_TaKoPi_WaitHere_Info;
	description = "��� �����.";
	permanent = TRUE;
};
//�������: ���� ������� �� ��
func int DIA_TaKoPi_WaitHere_Cond()
{
	if (TaKoPi_FollowState == FollowState_Follows)	{
		return TRUE;
	};
};
func void DIA_TaKoPi_WaitHere_Info()
{
	AI_Output(other,self,"DIA_TaKoPi_WaitHere_15_01");	//���!
	//���� �������� �� �����
	TaKoPi_DoWait();
};

//===================================================
//����������
instance DIA_TaKoPi_Heal(C_Info)
{
	npc = Wolf_DS2P_TaKoPi;								nr = 13;
	condition = DIA_TaKoPi_Heal_Cond;
	information = DIA_TaKoPi_Heal_Info;
	description = "(��������...)";
	permanent = TRUE;
};
//�������: ��� �� ������� ����� ����� � ��� �� ��������
func int DIA_TaKoPi_Heal_Cond()
{
	if (MIS_DS2P_MissingFriend == LOG_Running && self.aivar[REAL_HITPOINTS_MAX] < self.attribute[ATR_HITPOINTS_MAX])	{
		return TRUE;
	};
};
func void DIA_TaKoPi_Heal_Menu() {
	//����� �������� (���������):
	Info_ClearChoices(DIA_TaKoPi_Heal);
	Info_AddChoice(DIA_TaKoPi_Heal, Dialog_Back, DIA_Who_Heal_Back);
	if (Npc_HasItems(other, ItPo_DS2P_Health_Elixier)) {
		Info_AddChoice(DIA_TaKoPi_Heal, "(���� �������� �������)", DIA_TaKoPi_Heal_Elixier);
	};
	if (Npc_HasItems(other, ItFoMutton)) {
		Info_AddChoice(DIA_TaKoPi_Heal, "(���� ����� �������� ����)", DIA_TaKoPi_Heal_Mutton);
	};
	if (Npc_HasItems(other, ItFoMuttonRaw)) {
		Info_AddChoice(DIA_TaKoPi_Heal, "(���� ����� ������ ����)", DIA_TaKoPi_Heal_MuttonRaw);
	};
};
func void DIA_TaKoPi_Heal_Info()
{
	DIA_TaKoPi_Heal_Menu();
};
func void DIA_Who_Heal_Back() {
	Info_ClearChoices(DIA_TaKoPi_Heal);
};
//(���)
func void DIA_TaKoPi_Heal_Give(var int itm, var int hp) {
		AI_Output(other,self,"DIA_TaKoPi_Heal_15_00");	//���, ������.
	//������ ��������� �������
	B_DS_GiveRemoveItems(other, self, itm, 1);
	AI_Output(self,other,"DIA_TaKoPi_WaitHere_99_01");	//(��������� �������)
	//�������� - ���
	AI_PlayAni(self,"T_STAND_2_EAT");
	AI_PlayAni(self,"T_EAT_2_STAND");
	//����������������� ��������
	Npc_ChangeAttribute(self,ATR_HITPOINTS,hp);
	if (self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX]) {
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	self.aivar[REAL_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS];
	//���� ����
	if (self.aivar[REAL_HITPOINTS_MAX] == self.attribute[ATR_HITPOINTS_MAX]) {
		B_GivePlayerXP(hp * 5);
	};
	DIA_TaKoPi_Heal_Menu();
};

func void DIA_TaKoPi_Heal_Elixier() { 
	DIA_TaKoPi_Heal_Give(ItPo_Health_03,self.attribute[ATR_HITPOINTS_MAX]);
};

func void DIA_TaKoPi_Heal_Mutton() { 
	DIA_TaKoPi_Heal_Give(ItFoMutton,HP_Meat * 2);
};

func void DIA_TaKoPi_Heal_MuttonRaw() { 
	DIA_TaKoPi_Heal_Give(ItFoMutton,HP_Meat * 3);
};
