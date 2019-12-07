/**************************************************************************

							РЕЦЕПТЫ ЗЕЛИЙ
   
  Свитки и книги с рецептами. Что-то можно переключить на книжные стенды.
  
  Цена за рецепт взяты как удвоенная цена зелья.
  Зелья восстановления и скорости типовые. Рецепты перманентов и новых
зелий в текстурах. 3 зелья в книгах.
  
 //* NS - фев. 2013
  
***************************************************************************/

const int Value_Recipe_Health_01	= 100;
const int Value_Recipe_Health_02	= 200;
const int Value_Recipe_Health_03	= 400;
const int Value_Recipe_Mana_01		= 100;
const int Value_Recipe_Mana_02		= 200;
const int Value_Recipe_Mana_03		= 400;
const int Value_Recipe_Speed		= 300;

const int Value_Recipe_Perm_Dex		= 2000;
const int Value_Recipe_Perm_Str		= 2000;
const int Value_Recipe_Perm_Health	= 2000;
const int Value_Recipe_Perm_Mana	= 2000;

const int Value_Recipe_TinkturDex_wenig		= 600;
const int Value_Recipe_TinkturDex_besondere	= 900;
const int Value_Recipe_TinkturStr_wenig		= 600;
const int Value_Recipe_TinkturStr_besondere	= 900;

const int Value_Textbook_Botje_01	= 250;
const int Value_Textbook_Botje_02	= 250;
const int Value_TextBook_TinkturStr_wenig	= 200;

const int Value_Recipe_Booze_BullSeed	= 100;
const int Value_Recipe_Booze_GobboSmile	= 100;
const int Value_Recipe_Booze_Berserker	= 100;
const int Value_Recipe_Booze_TrollBooze	= 100;
const int Value_Recipe_Booze_MagicGrog	= 100;
const int Value_Recipe_Booze_Kamikaze	= 100;


// ПРОТОТИП =============================================

prototype P_ITWr_DSG_Recipe(C_Item)
{
	name = "Рецепт зелья";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	text[5] = NAME_Value;
};

