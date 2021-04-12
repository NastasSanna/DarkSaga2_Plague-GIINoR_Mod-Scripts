instance DIA_RakTarak_EXIT(DIA_Proto_End)
{
	npc = Orc_DS2P_RakTarak;
};


/////////////////////////// Общие ///////////////////////////

//===================================================
//Обращается сам
//Появление: начальный
//Окончание: если атаковали Рак-Тарока или Ар-Туша
instance DIA_RakTarak_Start(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_RakTarak_Start_Info;
	description = "*(стой, морра!)";
	important = TRUE;
};
func void DIA_RakTarak_Start_Info()
{
	AI_Output(self,other,"DIA_RakTarak_Start_99_01");	//Стой, морра. Рак-Тарок не враг морра.
		AI_Output(other,self,"DIA_RakTarak_Start_15_02");	//Нечасто мне встречаются орки, не хватающиеся за топор при виде человека.
	AI_Output(self,other,"DIA_RakTarak_Start_99_03");	//Рак-Тарок друг. Не бить морра. Моя хотеть мир.
		AI_Output(other,self,"DIA_RakTarak_Start_15_04");	//Хотелось бы верить.
};


//===================================================
//При попытке заговорить
//Постоянный
instance DIA_RakTarak_Sorrow(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 0;
	condition = DIA_RakTarak_Sorrow_Cond;
	information = DIA_RakTarak_Sorrow_Info;
	description = "*(скорбит)";
	permanent = TRUE;
	important = TRUE;
};
//Условие: Ар-Туш умер по любым причинам
//Окончание: взят квест «Защита для маленьких», если диалог был хотя бы один раз
func int DIA_RakTarak_Sorrow_Cond()
{
	if (DIA_WhenAsked_cond() && 
		Npc_IsDead(Orc_DS2P_ArTush) && (!MIS_DS2P_Protection4LittleOnes || !DIA_RakTarak_Sorrow_Once)
	)	{
		return TRUE;
	};
};
var int DIA_RakTarak_Sorrow_Once;
func void DIA_RakTarak_Sorrow_Info()
{
	//только один раз
	if (!DIA_RakTarak_Sorrow_Once) {
		AI_Output(self,other,"DIA_RakTarak_Sorrow_99_01");	//Ар-Туш умереть и Рак-Тарок остаться совсем один.
		AI_Output(self,other,"DIA_RakTarak_Sorrow_99_02");	//Большой печаль в сердце Рак-Тарок. Моя, наверное, тоже скоро умирать.
		DIA_RakTarak_Sorrow_Once = TRUE;
	}		
	//постоянно
	else {
		AI_Output(self,other,"DIA_RakTarak_Sorrow_99_03");	//Морра лучше оставить Рак-Тарок с его горе.
	};
	//разговор обрывается
	AI_StopProcessInfos(self);
};


//===================================================
//Появление: после стартового
instance DIA_RakTarak_WhoAU(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 2;
	condition = DIA_RakTarak_WhoAU_Cond;
	information = DIA_RakTarak_WhoAU_Info;
	description = "Кто ты?";
};
func int DIA_RakTarak_WhoAU_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_Start))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhoAU_Info()
{
		AI_Output(other,self,"DIA_RakTarak_WhoAU_15_01");	//Кто ты?
	AI_Output(self,other,"DIA_RakTarak_WhoAU_99_02");	//Орка имя Рак-Тарок, как великий предок. Он жить много-много зим назад и умереть в бой с хаз.
		AI_Output(other,self,"DIA_RakTarak_WhoAU_15_03");	//Хаз? Знакомое название.
	AI_Output(self,other,"DIA_RakTarak_WhoAU_99_04");	//Хаз - много сильный и могучий зверь с рог, ходить на охота в ночь. Большой честь убить хаз. 
	AI_Output(self,other,"DIA_RakTarak_WhoAU_99_05");	//Предок Рак-Тарок мочь убить три, но умереть сам от роги два другой хаз. Он быть великий воин.
};


//===================================================
//Появление: после стартового
instance DIA_RakTarak_WhereLearnedLanguage(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 3;
	condition = DIA_RakTarak_WhereLearnedLanguage_Cond;
	information = DIA_RakTarak_WhereLearnedLanguage_Info;
	description = "Откуда ты знаешь наш язык?";
};
func int DIA_RakTarak_WhereLearnedLanguage_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhoAU))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhereLearnedLanguage_Info()
{
		AI_Output(other,self,"DIA_RakTarak_WhereLearnedLanguage_15_01");	//Откуда ты знаешь наш язык?
	AI_Output(self,other,"DIA_RakTarak_WhereLearnedLanguage_99_02");	//Рак-Тарок много говорить и торговать с морра, когда еще не быть война.
};


