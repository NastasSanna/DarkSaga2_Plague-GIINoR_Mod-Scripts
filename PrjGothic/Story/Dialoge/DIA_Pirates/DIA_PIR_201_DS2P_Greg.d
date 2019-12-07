instance DIA_Greg_EXIT(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Greg_EXIT_condition;	
	information = DIA_Greg_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Greg_EXIT_condition(){	return TRUE;};
func void DIA_Greg_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Greg_Start(C_Info)	//��������� ������ �� �������
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Greg_Start_condition;	
	information = DIA_Greg_Start_info;
	important = TRUE;
};
func int DIA_Greg_Start_condition(){	return TRUE;};
func void DIA_Greg_Start_info()
{	//UNFINISHED ������� �������
	B_StartOtherRoutine(PIR_207_DS2P_LanSkeleton,"GoToGregToPirs");
	B_StartOtherRoutine(PIR_208_DS2P_GrayBeard,"GoToGregToPirs");
	B_StartOtherRoutine(PIR_209_DS2P_Vales,"GoToGregToPirs");
	AI_Output(self,other,"DIA_Greg_Start_11_00");	//���� � ����?! ��� ���������� ����� ���������. ��� �����.
	AI_Output(other,self,"DIA_Greg_Start_15_00");	//�� �������, ��� � ��� ���� ������, ����.
	AI_Output(self,other,"DIA_Greg_Start_11_01");	//������ ��?! ������� ������ ������ ������ �������. (������ �������) �, �����?!
	AI_Output(other,self,"DIA_Greg_Start_15_01");	//� ����� ��� ��� �� ����� ��������?
	AI_Output(self,other,"DIA_Greg_Start_11_02");	//�� �� �������� ����� ��������� �������, � �� ��� ��� �����? ���� �� �� �, ���� ������ ����� �� ��� ������� ������ ���������.
	AI_LookAtNpc (self,PIR_202_DS2P_Symon);
	AI_Output(self,other,"DIA_Greg_Start_11_03");	//���, �� �������, �����, ����� ���������������!
	AI_StopLookAt(self);
	AI_Output(other,self,"DIA_Greg_Start_15_02");	//����� �������� ���� ������ ��������. � �����, �� ������ ���� �� ��� ����, ����� ���������������� ������� ������.
	AI_Output(self,other,"DIA_Greg_Start_11_04");	//�� ����. �� � �������� ��������� � �������� ��������� - ������ ������ �������� ��� ����...
	//UNFINISHED �������
	AI_Output(PIR_202_DS2P_Symon,other,"DIA_Greg_Start_11_05");	//(����������) �� ����, � �������� �����!
	AI_LookAtNpc (self,PIR_202_DS2P_Symon);
	AI_Output(self,other,"DIA_Greg_Start_11_06");	//������ ���� �����, ������!
	AI_StopLookAt(self);
	AI_Output(self,other,"DIA_Greg_Start_11_07");	//��� ���, ������ �� ���� �� ���� �� ���� ����������� �������. � ���, ��� ������ ������, ����������� ��. 
	AI_Output(self,other,"DIA_Greg_Start_11_08");	//� �����, ��� ������ ������� ����! (������ �������)
	AI_Output(other,self,"DIA_Greg_Start_15_03");	//� �� �������, � ������ ��� ����� ���� �������?
	AI_Output(self,other,"DIA_Greg_Start_11_09");	//(����� ���������) �������, ��������! � ���� ����� �� �������� ��������, �� �� ������ ������ ���� ������� �������.
	AI_PlayAni(self,"T_IGETYOU");
	AI_Output(self,other,"DIA_Greg_Start_11_10");	//�� ��� �������?
	AI_Output(other,self,"DIA_Greg_Start_15_04");	//(��� ����) �� ������� �����. �������� ��������������.
	AI_Output(self,other,"DIA_Greg_Start_11_11");	//� ���...
	AI_Output(other,self,"DIA_Greg_Start_15_05");	//���� �����, � ����� ���� �������, �� ���� ��������� ��������.
	AI_Output(self,other,"DIA_Greg_Start_11_12");	//(����������) ��� ���?
	AI_Output(other,self,"DIA_Greg_Start_15_06");	//�� ������� ����. �� ���� ������� �� ����� ����� �������.
	AI_Output(self,other,"DIA_Greg_Start_11_13");	//��, ������ ����, ������? ���������, ���� ������ ����� �������� �����. �� ���� ��� ������ �� ��������!
	AI_Output(other,self,"DIA_Greg_Start_15_07");	//� �� ��...
	AI_PlayAniBS(none_15_Diego,"T_STAND_2_WOUNDED",BS_LIE);
	AI_StopProcessInfos(self);
};
instance DIA_Greg_Start02(C_Info)	//��������� ������ �� �������
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Greg_Start02_condition;	
	information = DIA_Greg_Start02_info;
	important = TRUE;
};
func int DIA_Greg_Start02_condition(){	
	if(Npc_KnowsInfo(other,DIA_Greg_Start))		{return TRUE;};
};
func void DIA_Greg_Start02_info()
{
	var int x; x=0;
	B_StartOtherRoutine(none_15_Diego,"Unconscious");	//����� ������� �� �����, ���� �� ����
	AI_Dodge(self);	//������ �����������, �����������
	AI_Dodge(PIR_202_DS2P_Symon);
	AI_Dodge(Pir_204_DS2P_Karah);
	AI_Dodge(PIR_206_DS2P_SueBaby);
	AI_Dodge(PIR_207_DS2P_LanSkeleton);
	AI_Dodge(PIR_208_DS2P_GrayBeard);
	AI_Dodge(PIR_209_DS2P_Vales);
	AI_Output(self,other,"DIA_Greg_Start02_11_00");	//��� �� ����?!
	x=1;
	if(x==1)
	{
		Wld_PlayEffect("SPELLFX_INCOVATION_RED",none_18_Vatras,none_15_Diego,0,0,0,FALSE);
		AI_PlayAni(none_18_Vatras,"T_PRACTICEMAGIC5");
		AI_PlayFX(none_18_Vatras,none_15_Diego,"SPELLFX_INCOVATION_BLUE");
	};
	x=2;
	if(x==2)
	{
		Wld_PlayEffect("SPELLFX_HEALSHRINE",none_18_Vatras,none_15_Diego,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_HEALSHRINE",none_18_Vatras,none_18_Vatras,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_HEALSHRINE",none_15_Diego,none_15_Diego,0,0,0,FALSE);
		AI_PlayAni(none_18_Vatras,"T_PRACTICEMAGIC5");		
	};
	x=3;
	if(x==3)	//�����, ���� ��� �������������, ���� ����� ������� �������������, � ����� ����� �� �������
	{
		AI_Teleport(none_15_Diego,"");	//������� �� �������
		AI_Teleport(none_18_Vatras,"");//������� �� �������
		B_StartOtherRoutine(none_18_Vatras,"START");
		B_StartOtherRoutine(none_15_Diego,"StartSleep");
	};
	AI_Output(self,other,"DIA_Greg_Start02_11_01");	//������, ������� ���� �������, �� ��������� ��� ����?
	AI_Output(other,self,"DIA_Greg_Start02_15_00");	//� �����������, ��� �������� ���� ���� ��� ��������, �������� �� ��������� �� ���� ����.
	AI_Output(other,self,"DIA_Greg_Start02_15_01");	//�� ���������� � ������ ������� ����. ������, ��� �� ������ ��� �����������.
	AI_Output(self,other,"DIA_Greg_Start02_11_02");	//� ������ �� ������, ��� ���� �� �������?
	AI_Output(other,self,"DIA_Greg_Start02_15_02");	//��-������, � �� ����� � ������� ���� ��������, ��-������, ��� ��� ���� ������, ������� ���� ��� �������������� ������ �� ������ �����.
	AI_Output(self,other,"DIA_Greg_Start02_11_03");	//(����� ����������) ���� ������?! ��...
	AI_Output(other,self,"DIA_Greg_Start02_15_03");	//���� �� ��� ���-�� �� ������� ��������� ��� � ���� �����, �� ���������� ����� ������!
	AI_Output(self,other,"DIA_Greg_Start02_11_04");	//�����, ��� �����. � ��� � �����? ��� �� ���� �� ��� �����, ��� ����������� ����� � ���������, ���� ���?
	AI_Output(other,self,"DIA_Greg_Start02_15_04");	//���, ������ ������������ �� ������� ��������. � �����, ����� ������� �������� ��� �� ����.
	AI_Output(self,other,"DIA_Greg_Start02_11_05");	//�����. � ��� �� �����������? ��� ����� �������, � � ��� ������ ��� ��� �����!
	AI_Output(other,self,"DIA_Greg_Start02_15_05");	//��������� ���� �������� ��� ��� ��� ����. ��� ����� ����������� � �����, ��� � � ����� ���������.
	AI_Output(other,self,"DIA_Greg_Start02_15_06");	//�� �� ���������, ��� ������ ���� ������� ���������� ��������� ��������, �, ������, �� ������ �� ������� � �������.
	AI_Output(self,other,"DIA_Greg_Start02_11_06");	//�� ����. ����� ����� ��-������, �� ������� �� ������ � �������� ����� ��������.
	AI_Output(self,other,"DIA_Greg_Start02_11_07");	//� ���� ��� ����� ��������� �� ��������.
	AI_LookAtNpc (self,PIR_202_DS2P_Symon);
	AI_Output(self,other,"DIA_Greg_Start02_11_08");	//���, �����, ����������� �� ����� ���������! ���������, ������������ � �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_Healer);
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_PiratesOnIsland);
	AI_StopProcessInfos(self);
	
	//*NS - 19/06/2013 ���� ���� � ������, ���� ���� �������� ������ �������
	B_StartOtherRoutine(self, "TALKTOGARD");
};


