// ����������� ��� ��������� �� ������� "��� ����"


instance DIA_LanSkeleton_SK_Dream(C_Info)
{
	npc = PIR_2071_DS2P_LanSkeleton_SK_Dream;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_LanSkeleton_SK_Dream_condition;	
	information = DIA_LanSkeleton_SK_Dream_info;
	description = " ";
};

func int DIA_LanSkeleton_SK_Dream_condition()
{	
	return TRUE;
};

func void DIA_LanSkeleton_SK_Dream_info()
{
	AI_Output(self,other,"DIA_LanSkeleton_SK_Dream_13_00");	//���, ��� ���� �������? ������?
	AI_Output(other,self,"DIA_LanSkeleton_SK_Dream_15_01");	//��������� � ���� �����. ������ �������?
	AI_Output(self,other,"DIA_LanSkeleton_SK_Dream_13_02");	//�� ���� ��������. ��� ������ ������� � ���� ��������� ���������, ����� �� ���� �������. ������� ����� �������.
	AI_Output(other,self,"DIA_LanSkeleton_SK_Dream_15_03");	//�����, ����� ����� ���� �����������? � ��� ����� ��������� ���� �����. �� ������?
	AI_Output(self,other,"DIA_LanSkeleton_SK_Dream_13_04");	//�, �����! ������ ��, ��� ����� �������.
	AI_Output(other,self,"DIA_LanSkeleton_SK_Dream_15_05");	//��, �� ����� �����.
	AI_Output(self,other,"DIA_LanSkeleton_SK_Dream_13_06");	//��� �, ���� �� ��� ������� �������.
	B_Attack(self,other,AR_NONE,0); // ������-��� �������� �� ��
	AI_StopProcessInfos(self);
};
	

// �����������, ���� ����� �������-����, � ������� ����� � ������


instance DIA_LanSkeleton_HM_Dream(C_Info)
{
	npc = PIR_2072_DS2P_LanSkeleton_HM_Dream;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_LanSkeleton_HM_Dream_condition;	
	information = DIA_LanSkeleton_HM_Dream_info;
	description = " ";
};

func int DIA_LanSkeleton_HM_Dream_condition()
{
	if (Npc_IsDead(PIR_2071_DS2P_LanSkeleton_SK_Dream) && (LansDream_CageIsOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_LanSkeleton_HM_Dream_info()
{
	AI_Output(self,other,"DIA_LanSkeleton_HM_Dream_13_00");	//��, ������� ����, �� ���� ����.
	AI_Output(other,self,"DIA_LanSkeleton_HM_Dream_15_01");	//����������!!!
	// ��� ���� ������� ������� �������
	AI_StopProcessInfos(self);
};
	