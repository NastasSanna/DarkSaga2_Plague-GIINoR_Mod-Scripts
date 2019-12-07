instance DIA_Garon_EXIT(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Garon_EXIT_condition;	
	information = DIA_Garon_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Garon_EXIT_condition(){	return TRUE;};
func void DIA_Garon_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 17/07/2013 ===========================
//  Стартовые диалоги в пещере
//===========================================
// сам заговаривает					nr = 0;	
instance DIA_Garon_Start(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 0;
	condition = DIA_Garon_Start_condition;	
	information = DIA_Garon_Start_info;
	important = TRUE;
};
func int DIA_Garon_Start_condition()
{
	return TRUE;
};
func void DIA_Garon_Start_info()
{
		AI_Output(self,other,"DIA_Garon_Start_12_00");	//Не подходи! Еще один шаг и я размозжу тебе голову этой палкой. Мне уже нечего терять!
	AI_Output(other,self,"DIA_Garon_Start_15_01");	//Погоди. Я не хочу причинить тебе вред. Меня прислал Харок.
		AI_Output(self,other,"DIA_Garon_Start_12_02");	//Это правда? Я думал, ты один из пиратов.
	AI_Output(other,self,"DIA_Garon_Start_15_03");	//Это правда, твой дед очень волнуется о тебе.
		AI_Output(self,other,"DIA_Garon_Start_12_04");	//Слава Инносу! А то я уже думал, что мне не выжить.
};
//--------------------------------------------
// "Как ты здесь оказался?"			nr = 1;	
instance DIA_Garon_HowDidUGetThere(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 1;
	condition = DIA_Garon_HowDidUGetThere_condition;	
	information = DIA_Garon_HowDidUGetThere_info;
	description = "Как ты здесь оказался?";
};
func int DIA_Garon_HowDidUGetThere_condition()
{
	return TRUE;
};
func void DIA_Garon_HowDidUGetThere_info()
{
	AI_Output(other,self,"DIA_Garon_HowDidUGetThere_15_00");	//Как ты здесь оказался?
	// UNFINISHED поставить точное условие, что ГГ телепортировался в пещеру
	if (Npc_KnowsInfo(other, DIA_Karah_WhereIsGaron))
	{
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_01");	//Думаю, также как и ты. 
	};
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_02");	//При помощи магии. Когда пираты в очередной раз избили меня и притащили в подвал, я пролежал в беспамятстве несколько дней. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_03");	//Придя в себя, обнаружил, что дверь на замке, а еда, которую мне принесли, уже пропала. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_04");	//Я пробовал кричать и звать на помощь, но все было безрезультатно. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_05");	//Этот подвал построили задолго до того, как здесь появилась наша деревня, и строили на совесть из крепкого камня, поэтому меня никто не услышал. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_06");	//Я решил поискать что-нибудь из еды среди ящиков и мусора. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_07");	//Ничего съестного мне не попалось, зато я нашел некий синий цилиндр, который был в точности такой же по размерам, как паз на древнем постаменте, находящимся в подвале. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_08");	//Я вставил цилиндр в паз, и внезапно появилось магическое свечение в виде полусферы. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_09");	//Сначала я испугался и старался держаться от него подальше, но время шло и любопытство пересилило. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_10");	//Я дотронулся до свечения рукой и мгновенно мир потемнел, я попал словно в бездонное черное ничто. 
		AI_Output(self,other,"DIA_Garon_HowDidUGetThere_12_11");	//Так длилось несколько секунд, а потом я оказался здесь, в пещере.
	//Запись в дневнике "Внук рыбака" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,"");
};
//--------------------------------------------
// "Почему ты не ушел из пещеры?", после предыдущего		nr = 2;	
instance DIA_Garon_WhyNotGo(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 2;
	condition = DIA_Garon_WhyNotGo_condition;	
	information = DIA_Garon_WhyNotGo_info;
	description = "Почему ты не ушел из пещеры?";
};
func int DIA_Garon_WhyNotGo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_HowDidUGetThere))
	{	return TRUE;	};
};
func void DIA_Garon_WhyNotGo_info()
{
	AI_Output(other,self,"DIA_Garon_WhyNotGo_15_00");	//Почему ты не ушел из пещеры?
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_01");	//Я хотел это сделать, но когда я прошел несколько десятков шагов, то услышал какое-то шипение. В темноте я не разобрал, откуда идет звук.
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_02");	//Шипение усилилось. Я замер, боясь сделать даже шаг. И тут он выскочил на меня из темноты.
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_03");	//В дыму и огне, а глаза красные, как у демона преисподней! Я думал, что сердце выпрыгнет из груди.
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_04");	//Если бы не Иннос и моя реакция, не говорить бы мне с тобой.
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_05");	//Я дал деру назад, к месту, где оказался после перемещения, спрятался за камнем и начал молиться. 
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_06");	//Но эта тварь не стала меня преследовать и притаилась в темноте, но я точно знаю, что далеко она не ушла. Я несколько раз слышал, как она шипит.
	// если еще не убили "тварь"
	if (!Npc_IsDead(Shadowbeast_Addon_Fire_Garon))
	{
	AI_Output(other,self,"DIA_Garon_WhyNotGo_15_07");	//Кого ты увидел?
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_08");	//Это произошло так быстро, поэтому я толком не разглядел. 
		AI_Output(self,other,"DIA_Garon_WhyNotGo_12_09");	//Знаю только, что оно точно неживое и светится в адским пламенем в темноте. 
	};
};