//NS - 28/06/2013 ================================================
// �� ������ "�������"
//================================================================

// ---------------------------------------------------
// ����� ��������� � ������ ���� ��� ��������� � ��
instance DIA_Greg_LetsGoAway(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 0;
	condition = DIA_Greg_LetsGoAway_condition;	
	information = DIA_Greg_LetsGoAway_info;
	important = TRUE;
};
func int DIA_Greg_LetsGoAway_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Gard_WithGregStart))
	{		return TRUE;	};
};
func void DIA_Greg_LetsGoAway_info()
{	
		AI_Output(self,other, "DIA_Greg_LetsGoAway_11_00");	//����� ������� � ��������.
	//������ ����������, ���� ����� � ��������� ������� � ������, �������� �� �����.
	B_StartOtherRoutine(self,"TALKTOHERO");
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------
// ������ �������� �� �����, ����� ����������� ����� ��� ���������� � ��
instance DIA_Greg_StartConspiracy(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 0;
	condition = DIA_Greg_StartConspiracy_condition;	
	information = DIA_Greg_StartConspiracy_info;
	important = TRUE;
};
func int DIA_Greg_StartConspiracy_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_LetsGoAway)
		&& (Npc_GetDistToWP(self, "") < PERC_DIST_DIALOG))	// UNFINISHED ������� WP, ���� ������ �� �����
	{		return TRUE;	};
};
func void DIA_Greg_StartConspiracy_info()
{	
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_00");	//� ������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_00");	//� �����, �� ��� �����, ��� � ������ ����� �����. �� �� ����������� �� ����� ���. ������� � ��������� ���������� ���� ����. 
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_01");	//� ��� �� ��������?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_01");	//������, ������ ������. � ��������� ���������� �� �����, ���� �����������?! ��� � ����� ����� ���������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_02");	//�� �������� ���������� ������� �� ��� �������, � �, � ���� �������, ������� ���� � ���� ������� � �����. ��-�����, ��� ������� ������.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_02");	//�� ��� �� ���������� � �������?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_03");	//�� �������� ��� � ��������, � ������ ����� ����� ���� ������. � �� ���� ������ ����.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_03");	//� ���� �� ��������?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_04");	//� ������ �� ������, ��� ��. ���� ���� ���� �� �������, �� ���� ��������� ��� �� ������� � ��������� ���������. � ��� ������ ����� �� ������, ��� ����.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_05");	//� ����, ��� ���� ����� ��������, ����� �� �� ������� ���������� ����� ������� ����.
	
	//	�������� �� ������� �������. --->>
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_04");	//������, � ��������.�� � ���� ���� ���� �������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_06");	//�����, ����������� ���� �������?
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_05");	//���� ��� ���� ������� � �� ���������� �������� � �����, ���������� ���� ������� � �������� �� ���������� ������ ���������.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_06");	//�� ��� �������������� � ����������� �������. ��� �������?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_07");	//��, ������. �����, � ����� ������� ������ ��������� ���� � ���� ��������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_08");	//�� ������ �� �� ������ ���������� � ��������. �������� ������ ����� ������������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_09");	//���� ��� �������?
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_07");	//���, ��� ���. �� ���� ������. ��� �� ������ ������� �����?
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_08");	//��������� ���� ������ � ������ � ��������� ���?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_10");	//���, ��� ������ �� �������� �������� ������ �������� ��������, ����������� � �������.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_09");	//�����-����� ������? �� �����, ��� ��, ������, ������ �� �����-�� �������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_11");	//(�����������) �� ������, � ������, �������� ��������. ���� ���� ������ � ������� �������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_12");	//���� �� ��� �� ����, � ����� ��� �� ��������, �� ������ ��� ����� �� ���������� ���� ����� ������ �� ������.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_10");	//�� �����, ����� �� ������� ��� ��� ������, ����� ������ � ���� � ������� � ���������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_13");	//�����, ��������. �� � �� �� ������ ����� ���� � ������ ��.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_11");	//� ��� �� ����������� ��������������� ��������?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_14");	//(� ���������) ����� ���� ������ � ������ ���� �� �� ������! ���� ������� �� ��������, ������, ��� �� ������� ����� ����� ��������?	
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_12");	//��������, � �� ���, �� ��� ���� � ����� �� ���������, ����� � �����, ��� ����� ������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_15");	//�����, ���� �����, ������ �������! ������ � �� ���������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_16");	//������ � ���� ���������, ��� ������� �� ������, ������ � ����� � ������. �� ���� �� ����� ������� ������� �����������, ���� �� �� �������, ������� ��� ������ �� �������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_17");	//�� ��������� ���� � ���, ������ �� ���, ����� �  ����� ���� ���, ���� � ���, � ����� ���������� ������ �������������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_18");	//������� ���������� �� ����� ������ �������. ������ �������� ������ �������, �������� � ���������� ��������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_19");	//� ���� ��������� ����� ��������� �� ��� ���, ���� �� ���������� �� ���� ������� ����������. �� ��� ��� ���-������ �� ����� ��������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_20");	//�������� ����� ����� ���������: ����� ��� ��� ������� ����� � �������������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_21");	//��� �� ������, ������ ������ ��� �� ������, �������� ����������, � � ���� � ����� ����������� �� ����.
	//	<<--- ����� ���������
	
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_13");	//��� �� ���� ���������?	
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_22");	//���� ������ � ������� ��� ����� ������ ������� ������� �� ���� �������.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_23");	//��������� �����������: �� ���� ������, ������, �����, ���� � ���, ��������� � ���� �� ����.
	AI_Output(other,self, "DIA_Greg_StartConspiracy_15_14");	//��� ��� �� �������?
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_24");	//����� ��������� �� � �������, ������ ����� � ��� ��������, ������� ���� �����. �� ��� ���� �����.
		AI_Output(self,other, "DIA_Greg_StartConspiracy_11_25");	//������ ���� �������� � ����� �� ������. ���� ������ �� ������ ������, �������!

	//������ � �������� "�������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_Start);

	// �������� �������������������
	B_StartOtherRoutine(self,"MAIN");
};


//NS - 28/06/2013 ================================================
// �� ������ "�������� ��������"
//================================================================