// КЛАССИКА =============================================

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Health_01(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Health_01;
	on_state[0] = Use_Recipe_Health_01;
	description = "Лечебная эссенция";
	count[5] = value;
};
func void Use_Recipe_Health_01()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления ЛЕЧЕБНОЙ ЭССЕНЦИИ требуется 2 лечебных травы и 1 луговой горец. Эссенция готовится путем выпаривания.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"   ЛЕЧЕБНАЯ ЭССЕНЦИЯ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ингредиенты:");
	Doc_PrintLines(nDocID,0,"2 лечебных травы");
	Doc_PrintLines(nDocID,0,"1 луговой горец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Измельченные травы соединяются с водой и выпариваются на медленном огне до получения ярко-красного зелья.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Health_02(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Health_02;
	on_state[0] = Use_Recipe_Health_02;
	description = "Лечебный экстракт";
	count[5] = value;
};
func void Use_Recipe_Health_02()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления ЛЕЧЕБНОГО ЭКСТРАКТА требуется 2 лечебных растения и 1 луговой горец. Экстракт готовится путем вытяжки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,70,1);
	Doc_PrintLine(nDocID,0,"   ЛЕЧЕБНЫЙ ЭКСТРАКТ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ингредиенты:");
	Doc_PrintLines(nDocID,0,"2 лечебных растения");
	Doc_PrintLines(nDocID,0,"1 луговой горец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Экстракт можно приготовить с помощью вытяжки. Зелье должно иметь ярко-красный оттенок.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Health_03(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Health_03;
	on_state[0] = Use_Recipe_Health_03;
	description = "Лечебный эликсир";
	count[5] = value;
};
func void Use_Recipe_Health_03()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления ЛЕЧЕБНОГО ЭЛИКСИРА требуется 2 лечебных корня и 1 луговой горец. Эликсир готовится путем перегонки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_PrintLine(nDocID,0,"    ЛЕЧЕБНЫЙ ЭЛИКСИР");
	Doc_PrintLine(nDocID,0,"    ----------------------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ингредиенты:");
	Doc_PrintLines(nDocID,0,"2 лечебных корня");
	Doc_PrintLines(nDocID,0,"1 луговой горец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Эликсир получают с помощью перегонки суспензии из растертых растений.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Mana_01(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Mana_01;
	on_state[0] = Use_Recipe_Mana_01;
	description = "Эссенция маны";
	count[5] = value;
};
func void Use_Recipe_Mana_01()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления ЭССЕНЦИИ МАНЫ требуется 2 огненных крапивы и 1 луговой горец. Эссенция готовится путем выпаривания.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_PrintLine(nDocID,0,"      ~ Эссенция маны ~");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ингредиенты:");
	Doc_PrintLines(nDocID,0,"2 огненных крапивы");
	Doc_PrintLines(nDocID,0,"1 луговой горец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Подготовленный раствор выпаривать на медленном огне до получения насыщенного синего оттенка зелья.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Mana_02(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Mana_02;
	on_state[0] = Use_Recipe_Mana_02;
	description = "Экстракт маны";
	count[5] = value;
};
func void Use_Recipe_Mana_02()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления ЭКСТРАКТА МАНЫ требуется 2 огненных травы и 1 луговой горец. Экстракт готовится путем вытяжки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,80,80,80,80,1);
	Doc_PrintLine(nDocID,0,"     ЭКСТРАКТ МАНЫ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ингредиенты:");
	Doc_PrintLine(nDocID,0,"2 огненных травы");
	Doc_PrintLine(nDocID,0,"1 луговой горец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Зелье получают путем вытяжки до получения раствора интенсивного синего цвета.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Mana_03(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Mana_03;
	on_state[0] = Use_Recipe_Mana_03;
	description = "Эликсир маны";
	count[5] = value;
};
func void Use_Recipe_Mana_03()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления ЭЛИКСИРА МАНЫ требуется 2 огненных корня и 1 луговой горец. Эликсир готовится путем перегонки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_PrintLine(nDocID,0,"      ЭЛИКСИР МАНЫ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ингредиенты:");
	Doc_PrintLines(nDocID,0,"2 огненных корня");
	Doc_PrintLines(nDocID,0,"1 луговой горец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Подготовить из ингредиентов суспензию и пропустить ее через перегонный аппарат.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Speed(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Speed;
	on_state[0] = Use_Recipe_Speed;
	description = "Зелье ускорения";
	count[5] = value;
};
func void Use_Recipe_Speed()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Зелья УСКОРЕНИЯ временно повышает скорость. Ингредиенты: 1 снеппер-трава, 1 луговой горец. Готовится путем выжимки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,60,70,60,70,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Зелье на основе снеппер-травы позволяет на некоторое время повысить скорость человека. Продолжительность эффекта во многом определяется мастерством алхимика.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"ВНИМАНИЕ!");
	Doc_PrintLines(nDocID,0,"Зелье можно приготовить только путем выжимки.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Снеппер-траву разбирают на листья и режут вдоль волокон, один луговой горец измельчают и заливают водой. Смесь несколько раз сильно встряхивают и сразу же выжимают. Готовое зелье необходимо хранить в темноте не более полугода.");
	Doc_Show(nDocID);
};