//===================================================
//Появление: после стартового
instance DIA_RakTarak_OtherOrcs(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 4;
	condition = DIA_RakTarak_OtherOrcs_Cond;
	information = DIA_RakTarak_OtherOrcs_Info;
	description = "А на этом острове нет других орков?";
};
func int DIA_RakTarak_OtherOrcs_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhoAU))	{
		return TRUE;
	};
};
func void DIA_RakTarak_OtherOrcs_Info()
{
		AI_Output(other,self,"DIA_RakTarak_OtherOrcs_15_01");	//А на этом острове нет других орков?
	AI_Output(self,other,"DIA_RakTarak_OtherOrcs_99_02");	//Нет, орки здесь не жить. Орки бояться это место.
		AI_Output(other,self,"DIA_RakTarak_OtherOrcs_15_03");	//Почему?
	AI_Output(self,other,"DIA_RakTarak_OtherOrcs_99_04");	//Здесь на верху гора жить дракон. Сильно мудрый и старый. Но опасный.
};


//===================================================
//Появление: после «А на этом острове нет других орков?»
instance DIA_RakTarak_AboutDragon(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 5;
	condition = DIA_RakTarak_AboutDragon_Cond;
	information = DIA_RakTarak_AboutDragon_Info;
	description = "Можешь рассказать мне подробнее о драконе?";
};
func int DIA_RakTarak_AboutDragon_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_OtherOrcs))	{
		return TRUE;
	};
};
func void DIA_RakTarak_AboutDragon_Info()
{
		AI_Output(other,self,"DIA_RakTarak_AboutDragon_15_01");	//Можешь рассказать мне подробнее о драконе?
	AI_Output(self,other,"DIA_RakTarak_AboutDragon_99_02");	//Он старый, много-много зим старый. И могучий. Рак-Тарок чуять сила даже тут. 
		AI_Output(other,self,"DIA_RakTarak_AboutDragon_15_03");	//Еще один слуга Белиара? Сколько же их развелось на этом свете?!
	AI_Output(self,other,"DIA_RakTarak_AboutDragon_99_04");	//Нет, это не сила Бог Смерти. Рак-Тарок не чуять зло. Дракон жить сам один и быть еще больше старый, как сам мир.
	AI_Output(self,other,"DIA_RakTarak_AboutDragon_99_05");	//Рак-Тарок хотеть бы встретить этот дракон, говорить. Но на гора не пройти, большой пропасть и нет мост.
};


//===================================================
//Появление: после стартового
instance DIA_RakTarak_WhyAlone(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 6;
	condition = DIA_RakTarak_WhyAlone_Cond;
	information = DIA_RakTarak_WhyAlone_Info;
	description = "Что вы тут делаете совсем одни?";
};
func int DIA_RakTarak_WhyAlone_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhoAU))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhyAlone_Info()
{
		AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_01");	//Что вы тут делаете совсем одни? Этот остров довольно опасен.
		AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_02");	//Здесь полно диких зверей, и местные охотники вряд ли дружелюбны к твоему племени.
		AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_03");	//А недавно на остров высадились пираты, у них с орками личные счеты.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_04");	//Я и мой друг приплыть с большой земля, где снег и много-много высоко.
		AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_05");	//Ты говоришь про горы? Нордмар?
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_06");	//Так, морра говорить Норр-мар. Мой большой семья там жить и охотиться дикий зверь. И предок мой предок там жить.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_07");	//Мы никогда не воевать с морра и даже торговать хлеб и фрукта с нижний земля.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_08");	//Но после приходить другой орка и говорить война с морра. Мы не хотеть война, не давать топоры вождь Кан. 
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_09");	//Но морра не различать орка. Одна ночь на нас напасть морра-охотники. Много орки погибнуть. 
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_10");	//Мы бежать вниз с горы, но война быть уже там. Еще много орки умирать.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_11");	//Тогда мы садиться лодка и плыть по море. Но наш предки гневаться, быть большой волны, и лодка тонуть.
	AI_Output(self,other,"DIA_RakTarak_WhyAlone_99_12");	//Только Рак-Тарок и Ар-Туш остаться, море вынести на этот остров.
};


