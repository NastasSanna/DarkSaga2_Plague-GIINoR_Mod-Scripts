
instance DIA_Joseph_EXIT(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Joseph_EXIT_condition;	
	information = DIA_Joseph_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Joseph_EXIT_condition(){	return TRUE;};
func void DIA_Joseph_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 24/06/2013 ===========
//  Стартовый 
//===========================
instance DIA_Joseph_Start(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 0;
	condition = DIA_Joseph_Start_condition;	
	information = DIA_Joseph_Start_info;
	important = TRUE;
};
func int DIA_Joseph_Start_condition(){	return TRUE;};
func void DIA_Joseph_Start_info()
{
		AI_Output(self,other,"DIA_Joseph_Start_13_00");	//А ну-ка стой! Боком повернись!
	AI_Output(other,self,"DIA_Joseph_Start_15_01");	//Что?
		AI_Output(self,other,"DIA_Joseph_Start_13_02");	//Боком повернись, говорю! Быстро!
	//UNFINISHED ГГ поворачивается
	AI_TurnRight(hero);
	AI_Wait(self, 1.5);
		AI_Output(self,other,"DIA_Joseph_Start_13_03");	//А теперь задом.
	AI_LookAtNpc(other,self);
	AI_Output(other,self,"DIA_Joseph_Start_15_04");	//Тебе не кажется?..
	AI_StopLookAt(other);
		AI_Output(self,other,"DIA_Joseph_Start_13_05");	//(перебивает) Закрой рот и делай как я скажу, а то быстро топором по ребрам получишь!
	//ГГ поворачивается
	AI_TurnAway(other, self);
		AI_PlayAni(self, "R_SCRATCHHEAD");
		AI_Output(self,other,"DIA_Joseph_Start_13_06");	//Тьфу ты. Не тот! Ладно, извини. Ты новенький что ли?
	//ГГ поворачивается обратно
	AI_TurnToNpc(other, self);
	AI_Output(other,self,"DIA_Joseph_Start_15_07");	//Я недавно прибыл на остров.
		AI_Output(self,other,"DIA_Joseph_Start_13_08");	//Может у тебя еще и корабль есть?
	AI_Output(other,self,"DIA_Joseph_Start_15_09");	//Есть, “Эсмеральда“ стоит на пирсе.
		AI_Output(self,other,"DIA_Joseph_Start_13_10");	//(потирает руки) Ну вот и славно, вот и ладушки. Значит, мы скоро уберемся с этой проклятой дыры.
		AI_Output(self,other,"DIA_Joseph_Start_13_11");	//Меня уже тошнит от этого острова. Кругом шныряют эти крестьяне, кругом одно ворье!
	AI_Output(other,self,"DIA_Joseph_Start_15_12");	//Я бы на твоем месте так не радовался. На корабле чума, и уплыть на нем никто не сможет, если ты, конечно, не бессмертный.
		AI_Output(self,other,"DIA_Joseph_Start_13_13");	//(в сердцах) Да что же такое творится?!
		AI_Output(self,other,"DIA_Joseph_Start_13_14");	//Сначала меня заставляют ремонтировать эту чертову мельницу, затем кто-то ворует все железо, так теперь и уплыть нельзя!
		AI_Output(self,other,"DIA_Joseph_Start_13_15");	//Раздери Белиар на мелкие кусочки этот проклятый остров!
};


//NS - 24/06/2013 ===========
//  Как тебя зовут?			nr = 1
//===========================
instance DIA_Joseph_WhatsYourName(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_WhatsYourName_condition;	
	information = DIA_Joseph_WhatsYourName_info;
	description = "Как тебя зовут?";
};
func int DIA_Joseph_WhatsYourName_condition(){	return TRUE;};
func void DIA_Joseph_WhatsYourName_info()
{
	AI_Output(other,self,"DIA_Joseph_WhatsYourName_15_00");	//Как тебя зовут?
		AI_Output(self,other,"DIA_Joseph_WhatsYourName_13_01");	//Я Джозеф – кузнец. Хотя, какой я теперь кузнец, Белиар тебе в печенки!
		AI_Output(self,other,"DIA_Joseph_WhatsYourName_13_02");	//Кроме паршивого молотка и горна ничего нет. Я что, из воздуха должен мечи ковать?! А?!
};


//NS - 24/06/2013-27/06/2013 ========
//  По квесту "Кто украл мое железо?"
//===========================

//----------------------------
// "О каких ворах ты говорил?" после знакомства		nr=2
instance DIA_Joseph_WhatThiefs(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 2;
	condition = DIA_Joseph_WhatThiefs_condition;	
	information = DIA_Joseph_WhatThiefs_info;
	description = "О каких ворах ты говорил?";
};
func int DIA_Joseph_WhatThiefs_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_WhatThiefs_info()
{
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_00");	//О каких ворах ты говорил?
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_01");	//(ворчит) Каких, каких... Об этих недоносках, сельчанах.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_02");	//Кто-то из этих выродков утащил все запасы железной руды и стальных заготовок. Я что, должен из пальца мечи ковать, а?
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_03");	//Как это произошло?
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_04");	//Да очень просто. Когда мы захватили деревню, я сразу же отправился в кузню.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_05");	//От местного кузнеца остались большие запасы материалов. Видать, он не собирался покидать деревню. (смеется)
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_06");	//Так вот, я все посмотрел, прикинул, что мне хватит железа недели на две.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_07");	//Тут как раз пришел Гард, сказал, что нужна партия оружия на случай непредвиденной ситуации с местными.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_08");	//После этого я пошел спать. Около полуночи мне приспичило по нужде, я вышел во двор и увидел, как какой-то козел бежит от кузни в проулок.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_09");	//Ну, я подумал, что это просто местный сумасшедший, вроде Дилом звать, и не придал этому значения.
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_10");	//А на утро выяснилось, что этот гад утащил все железо.
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_11");	//Тебе удалось разглядеть его?
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_12");	//Да куда там?! Была же ночь. Я заметил только силуэт.
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_13");	//Понятно. Ты говоришь, что он бежал от кузни с кучей железа.
	AI_Output(other,self,"DIA_Joseph_WhatThiefs_15_14");	//Наверное, он был очень здоровым, иначе как он смог бежать с такой тяжестью?
		AI_Output(self,other,"DIA_Joseph_WhatThiefs_13_15");	//(задумался) Хм... Могу поклясться, что я не видел у него мешка.

	//Запись в дневнике "Кто украл мое железо?" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_Start);
};

//----------------------------
// "Никто из крестьян не сознается в краже." если опросили достаточно крестьян		nr=2
instance DIA_Joseph_NooneConfess(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 2;
	condition = DIA_Joseph_NooneConfess_condition;	
	information = DIA_Joseph_NooneConfess_info;
	description = "Никто из крестьян не сознается в краже.";
};
func int DIA_Joseph_NooneConfess_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count > Bauers_AboutIron_Max))
	{	return TRUE;};
};
func void DIA_Joseph_NooneConfess_info()
{
	AI_Output(other,self,"DIA_Joseph_NooneConfess_15_00");	//Никто из крестьян не сознается в краже.
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_01");	//Ха! Укуси варг тебя за пятку, конечно, никто не сознается! 
	AI_Output(other,self,"DIA_Joseph_NooneConfess_15_02");	//И как тогда мы поймаем вора?
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_03");	//Я тут пораздумал чуток, и пришла мне в голову одна идейка. Кто бы ни утащил мое железо, наверняка приготовил его для выноса из лагеря, чтобы переправить к кузнецу, Густаву.
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_04");	//Больше-то с железом кроме меня работать все равно никто не может. Так вот, скажи его жене, что ты пришел от кузнеца, чтобы забрать железо. Я думаю, она сразу все разболтает тебе.
	AI_Output(other,self,"DIA_Joseph_NooneConfess_15_05");	//А если это не поможет?
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_06");	//Если не поможет, то я завтра же пойду к Гарду. Пусть он решает проблему сам. Не думаю, что капитан будет церемониться с этими недоносками.
		AI_Output(self,other,"DIA_Joseph_NooneConfess_13_07");	//Повесит парочку на заборе в назидание остальным, мигом все принесут! А уж что он мне не откажет, я знаю точно! Это ему нужны новые клинки, а не мне. 

	//Запись в дневнике "Кто украл мое железо?" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_JosephPlan);
};


//----------------------------
// Вернуть железо, если есть 2 куска	(+опыт)		nr=2
instance DIA_Joseph_ReturnIron(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 2;
	condition = DIA_Joseph_ReturnIron_condition;	
	information = DIA_Joseph_ReturnIron_info;
	description = "Я нашел железную руду.";
};
func int DIA_Joseph_ReturnIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Npc_HasItems(other,ITMI_DS2P_IRONORE_NUGGET_BIG) >= 2))
	{	return TRUE;};
};
func void DIA_Joseph_ReturnIron_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_00");	//Я нашел железную руду.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_WhoStoleMyIron);
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_01");	//Давай ее сюда!
	//отдаем
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems(other,self,ITMI_DS2P_IRONORE_NUGGET_BIG,2);
	};
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_02");	//Так, стоп, тут далеко не все! Там было в полтора раза больше!
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_03");	//Это все, что я смог найти. Боюсь, больше нет. 
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_04");	//(злобно) Аргхх... Чертовы крестьяне, растопчи их голем! Вора-то хотя бы тебе удалось найти?
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_05");	//Нет, увы. Руда была спрятана в заброшенном доме. И там не было никаких признаков вора.
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_06");	//От тебя толку, как с мясного жука уха! Ладно, это лучше, чем ничего. Вот, это тебе за работу.
	//Дает 400 золотых
	x = 2; if (x == 2) {
		B_GiveInvItems(self,other,ItMi_Gold,400);
	};
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_07");	//Да и еще, раз теперь у меня есть материалы, можешь прийти через пару дней, думаю, у меня будет для тебя кое-что интересное.
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_08");	//Возможно, у тебя найдется лишка золота, и ты прикупишь у меня пару клинков.
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_09");	//А разве Гард разрешал тебе продавать клинки?
		AI_Output(self,other,"DIA_Joseph_ReturnIron_13_10");	//Если ему никто не растреплет, то он и не узнает. Ты меня понял?!
	AI_Output(other,self,"DIA_Joseph_ReturnIron_15_11");	//Понял.
	Joseph_ReturnIron_Day = Wld_GetDay();
 
	//Запись в дневнике "Кто украл мое железо?" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_WhoStoleMyIron_Success);
	
	//Меняет расписание
	B_StartOtherRoutine(self, "START");
};