// ---------------------------------------------------
// "��� ���� ���� ������?"	����� ��������� ��� �������		nr = 20
instance DIA_Greg_HaveJob(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 20;
	condition = DIA_Greg_HaveJob_condition;	
	information = DIA_Greg_HaveJob_info;
	description = "��� ���� ���� ������?";
};
func int DIA_Greg_HaveJob_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy))
	{
		return TRUE;
	};
};
func void DIA_Greg_HaveJob_info()
{	
	AI_Output(other,self, "DIA_Greg_HaveJob_15_00");	//��� ���� ���� ������?
		AI_Output(self,other, "DIA_Greg_HaveJob_11_01");	//���� ������ ���������� ��������.
		AI_Output(self,other, "DIA_Greg_HaveJob_11_02");	//�� ���� �� ����� ������ ��������� �� ����������, �� ������ ������� ��� � ������, ��� �� ������ ����� ��������.
		AI_Output(self,other, "DIA_Greg_HaveJob_11_03");	//������ ���� ���������� �����, �� ��� ���� ���������� � ������ � ������ ������� ������������ ���� ����������.

	Info_ClearChoices(DIA_Greg_HaveJob);
	Info_AddChoice(DIA_Greg_HaveJob,"� ������ ��� �������.",DIA_Greg_HaveJob_OK);
	Info_AddChoice(DIA_Greg_HaveJob,"����� ���� �����.",DIA_Greg_HaveJob_Later);
};
func void DIA_Greg_HaveJob_Later()
{
	AI_Output(other,self, "DIA_Greg_HaveJob_Later_15_00");	//����� ���� �����.
		AI_Output(self,other, "DIA_Greg_HaveJob_Later_11_01");	//���� ����. �� ��� ��� ����� ��� ��� ��� ���������� � ������.
	Info_ClearChoices(DIA_Greg_HaveJob);
};
func void DIA_Greg_HaveJob_OK()
{
	AI_Output(other,self, "DIA_Greg_HaveJob_OK_15_00");	//� ������ ��� �������.
		AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_01");	//������. ����� � �����, ��� ���� ���� ��������, ����� ����� � �����, �� ���� ������� ��� ��� � �����.
	// UNFINISHED ������� ������ � ������
	AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_02");	//����� ����� ����������� � ������, ��� ��������� /*Redleha: ���-�� � ���-��. ���� ���������*/.
		AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_03");	//������ �� ����� � ������ - ���������.
	AI_Output(other,self, "DIA_Greg_HaveJob_OK_15_04");	//������� �������? ��� �� ��� ����� ���������?
		AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_05");	//(�������) �� �� ��� �������, ��� ��������� ������� �����, �� ���� �����.
		AI_Output(self,other, "DIA_Greg_HaveJob_OK_11_06");	//��� �������� ��� ����� �������, ��� �� ���� ������, �������� ����, ������� ��� �����! ��� ������� ����� � ������ ���� �� �������.

	Hero_KnowsDoorPassword = TRUE;
	
	//������ � �������� "�������� ��������" 
	// UNFINISHED ������� ������ � ������
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_Start);
};

// ---------------------------------------------------
// ����� ����� �����, ������ ��� ��		nr = 21
instance DIA_Greg_SuppliesLater(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 21;
	condition = DIA_Greg_SuppliesLater_condition;	
	information = DIA_Greg_HaveJob_OK;
	description = "� ������ ��� �������.";
};
func int DIA_Greg_SuppliesLater_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_HaveJob) && (MIS_DS2P_ShippingSupplies == 0))
	{	return TRUE;	};
};

// ---------------------------------------------------
// ����� �����, ���� ������ �������� �����		nr = 22
instance DIA_Greg_SuppliesGiven(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 22;
	condition = DIA_Greg_SuppliesGiven_condition;	
	information = DIA_Greg_SuppliesGiven_info;
	description = "� ����� ������� ��������� � ������.";
};
func int DIA_Greg_SuppliesGiven_condition()
{	
	if(Viola_SuppliesGiven == TRUE){	return TRUE;	};
};
func void DIA_Greg_SuppliesGiven_info()
{	
	var int x;
	AI_Output(other,self, "DIA_Greg_SuppliesGiven_15_00");	//� ����� ������� ��������� � ������.
		AI_Output(self,other, "DIA_Greg_SuppliesGiven_11_01");	//������. �� ���� ��������. ��� ������ �� ������.
	//���� 250 �������
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_Gold,250);
	};

	//������ � �������� "�������� ��������" ����� �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_ShippingSupplies_Success);
};


//NS - 28/06/2013 ================================================
// �� ������ "������ ��������"
//================================================================

// ---------------------------------------------------
// "� �������� �����."	nr = 30
instance DIA_Greg_MetSkip(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 30;
	condition = DIA_Greg_MetSkip_condition;	
	information = DIA_Greg_MetSkip_info;
	description = "� �������� �����.";
};
func int DIA_Greg_MetSkip_condition()
{	
	if(MIS_DS2P_OldAcquaintance == LOG_Running)
	{	return TRUE;	};
};
func void DIA_Greg_MetSkip_info()
{	
	AI_Output(other,self, "DIA_Greg_MetSkip_15_00");	//� �������� �����.
		AI_Output(self,other, "DIA_Greg_MetSkip_11_01");	//���? �����? � �������� ������ ����� ������ ����!
	AI_Output(other,self, "DIA_Greg_MetSkip_15_02");	//�� �����-�� ������� ��������� �� �����������. � ��������� ��� � �����. �� ������ �� �������� � ����� �� �����. 
		AI_Output(self,other, "DIA_Greg_MetSkip_11_03");	//��� �� ������� ����������! ��, ������, ������ � ��� ����� �����!
	AI_Output(other,self, "DIA_Greg_MetSkip_15_04");	//�� ��� �� ��� ��������� �����?
		AI_Output(self,other, "DIA_Greg_MetSkip_11_05");	//���� ������� ���� ����, ����� � � ������� ��� ����� ������� ������ ������� ��������� �� ����� ���������� � ������� ����!
		AI_Output(self,other, "DIA_Greg_MetSkip_11_06");	//�� ���� ��������, ��� � ���� ������ �� ������, � ����� ������ �����, ��� � ������ ��� ������ ���������� ������ � ������.
		AI_Output(self,other, "DIA_Greg_MetSkip_11_07");	//������� ����� � ������ � ����� �������� � ��� ������ ������ ����� � ����������� ��������, ������ ��� � ������ � ����� �����, � ����� ������� ���� �� �������.
		AI_Output(self,other, "DIA_Greg_MetSkip_11_08");	//�� ����, ������� ��� ���� ������, � ������ ���� ������� ��� �����, �� ������ ������ ����� ����� � ����� ������. ����� ������������.
	AI_Output(other,self, "DIA_Greg_MetSkip_15_09");	//� ����� �� ����� ����� �����?
		AI_Output(self,other, "DIA_Greg_MetSkip_11_10");	//�� ���, ������? ���� ���������� �������, ������� � ��� ��� � ������������� ��������� ��� �������, ���� �� ������ ������� � ����� ������ ������� ����� ��������.
		AI_Output(self,other, "DIA_Greg_MetSkip_11_11");	//��, ��� ����� �������. (����� ���������)
		AI_Output(self,other, "DIA_Greg_MetSkip_11_12");	//� �����, ���. ���� ��������� ����� ��� ���, ������� ��������: ����� ��������� ���, ���� ������ ����� �������, �� ���� � ����� ���� � ������ ���������� ������� �����������.
	B_StartOtherRoutine(Skip,"HIDEINWOOD");
	//������ � �������� "������ ��������" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldAcquaintance_GregAngry);

};

// ������������, ���� ���� ����� ������ � ������ "�������"

instance DIA_Greg_SkipHelps(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 30;
	condition = DIA_Greg_SkipHelps_condition;	
	information = DIA_Greg_SkipHelps_info;
	description = "�� ������ �����.";
};

func int DIA_Greg_SkipHelps_condition()
{	
	if((MIS_DS2P_OldAcquaintance == LOG_Running) && Npc_KnowsInfo(other,DIA_Skip_News))
	{	
		return TRUE;	
	};
};

func void DIA_Greg_SkipHelps_info()
{
	AI_Output(other,self, "DIA_Greg_SkipHelps_15_00");	//�� ������ �����.
	AI_Output(self,other, "DIA_Greg_SkipHelps_11_01");	//�� ������ �������, ��� ���� ������� ���� ������ ��� �����������?
	AI_Output(other,self, "DIA_Greg_SkipHelps_15_02");	//���, �� ������. � �������� ��� � ���� � � ���� ���� � ���� �����������.
	AI_Output(self,other, "DIA_Greg_SkipHelps_11_03");	//�����? �������, �� �������� ���?
	AI_Output(other,self, "DIA_Greg_SkipHelps_15_04");	//�����. � ��������� ��� � ����� �������� �����������. �� �����, ����� �� ������� ��� � ����� �� ��� ����� �� ����������� �����������.
	AI_Output(self,other, "DIA_Greg_SkipHelps_11_05");	//(���������) ��. �������� ����� ����� � ����� �� �����? ��. �����, ���� � ���. ���� �� ����������� �� ����, �� � ������, ��� �� ��������� � �����. �� ���� ���, ���� �� � � ���� ��� ������� ����.
	AI_Output(self,other, "DIA_Greg_SkipHelps_11_06");	//��� � ������� ����� ��������� ������� ����������. � �������� ��� ������ ����, ��� ��� ����� ����� �� ���������� ������.
	AI_Output(other,self, "DIA_Greg_SkipHelps_15_07");	//��� � �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldAcquaintance_GregAccept);
	AI_StopProcessInfos(self);
};

