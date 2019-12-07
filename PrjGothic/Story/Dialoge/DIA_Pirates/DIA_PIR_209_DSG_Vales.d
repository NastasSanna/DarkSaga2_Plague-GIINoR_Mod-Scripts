instance DIA_Vales_EXIT(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Vales_EXIT_condition;	
	information = DIA_Vales_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Vales_EXIT_condition(){	return TRUE;};
func void DIA_Vales_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Vales_Start(C_Info)	//Начальный диалог на пристани
{
	npc = PIR_209_DS2P_Vales;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vales_Start_condition;	
	information = DIA_Vales_Start_info;
	important = TRUE;
};
func int DIA_Vales_Start_condition(){	if(Npc_IsInState(self,ZS_Talk)){return TRUE;}; };
func void DIA_Vales_Start_info()
{	
	AI_Output(self,other,"DIA_Vales_Start_13_00");	//У т-тебя отличный ко-о-о-рабль! Д-думаю, Гарду он б-будет по-по душе. (громко смеется)
	AI_Output(other,self,"DIA_Vales_Start_15_00");	//Гарду? А разве ваш капитан не Грег?
	AI_Output(self,other,"DIA_Vales_Start_13_01");	//Грег? Нее, этот з-з-з-азнавшийся выскочка всего лишь п-п-первый помощник. Командует у нас всем Гард!
	AI_Output(self,other,"DIA_Vales_Start_13_02");	//Если тебе уд-д-дастся с ним встретиться, мой тебе совет - не вз-з-з-думай ему д-дерзить, иначе быстро п-п-п-олучишь саблей в б-брюхо!
};
//----
//Появляется после стартового
//----
instance DIA_Vales_WhatIsYourName(C_Info)	//Как тебя зовут?
{
	npc = PIR_209_DS2P_Vales;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Vales_WhatIsYourName_condition;	
	information = DIA_Vales_WhatIsYourName_info;
	description = "Как тебя зовут?";
};
func int DIA_Vales_WhatIsYourName_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_Start)){return TRUE;}; };
func void DIA_Vales_WhatIsYourName_info()
{	
	AI_Output(other,self,"DIA_Vales_WhatIsYourName_15_00");	//Как тебя зовут?
	AI_Output(self,other,"DIA_Vales_WhatIsYourName_13_00");	//М-можешь называть меня Валес. Так все об-бращаются ко мне в к-команде.
	AI_Output(other,self,"DIA_Vales_WhatIsYourName_15_01");	//Это твое не настоящее имя?
	AI_Output(self,other,"DIA_Vales_WhatIsYourName_13_01");	//А я не знаю с-своего н-настоящего имени, так как н-никогда не видел ни отца, ни матери.
	Mdl_StartFaceAni(self,"S_FRIENDLY",1,-1);
	AI_Output(self,other,"DIA_Vales_WhatIsYourName_13_02");	//А это с-слово мне п-понравилось, звучит к-красиво. (улыбается)
};
//----
//Появляется после знакомства
//----
instance DIA_Vales_WhereIsYourCamp(C_Info)	//Где ваш лагерь?
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Vales_WhereIsYourCamp_condition;	
	information = DIA_Vales_WhereIsYourCamp_info;
	description = "Где ваш лагерь?";
};
func int DIA_Vales_WhereIsYourCamp_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_WhereIsYourCamp_info()
{	
	AI_Output(other,self,"DIA_Vales_WhereIsYourCamp_15_00");	//Где ваш лагерь?
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_00");	//З-здесь, неп-п-подалеку, на холме. Мы з-заняли местную д-деревню фермеров, т-теперь наш лагерь там.
	AI_Output(other,self,"DIA_Vales_WhereIsYourCamp_15_01");	//И как местные жители к этому отнеслись? Не думаю, что они были очень рады таким гостям.
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_01");	//К-к-кто их спрашивал? (громко смеется) 
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_02");	//Мы п-п-пришли и взяли то, что на-а-ам нужно. Т-теперь к-крестьяне раб-ботают на нас, а мы п-позволяем им жить. (смеется)
	AI_Output(other,self,"DIA_Vales_WhereIsYourCamp_15_02");	//И крестьяне это терпят? Почему не подняли бунт?
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_03");	//Эти т-трусы? Ха!
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_04");	//Да они к-кроме мотыги в жизни н-н-ничего не держали! Мы п-перережем их как куриц!
	AI_Output(self,other,"DIA_Vales_WhereIsYourCamp_13_05");	//П-правда, ч-ч-асть из них п-п-прячется в лесах. И д-даже один раз п-пытались нап-п-пасть, но мы б-быстро об-б-бъяснили, кто з-з-з-здесь хозяева!
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Villagers);
};
//----
//Появляется после знакомства
//----
instance DIA_Vales_WhyDoYouStutter(C_Info)	//Почему ты заикаешься?
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Vales_WhyDoYouStutter_condition;	
	information = DIA_Vales_WhyDoYouStutter_info;
	description = "Почему ты заикаешься?";
};
func int DIA_Vales_WhyDoYouStutter_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_WhyDoYouStutter_info()
{	
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_00");	//Почему ты заикаешься?
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_00");	//(недовольно) П-п-потому!
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_01");	//Это все?
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_01");	//А ч-ч-чего еще ты х-хочешь от меня? (недовольно) В д-д-детстве собака н-на-н-апугала!
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_02");	//Ты серьезно?
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_02");	//Ты что, п-п-п-п-пдурак что ли? К-к-конечно нет!
	
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_03");	//Расскажи, что случилось.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_03");	//Что-что... В к-к-о-ости хорошо сыграл. Мне всегда в-в-везло в азартн-ные игры.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_04");	//Ну, вот как-то мы с-с-с парнями р-решили сыграть партийку-д-другую. С-сначала иг-грали на равных, а п-п-потом ф-ф-фортуна опять ул-лыбнулась мне.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_05");	//Ну, я и стал ст-тавить по-круп-пному и брать б-банк один за д-другим. П-парни решили, что я мух-хлюю, но поймать за-за-за руку так и не смогли.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_06");	//В общем, ночью они п-пришли ко мне, когд-да я спал. И не п-просто пришли, а в к-к-костюмах из парусины, все п-перемалеван-ные черной кра-а-аской.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_07");	//Я с-с-спросонья по-о-одумал, что это духи решили з-зааабрать меня... В общем, переп-пугался так, что н-н-начал заикаться.
	
	AI_Output(other,self,"DIA_Vales_WhyDoYouStutter_15_04");	//Говорят, что испуг лечится другим испугом.
	AI_Output(self,other,"DIA_Vales_WhyDoYouStutter_13_08");	//Ма-ало ли чего г-говорят... После тог-го случая я уже нич-чего не боюсь!
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_Start);
};
//----
//Появляется после предыдущего
//----
instance DIA_Vales_WhoMadeJoke(C_Info)	//А ты не помнишь кто из пиратов подшутил над тобой?
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Vales_WhoMadeJoke_condition;	
	information = DIA_Vales_WhoMadeJoke_info;
	description = "А ты не помнишь кто из пиратов подшутил над тобой?";
};
func int DIA_Vales_WhoMadeJoke_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhyDoYouStutter)){return TRUE;}; };
func void DIA_Vales_WhoMadeJoke_info()
{	
	AI_Output(other,self,"DIA_Vales_WhoMadeJoke_15_00");	//А ты не помнишь, кто из пиратов подшутил над тобой?
	AI_Output(self,other,"DIA_Vales_WhoMadeJoke_13_00");	//К-к-конечно, по-омню – это был Джозеф и Зедд.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_Talk2JosephZedd);
};
//----2 ДИАЛОГА:
//Появляется после предыдущего ("А ты не помнишь кто из пиратов подшутил над тобой?")
//----
instance DIA_Vales_Scare(C_Info)	//Напугать.
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Vales_Scare_condition;	
	information = DIA_Vales_Scare_info;
	description = "(Напугать)";
};
func int DIA_Vales_Scare_condition()	{
	if(Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && (MIS_DS2P_Gambler != LOG_SUCCESS))
	{return TRUE;};
};
func void DIA_Vales_Scare_info()
{	
	Info_ClearChoices(DIA_Vales_Scare);
	Info_AddChoice(DIA_Vales_Scare,Dialog_Back,DIA_Vales_Scare_Back);
	Info_AddChoice(DIA_Vales_Scare,"Смотри, спрут! Сейчас он вылезет на берег!",DIA_Vales_Scare_Octopus);
	Info_AddChoice(DIA_Vales_Scare,"Что у тебя с лицом?",DIA_Vales_Scare_Face);
	Info_AddChoice(DIA_Vales_Scare,"Гард идет сюда. И он очень недоволен!",DIA_Vales_Scare_Gard);
	Info_AddChoice(DIA_Vales_Scare,"Бууу!",DIA_Vales_Scare_Buuu);
};
func void DIA_Vales_Scare_Back()
{
	Info_ClearChoices(DIA_Vales_Scare);
};
func void DIA_Vales_Scare_Octopus()
{
	AI_Output(other,self,"DIA_Vales_Scare_Octopus_15_00");	//(напугано) Смотри, спрут! Сейчас он вылезет на берег! Он нас всех сожрет!
	AI_Output(self,other,"DIA_Vales_Scare_Octopus_13_00");	//(равнодушно) И что?
	AI_Output(other,self,"DIA_Vales_Scare_Octopus_15_01");	//Так, ничего...
};
func void DIA_Vales_Scare_Face()
{
	AI_Output(other,self,"DIA_Vales_Scare_Face_15_00");	//Что у тебя с лицом?
	AI_Output(self,other,"DIA_Vales_Scare_Face_13_00");	//А что с ним?
	AI_Output(other,self,"DIA_Vales_Scare_Face_15_01");	//Оно очень бледное! Мне кажется, что на тебе проклятие. Твоя кожа чернеет... Нос, нос, он сейчас отвалится!
	AI_Output(self,other,"DIA_Vales_Scare_Face_13_01");	//Ты в своем уме? Со мной все в порядке. Уб-бирайся!
};
func void DIA_Vales_Scare_Gard()
{
	AI_Output(other,self,"DIA_Vales_Scare_Gard_15_00");	//Гард идет сюда. И он очень недоволен!
	AI_Output(self,other,"DIA_Vales_Scare_Gard_13_00");	//И что? Гард вс-с-сегда чем-то недоволен.
};
func void DIA_Vales_Scare_Buuu()
{
	AI_Output(other,self,"DIA_Vales_Scare_Buuu_15_00");	//(неожиданно) Бууу!
	AI_Output(self,other,"DIA_Vales_Scare_Buuu_13_00");	//Еще раз та-ак сделаешь, по-о-олучишь по роже!
	Info_ClearChoices(DIA_Vales_Scare);
	AI_StopProcessInfos(self);
};
//----
//Появляется после предыдущего ("А ты не помнишь кто из пиратов подшутил над тобой?")
//----
instance DIA_Vales_PlaySomeDominoes(C_Info)	//С-ссыграем в к-к-костяшки!
{
	npc = PIR_209_DS2P_Vales;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Vales_PlaySomeDominoes_condition;	
	information = DIA_Vales_PlaySomeDominoes_info;
	description = "С-ссыграем в к-к-костяшки!";
};
func int DIA_Vales_PlaySomeDominoes_condition()	{
	if(Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && (MIS_DS2P_Gambler != LOG_SUCCESS))
	{return TRUE;};
};
func void DIA_Vales_PlaySomeDominoes_info()
{	
	AI_Output(other,self,"DIA_Vales_PlaySomeDominoes_15_00");	//С-ссыграем в к-к-костяшки!
	AI_Output(self,other,"DIA_Vales_PlaySomeDominoes_13_00");	//Ты что, р-р-решил поиздеваться н-н-надо мной? Убирайся!
	AI_StopProcessInfos(self);
};
//----
//Появляется после предыдущего ("С-ссыграем в к-к-костяшки!")
//----
instance DIA_Vales_DoUKnowWhereGregNow(C_Info)	//Н-не знаешь, г-где с-с-сейчас Грег?
{
	npc = PIR_209_DS2P_Vales;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Vales_DoUKnowWhereGregNow_condition;	
	information = DIA_Vales_DoUKnowWhereGregNow_info;
	description = "Н-не знаешь, г-где с-с-сейчас Грег?";
};
func int DIA_Vales_DoUKnowWhereGregNow_condition()	{
	if(Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && (MIS_DS2P_Gambler != LOG_SUCCESS))
	{return TRUE;};
};
func void DIA_Vales_DoUKnowWhereGregNow_info()
{	
	AI_Output(other,self,"DIA_Vales_DoUKnowWhereGregNow_15_00");	//Н-не знаешь, г-где с-с-сейчас Грег?
	AI_Output(self,other,"DIA_Vales_DoUKnowWhereGregNow_13_00");	//Еще од-дно слово, и я т-т-тебе голову отк-к-кручу!
	AI_StopProcessInfos(self);
};
//----
//Появляется после предыдущего ("Н-незнаешь, г-где с-с-сейчас Грег?")
//----
instance DIA_Vales_GreatWeatherToday(C_Info)	//От-т-тличная погооода с-сегодня!
{
	npc = PIR_209_DS2P_Vales;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Vales_GreatWeatherToday_condition;	
	information = DIA_Vales_GreatWeatherToday_info;
	description = "От-т-тличная погооода с-сегодня!";
};
func int DIA_Vales_GreatWeatherToday_condition()	{
	if(Npc_KnowsInfo(other,DIA_Vales_WhoMadeJoke) && (MIS_DS2P_Gambler != LOG_SUCCESS))
	{return TRUE;};
};
func void DIA_Vales_GreatWeatherToday_info()
{	
	AI_Output(other,self,"DIA_Vales_GreatWeatherToday_15_00");	//От-т-тличная погооода с-сегодня!
	AI_Output(self,other,"DIA_Vales_GreatWeatherToday_13_00");	//Ну все, ты сам нап-п-просился!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

//----
//Появляется после знакомства
//----
instance DIA_Vales_WhatAreUdoingOnIsland(C_Info)	//Что вы делаете на острове?
{
	npc = PIR_209_DS2P_Vales;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Vales_WhatAreUdoingOnIsland_condition;	
	information = DIA_Vales_WhatAreUdoingOnIsland_info;
	description = "Что вы делаете на острове?";
};
func int DIA_Vales_WhatAreUdoingOnIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_WhatAreUdoingOnIsland_info()
{
	if (MIS_DS2P_Gambler != LOG_SUCCESS)	{	// с заиканием
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_00");	//Что вы делаете на острове?
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_00");	//Мы п-плыли с очередного рейда, когда на г-г-горизонте п-появилась орочья га-а-лера!
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_01");	//Гард, наш ка-а-питан, приказал не вс-с-ступать в бой. Мы подняли все п-п-паруса и пошли в с-с-торону мыса, неп-п-одалеку отсюда. 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_02");	//Но орки ок-казались хитрее. Они з-з-нали, что мы будем отс-с-ступать, и приг-готовили ловушку. За мысом нас уже ждали еще две г-ггалеры.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_03");	//Бой был с-с-коротечный, наша посудина п-п-получила пробоины. Единственное, что нам ос-с-ставалось, дотянуть д-д-до этого острова и ук-к-к-рыться в лесах.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_04");	//Орки не стали высаживаться и нам уд-д-далось уцелеть. 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_05");	//Затем мы нашли д-д-деревушку, где поставили всех на ножи.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_06");	//Т-теперь нам н-нужен новый корабль, чтобы вернуться в наш лагерь, на острове н-н-неподалеку.
	
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_01");	//Боюсь тебя огорчить, вашего лагеря больше нет, как и почти всего острова.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_07");	//О чем ты г-г-говоришь?
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_02");	//На острове произошёл магический взрыв, и, насколько я знаю, выжил только один человек.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_08");	//Нужно немм-м-едленно рассказать об этом Гарду!
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_03");	//Так чего ты ждешь? 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_09");	//Я д-д-должен охранять корабль! А вот тебе ничего не мешает это сделать!
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_04");	//Я подумаю об этом.
	}
	else	{//без заикания
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_00");	//Что вы делаете на острове?
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_00a");	//Мы плыли с очередного рейда, когда на горизонте появилась орочья гаера!
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_01a");	//Гард, наш капитан, приказал не вступать в бой. Мы подняли все паруса и пошли в сторону мыса, неподалеку отсюда. 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_02a");	//Но орки оказались хитрее. Они знали, что мы будем отступать, и приготовили ловушку. За мысом нас уже ждали еще две галеры.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_03a");	//Бой был скоротечный, наша посудина получила пробоины. Единственное, что нам оставалось, дотянуть до этого острова и укрыться в лесах.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_04a");	//Орки не стали высаживаться и нам удалось уцелеть. 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_05a");	//Затем мы нашли деревушку, где поставили всех на ножи.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_06a");	//Теперь нам нужен новый корабль, чтобы вернуться в наш лагерь, на острове неподалеку.
	
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_01");	//Боюсь тебя огорчить, вашего лагеря больше нет, как и почти всего острова.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_07a");	//О чем ты говоришь?
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_02");	//На острове произошёл магический взрыв, и, насколько я знаю, выжил только один человек.
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_08a");	//Нужно немедленно рассказать об этом Гарду!
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_03");	//Так чего ты ждешь? 
	AI_Output(self,other,"DIA_Vales_WhatAreUdoingOnIsland_13_09a");	//Я должен охранять корабль! А вот тебе ничего не мешает это сделать!
		AI_Output(other,self,"DIA_Vales_WhatAreUdoingOnIsland_15_04");	//Я подумаю об этом.
	};
};
//----
//Появляется после знакомства
//----
instance DIA_Vales_HowDidUBecomePirate(C_Info)	//Как ты стал пиратом?
{
	npc = PIR_209_DS2P_Vales;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Vales_HowDidUBecomePirate_condition;	
	information = DIA_Vales_HowDidUBecomePirate_info;
	description = "Как ты стал пиратом?";
};
func int DIA_Vales_HowDidUBecomePirate_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_HowDidUBecomePirate_info()
{	
		AI_Output(other,self,"DIA_Vales_HowDidUBecomePirate_15_00");	//Как ты стал пиратом?
	if (MIS_DS2P_Gambler != LOG_SUCCESS)	{	// с заиканием
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_00");	//Как-как?! Как и многие...
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_01");	//Мать ум-м-ерла, отца ник-к-огда в жизни не видел. Все д-детство провел либо в попрошайках, либо п-промышляя мелким воровством.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_02");	//Как подрос, н-н-нанялся юнгой на торговое судно. Работа т-тяжелая, а платили сущие г-гроши.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_03");	//В одном из п-походов с караваном на нас нап-п-пали пираты. Потом аб-б-бордаж, пол команды вырезали, остальным п-предложили пополнить ряды д-джентльменов удачи.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_04");	//Я свой выбор сделал сразу, ост-т-тальные, кто сомневался, д-давно уже украшают своими к-костями морское дно.
	}
	else	{//без заикания
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_00a");	//Как-как?! Как и многие...
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_01a");	//Мать умерла, отца никогда в жизни не видел. Все детство провел либо в попрошайках, либо промышляя мелким воровством.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_02a");	//Как подрос, нанялся юнгой на торговое судно. Работа тяжелая, а платили сущие гроши.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_03a");	//В одном из походов с караваном на нас напали пираты. Потом абордаж, пол команды вырезали, остальным предложили пополнить ряды джентльменов удачи.
	AI_Output(self,other,"DIA_Vales_HowDidUBecomePirate_13_04a");	//Я свой выбор сделал сразу, остальные, кто сомневался, давно уже украшают своими костями морское дно.
	};
};
//----
//Появляется после знакомства
//----
instance DIA_Vales_WhatAreYourResponsibilities(C_Info)	//Какие твои обязанности в команде?
{
	npc = PIR_209_DS2P_Vales;
	nr = 12;
	permanent = FALSE;
	condition = DIA_Vales_WhatAreYourResponsibilities_condition;	
	information = DIA_Vales_WhatAreYourResponsibilities_info;
	description = "Какие у тебя обязанности в команде?";
};
func int DIA_Vales_WhatAreYourResponsibilities_condition(){	if(Npc_KnowsInfo(other,DIA_Vales_WhatIsYourName)){return TRUE;}; };
func void DIA_Vales_WhatAreYourResponsibilities_info()
{	
		AI_Output(other,self,"DIA_Vales_WhatAreYourResponsibilities_15_00");	//Какие у тебя обязанности в команде?
	if (MIS_DS2P_Gambler != LOG_SUCCESS)	{	// с заиканием
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_00");	//Я рубака, аб-б-б-ордажник. Когда д-дело доходит до захвата с-судна, лучше нас, аб-б-бордажной к-к-команды, никто не сможет с-справиться!
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_01");	//(задумчиво) В этот м-м-момент нет времени на размышления, есть т-только ты и твои враги.
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_02");	//Все п-просто и п-понятно – бей, круши, либо ты, либо т-тебя! В такие м-моменты по-настоящему п-понимаешь, что такое жизнь!	
		AI_Output(other,self,"DIA_Vales_WhatAreYourResponsibilities_15_01");	//А ты романтик...
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_03");	//Т-т-только никому из п-п-парней не г-г-говори об этом. (громко смеется)
	}
	else	{//без заикания
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_00a");	//Я рубака, абордажник. Когда дело доходит до захвата судна, лучше нас, абордажной команды, никто не сможет справиться!
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_01a");	//(задумчиво) В этот момент нет времени на размышления, есть только ты и твои враги.
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_02a");	//Все просто и понятно – бей, круши, либо ты, либо тебя! В такие моменты по-настоящему понимаешь, что такое жизнь!	
		AI_Output(other,self,"DIA_Vales_WhatAreYourResponsibilities_15_01");	//А ты романтик...
	AI_Output(self,other,"DIA_Vales_WhatAreYourResponsibilities_13_03a");	//Только никому из парней не говори об этом. (громко смеется)
	};
};


