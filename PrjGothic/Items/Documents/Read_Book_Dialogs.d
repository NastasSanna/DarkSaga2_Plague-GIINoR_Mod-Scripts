/**************************************************************************

						ЧТЕНИЕ МНОГОСТРАНИЧНЫХ КНИГ
   
  Диалоги для переворачивания страниц и функции отображения книг.
  Недостаток - независимо друг от друга завершается диалог (КОНЕЦ в меню)
и сворачивается книга (правой кнопкой).
  
  Образец вызова диалога:
  
	Read_Book = Read_Book_...;
	Read_Book_Page = 0;
	Read_Book_nDocID = Doc_Create();
	Doc_Show(Read_Book_nDocID);
	AI_ProcessInfos(self);
  
 //* NS - 05/02/2013
  
***************************************************************************/

var int Read_Book_nDocID;	//сам документ, создавать и отображать до начала диалога!
var int Read_Book;		// какую книжку читаем
	const int Read_Book_None 				= 0;
	const int Read_Book_TinkturStr_wenig	= 1;
	const int Read_Book_Botje_01 			= 2;
	const int Read_Book_Botje_02 			= 3;
var int Read_Book_Page;	// на какой странице

// КОНЕЦ =======================================================

func void PC_Read_Book_Exit()
{
	Read_Book = Read_Book_None;
	AI_StopProcessInfos(self);
};

// "Падение Трасилия" ------------------------------------------

instance PC_Read_Book_TinkturStr_wenig(C_INFO)
{
	npc = PC_Hero;
	condition = PC_Read_Book_TinkturStr_wenig_Condition;
	information = PC_Read_Book_TinkturStr_wenig_Info;
	permanent = TRUE;
	important = TRUE;
};

func int PC_Read_Book_TinkturStr_wenig_Condition()
{
	if (Read_Book == Read_Book_TinkturStr_wenig)
	{
		return TRUE;
	};
};

// вывод текста
func void PC_Read_Book_TinkturStr_wenig_Show()
{
	Doc_SetPages(Read_Book_nDocID,2);
	Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_01_L.TGA",0);
	Doc_SetPage(Read_Book_nDocID,1,"TextBook_Blank_01_R.TGA",0);
	Doc_SetMargins(Read_Book_nDocID,0,230,50,40,50,1);
	Doc_SetMargins(Read_Book_nDocID,1,40,50,230,50,1);
	if (Read_Book_Page == 0)
	{
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_BookHeadline);
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1," Падение Трасилия");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"       # # #");
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"          краткий");
		Doc_PrintLine(Read_Book_nDocID,1,"    исторический очерк");
	};
	if (Read_Book_Page == 1)
	{
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"Трасилий Воинственный был десятым и предпоследним королем небольшого государства Алрикии.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"Он прославился благодаря большому числу успешных завоевательных походов. За период его правления территория страны увеличилась почти вдвое. Из более чем 70 сражений армия Трасилия проиграла лишь два.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"Однако основой его силы была не численность войска, не военная подготовка и не особое оружие, а... алхимия. ");
		Doc_PrintLines(Read_Book_nDocID,1,"Перед каждой битвой воины принимали особую настойку, на некоторое время повышавшую их силу. В бою они просто сминали врагов, укрепляя веру соседей в непобедимость армии Алрикии. Многие города сдавались без боя. ");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"Возможно, если бы противником Трасилия оказался талантливый полководец, его завоевания были бы остановлены. Но внутренняя угроза проявила себя раньше.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"Младший брат Трасилия, Иорисий, давно мечтал занять трон.");
	};
	if (Read_Book_Page == 2)
	{
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"Во время небольшого перерыва в сражениях, когда Трасилий предавался развлечениям в столице, Иорисий ворвался во дворец с группой верных ему людей и убил брата. Ирония заключается в том, что для организации переворота Иорисий и его сторонники приняли ту же ”Настойку воина”, а охрана дворца сделать этого не успела.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"Опасаясь повторить судьбу брата, Иорисий после воцарения запретил изготовление ”Настойки воина”.");
		Doc_PrintLines(Read_Book_nDocID,1,"Однако этот приказ уже не имел значения – к тому моменту древесный мох, основной ингредиент настойки, был практически полностью истрачен. Для роста мху требуются годы, и потеря оказалась невосполнимой.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"Армия была ослаблена, и Алрикия очень быстро потеряла все завоеванные земли. А уже через три года после переворота пала столица. Иорисий погиб в последнем сражении, а Алрикия перестала существовать как государство.");
	};
};