//NS - 01/05/2013 ================================================
// �� ������ "��������� ��� ������"
//================================================================
instance DIA_Greg_GuardsForCave(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 50;
	condition = DIA_Greg_GuardsForCave_condition;	
	information = DIA_Greg_GuardsForCave_info;
	description = "���� ������� ���.";
};
func int DIA_Greg_GuardsForCave_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start) && (MIS_DS2P_GuardsForCave == LOG_Running))
	{	return TRUE;	};
};

func void DIA_Greg_GuardsForCave_info()
{	
	AI_Output(other,self, "DIA_Greg_GuardsForCave_15_00");	//���� ������� ���. �� ������ ��������� ����� ��� ������ ������.
		AI_Output(self,other, "DIA_Greg_GuardsForCave_11_00");	//��� ��� ������? ��� � ��� �����, ��� ���������� �����.
	AI_Output(other,self, "DIA_Greg_GuardsForCave_15_01");	//���� �����.
		AI_Output(self,other, "DIA_Greg_GuardsForCave_11_01");	//���� ������! ��� � ����, ��� ������ �������� ����� �������� ��������� ����.
		AI_Output(self,other, "DIA_Greg_GuardsForCave_11_02");	//�����, ��� � ������ � �����, ��� � �������� ��� ������������ � ������.
	// � �������
	B_DSG_Log_OpenClose(TOPIC_DS2P_GuardsForCave,LOG_MISSION,LOG_Running,TOPIC_DS2P_GuardsForCave_TakeKarah);
};


//NS - 28/06/2013 ================================================
// ����� �������, ����� ��������� ��� �������
//================================================================

// ---------------------------------------------------
// "��� ����� ������."	nr = 10
instance DIA_Greg_NeedWeapon(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 10;
	condition = DIA_Greg_NeedWeapon_condition;	
	information = DIA_Greg_NeedWeapon_info;
	description = "��� ����� ������.";
};
func int DIA_Greg_NeedWeapon_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy))
	{	return TRUE;	};
};
func void DIA_Greg_NeedWeapon_info()
{	
	AI_Output(other,self, "DIA_Greg_NeedWeapon_15_00");	//��� ����� ������.
		AI_Output(self,other, "DIA_Greg_NeedWeapon_11_01");	//�� ��������� �� �� ������.
		AI_Output(self,other, "DIA_Greg_NeedWeapon_11_02");	//���� � ��������� ��� �� �������� ���, ������� ��������� ���� ��������� ���������� ������. �������� � ����.
		AI_Output(self,other, "DIA_Greg_NeedWeapon_11_03");	//� ��������� ����� ������ � ���� � ����, ����� ������, �������.
};

// ---------------------------------------------------
// "��� �� �������� �� �������?"	nr = 11
instance DIA_Greg_HowAppearOnIsland(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 11;
	condition = DIA_Greg_HowAppearOnIsland_condition;	
	information = DIA_Greg_HowAppearOnIsland_info;
	description = "��� �� �������� �� �������?";
};
func int DIA_Greg_HowAppearOnIsland_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy))
	{	return TRUE;	};
};
func void DIA_Greg_HowAppearOnIsland_info()
{	
	AI_Output(other,self, "DIA_Greg_HowAppearOnIsland_15_00");	//��� �� �������� �� �������?
	AI_Output(other,self, "DIA_Greg_HowAppearOnIsland_15_01");	//����� � �������� � ��������, �� ������ � ��������� � �� ����������� ����������� ������.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_02");	//�� ����, �� �����������. ����� ���� ���� ����� ����, ��� �� ���� �����������, � ��� �� ����� ���������� ������� �� ����� � �������.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_03");	//�� �����, ��� ����� ������ ������ �� ����� ������� �� �� ������, ����� �������� � ����� ������� ������, ������� ����� ����������� �� ����������. ���� ������ �����.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_04");	//��� ������� ��������, �� ����� ��� ��� ������� ���� ��������.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_05");	//������ ����� �������� �� �� �� ��������, ������� � �� ������ ������ �������� � �������, ���� �� ����� ������� ������.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_06");	//���� ������, ��� ����� �������� ����� ��� ������ ������ �� ����� ��������. �� ���� �� ��� �� ������ ���������.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_07");	//� ���� ��� �������� ���� �� ����� �����.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_08");	//�� ������ ��� �������� ����������� � ���� �� ���������� ������ ��� �������, ���� ��� ��� ������� �� ��� � ���� �� ���� ������. �������� ����, � ����������.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_09");	//�� � ������ ��, �����, ��� ������ � ���� ���� ��� � ���� �� �������� ����, �� ������ ��������� �� ���������� �� ������ �����.
		AI_Output(self,other, "DIA_Greg_HowAppearOnIsland_11_10");	//������ ������� ��� ������, � ��� ����� ������� ��������� �� ������.
};

// ---------------------------------------------------
// "��� �� ���������� � �����?"	nr = 12
instance DIA_Greg_AboutGard(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 12;
	condition = DIA_Greg_AboutGard_condition;	
	information = DIA_Greg_AboutGard_info;
	description = "��� �� ���������� � �����?";
};
func int DIA_Greg_AboutGard_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy))
	{	return TRUE;	};
};
func void DIA_Greg_AboutGard_info()
{	
	AI_Output(other,self, "DIA_Greg_AboutGard_15_00");	//��� �� �������� �� �������?
		AI_Output(self,other, "DIA_Greg_AboutGard_11_01");	//� ����, ��� �� ������ �������� �� ����, �� �� �� ����!
		AI_Output(self,other, "DIA_Greg_AboutGard_11_02");	//���� ��������� ���� ������ ����������� � ������� ������, �� � �� ������, ��� ���� ���� �� ������ ���������, ������� � �������� �� ����� ����.
		AI_Output(self,other, "DIA_Greg_AboutGard_11_03");	//�� �������� ������� � ������, ����� ������� ������� � ����� �����, ��� ��� ������ � �������. � ���, ������ ���, ����� ������ �����!
		AI_Output(self,other, "DIA_Greg_AboutGard_11_04");	//�������, ����� �������, ��� � ���-�� �� ����� ������, � ���� ����� ����� ������� �� ������������, ���� �� ����� ����� ������.
		AI_Output(self,other, "DIA_Greg_AboutGard_11_05");	//���� ������ ���� ���� �����������, ���� ������ ���� �����. ������� ���� ���!
};

// ---------------------------------------------------
// "�� �������, ��� ������� ��� ���� ������?"	����� �����������, ����������	nr = 13
instance DIA_Greg_DontAfraidGard(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 13;
	condition = DIA_Greg_DontAfraidGard_condition;	
	information = DIA_Greg_DontAfraidGard_info;
	description = "�� �������, ��� ������� ��� ���� ������?";
	permanent = TRUE;
};
func int DIA_Greg_DontAfraidGard_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_AboutGard))
	{	return TRUE;	};
};
func void DIA_Greg_DontAfraidGard_info()
{	
	AI_Output(other,self, "DIA_Greg_DontAfraidGard_15_00");	//�� �������, ��� ������� ��� ���� ������?
		AI_Output(self,other, "DIA_Greg_DontAfraidGard_11_01");	//� ������� ������� �� ����� ����, ��� ��� ����� ������ �� �����.
};

// ---------------------------------------------------
// "�� ������ ����� �������..."	nr = 15
var int C_DIA_Greg_OurIdea_Know_AboutSue;
var int C_DIA_Greg_OurIdea_Know_AboutZedd;
var int C_DIA_Greg_OurIdea_Know_AboutSymon;
var int C_DIA_Greg_OurIdea_Know_AboutVales;
var int C_DIA_Greg_OurIdea_Know_AboutJoseph;
var int C_DIA_Greg_OurIdea_Know_WhatHappensToGard;
var int C_DIA_Greg_OurIdea_Know_AnyAdvice4me;

var int C_DIA_Greg_OurIdea_Tell_AboutJoseph;
var int C_DIA_Greg_OurIdea_Tell_AboutZedd;
var int C_DIA_Greg_OurIdea_Tell_AboutVales;
var int C_DIA_Greg_OurIdea_Tell_AboutSue;
var int C_DIA_Greg_OurIdea_Tell_AboutSymon;
const int C_DIA_Greg_OurIdea_Members = 0;

