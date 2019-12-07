//
///////----------------ВЫБОР СЛОЖНОСТИ-----------------------
//
instance PC_ComplexityLevel(C_Info)
{
	npc = PC_Hero;
	condition = PC_ComplexityLevel_Condition;
	information = PC_ComplexityLevel_Info;
	permanent = FALSE;
	description = "Выбор сложности.";
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
	Info_AddChoice(PC_ComplexityLevel,"Легкий",PC_ComplexityLevel_L);
	Info_AddChoice(PC_ComplexityLevel,"Средний (~ как в v.1.0.0.4)",PC_ComplexityLevel_M);
	Info_AddChoice(PC_ComplexityLevel,"Сложный (~ как в v.1.0.0.0)",PC_ComplexityLevel_H);
};
func void PC_ComplexityLevel_L()
{
	Print("Выбран уровень сложности: Легкий.");
	ComplexityLevel = Light;
	ComplexityLevel_Procent = Light_L;
	Info_ClearChoices(PC_ComplexityLevel);
	b_endproductiondialog();
};
func void PC_ComplexityLevel_M()
{
	Print("Выбран уровень сложности: Средний.");
	ComplexityLevel = Medium;
	ComplexityLevel_Procent = 0;
	Info_ClearChoices(PC_ComplexityLevel);
	b_endproductiondialog();
};
func void PC_ComplexityLevel_H()
{
	Print("Выбран уровень сложности: Сложный.");
	ComplexityLevel = Hard;
	ComplexityLevel_Procent = Hard_H;
	Info_ClearChoices(PC_ComplexityLevel);
	b_endproductiondialog();
};