// ПЕРМАНЕНТЫ ===========================================

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Perm_Dex(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Perm_Dex;
	on_state[0] = Use_Recipe_Perm_Dex;
	description = "Зелье ловкости";
	count[5] = value;
};
func void Use_Recipe_Perm_Dex()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления зелья ЛОВКОСТИ требуется 1 ягода гоблина и 1 царский щавель. Необходимо знать, как обработать царский щавель.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_Perm_Dex.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_BigBlob.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Big);
	Doc_SetMargins(nDocID,-1,90,60,80,70,1);
	Doc_PrintLine(nDocID,0,"     ЗЕЛЬЕ ЛОВКОСТИ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ингредиенты:");
	Doc_PrintLines(nDocID,0,"1 ягода гоблина");
	Doc_PrintLines(nDocID,0,"1 царский щавель");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Подготовить царский щавель и залить кипящей водой. Когда немного остынет добавить ягоду гоблина и плотно закупорить. После полного остывания зелья ягода извлекается.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Perm_Str(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Perm_Str;
	on_state[0] = Use_Recipe_Perm_Str;
	description = "Зелье силы";
	count[5] = value;
};
func void Use_Recipe_Perm_Str()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления зелья СИЛЫ требуется 1 драконий корень и 1 царский щавель. Необходимо знать, как обработать царский щавель.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_Perm_Str.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_White.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Big);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_PrintLine(nDocID,0,"         ЗЕЛЬЕ СИЛЫ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Повышающее силу зелье готовится из штуки царского щавеля и штуки драконьего корня. Царский щавель обрабатывается как обычно. Драконий корень следует слегка опалить. Кипятить не размешивая. Готовое зелье требуется отфильтровать.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Perm_Health(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Perm_Health;
	on_state[0] = Use_Recipe_Perm_Health;
	description = "Зелье жизни";
	count[5] = value;
};
func void Use_Recipe_Perm_Health()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления зелья ЖИЗНИ требуется 1 лечебный корень и 1 царский щавель. Необходимо знать, как обработать царский щавель.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_Perm_Health.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_Perm_Health.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Big);
	Doc_SetMargins(nDocID,-1,90,70,80,60,1);
	Doc_PrintLine(nDocID,0,"       Зелье ЖИЗНИ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"      Царский щавель");
	Doc_PrintLine(nDocID,0,"      Лечебный корень");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Обработанный царский щавель соединить с лечебным корнем и быстро вскипятить на сильном огне. Снять с огня при появлении первых пузырьков.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Perm_Mana(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Perm_Mana;
	on_state[0] = Use_Recipe_Perm_Mana;
	description = "Зелье духа";
	count[5] = value;
};
func void Use_Recipe_Perm_Mana()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"Для приготовления зелья ДУХА требуется 1 огненный корень и 1 царский щавель. Необходимо знать, как обработать царский щавель.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_Perm_Mana.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_BlueBottom.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Big);
	Doc_SetMargins(nDocID,-1,85,100,85,100,1);
	Doc_PrintLine(nDocID,0,"       ЗЕЛЬЕ ДУХА");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Подготовить 1 царский щавель. Огненный корень слегка размять, чтобы он выделил сок. Соединить и довести до кипения. Снять образовавшуюся пену.");
	Doc_PrintLines(nDocID,0,"Зелье не должно быть мутным!");
	Doc_Show(nDocID);
};

// НОВЫЕ ЗЕЛЬЯ ==========================================

