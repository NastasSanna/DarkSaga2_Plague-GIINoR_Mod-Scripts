/******************************************************************
                        ��������� �����
*******************************************************************/
//*NS - 14/06/2013

func void SpeakingDoor_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SpeakingDoor;
		AI_ProcessInfos(hero);
	};
};

//-------------------------

instance PC_SpeakingDoor(C_Info)
{
	npc = PC_Hero;
	condition = PC_SpeakingDoor_Condition;
	information = PC_SpeakingDoor_Info;
	permanent = TRUE;
	important = TRUE;
};
func int PC_SpeakingDoor_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SpeakingDoor)
	{
		return TRUE;
	};
};

func void PC_SpeakingDoor_Info()
{
	Info_ClearChoices(PC_SpeakingDoor);
	Info_AddChoice(PC_SpeakingDoor, "�� ����.", PC_SpeakingDoor_DontKnow);
	Info_AddChoice(PC_SpeakingDoor, "����� ������. ��� ����� ����!", PC_SpeakingDoor_Please);
	Info_AddChoice(PC_SpeakingDoor, "���� ������� ����.", PC_SpeakingDoor_Gard);
	Info_AddChoice(PC_SpeakingDoor, "�, ��������� �����!", PC_SpeakingDoor_OhSpeakingDoor);
	Info_AddChoice(PC_SpeakingDoor, "�������������.", PC_SpeakingDoor_Novohodonosor);
	Info_AddChoice(PC_SpeakingDoor, "������.", PC_SpeakingDoor_Parol);
	Info_AddChoice(PC_SpeakingDoor, "�� ���?", PC_SpeakingDoor_WhoAreU);
	if (Hero_KnowsDoorPassword == TRUE)
	{
		Info_AddChoice(PC_SpeakingDoor, "��������", PC_SpeakingDoor_Jarkendar);
	};
};

func void PC_SpeakingDoor_WhoAreU()
{
	AI_Output(other,self,"DIA_SpeakingDoor_WhoAreU_15_00");	//�� ���?
		AI_Output(self,other,"DIA_SpeakingDoor_WhoAreU_18_01");	//������������ ������.
	b_endproductiondialog();
};
func void PC_SpeakingDoor_Parol()
{
	AI_Output(other,self,"DIA_SpeakingDoor_Parol_15_00");	//������.
		AI_Output(self,other,"DIA_SpeakingDoor_Parol_18_01");	//������������ ������.
	b_endproductiondialog();
};
func void PC_SpeakingDoor_Novohodonosor()
{
	AI_Output(other,self,"DIA_SpeakingDoor_Novohodonosor_15_00");	//�������������.
		AI_Output(self,other,"DIA_SpeakingDoor_Novohodonosor_18_01");	//������������ ������.
	b_endproductiondialog();
};
func void PC_SpeakingDoor_OhSpeakingDoor()
{
	AI_Output(other,self,"DIA_SpeakingDoor_OhSpeakingDoor_15_00");	//�, ��������� �����!
		AI_Output(self,other,"DIA_SpeakingDoor_OhSpeakingDoor_18_01");	//� �� ��� �����?!
	AI_Output(other,self,"DIA_SpeakingDoor_OhSpeakingDoor_15_02");	//������ ����.
		AI_Output(self,other,"DIA_SpeakingDoor_OhSpeakingDoor_18_03");	//������������ ������.
	b_endproductiondialog();
};
func void PC_SpeakingDoor_Gard()
{
	AI_Output(other,self,"DIA_SpeakingDoor_Gard_15_00");	//���� ������� ����.
		AI_Output(self,other,"DIA_SpeakingDoor_Gard_18_01");	//������������ ������.

	b_endproductiondialog();
};
func void PC_SpeakingDoor_Please()
{
	AI_Output(other,self,"DIA_SpeakingDoor_Please_15_00");	//����� ������. ��� ����� ����!
		AI_Output(self,other,"DIA_SpeakingDoor_Please_18_01");	//������������ ������.
	b_endproductiondialog();
};
func void PC_SpeakingDoor_DontKnow()
{
	AI_Output(other,self,"DIA_SpeakingDoor_DontKnow_15_00");	//�� ����.
		AI_Output(self,other,"DIA_SpeakingDoor_DontKnow_18_01");	//������������ ������.
	b_endproductiondialog();
};
func void PC_SpeakingDoor_Jarkendar()
{
	AI_Output(other,self,"DIA_SpeakingDoor_Jarkendar_15_00");	//��������
		AI_Output(self,other,"DIA_SpeakingDoor_Jarkendar_18_01");	//�, ������ ������, ������!
	b_endproductiondialog();
	//UNFINISHED ����� �����������
	//UNFINISHED ������� ������, ���� �� �� �����, ��� �� "�����"?
};