//NS - 17/07/2013 ===========================
//  Спасаем Гарона от огненной "твари"
//===========================================
// "Будь здесь, я схожу посмотрю.", после предыдущего, и если еще не убили "тварь"		nr = 3;	
instance DIA_Garon_IllLook(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 3;
	condition = DIA_Garon_IllLook_condition;	
	information = DIA_Garon_IllLook_info;
	description = "Будь здесь, я схожу посмотрю.";
};
func int DIA_Garon_IllLook_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_WhyNotGo) && !Npc_IsDead(Shadowbeast_Addon_Fire_Garon))
	{	return TRUE;	};
};
func void DIA_Garon_IllLook_info()
{
	AI_Output(other,self,"DIA_Garon_IllLook_15_00");	//Подожди здесь, я схожу, посмотрю.
		AI_Output(self,other,"DIA_Garon_IllLook_12_01");	//(в панике) Нет, не ходи! Оно убьет тебя! Я не хочу вновь остаться здесь один!
	AI_Output(other,self,"DIA_Garon_IllLook_15_02");	//Если мы ничего не предпримем, то умрем от голода.
		AI_Output(self,other,"DIA_Garon_IllLook_12_03");	//А так – сами станем завтраком...
	AI_Output(other,self,"DIA_Garon_IllLook_15_04");	//Не волнуйся, все будет хорошо!
	//Запись в дневнике "Внук рыбака" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_Demon);

};

//--------------------------------------------
// "Как ты?", постоянный после предыдущего, пока не расскажем, что "тварь" мертва		nr = 4;	
instance DIA_Garon_HowAU(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 4;
	condition = DIA_Garon_HowAU_condition;	
	information = DIA_Garon_HowAU_info;
	description = "Как ты?";
	permanent = TRUE;
};
func int DIA_Garon_HowAU_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_IllLook) && !Npc_KnowsInfo(other,DIA_Garon_IKilledDeamon))
	{	return TRUE;	};
};
func void DIA_Garon_HowAU_info()
{
	AI_Output(other,self,"DIA_Garon_HowAU_15_00");	//Как ты?
		AI_Output(self,other,"DIA_Garon_HowAUk_12_01");	//Такого страху я еще никогда не испытывал. За что Иннос прогневался на меня?!
};

//--------------------------------------------
// "Пошли, я убил твоего демона." (+опыт), после рассказа про "тварь", и если убили ее		nr = 5;	
instance DIA_Garon_IKilledDeamon(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 5;
	condition = DIA_Garon_IKilledDeamon_condition;	
	information = DIA_Garon_IKilledDeamon_info;
	description = "Пошли, я убил твоего демона.";
};
func int DIA_Garon_IKilledDeamon_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_WhyNotGo) && Npc_IsDead(Shadowbeast_Addon_Fire_Garon))
	{	return TRUE;	};
};
func void DIA_Garon_IKilledDeamon_info()
{
	AI_Output(other,self,"DIA_Garon_IKilledDeamon_15_00");	//Пошли, я убил твоего демона.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_KilledDeamon);
		AI_Output(self,other,"DIA_Garon_IKilledDeamon_12_01");	//Ты шутишь? Я тебе не верю!
	AI_Output(other,self,"DIA_Garon_IKilledDeamon_15_02");	//Перестань трястись как малолетняя барышня. Пошли, и сам все увидишь.
		AI_Output(self,other,"DIA_Garon_IKilledDeamon_12_03");	//(потупив взор) Прости. И правда – я веду себя недостойно. Я не испугался десятка пиратов, а тут... 
		AI_Output(self,other,"DIA_Garon_IKilledDeamon_12_04");	//(уверенно) Иди за мной! 
	//Диалог обрывается, Гарон бежит из пещеры
	B_StartOtherRoutine(self,"RUNAWAY");
	Npc_SetRefuseTalk(self, 3);	//3 сек. ему хватит, чтобы отбежать? TEST NEEDED
	AI_StopProcessInfos(self);
};