func void PC_Read_Book_TinkturStr_wenig_Info()
{
	PC_Read_Book_TinkturStr_wenig_Show();
	Info_ClearChoices(PC_Read_Book_TinkturStr_wenig);
	Info_AddChoice(PC_Read_Book_TinkturStr_wenig,Dialog_Ende,PC_Read_Book_Exit);
	if (Read_Book_Page > 0)
	{
		Info_AddChoice(PC_Read_Book_TinkturStr_wenig, "<- Назад",PC_Read_Book_TinkturStr_wenig_Prev);
	};
	if (Read_Book_Page < 2)
	{
		Info_AddChoice(PC_Read_Book_TinkturStr_wenig, "Вперед ->",PC_Read_Book_TinkturStr_wenig_Next);
	};
};

func void PC_Read_Book_TinkturStr_wenig_Prev()
{
	Read_Book_Page -= 1;
	PC_Read_Book_TinkturStr_wenig_Info();
};
func void PC_Read_Book_TinkturStr_wenig_Next()
{
	Read_Book_Page += 1;
	PC_Read_Book_TinkturStr_wenig_Info();
};

// "Наследие алхимика Ботье (начало)" --------------------------------

instance PC_Read_Book_Botje_01(C_INFO)
{
	npc = PC_Hero;
	condition = PC_Read_Book_Botje_01_Condition;
	information = PC_Read_Book_Botje_01_Info;
	permanent = TRUE;
	important = TRUE;
};

func int PC_Read_Book_Botje_01_Condition()
{
	if (Read_Book == Read_Book_Botje_01)
	{
		return TRUE;
	};
};

// вывод текста
func void PC_Read_Book_Botje_01_Show()
{
	if (Read_Book_Page == 0)
	{
		Doc_SetPages(Read_Book_nDocID,2);
		Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_02_part1_L.TGA",0);
		Doc_SetPage(Read_Book_nDocID,1,"TextBook_Blank_02_part1_R.TGA",0);
		Doc_SetMargins(Read_Book_nDocID,0,220,50,40,50,1);
		Doc_SetMargins(Read_Book_nDocID,1,40,50,220,50,1);
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_BookHeadline);
		Doc_PrintLines(Read_Book_nDocID,0,"Наследие алхимика Ботье");
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"Большинство известных алхимических зелий изготавливается из различных растений, таких как луговой горец, лечебный корень, огненная крапива. При этом зелье лишь выделяет и усиливает эффект, который оказывает само растение.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"Однако опытные алхимики используют множество других ингредиентов. В зелья могут добавляться минералы, животные компоненты, бесполезные сами по себе, но способные ");
		Doc_PrintLines(Read_Book_nDocID,1,"полностью изменить действие зелья.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"Алхимик Ботье, живший несколько сотен назад, прославился в первую очередь благодаря своим опытам с кровью. Он изучил ее влияние на эффект нескольких десятков зелий.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"Во многих случаях результат просто поражает. Бесполезная бурда и даже сильный яд, приготовленный на воде, превращается в мощное зелье, будучи затворенным на крови определенного животного.");
	};
	if (Read_Book_Page == 1)
	{
		Doc_SetPages(Read_Book_nDocID,1);
		Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_02_part1_Rip.TGA",0);
		Doc_SetMargins(Read_Book_nDocID,0,60,50,210,50,1);
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"Наиболее известна ”Настойка Ботье”, названная в честь самого алхимика. Древесный мох, еловый гриб и пустырник растираются с кровью варга, затем смесь тщательно выжимается. ”Настойка Ботье” способна существенно повысить силу и ловкость принявшего ее, но лишь на некоторое время.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"О жизни Ботье известно мало. Он родился в богатой семье и с юности увлекался алхимией. Уже к 20 годам Ботье успел достигнуть высокого мастерства. Тогда же он начал проводить ");
		if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_wenig] == FALSE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_wenig] = TRUE;
			Snd_Play("LevelUP");
			B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"НАСТОЙКА БОТЬЕ временно повышает силу и ловкость. Ингредиенты: 1 часть крови варга, 1 древесный мох, 1 еловый гриб и 1 пустырник. Готовится путем выжимки..");
		};
	};
};

func void PC_Read_Book_Botje_01_Info()
{
	PC_Read_Book_Botje_01_Show();
	Info_ClearChoices(PC_Read_Book_Botje_01);
	Info_AddChoice(PC_Read_Book_Botje_01,Dialog_Ende,PC_Read_Book_Exit);
	if (Read_Book_Page > 0)
	{
		Info_AddChoice(PC_Read_Book_Botje_01, "<- Назад",PC_Read_Book_Botje_01_Prev);
	};
	if (Read_Book_Page < 1)
	{
		Info_AddChoice(PC_Read_Book_Botje_01, "Вперед ->",PC_Read_Book_Botje_01_Next);
	};
};