instance DIA_Greg_OurIdea(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 15;
	condition = DIA_Greg_OurIdea_condition;	
	information = DIA_Greg_OurIdea_info;
	description = "�� ������ ����� �������...";
	permanent = TRUE;
};
func int DIA_Greg_OurIdea_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_StartConspiracy) && (MIS_DS2P_Conspiracy == Log_Running) && Conspiracy_IsStarted == FALSE)
	{	return TRUE;	};
};
func void DIA_Greg_OurIdea_info()
{	
	AI_Output(other,self, "DIA_Greg_OurIdea_15_00");	//�� ������ ����� �������...
		AI_Output(self,other, "DIA_Greg_OurIdea_11_00");	//��? ���-�� �����?
	Info_ClearChoices(DIA_Greg_OurIdea);
	Info_AddChoice(DIA_Greg_OurIdea, "���, ������." , DIA_Greg_OurIdea_End);
	Info_AddChoice(DIA_Greg_OurIdea, "� ���� ���� ��������." , DIA_Greg_OurIdea_IveFewQuestions);
};
func void DIA_Greg_OurIdea_End()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_End_15_00");	//���, ������.
	AI_Output(self,other, "DIA_Greg_OurIdea_End_11_01");	//����� �� �������� ����.
	Info_ClearChoices(DIA_Greg_OurIdea);
};

func void B_DIA_Greg_OurIdea_IveFewQuestions()
{
	Info_ClearChoices(DIA_Greg_OurIdea);
	Info_AddChoice(DIA_Greg_OurIdea, "��� ���, ��� � ����� �����." , DIA_Greg_OurIdea_ThatsAll);
	
	if(!C_DIA_Greg_OurIdea_Know_AnyAdvice4me){
		Info_AddChoice(DIA_Greg_OurIdea, "���� ���� ������� ��� ����?" , DIA_Greg_OurIdea_TellMeAnyAdvice4me);
	};
	if(!C_DIA_Greg_OurIdea_Know_WhatHappensToGard){
		Info_AddChoice(DIA_Greg_OurIdea, "��� ����� � ������ ����� ����, ��� �� ��� �������?" , DIA_Greg_OurIdea_TellMeAboutGard);
	};	
	if(!C_DIA_Greg_OurIdea_Know_AboutVales){
		Info_AddChoice(DIA_Greg_OurIdea, "��� ���� �������� � ������?" , DIA_Greg_OurIdea_TellMeAboutVales);
	};	
	if(!C_DIA_Greg_OurIdea_Know_AboutZedd){
		Info_AddChoice(DIA_Greg_OurIdea, "��� ��� �������� � �������������� �����?" , DIA_Greg_OurIdea_TellMeAboutVales);
	};	
	if(!C_DIA_Greg_OurIdea_Know_AboutSymon){
		Info_AddChoice(DIA_Greg_OurIdea, "��� �������������� �������?" , DIA_Greg_OurIdea_TellMeAboutSymon);
	};
	if(!C_DIA_Greg_OurIdea_Know_AboutSue){
		Info_AddChoice(DIA_Greg_OurIdea, "�������� ��� � ���." , DIA_Greg_OurIdea_TellMeAboutSue);
	};
	if(!C_DIA_Greg_OurIdea_Know_AboutJoseph){
		Info_AddChoice(DIA_Greg_OurIdea, "��� �� ������ � �������?" , DIA_Greg_OurIdea_TellMeAboutJoseph);
	};
	if(Joseph_InConspiracy && !C_DIA_Greg_OurIdea_Tell_AboutJoseph)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "������ � ����." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(Vales_InConspiracy == TRUE && !C_DIA_Greg_OurIdea_Tell_AboutVales)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "� ������ ������." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(Zedd_InConspiracy && !C_DIA_Greg_OurIdea_Tell_AboutZedd)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "���� ����������� �� ����." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(SueBaby_InConspiracy && !C_DIA_Greg_OurIdea_Tell_AboutSue)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "������� ��� ���� � ����." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(Symon_InConspiracy && !C_DIA_Greg_OurIdea_Tell_AboutSymon)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "������ ������ �����." , DIA_Greg_OurIdea_JosephWithUs);
	};
	if(C_DIA_Greg_OurIdea_Members == 5)
	{
		Info_AddChoice(DIA_Greg_OurIdea, "� ������ ���� �������." , DIA_Greg_OurIdea_StartConspiracy);
	};
};

func void DIA_Greg_OurIdea_IveFewQuestions()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_IveFewQuestions_15_00");	//� ���� ���� � ���� ��������� ��������.
		AI_Output(self,other, "DIA_Greg_OurIdea_IveFewQuestions_11_01");	//�����, ������ ������!
	B_DIA_Greg_OurIdea_IveFewQuestions();	
};
func void DIA_Greg_OurIdea_ThatsAll()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_ThatsAll_15_00");	//��� ���, ��� � ����� �����.
		AI_Output(self,other, "DIA_Greg_OurIdea_ThatsAll_11_01");	//����� ���, ������ �������.
	Info_ClearChoices(DIA_Greg_OurIdea);
};
func void DIA_Greg_OurIdea_TellMeAnyAdvice4me()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_15_00");	//���� ���� ������� ��� ����?
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_01");	//����! ������, �� ��� ��� ��������� ���������!
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_15_02");	//�� �������� � ����� ���� ������.
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_03");	//�����, ���� ������� ������������� ��������. ������, ���������� ������� �������, ��� ����� ����������� �� �� ��������. ������ � ���� ���������, � ����� �� ������ ����� ������ �������� � ����� �������.
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_04");	//�������� ���������� ������� �� ���, ��� ���� � ������������ ��������, ��� ���������� ��� �������� ����� �������. �����?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_15_05");	//� �����������, � ��� ��������, ����������?
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_06");	//��-������, ��� ������ � ������� ����� ����� ������� �� �������, ��� �� ��������� � ������. � ��� ���� ���� ����� ������������ ���, � �� ���� ������ ������� ���. ��-������, �� �������� ��� �������, ������� �� ��������� ������ �����, ��������� ��� ��������� ������� ������.
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_07");	//� �� �����, ����� ���� ��� ������� ��������, �� ���������� �������� ���� ���������, � ����� ����� ������� � ������� �������. � ��� � ���� ������! ����� ����� ����� ����������� ��������� �� �����! 
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_08");	//������� ����� ������������ ������ ��������, � ��� ��� �����, ���� � �� �������� ��� �����. �� ������ ���-������ ����������� �� � ����� �������.
	AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_11_09");	//����� ������ �������, ���� �� �������� ���, ��� ���� ������ ������� ����� ���� � �����������, � ����� �������� ���� �� ���� ��������. ����?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAnyAdvice4me_15_10");	//� ��� �����.
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutGard()
{
	
};