//NS - 03/07/2013 =======================
//  По квесту "Азартный игрок"
//=======================================

//----------------------------
// Предложить сыграть, если есть карты, с 0 до 3 ночи		nr=6
instance DIA_Vales_LetsPlay(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	condition = DIA_Vales_LetsPlay_condition;	
	information = DIA_Vales_LetsPlay_info;
	description = "Давай сыграем в карты.";
};
func int DIA_Vales_LetsPlay_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_GotClothes) && Npc_HasItems(other,ITMI_DS2P_Shulers_Colode)
		&& Wld_Istime(0,0,3,0))
	{	return TRUE;};
};
func void DIA_Vales_LetsPlay_info()
{
	var C_NPC Zedd;		Zedd = Hlp_GetNpc(PIR_203_DS2P_Zedd);
	var C_NPC Joseph;	Joseph = Hlp_GetNpc(PIR_205_DS2P_Joseph);
	var C_NPC Vales;	Vales = Hlp_GetNpc(PIR_209_DS2P_Vales);

	AI_Output(other,self,"DIA_Vales_LetsPlay_15_00");	//Давай сыграем в карты.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_01");	//Я не о-очень люблю аз-а-артные игры после т-т-того случая, о к-к-котором я тебе рас-с-сказывал.
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_02");	//Да ладно тебе. Сыграем пару партий и все. Я тут подзаработал немного золота. Вот хочу испытать удачу.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_03");	//Хм... Ладно, пару партий можно.

	//Валес должен стоять всегда возле бочки и двух стульев, рядом горит факел
	//UNFINISHED если надо, телепортнуться к бочке
	AI_GotoWP(self, "");
	AI_GotoWP(other, "");
	//В диалоге Валес и ГГ садятся, карты из инвентаря ГГ помещаются на бочку
	B_StopLookAt(self);	B_StopLookAt(other);
	AI_UseMob(self,"CHAIR",1);	AI_UseMob(other,"CHAIR",1);
	Npc_RemoveInvItem(other,ITMI_DS2P_Shulers_Colode);
	// UNFINISHED разместить карты на бочке
	AI_LookAtNpc(self,other);	AI_LookAtNpc(other,self);

		AI_Output(self,other,"DIA_Vales_LetsPlay_13_04");	//А о-очко?
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_05");	//Да, сдавай.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_06");	//Давно не д-д-держал в руках ка-а-а-ртишки. Ты с-сейчас меня в д-д-два счета обы-ы-ыграешь. (смеется)
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_07");	//С-ставки по пятьдесят м-м-монет. Согласен?
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_08");	//Да, согласен. 
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_09");	//Д-держи карту.
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_10");	//Еще. Ага, еще карту. Хватит.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_11");	//Так, так... П-п-перебор. Твоя взя-яла. Д-держи карту.
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_12");	//Еще, еще... Хватит.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_13");	//Та-ак, еще одну. Очко, я вы-ыиграл!
	// UNFINISHED Слышим какой-то жуткий вой
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_14");	//Это еще чт-о-о-о т-т-такое? Ты с-с-с-слышал?
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_15");	//Да. Аж мурашки по коже. Словно демон из преисподней.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_16");	//С-с-скорее всего, во-о-олки... Ладно, д-держи к-карту.
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_17");	//Так, еще, еще... Перебор.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_18");	//Извини, но я оп-я-яять выиграл.
	// UNFINISHED Факел гаснет от порыва ветра
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_19");	//Это ты сделал? (про себя) Так вот для чего нужны были кузнечные меха.
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_20");	//Ты что-о-о, как бы я с-ссмог? Что-то м-м-мне не по с-с-себе. Ты нич-ч-его не чу-у-увствуешь?
	// UNFINISHED Опять слышим вой, еще более жуткий
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_21");	//(трясется) Р-а-ааздери тебя Белиар! Что п-п-ппроисходит?
	AI_Output(other,self,"DIA_Vales_LetsPlay_15_22");	//Я что-то вижу... Смотри, призраки...

	//Спаним Джозефа и Зедда в костюмах
	// UNFINISHED вписать WP
	CreateInvItem(Zedd,ITAR_DS2P_GHOST);	AI_EquipArmor(Zedd,ITAR_DS2P_GHOST);		AI_UnequipWeapons(Zedd);
	CreateInvItem(Joseph,ITAR_DS2P_GHOST);	AI_EquipArmor(Joseph,ITAR_DS2P_GHOST);	AI_UnequipWeapons(Joseph);
	B_StartOtherRoutine(Zedd,"SCAREVALES");	B_StartOtherRoutine(Joseph,"SCAREVALES");
	AI_Teleport(Zedd,"");					AI_Teleport(Joseph,"");
	AI_GotoNpc(Zedd,hero);					AI_GotoNpc(Joseph,hero);
	
	//Подключаем Зедда
	TRIA_Invite(Zedd);
	TRIA_Start();

	TRIA_Next(Zedd);
			AI_Output(self,other,"DIA_Vales_LetsPlay_13_23_Zedd");	//Я пришел за твоей мерзкой душонкой, ничтожество! Теперь ты ответишь за все свои прегрешения! Ха-ха-ха!

	TRIA_Next(Vales);
		AI_Output(self,other,"DIA_Vales_LetsPlay_13_24");	//(истерично кричит) А-а-а-а, уходи проклятый! Прочь от меня! Именем Инноса заклинаю! Гори в пекле огненном! Прочь! Прочь! А-а-а-а!!!!!
	//Валес начинает носиться
	B_StartOtherRoutine(Zedd,"SCARED");

	DIAG_Reset();
	TRIA_Finish();
	AI_StopProcessInfos(self);
};

