instance DIA_Nikki_EXIT(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Nikki_EXIT_condition;	
	information = DIA_Nikki_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Nikki_EXIT_condition(){	return TRUE;};
func void DIA_Nikki_EXIT_info(){	AI_StopProcessInfos(self);};
//
//	СТАРТОВЫЙ ДИАЛОГ
//
instance DIA_Nikki_Start(C_Info)	//Начальный диалог "Что, тоже пришел посмеяться над несчастной женщиной?"  //nr = 1
{
	npc = BAU_107_DS2P_Nikki;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Nikki_Start_condition;	
	information = DIA_Nikki_Start_info;
	important = TRUE;
};
func int DIA_Nikki_Start_condition(){	return TRUE;};
func void DIA_Nikki_Start_info()
{
	AI_Output(self,other,"DIA_Nikki_Start_17_00");	//Что, тоже пришел посмеяться над несчастной женщиной?
	AI_Output(self,other,"DIA_Nikki_Start_17_01");	//Прочь! Все вы мужики одинаковые, всегда приходите только за одним – воспользоваться моей слабостью.
	AI_Output(self,other,"DIA_Nikki_Start_17_02");	//А то, что я одинока и несчастна – это никого не волнует!
	
	AI_Output(other,self,"DIA_Nikki_Start_15_00");	//О чем ты говоришь? Я не сделаю тебе ничего плохого!
	
	AI_Output(self,other,"DIA_Nikki_Start_17_03");	//Да, конечно! Йорн тоже так говорил. А после этого обесчестил!
	AI_Output(self,other,"DIA_Nikki_Start_17_04");	//Как мне теперь жить с таким позором? Не знаешь?
	AI_Output(self,other,"DIA_Nikki_Start_17_05");	//Конечно, ведь ты такой же, как он! Все вы – подонки и думаете только одним местом.
	AI_Output(self,other,"DIA_Nikki_Start_17_06");	//Ну конечно, красивая одинока женщина, почему бы не воспользоваться?!
	
	AI_Output(other,self,"DIA_Nikki_Start_15_01");	//Ты можешь толком объяснить, что случилось?
	
	AI_Output(self,other,"DIA_Nikki_Start_17_07");	//А что тут объяснять?
	AI_Output(self,other,"DIA_Nikki_Start_17_08");	//Я носила еду Йорну и Адо, пиратам, которые сторожат пещеру неподалеку от деревни.
	AI_Output(self,other,"DIA_Nikki_Start_17_09");	//Мы всегда жили мирно, и наши мужчины никогда не делали ничего предосудительного, поэтому я без всякой опаски решила помочь накормить этих двоих.
	AI_Output(self,other,"DIA_Nikki_Start_17_10");	//Когда я пришла к пещере и передала продукты, Йорн схватил меня и потащил в лес.
	AI_Output(self,other,"DIA_Nikki_Start_17_11");	//Я кричала, отбивалась, но ему было все равно. Потом... потом...
	AI_PlayAni(self,"T_CRY");
	AI_Output(self,other,"DIA_Nikki_Start_17_12");	//Потом он сделал со мной это...
	AI_PlayAni(self,"T_CRY");
	AI_Output(self,other,"DIA_Nikki_Start_17_13");	//Мне и раньше не везло с мужчинами, а теперь меня никогда не возьмут замуж, и я останусь старой девой...
	AI_PlayAni(self,"T_CRY");
	
	AI_Output(other,self,"DIA_Nikki_Start_15_02");	//Успокойся, пожалуйста!
	AI_PlayAni(self,"T_CRY");
};
//
//	Диалог появляется после: стартового
//
instance DIA_Nikki_IWillPunishJorn(C_Info)	//	"Я проучу Йорна."  //nr = 3
{
	npc = BAU_107_DS2P_Nikki;
	nr = 3;
	permanent = FALSE;
	condition = DIA_Nikki_DoUHaveHealer_condition;	
	information = DIA_Nikki_DoUHaveHealer_info;
	description = "Я проучу Йорна.";
};
func int DIA_Nikki_DoUHaveHealer_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_DoUHaveHealer_info()
{
	AI_Output(other,self,"DIA_Nikki_DoUHaveHealer_15_00");	//Я проучу Йорна.
	AI_Output(self,other,"DIA_Nikki_DoUHaveHealer_17_00");	//Ты правда это сделаешь? Правда?!
	AI_Output(self,other,"DIA_Nikki_DoUHaveHealer_17_01");	//Я бы попросила наших мужчин, но большинство из них ушли в лес, а Хуно, Тамир и Кадар уже смирились с положением и даже рот боятся открыть.
	AI_Output(self,other,"DIA_Nikki_DoUHaveHealer_17_02");	//Поэтому у меня осталась надежда только на тебя! Прошу, помоги, убей эту гадину!
	
	AI_Output(other,self,"DIA_Nikki_DoUHaveHealer_15_01");	//Я сделаю все, что смогу.
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_Running,TOPIC_DS2P_BrokenHeart_Start);
};
//
//	Диалог появляется после: стартового
//
instance DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn(C_Info)	//	"Где находится пещера, которую сторожат Йорн и Адо?"  //nr = 4
{
	npc = BAU_107_DS2P_Nikki;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_condition;	
	information = DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_info;
	description = "Где находится пещера, которую сторожат Йорн и Адо?";
};
func int DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_info()
{
	AI_Output(other,self,"DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_15_00");	//Где находится пещера, которую сторожат Йорн и Адо?
	AI_Output(self,other,"DIA_Nikki_WhereIsCaveWhichIsGuardedByJorn_17_00");	//Это совсем недалеко. Она находится /*там-то и там-то*/. !!!НАДО ИСПРАВИТЬ
};
//
//	Диалог появляется после: стартового
//
instance DIA_Nikki_HowDoUFeel(C_Info)	//	"Как ты себя чувствуешь? (постоянный)"  //nr = 5
{
	npc = BAU_107_DS2P_Nikki;
	nr = 5;
	permanent = TRUE;
	condition = DIA_Nikki_HowDoUFeel_condition;	
	information = DIA_Nikki_HowDoUFeel_info;
	description = "Как ты себя чувствуешь?";
};
func int DIA_Nikki_HowDoUFeel_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_HowDoUFeel_info()
{
	AI_Output(other,self,"DIA_Nikki_HowDoUFeel_15_00");	//Как ты себя чувствуешь?
	AI_Output(self,other,"DIA_Nikki_HowDoUFeel_17_00");	//А как может себя чувствовать девушка, которую лишили чести?!
};
//
//	Диалог появляется после: стартового
//
instance DIA_Nikki_WhatDoUKnowAboutPirates(C_Info)	//	"Что ты знаешь о пиратах?"  //nr = 6
{
	npc = BAU_107_DS2P_Nikki;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Nikki_WhatDoUKnowAboutPirates_condition;	
	information = DIA_Nikki_WhatDoUKnowAboutPirates_info;
	description = "Что ты знаешь о пиратах?";
};
func int DIA_Nikki_WhatDoUKnowAboutPirates_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_WhatDoUKnowAboutPirates_info()
{
	AI_Output(other,self,"DIA_Nikki_WhatDoUKnowAboutPirates_15_00");	//Что ты знаешь о пиратах?
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_00");	//Я слышала, что главный у них Гард и еще этот, как его... Грег.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_01");	//Они постоянно грызутся как бешеные собаки.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_02");	//Еще есть пиратка Сью, только не вздумай называть ее Малышкой!
	
	AI_Output(other,self,"DIA_Nikki_WhatDoUKnowAboutPirates_15_01");	//Почему?
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_03");	//Она не любит, когда кто-то так к ней обращается.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_04");	//Я видела, как она заехала кулаком в челюсть одному из пиратов, когда тот нажрался как скотина и начал к ней приставать и называть ее Малышкой.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_05");	//Я, конечно, не считала, но могу предположить, что пару зубов этот бедолага лишился. Мне бы ее выдержку!
	
	AI_Output(other,self,"DIA_Nikki_WhatDoUKnowAboutPirates_15_02");	//Это все, что ты знаешь?
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_06");	//Я не слежу за всеми, но еще советовала бы обходить стороной Саймона. Он – отморозок и вечно голоден.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_07");	//У Хуно уже не осталось коров, а бездонный желудок этого пирата хочет еще и еще.
	AI_Output(self,other,"DIA_Nikki_WhatDoUKnowAboutPirates_17_08");	//Боюсь, как бы Саймон на людей кидаться не начал, чтобы куда-нибудь утащить и живьем сожрать.
};
//
//	Диалог появляется после: предыдущего "Что ты знаешь о пиратах?" и если говорил с Тамиром ("Расскажи мне о тех, кто живет в деревне")
//
instance DIA_Nikki_TamirSaidThatUHaveBadTemper(C_Info)	//	"Тамир говорил, что у тебя скверный характер."  //nr = 60
{
	npc = BAU_107_DS2P_Nikki;
	nr = 60;
	permanent = FALSE;
	condition = DIA_Nikki_TamirSaidThatUHaveBadTemper_condition;	
	information = DIA_Nikki_TamirSaidThatUHaveBadTemper_info;
	description = "Тамир говорил, что у тебя скверный характер.";
};
func int DIA_Nikki_TamirSaidThatUHaveBadTemper_condition(){	
	if(Npc_KnowsInfo(other,DIA_Nikki_WhatDoUKnowAboutPirates) && Npc_KnowsInfo(other,DIA_Tamir_TellMeAboutPeasants))
	{	return TRUE;};	
};
func void DIA_Nikki_TamirSaidThatUHaveBadTemper_info()
{
	AI_Output(other,self,"DIA_Nikki_TamirSaidThatUHaveBadTemper_15_00");	//Тамир говорил, что у тебя скверный характер. Но я вижу совсем другое. Ты очень милая девушка.
	AI_Output(self,other,"DIA_Nikki_TamirSaidThatUHaveBadTemper_17_00");	//Спасибо, ты тоже очень любезен. А от Тамира я ничего другого и не ожидала!
	AI_Output(self,other,"DIA_Nikki_TamirSaidThatUHaveBadTemper_17_01");	//Он просто очень зол на меня за то, что я ему отказала, когда он приходил с предложением на мне жениться.
	AI_Output(self,other,"DIA_Nikki_TamirSaidThatUHaveBadTemper_17_02");	//Он, конечно, хороший охотник, но это же не повод за него выходить, ведь правда?!
};
//
//	Диалог появляется после: стартового
//
instance DIA_Nikki_INeedHealer(C_Info)	//	"Мне нужен целитель."  //nr = 7
{
	npc = BAU_107_DS2P_Nikki;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Nikki_INeedHealer_condition;	
	information = DIA_Nikki_INeedHealer_info;
	description = "Мне нужен целитель.";
};
func int DIA_Nikki_INeedHealer_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_Start)){	return TRUE;};	};
func void DIA_Nikki_INeedHealer_info()
{
	AI_Output(other,self,"DIA_Nikki_INeedHealer_15_00");	//Мне нужен целитель.
	AI_Output(self,other,"DIA_Nikki_INeedHealer_17_00");	//Тебе нужно идти к Цимму – он наш алхимик и врачеватель. Его дом находится здесь, в деревне.
};
//
//	Диалог появляется после: выбрал ветку плохой Никки в диалоге с Тамиром.
//
instance DIA_Nikki_KoloHasReturned(C_Info)	//	"Никки, мы видели его!"  //nr = 8
{
	npc = BAU_107_DS2P_Nikki;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Nikki_KoloHasReturned_condition;	
	information = DIA_Nikki_KoloHasReturned_info;
	description = "Никки, мы видели его!";
};
func int DIA_Nikki_KoloHasReturned_condition(){	if(DIA_Tamir_WithRegardToNikki_CHOICE == NIKKI_IS_BAD_WOMAN){	return TRUE;};	};
func void DIA_Nikki_KoloHasReturned_info()
{
	var c_npc Nikki;    Nikki = Hlp_GetNpc(BAU_107_DS2P_Nikki); // Ihm gehort der Dialog
   var c_npc Tamir;   Tamir = Hlp_GetNpc(BAU_105_DS2P_Tamir);

	TRIA_Invite(Tamir);   //Включаем Тамира в триалог.
   TRIA_Start();         //Начинаем триалог
	// ГГероя и Никки приглашать в триалог не надо, только "третьих лиц"
	// Герой начинает говорить с Никки (self = Nikki, other = Hero)
   TRIA_Next(Nikki);
   DIAG_Reset();
	
	AI_Output(other,self,"DIA_Nikki_KoloHasReturned_15_00");	//Никки, мы видели его!
	DIAG("DONTKNOW", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_00");	//(непонимающе) Кого?
	AI_Output(other,self,"DIA_Nikki_KoloHasReturned_15_01");	//Ну как же, Коло! Он вернулся и ищет тебя. Скорее, беги, встречай своего любимого.
	DIAG("IGETYOU", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_01");	//(злобно) Ты что, белены объелся?! Коло мертв!
	
	// Теперь (self = Tamir, other = Hero)
   TRIA_Next(Tamir);
	AI_TurnToNpc(self,Nikki);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_12_00");	//Да нет же. Он говорит правду, я тоже видел Коло. Он жив и здоров!
	
	// Теперь (self = Nikki, other = Hero)
   TRIA_Next(Nikki);
	AI_TurnToNpc(self,Tamir);
	DIAG("IGETYOU", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_02");	//(рыча) Вы что, меня за дуру держите? Я сама видела его труп... (замолкает)
	
	TRIA_Next(Tamir);
	AI_TurnToNpc(self,Nikki);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_12_01");	//Как ты могла видеть его труп, если он пропал в лесу?
	
	TRIA_Next(Nikki);
	DIAG("DONTKNOW", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_03");	//Ну я...
	
	TRIA_Next(Tamir);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_12_02");	//Это ты убила его! Я так и знал!
	
	TRIA_Next(Nikki);
	DIAG("NO", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_04");	//Нет, нет... Он сам виноват!
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_05");	//Он не слушал меня, постоянно нес чушь про свои чувства! Ползал на коленях, умолял быть с ним всю жизнь...
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_06");	//Тьфу... Не мужик, а тряпка!
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_07");	//Он меня просто бесил, я готова была его разорвать!
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_08");	//Чертов Коло, как же я ненавижу тебя! Ты даже после смерти умудрился меня достать!
	
	TRIA_Next(Tamir);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_12_03");	//Теперь ты ответишь за свое преступление перед советом деревни.
	
	TRIA_Next(Nikki);
	DIAG("T_FORGETIT", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_09");	//Каким советом? Ты что, последние мозги потерял?
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_10");	//Нет никакого совета, теперь тут новые порядки! И ни тебе, ни кому бы то еще решать мою судьбу.
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_11");	//Или, быть может, ты побежишь к пиратам и попросишь ИХ провести совет деревни, а?! (злобно смеется)
	
	DIAG("T_COMEOVERHERE", 0, 1);
	AI_Output(self,other,"DIA_Nikki_KoloHasReturned_17_12");	//Убирайся из моего дома!
	
	DIAG_Reset();
	TRIA_Finish();
	AI_StopProcessInfos(self);
};
//
//	Диалог появляется после: предыдущего триалога "Никки, мы видели его!"
//
instance DIA_Nikki_IWasOnHighOpinionOfU(C_Info)	//	"Я была о тебе более высоко мнения."  //nr = 1
{
	npc = BAU_107_DS2P_Nikki;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Nikki_IWasOnHighOpinionOfU_condition;	
	information = DIA_Nikki_IWasOnHighOpinionOfU_info;
	important = true;
};
func int DIA_Nikki_IWasOnHighOpinionOfU_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_KoloHasReturned)){	return TRUE;};	};
func void DIA_Nikki_IWasOnHighOpinionOfU_info()
{
	AI_Output(self,other,"DIA_Nikki_IWasOnHighOpinionOfU_17_00");	//Я была о тебе более высоко мнения. Зря ты влез в это дело.
	AI_Output(self,other,"DIA_Nikki_IWasOnHighOpinionOfU_17_01");	//Советую держать язык за зубами! А то мало ли, вдруг я и правда, ведьма, как шепчутся селяне. (громко смеется)
	AI_StopProcessInfos(self);
};
//
//	Диалог появляется после: Если пройден квест "Да ты Ведьма!" и взят квест "Разбитое сердце"
//
const string cDIA_Nikki_UreLyingAboutJorn_Lie	= "Я не верю тебе!";
const string cDIA_Nikki_UreLyingAboutJorn_TRUE	= "Хорошо, возможно, в этот раз ты не обманываешь.";
instance DIA_Nikki_UreLyingAboutJorn(C_Info)	//	"Мне кажется, что ты обманываешь на счет Йорна."  //nr = 9
{
	npc = BAU_107_DS2P_Nikki;
	nr = 9;
	permanent = FALSE;
	condition = DIA_Nikki_UreLyingAboutJorn_condition;	
	information = DIA_Nikki_UreLyingAboutJorn_info;
	description = "Мне кажется, что ты обманываешь на счет Йорна.";
};
func int DIA_Nikki_UreLyingAboutJorn_condition(){	
	if((MIS_DS2P_BrokenHeart == LOG_Running) && (MIS_DS2P_YouAreWitch == LOG_SUCCESS) && (DIA_Tamir_WithRegardToNikki_CHOICE == NIKKI_IS_BAD_WOMAN))
	{return TRUE;};	
};
func void DIA_Nikki_UreLyingAboutJorn_info()
{
	AI_Output(other,self,"DIA_Nikki_UreLyingAboutJorn_15_00");	//Мне кажется, что ты обманываешь насчет Йорна.
	AI_Output(other,self,"DIA_Nikki_UreLyingAboutJorn_15_01");	//После того, что я знаю о тебе, мне кажется, что ты врешь. Может быть, ты хотела использовать его как Коло?
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_17_00");	//(злобно) Ну, конечно!
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_17_01");	//Если я раз оступилась, то теперь на меня можно повесить всех собак?
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_17_02");	//Я от чистого сердца хотела помочь, но этот Йорн воспользовался мной! Я говорю правду!
	Info_ClearChoices(DIA_Nikki_UreLyingAboutJorn);
	Info_AddChoice(DIA_Nikki_UreLyingAboutJorn,	Dialog_Back,	DIA_Nikki_UreLyingAboutJorn_Back);
	Info_AddChoice(DIA_Nikki_UreLyingAboutJorn,	cDIA_Nikki_UreLyingAboutJorn_Lie,	DIA_Nikki_UreLyingAboutJorn_Lie);
	Info_AddChoice(DIA_Nikki_UreLyingAboutJorn,	cDIA_Nikki_UreLyingAboutJorn_TRUE,	DIA_Nikki_UreLyingAboutJorn_True);
};
func void DIA_Nikki_UreLyingAboutJorn_Back(){	Info_ClearChoices(DIA_Nikki_UreLyingAboutJorn);};
func void DIA_Nikki_UreLyingAboutJorn_Lie()
{
	AI_Output(other,self,"DIA_Nikki_UreLyingAboutJorn_Lie_15_00");	//Я не верю тебе!
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_Lie_17_01");	//(злобно) Да мне плевать, что ты думаешь! Ты такой же подонок, как и все остальные.
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_Lie_17_02");	//Да чтоб тебя варги сожрали, да чтоб тебе не было удачи до конца жизни! Будь ты проклят!
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_Lie_17_03");	//Ты ничем не лучше этого Йорна и Коло, и Тамира! Все вы – мерзавцы! Убирайся!
	AI_StopProcessInfos(self);
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_BrokenHeart_Success2);
	BAD_SUCCESS_MIS_DS2P_BrokenHeart = TRUE;
};
func void DIA_Nikki_UreLyingAboutJorn_True()
{
	AI_Output(other,self,"DIA_Nikki_UreLyingAboutJorn_True_15_00");	//Хорошо, возможно, в этот раз ты не обманываешь.
	AI_Output(self,other,"DIA_Nikki_UreLyingAboutJorn_True_17_00");	//Знала, что ты не такой как они! Ты настоящий, честный человек и никогда не бросишь одинокую женщину, когда у нее горе!
	Info_ClearChoices(DIA_Nikki_UreLyingAboutJorn);
};
//
//	Диалог появляется после: Если пройден квест "Разбитое сердце" при выборе в предыдущем диалоге: "Я не верю тебе!"
//
instance DIA_Nikki_GetOutBastard(C_Info)	//	"Убирайся прочь, выродок!"  //nr = 90
{
	npc = BAU_107_DS2P_Nikki;
	nr = 9;
	permanent = FALSE;	//Redleha: или TRUE
	condition = DIA_Nikki_GetOutBastard_condition;	
	information = DIA_Nikki_GetOutBastard_info;
	important = true;
};
func int DIA_Nikki_GetOutBastard_condition(){
	if((BAD_SUCCESS_MIS_DS2P_BrokenHeart == TRUE) && Npc_IsInState(self,ZS_Talk))
	{return TRUE;};	
};
func void DIA_Nikki_GetOutBastard_info()
{
	AI_Output(self,other,"DIA_Nikki_GetOutBastard_17_00");	//Убирайся прочь, выродок!
	AI_StopProcessInfos(self);
};

//NS - 14/06/2013 ===========
//  Сообщить о смерти Йорна, если взят квест
//===========================
instance DIA_Nikki_JornDead(C_Info)	//	"Я убил Йорна."  //nr = 0
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Nikki_JornDead_condition;	
	information = DIA_Nikki_JornDead_info;
	description = "Я убил Йорна.";
};
func int DIA_Nikki_JornDead_condition()
{	
	if ((MIS_DS2P_BrokenHeart == LOG_Running) && Npc_IsDead(PIR_210_DS2P_Jorn))
	{	return TRUE;};	
};
func void DIA_Nikki_JornDead_info()
{
	var int x;
	AI_Output(other,self,"DIA_Nikki_JornDead_15_00");	//Я убил Йорна.
	B_GivePlayerXP(XP_MIS_BrokenHeart);
		AI_Output(self,other,"DIA_Nikki_JornDead_17_00");	//Спасибо тебе! Теперь моя честь восстановлена. Возьми от меня эту скромную награду.
	//Дает 300 золотых
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ItMi_Gold,300);
	};
	//Запись в дневнике "Разбитое сердце" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_BrokenHeart_Success);
};