//NS - 17/07/2013 ===========================
//  Помогаем Гарону сделать выбор
//===========================================
// заговаривает сам, когда выбежит из пещеры (+опыт)		nr = 10;	
instance DIA_Garon_WhatShouldIDo(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 10;
	condition = DIA_Garon_WhatShouldIDo_condition;	
	information = DIA_Garon_WhatShouldIDo_info;
	important = TRUE;
};
func int DIA_Garon_WhatShouldIDo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_IKilledDeamon) && (Npc_GetDistToWP(self, self.wp) < TA_DIST_SELFWP_MAX))
	{	return TRUE;	};
};
func void DIA_Garon_WhatShouldIDo_info()
{
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_00");	//Эта зверюга похожа на мракориса, который восстал из могилы.
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_15_01");	//Я думаю, ты не далек от истины. Пора возвращаться, только вот куда?
	//Запись в дневнике "Внук рыбака" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_Free);
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_02");	//Ты о чем?
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_15_03");	//Тебя ждут пираты и твой дед. 
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_04");	//А, ты об этом? Знаешь, после того, что случилось, я стал сомневаться, правильно ли сделал выбор, отвергнув предложение Гарда.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_05");	//Смотри, куда меня это привело. Если бы не ты, то я бы точно погиб либо от голода, либо меня убила эта тварь. 
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_06");	//А если бы принял предложение пиратов, то сохранил бы в целости пару ребер, попивал бы грог с парнями, да мечтал бы, куда потрачу кучу золота со следующего рейда.
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_15_07");	//Но ведь путь пирата – это путь убийцы!
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_12_08");	//Да, я знаю, поэтому не могу решить, что делать дальше. Помоги мне, сделай выбор за меня.
	Info_ClearChoices(DIA_Garon_WhatShouldIDo);
	Info_AddChoice(DIA_Garon_WhatShouldIDo,"Ты сам должен выбрать свою судьбу.",DIA_Garon_WhatShouldIDo_UrChoise);
	Info_AddChoice(DIA_Garon_WhatShouldIDo,"Пойдем к твоему деду.",DIA_Garon_WhatShouldIDo_GoHome);
	Info_AddChoice(DIA_Garon_WhatShouldIDo,"Пойдем к пиратам.",DIA_Garon_WhatShouldIDo_GoPirates);
};
func void DIA_Garon_WhatShouldIDo_GoPirates()
{
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_GoPirates_15_00");	//Пойдем к пиратам. 
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_Pirat);
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_GoPirates_12_01");	//Так тому и быть! У меня к тебе будет просьба – сообщи о моем решении Хароку. 
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_GoPirates_15_02");	//А что мешает сделать это тебе?
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_GoPirates_12_03");	//(вздыхает) Мне стыдно... Прости. Мне нужно идти!
	//Диалог обрывается, Гарон бежит в ратушу.
	B_StartOtherRoutine(self,"PREPIRAT");
	AI_StopProcessInfos(self);
	//Запись в дневнике "Внук рыбака" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_JoinPirates);
	Garon_Choice = Garon_Choice_Pirate;
};
func void DIA_Garon_WhatShouldIDo_GoHome()
{
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_GoHome_15_00");	//Пойдем к твоему деду. Стать пиратом – это не лучший выбор, уж поверь мне.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_GoHome_12_01");	//Да, ты прав. Просто я на секунду сдался, опустил руки. Больше этого не повторится! Пошли.
	//Диалог обрывается, Гарон бежит к Хароку.
	B_StartOtherRoutine(self,"GOHOME");
	var C_NPC Harok; Harok = Hlp_GetNpc(BAU_101_DS2P_Harok);
	B_StartOtherRoutine(Harok,"GARONTALK");
	AI_StopProcessInfos(self);
	
	Garon_Choice = Garon_Choice_GoHome;
};
func void DIA_Garon_WhatShouldIDo_UrChoise()
{
	AI_Output(other,self,"DIA_Garon_WhatShouldIDo_UrChoise_15_00");	//Ты сам должен выбрать свою судьбу.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_GoForest);
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_UrChoise_12_01");	//(задумчиво) Наверное, ты прав.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_UrChoise_12_02");	//Возвращаться к деду? А вдруг там пираты... Нет, это опасно. Получать очередных тумаков в деревне за то, что сбежал, мне тоже что-то не хочется.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_UrChoise_12_03");	//Самый лучший вариант – это отсидеться в лесу, пока все не утихнет. Спасибо тебе за все.
		AI_Output(self,other,"DIA_Garon_WhatShouldIDo_UrChoise_12_04");	//У меня будет еще одна просьба – сходи к Хароку и скажи, что со мной все в порядке. 
	//Запись в дневнике "Внук рыбака" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_HideInForest);
	//Гарон уходит в лес
	B_StartOtherRoutine(self,"GOFOREST");
	AI_StopProcessInfos(self);
	Garon_Choice = Garon_Choice_GoForest;
};