//NS - 24/06/2013 ===========
//  По квесту "Инструменты для Хуно"
//===========================

//------------------------------
// "Вот золото и руда. Изготовь мне инструменты."		nr=1
// если взят квест, после знакомства
instance DIA_Joseph_INeedInstruments(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_INeedInstruments_condition;	
	information = DIA_Joseph_INeedInstruments_info;
	description = "Мне нужны инструменты.";
};
func int DIA_Joseph_INeedInstruments_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName) && (MIS_DS2P_Tools4Huno == LOG_Running))
	{	return TRUE;};
};
func void DIA_Joseph_INeedInstruments_info()
{
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_00");	//Мне нужны инструменты. Крестьянам нужны две мотыги и пять серпов.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_01");	//И что? Мне-то какое дело?
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_02");	//Ты же кузнец, наверняка умеешь изготавливать инструменты.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_03");	//Даже если умею – с какой стати я буду этим заниматься?
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_04");	//Тем самым ты поможешь крестьянам убрать урожай и не умереть зимой с голоду.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_05");	//Знаешь, мне плевать на всех этих крестьян в общем и на каждого из них по отдельности. Да пусть они хоть завтра все передохнут!
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_06");	//Понятно. Тебе нужно золото?
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_07");	//(хитро улыбается) Наконец-то дошло! Я пират, и мне плевать на чужие проблемы.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_08");	//Только одно меня волнует – бутылка рома, тепло горнила и звон золота в моем кошельке.
	AI_Output(other,self,"DIA_Joseph_INeedInstruments_15_09");	//Сколько ты хочешь?
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_09");	//Триста золотых будет достаточно, но это еще не все. У меня нет лишнего железа, чтобы его тратить на всякую ерунду.
		AI_Output(self,other,"DIA_Joseph_INeedInstruments_13_10");	//Поэтому ты должен принести мне четыре куска железной руды.

	//Запись в дневнике "Инструменты для Хуно" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_Running,TOPIC_DS2P_Tools4Huno_JosephWantIronnGold);
};
//------------------------------
// "Вот золото и руда. Изготовь мне инструменты."		nr=1
// если есть и квест еще не сдан
instance DIA_Joseph_MadeInstruments(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_MadeInstruments_condition;	
	information = DIA_Joseph_MadeInstruments_info;
	description = "Изготовь мне инструменты.";
};
func int DIA_Joseph_MadeInstruments_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_INeedInstruments)
		&& (MIS_DS2P_Tools4Huno == LOG_Running)
		&& (Npc_HasItems(other,ItMi_Gold) >= 300) && (Npc_HasItems(other,ItMi_IronOre) >= 4))
	{	return TRUE;};
};
func void DIA_Joseph_MadeInstruments_info()
{
	AI_Output(other,self,"DIA_Joseph_MadeInstruments_15_00");	//Вот золото и руда. Изготовь мне инструменты.
	// Отдаем золото и руду
	B_DS_GiveRemoveItems(other,self,ItMi_Gold,300);
	B_DS_GiveRemoveItems(other,self,ItMi_IronOre,4);
		AI_Output(self,other,"DIA_Joseph_MadeInstruments_13_01");	//Хорошо, а теперь не мешайся под ногами, мне нужно поработать. Приходи через пару часов.
	// Приступает к работе в кузнице, если еще не работает
	Joseph_Busy = TRUE;
	Joseph_ReadyTime = C_GetTime_Plus(2,0,15);
	Joseph_WorksOn = -1;
	if (MIS_DS2P_WhoStoleMyIron != LOG_SUCCESS)
	{
		B_StartOtherRoutine(self, "START");
	};
	//Запись в дневнике "Инструменты для Хуно" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_Running,TOPIC_DS2P_Tools4Huno_JosephWorks);
};
//------------------------------
// "Инструменты готовы?"		nr=1
// висит, пока не заберем
instance DIA_Joseph_InstrumentsReady(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_InstrumentsReady_condition;	
	information = DIA_Joseph_InstrumentsReady_info;
	permanent = TRUE;
	description = "Инструменты готовы?";
};
func int DIA_Joseph_InstrumentsReady_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_MadeInstruments) && (Joseph_Tools4Huno_Got == FALSE))
	{	return TRUE;};
};
func void DIA_Joseph_InstrumentsReady_info()
{
	AI_Output(other,self,"DIA_Joseph_InstrumentsReady_15_00");	//Инструменты готовы?
	if (Joseph_ReadyTime < Wld_GetPassedTime(0))	//прошло < 2 часов
	{
		AI_Output(self,other,"DIA_Joseph_InstrumentsReady_13_01");	//Тебе падальщики все мозги выклевали? Я же сказал, через пару часов!
	}
	else	//иначе - готово
	{
		AI_Output(self,other,"DIA_Joseph_InstrumentsReady_13_02");	//Да, забирай! Это для меня раз плюнуть!
		B_GiveInvItem_red(self,other,ItMi_Rake,2,YPOS_ItemTaken);
		B_GiveInvItem_red(self,other,ItMw_1h_Bau_Axe,5,YPOS_ItemTaken + 3);
		B_GivePlayerXP(XP_MIS_Tools4Huno_Ready);
		Joseph_Tools4Huno_Got = TRUE;
		Joseph_Busy = FALSE;
		// Возвращается к безделью, если нет железа
		if (MIS_DS2P_WhoStoleMyIron != LOG_SUCCESS)
		{
			B_StartOtherRoutine(self, "PRESTART");
		};
	};
	//Запись в дневнике "Инструменты для Хуно" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_Running,TOPIC_DS2P_Tools4Huno_ToolsGot);
};


//NS - 25/06/2013 ===========
//  По квесту "Потерянные чертежи"
//===========================

//----------------------------
// "Похоже, тебе нужна моя помощь." после знакомства		nr=3
instance DIA_Joseph_SeemsUNeedHelp(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 3;
	condition = DIA_Joseph_SeemsUNeedHelp_condition;	
	information = DIA_Joseph_SeemsUNeedHelp_info;
	description = "Похоже, тебе нужна моя помощь.";
};
func int DIA_Joseph_SeemsUNeedHelp_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_SeemsUNeedHelp_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_00");	//Похоже, тебе нужна моя помощь.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_01");	//По мне это так видно? Хех! Да, ты прав – помощь мне бы не помешала.
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_02");	//Я слушаю.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_03");	//Перед тем, как нам посчастливилось повстречать в море галеры орков, мы взяли на абордаж торговое судно.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_04");	//Так вот, помимо золота и товаров там обнаружился один интересный сундучок.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_05");	//Когда я вскрыл его, оказалось, что он доверху набит всякими бумагами. Среди этих бумаг оказались чертежи разного магического оружия.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_06");	//Понятное дело, что на корабле не было ни возможности, ни достаточного количества материалов, чтобы попробовать что-нибудь изготовить.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_07");	//Поэтому я закрыл сундучок и спрятал его в трюме. После того, как мы были подбиты орчьими орудиями и сели на мель, мне так и не удалось забрать этот сундук.
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_08");	//И что же тебе помешало?
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_09");	//Ползуны. Много ползунов!
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_10");	//Откуда им взяться на корабле?
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_11");	//Это тоже “подарочек“ захваченного торговца, зажарь его Белиар на медленном огне! В некоторых ящиках оказались какие-то яйца.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_12");	//Уж не знаю, где этот треклятый капитан их раздобыл, но Грег посчитал, что это яйца редких животных. И если нам не удастся их продать, то хотя бы на праздничный ужин по случаю удачного рейда они точно сгодятся.
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_13");	//И теперь эти яйца вылупились? Я правильно понял?
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_14");	//Ну еще бы, Белиар тебе под кадык! Мало того, что они повылуплялись, так еще оказалось, что в самом большом яйце была матка.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_15");	//И теперь я не то, чтобы забрать чертежи не могу, даже на пару метров подойти к обломкам не решаюсь. Эти твари неплохо оголодали и жрут все, что движется в пределах досягаемости.
	AI_Output(other,self,"DIA_Joseph_SeemsUNeedHelp_15_16");	//Я достану тебе чертежи. Если, конечно, ты научишь ковать магическое оружие.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_17");	//Да легко! Вот ключ от сундука. Насколько я помню, там было около пяти чертежей и еще немного моего барахла.
		AI_Output(self,other,"DIA_Joseph_SeemsUNeedHelp_13_18");	//Чертежи неси мне, а барахло забирай себе. Насколько я помню, ничего ценного я там не оставлял.
	//Дает «Ключ от сундука с чертежами»
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ITKE_Key_DS2P_JOSEPH_CHEST,1);
	};

	//Запись в дневнике "Потерянные чертежи" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_LostDrawings,LOG_MISSION,LOG_Running,TOPIC_DS2P_LostDrawings_Start);

	//UNFINISHED заспаунить ~10 ползунов и матку в обломках корабля
	/*
	Wld_InsertNpc(Larva, "");
	Wld_InsertNpc(Minecrawler, "");
	Wld_InsertNpc(CrawlerQueen_01, "");
	//*/
};