//===================================================
//Постоянный
//Появление: после «Что вы тут делаете совсем одни?»
instance DIA_RakTarak_WhatNext(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 7;
	condition = DIA_RakTarak_WhatNext_Cond;
	information = DIA_RakTarak_WhatNext_Info;
	description = "Что будешь делать дальше?";
	permanent = TRUE;
};
func int DIA_RakTarak_WhatNext_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhyAlone))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhatNext_Info()
{
	AI_Output(other,self,"DIA_RakTarak_WhatNext_15_01");	//Что ты будешь делать дальше?
	//если выполнен квест «Защита для маленьких»
	if (MIS_DS2P_Protection4LittleOnes) {
		AI_Output(self,other,"DIA_RakTarak_WhatNext_99_03");	//Теперь гоблины быть семья. Гоблин быть маленький, но хороший охотник. Знать, что есть честь.
	}
	else {
		AI_Output(self,other,"DIA_RakTarak_WhatNext_99_02");	//Мы жить этот остров. Здесь нет война и мало-мало морра.
	};
};


//===================================================
//Появление: после всех предыдущих вопросов
instance DIA_RakTarak_RememberMeOfFriend(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 8;
	condition = DIA_RakTarak_RememberMeOfFriend_Cond;
	information = DIA_RakTarak_RememberMeOfFriend_Info;
	description = "Ты напоминаешь мне одного моего друга.";
};
func int DIA_RakTarak_RememberMeOfFriend_Cond()
{
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhatNext))	{
		return TRUE;
	};
};
func void DIA_RakTarak_RememberMeOfFriend_Info()
{
		AI_Output(other,self,"DIA_RakTarak_RememberMeOfFriend_15_01");	//Ты напоминаешь мне одного моего друга-орка. Его звали Ур-Шак.
		AI_Output(other,self,"DIA_RakTarak_RememberMeOfFriend_15_02");	//Он тоже хотел жить в мире, даже ушел из своего племени и жил отшельником... До недавнего времени.
	AI_Output(self,other,"DIA_RakTarak_RememberMeOfFriend_99_03");	//Почему? Он тоже умереть от война?
		AI_Output(other,self,"DIA_RakTarak_RememberMeOfFriend_15_04");	//Нет, просто он изменил свое мнение. Из-за моей ошибки, признаюсь. Мне жаль, что так вышло.
};


/////////////////////////// Квест: Орк в беде ///////////////////////////

//===================================================
//Появление: после стартового
//Окончание: пока Ар-Туш жив
instance DIA_RakTarak_WhatWithUrFriend(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 10;
	condition = DIA_RakTarak_WhatWithUrFriend_Cond;
	information = DIA_RakTarak_WhatWithUrFriend_Info;
	description = "Что с твоим другом?";
	permanent = TRUE;
};
var int DIA_RakTarak_WhatWithUrFriend_Once;
func int DIA_RakTarak_WhatWithUrFriend_Cond()
{
	if (!DIA_RakTarak_WhatWithUrFriend_Once) {
		DIA_RakTarak_WhatWithUrFriend.description = "Я могу чем-то помочь твоему другу?";
	};
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhoAU))	{
		return TRUE;
	};
	if (DIA_RakTarak_WhatWithUrFriend_Once && !ArTush_AgreedToHelp)	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhatWithUrFriend_Info()
{
	DIA_RakTarak_WhatWithUrFriend_Once = TRUE;
		AI_Output(other,self,"DIA_RakTarak_WhatWithUrFriend_15_01");	//Что с твоим другом?
	AI_Output(self,other,"DIA_RakTarak_WhatWithUrFriend_99_02");	//Ар-Туш болеть. Его укусить кшатор.
		AI_Output(other,self,"DIA_RakTarak_WhatWithUrFriend_15_03");	//Кшатор?
	AI_Output(self,other,"DIA_RakTarak_WhatWithUrFriend_99_04");	//Большой мух с яд в жало. Такой не жить наш дом, где холод и снег. Яд плохо для орка.
	//Выбор варианта (один):
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend,"Ну, желаю твоему другу вылечиться.",DIA_RakTarak_WhatWithUrFriend_NoHelp);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend,"Я могу чем-то помочь твоему другу?",DIA_RakTarak_CanIHelpU_Info);
};

//Ну, желаю твоему другу вылечиться.
func void DIA_RakTarak_WhatWithUrFriend_NoHelp()
{
	AI_Output(other,self,"DIA_RakTarak_WhatWithUrFriend_NoHelp_15_01");	//Ну, желаю твоему другу вылечиться.
	AI_Output(self,other,"DIA_RakTarak_WhatWithUrFriend_NoHelp_99_02");	//(печально) Без лекарство Ар-Туш скоро умирать.
	//срок жизни Ар-Туша 2 дня
	ArTush_Die_Day = Wld_GetDay() + ArTush_Die_DaysLeft + 1;
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
};

