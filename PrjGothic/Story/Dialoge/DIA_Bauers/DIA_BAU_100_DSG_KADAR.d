instance DIA_Kadar_EXIT(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Kadar_EXIT_condition;	
	information = DIA_Kadar_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Kadar_EXIT_condition(){	return TRUE;};
func void DIA_Kadar_EXIT_info(){	AI_StopProcessInfos(self);};
//
//	СТАРТОВЫЙ ДИАЛОГ
//
instance DIA_Kadar_WhoAU(C_Info)	//Начальный диалог "Кто ты?"  //nr = 1
{
	npc = BAU_100_DS2P_KADAR;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Kadar_WhoAU_condition;	
	information = DIA_Kadar_WhoAU_info;
	description = "Кто ты?";
};
func int DIA_Kadar_WhoAU_condition(){	return TRUE;};
func void DIA_Kadar_WhoAU_info()
{
	AI_Output(other,self,"DIA_Kadar_WhoAU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Kadar_WhoAU_10_00");	//Меня зовут Кадар, я бывший староста деревни.
	AI_Output(other,self,"DIA_Kadar_WhoAU_15_01");	//Почему бывший?
	AI_Output(self,other,"DIA_Kadar_WhoAU_10_01");	//Потому что теперь я ничего не решаю, и мое слово значит не больше, чем блеяние овцы из загона Барока. Теперь здесь решают пираты.
};
//
//	Диалог появляется после: стартового "Кто ты?"
//
instance DIA_Kadar_DoUHaveHealer(C_Info)	//	"У вас есть целитель?"  //nr = 3
{
	npc = BAU_100_DS2P_KADAR;
	nr = 3;
	permanent = FALSE;
	condition = DIA_Kadar_DoUHaveHealer_condition;	
	information = DIA_Kadar_DoUHaveHealer_info;
	description = "У вас есть целитель?";
};
func int DIA_Kadar_DoUHaveHealer_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU)){	return TRUE;};	};
func void DIA_Kadar_DoUHaveHealer_info()
{
	AI_Output(other,self,"DIA_Kadar_DoUHaveHealer_15_00");	//У вас есть целитель?
	AI_Output(self,other,"DIA_Kadar_DoUHaveHealer_10_00");	//Да, его зовут Цимм. Его дом находится неподалеку. Если тебя ранили или ты приболел, он быстро поставит тебя на ноги.
};
//
//	Диалог появляется после: стартового "Кто ты?"
//
instance DIA_Kadar_WhatDoUKnowAboutPirates(C_Info)	//	"Что ты знаешь о пиратах?"  //nr = 4
{
	npc = BAU_100_DS2P_KADAR;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Kadar_WhatDoUKnowAboutPirates_condition;	
	information = DIA_Kadar_WhatDoUKnowAboutPirates_info;
	description = "Что ты знаешь о пиратах?";
};
func int DIA_Kadar_WhatDoUKnowAboutPirates_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU)){	return TRUE;};	};
func void DIA_Kadar_WhatDoUKnowAboutPirates_info()
{
	AI_Output(other,self,"DIA_Kadar_WhatDoUKnowAboutPirates_15_00");	//Что ты знаешь о пиратах?
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_00");	//Главный у них Гард, редкостная скотина, очень вспыльчивый, не терпит, чтобы кто-то ему перечил.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_01");	//Я как-то хотел вступиться за Хуно, нашего пахаря, когда тот вовремя не принес муку с мельницы.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_02");	//Так этот Гард со всего маху ударил меня эфесом своей шпаги, сказав при этом, что если я ”еще раз открою свою пасть”, он мне отрежет язык!
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_03");	//Это не люди, это звери!
	AI_Output(other,self,"DIA_Kadar_WhatDoUKnowAboutPirates_15_01");	//А кто тогда у них Грег? Раньше он тоже был капитаном.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_04");	//Я так и предполагал, что этот Грег тоже важная птица. В команде Гарда, как я понял, он первый помощник.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_05");	//У них постоянно идут перепалки между собой. Мне кажется, они готовы друг другу глотки перегрызть.
	AI_Output(self,other,"DIA_Kadar_WhatDoUKnowAboutPirates_10_06");	//Надеюсь, так и будет.	
};
//
//	Диалог появляется после: предыдущего "Что ты знаешь о пиратах?"
//
instance DIA_Kadar_WhatElseCanUTellAboutPirates(C_Info)		//	"Что ты еще можешь рассказать о пиратах?"  //nr = 40
{
	npc = BAU_100_DS2P_KADAR;
	nr = 40;
	permanent = FALSE;
	condition = DIA_Kadar_WhatElseCanUTellAboutPirates_condition;	
	information = DIA_Kadar_WhatElseCanUTellAboutPirates_info;
	description = "Что ты еще можешь рассказать о пиратах?";
};
func int DIA_Kadar_WhatElseCanUTellAboutPirates_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhatDoUKnowAboutPirates)){	return TRUE;};	};
func void DIA_Kadar_WhatElseCanUTellAboutPirates_info()
{
	AI_Output(other,self,"DIA_Kadar_WhatElseCanUTellAboutPirates_15_00");	//Что ты еще можешь рассказать о пиратах?
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_00");	//Мне не со всеми выпала ”честь” поговорить, но из тех, с кем я общался, могу сказать одно – будь острожен к Саймоном. Он очень опасен!
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_01");	//Когда произошло нападение на деревню, этот ублюдок ранил нескольких крестьян, а когда все закончилось, публично добил в назидание другим.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_02");	//Он постоянно тренируется со своим огромным двуручным мечом, я даже мимо боюсь проходить.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_03");	//Кто знает, что ему в голову взбредет.
	
	AI_Output(other,self,"DIA_Kadar_WhatElseCanUTellAboutPirates_15_01");	//Тебя послушать, все пираты полные отморозки. (смеется)
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_04");	//Нет, есть и вполне нормальные.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_05");	//Например, Зедд, очень веселый парень, варит самогон, даже меня пару раз угощал.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_06");	//Есть еще Карах, мастер дальнобойного оружия, еще Сью, воительница. Даже не знаю, как ее угораздило попасть в эту банду.
	AI_Output(self,other,"DIA_Kadar_WhatElseCanUTellAboutPirates_10_07");	//Про остальных ничего сказать не могу. Пообщайся с ними сам, если тебе это так интересно.
};
//
//	Диалог появляется после: стартового "Кто ты?" и если узнал у Тамира, что Кадар скупает шкуры
//
instance DIA_Kadar_CanISellUTrophies(C_Info)	//	"Я могу продать тебе охотничьи трофеи?"  //nr = 5
{
	npc = BAU_100_DS2P_KADAR;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Kadar_CanISellUTrophies_condition;	
	information = DIA_Kadar_CanISellUTrophies_info;
	description = "Я могу продать тебе охотничьи трофеи?";
};
func int DIA_Kadar_CanISellUTrophies_condition(){	
	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU) && Npc_KnowsInfo(other,DIA_Tamir_WhatDoUDoWithSkins))
	{	return TRUE;};	
};
func void DIA_Kadar_CanISellUTrophies_info()
{
	AI_Output(other,self,"DIA_Kadar_CanISellUTrophies_15_00");	//Я могу продать тебе охотничьи трофеи?
	AI_Output(self,other,"DIA_Kadar_CanISellUTrophies_10_00");	//Да. Я куплю все, что тебе удастся добыть. Это особенно важно теперь, когда охота практически не ведется.
	AI_Output(self,other,"DIA_Kadar_CanISellUTrophies_10_01");	//Я дам тебе даже чуть больше золота за шкуры и клыки, чем плачу обычно.
	B_DSG_Log_OpenClose(TOPIC_BauerTrader,LOG_NOTE,-1,"Кадар покупает шкуры и клыки по более высокой цене.");
};
//
//	Диалог появляется после: стартового "Кто ты?"
//
instance DIA_Kadar_WhatAUGoingToDo(C_Info)	//	"Что ты собираешься предпринять?"  //nr = 6
{
	npc = BAU_100_DS2P_KADAR;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Kadar_WhatAUGoingToDo_condition;	
	information = DIA_Kadar_WhatAUGoingToDo_info;
	description = "Что ты собираешься предпринять?";
};
func int DIA_Kadar_WhatAUGoingToDo_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU)){	return TRUE;};	};
func void DIA_Kadar_WhatAUGoingToDo_info()
{
	AI_Output(other,self,"DIA_Kadar_WhatAUGoingToDo_15_00");	//Что ты собираешься предпринять?
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_00");	//А что тут можно сделать? В деревне практически нет мужчин, наши женщины под постоянным присмотром пиратов.
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_01");	//Если даже мы и попробуем что-то предпринять, они сразу же убьют наших жен. Я не могу рисковать!
	AI_Output(other,self,"DIA_Kadar_WhatAUGoingToDo_15_01");	//Но нельзя же просто так сидеть и ничего не делать?
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_02");	//Это тебе нечего терять, кроме своей жизни, а я не готов проливать кровь невинных. Мы не воины, а обычные фермеры, и не умеем сражаться.
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_03");	//Поэтому нам придется смириться с этой ситуацией и надеяться, что Иннос не отвернется от нас.
	AI_Output(other,self,"DIA_Kadar_WhatAUGoingToDo_15_02");	//А где ваши мужчины?
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_04");	//Большинство из них скрывается в лесу. После нападения они не появлялись в деревне.
	AI_Output(self,other,"DIA_Kadar_WhatAUGoingToDo_10_05");	//Возможно, они решили, что быть на свободе лучше, чем в рабстве у пиратов. Не могу их за это винить.
};
//
//	Диалог появляется после: предыдущего "Что ты собираешься предпринять?"
//
instance DIA_Kadar_CanIHelpU(C_Info)		//	"Я могу чем-нибудь помочь?"  //nr = 60
{
	npc = BAU_100_DS2P_KADAR;
	nr = 60;
	permanent = FALSE;
	condition = DIA_Kadar_CanIHelpU_condition;	
	information = DIA_Kadar_CanIHelpU_info;
	description = "Я могу чем-нибудь помочь?";
};
func int DIA_Kadar_CanIHelpU_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhatAUGoingToDo)){	return TRUE;};	};
func void DIA_Kadar_CanIHelpU_info()
{
	AI_Output(other,self,"DIA_Kadar_CanIHelpU_15_00");	//Я могу чем-нибудь помочь?
	AI_Output(self,other,"DIA_Kadar_CanIHelpU_10_00");	//Думаю, можешь.
	AI_Output(self,other,"DIA_Kadar_CanIHelpU_10_01");	//Пиратам нужен человек, чтобы отнести припасы в пещеру, где находятся наши женщины.
	AI_Output(self,other,"DIA_Kadar_CanIHelpU_10_02");	//Я слышал, как Гард орал, что ”ни одна ленивая скотина ничего не хочет делать” и некому отнести провиант.
};
//
//	Диалог появляется после: предыдущего "Что ты собираешься предпринять?"
//
instance DIA_Kadar_EverythingWillBeFine(C_Info)		//	"Не унывай, все будет хорошо!"  //nr = 61
{
	npc = BAU_100_DS2P_KADAR;
	nr = 61;
	permanent = true;
	condition = DIA_Kadar_EverythingWillBeFine_condition;	
	information = DIA_Kadar_EverythingWillBeFine_info;
	description = "Не унывай, все будет хорошо!";
};
func int DIA_Kadar_EverythingWillBeFine_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhatAUGoingToDo)){	return TRUE;};	};
func void DIA_Kadar_EverythingWillBeFine_info()
{
	AI_Output(other,self,"DIA_Kadar_EverythingWillBeFine_15_00");	//Не унывай, все будет хорошо!
	AI_Output(self,other,"DIA_Kadar_EverythingWillBeFine_10_00");	//(вздыхает) Что-то мне не верится в это.
};
//
//	Диалог появляется после: предыдущего "Что ты собираешься предпринять?"
//
instance DIA_Kadar_HowDidUBecomePrefect(C_Info)		//	"Как ты стал старостой?"  //nr = 62
{
	npc = BAU_100_DS2P_KADAR;
	nr = 62;
	permanent = false;
	condition = DIA_Kadar_HowDidUBecomePrefect_condition;	
	information = DIA_Kadar_HowDidUBecomePrefect_info;
	description = "Как ты стал старостой?";
};
func int DIA_Kadar_HowDidUBecomePrefect_condition(){	if(Npc_KnowsInfo(other,DIA_Kadar_WhatAUGoingToDo)){	return TRUE;};	};
func void DIA_Kadar_HowDidUBecomePrefect_info()
{
	AI_Output(other,self,"DIA_Kadar_HowDidUBecomePrefect_15_00");	//Как ты стал старостой?
	AI_Output(self,other,"DIA_Kadar_HowDidUBecomePrefect_10_00");	//Раз в десять лет вся деревня собирается в ратуше, чтобы выбрать одного из нас, человека достаточно мудрого и решительного, чтобы управлять деревней, решать проблемы, разрешать споры.
	AI_Output(self,other,"DIA_Kadar_HowDidUBecomePrefect_10_01");	//Каждый человек предлагает одну кандидатуру, затем идет открытое голосование.
	AI_Output(self,other,"DIA_Kadar_HowDidUBecomePrefect_10_02");	//Большинство в деревне выбрали меня, и до нынешнего времени все было хорошо и все были довольны своим выбором.
};
//
//	Диалог появляется после: стартового "Кто ты?" и если взят квест ”Внук рыбака” (если еще не получил информацию у Марии)
//
instance DIA_Kadar_WhereCanIFindGaron(C_Info)	//	"Ты не знаешь, где я могу найти Гарона?"  //nr = 7
{
	npc = BAU_100_DS2P_KADAR;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Kadar_WhereCanIFindGaron_condition;	
	information = DIA_Kadar_WhereCanIFindGaron_info;
	description = "Ты не знаешь, где я могу найти Гарона?";
};
func int DIA_Kadar_WhereCanIFindGaron_condition(){	
	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU) && (MIS_DS2P_GrandsonOfFisherman == LOG_Running) && !Npc_KnowsInfo(other,DIA_Maria_AboutGaron))
	{	return TRUE;};	
};
func void DIA_Kadar_WhereCanIFindGaron_info()
{
	AI_Output(other,self,"DIA_Kadar_WhereCanIFindGaron_15_00");	//Ты не знаешь, где я могу найти Гарона?
	AI_Output(self,other,"DIA_Kadar_WhereCanIFindGaron_10_00");	//Я видел, как пираты тащили его в ратушу. Больше я его не видел.
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_KardarSeen);
};
//
//	Диалог появляется после: стартового "Кто ты?" и если еще не спрашивал про карту у Тамира
//
instance DIA_Kadar_INeedMapOfIsland(C_Info)	//	"Мне нужна карта острова."  //nr = 8
{
	npc = BAU_100_DS2P_KADAR;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Kadar_INeedMapOfIsland_condition;	
	information = DIA_Kadar_INeedMapOfIsland_info;
	description = "Мне нужна карта острова.";
};
func int DIA_Kadar_INeedMapOfIsland_condition(){	
	if(Npc_KnowsInfo(other,DIA_Kadar_WhoAU) && !Npc_KnowsInfo(other,DIA_Tamir_DoUHaveMapOfIsland))
	{	return TRUE;};	
};
func void DIA_Kadar_INeedMapOfIsland_info()
{
	AI_Output(other,self,"DIA_Kadar_INeedMapOfIsland_15_00");	//Мне нужна карта острова. 
	AI_Output(self,other,"DIA_Kadar_INeedMapOfIsland_10_00");	//Увы, ничем не могу помочь. Я редко покидаю деревню, поэтому карта мне ни к чему. Попробуй обратиться к Тамиру. Он охотник, и наверняка тебе поможет.
};