//NS - 14/06/2013 ===========
//  Узнал, что Никки врет насчет Йорна
//===========================
instance DIA_Nikki_TalkedToJorn(C_Info)	//	"Я поговорил с Йорном."  //nr = 0
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Nikki_TalkedToJorn_condition;	
	information = DIA_Nikki_TalkedToJorn_info;
	description = "Я проучу Йорна.";
};
func int DIA_Nikki_TalkedToJorn_condition()
{	
	if ((MIS_DS2P_BrokenHeart == LOG_Running) && Npc_KnowsInfo(other,DIA_Jorn_NikkiWantsMeToKillU))
	{	return TRUE;};	
};
func void DIA_Nikki_TalkedToJorn_info()
{
	AI_Output(other,self,"DIA_Nikki_TalkedToJorn_15_00");	//Я поговорил с Йорном.
	AI_Output(other,self,"DIA_Nikki_TalkedToJorn_15_01");	//Он утверждает, что ты сама предложила свое тело.
		AI_Output(self,other,"DIA_Nikki_TalkedToJorn_17_02");	//Что? Да как ты смеешь такое говорить, идиот?! Ты кому веришь? Мне или этому бесстыжему пирату?
		AI_Output(self,other,"DIA_Nikki_TalkedToJorn_17_03");	//Мало того, что он воспользовался моей слабостью, так теперь еще и наговаривает на бедную женщину! Это непостижимо!
	AI_Output(other,self,"DIA_Nikki_TalkedToJorn_15_04");	//(про себя) Если Никки врет, то зачем ей было соблазнять Йорна?
	AI_Output(other,self,"DIA_Nikki_TalkedToJorn_15_05");	//Может быть, она хотел проникнуть в пещеру? Нужно это выяснить.

	//Запись в дневнике "Разбитое сердце" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_Running,TOPIC_DS2P_BrokenHeart_NikkiRefuse);
};