//Я могу чем-то помочь твоему другу?
func void DIA_RakTarak_CanIHelpU_Info()
{
	ArTush_AgreedToHelp = TRUE;
	//Как реплика или если не взяли квест сразу
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_15_01");	//Я могу чем-то помочь твоему другу?
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_99_02");	//Да, морра мочь спасти Ар-Туш. Нужно лекарство от яд, но моя нет трава из чего делать.
	//срок жизни Ар-Туша 2 дня
	ArTush_Die_Day = Wld_GetDay() + ArTush_Die_DaysLeft + 1;
	//Запись в дневнике. Квест «Орк в беде»: Начало
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Start);
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_15_03");	//Что тебе нужно?
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_99_04");	//Три гдо-баш, два шти-ора, семь ура-гона и десять кхори.
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_15_05");	//Так, давай помедленнее. Я даже названия не запомнил.
	//Дальше викторина, на каждую реплику орка нужно выбрать один пункт (некоторые лишние):
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "(начать)", DIA_RakTarak_CanIHelpU_GdoBash);
};

var int DIA_RakTarak_WhatWithUrFriend_CorrectAnswer;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb1 = 1;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_ManaHerb1 = 2;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom1 = 3;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_Blueplant = 4;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb3 = 5;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_TempPlant = 6;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_PermPlant = 7;
	const int DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom2 = 8;
var int DIA_RakTarak_WhatWithUrFriend_CorrectAnswersCount;
var int DIA_RakTarak_WhatWithUrFriend_AnswersCount;
	const int DIA_RakTarak_WhatWithUrFriend_AnswersCount_Max = 4;

func void DIA_RakTarak_CanIHelpU_Menu() {
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "луговой горец", DIA_RakTarak_CanIHelpU_TempPlant);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "целебная трава", DIA_RakTarak_CanIHelpU_HealthHerb1);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "целебный корень", DIA_RakTarak_CanIHelpU_HealthHerb3);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "серафис", DIA_RakTarak_CanIHelpU_Blueplant);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "огненная крапива", DIA_RakTarak_CanIHelpU_ManaHerb1);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "царский щавель", DIA_RakTarak_CanIHelpU_PermPlant);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "темный гриб", DIA_RakTarak_CanIHelpU_Mushroom1);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "пища рудокопа", DIA_RakTarak_CanIHelpU_Mushroom2);
};

// вопросы ----------------------------
func void DIA_RakTarak_CanIHelpU_GdoBash() {
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_GdoBash_99_01");	//Три гдо-баш. Это трава, чтобы лечить маленький раны.
	//целебная трава
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswer = DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb1;
	DIA_RakTarak_CanIHelpU_Menu();
};

func void DIA_RakTarak_CanIHelpU_ShtiOra() {
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_ShtiOra_99_01");	//Два шти-ора. Много острый и жгучий трава. Давать сила шаман.
	//огненная крапива
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswer = DIA_RakTarak_WhatWithUrFriend_Answer_ManaHerb1;
	DIA_RakTarak_CanIHelpU_Menu();
};

func void DIA_RakTarak_CanIHelpU_UrGona() {
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_UrGona_99_01");	//Семь ур-гона. Это маленький гриб темный цвет. Много пахнет.
	//темные грибы
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswer = DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom1;
	DIA_RakTarak_CanIHelpU_Menu();
};
func void DIA_RakTarak_CanIHelpU_Khori() {
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_Khori_99_01");	//Десять кхори. Кхори быть синий ягода среди зеленый лист.
	// серафис
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswer = DIA_RakTarak_WhatWithUrFriend_Answer_Blueplant;
	DIA_RakTarak_CanIHelpU_Menu();
};

// проверка ----------------------------
//если где-то ошиблись
func void DIA_RakTarak_CanIHelpU_Wrong() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Wrong_15_01");	//Погоди, кажется что-то не так. Давай с начала.
	DIA_RakTarak_WhatWithUrFriend_CorrectAnswersCount = 0;
	Info_ClearChoices(DIA_RakTarak_WhatWithUrFriend);
	Info_AddChoice(DIA_RakTarak_WhatWithUrFriend, "(заново)", DIA_RakTarak_CanIHelpU_GdoBash);
};
//иначе
func void DIA_RakTarak_CanIHelpU_Right() {
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Right_15_01");	//Вроде запомнил. Это все?
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_Right_99_02");	//Еще надо бутылка ктарро. Морра говорить САА-МОН-ГОН.
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_Right_99_03");	//Но ктарро у морра очень слабый. Надо сильный и жгучий, морра от такой может умирать.
		AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Right_15_04");	//Постараюсь найти. Некоторые люди пьют не хуже орков.
	//Запись в дневнике. Квест «Орк в беде»: Ингредиенты
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Ingredients);
	//Спаун необходимых растений с небольшим запасом
	B_Spawn_PlantsForOrcHealing();
	AI_Output(self,other,"DIA_RakTarak_CanIHelpU_Right_99_05");	//Морра надо идти быстро. Ар-Туш не жить больше два дня.
	//Запись в дневнике. Квест «Орк в беде»: Сроки
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Time);
};