//----------------------------
// вернуть чертежи (+опыт) (+1 сила)		nr=3
// взят квест и есть, что вернуть
instance DIA_Joseph_ReturnDrawnings(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 3;
	condition = DIA_Joseph_ReturnDrawnings_condition;	
	information = DIA_Joseph_ReturnDrawnings_info;
	description = "Я достал твои чертежи.";
};
func int DIA_Joseph_ReturnDrawnings_condition()
{
	if ((MIS_DS2P_LostDrawings == LOG_Running)
		/* UNFINISHED вписать чертежи
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)
		&& (Npc_HasItems(other,ItWr_DSG_Drawing_) > 0)*/)
	{	return TRUE;};
};
func void DIA_Joseph_ReturnDrawnings_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_ReturnDrawnings_15_00");	//Я достал твои чертежи.
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_02");	//(удивленно) Похоже тебе сам Белиар не брат! Как тебе это удалось, молния тебе между глаз!
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_03");	//Я думал, что ты уже давно плюнул на свое обещание, либо покормил своими костями ползунов. А тут на тебе!
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_04");	//Ты самый удачливый парень из всех, кого я встречал. Вот, это за работу.
	
	//Дает 350 золотых
	B_GiveInvItems(self,other,ItMi_Gold,350);
	
	//Забирает чертежи
	/* UNFINISHED вписать чертежи
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	C_DS_GiveInvItems(other,self,ItWr_DSG_Drawing_,1);
	//*/
	AI_PrintScreen("Отдано 5 чертежей",30,YPOS_ItemGiven,FONT_ScreenSmall,5);

	//(+опыт) (+1 сила)
	x = 1; if (x == 1)	{
		B_GivePlayerXP(XP_MIS_LostDrawings);
		B_RaiseAttribute(other,ATR_STRENGTH,1);
	};
	
	//Запись в дневнике "Потерянные чертежи" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_LostDrawings,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_LostDrawings_Success);
	
	AI_Output(other,self,"DIA_Joseph_ReturnDrawnings_15_05");	//Я надеюсь, ты тоже сдержишь обещание и научишь меня ковать магические клинки.
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_06");	//Конечно, только не научу, а сам тебе выкую за небольшую плату, и, конечно же, если принесешь все недостающие материалы.
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_07");	//Погоди, сейчас набросаю список. Так... Ага...
		AI_Output(self,other,"DIA_Joseph_ReturnDrawnings_13_08");	//Вот, держи. Принеси мне все, что там написано и цену золотом, и я все сделаю.
	
	//Дает список материалов для ковки и цену в золоте
	B_GiveInvItems(self,other,ItWr_DS2P_List_Joseph,1);
	MADE_Weapon_Joseph = TRUE;
	
	//Запись в дневнике в разделе доп инфо "Торговля у пиратов" //NS по сценарию "Изготовление магического оружия" 
	B_ds_LogEntry(TOPIC_PiratTrader,LOG_NOTE,-1,"Кузнец Джозеф изготовит мне магическое оружие, если я принесу необходимые материалы и золото.");
};

//----------------------------
// чертежи отдали, а золото?
// после завершения предудущего диалога
instance DIA_Joseph_WhereGold(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 0;
	condition = DIA_Joseph_WhereGold_condition;	
	information = DIA_Joseph_WhereGold_info;
	important = TRUE;
};
func int DIA_Joseph_WhereGold_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_ReturnDrawnings))
	{	return TRUE;};
};
func void DIA_Joseph_WhereGold_info()
{
		AI_Output(self,other,"DIA_Joseph_WhereGold_13_01");	//Слушай, там ведь в сундуке было и золото, ведь так?!
		AI_Output(self,other,"DIA_Joseph_WhereGold_13_02");	//Ты же не хочешь прослыть вором, который прикарманил последние сбережения старого кузнеца?
	Info_ClearChoices(DIA_Joseph_WhereGold);
	Info_AddChoice(DIA_Joseph_WhereGold,"Прости, я совсем забыл. Это твое золото.",DIA_Joseph_WhereGold_Return);
	Info_AddChoice(DIA_Joseph_WhereGold,"Ты что-то путаешь. Там ничего не было.",DIA_Joseph_WhereGold_No);
};
func void DIA_Joseph_WhereGold_No()
{
	AI_Output(other,self,"DIA_Joseph_WhereGold_No_15_00");	//Ты что-то путаешь. Там ничего не было.
	//(+1 к ловкости)
	B_RaiseAttribute(other,ATR_DEXTERITY,1);
		AI_Output(self,other,"DIA_Joseph_WhereGold_No_13_01");	//(пристально смотрит) А из тебя бы вышел отличный вор.
		AI_Output(self,other,"DIA_Joseph_WhereGold_No_13_02");	//Смотрит таким невинным взглядом, что если бы я не знал правду, никогда бы не заподозрил вранья! Ха!
		AI_Output(self,other,"DIA_Joseph_WhereGold_No_13_03");	//Ну да ладно, это тебе в счет награды за чертежи.
	AI_StopProcessInfos(self);

};
func void DIA_Joseph_WhereGold_Return()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_WhereGold_Return_15_00");	//Прости, я совсем забыл. Это твое золото. Возьми его.
		AI_Output(self,other,"DIA_Joseph_WhereGold_Return_13_01");	//(удивленно) Ты действительно хочешь вернуть мне золото? Ты что, совсем кретин, речной змей тебе в зад?
		AI_Output(self,other,"DIA_Joseph_WhereGold_Return_13_02");	//Да кто же так просто отдает свое добро? Ты либо действительно очень честный, либо полный кретин. И я даже не знаю, что для тебя лучше.
		AI_Output(self,other,"DIA_Joseph_WhereGold_Return_13_03");	//Ну да ладно, золото оставь у себя, это тебе в счет награды за чертежи, а за твою честность я подарю тебе этот клинок.
		AI_Output(self,other,"DIA_Joseph_WhereGold_Return_13_04");	//Не скажу, что он венец моего мастерства, но когда-то я считал лучшим из того, что мог выковать, пока не понял, как надо ковать по-настоящему! Ха-ха-ха!!!
	//Дает клинок «Пламя мести»
	B_GiveInvItems(self,other,ItMw_DS2P_FlameOfRevenge,1);
	AI_StopProcessInfos(self);
};


//NS - 27/06/2013 ========================================================
//  По квесту "Старая мельница" 	nr=4
//========================================================================

//----------------------------
// Джозеф сам просит помощи, через день после сдачи квеста "Кто украл мое железо?"
instance DIA_Joseph_NeedHelpOldMill(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 4;
	condition = DIA_Joseph_NeedHelpOldMill_condition;	
	information = DIA_Joseph_NeedHelpOldMill_info;
	important = TRUE;
};
func int DIA_Joseph_NeedHelpOldMill_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_SUCCESS) && ((Joseph_ReturnIron_Day + 1) >= Wld_GetDay()))
	{	return TRUE;};
};
func void DIA_Joseph_NeedHelpOldMill_info()
{
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_13_00");	//Постой, у меня к тебе есть дело!
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_15_01");	//Я тебя слушаю.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_13_02");	//Ко мне вчера приходил Гард и в очередной раз начал клевать мозги, что нужно починить эту чертову мельницу.
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_15_03");	//А я здесь при чем?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_13_04");	//Ну как же. Мне нужно починить мельницу, а тебе нужно золото. Смекаешь? (подмигивает) Давай поможем друг другу.

	Info_ClearChoices(DIA_Joseph_NeedHelpOldMill);
	Info_AddChoice(DIA_Joseph_NeedHelpOldMill,"Я согласен. Что нужно делать?",DIA_Joseph_NeedHelpOldMill_Yes);
	Info_AddChoice(DIA_Joseph_NeedHelpOldMill,"Мне это не интересно.",DIA_Joseph_NeedHelpOldMill_No);
};
func void DIA_Joseph_NeedHelpOldMill_No()
{
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_No_15_00");	//Мне это неинтересно.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_No_13_01");	//Ну и пошел к черту!
	AI_StopProcessInfos(self);
};
func void DIA_Joseph_NeedHelpOldMill_Yes()
{
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_00");	//Я согласен. Что нужно делать?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_01");	//Я осмотрел мельницу и выяснил, что от меня, как от кузнеца, проку вообще нет. Для перемалывания муки используется древесина и камень.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_02");	//Каменный круг, конечно же, можно окантовать железными пластинами, как и наконечники деревянных цилиндров, передающие крутящий момент от вращения лопастей мельницы.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_03");	//Но это никак не способствует ни ее ремонту, ни улучшению ее работы.
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_04");	//Так объясни это Грегу.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_05");	//Ты думаешь один такой умный?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_06");	//Я ему уже раз десять это рассказал, на что он заладил, дескать, все крестьяне в деревне не знают, как починить мельницу, и раньше этим занимался их любимый Густав, который удрал из деревни, мракорис ему в печенку!
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_07");	//А если мы застрянем здесь до зимы, то жрать вообще будет нечего, сожри его печенку болотный червь!
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_08");	//Хорошо. Что требуется от меня?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_09");	//Там сломана одна из осей, а также каменный круг совсем стерся, его тоже нужно менять. Он-то своим весом и сломал ось. В общем, если палку я и сам смогу найти и отшлифовать, то вот с камнем дело сложнее.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_10");	//Простой булыжник не подойдет – нужен особо крепкий камень. Я думаю, гранит будет в самый раз!
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_11");	//И как я один дотащу огромный камень?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_12");	//Дубина! Не надо тащить, ты найди его сначала! В округе я не обнаружил ничего подходящего.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_13");	//Как только найдешь, скажешь мне, я отправлю туда парней, они притащат его в кузницу, ну а тут уж я его как-нибудь приведу в требуемый вид.
	AI_Output(other,self,"DIA_Joseph_NeedHelpOldMill_Yes_15_14");	//Где мне искать этот камень?
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_15");	//А я откуда знаю, мясной жук тебе подмышку! Спроси жену кузнеца.
		AI_Output(self,other,"DIA_Joseph_NeedHelpOldMill_Yes_13_16");	//Раз ее муженек раньше занимался ремонтом мельницы, она наверняка должна знать, где он брал камни.

	//Запись в дневнике "Старая мельница" 
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldMill_Start);
	Info_ClearChoices(DIA_Joseph_NeedHelpOldMill);
};