// ------------------------------------------------------
instance ITWr_DSG_Recipe_TinkturDex_wenig(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_TinkturDex_wenig;
	on_state[0] = Use_Recipe_TinkturDex_wenig;
	description = "Настойка охотника";
	count[5] = value;
};
func void Use_Recipe_TinkturDex_wenig()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_wenig] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_wenig] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"НАСТОЙКА ОХОТНИКА временно повышает ловкость. Ингредиенты: 1 еловый гриб и 1 пустырник. Готовится путем выжимки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_TinkturDex_wenig.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_Wave.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,50,40,60,40,1);
	Doc_PrintLine(nDocID,0,"    НАСТОЙКА ОХОТНИКА");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Еловый гриб, ядовитый сам по себе, используется как ингредиент для приготовления различных снадобий. Яд елового гриба эффективно нейтрализуется настойкой пустырника. Пустырник подготавливают заранее, настояв измельченное растение в холодной воде. Еловый гриб разрезают пополам, заливают настойкой и сильно встряхивают в течение 5-10 минут. Затем гриб извлекают и отжимают. Выделяющийся сок должен быть прозрачным, и ни в коем случае не черным. Противное означает, что яд гриба не был полностью нейтрализован.");
	Doc_PrintLines(nDocID,0,"Полученная настойка используется в основном охотниками, поскольку позволяет на некоторое время повысить ловкость.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_TinkturDex_besondere(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_TinkturDex_besondere;
	on_state[0] = Use_Recipe_TinkturDex_besondere;
	description = "Особая настойка охотника";
	count[5] = value;
};
func void Use_Recipe_TinkturDex_besondere()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_besondere] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_besondere] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"ОСОБАЯ НАСТОЙКА ОХОТНИКА временно повышает ловкость. Ингредиенты: 1 каменный корень, 1 пустырник. Готовится путем выжимки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_TinkturDex_besondere.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_Scroll.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,40,70,40,1);
	Doc_PrintLines(nDocID,0," ”Особая настойка охотника” позволяет на небольшой период времени значительно повысить ловкость человека. Настойка готовится из каменного корня, сухого и абсолютно бесполезного в чистом виде. Для приготовления настойки каменный корень замачивают вместе с пустырником. Когда корень разбухнет (он должен увеличиться и стать мягким), его нужно нарезать и отжать. ");
	Doc_PrintLines(nDocID,0," Каменный корень способен расти на голых каменистых склонах, осыпях, в узких расщелинах и на обрывах. При соборе каменного корня рекомендуется обрезать его посередине, тогда из оставшейся половины на будущий год появится новое растение.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_TinkturStr_wenig(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_TinkturStr_wenig;
	on_state[0] = Use_Recipe_TinkturStr_wenig;
	description = "Настойка воина";
	count[5] = value;
};
func void Use_Recipe_TinkturStr_wenig()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_wenig] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_wenig] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"НАСТОЙКА ВОИНА временно повышает силу. Ингредиенты: 1 древесный мох, 1 пустырник. Готовится путем выжимки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_TinkturStr_wenig.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_Half.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Small);
	Doc_SetMargins(nDocID,-1,70,70,70,60,1);
	Doc_PrintLine(nDocID,0,"            НАСТОЙКА ВОИНА");
	Doc_PrintLines(nDocID,0,"Свежий или высушенный древесный мох соединить с измельченным растением пустырника и залить чистой родниковой водой. Настоять непродолжительное время, избегая воздействия тепла и солнечных лучей. Тщательно выжать смесь для получения наилучшего эффекта.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_TinkturStr_besondere(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_TinkturStr_besondere;
	on_state[0] = Use_Recipe_TinkturStr_besondere;
	description = "Особая настойка воина";
	count[5] = value;
};
func void Use_Recipe_TinkturStr_besondere()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_besondere] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_besondere] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"ОСОБАЯ НАСТОЙКА ВОИНА временно повышает силу. Ингредиенты: 1 таирис, 1 пустырник. Готовится путем выжимки.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_TinkturStr_besondere.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_SmallBlob.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,100,80,100,70,1);
	Doc_PrintLine(nDocID,0,"  Особая настойка воина");
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0," Наряду с довольно известной ”Настойкой воина”, существует ”Особая настойка воина”, обладающая куда более сильным эффектом.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0," Для ее приготовления используется растение таирис, а также пустырник. По одному растению объединяется с мерой воды и настаивается в покое в темном и прохладном месте. Чем вода холоднее и чище, тем лучше получится настой.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0," Готовое зелье получают путем выжимки настоя.");
	Doc_Show(nDocID);
};

// КНИГИ С РЕЦЕПТАМИ ====================================

// каждая часть книги содержит 1 рецепт
prototype P_ITWr_DSG_Textbook_Botje(C_ITEM)
{
	name = "Наследие алхимика Ботье";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	visual = "ItWr_Book_02_03.3ds";	//красная книга
	material = MAT_LEATHER;
	scemeName = "MAP";
	text[2] = "Книга разорвана пополам.";
	text[5] = NAME_Value;
};

// ------------------------------------------------------
instance ITWr_DSG_Textbook_Botje_01(P_ITWr_DSG_Textbook_Botje)
{
	value = Value_Textbook_Botje_01;
	on_state[0] = Use_Textbook_Botje_01;
	description = "Наследие алхимика Ботье (начало)";
	text[3] = "Второй половины нет.";
	count[5] = value;
};
func void Use_Textbook_Botje_01()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/* BOOK PICTURE
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"TextBook_Botje_part1.TGA",0);
	Doc_Show(nDocID);
	/*/
	Read_Book = Read_Book_Botje_01;
	Read_Book_Page = 0;
	Read_Book_nDocID = Doc_Create();
	Doc_Show(Read_Book_nDocID);
	AI_ProcessInfos(self);
	//*/
};