func void DIA_RakTarak_CanIHelpU_CheckAllCorrect(var int answer) {
	if (DIA_RakTarak_WhatWithUrFriend_CorrectAnswer == answer) {
		DIA_RakTarak_WhatWithUrFriend_CorrectAnswersCount += 1;
	};
	DIA_RakTarak_WhatWithUrFriend_AnswersCount += 1;
	if (DIA_RakTarak_WhatWithUrFriend_AnswersCount == DIA_RakTarak_WhatWithUrFriend_AnswersCount_Max) {
		if (DIA_RakTarak_WhatWithUrFriend_CorrectAnswersCount == DIA_RakTarak_WhatWithUrFriend_AnswersCount_Max) {
			DIA_RakTarak_CanIHelpU_Right();
		}
		else {
			DIA_RakTarak_CanIHelpU_Wrong();
		};
	};
};

// варианты ответа ----------------------------
//правильные варианты
func void DIA_RakTarak_CanIHelpU_HealthHerb1() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_HealthHerb1_15_01");	//Целебная трава. Понял.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb1);
};
func void DIA_RakTarak_CanIHelpU_ManaHerb1() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_ManaHerb1_15_01");	//Это должно быть огненная крапива.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_ManaHerb1);
};
func void DIA_RakTarak_CanIHelpU_Mushroom1() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Mushroom1_15_01");	//Ага, это темные грибы.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom1);
};
func void DIA_RakTarak_CanIHelpU_Blueplant() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Blueplant_15_01");	//Похоже на серафис.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_Blueplant);
};
//лишние пункты
func void DIA_RakTarak_CanIHelpU_HealthHerb3() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_HealthHerb3_15_01");	//Звучит как целебный корень.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_HealthHerb3);
};
func void DIA_RakTarak_CanIHelpU_TempPlant() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_TempPlant_15_01");	//Кажется, это луговой горец.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_TempPlant);
};
func void DIA_RakTarak_CanIHelpU_PermPlant() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_PermPlant_15_01");	//Хм, наверное, ты про царский щавель.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_PermPlant);
};
func void DIA_RakTarak_CanIHelpU_Mushroom2() {
	AI_Output(other,self,"DIA_RakTarak_CanIHelpU_Mushroom2_15_01");	//Пища рудокопа? Хороший такой гриб, большой.
	DIA_RakTarak_CanIHelpU_CheckAllCorrect(DIA_RakTarak_WhatWithUrFriend_Answer_Mushroom2);
};


//===================================================
//Один раз
instance DIA_RakTarak_GiveHealPotion(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 11;
	condition = DIA_RakTarak_GiveHealPotion_Cond;
	information = DIA_RakTarak_GiveHealPotion_Info;
	description = "У меня есть целебный эликсир. (отдать)";
};
//Появление: Квест «Орк в беде» активен
//Условие: в инвентаре есть сильный эликсир здоровья
func int DIA_RakTarak_GiveHealPotion_Cond()
{
	if (DIA_RakTarak_WhatWithUrFriend_Once && MIS_DS2P_OrcInTrouble == LOG_Running && !ArTush_Healed 
		&& Npc_HasItems(other, ItPo_Health_03)
	)	{
		return TRUE;
	};
};
func void DIA_RakTarak_GiveHealPotion_Info()
{
		AI_Output(other,self,"DIA_RakTarak_GiveHealPotion_15_01");	//У меня есть целебный эликсир. Возьми.
	AI_Output(self,other,"DIA_RakTarak_GiveHealPotion_99_02");	//Спасибо, морра. Зелье не вылечить Ар-Туш от яд, но немного помочь жить дольше.
	//срок жизни Ар-Туша +1 день
	ArTush_Die_Day += 1;	
	//Запись в дневнике. Квест «Орк в беде»: Целебное зелье
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Potion);
};


