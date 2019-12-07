//
///////----------------����� ���������-----------------------
//
instance PC_ComplexityLevel(C_Info)
{
	npc = PC_Hero;
	condition = PC_ComplexityLevel_Condition;
	information = PC_ComplexityLevel_Info;
	permanent = FALSE;
	description = "����� ���������.";
};
func int PC_ComplexityLevel_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_ComplexityLevel)
	{
		return TRUE;
	};
};

func void PC_ComplexityLevel_Info()
{
	Info_ClearChoices(PC_ComplexityLevel);
	Info_AddChoice(PC_ComplexityLevel,"������",PC_ComplexityLevel_L);
	Info_AddChoice(PC_ComplexityLevel,"������� (~ ��� � v.1.0.0.4)",PC_ComplexityLevel_M);
	Info_AddChoice(PC_ComplexityLevel,"������� (~ ��� � v.1.0.0.0)",PC_ComplexityLevel_H);
};
func void PC_ComplexityLevel_L()
{
	Print("������ ������� ���������: ������.");
	ComplexityLevel = Light;
	ComplexityLevel_Procent = Light_L;
	Info_ClearChoices(PC_ComplexityLevel);
	b_endproductiondialog();
};
func void PC_ComplexityLevel_M()
{
	Print("������ ������� ���������: �������.");
	ComplexityLevel = Medium;
	ComplexityLevel_Procent = 0;
	Info_ClearChoices(PC_ComplexityLevel);
	b_endproductiondialog();
};
func void PC_ComplexityLevel_H()
{
	Print("������ ������� ���������: �������.");
	ComplexityLevel = Hard;
	ComplexityLevel_Procent = Hard_H;
	Info_ClearChoices(PC_ComplexityLevel);
	b_endproductiondialog();
};