//NS - 27/06/2013 ===========
// По квесту "Кто украл мое железо?" 	nr=11
//===========================

instance DIA_Kadar_AboutStolenIron(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 11;
	condition = DIA_Kadar_AboutStolenIron_condition;	
	information = DIA_Kadar_AboutStolenIron_info;
	description = "В деревне завелся вор.";
};
func int DIA_Kadar_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Kadar_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Kadar_AboutStolenIron_15_00");	//В деревне завелся вор.
		AI_Output(self,other,"DIA_Kadar_AboutStolenIron_10_01");	//Одной проблемой больше, одной меньше. В текущей ситуации это неудивительно.
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 02/07/2013 ===========
// Сообщить о смерти Кары	(+опыт) 	nr=21
//===========================
instance DIA_Kadar_KaraDead(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 21;
	condition = DIA_Kadar_KaraDead_condition;	
	information = DIA_Kadar_KaraDead_info;
	description = "У меня для тебя печальные вести.";
};
func int DIA_Kadar_KaraDead_condition()
{
	if (Npc_IsDead(Kara) && Npc_KnowsInfo(other,DIA_Viola_Start))
	{	return TRUE;	};
};
func void DIA_Kadar_KaraDead_info()
{
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_00");	//У меня для тебя печальные вести.
	//(+опыт)
	B_GivePlayerXP(XP_News_KaraDead);
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_01");	//Что случилось?
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_02");	//Я был в пещере, где держат ваших женщин...
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_03");	//И?
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_04");	//Кара, твоя жена... Она мертва.
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_05");	//(бледнеет) Что?
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_06");	//Мне очень жаль.
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_07");	//(пристально смотрит)
	AI_Output(other,self,"DIA_Kadar_KaraDead_15_08");	//Я хотел остановить пирата, но, увы, не успел.
		AI_Output(self,other,"DIA_Kadar_KaraDead_10_09");	//(молчит)

	//Подходит Мария
	if (Npc_GetDistToNpc(Maria, other) < PERC_DIST_DIALOG)
	{
		AI_Teleport(Maria,Npc_GetNearestWP(other));
	};
	AI_GotoNpc(Maria,other);
	AI_TurnToNpc(other,Maria);
	AI_StopProcessInfos(self);
	//Диалог у Марии
	
	Kadar_KnowsKaraDead_Day = Wld_GetDay();
	B_StartOtherRoutine(self, "SITHOME");
};