//===================================================
//Другие участники: Ар-Туш
var int RakTarak_ArTush_TRIA_Phrase;
const int RakTarak_ArTush_TRIA_Phrase_End = 3;
instance DIA_RakTarak_GotEverything(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 0;
	condition = DIA_RakTarak_GotEverything_Cond;
	information = DIA_RakTarak_GotEverything_Info;
	description = "Я все принес.";
	permanent = TRUE;
};
//Появление: Квест «Орк в беде» активен
//Условие: собрали все ингредиенты
func int DIA_RakTarak_GotEverything_Cond()
{
	if (MIS_DS2P_OrcInTrouble == LOG_Running && C_NpcHasAllIngredients_OrcInTrouble(other) &&
		RakTarak_ArTush_TRIA_Phrase < RakTarak_ArTush_TRIA_Phrase_End
	)	{
		return TRUE;
	};
};
func void DIA_RakTarak_GotEverything_Info()
{
	var C_NPC ArTush; ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
	RakTarak_ArTush_TRIA_Phrase += 1;
	if (RakTarak_ArTush_TRIA_Phrase == 0)	{
		AI_Output(other,self,"DIA_RakTarak_GotEverything_15_01");	//Я все принес.
		//отдаем травы и крепкий самогон (сразу удалить!)
		B_GiveAllIngredients_OrcInTrouble(other, self);
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_02");	//Моя говорить морра много спасиба. Теперь лечить Ар-Туш.
		//подходим к Ар-Тушу
		AI_GotoNpc(self, ArTush);
		AI_GotoNpc(other, ArTush);
		//Тот встает, пьет крепкий самогон
		AI_StandUp(ArTush);
		CreateInvItems(ArTush, ItFo_DS2P_OrcBooze, 1);
		AI_UseItem(ArTush, ItFo_DS2P_OrcBooze);
		
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_03");	//Помочь! Яд уходить.
			DIA_RakTarak_GotEverything.npc = Hlp_GetInstanceID(Orc_DS2P_ArTush);
		AI_StopProcessInfos(self);
	}
	else if (RakTarak_ArTush_TRIA_Phrase == 1)	{
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_04");	//Утга краша брадо! Морра ингже штрассо, шебо нао харра.
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_05");	//Фарре штабо удда морра!
			DIA_RakTarak_GotEverything.npc = Hlp_GetInstanceID(Orc_DS2P_ArTush);
		AI_StopProcessInfos(self);
	}
	else if (RakTarak_ArTush_TRIA_Phrase == 2)	{
		AI_Output(other,self,"DIA_RakTarak_GotEverything_15_06");	//А по-миртански можно? Ни слова не понимаю.
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_07");	//Ар-Туш говорить спасиба морра.
		AI_Output(other,self,"DIA_RakTarak_GotEverything_15_08");	//На здоровье, конечно. Но почему он сам это не скажет?
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_09");	//Ар-Туш еще совсем молод, не знать язык морра. Моя теперь учить Ар-Туш.
		AI_Output(self,other,"DIA_RakTarak_GotEverything_99_10");	//Моя хотеть дать подарок морра, но золото нет. Есть только топор мой предок. Моя давать топор морра и учить бить враг.
		//дает свой топор и согласен учить
		CreateInvItem(self, ItMw_2H_OrcAxe_03);
		AI_EquipBestMeleeWeapon(self);
		B_GiveInvItems(self, other, ItMw_DSP_RakTarakAxe, 1);
		TEACH_RakTarak = TRUE;
		// Запись в дневнике. Квест «Орк в беде»: Выполнен
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_OrcInTrouble_Success);
	};
};


//===================================================
//Ответ на любой вопрос, пока не вылечим Ар-Туша или пока он не умрет
instance DIA_RakTarak_BusyHealing(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 0;
	condition = DIA_RakTarak_BusyHealing_Cond;
	information = DIA_RakTarak_BusyHealing_Info;
	description = "*(некогда)";
	permanent = TRUE;
	important = TRUE;
};
func int DIA_RakTarak_BusyHealing_Cond()
{
	if (DIA_WhenAsked_cond() && MIS_DS2P_OrcInTrouble == LOG_Running && !ArTush_Healed
		&& !(DIA_RakTarak_GotEverything_Cond() || DIA_RakTarak_GiveHealPotion_Cond())
	)	{
		return TRUE;
	};
};
func void DIA_RakTarak_BusyHealing_Info()
{
	AI_Output(self,other,"DIA_RakTarak_BusyHealing_99_01");	//Рак-Тарок не мочь сейчас говорить, морра. Надо помогать мой друг, Ар-Туш.
	//разговор обрывается
	AI_StopProcessInfos(self);
};


/////////////////////////// Квест: Защита для маленьких ///////////////////////////