//----------------------------
// Узнали про гранит от Тамира	(+опыт)
instance DIA_Joseph_KnowWhereStone(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 4;
	condition = DIA_Joseph_KnowWhereStone_condition;	
	information = DIA_Joseph_KnowWhereStone_info;
	description = "Я знаю, где можно добыть гранит!";
};
func int DIA_Joseph_KnowWhereStone_condition()
{
	if (Npc_KnowsInfo(other, DIA_Tamir_WhereGetStone4Mill))
	{	return TRUE;};
};
func void DIA_Joseph_KnowWhereStone_info()
{
	AI_Output(other,self,"DIA_Joseph_KnowWhereStone_15_00");	//Я знаю, где можно добыть гранит!
	//(+опыт)
	B_GivePlayerXP(XP_MIS_OldMill_TellAboutGrave);
		AI_Output(self,other,"DIA_Joseph_KnowWhereStone_13_01");	//Ага, во “Вратах преисподней“!
	AI_Output(other,self,"DIA_Joseph_KnowWhereStone_15_02");	//(удивленно) Откуда ты знаешь?
		AI_Output(self,other,"DIA_Joseph_KnowWhereStone_13_03");	//А ты думаешь, я здесь просто так штаны протираю? Я уже давно знаю про эту пещерку, но мне дорога жизнь, и добровольно соваться к нежити я не намерен!
	AI_Output(other,self,"DIA_Joseph_KnowWhereStone_15_04");	//Тогда к чему этот цирк?
		AI_Output(self,other,"DIA_Joseph_KnowWhereStone_13_05");	//Я думал, тебе повезет больше, и ты найдешь другое место, где можно добыть гранит, не оставив свои кишки, намотанными на саблю зомбаря или скелета.
	AI_Output(other,self,"DIA_Joseph_KnowWhereStone_15_06");	//Похоже, других мест нет.
		AI_Output(self,other,"DIA_Joseph_KnowWhereStone_13_07");	//Ну, значит, тебе придется сходить туда и всех перебить. Я слышал от Грега, что ты мастер по этой части. (смеется)

	//Запись в дневнике "Старая мельница" 
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldMill_JosephKnew);
};

//----------------------------
// Сдача квеста, перебита вся нежить	(+опыт, арбалет "Полет звезды")
instance DIA_Joseph_Cave4MillIsClear(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 4;
	condition = DIA_Joseph_Cave4MillIsClear_condition;	
	information = DIA_Joseph_Cave4MillIsClear_info;
	description = "";
};
func int DIA_Joseph_Cave4MillIsClear_condition()
{
	if (Npc_KnowsInfo(other, DIA_Joseph_KnowWhereStone) && C_DSG_GraniteGraveIsClear())
	{	return TRUE;};
};
func void DIA_Joseph_Cave4MillIsClear_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_Cave4MillIsClear_15_00");	//Пещера очищена от нежити.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_OldMill_Success);
		AI_Output(self,other,"DIA_Joseph_Cave4MillIsClear_13_01");	//Ты шутишь? Хочешь сказать, что в одиночку перебил всех упырей?
	AI_Output(other,self,"DIA_Joseph_Cave4MillIsClear_15_02");	//Если не веришь, сходи и посмотри лично. Тебе же Грег говорил, что для меня это не проблема.
		AI_Output(self,other,"DIA_Joseph_Cave4MillIsClear_13_03");	//Разрази меня гром! Я думал, Грег просто байки травит. Хм... Ладно. Но если ты мне соврал, я тебе горло перережу, понял?!
		AI_Output(self,other,"DIA_Joseph_Cave4MillIsClear_13_04");	//Держи за работу этот арбалет, я его совсем недавно смастерил. Еще даже не пристрелянный.
	//Дает арбалет «Полет звезды»
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ItRw_DS2P_Crossbow_StarFlight,1);
	};
	Joseph_RepairMill_Day = Wld_GetDay() + 2;
	
	//Запись в дневнике "Старая мельница" 
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_OldMill_Success);
};


//NS - 03/07/2013 =======================
//  По квесту "Азартный игрок"
//=======================================

//----------------------------
// "Я слышал, что вы разыграли Валеса."		nr=5
instance DIA_Joseph_AboutVales(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 5;
	condition = DIA_Joseph_AboutVales_condition;	
	information = DIA_Joseph_AboutVales_info;
	description = "Я слышал, что вы разыграли Валеса.";
};
func int DIA_Joseph_AboutVales_condition()
{
	if (Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && !Npc_KnowsInfo(other,DIA_Zedd_UAStutterReason))
	{	return TRUE;};
};
func void DIA_Joseph_AboutVales_info()
{
	AI_Output(other,self,"DIA_Joseph_AboutVales_15_00");	//Я слышал, что вы разыграли Валеса.
		AI_Output(self,other,"DIA_Joseph_AboutVales_13_01");	//(смеется) А то! Потеха была что надо! Тогда Валес нас до нитки обобрал, ну вот мы и решили его разыграть, чтобы знал наших! ХА!
		AI_Output(self,other,"DIA_Joseph_AboutVales_13_02");	//По-моему, Валес тогда штаны намочил с перепугу. (громко смеется)
};


//----------------------------
// "Мне нужны кузнечные меха."		nr=5
instance DIA_Joseph_NeedForgeBellows(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 5;
	condition = DIA_Joseph_NeedForgeBellows_condition;	
	information = DIA_Joseph_NeedForgeBellows_info;
	description = "Мне нужны кузнечные меха.";
};
func int DIA_Joseph_NeedForgeBellows_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_UAStutterReason))
	{	return TRUE;};
};
func void DIA_Joseph_NeedForgeBellows_info()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_15_00");	//Мне нужны кузнечные меха.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_13_01");	//Не поверишь – мне они тоже нужны!
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_15_02");	//Зедд придумал некий план, как еще раз разыграть Валеса.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_13_03");	//Сколько он выпил, пока придумывал этот план?
	
	Info_ClearChoices(DIA_Joseph_NeedForgeBellows);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"Не помню",DIA_Joseph_NeedForgeBellows_CantRemember);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"Четыре раза",DIA_Joseph_NeedForgeBellows_4);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"Три раза",DIA_Joseph_NeedForgeBellows_Right);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"Два раза",DIA_Joseph_NeedForgeBellows_2);
	Info_AddChoice(DIA_Joseph_NeedForgeBellows,"Один раз",DIA_Joseph_NeedForgeBellows_1);
};
//неверный ответ
func void DIA_Joseph_NeedForgeBellows_Wrong()
{
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Wrong_13_00");	//Зедду всегда приходят самые гениальные идеи на третьей бутылке. Уж я-то его не первый год знаю.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Wrong_13_01");	//Запомни это, когда в следующий раз придешь от него ко мне с какой-нибудь просьбой.
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_Wrong_15_02");	//И что это меняет?
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Wrong_13_03");	//А то, что я тебе не верю. Если тебе нужны меха, я отдам тебе, скажем, за двести монет.
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_Wrong_15_04");	//Пойди и сам у него спроси, если мне не доверяешь.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Wrong_13_05");	//А оно мне надо? Хочешь меха – плати!

	//Запись в дневнике "Азартный игрок" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_JosephPay);
};
//верный ответ
func void DIA_Joseph_NeedForgeBellows_Right()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_Right_15_00");	//Три раза.
		AI_Output(self,other,"DIA_Joseph_NeedForgeBellows_Right_13_01");	//Узнаю старину Зедда. Опять затеял какую-то авантюру. Я в деле. Забирай меха.
	Joseph_GaveForgeBellows = TRUE;
	//Запись в дневнике "Азартный игрок" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_JosephGaveBellows);
};
//неверные варианты
func void DIA_Joseph_NeedForgeBellows_1()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_1_15_00");	//Один раз.
	DIA_Joseph_NeedForgeBellows_Wrong();
};
func void DIA_Joseph_NeedForgeBellows_2()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_2_15_00");	//Два раза.
	DIA_Joseph_NeedForgeBellows_Wrong();
};
func void DIA_Joseph_NeedForgeBellows_4()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_4_15_00");	//Четыре раза.
	DIA_Joseph_NeedForgeBellows_Wrong();
};
func void DIA_Joseph_NeedForgeBellows_CantRemember()
{
	AI_Output(other,self,"DIA_Joseph_NeedForgeBellows_CantRemember_15_00");	//Не помню.
	DIA_Joseph_NeedForgeBellows_Wrong();
};