//NS - 27/06/2013 ================================================
// По квесту "Кто украл мое железо?" 	nr=101
//================================================================

instance DIA_Nikki_AboutStolenIron(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 101;
	condition = DIA_Nikki_AboutStolenIron_condition;	
	information = DIA_Nikki_AboutStolenIron_info;
	description = "Кто-то украл все железо из кузницы.";
};
func int DIA_Nikki_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Nikki_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Nikki_AboutStolenIron_15_00");	//Кто-то украл все железо из кузницы.
		AI_Output(self,other,"DIA_Nikki_AboutStolenIron_17_01");	//Я думаю, это Густав вернулся и забрал свое добро.
		AI_Output(self,other,"DIA_Nikki_AboutStolenIron_17_02");	//С какой стати ему оставлять свои железяки пиратам? Чтобы они наделали еще больше оружия и всех нас тут перерезали?!
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 27/06/2013 ================================================
// После ремонта мельницы (если Никки не злится)
//================================================================
instance DIA_Nikki_MillRepaired(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_MillRepaired_condition;	
	information = DIA_Nikki_MillRepaired_info;
	important = TRUE;
};
func int DIA_Nikki_MillRepaired_condition()
{
	if ((Joseph_RepairMill_Done == TRUE) && (BAD_SUCCESS_MIS_DS2P_BrokenHeart == FALSE))	{	return TRUE;	};
};
func void DIA_Nikki_MillRepaired_info()
{
		AI_Output(self,other,"DIA_Nikki_MillRepaired_17_00");	//Спасибо тебе. Я слышала, что ты помог починить мельницу.
	AI_StopProcessInfos(self);
};