//----------------------------
// Вылечился от заикания, сам обращается к ГГ		nr=6
instance DIA_Vales_AfterLetsPlay(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 6;
	condition = DIA_Vales_AfterLetsPlay_condition;	
	information = DIA_Vales_AfterLetsPlay_info;
	important = TRUE;
};
func int DIA_Vales_AfterLetsPlay_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_AfterScaredVales))
	{	return TRUE;};
};
func void DIA_Vales_AfterLetsPlay_info()
{
	var int x;
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_00");	//Как ты мог так поступить со мной?
	//(+опыт)
	B_GivePlayerXP(XP_MIS_Gambler_Success);
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_01");	//Я помог тебе излечиться от заикания. Разве этого мало?
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_02");	//Но не таким же способом! Я чуть с катушек не съехал!
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_03");	//Извини, но другого способа я не знаю.
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_04");	//Ладно, ладно. В общем, спасибо тебе!
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_05");	//Это все? 
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_06");	//Ну да, а что ты еще хотел? Я же не просил тебя помогать. Ты сам вызвался.
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_07");	//Ты прав. Тогда я пойду, поболтаю с парнями, чтобы они тоже посмеялись.
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_08");	//Э-э-э... Стой! Ладно, эти пропойцы – чего только по пьяни им не придумается, но тебе-то парни точно поверят.
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_09");	//Давай так: я дам тебе сто монет, и все забудем.
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_10");	//Не-е, история стоит намного дороже!
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_11");	//Ладно, ладно. Четыреста монет.
	AI_Output(other,self,"DIA_Vales_AfterLetsPlay_15_12");	//Еще чуть подороже.
		AI_Output(self,other,"DIA_Vales_AfterLetsPlay_13_13");	//Ну, ты и наглец. Четыреста пятьдесят монет и кольцо. Договорились? Да, точно, договорились!
	//Дает 450 золотых и кольцо «Крепость духа»
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_Gold,450);
		B_GiveInvItems(self,other,ItRi_DS2P_Fortitude,1);
	};
	Vales_IsHeal = TRUE;
	//Запись в дневнике "Азартный игрок" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Gambler_Success);
};

