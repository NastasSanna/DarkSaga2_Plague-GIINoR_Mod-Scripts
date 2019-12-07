//************�������� �������*****************

instance DIA_Ekor_TEACH(C_Info)
{
	npc = OUT_400_DS2P_Ekor;
	nr = 800;
	condition = dia_Ekor_teach_condition;
	information = dia_Ekor_teach_info;
	permanent = TRUE;
	description = "����� �������� �� ������ ������� ����?";
};
func int dia_Ekor_teach_condition()
{
	if(Npc_KnowsInfo(other,DIA_Ekor_TeachPre))
	{
		return TRUE;
	};
};
func void dia_Ekor_teach_info()
{
	AI_Output(other,self,"DIA_Ekor_TEACH_15_00");	//����� �������� �� ������ ������� ����?
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		AI_Output(self,other,"DIA_Ekor_TEACH_08_00");	//� ������ ������ �� ���� ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_TEACH_08_01");	//���� ��������� - �������.
		Info_ClearChoices(dia_Ekor_teach);
		Info_AddChoice(dia_Ekor_teach,Dialog_Back,dia_Ekor_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_Ekor_teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_ALCHEMY,POTION_Health_01,-1),dia_Ekor_teach_health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE))
	{
		Info_AddChoice(dia_Ekor_teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_ALCHEMY,POTION_Health_02,-1),dia_Ekor_teach_health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE))
	{
		Info_AddChoice(dia_Ekor_teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_ALCHEMY,POTION_Health_03,-1),dia_Ekor_teach_health03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_Ekor_teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_ALCHEMY,POTION_Mana_01,-1),dia_Ekor_teach_mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_Ekor_teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_ALCHEMY,POTION_Mana_02,-1),dia_Ekor_teach_mana02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_Ekor_teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_ALCHEMY,POTION_Mana_03,-1),dia_Ekor_teach_mana03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(dia_Ekor_teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_ALCHEMY,POTION_Perm_STR,-1),dia_Ekor_teach_permstr);
	};
};
func void dia_Ekor_teach_back()
{
	Info_ClearChoices(dia_Ekor_teach);
};
func void dia_Ekor_teach_health01()
{
	var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_ALCHEMY,POTION_Health_01);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01))
		{
			AI_Output(self,other,"DIA_Ekor_TEACH_Health01_08_00");	//����������� ��� �������� �������� - �������� ����� � ������� �����.
			b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_NoGold_08_00");	//������� ������.
	};
	Info_ClearChoices(dia_Ekor_teach);
};
func void dia_Ekor_teach_health02()
{
	var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_ALCHEMY,POTION_Health_02);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02))
		{
			AI_Output(self,other,"DIA_Ekor_TEACH_Health02_08_00");	//����� ����������� �������� ��������, ���� ����������� �������� �������� � ������� �����.
			AI_Output(self,other,"DIA_Ekor_TEACH_Health02_08_01");	//�������� ���� �������� ����� ����� ���������.
			b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_NoGold_08_00");	//������� ������.
	};
	Info_ClearChoices(dia_Ekor_teach);
};
func void dia_Ekor_teach_health03()
{
	var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_ALCHEMY,POTION_Health_03);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03))
		{
			AI_Output(self,other,"DIA_Ekor_TEACH_Health03_08_00");	//��� �������� ��������� �������� ��������� ���� ������ �����.
			AI_Output(self,other,"DIA_Ekor_TEACH_Health03_08_01");	//���� ����������� �������� ����� � ������� �����. ��� ��������� ����� ����� ����� ���� �������� ������������.
			b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_NoGold_08_00");	//������� ������.
	};
	Info_ClearChoices(dia_Ekor_teach);
};

func void dia_Ekor_teach_mana01()
{
	var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_ALCHEMY,POTION_Mana_01);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01))
		{
			AI_Output(self,other,"DIA_Ekor_TEACH_Mana01_08_00");	//�������� ���� - ����� ������� �� ���������� �����.
			AI_Output(self,other,"DIA_Ekor_TEACH_Mana01_08_01");	//������ �������� ������� � ������� ����� � �������� �� �� ��������� ����.
			b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_NoGold_08_00");	//������� ������.
	};
	Info_ClearChoices(dia_Ekor_teach);
};
func void dia_Ekor_teach_mana02()
{
	var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_ALCHEMY,POTION_Mana_02);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02))
		{
			AI_Output(self,other,"DIA_Ekor_TEACH_Mana02_08_00");	//��� ��� �� ��� ������ �������� �������� ����, ���� ������� ��������������, �� ������� �������� ����� � ��������.
			AI_Output(self,other,"DIA_Ekor_TEACH_Mana02_08_01");	//�����������, ����� ������� ������ �������� �������� ����������� ����� �����. � �������� ������������ ��� ���� ������������ �������� ����� � ������� �����.
			b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_NoGold_08_00");	//������� ������.
	};
	Info_ClearChoices(dia_Ekor_teach);
};
func void dia_Ekor_teach_mana03()
{
	var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_ALCHEMY,POTION_Mana_03);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03))
		{
			AI_Output(self,other,"DIA_Ekor_TEACH_Mana03_08_00");	//��� ��� �� ��� ����� �������� ������� ����, �� ����� �������� �������.
			AI_Output(self,other,"DIA_Ekor_TEACH_Mana03_08_01");	//�� ������� ���� �������� ������������ ��� ��������� ����� �����. � �������� ������������ ��� ���� ������������ �������� ����� � ������� �����.
			b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_NoGold_08_00");	//������� ������.
	};
	Info_ClearChoices(dia_Ekor_teach);
};

func void dia_Ekor_teach_permstr()
{
	var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{	
		if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR))
		{
			AI_Output(self,other,"DIA_Ekor_TEACH_PermSTR_08_00");	//������� ����! ������������ �����. ��� ���� ���� ����������� ������ �������� ������ � ������� ������.
			AI_Output(self,other,"DIA_Ekor_TEACH_PermSTR_08_01");	//��� ��������� ����� ����� �����, ����� �������� �� ����� ������� ��������, ����� ���� ����� ����� ���������� �������!
			b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ekor_NoGold_08_00");	//������� ������.
	};
	Info_ClearChoices(dia_Ekor_teach);
};