//NS - 02/07/2013 ================================================
// После смерти Кадара (если Никки не злится)
//================================================================
instance DIA_Nikki_KadarDead(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_KadarDead_condition;	
	information = DIA_Nikki_KadarDead_info;
	important = TRUE;
};
func int DIA_Nikki_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk)
		&& (BAD_SUCCESS_MIS_DS2P_BrokenHeart == FALSE))
	{	return TRUE;	};
};
func void DIA_Nikki_KadarDead_info()
{
		AI_Output(self,other,"DIA_Nikki_KadarDead_17_00");	//Я слышал, что Кадар и Кара погибли.
		AI_Output(self,other,"DIA_Nikki_KadarDead_17_01");	//Пусть они были и не самыми приятными людьми, но все равно их жаль.
	AI_StopProcessInfos(self);
};


//NS - 03/07/2013 ================================================
// По квесту "Азартный игрок" (если Никки не злится)
//================================================================
// Попросить сшить косюмы, если Мария еще не сшила
instance DIA_Nikki_CanUSewClothes(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_CanUSewClothes_condition;	
	information = DIA_Nikki_CanUSewClothes_info;
	description = "Ты умеешь шить одежду?";
};
func int DIA_Nikki_CanUSewClothes_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_GotForgeBellows) && (Maria_MadeClothes == FALSE)
		&& (BAD_SUCCESS_MIS_DS2P_BrokenHeart == FALSE))
	{	return TRUE;	};
};
func void DIA_Nikki_CanUSewClothes_info()
{
	AI_Output(other,self,"DIA_Nikki_CanUSewClothes_15_00");	//Ты умеешь шить одежду?
		AI_Output(self,other,"DIA_Nikki_CanUSewClothes_17_01");	//Я много чего умею.
	AI_Output(other,self,"DIA_Nikki_CanUSewClothes_15_02");	//Сможешь сделать для меня два костюма?
		AI_Output(self,other,"DIA_Nikki_CanUSewClothes_17_03");	//Это еще с какой стати? Я что, твоя жена или девушка, чтобы для тебя костюмы делать? 
	AI_Output(other,self,"DIA_Nikki_CanUSewClothes_15_04");	//Это не для меня, а для дела.
		AI_Output(self,other,"DIA_Nikki_CanUSewClothes_17_05");	//Тем более. Никакого такого дела я не знаю и знать не хочу.
};