// ------------------------------------------------------
instance ITWr_DSG_Textbook_Botje_02(P_ITWr_DSG_Textbook_Botje)
{
	value = Value_Textbook_Botje_02;
	on_state[0] = Use_Textbook_Botje_02;
	description = "Наследие алхимика Ботье (конец)";
	text[3] = "Первой половины нет.";
	count[5] = value;
};
func void Use_Textbook_Botje_02()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/* BOOK PICTURE
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"TextBook_Botje_part2.TGA",0);
	Doc_Show(nDocID);
	/*/
	Read_Book = Read_Book_Botje_02;
	Read_Book_Page = 0;
	Read_Book_nDocID = Doc_Create();
	Doc_Show(Read_Book_nDocID);
	AI_ProcessInfos(self);
	//*/
};

// ------------------------------------------------------
// из книги выпадает листок с рецептом зелья
instance ITWr_DSG_TextBook_TinkturStr_wenig(C_ITEM)
{
	name = "Падение Трасилия";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = Value_TextBook_TinkturStr_wenig;
	visual = "ItWr_Book_02_02.3ds";	//коричневая книга
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TextBook_TinkturStr_wenig;
	description = "Падение Трасилия";
	text[5] = NAME_Value;			count[5] = value;
};

var int TinkturStr_wenig_GivenOnce;
func void Use_TextBook_TinkturStr_wenig()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(TinkturStr_wenig_GivenOnce == FALSE)
	{
		TinkturStr_wenig_GivenOnce = TRUE;
		Snd_Play("LogEntry");
		B_PlayerFindItem(ITWr_DSG_Recipe_TinkturStr_wenig, 1);
	};
	/* BOOK PICTURE
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,-1,"TextBook_TinkturStr_wenig.TGA",0);
	Doc_Show(nDocID);
	/*/
	Read_Book = Read_Book_TinkturStr_wenig;
	Read_Book_Page = 0;
	Read_Book_nDocID = Doc_Create();
	Doc_Show(Read_Book_nDocID);
	AI_ProcessInfos(self);
	//*/
};


// РЕЦЕПТЫ ВЫПИВКИ ======================================
// UNFINISHED
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_BullSeed(P_ITWr_DSG_Recipe)
{
	description = "Бычье семя";
	value = Value_Recipe_Booze_BullSeed;
	on_state[0] = Use_Recipe_Booze_BullSeed;
	count[5] = value;
};
func void Use_Recipe_Booze_BullSeed()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_BullSeed] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_BullSeed] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"БЫЧЬЕ СЕМЯ");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_GobboSmile(P_ITWr_DSG_Recipe)
{
	description = "Улыбка гоблина";
	value = Value_Recipe_Booze_GobboSmile;
	on_state[0] = Use_Recipe_Booze_GobboSmile;
	count[5] = value;
};
func void Use_Recipe_Booze_GobboSmile()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_GobboSmile] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_GobboSmile] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"УЛЫБКА ГОБЛИНА");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_Berserker(P_ITWr_DSG_Recipe)
{
	description = "Берсеркер";
	value = Value_Recipe_Booze_Berserker;
	on_state[0] = Use_Recipe_Booze_Berserker;
	count[5] = value;
};
func void Use_Recipe_Booze_Berserker()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_Berserker] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_Berserker] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"Берсеркер");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_TrollBooze(P_ITWr_DSG_Recipe)
{
	description = "Троллиное пойло";
	value = Value_Recipe_Booze_TrollBooze;
	on_state[0] = Use_Recipe_Booze_TrollBooze;
	count[5] = value;
};
func void Use_Recipe_Booze_TrollBooze()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_TrollBooze] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_TrollBooze] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"Троллиное пойло");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_MagicGrog(P_ITWr_DSG_Recipe)
{
	description = "Магический грог";
	value = Value_Recipe_Booze_MagicGrog;
	on_state[0] = Use_Recipe_Booze_MagicGrog;
	count[5] = value;
};
func void Use_Recipe_Booze_MagicGrog()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_MagicGrog] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_MagicGrog] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"Магический грог");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_Kamikaze(P_ITWr_DSG_Recipe)
{
	description = "Камикадзе";
	value = Value_Recipe_Booze_Kamikaze;
	on_state[0] = Use_Recipe_Booze_Kamikaze;
	count[5] = value;
};
func void Use_Recipe_Booze_Kamikaze()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_Kamikaze] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_Kamikaze] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"Камикадзе");
	Doc_Show(nDocID);
};