func void DIA_Greg_OurIdea_TellMeAboutVales()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutVales_15_00");	//��� ���� �������� � ������?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutVales_11_00");	//��������. ���� ���������� ������� ������������ �������, ����� ���� ������� �� ���� �������. ������������, ��� ��� ��������, ��� ��� ��, ��� ����� ��������� �� �� �����. � ���.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutVales_15_01");	//�������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutVales_11_03");	//��� �������, �� ������ ����� ������ �� ����.
	C_DIA_Greg_OurIdea_Know_AboutVales = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutVales);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutZedd()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutZedd_15_00");	//��� ��� �������� � �������������� �����?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_00");	//(���������) ��� ����� ����� ������� ��� ����. ���� ���� � �������, �� �� ������������ � ������� �����, ��� ����� ��������� ������ � ������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_01");	//������� ���� �������� ��� ����� ������ ����������. ��������?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutZedd_15_01");	//��, �� ������ �����, ��� ���� ��� �������� ����������� ���������� ������� � ����� ������ � ������ ������������ ����?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_03");	//��, ��������� ���� �������! ��! ���� ������ ����� ��� ������� �����.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_04");	//�� ���������, ������� � ���� �� ���� � � ������� ��� �� ����� ������, � ���������.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutZedd_15_01");	//� �� �� �������, ��� ��� ����� ����� �������� ���-�� � ������� �������?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_03");	//���� ����� ��������� �������, ���� ������� ����� ��������� ���-�� ����� �� ����.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_04");	//������ ���� ����, ��� ������ ������. � ����� ��� ������������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_04");	//���, ��� ����� ��������� ��� ���. ���� �� �� � ������� ���-��, �� ������ ����� � �����, ����� ��� ������ ���� ����� �������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutZedd_11_04");	//���� � ���� � ������, ���� � ������� ��� � �� ������������. �������?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutZedd_15_01");	//������.
	
	C_DIA_Greg_OurIdea_Know_AboutZedd = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutZedd);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutSymon()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_00");	//��� �������������� �������?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_00");	//�� ����� �� ����������.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_01");	//��, �������� �������.
		AI_DrawWeapon(self);
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_01");	//�� �� ���-�� ���������?
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_02");	//(���������) ���, ��� ��.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_02");	//��� ���� ���� ����� �������...
		AI_RemoveWeapon(self);
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_03");	//����, �� ��� �� ������������? �������, �����, ����� ������, �� ��������� �������� �����.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_03");	//�������?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_04");	//������ ���, �� ������.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_04");	//�������?! ��� �� ���� ������! � ������� �������� ���?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_05");	//��, �� ����� ���� ���� ���� ����, �� ��� �� �����.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_05");	//�����������. ������ ���� ������ ������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_06");	//� �����, ������ ����� �� ������� ���, �������� �����. ��� ��� �������� ������� ��������� � ���, �� ��� ������ ��� ��� ��������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_07");	//������ �� ����� ������, �� ��� ����������� ��� �� ����� ��� ����� ����������� ��� �����������.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_06");	//�� ����������� ������� ���, ����� ������� ��� ������ ����������� � ��������?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_08");	//��, ������� � �������, �������� ���� ������ � ������ ���.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_07");	//�� ������ �� ������ �����. ������ �� ������ �� ���������� ����� ������?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_09");	//����� ���� ������ �� ������ ���������, �� �������� �� ���, �� ����-���� ��� � ���� � ��������� ������� � � ������� � �������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSymon_11_10");	//� ��� ��-�� ����� �������� ���� �����! �� �������� �� ���!..
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSymon_15_08");	//�����, � ��������, ��� ����� �������.
	
	C_DIA_Greg_OurIdea_Know_AboutSymon = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutSymon);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutSue()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSue_15_00");	//�������� ��� � ���.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_00");	//������, ������, �����������. �� �����, ����� �� �������� ��������. ����� ������� ������������, �������� ��� �������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_01");	//������� ��� ����� � ������������������ ��������. ��� ���������� ������, �������� �� ��������, �� ���� ���������� �������, ������� ������ ����������� ���� �� ����� ���������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_02");	//������� ��� ����� � �����, �, ����� ������� ���������� ������� ������������, ������ ���� � ������ �������� ����.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_03");	//��������� �� � ��� �������, �������, ��� ��� �� ������� ����� � ������� �������� ������ �� �����.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_04");	//�� �� ������: ��� ���� �������, � ������������ ��� �������������� � ���� � �������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_05");	//������� ����� ������� ����������� � �������� ������. ��� � �� ��� ���� ����� �����, ������� ������ ��� ��� ����� �����.
		
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSue_15_01");	//(���������) ����... � ��� �� ��������� ���������� �� �� ���� �������, ���� ��� ��� ����� �����?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_06");	//(���������) � � ����, ��� ������������ ����, � ������� �� ���� ��������, ����� � �������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_07");	//���� ��� � ������ ������� �� �������������� � ���, �� ������ ��.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSue_15_02");	//��: ����� ������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_09");	//�������. ���� ���� ���������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutSue_11_10");	//���, �������� �� ���� ���� ������� ��������, ��������� ���� ��������. �������� ������� �� ����.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutSue_15_03");	//������, � ��������, ��� ����� �������.
	
	C_DIA_Greg_OurIdea_Know_AboutSue = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutSue);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};
func void DIA_Greg_OurIdea_TellMeAboutJoseph()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutJoseph_15_00");	//��� �� ������ � �������?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_00");	//�������� ������, �����������. ����� �������� � ������ �� �����.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_01");	//� ��� ��������� ������� � ������� �����, � ��� ��� ����� �����, ��� �� ������� �������� �����-�� ������ �����.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_02");	//�� ���� ������� ���������, ��� ���� ������� �������, ������ �� ��������� ������.
	AI_Output(other,self, "DIA_Greg_OurIdea_TellMeAboutJoseph_15_01");	//(�����������) � �� �� ��������� ������� ��� � �� ������� ���?
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_03");	//(���������) ���, ������ �� ��������� �������������, � ������ � ���� � �� ������.
		AI_Output(self,other, "DIA_Greg_OurIdea_TellMeAboutJoseph_11_04");	//��� ���, ���� �� ������� ������ ��� � ��� ��������, �� �� ��� � ���������.
	
	C_DIA_Greg_OurIdea_Know_AboutJoseph = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_GregAboutJoseph);
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_JosephWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_JosephWithUs_15_00");	//������ � ����.
	AI_Output(self,other, "DIA_Greg_OurIdea_JosephWithUs_11_01");	//�������! ���-�� ���?
	C_DIA_Greg_OurIdea_Tell_AboutJoseph = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_ValesWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_ValesWithUs_15_00");	//� ������ ������.
	AI_Output(self,other, "DIA_Greg_OurIdea_ValesWithUs_11_01");	//����� ������, ��� ����� ��� �����������.
	AI_Output(other,self, "DIA_Greg_OurIdea_ValesWithUs_15_02");	//������ � ������ ���� ���� �������, �� ������� � ����������.
	AI_Output(self,other, "DIA_Greg_OurIdea_ValesWithUs_11_03");	//���? ����� ��� �������, ����� ���� � �����?!
	AI_Output(other,self, "DIA_Greg_OurIdea_ValesWithUs_15_05");	//����� ����������� �� ����� �������� � ����������.
	AI_Output(self,other, "DIA_Greg_OurIdea_ValesWithUs_11_06");	//��, � �����, ����� ������� �� ���� ������, ����� ��� ����������. ���-�� ���?
	C_DIA_Greg_OurIdea_Tell_AboutVales = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_ZeddWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_ZeddWithUs_15_00");	//���� ����������� �� ����.
	AI_Output(self,other, "DIA_Greg_OurIdea_ZeddWithUs_11_01");	//���, � ������� ������ ������� ������� �� ���� �������.
	AI_Output(other,self, "DIA_Greg_OurIdea_ZeddWithUs_15_02");	//��, ��������� ��� �� ����, ������ � ���� ��� ������.
	C_DIA_Greg_OurIdea_Tell_AboutZedd = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_SymonWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_SymonWithUs_15_00");	//������ ������ �����.
	AI_Output(self,other, "DIA_Greg_OurIdea_SymonWithUs_11_01");	//��� �, ���� ����� ������ ������ ��� �� ��������.
	C_DIA_Greg_OurIdea_Tell_AboutSymon = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_SueWithUs()
{
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_00");	//������� ��� ���� � ����.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_01");	//� ��� ����� �, ������ ������, �� ������. �����, �� �� ������� �� �������. ���, ��� ������.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_02");	//� ��� ���� ����� �����. ������ ��� ��������� �������, ������� ���� ����� ����� �������.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_03");	//������!
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_04");	//��� ���� ������� ����� ��������, ������� ����� �� ���� �������� ������ � �������� ���� �� ���� ��������. ����� ����������� ������� � ���� ������ ������� ��������, ��� ������ ������� ������� ����������� � ������� ��� �� ���. ������� ����� ���� ����� �����.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_05");	//���! ���� ����� �����������, ��� �� �� ������.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_06");	//������-�� ��� ���� ��� ����������. ��� ��� ����� ����� ��������� �����.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_07");	//�������, ����� ��� ����� �� ��������  ��������� ����.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_08");	//��� � ����� �� ����.
	C_DIA_Greg_OurIdea_Tell_AboutSue = TRUE;
	C_DIA_Greg_OurIdea_Members = C_DIA_Greg_OurIdea_Members + 1;
	B_DIA_Greg_OurIdea_IveFewQuestions();
};

func void DIA_Greg_OurIdea_StartConspiracy()
{
	B_DSG_StartConspiracy(); // �������� ��������
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_00");	//� ������ ���� �������. ��� ����������� �� ����.
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_01");	//�������! � � �� ���������� � ����� ������������ ��������� ����-�� �����. ���� ������ � ������� �������.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_02");	//������?
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_03");	//� ���� ������� ������ ����, ��������� ���� �� ��������� � ����� ��������, ������� � �� ���� �������� � ���� ���������, ����� �� ���������� ����������.
	AI_Output(other,self, "DIA_Greg_OurIdea_SueWithUs_15_04");	//��� ������?
	AI_Output(self,other, "DIA_Greg_OurIdea_SueWithUs_11_05");	//� ��� �������� � �������� ���. ��� ������ ���� ��� ������� ������� ��� �� �����? �������, ��������. ����� �� ����!
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,Log_Running,TOPIC_DS2P_Conspiracy_IsStarted);
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"TESTWP"); // UNFINISHED - ���� ������� ��������
	AI_StopProcessInfos(self);
};