//"Мне нужно платье." - активируется, если взят квест "Платье."
// nr = 1

instance DIA_Nikki_Dress4Sue(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_Dress4Sue_condition;	
	information = DIA_Nikki_Dress4Sue_info;
	description = "Мне нужно платье.";
	permanent = FALSE;
};

func int DIA_Nikki_Dress4Sue_condition()
{
	if (MIS_DS2P_Dress4Sue == Log_Running)
	{	
		return TRUE;	
	};
};

func void DIA_Nikki_Dress4Sue_info()
{
	AI_Output(other,self,"DIA_Nikki_Dress4Sue_15_00");	//Мне нужно платье.
	AI_Output(self,other,"DIA_Nikki_Dress4Sue_17_01");	//Даже не хочу спрашивать, зачем оно тебе. С тебя 500 золотых. И ни монетой меньше.
	Nikki_KnowAboutDress = TRUE;
};

//"Вот, держи деньги." - активируется, если взят квест "Платье.", и Никки готова продать платье ГГ
// nr = 1

instance DIA_Nikki_SellDress(C_Info)
{
	npc = BAU_107_DS2P_Nikki;
	nr = 0;
	condition = DIA_Nikki_SellDress_condition;	
	information = DIA_Nikki_SellDress_info;
	description = "Мне нужно платье.";
	permanent = FALSE;
};

func int DIA_Nikki_SellDress_condition()
{
	if ((MIS_DS2P_Dress4Sue == Log_Running) && Nikki_KnowAboutDress)
	{	
		return TRUE;	
	};
};

func void DIA_Nikki_SellDress_info()
{
	AI_Output(other,self,"DIA_Nikki_SellDress_15_00");	//Вот, держи деньги.
	if (Npc_HasItems(other,ItMI_Gold) >= 500) // Если у ГГ есть 500 золота
	{
		AI_Output(self,other,"DIA_Nikki_SellDress_17_01");	//Хорошо, вот платье.
		CreateInvItems(self,0,1); // UNFINISHED - Надо вставить код платья
		B_GiveInvItems(self,other,0,1); // UNFINISHED - Надо вставить код платья
		B_GiveInvItems(other,self,ItMi_Gold,500); // Отдаем 500 золотых Марии
		Nikki_KnowAboutDress = FALSE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,LOG_Running,TOPIC_DS2P_Dress4Sue_InProgress_02);
	}
	else
	{
		AI_Output(self,other,"DIA_Nikki_SellDress_17_02");	//Пятьсот монет, чужеземец, ровно пятьсот.
	};
};