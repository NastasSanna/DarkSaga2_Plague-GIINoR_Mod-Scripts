/****************************************************************************************
                                  ЗАГАДКА С ЦВЕТАМИ
  На кладбище гоблинов. Нужно открыть 3 фиолетовых и три голубых цвета, чтобы получить
  синий и открыть мост.

*****************************************************************************************/

const int PUZZLE_COLOR_RED = 1;
const int PUZZLE_COLOR_YELLOW = 2;
const int PUZZLE_COLOR_AZURE = 3;
const int PUZZLE_COLOR_VIOLET = 4;

const int PUZZLE_COLOR_ORDER[24] = {
	PUZZLE_COLOR_RED, PUZZLE_COLOR_AZURE, PUZZLE_COLOR_VIOLET, PUZZLE_COLOR_YELLOW,  //0
	PUZZLE_COLOR_YELLOW, PUZZLE_COLOR_VIOLET, PUZZLE_COLOR_RED, PUZZLE_COLOR_AZURE,  //1
	PUZZLE_COLOR_RED, PUZZLE_COLOR_YELLOW, PUZZLE_COLOR_AZURE, PUZZLE_COLOR_VIOLET,  //2
	PUZZLE_COLOR_YELLOW,  PUZZLE_COLOR_RED, PUZZLE_COLOR_AZURE,PUZZLE_COLOR_VIOLET,  //3
	PUZZLE_COLOR_AZURE, PUZZLE_COLOR_RED, PUZZLE_COLOR_VIOLET, PUZZLE_COLOR_YELLOW,  //4
	PUZZLE_COLOR_VIOLET, PUZZLE_COLOR_YELLOW, PUZZLE_COLOR_AZURE, PUZZLE_COLOR_RED   //5
};

var int PUZZLE_COLOR_CURRENT_POS[6];

func int PUZZLE_COLOR_GetCurrentColor(var int number)
{
	var int i; i= MEM_ReadStatArr(PUZZLE_COLOR_CURRENT_POS, number);
	var int j; j = MEM_ReadStatArr(PUZZLE_COLOR_ORDER, number * 4 + i);
	return j;
};

// переключаем все "лепестки" указанного цвета
func void EVT_COLOR_PUZZLE_SWITCH(var int color)
{
	var int activeViolet; activeViolet = 0;
	var int activeAzure; activeAzure = 0;
	var int currentColor;
	// проверяем первый "лепесток"
	if (PUZZLE_COLOR_GetCurrentColor(0) == color) {
		// следующий цвет
		PUZZLE_COLOR_CURRENT_POS[0] = (PUZZLE_COLOR_CURRENT_POS[0] + 1) % 4;
		Wld_SendTrigger("NEXT_PUZZLE_COLORS_00");
	};
	// если нужный - считаем
	currentColor = PUZZLE_COLOR_GetCurrentColor(0);
	if (currentColor == PUZZLE_COLOR_AZURE) {
		activeAzure += 1;
	}
	else if (currentColor == PUZZLE_COLOR_VIOLET) {
		activeViolet += 1;
	};
	
	// второй "лепесток"
	if (PUZZLE_COLOR_GetCurrentColor(1) == color) {
		PUZZLE_COLOR_CURRENT_POS[1] = (PUZZLE_COLOR_CURRENT_POS[1] + 1) % 4;
		Wld_SendTrigger("NEXT_PUZZLE_COLORS_01");
	};
	currentColor = PUZZLE_COLOR_GetCurrentColor(1);
	if (currentColor == PUZZLE_COLOR_AZURE) {
		activeAzure += 1;
	}
	else if (currentColor == PUZZLE_COLOR_VIOLET) {
		activeViolet += 1;
	};
	
	// третий "лепесток"
	if (PUZZLE_COLOR_GetCurrentColor(2) == color) {
		PUZZLE_COLOR_CURRENT_POS[2] = (PUZZLE_COLOR_CURRENT_POS[2] + 1) % 4;
		Wld_SendTrigger("NEXT_PUZZLE_COLORS_02");
	};
	currentColor = PUZZLE_COLOR_GetCurrentColor(2);
	if (currentColor == PUZZLE_COLOR_AZURE) {
		activeAzure += 1;
	}
	else if (currentColor == PUZZLE_COLOR_VIOLET) {
		activeViolet += 1;
	};
		
	// четвертый "лепесток"
	if (PUZZLE_COLOR_GetCurrentColor(3) == color) {
		PUZZLE_COLOR_CURRENT_POS[3] = (PUZZLE_COLOR_CURRENT_POS[3] + 1) % 4;
		Wld_SendTrigger("NEXT_PUZZLE_COLORS_03");
	};
	currentColor = PUZZLE_COLOR_GetCurrentColor(3);
	if (currentColor == PUZZLE_COLOR_AZURE) {
		activeAzure += 1;
	}
	else if (currentColor == PUZZLE_COLOR_VIOLET) {
		activeViolet += 1;
	};
	
	// пятый "лепесток"
	if (PUZZLE_COLOR_GetCurrentColor(4) == color) {
		PUZZLE_COLOR_CURRENT_POS[4] = (PUZZLE_COLOR_CURRENT_POS[4] + 1) % 4;
		Wld_SendTrigger("NEXT_PUZZLE_COLORS_04");
	};
	currentColor = PUZZLE_COLOR_GetCurrentColor(4);
	if (currentColor == PUZZLE_COLOR_AZURE) {
		activeAzure += 1;
	}
	else if (currentColor == PUZZLE_COLOR_VIOLET) {
		activeViolet += 1;
	};
	
	// шестой "лепесток"
	if (PUZZLE_COLOR_GetCurrentColor(5) == color) {
		PUZZLE_COLOR_CURRENT_POS[5] = (PUZZLE_COLOR_CURRENT_POS[5] + 1) % 4;
		Wld_SendTrigger("NEXT_PUZZLE_COLORS_05");
	};
	currentColor = PUZZLE_COLOR_GetCurrentColor(5);
	if (currentColor == PUZZLE_COLOR_AZURE) {
		activeAzure += 1;
	}
	else if (currentColor == PUZZLE_COLOR_VIOLET) {
		activeViolet += 1;
	};
	
	var string txt1; txt1 = IntToString(activeViolet);
	var string txt2; txt2 = IntToString(activeAzure);
	MEM_Debug(CS3(txt1, ":", txt2));
	
	// три фиолетовых и три голубых - загадка решена!
	if (activeViolet == 3 && activeAzure == 3) {
		// UNFINISHED
		Wld_SendTrigger("TRGLST_GOBBOCAVES_LIFT");
	};
};

func void EVT_COLOR_PUZZLE_SWITCH_RED()
{
	EVT_COLOR_PUZZLE_SWITCH(PUZZLE_COLOR_RED);
};

func void EVT_COLOR_PUZZLE_SWITCH_YELLOW()
{
	EVT_COLOR_PUZZLE_SWITCH(PUZZLE_COLOR_YELLOW);
};

func void EVT_COLOR_PUZZLE_SWITCH_AZURE()
{
	EVT_COLOR_PUZZLE_SWITCH(PUZZLE_COLOR_AZURE);
};

func void EVT_COLOR_PUZZLE_SWITCH_VIOLET()
{
	EVT_COLOR_PUZZLE_SWITCH(PUZZLE_COLOR_VIOLET);
};