//NS - 17/07/2013 ===========================
//  Стал пиратом
//===========================================
// "Ну и как тебе живется среди пиратов?", (+опыт) после того, как стал пиратом		nr = 20;
var int XP_MIS_GrandsonOfFisherman_IsPirat_Once;	//опыт только 1 раз, а диалог постоянный
instance DIA_Garon_AmongPirates(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 20;
	condition = DIA_Garon_AmongPirates_condition;	
	information = DIA_Garon_AmongPirates_info;
	description = "Ну и как тебе живется среди пиратов?";
	permanent = TRUE;
};
func int DIA_Garon_AmongPirates_condition()
{
	if((Garon_Choice == Garon_Choice_Pirate) && (Npc_KnowsInfo(other,DIA_Greg_GaronBecomePirate)))
	{	return TRUE;	};
};
func void DIA_Garon_AmongPirates_info()
{
	AI_Output(other,self,"DIA_Garon_AmongPirates_15_00");	//Ну и как тебе живется среди пиратов?
		AI_Output(self,other,"DIA_Garon_AmongPirates_12_01");	//Все оказалось не так плохо. Если не давать себя в обиду и не вестись на уловки парней, то можно сказать, что я хорошо устроился.
		AI_Output(self,other,"DIA_Garon_AmongPirates_12_02");	//Еще раз спасибо тебе за все!
	//(+опыт)
	if (XP_MIS_GrandsonOfFisherman_IsPirat_Once == FALSE)
	{

		B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_IsPirat);
		XP_MIS_GrandsonOfFisherman_IsPirat_Once = TRUE;
	};
};


//NS - 18/07/2013 ===========================
//  Вернулся домой
//===========================================
// Сам заговаривает, после того, как побили Саймона и Караха, Харок жив (+опыт)		important	
instance DIA_Garon_ThanksAllAlive(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 0;
	condition = DIA_Garon_ThanksAllAlive_condition;	
	information = DIA_Garon_ThanksAllAlive_info;
	important = TRUE;
};
func int DIA_Garon_ThanksAllAlive_condition()
{
	if((Garon_FightPirates == Garon_FightPirates_Finished) && !Npc_IsDead(BAU_101_DS2P_HAROK)
		&& Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Garon_ThanksAllAlive_info()
{
		AI_Output(self,other,"DIA_Garon_ThanksAllAlive_12_01");	//	Спасибо тебе за помощь! Если бы не ты, нас с дедом точно убили бы. Я у тебя в неоплатном долгу.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_HomeAllAlive);
	AI_Output(other,self,"DIA_Garon_ThanksAllAlive_15_00");	//Не стоит благодарности! И впредь всегда решай сам, что тебе делать и как жить, иначе опять попадешь в какую-нибудь переделку.
};

//--------------------------------------------
// "Пираты не возвращались?", постоянный после предыдущего				nr = 21;
instance DIA_Garon_PiratesNotReturned(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 21;
	condition = DIA_Garon_PiratessNotReturned_condition;	
	information = DIA_Garon_PiratessNotReturned_info;
	description = "Пираты не возвращались?";
	permanent = TRUE;
};
func int DIA_Garon_PiratessNotReturned_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_ThanksAllAlive))
	{	return TRUE;	};
};
func void DIA_Garon_PiratessNotReturned_info()
{
	AI_Output(other,self,"DIA_Garon_PiratessNotReturned_15_00");	//Пираты не возвращались?
		AI_Output(self,other,"DIA_Garon_PiratessNotReturned_12_01");	//Пока нет, но мы с дедом на всякий случай держим оружие наготове и по очереди дежурим ночью.
		AI_Output(self,other,"DIA_Garon_PiratessNotReturned_12_02");	//Если они и сунутся, то их будет ждать теплый прием. (смеется)
};