func void PC_Read_Book_Botje_01_Prev()
{
	Read_Book_Page -= 1;
	PC_Read_Book_Botje_01_Info();
};
func void PC_Read_Book_Botje_01_Next()
{
	Read_Book_Page += 1;
	PC_Read_Book_Botje_01_Info();
};

// "Наследие алхимика Ботье (конец)" ---------------------------------

instance PC_Read_Book_Botje_02(C_INFO)
{
	npc = PC_Hero;
	condition = PC_Read_Book_Botje_02_Condition;
	information = PC_Read_Book_Botje_02_Info;
	permanent = TRUE;
	important = TRUE;
};

func int PC_Read_Book_Botje_02_Condition()
{
	if (Read_Book == Read_Book_Botje_02)
	{
		return TRUE;
	};
};

// вывод текста
func void PC_Read_Book_Botje_02_Show()
{
	if (Read_Book_Page == 0)
	{
		Doc_SetPages(Read_Book_nDocID,1);
		Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_02_part2_Rip.TGA",0);
		Doc_SetMargins(Read_Book_nDocID,0,220,50,55,50,1);
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"первые опыты с кровью. Вскоре по городу поползли слухи о том, что молодой алхимик Ботье использует человеческую кровь в своих экспериментах. Не дожидаясь официального обвинения в некромантии, что в те времена было равнозначно смертной казни, Ботье тайно покинул город и поселился в пещере в горах.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"Там он скрывался в одиночестве и безвестности всю оставшуюся жизнь, но продолжал свои опыты, результаты которых тщательно конспектировал.");
	};
	if (Read_Book_Page == 1)
	{
		Doc_SetPages(Read_Book_nDocID,2);
		Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_02_part2_L.TGA",0);
		Doc_SetPage(Read_Book_nDocID,1,"TextBook_Blank_02_part2_R.TGA",0);
		Doc_SetMargins(Read_Book_nDocID,0,220,50,45,50,1);
		Doc_SetMargins(Read_Book_nDocID,1,40,50,220,50,1);
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"Лишь спустя многие годы после смерти Ботье, его пещеру обнаружил одинокий путешественник. К тому времени многие записи были безнадежно испорчены, но сохранившиеся оказались бесцеными. У Ботье появилось множество учеников и последователей. Часть утерянных рецептов удалось восстановить, другие были открыты заново.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"Так, после множества неудачных попыток, была получена ”Настойка могущества”, упомянутая в одном из дневников Ботье.");
		Doc_PrintLines(Read_Book_nDocID,1,"Как и у большинства зелий на крови, ее воздействие временно, но в течение этого времени она значительно повышает силу, ловкость и здоровье. ”Настойка могущества” затворяется на крови мракориса из смеси таириса, каменного корня и пустырника.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"Трудность получения крови мракориса является основной причиной, по которой эта настойка не получила широкого распространения, поскольку сам процесс выжимки зелья из смеси довольно прост.");
		if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_besondere] == FALSE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_besondere] = TRUE;
			Snd_Play("LevelUP");
			B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"НАСТОЙКА МОГУЩЕСТВА временно повышает силу, ловкость и здоровье. Ингредиенты: 1 часть крови мракориса, 1 таирис, 1 каменный корень и 1 пустырник. Готовится путем выжимки..");
		};
	};
};

func void PC_Read_Book_Botje_02_Info()
{
	PC_Read_Book_Botje_02_Show();
	Info_ClearChoices(PC_Read_Book_Botje_02);
	Info_AddChoice(PC_Read_Book_Botje_02,Dialog_Ende,PC_Read_Book_Exit);
	if (Read_Book_Page > 0)
	{
		Info_AddChoice(PC_Read_Book_Botje_02, "<- Назад",PC_Read_Book_Botje_02_Prev);
	};
	if (Read_Book_Page < 1)
	{
		Info_AddChoice(PC_Read_Book_Botje_02, "Вперед ->",PC_Read_Book_Botje_02_Next);
	};
};

func void PC_Read_Book_Botje_02_Prev()
{
	Read_Book_Page -= 1;
	PC_Read_Book_Botje_02_Info();
};
func void PC_Read_Book_Botje_02_Next()
{
	Read_Book_Page += 1;
	PC_Read_Book_Botje_02_Info();
};