instance DIA_Kadar_AfterKaraDead(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 0;
	condition = DIA_Kadar_AfterKaraDead_condition;	
	information = DIA_Kadar_AfterKaraDead_info;
	important = TRUE;
};
func int DIA_Kadar_AfterKaraDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Kadar_KaraDead) && (Npc_IsInState(self, ZS_Talk)))
	{	return TRUE;	};
};
func void DIA_Kadar_AfterKaraDead_info()
{
	AI_Output(other,self,"DIA_Kadar_AfterKaraDead_15_00");	//Как ты?
		AI_Output(self,other,"DIA_Kadar_AfterKaraDead_10_01");	//(пристально смотрит и молчит)
	AI_StopProcessInfos(self);
};

// Активируется на следующий день, после выполнения квеста "Найти сбежавших охотников"

instance DIA_Kadar_AfterEscapedHunters(C_Info)
{
	npc = BAU_100_DS2P_KADAR;
	nr = 1;
	condition = DIA_Kadar_AfterEscapedHunters_condition;	
	information = DIA_Kadar_AfterEscapedHunters_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Kadar_AfterEscapedHunters_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == LOG_SUCCESS) && (EscapedHunters_QuestComplete - Wld_GetDay()) >= 1)
	{	
		return TRUE;	
	};
};

func void DIA_Kadar_AfterEscapedHunters_info()
{
	AI_Output(self,other,"DIA_Kadar_AfterEscapedHunters_10_00");	//Это правда?
	AI_Output(other,self,"DIA_Kadar_AfterEscapedHunters_15_01");	//Что правда?
	AI_Output(self,other,"DIA_Kadar_AfterEscapedHunters_10_02");	//То, что охотники мертвы.
	AI_Output(other,self,"DIA_Kadar_AfterEscapedHunters_15_03");	//Увы, пираты добрались до них.
	AI_Output(self,other,"DIA_Kadar_AfterEscapedHunters_10_04");	//Проклятые пираты! Сами нормально не живут и другим не дают! Чтоб им в гиене огненной гореть вечно!
	AI_StopProcessInfos(self);
};