//--------------------------------------------
// Сам заговаривает, Гарона спасли, но Харок умер	(+опыт)			nr = 22;
instance DIA_Garon_HakonDead(C_Info)
{
	npc = BAU_117_DS2P_Garon;
	nr = 22;
	condition = DIA_Garon_HakonDead_condition;	
	information = DIA_Garon_HakonDead_info;
	description = "";
	permanent = TRUE;
};
func int DIA_Garon_HakonDead_condition()
{
	if(Npc_KnowsInfo(other,DIA_Garon_ThanksAllAlive))
	{	return TRUE;	};
};
func void DIA_Garon_HakonDead_info()
{
	var int x;
		AI_Output(self,other,"DIA_Garon_HakonDead_12_00");	//(со слезами на глазах) Они убили деда! О горе мне!
		AI_Output(self,other,"DIA_Garon_HakonDead_12_01");	//Зачем я только вернулся, нужно было догадаться, что тут будет ловушка. Какой же я тупица!
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_HomeHakonDead);
	AI_Output(other,self,"DIA_Garon_HakonDead_15_02");	//Не укоряй себя, ты ни в чем не виноват!
		Mdl_StartFaceAni(self,"S_HOSTILE",1,-1);
		AI_Output(self,other,"DIA_Garon_HakonDead_12_03");	//(злобно) Ну уж нет! Виноват я, и только я могу если не исправить, то хотя бы отомстить!
	AI_Output(other,self,"DIA_Garon_HakonDead_15_04");	//Даже не думай об этом!
		AI_Output(self,other,"DIA_Garon_HakonDead_12_05");	//Мне уже терять нечего. Я уничтожу сначала этих двоих ублюдков, а потом вырежу остальных.
	AI_Output(other,self,"DIA_Garon_HakonDead_15_06");	//Ты никого не уничтожишь, просто отдашь свою жизнь за так. Может быть, твою месть лучше направить в более правильное русло?
		AI_Output(self,other,"DIA_Garon_HakonDead_12_07");	//О чем ты?
	AI_Output(other,self,"DIA_Garon_HakonDead_15_08");	//Разве те, кто в деревне – единственные, кто есть на острове?
		AI_Output(self,other,"DIA_Garon_HakonDead_12_09");	//(задумался) Нет... Конечно, нет! Часть охотников скрываются в лесу.
	AI_Output(other,self,"DIA_Garon_HakonDead_15_10");	//И ты думаешь, они просто так сидят там сложа руки?
	AI_Output(other,self,"DIA_Garon_HakonDead_15_11");	//Наверняка, они думают, как бы выдворить пиратов с острова. И я более чем уверен, что лишний клинок им бы не помешал.
		Mdl_StartFaceAni(self,"S_FRIENDLY",1,-1);
		AI_Output(self,other,"DIA_Garon_HakonDead_12_12");	//(улыбаясь) А ты чертовски прав. Нужно найти их немедленно!

	AI_Output(other,self,"DIA_Garon_HakonDead_15_13");	//Вот и хорошо. Мне пора.
		Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
		AI_Output(self,other,"DIA_Garon_HakonDead_12_14");	//Постой, я бы хотел отблагодарить тебя. Возьми этот ключ и иди в соляную пещеру, там в одной из штолен найдешь сундук.
		AI_Output(self,other,"DIA_Garon_HakonDead_12_15");	//Мы с дедом там прятали наши находки и золото. Нам оно больше ни к чему...
	//Дает ключ «от сундука в соляной пещере»
	x = 1; if (x == 1)	{
		B_GiveInvItems(self, other, ITKE_Key_DS2P_GARON, 1);
	};

	//Запись в дневнике "Внук рыбака" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GrandsonOfFisherman_SuccessHunters);

	// уходит к охотникам
	B_StartOtherRoutine(self, "WITHHUNTERS");
	AI_StopProcessInfos(self);
};