//----------------------------
// Купить меха (200 зол.), пока не купим		nr=5
instance DIA_Joseph_BuyForgeBellows(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 5;
	condition = DIA_Joseph_BuyForgeBellows_condition;	
	information = DIA_Joseph_BuyForgeBellows_info;
	description = "Мне нужны кузнечные меха.";
	permanent = TRUE;
};
func int DIA_Joseph_BuyForgeBellows_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_NeedForgeBellows) && (Joseph_GaveForgeBellows == FALSE))
	{	return TRUE;};
};
func void DIA_Joseph_BuyForgeBellows_info()
{
	var int x;
	AI_Output(other,self,"DIA_Joseph_BuyForgeBellows_15_00");	//Продай мне меха для кузницы.
	if (Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		AI_Output(self,other,"DIA_Joseph_BuyForgeBellows_13_01");	//Вот это другой разговор. Забирай.
		//Отдает меха, забирает золото
		x = 1; if (x == 1)	{
			B_DS_GiveRemoveItems(other,self,ItMi_Gold,200);
			B_GiveInvItems(self,other,ITMI_DS2P_ForgeBellows,1);
		};
		Joseph_GaveForgeBellows = TRUE;
		//Запись в дневнике "Азартный игрок" 
		B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_JosephGaveBellows);
	}
	else
	{
		AI_Output(self,other,"DIA_Joseph_BuyForgeBellows_13_02");	//Принесешь золото – будут тебе меха.
	};
};


//NS - 26/06/2013 ==============================================
//  ОБУЧЕНИЕ И ТОРГОВЛЯ
// Учит кузнечному делу и силе за золото и LP
// Может изготовить оружие на заказ
//==============================================================

//----------------------------
// "Ты можешь обучить меня кузнечному делу?"		nr=10
instance DIA_Joseph_CanUTeach(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 10;
	condition = DIA_Joseph_CanUTeach_condition;	
	information = DIA_Joseph_CanUTeach_info;
	description = "Ты можешь обучить меня кузнечному делу?";
};
func int DIA_Joseph_CanUTeach_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_CanUTeach_info()
{
	AI_Output(other,self,"DIA_Joseph_CanUTeach_15_00");	//Ты можешь обучить меня кузнечному делу?
		AI_Output(self,other,"DIA_Joseph_CanUTeach_13_01");	//А ты уже что-то умеешь? У меня нет ни времени, ни желания возиться с профанами, которые даже молот не умеют в руках держать.
	AI_Output(other,self,"DIA_Joseph_CanUTeach_15_02");	//Да, в Хоринисе у меня был отличный учитель, кузнец Харад. Он многому меня научил.
		AI_Output(self,other,"DIA_Joseph_CanUTeach_13_03");	//Ну хорошо, раз так. Тащи золото, и я научу тебя всему, что знаю сам.
		AI_Output(self,other,"DIA_Joseph_CanUTeach_13_04");	//У меня при себе есть пару чертежей отличных клинков, луков и арбалетов. Я продам тебе, если хочешь.
	// Вкл. обучение и торговлю
	TEACH_Joseph_Smith = TRUE;
	TRADE_Joseph = TRUE;
	
	//Запись в дневнике в разделе доп инфо "Учителя в деревне" 
	B_ds_LogEntry(TOPIC_PiratTeacher,LOG_NOTE,-1,"Джозеф может научить меня изготавливать клинки.");

	//Запись в дневнике в разделе доп инфо "Торговцы в деревне" 
	B_ds_LogEntry(TOPIC_PiratTrader,LOG_NOTE,-1,"Джозеф продает чертежи для изготовления клинков.");
};

//----------------------------
// "Я бы хотел заточить оружие."		nr=11
instance DIA_Joseph_Sharpening(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 11;
	condition = DIA_Joseph_Sharpening_condition;	
	information = DIA_Joseph_Sharpening_info;
	description = "Я бы хотел заточить оружие.";
};
func int DIA_Joseph_Sharpening_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_Sharpening_info()
{
	AI_Output(other,self,"DIA_Joseph_Sharpening_15_00");	//Я бы хотел заточить оружие.
		AI_Output(self,other,"DIA_Joseph_Sharpening_13_01");	//И что тебе мешает? Берешь клинок, идешь к точильному камню и вперед.
		AI_Output(self,other,"DIA_Joseph_Sharpening_13_02");	//Если у тебя руки растут из нужного места, проблем быть не должно.
};

//----------------------------
// "Я хотел бы увеличить свою силу."		nr=12
instance DIA_Joseph_PreTeach_Str(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 12;
	condition = DIA_Joseph_PreTeach_Str_condition;	
	information = DIA_Joseph_PreTeach_Str_info;
	description = "Я хотел бы увеличить свою силу.";
};
func int DIA_Joseph_PreTeach_Str_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_WhatsYourName))
	{	return TRUE;};
};
func void DIA_Joseph_PreTeach_Str_info()
{
	AI_Output(other,self,"DIA_Joseph_PreTeach_Str_15_00");	//Я хотел бы увеличить свою силу.
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_13_01");	//О, ты пришел как раз к нужному человеку, лопни моя селезенка! Если не я, то никто не сможет тебе помочь! (громко смеется)
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_13_02");	//Но сначала покажи, на что ты способен.
	AI_Output(other,self,"DIA_Joseph_PreTeach_Str_15_03");	//В смысле?
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_13_04");	//В прямом – нападай. Может тебе и учитель уже не нужен, ха! Не бойся, я убивать тебя не буду, так, покалечу чуть. (громко смеется)
	Info_ClearChoices(DIA_Joseph_PreTeach_Str);
	Info_AddChoice(DIA_Joseph_PreTeach_Str,"Давай посмотрим, кто сильнее.",DIA_Joseph_PreTeach_Str_Yes);
	Info_AddChoice(DIA_Joseph_PreTeach_Str,"Может в другой раз?",DIA_Joseph_PreTeach_Str_No);
};

func void DIA_Joseph_PreTeach_Str_No()
{
	AI_Output(other,self,"DIA_Joseph_PreTeach_Str_No_15_00");	//Может в другой раз?
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_No_13_01");	//Эээ, не! Другого раза уже не будет!
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_No_13_02");	//А мне давно уже нужно размяться, а то уже кости все заныли, мои руки просто просят хорошей разминки.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Joseph_Fight = TRUE;
};

func void DIA_Joseph_PreTeach_Str_Yes()
{
	AI_Output(other,self,"DIA_Joseph_PreTeach_Str_Yes_15_00");	//Давай посмотрим, кто сильнее.
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_Yes_13_01");	//Это ответ настоящего мужика!
		AI_Output(self,other,"DIA_Joseph_PreTeach_Str_Yes_13_02");	//Держись, коровье вымя, сейчас будет больно! Ха!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Joseph_Fight = TRUE;
};

//----------------------------
// 	после боя:
// 	выиграли +2 сила,  	проиграли +опыт
instance DIA_Joseph_Fight_Finished(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 0;
	condition = DIA_Joseph_Fight_Finished_condition;	
	information = DIA_Joseph_Fight_Finished_info;
	important = TRUE;
};
func int DIA_Joseph_Fight_Finished_condition()
{
	if ((Joseph_Fight == TRUE)
		&& (self.aivar[AIV_LastFightComment] == FALSE)
		&& ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)))
	{	return TRUE;};
};
func void DIA_Joseph_Fight_Finished_info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Joseph_Fight_Finished_13_01");	//А ты крепкий малый! Даже не ожидал, что тебе удастся победить самого Джозефа! 
		B_RaiseAttribute(other,ATR_STRENGTH,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Joseph_Fight_Finished_13_02");	//Ну ты как, живой там? А то я уж думал, что ты решил к Белиару в гости сходить. (громко смеется)
		AI_Output(self,other,"DIA_Joseph_Fight_Finished_13_03");	//Ладно, не обижайся, ты не первый и не последний, кому я кости пересчитал! Ха!
		B_GivePlayerXP(XP_Joseph_Fight_Lost);
	};
	self.aivar[AIV_LastFightComment] = TRUE;
	
	//в любом случае будет учить
	AI_Output(other,self,"DIA_Joseph_Fight_Finished_15_04");	//Теперь ты будешь меня учить?
		AI_Output(self,other,"DIA_Joseph_Fight_Finished_13_05");	//Конечно, ты же помог мне размять кости. (смеется) Приходи в любое время.
	
	//Запись в дневнике в разделе доп инфо "Учителя в деревне" 
	B_ds_LogEntry(TOPIC_PiratTeacher,LOG_NOTE,-1,"У Джозефа я могу увеличить свою силу.");
	TEACH_Joseph_Str = TRUE;
	
	AI_StopProcessInfos(self);
};

//===========================================================
// ТОРГОВЛЯ		nr=21
instance DIA_Joseph_TRADE(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 21;
	condition = DIA_Joseph_TRADE_condition;	
	information = DIA_Joseph_TRADE_info;
	description = "Покажи, что у тебя есть.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Joseph_TRADE_condition()
{
	if (TRADE_Joseph == TRUE)
	{	return TRUE;};
};
func void DIA_Joseph_TRADE_info()
{
	AI_Output(other,self,"DIA_Joseph_TRADE_15_00");	//Покажи, что у тебя есть.
		AI_Output(self,other,"DIA_Joseph_TRADE_13_01");	//Вот все, что у меня есть.
	B_GiveTradeInv(self);
};
// Продажа клинков, если вернули железо и прошло 2 дня,
//однократный, потом в обычном диалоге торговли
instance DIA_Joseph_TRADE_Weapon(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 20;
	condition = DIA_Joseph_TRADE_Weapon_condition;	
	information = DIA_Joseph_TRADE_Weapon_info;
	description = "Я могу купить у тебя клинки?";
	trade = TRUE;
};
func int DIA_Joseph_TRADE_Weapon_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_SUCCESS) && ((Joseph_ReturnIron_Day + 2) >= Wld_GetDay()))
	{	return TRUE;};
};
func void DIA_Joseph_TRADE_Weapon_info()
{
	AI_Output(other,self,"DIA_Joseph_TRADE_Weapon_15_00");	//Я могу купить у тебя клинки?
		AI_Output(self,other,"DIA_Joseph_TRADE_Weapon_13_01");	//Конечно, выбирай.
	TRADE_Joseph = TRUE;
	Give_Joseph_Weapon = TRUE; // признак, что надо добавить в инвентарь оружие
	B_GiveTradeInv(self);
	
	//Запись в дневнике в разделе доп инфо "Торговцы у пиратов" 
	B_ds_LogEntry(TOPIC_PiratTrader,LOG_NOTE,-1,"У Джозефа я могу купить клинки.");
};