instance DIA_Greg_BeginConspiracy(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 15;
	condition = DIA_Greg_BeginConspiracy_condition;	
	information = DIA_Greg_BeginConspiracy_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Greg_BeginConspiracy_condition()
{	
	if(Conspiracy_IsStarted && (Npc_GetDistToWP(self,"TESTWP") <= 600)) // UNFINISHED - ������� ��������
	{	
		return TRUE;	
	};
};

func void DIA_Greg_BeginConspiracy_info()
{
	TRIA_Start();
	TRIA_Invite(Gard);
	TRIA_Invite(SueBaby);
	TRIA_Invite(Ado);
	TRIA_Invite(Karah);
	TRIA_Invite(Symon);
	TRIA_Invite(Greg);
	TRIA_Next(Gard);
	AI_TurnToNpc(other,Gard);
	AI_TurnToNpc(SueBaby,Gard);
	AI_TurnToNpc(Ado,Gard);
	AI_TurnToNpc(Karah,Gard);
	AI_TurnToNpc(Symon,Gard);
	AI_TurnToNpc(Greg,Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_00");	//��� �� ���� ����� ����������?! ��� �� �������� �������?! ������ ��� �� ����� ������! ���!!! ������ ��������� �� �������������� �� �����, ����� ������ �������� ����������?!
	TRIA_Next(Ado);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_02_01");	//�������, � ��� ����� ��������.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_02");	//��� ��� �� ��������, ������ ��� ���� ����?!!
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_03");	//����! � ������� ����� ����, ����� �������, ��� �� ������ �� ������ ���� ����� ���������.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_04");	//��� �-�� �� ���� ���� ���������? �� ����� ������ ��������, �������? ��������!
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_05");	//��-�� ����� �������� �� �������� ����� ����� �� ���������� �������, ������ �������. ��� ��� ������� ������ ������, ��� �� ����� ��������� � ������!
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_06");	//��� ������ ������, ��� ���� ����? ��� ���. ��� � ��-�� ����� �������� ������ ������� ��� �������.
	TRIA_Next(Gard);
	AI_TurnToNpc(Gard,Vatras);
	AI_PlayAni(Gard,"T_POINT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_07");	//��� ��� �������, ����� �� ������� � ������ � ����, ����� ��� �������!
	Npc_StopAni(Gard,"T_POINT");
	AI_TurnToNpc(Gard,SueBaby);
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_08");	//�� ���� ��� �� ���, ��� �������� ������� ��� ����. �� ������, ����� �� ������� �������� ����� �����? � ���� � ��������� ������ � ���� ���� ������? ��� ���� ���� ��� � ��� ����, ����� ��� ����� ������ �� ������.
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_09");	//� ����� �� ����� ���� ���� � �������, ������� ����� ����� � ������ ���.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_10");	//������, �� ������� ������ � ������� �� ���, ���� ��� ��� ���! � �����, ��������� ����� ������, ����� �� ��������� ����� ������.
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_11");	//�����, ����. ��� ������� ������. �� �� ������ ����� �� ����� �����, ���� ����� �������. �� ����� �������� �� ��������� �� ���� ��������� ������� ������ ���� ��� �����, ������� � ������������� � ����� ����, ��� �������� ������ � ����������.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_12");	//��� ��� �� ����� ��������, ��� � ����������� �������.
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_13");	//� �� �������, ������� �� �������� �� ������ �� ������ ����������? ������� ���� �� ������ ����, ����, ��� ��� ������� �� ��� �� ��������?
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_14");	//(���������) ��� ���? � ��� �� �� ������ �������� �� ���� ��������?
	TRIA_Next(SueBaby);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_03_15");	//����! �� ���� ��������� �������, ������ ������� ���������.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_16");	//���� ���������� �������? ��� ���� �� ������! � ������ ��� ������ ��������� �� ����� ������, ���� � �� ���������� ��-����������. ������!!!
	TRIA_Next(Karah);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_17");	//����� �������, �������. ������ ��� ������� ������, �� �� ������ ��� �����. ������ ������ � ���� �� ���� � ���������� ��������� ��� ��� � ��������� ������ ��������. ��� ������?
	TRIA_Next(Ado);
	AI_PlayAni(Ado,"T_SLEESHOOT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_18");	//���, ���.
	TRIA_Next(Symon);
	AI_PlayAni(Symon,"T_SLEESHOOT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_05_19");	//�����.
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_20");	//��� �, ����� � � ����� ���� �����. ������, �������, ��� ��� ��� ��� ��� ����, �? ��� �������� ��� �� ������ � ������, � ��� �� ������ ��������� ����� ����� � ������ ���� ����� ������� �������?
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_21");	//��� �� ��� ���������� ��������� �� ��� �� �������� � ����� ��������� ������? ��� ����������� ����������� ������ ����� ����, ���������? ���, � ���������? � ��� ��� ��� ������ ���� ���������� �����?
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_22");	//�� �� �������� ������ � ���, ��� ��������� �� ��� �������!
	TRIA_Next(Greg);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_23");	//������ � � ����� ���-���. 
	AI_TurnToNpc(Ado,Greg);
	AI_TurnToNpc(other,Greg);
	AI_TurnToNpc(Gard,Greg);
	AI_TurnToNpc(Symon,Greg);
	AI_TurnToNpc(Zedd,Greg);
	AI_TurnToNpc(Vales,Greg);
	AI_TurnToNpc(Karah,Greg);
	if (!Npc_IsDead(GrayBeard))
	{
		AI_TurnToNpc(GrayBeard,Greg);
	};
	if (!Npc_IsDead(Jorn))
	{
		AI_TurnToNpc(Jorn,Greg);
	};
	AI_TurnToNpc(SueBaby,Greg);
	AI_TurnToNpc(Joseph,Greg);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_24");	//�� ��� ���� ������ �� ��� �� � �����, �� �� ������� �� ��� � ����� ����������� � ��������� ���-����� ���� ��������. ���, ��� ������ � ��������� ������ �� ������ ������, ���� ������������ �����, � ������ ��� �������, ��� ��� ������������ �������� ������� �������, ����� ������� ��� ������.
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_25");	//� ��� ���������. ����� ������� ��� ������, ���� ����� ���� ������ ���������� �������� ������, � ��� ����. ��� ���, ���� � ����� ���������, �� ������ ������ ��� ����� ���, ���� ���. 
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_26");	//�� ����� ������������� �� � �������� � ����� �������� ���������� �����.
	TRIA_Next(Karah);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_27");	//� ��� �� ��������� ������? �� �������� ���� ���� �������� �����.
	TRIA_Next(Greg);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_28");	//���� ����� �� ����� � �����, ��� ���� �� ����� � ������, � ������� ����������� ��� ����� �����. � ���� � ������, �� �� ��������. ��������� ������ � ����� �� �������, ��� ��������� �� ��������� ������ ������ � �������� � ������.
	AI_Output(self,other, "DIA_Greg_BeginConspiration_06_29");	//������� ��� ������ �������. �� ����� �������� ����� �� ������ � ����������� ������ �� ������ ��� �����.
	TRIA_Next(Karah);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_30");	//������� ��������, ����������. ������ ��� �� �������� ���� �����, ��� ����� �� ����� �����, � ���� ����� ������. ��, ��� ��� ���������� �����, ��� ����� �����������. ����, ��������� ���� �� �� ���, ��� �����, ����� ��������� ��������� ���� ����.
	AI_PlayAni(Ado,"T_SLESHOOT");
	AI_PlayAni(Karah,"T_SLESHOOT");
	if (!Npc_IsDead(GrayBeard))
	{
		AI_PlayAni(GrayBeard,"T_SLESHOOT");
	};
	if (!Npc_IsDead(Jorn))
	{
		AI_PlayAni(Jorn,"T_SLESHOOT");
	};
	AI_PlayAni(Gard,"T_SLESHOOT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_31");	//����, ������ ����������. ������ ��������� ���� ��, ��� �������, ��� ��� ����� ����� �������, ������� ����.
	AI_PlayAni(Greg,"T_SLESHOOT");
	AI_PlayAni(SueBaby,"T_SLESHOOT");
	AI_PlayAni(Symon,"T_SLESHOOT");
	AI_PlayAni(Joseph,"T_SLESHOOT");
	AI_PlayAni(Zedd,"T_SLESHOOT");
	AI_PlayAni(LanSkeleton,"T_SLESHOOT");
	//AI_PlayAni(Skip,"T_SLESHOOT");
	AI_Output(self,other, "DIA_Greg_BeginConspiration_04_32");	//����������� ������ �� ���� ������� �������� ��������. � ������������� � ������� ������� ����, ������ ��� � ������ ������ ������ ��������. ��� ������ �, ��������� ���������� �������. ���� �����������?
	TRIA_Next(Gard);
	AI_Output(self,other, "DIA_Greg_BeginConspiration_01_33");	//��, ���� ������, ����! ������, �������, ��� �� ��� ������ ���� �����, ������ �������������?! �� ������, � ��� �������, �� �������� ���, ��������, ��� ��� �� �������, ���� � ��������! � ������� ���� �� ��� �� ������, ����� �� �����������. ���������!
	TRIA_Finish();
	DIAG_Reset();
	B_Attack(Gard,SueBaby,AR_NONE,0);
	B_Attack(SueBaby,Gard,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------
//NS - 17/07/2013 ================================================
// �� ������ "���� ������"
//================================================================
// "������ ����� - ���� �� �������." +300���.			nr = 40
instance DIA_Greg_GaronBecomePirate(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 40;
	condition = DIA_Greg_GaronBecomePirate_condition;	
	information = DIA_Greg_GaronBecomePirate_info;
	description = "������ ����� � ���� �� �������.";
};
func int DIA_Greg_GaronBecomePirate_condition()
{	
	if(Garon_Choice == Garon_Choice_Pirate)
	{	return TRUE;	};
};
func void DIA_Greg_GaronBecomePirate_info()
{	
	var int x;
	AI_Output(other,self, "DIA_Greg_GaronBecomePirate_15_00");	//������ ����� � ���� �� �������.
		AI_Output(self,other, "DIA_Greg_GaronBecomePirate_11_01");	//��, � ���?
	AI_Output(other,self, "DIA_Greg_GaronBecomePirate_15_02");	//��� ���? ��� � ����� � �������� ����� �������.
		AI_Output(self,other, "DIA_Greg_GaronBecomePirate_11_03");	//��� ��?.. �����?
	AI_Output(other,self, "DIA_Greg_GaronBecomePirate_15_04");	//���� ����� ����� �� �����������, ��� ����� ������?
		AI_Output(self,other, "DIA_Greg_GaronBecomePirate_11_05");	//��, � ���� �� ����, �� ��� ��� ��� ��?
	AI_Output(other,self, "DIA_Greg_GaronBecomePirate_15_06");	//��� ���, ��� � ������ ���, � ����� ����� ��� ������� ���������� �����.
		AI_Output(self,other, "DIA_Greg_GaronBecomePirate_11_07");	//�����. ��� ������ �� ���� �����.
	//���� 300 �������.
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other, ItMi_Gold, 300);
	};

	//����� ����� ����� ������������� � ������ ������, ���� ��� �����
	var C_NPC Garon;	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
	CreateInvItem(Garon,ITAR_PIR_L_DS);
	CreateInvItem(Garon,ItMw_1H_Common_01);
	AI_EquipArmor(Garon,ITAR_PIR_L_DS);
	AI_EquipBestMeleeWeapon(Garon);
	B_StartOtherRoutine(Garon,"PIRAT");	
};