// Активируется, если взят квест "Заговор"
// nr = 1

instance DIA_Vales_HaveADeal(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 1;
	condition = DIA_Vales_HaveADeal_condition;	
	information = DIA_Vales_HaveADeal_info;
	permanent = FALSE;
	description = "Есть дело.";
};

func int DIA_Vales_HaveADeal_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && C_DIA_Greg_OurIdea_Know_AboutVales)
	{	
		return TRUE;
	};
};

func void DIA_Vales_HaveADeal_info()
{
	if (Vales_IsHeal == TRUE) // Если Валес вылечился от заикания
	{
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_00");	//Есть дело.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_01");	//Твое дело может подождать. У меня есть к тебе просьба.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_02");	//Какая?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_03");	//В общем, дело такое: я хочу завязать с пиратством, после стольких лет имею право. Только есть одно маленькое «но».
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_04");	//Какое?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_05");	//Гард. В последнее время мы слишком многих потеряли, и он меня вряд ли отпустит по доброй воле.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_06");	//А от меня ты что хочешь?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_07");	//Ты можешь с ним поговорить? Выполнить пару его поручений, оказать ему несколько услуг, заплатить, наконец. Только чтобы он отпустил меня.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_08");	//А сам почему не попросишь?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_09");	//Боюсь я, честно говоря, его. Прибьет еще меня в порыве гнева.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_10");	//А меня, значит, не прибьет? Ну-ну.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_11");	//Ты ему нужен. Если ты не избавишься от чумы на своем корабле, то мы все так и останемся на этом проклятущем клочке суши. Наверное.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_12");	//Звучит не слишком оптимистично. У меня есть к тебе другое предложение, сулящее выгоду и тебе, и мне. Причем риск минимален.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_13");	//Слушаю.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_14");	//Грег хочет устроить собрание пиратов, чтобы сместить Гарда и занять его место. Ему нужен твой голос. Давай я поговорю с Грегом и, как только закончится голосование, он сразу же отпустит тебя на все четыре стороны. Согласен?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_15");	//Хм, твое предложение и впрямь безопаснее. Но что если Гард наберет больше голосов?
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_16");	//Я позабочусь о том, чтобы их у него было как можно меньше.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_17");	//Тогда, если Грег сразу после голосования, согласится отпустить меня, я проголосую за него.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_18");	//Договорились!
		B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,LOG_MISSION,LOG_Running,TOPIC_DS2P_FromPiratesToPeasants_Start);
		Vales_InConspiracy = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_ValesIn);
		AI_StopProcessInfos(self);
	}
	else // Если Валес не вылечился от заикания
	{
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_00");	//Есть дело.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_19");	//Т-твое д-д-дело м-может по-по-подождать. У-у м-меня есть к тт-ебе п-просьба.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_02");	//Какая?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_20");	//В-в общем, д-дело такое: я-я-я х-хочу завязать с-с пир-р-ратством, п-п-после стольких лет и-и-имею право. Т-только есть одно м-м-маленькое «но».
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_04");	//Какое?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_21");	//Г-гард. В-в последнее время м-мы с-слишком многих п-п-потеряли, и он м-меня вряд ли о-о-отпустит п-по доброй в-воле.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_06");	//А от меня ты что хочешь?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_22");	//Т-ты можешь с-с ним п-п-поговорить? В-в-в-выполнить п-пару его поручений, о-о-оказать ему н-н-несколько у-у-услуг, з-з-заплатить, наконец. Т-т-только чтобы о-он от-т-тпустил меня.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_08");	//А сам почему не попросишь?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_23");	//Б-б-боюсь я-я-а, ч-ч-честно говоря, е-его. П-п-п-прибьет еще меня в-в-в порыве г-г-гнева.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_10");	//А меня, значит, не прибьет? Ну-ну.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_24");	//Т-ты ему н-н-нужен. Если т-т-ты не из-з-збавишься о-о-от чумы на с-своем корабле, т-т-то мы все т-т-так и-и-и останемся н-н-на этом п-п-проклятущем к-к-клочке с-с-суши. Наверное.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_12");	//Звучит не слишком оптимистично. У меня есть к тебе другое предложение, сулящее выгоду и тебе, и мне. Причем риск минимален.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_25");	//С-с-лушаю.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_14");	//Грег хочет устроить собрание пиратов, чтобы сместить Гарда и занять его место. Ему нужен твой голос. Давай я поговорю с Грегом и, как только закончится голосование, он сразу же отпустит тебя на все четыре стороны. Согласен?
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_26");	//Т-т-твое п-предложение и-и-и впрямь б-б-безопаснее. Н-н-но что если Г-г-гард наберет б-б-больше г-г-голосов?
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_16");	//Я позабочусь о том, чтобы их у него было как можно меньше.
		AI_Output(self,other,"DIA_Vales_HaveADeal_13_27");	//Т-т-тогда, е-е-если Г-грег сразу п-п-после г-г-голосов-вания, с-согласится о-о-о-отпустить м-м-меня, я-я-а проголосую з-з-за него.
		AI_Output(other,self,"DIA_Vales_HaveADeal_15_18");	//Договорились!
		B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,LOG_MISSION,LOG_Running,TOPIC_DS2P_FromPiratesToPeasants_Start);
		Vales_InConspiracy = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_ValesIn);
		AI_StopProcessInfos(self);
	};
};