//===========================================================
// Обучение КОВКА		nr=50
// за очки опыта и золото
instance DIA_Joseph_TEACH_Smith(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 50;
	condition = DIA_Joseph_TEACH_Smith_condition;	
	information = DIA_Joseph_TEACH_Smith_info;
	description = "Научи меня ковать клинки.";
	permanent = TRUE;
};
func int DIA_Joseph_TEACH_Smith_condition()
{
	if (TEACH_Joseph_Smith == TRUE)
	{	return TRUE;};
};

// меню, 1 уровень --------------------------------

func void B_Joseph_TEACH_Smith_Menu()
{
	Info_ClearChoices(DIA_Joseph_TEACH_Smith);
	Info_AddChoice(DIA_Joseph_TEACH_Smith,Dialog_Back,DIA_Joseph_TEACH_Smith_back);
	/* UNFINISHED
	//шаблон
	if(Weapon_Ds_Template = FALSE)	
	{	
		Info_AddChoice(DIA_Joseph_TEACH_Smith,"Название (x LP, xxx зол.)",DIA_Joseph_TEACH_Smith_DoIt_Template);
	};
	//*/
};

func void DIA_Joseph_TEACH_Smith_info()
{
	AI_Output(other,self,"DIA_Joseph_TEACH_15_00");	//Научи меня ковать клинки.
		AI_Output(self,other,"DIA_Joseph_TEACH_13_01");	//Давай золото, и приступим.
	B_Joseph_TEACH_Smith_Menu();
};

func void DIA_Joseph_TEACH_Smith_back()
{
	Info_ClearChoices(DIA_Joseph_TEACH_STR);
};

// общая функция ----------------------------------
func int DIA_Joseph_TEACH_Smith_DoIt(var int lp, var int price, var string Log_Str)
{
	var int Result;	Result = 0;
	if(other.lp >= lp)
	{
		if(Npc_HasItems(other,ItMi_Gold) >= price)
		{
			other.lp -= lp;		
			B_DS_GiveRemoveItems(other,self,ItMi_Gold,price);		
			B_ds_LogEntry(TOPIC_TalentSmith,LOG_NOTE,-1,Log_Str);	
			Result = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Joseph_NoGold_13_00");	//У тебя недостаточно золота.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Joseph_NoLP_13_00");	//У тебя недостаточно опыта.
	};
	B_Joseph_TEACH_Smith_Menu();
	return Result;
};

// конкретное оружие -------------------------------
/* UNFINISHED
func int DIA_Joseph_TEACH_Smith_DoIt_Template()	//шаблон
{
	// если научились ковать - записать в нужную переменную
	if (DIA_Joseph_TEACH_Smith_DoIt(0,0,"Запись в журнал"))
	{	Weapon_Ds_Template = TRUE;	};
};
//*/