//===================================================
instance DIA_RakTarak_Protection4LittleOnes(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 20;
	condition = DIA_RakTarak_Protection4LittleOnes_Cond;
	information = DIA_RakTarak_Protection4LittleOnes_Info;
	description = "Еще не нашел, куда податься?";
};
//Условие: Взят квест «Защита для маленьких». Квест «Орк в беде» завершен или не взят (Ар-Туш умер)
func int DIA_RakTarak_Protection4LittleOnes_Cond()
{
	if (MIS_DS2P_Protection4LittleOnes == LOG_Running &&
		(MIS_DS2P_OrcInTrouble == LOG_SUCCESS || Npc_IsDead(Orc_DS2P_ArTush))
	)	{
		return TRUE;
	};
};
func void DIA_RakTarak_Protection4LittleOnes_Info()
{
	//если не виделись хотя бы день
	if (self.aivar[AIV_TalkedToPlayer] > Wld_GetDay() + 1) {
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_00");	//Привет, волосатый.
	};
	AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_01");	//Еще не нашел, куда податься?
		AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_02");	//Нет, моя не знать, куда идти.
	AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_03");	//У меня есть предложение. На этом острове, на болотах, живет племя гоблинов. 
	AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_04");	//На них постоянно нападают болотные черви, с которыми гоблины не могут справиться. 
	//если Ар-Туш жив и здоров
		if (!Npc_IsDead(Orc_DS2P_ArTush)) {
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_05");	//Им нужны такие защитники, как вы.
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_06");	//У вас с другом появится свой дом, и вам не надо будет кочевать с места на место.
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_07");	//Моя нравиться твой предложение. 
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_08");	//Мы быть согласны. Рак-Тарок и Ар-Туш защищать деревня гоблинов и остаться жить там.
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_09");	//Вот и славно.
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_10");	//Только наша не знать, куда надо идти.
		//Запись в дневнике. Квест «Защита для маленьких»: Договорились
		B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_Agreed);
	}
	//иначе (Ар-Туш умер)
	else {
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_05a");	//Им нужен такой защитник, как ты. 
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_06a");	//У тебя появится дом, и ты больше не будешь один.
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_07");	//Моя нравиться твой предложение. 
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_08a");	//Моя быть согласный. Рак-Тарок защищать деревня гоблинов и остаться жить там.
		AI_Output(other,self,"DIA_RakTarak_Protection4LittleOnes_15_09");	//Вот и славно.
			AI_Output(self,other,"DIA_RakTarak_Protection4LittleOnes_99_10a");	//Только моя не знать, куда надо идти.
		//Запись в дневнике. Квест «Защита для маленьких»: Договорились один
		B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_AgreedOne);
	};
	Orcs_Agreed = TRUE;
};


//===================================================
//Постоянный
instance DIA_RakTarak_ComeWithMe(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 21;
	condition = DIA_RakTarak_ComeWithMe_Cond;
	information = DIA_RakTarak_ComeWithMe_Info;
	description = "Я отведу вас. Пошли!";
	permanent = TRUE;
};
//Условие: открыт квест «Защита для маленьких», орки согласились идти, но еще не идут за нами
//Окончание: довели до деревни
func int DIA_RakTarak_ComeWithMe_Cond()
{
	if (Npc_IsDead(Orc_DS2P_ArTush)) {
		DIA_RakTarak_ComeWithMe.description = "Я отведу тебя. Пошли!";
	};
	if (MIS_DS2P_Protection4LittleOnes == LOG_Running && Orcs_Agreed && !Orcs_Follow && !Orcs_CameToGobbos)	{
		return TRUE;
	};
};
func void DIA_RakTarak_ComeWithMe_Info()
{
	if (!Npc_IsDead(Orc_DS2P_ArTush)) {
		AI_Output(other,self,"DIA_RakTarak_ComeWithMe_15_01");	//Я отведу вас. Пошли!
		// Ар-Туш присоединяются к ГГ
		B_StartOtherRoutine(Orc_DS2P_ArTush, "FOLLOW");
	}
	else {
		AI_Output(other,self,"DIA_RakTarak_ComeWithMe_15_01a");	//Я отведу тебя. Пошли!
	};
	//Рак-Тарок присоединяется к ГГ
	B_StartOtherRoutine(self, "FOLLOW");
};

//===================================================
//Постоянный, обращается сам
instance DIA_RakTarak_NoFurther(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 22;
	condition = DIA_RakTarak_NoFurther_Cond;
	information = DIA_RakTarak_NoFurther_Info;
	description = "* Дальше не идти.";
	important = TRUE;
	permanent = TRUE;
};
//Условие: ведем орков и подошли слишком близко к деревне или лагерю охотников
func int DIA_RakTarak_NoFurther_Cond()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)	{
		return TRUE;
	};
};
func void DIA_RakTarak_NoFurther_Info()
{
	AI_Output(self,other,"DIA_RakTarak_NoFurther_99_01");	//Дальше нельзя идти.
	AI_Output(self,other,"DIA_RakTarak_NoFurther_99_02");	//Моя чуять много морра, слишком опасно.
	//Рак-Тарок и Ар-Туш остаются ждать на то месте на сутки. Если больше - возвращаются в начальную позицию
	B_StartOtherRoutine(self, "WAIT");
	if (Npc_IsDead(Orc_DS2P_ArTush)) {
		B_StartOtherRoutine(Orc_DS2P_ArTush, "WAIT");
	};
};