//"� ���� ���� ��� � ��� ���������.". ������������, ����� ������� � ����� ������� � ������������
// nr = 1

instance DIA_Greg_GrayBeardCompetition(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Greg_GrayBeardCompetition_condition;	
	information = DIA_Greg_GrayBeardCompetition_info;
	description = "� ���� ���� ��� � ��� ���������.";
};

func int DIA_Greg_GrayBeardCompetition_condition()
{	
	if(Garon_Choice == Garon_Choice_Pirate)
	{	
		return TRUE;	
	};
};

func void DIA_Greg_GrayBeardCompetition_info()
{
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_15_00");	//� ���� ���� ��� � ��� ���������.
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_11_01");	//������� �� �������������? � � ��� �� ���� �������� ��-�� ����� ��������� ��������� ������, ��� ��� ��������� �������� �� ������ ���������.
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_15_02");	//���, � ����, ����� �� ��� ������������ �� ����� � ����� ������� �������������.
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_11_03");	//�, ������ ����, �������� � �������? � � ���� �� �� 300 ������� �����.
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_15_04");	//���? ��� �� ������!
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_11_05");	//300 �����, ��� ����, 300. ��� ����� ������, �������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_04);
	AI_StopProcessInfos(self);
};

//"��� ������.". ������������, ���� �� ����� � ������������, ��������� ����� � ��� ��� ������ ��� 300 �������, � ��� 300 ������� � ���� ����
// nr = 1

instance DIA_Greg_GrayBeardCompetition_Gold(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Greg_GrayBeardCompetition_Gold_condition;	
	information = DIA_Greg_GrayBeardCompetition_Gold_info;
	description = "��� ������.";
};

func int DIA_Greg_GrayBeardCompetition_Gold_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition) && Npc_HasItems(other,ItMI_Gold) >= 300)
	{	
		return TRUE;	
	};
};

func void DIA_Greg_GrayBeardCompetition_Gold_info()
{
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_Gold_15_00");	//��� ������.
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_Gold_11_01");	//(�����) ����� ����!
	// ������ 300 ������� �����
	B_GiveInvItems(other,self,ItMi_Gold,300);
	AI_Output(self,other, "DIA_Greg_GrayBeardCompetition_Gold_11_02");	//����� ������. ����� ��������?
	AI_Output(other,self, "DIA_Greg_GrayBeardCompetition_Gold_15_03");	//������ �����. ����������� � ����� ������.
	// ������ ���������� ������ ��� ������������
	B_StartOtherRoutine(self,"GB_COMPETITION");
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_05);
	if (Npc_KnowsInfo(other,DIA_Symon_GrayBeardCompetition) && Npc_KnowsInfo(other,DIA_Karah_GrayBeardCompetition)) // ���� �� ��� ��������� ������� � ������
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_06);
	};
	AI_StopProcessInfos(self);
};

// �����������, ����� ��������� ������������
// nr = 1

instance DIA_Greg_AfterCompetition(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Greg_AfterCompetition_condition;	
	information = DIA_Greg_AfterCompetition_info;
	description = " ";
};

func int DIA_Greg_AfterCompetition_condition()
{	
	if(GB_CompetitionState > 9)
	{	
		return TRUE;	
	};
};

func void DIA_Greg_AfterCompetition_info()
{
	AI_Output(self,other, "DIA_Greg_AfterCompetition_11_00");	//��! ������, ������, ������ ���� ��������� ��������� ��� ������. ���� ����� ��� ���� ����� ���� � �� ������, � ���� ����������.
};

// �����������, ����� ����, ��� ���� ��� ���� �� ������ "�������"
// nr = 1

instance DIA_Greg_ConspiracyOver(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Greg_ConspiracyOver_condition;	
	information = DIA_Greg_ConspiracyOver_info;
	description = " ";
};

func int DIA_Greg_ConspiracyOver_condition()
{	
	if((Conspiracy_IsStarted == TRUE) && Npc_IsDead(Gard) && (MIS_DS2P_Conspiracy == Log_Running))
	{	
		return TRUE;	
	};
};

func void DIA_Greg_ConspiracyOver_info()
{
	AI_Output(self,other, "DIA_Greg_ConspiracyOver_11_00");	//(��������) � ������� ����������. � ��������� ����, � ���� �����, ��� ���� ����������� ������� ������ �� ��������. ��� ������ ��, ��� ��������� ����.
	AI_Output(other,self, "DIA_Greg_ConspiracyOver_15_01");	//��� � ����� ��������?
	AI_Output(self,other, "DIA_Greg_ConspiracyOver_11_02");	//��� � ������, � ������� ����� � ����� � �������� ������ ��������� ���� ������� � ��������, ����� ������ ���� ���������� � �� �, �� ��� ���� �� ����� ������� ���������, ���� ��� ��������. ����������?
	AI_Output(other,self, "DIA_Greg_ConspiracyOver_15_03");	//��, ������. � ����� ����: ���� �� �� �������� ���� �����, �� �� ������� ��������� ���������. � �� ���� ����������. ������.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Success,TOPIC_DS2P_Conspiracy_Success);
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,Log_Mission,Log_Running,TOPIC_DS2P_IslandUnderSiege_Conspiracy);
	B_GivePlayerXP(XP_MIS_DS2P_Conspiracy);
	AI_StopProcessInfos(self);
};
	
// �����������, ����� ����, ��� ���� ����� �����
// nr = 1

instance DIA_Greg_SkipIsDown(C_Info)
{
	npc = PIR_201_DS2P_Greg;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Greg_SkipIsDown_condition;	
	information = DIA_Greg_SkipIsDown_info;
	description = " ";
};

func int DIA_Greg_SkipIsDown_condition()
{	
	if(Skip_GregFight == TRUE)
	{	
		return TRUE;	
	};
};	

func void DIA_Greg_SkipIsDown_info()
{
	AI_Output(self,other, "DIA_Greg_SkipIsDown_11_00");	//��� ������, ��� ����� ����� �������������.
	AI_StopProcessInfos(self);
};
	
	