//===========================================================
// Обучение СИЛА		nr=51
// за очки опыта и золото
instance DIA_Joseph_TEACH_STR(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 51;
	condition = DIA_Joseph_TEACH_STR_condition;	
	information = DIA_Joseph_TEACH_STR_info;
	description = "Я бы хотел увеличить свою силу.";
	permanent = TRUE;
};
func int DIA_Joseph_TEACH_STR_condition()
{
	if (TEACH_Joseph_Str == TRUE)
	{	return TRUE;};
};
func void B_Joseph_TEACH_STR_Menu()
{
	Info_ClearChoices(DIA_Joseph_TEACH_STR);
	Info_AddChoice(DIA_Joseph_TEACH_STR,Dialog_Back,DIA_Joseph_TEACH_STR_back);
	Info_AddChoice(DIA_Joseph_TEACH_STR,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_STRENGTH,1,-1),DIA_Joseph_TEACH_STR_1);
	Info_AddChoice(DIA_Joseph_TEACH_STR,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_STRENGTH,5,-1),DIA_Joseph_TEACH_STR_5);
};
func void DIA_Joseph_TEACH_STR_info()
{
	AI_Output(other,self,"DIA_Joseph_TEACH_STR_15_00");	//Я бы хотел увеличить свою силу.
		AI_Output(self,other,"DIA_Joseph_TEACH_STR_13_01");	//Хорошо, давай потренируемся.
	B_Joseph_TEACH_STR_Menu();
};
func void DIA_Joseph_TEACH_STR_back()
{
	Info_ClearChoices(DIA_Joseph_TEACH_STR);
};
func void DIA_Joseph_TEACH_STR_DoIt(var int points)
{
	var int cost;
	cost = b_ds_GetTeachAtrPaymentAmount(other,ATR_STRENGTH,points);
	if(Npc_HasItems(other,ItMi_Gold) >= cost)
	{
		if(B_TeachAttributePoints(self,other,ATR_STRENGTH,points,T_MAX))
		{
			b_giveInvItems(other,self,ItMi_Gold,cost);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Joseph_NoGold_13_00");	//У тебя недостаточно золота.
	};
	B_Joseph_TEACH_STR_Menu();
};
func void DIA_Joseph_TEACH_STR_1()
{
	DIA_Joseph_TEACH_STR_DoIt(1);
};
func void DIA_Joseph_TEACH_STR_5()
{
	DIA_Joseph_TEACH_STR_DoIt(5);
};

//===========================================================
// ИЗГОТОВЛЕНИЕ ОРУЖИЯ		nr=70
instance DIA_Joseph_MADE_Weapon(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 70;
	condition = DIA_Joseph_MADE_Weapon_condition;	
	information = DIA_Joseph_MADE_Weapon_info;
	description = "По поводу магического оружия...";
	permanent = TRUE;
};
func int DIA_Joseph_MADE_Weapon_condition()
{
	if ((MADE_Weapon_Joseph == TRUE)
		&& (Joseph_Busy == FALSE))	//если в данный момент не занят
	{	return TRUE;};
};
func void DIA_Joseph_MADE_Weapon_info()
{
	AI_Output(other,self,"DIA_Joseph_MADE_Weapon_15_00");	//По поводу магического оружия...
	Info_ClearChoices(DIA_Joseph_MADE_Weapon);
	/* UNFINISHED
	Info_AddChoice(DIA_Joseph_MADE_Weapon,"Изготовь для меня ...",DIA_Joseph_MADE_Weapon_Template);
	//*/
};
// изготовить ItemID, если достаточно золота
func int C_Joseph_MADE_Weapon_CanMade(var int GoldAmount, var int ItemID)
{
	if (Npc_HasItems(other,ItMi_gold) < GoldAmount)
	{
		AI_Output(self,other,"DIA_Joseph_NoGold_13_00");	//У тебя недостаточно золота.
		return FALSE;
	};
	AI_Output(self,other,"DIA_Joseph_MADE_Weapon_13_01");	//Приходи через пару часов, все будет готово.
	Joseph_Busy = TRUE;
	Joseph_ReadyTime = C_GetTime_Plus(2,0,15);
	Joseph_WorksOn = ItemID;
	// начинает ковать, если до этого не ковал
	if (MIS_DS2P_WhoStoleMyIron != LOG_SUCCESS)
	{
		B_StartOtherRoutine(self, "START");
	};
	return TRUE;
};

func void C_Joseph_MADE_Weapon_NoMaterials()
{
	AI_Output(self,other,"DIA_Joseph_NoMaterials_13_00");	//У тебя недостаточно материалов.
};


// конкретное оружие -------------------------------
/* UNFINISHED
//шаблон
func int DIA_Joseph_MADE_Weapon_Template()
{
	//проверка материалов
	if (C_Npc_DS_HasItems_Scr(hero,It,1,YPos_3,true)
		&& (C_Npc_DS_HasItems_Scr(hero,It,1,YPos_5,true))
	{	
		C_Joseph_MADE_Weapon_CanMade(0, Hlp_GetInstanceID(ItMw_Template));//изготовление оружия с проверкой золота
	}
	else
	{
		C_Joseph_MADE_Weapon_NoMaterials();
	};
	AI_StopProcessInfos(self);
};
//*/

// Оружие ГОТОВО ----------------------------------
instance DIA_Joseph_MADE_Weapon_Ready(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 0;
	condition = DIA_Joseph_MADE_Weapon_Ready_condition;	
	information = DIA_Joseph_MADE_Weapon_Ready_info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Joseph_MADE_Weapon_Ready_condition()
{
	if ((Joseph_ReadyTime >= Wld_GetPassedTime(0)) && (Joseph_Busy == TRUE) && (Joseph_WorksOn > 0))
	{	return TRUE;};
};
func void DIA_Joseph_MADE_Weapon_Ready_info()
{
		AI_Output(self,other,"DIA_Joseph_InstrumentsReady_13_00");	//Все готово. По-моему, получилось очень неплохо.
	//выдает оружие
	B_GiveInvItems(self, other, Joseph_WorksOn, 1);
	//отметка, что не занят
	Joseph_Busy = FALSE;
	Joseph_WorksOn = 0;
	// Возвращается к безделью, если нет железа
	if (MIS_DS2P_WhoStoleMyIron != LOG_SUCCESS)
	{
		B_StartOtherRoutine(self, "PRESTART");
	};
};

// Активируется, если взят квест "Зачарованные болты"
// nr = 1

instance DIA_Joseph_CharmedBolts(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_CharmedBolts_condition;	
	information = DIA_Joseph_CharmedBolts_info;
	permanent = FALSE;
	description = "Мне нужны зачарованные болты для арбалета.";
};

func int DIA_Joseph_CharmedBolts_condition()
{
	if (MIS_DS2P_CharmedBolts == Log_Running)
	{	
		return TRUE;
	};
};

func void DIA_Joseph_CharmedBolts_info()
{
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_15_00");	//Мне нужны зачарованные болты для арбалета.
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_13_01");	//Поздравляю, я-то тут причем?
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_15_02");	//Просто ты гораздо лучший кузнец, чем я, вот я и пришел попросить тебя о помощи.
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_13_03");	//Ну, это действительно так, мало какой кузнец способен изготовить пригодные к зачарованию наконечники для арбалета.
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_15_04");	//Так ты можешь мне их сделать? Мне надо два десятка рудных болтов.
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_13_05");	//Сделаю. Только, во-первых, принеси мне пять кусков магической руды. Из одного такого куска получается примерно четыре наконечника. А во-вторых, ты мне принесешь форму для наконечников, потому что я свою оставил на «Каталине».
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_13_06");	//В-третьих, каждый изготовленный болт будет стоить 10 монет, не меньше. Покупаешь все разом. Идет?
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_15_07");	//Куда я денусь.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_Success,TOPIC_DS2P_CharmedBolts_BringIngredients);
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Зачарованные болты", и принесли все ингредиенты для Джозефа
// nr = 1

instance DIA_Joseph_CharmedBoltsCreating(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_CharmedBoltsCreating_condition;	
	information = DIA_Joseph_CharmedBoltsCreating_info;
	permanent = FALSE;
	description = "Вот, я все собрал.";
};

func int DIA_Joseph_CharmedBoltsCreating_condition()
{
	if ((MIS_DS2P_CharmedBolts == Log_Running) && Npc_KnowsInfo(other,DIA_Joseph_CharmedBolts)
		 && (Npc_HasItems(other,ItMi_Nugget) >= 5) && (Npc_HasItems(other,ITMI_FUSING_RW_TEMPLATE) >= 1)
		 && (Npc_HasItems(other,ItMi_Gold) >= 200))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_CharmedBoltsCreating_info()
{
	AI_Output(other,self,"DIA_Joseph_CharmedBoltsCreating_15_00");	//Вот, я все собрал. Пять кусков руды.
	// Отдаем Джозефу руду
	B_GiveInvItems(other,self,ItMi_Nugget,5);
	AI_Output(other,self,"DIA_Joseph_CharmedBoltsCreating_15_01");	//Форма для наконечников.
	// Отдаем Джозефу форму
	B_GiveInvItems(other,self,ITMI_FUSING_RW_TEMPLATE,1);
	AI_Output(other,self,"DIA_Joseph_CharmedBoltsCreating_15_02");	//И 200 монет.
	// Отдаем Джозефу 200 золотых
	B_GiveInvItems(other,self,ItMi_Gold,200);
	AI_Output(other,self,"DIA_Joseph_CharmedBoltsCreating_15_03");	//Я свою часть выполнил. Теперь твоя очередь.
	AI_Output(self,other,"DIA_Joseph_CharmedBoltsCreating_13_04");	//Приходи через четыре часа, за это время я управлюсь.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_Running,TOPIC_DS2P_CharmedBolts_CreatingBolts);
	Joseph_CharmedBolts = C_GetTime_Plus(4,0,1);
	Joseph_CharmedBoltsCreated = FALSE;
	AI_StopProcessInfos(self);
};
	
// Запускается, если взят квест "Зачарованные болты", Джозеф приступил к работе, и прошло меньше 4 часов
// nr = 1

instance DIA_Joseph_CharmedBolts_NotReady(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_CharmedBolts_NotReady_condition;	
	information = DIA_Joseph_CharmedBolts_NotReady_info;
	permanent = TRUE;
	important = TRUE;
	description = " ";
};

func int DIA_Joseph_CharmedBolts_NotReady_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_CharmedBoltsCreating) && (Joseph_CharmedBoltsCreated == FALSE)
		&& (Joseph_CharmedBolts < Wld_GetPassedTime(0)) && Npc_IsInState(self,ZS_Talk))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_CharmedBolts_NotReady_info()
{
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_NotReady_13_00");	//Еще не готово, приходи позже.
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Зачарованные болты", Джозеф приступил к работе, и прошло больше 4 часов
// nr = 1

instance DIA_Joseph_CharmedBolts_Ready(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_CharmedBolts_Ready_condition;	
	information = DIA_Joseph_CharmedBolts_Ready_info;
	permanent = FALSE;
	important = TRUE;
	description = " ";
};

func int DIA_Joseph_CharmedBolts_Ready_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_CharmedBoltsCreating) && (Joseph_CharmedBoltsCreated == FALSE)
		&& (Joseph_CharmedBolts >= Wld_GetPassedTime(0)))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_CharmedBolts_Ready_info()
{
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_Ready_13_00");	//Вот болты.
	// Создаем болты в инвентаре Джозефа и отдаем ГГ
	CreateInvItems(self,ITRW_ADDON_MAGICOREBOLT,20);
	B_GiveInvItems(self,other,ITRW_ADDON_MAGICOREBOLT,20);
	AI_Output(self,other,"DIA_Joseph_CharmedBolts_Ready_13_01");	//Наконечники, как и заказывал, сделаны из руды, а вот древко самое обычное – не было времени делать что-то особенное.
	AI_Output(other,self,"DIA_Joseph_CharmedBolts_Ready_15_02");	//Ничего и так сойдет. Спасибо.
	Joseph_CharmedBoltsCreated = TRUE;
	AI_StopProcessInfos(self);
};

// Активируется, если взят "Заговор"
// nr = 1

instance DIA_Joseph_SpecialAxe(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_SpecialAxe_condition;	
	information = DIA_Joseph_SpecialAxe_info;
	permanent = FALSE;
	description = "Я слышал, что ты хочешь выковать какое-то особое оружие.";
};

func int DIA_Joseph_SpecialAxe_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && (C_DIA_Greg_OurIdea_Know_AboutJoseph == TRUE))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_SpecialAxe_info()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_00");	//Я слышал, что ты хочешь выковать какое-то особое оружие. Можешь, рассказать поподробнее?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_01");	//Это кто такой брехливый, а?
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_02");	//Болтают разное. Ты же знаешь пиратов, стоит им напиться, как все секреты растреплют.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_03");	//Кажется, я догадываюсь, кто языком мелет, не переставая. Зедд, небось, да? Это старое трепло все, что угодно расскажет за лишнюю бутылку. А зачем ТЕБЯ это интересует?
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_04");	//Я и сам неплохой кузнец и меня интересует все, что связано с кузнечным делом. Особенно если кто-то замыслил выковать нечто необычное. У меня самого времени совсем не хватает, чтобы давать волю фантазии.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_05");	//Да, кузнечное дело – это не просто прямую железяку выковать, это целое искусство. Много ума не надо, чтобы сделать обычный меч, а вот выковать нечто большее дано не каждому.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_06");	//Ты причисляешь себя к этим «особенным»?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_07");	//Конечно! (смеется) Я еще не видел другого кузнеца, который превзошел бы меня!
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_08");	//А почему тогда ты до сих пор не выковал топор, о котором мечтаешь?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_09");	//Ладно, я все равно не делаю из этого секрета. Все дело в инде… игне… ин-гре-ди-ен-тах… тьфу, никак это слово запомнить не могу!
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_10");	//А что не так с ингредиентами? Или тебе нужна магическая руда?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_11");	//Да нет, руда у меня есть – в последний момент я успел захватить с тонущего корабля самое ценное, жаль, что спасти все свои материалы не удалось. Я хочу выковать такой топор, который бы никогда не сломался, не затупился и был в тоже время легким.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_12");	//А чего именно тебе не хватает?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_13");	//Мне нужны: сердце каменного голема, реберная кость черного тролля и болванка магической руды.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_14");	//С болванкой более-менее ясно. А ЗАЧЕМ тебе все остальное?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_15");	//Кости троллей одни из самых крепких материалов в мире, а уж кости черного тролля – подавно. Из нее я хочу сделать крепкую рукоять, которая не преломится, если по ней садануть мечом.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_16");	//А сердце?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_17");	//Каменную кожу голема пробить практически невозможно, если только дробить булавой по кусочкам. Именно поэтому я и хочу добавить в сплав размельченное в пыль сердце голема. От этого клинок только выиграет. 
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_18");	//Ты представь себе: выкованное из чистейшей магической руды лезвие с добавление редкого сердца голема, который славится своей прочностью. 
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_19");	//Думаешь, это сработает? Я даже представить себе такого не могу, если честно. Никто ведь еще не пытался добавить в оружие сердце магического создания. В лучшем случае из этого просто ничего не выйдет.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_20");	//И, кстати, как тебе вообще в голову взбрело добавить в состав сплава сердце голема?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_21");	//Ну, мы однажды взяли один купеческий корабль, который вез одного пассажира, помимо груза. Этим пассажиром оказался довольно влиятельный и богатый алхимик, которого поручили мне охранять.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_22");	//Сначала я возмутился, но потом как-то даже смирился. Однажды мы с ним разговорились, он рассказал мне о своей профессии. Тогда-то я и узнал, что сердце голема используют в алхимии, чтобы укреплять кожу человека.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_23");	//После этого я и решил воспользоваться этой идеей, но уже в кузнечном деле.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_24");	//Может, я могу помочь тебе с поиском недостающих ингредиентов?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_25");	//Ты? Но зачем тебе это?
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_15_26");	//Интересно узнать, чем закончится твоя безумная идея.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_13_27");	//Что ж, я согласен. Принеси мне сердце каменного голема, реберную кость черного тролля и болванку магической руды.
	B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_Start);
	Info_ClearChoices(DIA_Joseph_SpecialAxe);
	Info_AddChoice(DIA_Joseph_SpecialAxe,"У меня больше нет вопросов.",DIA_Joseph_SpecialAxe_NoQuestions);
	Info_AddChoice(DIA_Joseph_SpecialAxe,"Где обитает черный тролль?",DIA_Joseph_SpecialAxe_BlackTroll);
	Info_AddChoice(DIA_Joseph_SpecialAxe,"Где мне искать каменного голема?",DIA_Joseph_SpecialAxe_StoneGolem);
	Info_AddChoice(DIA_Joseph_SpecialAxe,"Где мне найти болванку магической руды?",DIA_Joseph_SpecialAxe_Ore);
};