//===================================================
//Участник: Ар-Туш
instance DIA_RakTarak_Arrived(C_Info)
{
	npc = Orc_DS2P_RakTarak;								nr = 1;
	condition = DIA_RakTarak_Arrived_Cond;
	information = DIA_RakTarak_Arrived_Info;
	description = "Все, мы пришли.";
};
//Условие: ведем орков и подошли к деревне гоблинов
func int DIA_RakTarak_Arrived_Cond()
{
	if (C_OrcsFollow_Arrived())	{
		return TRUE;
	};
};
func void DIA_RakTarak_Arrived_Info()
{
	AI_Output(other,self,"DIA_RakTarak_Arrived_15_01");	//Все, мы пришли.
	//если Ар-Туш жив
	if (!Npc_IsDead(Orc_DS2P_ArTush)) {
	var C_NPC RakTarak; RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
	var C_NPC ArTush; ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
		AI_GotoNpc(ArTush, other);
		TRIA_Invite(ArTush);
		
		TRIA_Next(RakTarak);
		//Запись в дневнике. Квест «Защита для маленьких»: Довели
		B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_Arrived);
		AI_Output(self,other,"DIA_RakTarak_Arrived_99_02");	//Спасибо, морра. Твоя много делай для нас. Моя не знай, как твоя благодарить.
		
		TRIA_Next(ArTush);
			AI_Output(self,other,"DIA_RakTarak_Arrived_99_03");	//Ар-Туш	Уша бара, Рак-Тарак. Иште купра фэрес идга.
		
		TRIA_Next(RakTarak);
	AI_Output(other,self,"DIA_RakTarak_Arrived_15_04");	//Что он сказал?
		AI_Output(self,other,"DIA_RakTarak_Arrived_99_05");	//Ар-Туш сказать, что научить морра лучше сражаться большой меч.
		
		//Ар-Туш достает меч и показывает упражнение из DS1 с прыжком в конце
		TRIA_Next(ArTush);
			AI_Output(self,other,"XXX");	//
		AI_PlayAni(self,"T_1HSFREE");
		//+3 двуручное оружие
		B_RaiseFightTalent(other,NPC_TALENT_2H,3);
		AI_PrintScreen(PRINT_Learn2H,-1,-1,FONT_Screen,2);
		
		TRIA_Next(RakTarak);
		AI_Output(self,other,"DIA_RakTarak_Arrived_99_06");	//Морра запомнить? Такой удар мочь спасать жизнь.
		
		TRIA_Finish();
	}
	//иначе (Ар-Туш умер)
	else {
		//Запись в дневнике. Квест «Защита для маленьких»: Довели одного
		B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_ArrivedOne);
		AI_Output(self,other,"DIA_RakTarak_Arrived_99_02a");	//Спасибо, морра. Твоя спасти Рак-Тарок.
	};
};


/////////////////////////// Обучение ///////////////////////////
/* Учит силе до 200 и владению орочьим оружием
После выполнения квеста «Орк в беде»
Чему ты можешь научить меня?
Постоянный
Условие: согласился учить
Окончание: обучил всему и сказал об этом
1.	AI_Output(other,self,"DIA_RakTarak_What_15_00");	//Чему ты можешь научить меня?
только один раз
2.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//Моя научить твоя драться топор как орка. Еще делать твоя сильнее.
Запись в дневнике. «Учителя»: Рак-Тарок
Выбор (несколько):
	Info_AddChoiceВладение орочьим оружием (10LP): если еще не изучили
	Info_AddChoiceСила +1
	Info_AddChoiceСила +5
	Info_AddChoiceНАЗАД

Владение орочьим оружием.
1.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//Морра надо знать, что топор орка тяжелый. Сражаться им надо иметь много сила.
2.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//Морра брать топор в два руки и опускать на низ, чтобы не тратить много сила. Бить широко, работай весь тело.
3.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//Замахай один удар сверху вниз. Так быть врагу много боль и доспех не спасать.
Изучен навык «Орочье оружие»

Сила +1 (за 1 LP)
Сила +5 (за 5 LP)
Повышение навыка
если сила >= 200
1.	AI_Output(self,other,"DIA_RakTarak_What_99_01");	//Моя больше не мочь научить морра. Морра стать сильный как хаз.


*/