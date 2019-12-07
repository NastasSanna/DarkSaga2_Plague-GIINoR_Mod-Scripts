/******************************************************
    �������� ��������, ��������� � �������������
  � ������� ���-��-����
/******************************************************/

instance DIA_JaAfFar_Teach(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 51;
	condition = DIA_JaAfFar_Teach_condition;	
	information = DIA_JaAfFar_Teach_info;
	description = "����� ����.";
	permanent = TRUE;
};
func int DIA_JaAfFar_Teach_condition()
{
	if (TEACH_JaAfFar) {
		return TRUE;
	};
};

//����� ���� ��������
//���� ���������
func void DIA_JaAfFar_Teach_Menu()
{
	Info_ClearChoices(DIA_JaAfFar_Teach);
	Info_AddChoice(DIA_JaAfFar_Teach,Dialog_Back,DIA_JaAfFar_Teach_Back);
	//��������� -----------------------------------
	if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_NONE) {
		Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_FIRST,0),DIA_JaAfFar_Teach_Theft_1);
	}
	else if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_FIRST) {
		Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_SECOND,0),DIA_JaAfFar_Teach_Theft_2);
	}
	else if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_SECOND) {
		Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_THIRD,0),DIA_JaAfFar_Teach_Theft_3);
	};
	//������������� -------------------------------
	if (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) {
		Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_SNEAK,1,0),DIA_JaAfFar_Teach_Sneak);
	};
	//�������� ------------------------------------
	if (other.attribute[ATR_DEXTERITY] < 150) {
		Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,1,0),DIA_JaAfFar_Teach_dex_1);
	};
	if (other.attribute[ATR_DEXTERITY] <= 145) {
		Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,5,0),DIA_JaAfFar_Teach_dex_5);
	};
};

//������� point ������ ��������
func void DIA_JaAfFar_Teach_DEX_DoIt(var int points)
{
	AI_Output(other,self,"DIA_JaAfFar_Teach_DEX_15_01");	//������ ��� ��������.
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,points,T_MAX);
	DIA_JaAfFar_Teach_Menu();
};

//�������� ������
func void DIA_JaAfFar_Teach_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_Teach_15_01");	//����� ����.
	if ((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_THIRD) && Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)
		 && (other.attribute[ATR_DEXTERITY] >= 150))
	{
		AI_Output(self,other,"DIA_JaAfFar_Teach_18_02");	//��� ������ ������ ����� �����. ����� ����� ������ ���.
		TEACH_JaAfFar = TRUE;
	}
	else {
		AI_Output(self,other,"DIA_JaAfFar_Teach_18_03");	//����?
	};
	DIA_JaAfFar_Teach_Menu();
};

func void DIA_JaAfFar_Teach_Back()
{	
	Info_ClearChoices(DIA_JaAfFar_Teach);
};
func void DIA_JaAfFar_Teach_Theft_1()
{
	AI_Output(other,self,"DIA_JaAfFar_Teach_Theft_15_01");	//����� ���� ���������.
	B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_FIRST);
	DIA_JaAfFar_Teach_Menu();
};
func void DIA_JaAfFar_Teach_Theft_2()
{
	AI_Output(other,self,"DIA_JaAfFar_Teach_Theft_15_01");	//����� ���� ���������.
	B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_SECOND);
	DIA_JaAfFar_Teach_Menu();
};
func void DIA_JaAfFar_Teach_Theft_3()
{
	AI_Output(other,self,"DIA_JaAfFar_Teach_Theft_15_01");	//����� ���� ���������.
	B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_THIRD);
	DIA_JaAfFar_Teach_Menu();
};
func void DIA_JaAfFar_Teach_Sneak()
{
	AI_Output(other,self,"DIA_JaAfFar_Teach_Sneak_15_01");	//����� ���� ��������.
	B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK,1);
	DIA_JaAfFar_Teach_Menu();
};
func void DIA_JaAfFar_Teach_DEX_1()
{
	DIA_JaAfFar_Teach_DEX_DoIt(1);
	DIA_JaAfFar_Teach_Menu();
};
func void DIA_JaAfFar_Teach_DEX_5()
{
	DIA_JaAfFar_Teach_DEX_DoIt(5);
	DIA_JaAfFar_Teach_Menu();
};