// Запускается, если выбрать реплику "Где мне найти болванку магической руды?" в диалоге с Джозефом

func void DIA_Joseph_SpecialAxe_Ore()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_00");	//Где мне найти болванку магической руды?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_01");	//В Нордмаре! (ржет )Ха-ха-ха!
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_02");	//А если серьезно?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_03");	//А я серьезно. Только в Нордмаре умеют правильно переплавлять магическую руду так, что она не теряет своих волшебных свойств.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_04");	//Но до Нордмара недели пути. Так что найди вариант полегче.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_05");	//Хм, дай подумать. В принципе, если у меня будет достаточно магической руды, то, думаю, я смогу как-нибудь обработать ее таким образом, что она практически не потеряет своих свойств. Правда, придется перемешать ее с обычной сталью, но другого варианта я не вижу.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_06");	//Так что принеси мне кусков двадцать магической руды, а дальше я сам.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_07");	//Ты же говорил, что у тебя уже есть руда.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_Ore_13_08");	//Этого мало! Будь у меня болванка магической руды, этого бы хватило с остатком.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_Ore_15_09");	//Ясно.
	B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_AboutOre);
};

// Запускается, если выбрать реплику "Где мне искать каменного голема?" в диалоге с Джозефом

func void DIA_Joseph_SpecialAxe_StoneGolem()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_StoneGolem_15_00");	//Где мне искать каменного голема?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_StoneGolem_13_01");	//Посмотри на северо-востоке, там скалистая местность, наверняка найдешь парочку.
	B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_AboutGolem);
};

// Запускается, если выбрать реплику "Где обитает черный тролль?" в диалоге с Джозефом

func void DIA_Joseph_SpecialAxe_BlackTroll()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BlackTroll_15_00");	//Где обитает черный тролль?
	// UNFINISHED - вписать где обитает черный тролль
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BlackTroll_13_01");	//Искать эту гору мышц следует there.
	B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_AboutTroll);
};

// Запускается, если выбрать реплику "У меня больше нет вопросов." в диалоге с Джозефом

func void DIA_Joseph_SpecialAxe_NoQuestions()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_NoQuestions_15_00");	//У меня больше нет вопросов.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_NoQuestions_13_01");	//Наконец-то! Теперь не медли – у меня уже руки чешутся начать работу.
	AI_StopProcessInfos(self);
};

// Активируется, если взят "Особый топор для Джозефа", и ГГ нашел все ингредиенты
// nr = 1

instance DIA_Joseph_SpecialAxe_BringIngr(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_SpecialAxe_BringIngr_condition;	
	information = DIA_Joseph_SpecialAxe_BringIngr_info;
	permanent = FALSE;
	description = "Я все собрал.";
};

func int DIA_Joseph_SpecialAxe_BringIngr_condition()
{
	if ((MIS_DS2P_SpecialAxe4Joseph == Log_Running) && (SpecialAxe_FindAllIngr == TRUE)
		 && (Npc_HasItems(hero,ItMi_Nugget) >= 20) && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1)
		 && (Npc_HasItems(hero,ItAt_DS2P_BlackTrollBone) >= 1))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_SpecialAxe_BringIngr_info()
{
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_00");	//Я все собрал.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_01");	//Да ладно?! Не верю – покажи!
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_02");	//Вот. Это сердце каменного голема.
	// Отдаем сердце Джозефу
	B_GiveInvItems(other,self,ItAt_StoneGolemHeart,1);
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_03");	//Это реберная кость черного тролля. Тяжелая штуковина, скажу я тебе.
	// Отдаем кость Джозефу
	B_GiveInvItems(other,self,ItAt_DS2P_BlackTrollBone,1);
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_04");	//А это руда.
	// Отдаем руду Джозефу
	B_GiveInvItems(other,self,ItMi_Nugget,20);
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_05");	//Невероятно! Ты действительно все собрал! Не думал, что это возможно.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_06");	//То есть ты считал, что невозможно добыть эти ингредиенты?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_07");	//Конечно! Победить голема в открытом бою может только слаженная группа из нескольких человек. Я уж не говорю про черного тролля, против которого можно выступать разве что собрав маленькую армию. Да и то я бы еще резерв держал из отборных паладинов.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_08");	//(со смешком) Как видишь, я один могу заменить маленькую армию.
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_09");	//Либо ты чертовски удачлив.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_10");	//Тоже вариант. Когда топор будет готов?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_11");	//Дня через два. Такая работа быстро не делается.
	AI_Output(other,self,"DIA_Joseph_SpecialAxe_BringIngr_15_12");	//Может помочь в ковке?
	AI_Output(self,other,"DIA_Joseph_SpecialAxe_BringIngr_13_13");	//Не, в таком деле я доверяю только себе, да и то не всегда. Приходи через пару суток, думаю, к этому времени управлюсь.
	Joseph_ReadyAxeTime = Wld_GetDay();
	AI_StopProcessInfos(self);
};

// Активируется, если Джозеф взялся за изготовление топора
// nr = 1

instance DIA_Joseph_ReadyAxe(C_Info)
{
	npc = PIR_205_DS2P_Joseph;
	nr = 1;
	condition = DIA_Joseph_ReadyAxe_condition;	
	information = DIA_Joseph_ReadyAxe_info;
	permanent = TRUE;
	description = "Готово?";
};

func int DIA_Joseph_ReadyAxe_condition()
{
	if ((MIS_DS2P_SpecialAxe4Joseph == Log_Running) && Npc_KnowsInfo(other,DIA_Joseph_SpecialAxe_BringIngr))
	{	
		return TRUE;
	};
};

func void DIA_Joseph_ReadyAxe_info()
{
	AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_00");	//Готово?
	if (Joseph_ReadyAxe == FALSE) // Если прошло меньше 2 дней
	{
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_01");	//Нет еще, приходи позже.
		AI_StopProcessInfos(self);
	}
	else // Если прошло больше 2 дней
	{
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_02");	//(горделиво) Да. Пришлось, правда, изрядно повозиться, чтобы добавить размельченное сердце голема, а также выстругать кость тролля – уж больно она широка для рукояти была поначалу.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_03");	//Покажешь?
		// Джозеф достает топор и осматривает его
		AI_ReadyMeleeWeapon(self);
		AI_PlayAni(self,"T_1HSINSPECT");
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_04");	//Ты посмотри, какая красота! Рукоять крепче любого дерева, я даже пару опытов поставил и со всей силы бил по ней мечом. Даже зазубрин не осталось! А лезвие способно пробить практически любой доспех.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_05");	//При всем при этом он настолько легкий, что буквально сам просится считать головы врагов в бессчетных количествах.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_06");	//Ага, особенно в маленьком трюме или кубрике.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_07");	//Ну, это уже некоторые издержки. Нельзя совместить в одном оружии все качества сразу.
		// Джозеф убирает топор
		AI_RemoveWeapon(self);
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_08");	//Топор действительно получился просто загляденье.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_09");	//Да, это лучшее оружие, которое я когда-либо ковал. Если кто и способен повторить мой подвиг, то только нордмарские кузнецы, больше никто.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_10");	//А ты не такой пустобрех как Серая Борода.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_11");	//Что есть, то есть. Но вернемся к другой проблеме. Зачем ты помогал мне сделать этот топор? Только не говори, что тебя это просто заинтересовало, никогда не поверю – уж слишком надуманно и притянуто за уши.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_12");	//Кроме того я поговорил с Зеддом, и он сказал, что ничего не говорил тебе про то, что мечтаю выковать особый топор. Согласен, это я сам додумал, но ты не опроверг меня. Что тебе нужно от меня?
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_13");	//(вздыхает) Ладно, скажу как есть. Грег собирается устроить совет пиратов, чтобы сместить Гарда с поста капитана, ему нужен твой голос.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_14");	//Хм, не скажу, что удивлен тем, что  Грег мутит воду. Такая уж у него натура, он не любит быть на вторых ролях.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_15");	//Что скажешь?
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_16");	//Если бы ты пришел ко мне с этим парой дней раньше, то я бы лично тебя прикончил. Но теперь, когда моя мечта исполнилась… думаю, я соглашусь, если Грег станет нашим новым капитаном.
		AI_Output(self,other,"DIA_Joseph_ReadyAxe_13_17");	//Он не самый худший вариант, да и Гард исчерпал свой лимит удачи. Так что да,  отдам свой голос за Грега. Но только не говорите ничего Гарду раньше времени – он всех нас под килем протащит.
		AI_Output(other,self,"DIA_Joseph_ReadyAxe_15_18");	//Заметано!
		B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Success,TOPIC_DS2P_SpecialAxe4Joseph_Success);
		Joseph_InConspiracy = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_JosephIn);
		B_GivePlayerXP(XP_MIS_DS2P_SpecialAxe4Joseph);
		AI_StopProcessInfos(self);
	};
};