// Активируется, если выполнен квест "Заговор" и Гард мертв
// nr = 1

instance DIA_Vales_AfterConspiracy(C_Info)
{
	npc = PIR_209_DS2P_Vales;
	nr = 1;
	condition = DIA_Vales_AfterConspiracy_condition;	
	information = DIA_Vales_AfterConspiracy_info;
	permanent = FALSE;
	important = TRUE;
	description = " ";
};

func int DIA_Vales_AfterConspiracy_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Success) && (Conspiracy_IsStarted == TRUE))
	{	
		return TRUE;
	};
};

func void DIA_Vales_AfterConspiracy_info()
{
	TRIA_Start();
	TRIA_Invite(Greg);
	TRIA_Invite(Vales);
	if (Vales_IsHeal == TRUE) // Вылечился ли Валес от заикания
	{
		AI_GotoNpc(Greg,self);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_13_00");	//Итак, все прошло. Я выполнил свою часть уговора.
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_11_01");	//И я выполню свою. Ты волен покинуть команду и валить на все четыре стороны, куда пожелаешь.
		TRIA_Next(Vales);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_13_02");	//Спасибо. Удачи в дальнейшем, капитан.
	}
	else
	{
		AI_GotoNpc(Greg,self);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_13_00");	//Я-я-я в-вып-п-полнил с-с-свою ч-ч-часть у-уговора. Т-т-теперь в-в-аша о-оч-черед.
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_11_01");	//И я выполню свою. Ты волен покинуть команду и валить на все четыре стороны, куда пожелаешь.
		TRIA_Next(Vales);
		AI_Output(self,other,"DIA_Vales_AfterConspiracy_13_02");	//С-с-спасибо. У-удачи, к-к-кап-п-питан!
	};
	B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,Log_Mission,Log_Success,TOPIC_DS2P_FromPiratesToPeasants_Success);
	DIAG_Reset();
	TRIA_Finish();
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};