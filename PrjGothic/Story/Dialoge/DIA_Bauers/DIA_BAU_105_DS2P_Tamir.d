instance DIA_Tamir_EXIT(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Tamir_EXIT_condition;	
	information = DIA_Tamir_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Tamir_EXIT_condition(){	return TRUE;};
func void DIA_Tamir_EXIT_info(){	AI_StopProcessInfos(self);};
//**--СТАРТОВЫЙ ДИАЛОГ----***//
instance DIA_Tamir_Start(C_Info)	//Начальный диалог
{
	npc = BAU_105_DS2P_Tamir;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Tamir_Start_condition;	
	information = DIA_Tamir_Start_info;
	description = "Привет! Кто ты?";
};
func int DIA_Tamir_Start_condition(){	return TRUE;};
func void DIA_Tamir_Start_info()
{
	AI_Output(other,self,"DIA_Tamir_Start_15_00");	//Привет! Кто ты?
	AI_Output(self,other,"DIA_Tamir_Start_12_00");	//(агрессивно) Чего тебе? Не лезь ко мне, пиратская сволочь, а то я плюну на все договоренности и выпущу тебе кишки!
	AI_PlayAni(self,"T_IGETYOU");
	AI_Output(other,self,"DIA_Tamir_Start_15_01");	//Успокойся, я не пират.
	AI_Output(self,other,"DIA_Tamir_Start_12_01");	//(удивленно) А кто тогда?
	AI_Output(self,other,"DIA_Tamir_Start_12_02");	//Насколько я знаю, на острове кроме нас, пиратов и гоблинов никого нет. Или ты с неба упал?
	AI_PlayAni(self,"T_LAUGH_01");
	AI_Output(other,self,"DIA_Tamir_Start_15_02");	//Зачем с неба? Я со своими друзьями недавно приплыл на корабле. Он стоит на пристани.
	AI_Output(other,self,"DIA_Tamir_Start_15_03");	//Если не веришь, можешь сам сходить и посмотреть.
	AI_Output(self,other,"DIA_Tamir_Start_12_03");	//На корабле? О! Это же великолепно! Значит, пираты со дня на день уберутся отсюда!
	AI_Output(other,self,"DIA_Tamir_Start_15_04");	//Ты думаешь, я так просто отдам им корабль?
	AI_Output(self,other,"DIA_Tamir_Start_12_04");	//Ха! А кто тебя спрашивать будет? Вон их сколько, а ты один, ну еще твоя команда.
	AI_Output(self,other,"DIA_Tamir_Start_12_05");	//Не думаю, что вы справитесь с целой абордажной командой.
	AI_Output(other,self,"DIA_Tamir_Start_15_05");	//Не все так просто. На корабле чума, почти вся команда в коме. Теперь этот корабль больше напоминает призрака.
	AI_Output(other,self,"DIA_Tamir_Start_15_06");	//Как раз поэтому я прибыл на остров. Мне нужна помощь целителя.
	AI_Output(self,other,"DIA_Tamir_Start_12_06");	//(погрустнев) Ааа... Тогда тебе нужно идти к Цимму. Он у нас местный знахарь и алхимик.
};
//----
//Появляется после стартового
//----
instance DIA_Tamir_WhatIsYourName(C_Info)	//Как тебя зовут?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Tamir_WhatIsYourName_condition;	
	information = DIA_Tamir_WhatIsYourName_info;
	description = "Как тебя зовут?";
};
func int DIA_Tamir_WhatIsYourName_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_Start)){	return TRUE;};	};
func void DIA_Tamir_WhatIsYourName_info()
{
	AI_Output(other,self,"DIA_Tamir_WhatIsYourName_15_00");	//Как тебя зовут?
	AI_Output(self,other,"DIA_Tamir_WhatIsYourName_12_00");	//Меня зовут Тамир. Я охотник, один из лучших мастеров лука на этом острове.
	AI_Output(self,other,"DIA_Tamir_WhatIsYourName_12_01");	//Также я хорошо умею разделывать животных, добывая из них разные полезные трофеи. 
	AI_Output(self,other,"DIA_Tamir_WhatIsYourName_12_02");	//Если тебе нужен хороший учитель в этом ремесле, то ты обратился по адресу.
};
//----------------------
//Появляется после предыдущего ("Как тебя зовут?")
//----------------------
instance DIA_Tamir_TellMeAboutPeasants(C_Info)	//Расскажи мне о тех, кто живет в деревне.
{
	npc = BAU_105_DS2P_Tamir;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Tamir_TellMeAboutPeasants_condition;	
	information = DIA_Tamir_TellMeAboutPeasants_info;
	description = "Расскажи мне о тех, кто живет в деревне.";
};
func int DIA_Tamir_TellMeAboutPeasants_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_TellMeAboutPeasants_info()
{
	AI_Output(other,self,"DIA_Tamir_TellMeAboutPeasants_15_00");	//Расскажи мне о тех, кто живет в деревне.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_00");	//Деревня у нас небольшая, чуть больше десятка человек.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_01");	//Староста у нас – Кадар. Мы выбрали его очень давно на совете деревни. Он очень умный и надежный человек и никогда не откажет в помощи.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_02");	//Цимм – наш алхимик, который может вылечить практически любую хворь.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_03");	//Еще есть кузнец Густав, но сейчас его нет в деревне. Когда напали пираты, он в одиночку уложил нескольких пиратов, но был ранен.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_04");	//Думаю, он сейчас скрывается в лесу вместе с Томом, Джином и Фартом. Они – тоже охотники, как и я.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_05");	//Мария, жена Густава, у нас знатная повариха, и обычно она готовит в таверне для охотников.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_06");	//Есть еще Барок – скотовод, и Хуно – пахарь. 
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_07");	//Ну и, конечно же, наш сумасшедший Дил. Он ходит по деревне и несет всякую чушь. Бывает, забавно его послушать.
	AI_Output(other,self,"DIA_Tamir_TellMeAboutPeasants_15_01");	//А кроме Марии женщины у вас есть?
	if(Npc_IsDead(BAU_112_DS2P_Kara))
	{
		AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_08");	//(смеется) Конечно. Лулу - жена Тома, Виола - жена Джина.
	}
	else
	{
		AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_09");	//(смеется) Конечно. Лулу - жена Тома, Виола - жена Джина, а также Кара - жена Кадара.
	};
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_10");	//Обычно они работают в поле, но теперь пираты держат их в пещере неподалеку от деревни.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_11");	//Есть еще Никки, но не советую с ней связываться. У нее просто невыносимый характер, поэтому она живет одна, и за глаза все в деревне называют ее старой девой.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_12");	//Да, я совсем забыл о Нареве. Он – самый старый человек в деревне, но я давно не видел его. Наверное, он тоже сидит в пещере вместе с женщинами.
	AI_Output(self,other,"DIA_Tamir_TellMeAboutPeasants_12_13");	//Какой пиратам прок от старика?!
};
//----------------------
//Появляется после предыдущего ("Как тебя зовут?")
//----------------------
instance DIA_Tamir_DoUHaveMapOfIsland(C_Info)	//У тебя есть карта острова?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 9;
	permanent = FALSE;
	condition = DIA_Tamir_DoUHaveMapOfIsland_condition;	
	information = DIA_Tamir_DoUHaveMapOfIsland_info;
	description = "У тебя есть карта острова?";
};
func int DIA_Tamir_DoUHaveMapOfIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_DoUHaveMapOfIsland_info()
{
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_00");	//У тебя есть карта острова?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_00");	//С картами у нас очень туго, да и ни к чему они. Мы, охотники, знаем лес как свои пять пальцев, а остальным она не нужна, так как они почти не покидают окрестности деревни.
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_01");	//То есть у вас нет ни одной карты?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_01");	//(улыбается)  Этого я не говорил.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_02");	//Один экземпляр у меня остался. Его нарисовал мой друг, Жанн, упокой Иннос его душу.
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_02");	//Он погиб?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_03");	//Да, его затоптал тролль. В этом есть и моя вина.
	
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_03");	//Как это случилось?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_04");	//Мы были молодые и самоуверенные, постоянно с ним спорили, кто лучший охотник.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_05");	//Иногда удача была на его стороне, иногда – на моей.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_06");	//В конце концов, мы решили, что лучшим испытанием будет охота на тролля, но не простого, а черного.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_07");	//В доказательство нужно было принести его шкуру. Это была плохая идея.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_08");	//Я тогда решил схитрить и стащил шкуру у отца, который совсем недавно вернулся с охоты.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_09");	//Она была, конечно, не черного тролля, поэтому я перекрасил мех. Жанн на свою беду не заметил подвоха и решил, что тоже справится.	
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_04");	//Тролль оказался сильнее?
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_10");	//(грустно) Да, куски Жанна нашли в разных частях долины, где обитал тролль.
	AI_Output(other,self,"DIA_Tamir_DoUHaveMapOfIsland_15_05");	//Мне очень жаль.
	AI_Output(self,other,"DIA_Tamir_DoUHaveMapOfIsland_12_11");	//Мне тоже. Но ничего с этим не поделаешь.
};
//---------------------
//Появляется после предыдущего ("У тебя есть карта острова?")
//---------------------
instance DIA_Tamir_HowMuchMoneyForMap(C_Info)	//Сколько ты хочешь за карту острова?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 90;
	permanent = FALSE;
	condition = DIA_Tamir_HowMuchMoneyForMap_condition;	
	information = DIA_Tamir_HowMuchMoneyForMap_info;
	description = "Сколько ты хочешь за карту острова?";
};
func int DIA_Tamir_HowMuchMoneyForMap_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_DoUHaveMapOfIsland)){	return TRUE;};	};
func void DIA_Tamir_HowMuchMoneyForMap_info()
{
	AI_Output(other,self,"DIA_Tamir_HowMuchMoneyForMap_15_00");	//Сколько ты хочешь за карту острова?
	AI_Output(self,other,"DIA_Tamir_HowMuchMoneyForMap_12_00");	//Я думаю, Жанн бы хотел, чтобы его труды не пылились в моем сундуке, а приносили пользу людям.
	AI_Output(self,other,"DIA_Tamir_HowMuchMoneyForMap_12_01");	//Поэтому я не возьму с тебя золото за нее. Я отметил место, где обитает черный тролль.
	AI_Output(self,other,"DIA_Tamir_HowMuchMoneyForMap_12_02");	//Надеюсь, ты не повторишь ошибок моего друга.
	B_GiveInvItems(self,other,ItWr_DS2P_Map_Tamir,1);
};
//----
//Появляется после предыдущего ("Сколько ты хочешь за карту острова?")
//----
const int XP_DIA_Tamir_BlackTrollIsDead = 0;
instance DIA_Tamir_BlackTrollIsDead(C_Info)	//Черный тролль мертв!
{
	npc = BAU_105_DS2P_Tamir;
	nr = 900;
	permanent = FALSE;
	condition = DIA_Tamir_BlackTrollIsDead_condition;	
	information = DIA_Tamir_BlackTrollIsDead_info;
	description = "Черный тролль мертв!";
};
func int DIA_Tamir_BlackTrollIsDead_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Tamir_HowMuchMoneyForMap) && (Npc_HasItems(other,ItAt_TrollBlackFur) || Npc_HasItems(other,ItAt_DS_TrollBlackFur_H)))
	{	return TRUE;};	
};
func void DIA_Tamir_BlackTrollIsDead_info()
{
	AI_Output(other,self,"DIA_Tamir_BlackTrollIsDead_15_00");	//Черный тролль мертв!
	B_GivePlayerXP(XP_DIA_Tamir_BlackTrollIsDead);
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_00");	//(удивленно) Ты шутишь?
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(other,self,"DIA_Tamir_BlackTrollIsDead_15_01");	//Вот его шкура.
	if(B_GiveInvItem_red(other,self,ItAt_TrollBlackFur,1,34)){}
	else{B_GiveInvItem_red(other,self,ItAt_DS_TrollBlackFur_H,1,34);};
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_01");	//Невероятно. Это действительно шкура черного тролля.
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_02");	//Теперь Жанн отомщен. Пусть это не такое большое утешение для меня, но все же.
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_03");	//Я бы хотел купить у тебя шкуру.
	AI_Output(other,self,"DIA_Tamir_BlackTrollIsDead_15_02");	//Зачем она тебе?
	AI_Output(self,other,"DIA_Tamir_BlackTrollIsDead_12_04");	//Я хочу отнести ее на могилу Жанна.
	AI_Output(other,self,"DIA_Tamir_BlackTrollIsDead_15_03");	//Понимаю.
	B_GiveInvItem_red(self,other,ItMi_Gold,350,37);	
};
//----
//Появляется после предыдущего ("Как тебя зовут?")
//----
instance DIA_Tamir_WhatDoUDoWithSkins(C_Info)	//Что вы делаете со шкурами животных?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Tamir_WhatDoUDoWithSkins_condition;	
	information = DIA_Tamir_WhatDoUDoWithSkins_info;
	description = "Что вы делаете со шкурами животных?";
};
func int DIA_Tamir_WhatDoUDoWithSkins_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_WhatDoUDoWithSkins_info()
{
	AI_Output(other,self,"DIA_Tamir_WhatDoUDoWithSkins_15_00");	//Что вы делаете со шкурами животных?
	AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_00");	//Да много чего. Обрабатываем на дубильном станке, а после – шьем одежду, сапоги, шапки. Также стелим на пол, чтобы было теплее в зимние вечера.
	AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_01");	//Часть шкур измельчается на мелкие полоски, которые используются везде в хозяйстве.
	AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_02");	//А тебе зачем?
	AI_Output(other,self,"DIA_Tamir_WhatDoUDoWithSkins_15_01");	//Если я принесу несколько шкур, где я могу продать их?
	if(Npc_IsDead(BAU_100_DS2P_KADAR))
	{
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_03");	//Теперь, когда Кадар мертв, я даже не знаю, кто будет следить за провиантом и сбором трофеев. Раньше это была его обязанность.
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_04");	//Все вокруг катится к Белиару.
	}
	else
	{
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_05");	//Это тебе нужно идти прямиком к Кадару.
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_06");	//Он, как глава деревни, помимо всего прочего ответственен за весь провиант, хранящийся на складах, а также за сбор добычи охотников в деревне.
		AI_Output(self,other,"DIA_Tamir_WhatDoUDoWithSkins_12_07");	//Не скажу, что он даст тебе за охотничьи трофеи кучу золота, но это лучше, чем ничего. Ведь так?! (улыбается)
	};
};

//----
//Появляется после предыдущего ("Как тебя зовут?")
//----
instance DIA_Tamir_TeachMeTrophiesAnimals(C_Info)	//Научи меня добывать трофеи с животных.	nr = 14;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 14;
	permanent = FALSE;
	condition = DIA_Tamir_TeachMeTrophiesAnimals_condition;	
	information = DIA_Tamir_TeachMeTrophiesAnimals_info;
	description = "Научи меня добывать трофеи с животных.";
};
func int DIA_Tamir_TeachMeTrophiesAnimals_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_TeachMeTrophiesAnimals_info()
{
	AI_Output(other,self,"DIA_Tamir_TeachMeTrophiesAnimals_15_00");	//Научи меня добывать трофеи с животных.
	AI_Output(self,other,"DIA_Tamir_TeachMeTrophiesAnimals_12_00");	//Если у тебя есть золото, то я готов к обучению.
	B_DSG_Log_OpenClose(TOPIC_BauerTeacher,LOG_NOTE,-1,"Охотник Тамир учит разделке животных.");
	/*ИЗГОТОВЛЕНИЕ В ОТДЕЛЬНОМ ФАЙЛЕ С ОБУЧЕНИЕМ АЛХИМИИ*/
};
//***********************************************************************************************************
//----------------------------------ОХОТА с ТАМИРОМ----------------------------------------------------------
//***********************************************************************************************************

//----
//Появляется после предыдущего ("Как тебя зовут?")
//----
instance DIA_Tamir_WhyDidUWantToAttackMe(C_Info)	//Почему ты хотел напасть на меня?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_WhyDidUWantToAttackMe_condition;	
	information = DIA_Tamir_WhyDidUWantToAttackMe_info;
	description = "Почему ты хотел напасть на меня?";
};
func int DIA_Tamir_WhyDidUWantToAttackMe_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName)){	return TRUE;};	};
func void DIA_Tamir_WhyDidUWantToAttackMe_info()
{
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_00");	//Почему ты хотел напасть на меня?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_00");	//Потому что думал, что ты один из пиратов.
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_01");	//Это я понял. Не думаю, что ты просто так бы стал нападать на человека, даже если он пират.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_01");	//(вздыхает) Да, ты прав. Я – мирный человек и при других обстоятельствах не стал бы так себя вести.
	
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_02");	//Что-то случилось?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_02");	//А ты не видишь?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_03");	//Деревня в осаде, пираты заставляют всех работать, чтобы кормить и выполнять все их желания.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_04");	//Недавно пришел один из них. Кажется, его зовут Саймон. И приказал мне отправляться на охоту и принести свежего мяса, дескать, от местной выпечки его уже тошнит.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_05");	//ПРИКАЗАЛ МНЕ?! Ты можешь в это поверить?!
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_06");	//(гордо) Я не его раб и никому не подчиняюсь!
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_07");	//При помощи меча и лука я решил припугнуть его, давая понять, что ничего делать по его желанию не буду.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_08");	//Но он не сильно-то испугался меня, стал угрожать, что если я не подчинюсь, то он сходит в пещеру и лично перережет глотку одной из наших женщин.
	
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_03");	//И ты думал, что я пришел от него с последним предупреждением?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_09");	//Так и есть. Теперь я не знаю, что делать.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_10");	//Не думаю, что Саймон решится на такое, но вдруг?!
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_11");	//Если я ошибаюсь? Ведь там, в пещере, не чужие мне люди.
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_12");	//В общем, я в безвыходном положении.
	AI_Output(other,self,"DIA_Tamir_WhyDidUWantToAttackMe_15_04");	//Может тебе стоит перебороть свою гордость и сходить поохотиться?
	AI_Output(self,other,"DIA_Tamir_WhyDidUWantToAttackMe_12_13");	//Чтобы все в деревне считали меня слабаком? Ну уж нет!
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_Start);
};
//
var int Tamir_First_Choice;		//Выбор варианта решения (первый - пойти на охоту с Тамиром)
var int Tamir_Second_Choice;	//Выбор варианта решения (/*ПОПОЗЖЕ*/)
//----
//Появляется после предыдущего ("Почему ты хотел напасть на меня?") и если квест "Выбор Тамира" ещё идёт
//----
instance DIA_Tamir_INeedFreshMeatToo(C_Info)	//Мне тоже нужно свежее мясо.
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_INeedFreshMeatToo_condition;	
	information = DIA_Tamir_INeedFreshMeatToo_info;
	description = "Мне тоже нужно свежее мясо.";
};
func int DIA_Tamir_INeedFreshMeatToo_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhyDidUWantToAttackMe) && (MIS_DS2P_TamirChoice == LOG_Running))	{	return TRUE;};	
};
func void DIA_Tamir_INeedFreshMeatToo_info()
{
	AI_Output(other,self,"DIA_Tamir_INeedFreshMeatToo_15_00");	//Мне тоже нужно свежее мясо.
	AI_Output(other,self,"DIA_Tamir_INeedFreshMeatToo_15_01");	//В этом путешествии я немного поиздержался. А ты – опытный охотник и сможешь помочь мне.
	AI_Output(other,self,"DIA_Tamir_INeedFreshMeatToo_15_02");	//Предлагаю пойти вместе в лес и помочь друг другу.
	AI_Output(self,other,"DIA_Tamir_INeedFreshMeatToo_12_00");	//(задумчиво) Хм... То есть, если я пойду с тобой, то это значит, что я помогаю тебе, а не выполняю приказ Саймона.
	AI_Output(self,other,"DIA_Tamir_INeedFreshMeatToo_12_01");	//Тем самым моя честь будет спасена. Отлично! Скажи, как будешь готов.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_HuntTogether);
	Tamir_First_Choice = TRUE;
};
//----
//Появляется после предыдущего ("Мне тоже нужно свежее мясо.") и если квест "Выбор Тамира" ещё идёт.
//----
instance DIA_Tamir_LetsGoHunting(C_Info)		//Пойдем поохотимся.
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_LetsGoHunting_condition;	
	information = DIA_Tamir_LetsGoHunting_info;
	description = "Пойдем, поохотимся.";
};
func int DIA_Tamir_LetsGoHunting_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Tamir_INeedFreshMeatToo) && (MIS_DS2P_TamirChoice == LOG_Running))	{	return TRUE;};	
};
func void DIA_Tamir_LetsGoHunting_info()
{
	var int x;x=0;
	AI_Output(other,self,"DIA_Tamir_LetsGoHunting_15_00");	//Пойдем, поохотимся.
	AI_Output(self,other,"DIA_Tamir_LetsGoHunting_12_00");	//Следуй за мной.
	B_StartOtherRoutine(self,"HUNTING");
	AI_StopProcessInfos(self);
	x=1;	if(x==1) 	{	B_DSG_Insert_TamirScavengers();	};
};
//----
//Появляется после предыдущего ("Пойдем поохотимся.") и если квест "Выбор Тамира" ещё идёт, и убито >= 9 падальщиков.
//----
instance DIA_Tamir_MeatIsMoreThanEnough(C_Info)		//Ну вот, похоже мяса более чем достаточно!
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_MeatIsMoreThanEnough_condition;	
	information = DIA_Tamir_MeatIsMoreThanEnough_info;
	important = TRUE;
};
func int DIA_Tamir_MeatIsMoreThanEnough_condition()
{	
	if((MIS_DS2P_TamirChoice == LOG_Running) && (Tamir_ScavengersDie_Count >= 9))	{	return TRUE;};	
};
func void DIA_Tamir_MeatIsMoreThanEnough_info()
{
	var int x;x=0;
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_00");	//Ну вот, похоже мяса более чем достаточно!
	AI_Output(other,self,"DIA_Tamir_MeatIsMoreThanEnough_15_00");	//Да, более чем.
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_01");	//Погоди! (прислушивается) Мы здесь не одни.
	AI_Output(other,self,"DIA_Tamir_MeatIsMoreThanEnough_15_01");	//О чем ты...
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_02");	//(тихо) Чувствуешь запах?
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_03");	//Так пахнуть может только один зверь – варг! Я ни с чем не спутаю. И похоже, это не один зверь, а целая стая.
	AI_Output(self,other,"DIA_Tamir_MeatIsMoreThanEnough_12_04");	//Готовься к бою!
	AI_StopProcessInfos(self);
	x=1;	if(x==1) 	{	B_DSG_Insert_TamirWargs();	};
};
//----
//Появляется после предыдущего ("Ну вот, похоже мяса более чем достаточно!") и если квест "Выбор Тамира" ещё идёт, и убито >= 9 варгов.
//----
instance DIA_Tamir_ThatWasBattle(C_Info)		//Вот это была битва!
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_ThatWasBattle_condition;	
	information = DIA_Tamir_ThatWasBattle_info;
	important = TRUE;
};
func int DIA_Tamir_ThatWasBattle_condition()
{	
	if((MIS_DS2P_TamirChoice == LOG_Running) && (Tamir_WargsDie_Count >= 9))	{	return TRUE;};	
};
func void DIA_Tamir_ThatWasBattle_info()
{
	B_GivePlayerXP(XP_MIS_TamirChoice_01);
	AI_Output(self,other,"DIA_Tamir_ThatWasBattle_12_00");	//Вот это была битва!
	AI_Output(self,other,"DIA_Tamir_ThatWasBattle_12_01");	//Похоже, эти варги тоже охотились на падальщиков, но мы их чуть определили.
	AI_Output(self,other,"DIA_Tamir_ThatWasBattle_12_02");	//Никогда еще не видел такого огромного, как их вожак. Без тебя я бы не справился.
	AI_Output(self,other,"DIA_Tamir_ThatWasBattle_12_03");	//Ладно, возвращаемся в деревню.
	AI_StopProcessInfos(self);
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_WargAttack);
	B_StartOtherRoutine(self,"START");
};
//----
//Появляется после предыдущего ("Вот это была битва!") и если Тамир в деревне.
//----
instance DIA_Tamir_IHaveFavorToAskU(C_Info)		//У меня к тебе будет просьба.
{
	npc = BAU_105_DS2P_Tamir;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Tamir_IHaveFavorToAskU_condition;	
	information = DIA_Tamir_IHaveFavorToAskU_info;
	important = TRUE;
};
func int DIA_Tamir_IHaveFavorToAskU_condition()
{	
	if((MIS_DS2P_TamirChoice == LOG_Running) && Npc_KnowsInfo(other,DIA_Tamir_ThatWasBattle) && C_Npc_GetDistToWP(self,"",1000,less))	{	return TRUE;};	
};
func void DIA_Tamir_IHaveFavorToAskU_info()
{
	AI_Output(self,other,"DIA_Tamir_IHaveFavorToAskU_12_00");	//У меня к тебе будет просьба.
	AI_Output(other,self,"DIA_Tamir_IHaveFavorToAskU_15_00");	//Я даже знаю какая.
	AI_Output(self,other,"DIA_Tamir_IHaveFavorToAskU_12_01");	//Да, ты прав. Не мог бы ты отнести это мясо Серой Бороде? Я не останусь в долгу!
	AI_Output(other,self,"DIA_Tamir_IHaveFavorToAskU_15_01");	//(вздыхая) Ладно, сделаю!
	AI_PlayAni(other,"T_FORGETIT");
	AI_Output(self,other,"DIA_Tamir_IHaveFavorToAskU_12_02");	//Спасибо тебе!
	AI_StopProcessInfos(self);
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_Meat4Symon);
};

//NS - 30/07/2013----------------------------
// "Я отнес Саймону мясо."		nr=20
// Отнесли Саймону мясо (+опыт)
instance DIA_Tamir_GaveMeatToSymon(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 20;
	condition = DIA_Tamir_GaveMeatToSymon_condition;	
	information = DIA_Tamir_GaveMeatToSymon_info;
	description = "Я отнес Саймону мясо.";
};
func int DIA_Tamir_GaveMeatToSymon_condition()
{
	if ((MIS_DS2P_TamirChoice == LOG_Running) && (Npc_KnowsInfo(other,DIA_Symon_MeatFromTamir)))
	{	return TRUE;	};
};
func void DIA_Tamir_GaveMeatToSymon_info()
{
	AI_Output(other,self,"DIA_Tamir_GaveMeatToSymon_15_00");	//Я отнес Саймону мясо.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_TamirChoice_Success);
		AI_Output(self,other,"DIA_Tamir_GaveMeatToSymon_12_01");	//Отлично! И что он сказал?
	AI_Output(other,self,"DIA_Tamir_GaveMeatToSymon_15_02");	//Он настолько объелся, что даже не хотел вспоминать о тебе. Думаю, в ближайшие дни он к тебе лезть не будет.
		AI_Output(self,other,"DIA_Tamir_GaveMeatToSymon_12_03");	//И на том спасибо! Ты очень помог мне, поэтому я могу тебе показать пару охотничьих приемов бесплатно. Выбор за тобой.
	Info_ClearChoices(DIA_Tamir_GaveMeatToSymon);
	//учит бесплатно, если еще не знаем
	var int KnownTalents;
	if (!player_talent_takeanimaltrophy[TROPHY_BFSting])	{
		Info_AddChoice(DIA_Tamir_GaveMeatToSymon,TXT_DS_TROPHYS_6,DIA_Tamir_GaveMeatToSymon_BFSting);
		KnownTalents += 1;
	};
	if (!player_talent_takeanimaltrophy[TROPHY_BFWing])	{
		Info_AddChoice(DIA_Tamir_GaveMeatToSymon,TXT_DS_TROPHYS_7,DIA_Tamir_GaveMeatToSymon_BFWing);
		KnownTalents += 1;
	};
	if (!player_talent_takeanimaltrophy[TROPHY_DragonBlood])	{
		Info_AddChoice(DIA_Tamir_GaveMeatToSymon,TXT_DS_TROPHYS_12,DIA_Tamir_GaveMeatToSymon_Blood);
		KnownTalents += 1;
	};
	// если все уже известно
	if (KnownTalents == 0)	{
		Info_AddChoice(DIA_Tamir_GaveMeatToSymon,"Я это уже знаю.",DIA_Tamir_GaveMeatToSymon_Nothing);
	};
};
func void DIA_Tamir_GaveMeatToSymon_BFSting()
{
	B_TeachPlayerTalentTakeAnimalTrophy_LogEntry(other,TROPHY_BFSting);
	//Запись в дневнике "Выбор Тамира" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TamirChoice_Success);
};
func void DIA_Tamir_GaveMeatToSymon_BFWing()
{
	B_TeachPlayerTalentTakeAnimalTrophy_LogEntry(other,TROPHY_BFWing);
	//Запись в дневнике "Выбор Тамира" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TamirChoice_Success);
};
func void DIA_Tamir_GaveMeatToSymon_Blood()
{
	B_TeachPlayerTalentTakeAnimalTrophy_LogEntry(other,TROPHY_DragonBlood);
	//Запись в дневнике "Выбор Тамира" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TamirChoice_Success);
};
func void DIA_Tamir_GaveMeatToSymon_Nothing()
{
	var int x;
	AI_Output(other,self,"DIA_Tamir_GaveMeatToSymon_Nothing_15_00");	//Я это уже знаю.
		AI_Output(self,other,"DIA_Tamir_GaveMeatToSymon_Nothing_12_01");	//Жаль, что не смог тебе помочь. Возьми тогда хоть немного стрел. Это все, чем я могу тебе помочь.
	//Дает 50 стрел
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItRw_Arrow,50);
	};
	//Запись в дневнике "Выбор Тамира" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TamirChoice_Success);
};



//***********************************************************************************************************
//--------------------------КОНЕЦ ОХОТЫ с ТАМИРОМ----------------------------------------------------------
//***********************************************************************************************************


//----
//Появляется после после предыдущего ("Как тебя зовут?") и взятия квеста "Ужас в ночи"
//----
instance DIA_Tamir_WhereCanIFindGustav(C_Info)	//Где мне найти Густава?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Tamir_WhereCanIFindGustav_condition;	
	information = DIA_Tamir_WhereCanIFindGustav_info;
	description = "Где мне найти Густава?";
};
func int DIA_Tamir_WhereCanIFindGustav_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && (MIS_DS2P_TerrorInNight == LOG_Running) )	{return TRUE;};	
};
func void DIA_Tamir_WhereCanIFindGustav_info()
{
	AI_Output(other,self,"DIA_Tamir_WhereCanIFindGustav_15_00");	//Где мне найти Густава?
	AI_Output(self,other,"DIA_Tamir_WhereCanIFindGustav_12_00");	//В последний раз я видел его ночью, когда напали пираты. После этого в деревне его не было.
	AI_Output(other,self,"DIA_Tamir_WhereCanIFindGustav_15_01");	//Может ты знаешь, где он может быть?
	AI_Output(self,other,"DIA_Tamir_WhereCanIFindGustav_12_01");	//Возможно, он скрывается в лесу вместе с Томом, Джином и Фартом. Но это только предположение.
};
//----
//Появляется после после предыдущего ("Как тебя зовут?")
//----
instance DIA_Tamir_WhereCanIBuyWeaponsAndProvisions(C_Info)	//Где я могу купить оружие и провиант?
{
	npc = BAU_105_DS2P_Tamir;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_condition;	
	information = DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_info;
	description = "Где я могу купить оружие и провиант?";
};
func int DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && (MIS_DS2P_TerrorInNight == LOG_Running) )	{return TRUE;};	
};
func void DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_info()
{
	AI_Output(other,self,"DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_15_00");	//Где я в деревне могу купить оружие и провиант?
	AI_Output(self,other,"DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_12_00");	//Провиант можно купить у Марии в таверне, зелья и эликсиры у Цимма.
	AI_Output(self,other,"DIA_Tamir_WhereCanIBuyWeaponsAndProvisions_12_01");	//А вот оружие у нас никто не продает, кроме Густава. А его в деревне нет. Попробуй поговорить с пиратами.
};

//----
//Появляется после предыдущего ("Как тебя зовут?") , если взят квест ”Внук рыбака” и если еще не получил информацию у Марии
//----
instance DIA_Tamir_ImLookingForGaron(C_Info)	//Ты не видел Гарона? 
{
	npc = BAU_105_DS2P_Tamir;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Tamir_ImLookingForGaron_condition;	
	information = DIA_Tamir_ImLookingForGaron_info;
	description = "Ты не видел Гарона? ";
};
func int DIA_Tamir_ImLookingForGaron_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && (MIS_DS2P_GrandsonOfFisherman == LOG_Running) && !Npc_KnowsInfo(other,DIA_Maria_AboutGaron))
	{return TRUE;};	
};
func void DIA_Tamir_ImLookingForGaron_info()
{
	AI_Output(other,self,"DIA_Tamir_ImLookingForGaron_15_00");	//Ты не видел Гарона?
	AI_Output(self,other,"DIA_Tamir_ImLookingForGaron_12_00");	//Кажется, пару дней назад он пробегал мимо. Больше я о нем ничего не знаю.
};
//----
//Появляется после после предыдущего ("Как тебя зовут?") и взятия квеста "Опасная охота"
//----
func void Tamir_Give_Snares_GG()
{
	AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_02");	//Там даже насажена приманка. Тебе останется только установить их в лесу.
	B_GiveInvItems(self,other,ITMI_DS2P_SnaresForHunting_Empty,3);
	B_DSG_Log_OpenClose(TOPIC_DS2P_DangerousHunting,LOG_MISSION,LOG_Running,TOPIC_DS2P_DangerousHunting_SnaresGot);
};
//---
instance DIA_Tamir_DoUHaveSnare(C_Info)	//У тебя есть силки?		nr=12;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 12;
	permanent = FALSE;
	condition = DIA_Tamir_DoUHaveSnare_condition;	
	information = DIA_Tamir_DoUHaveSnare_info;
	description = "У тебя есть силки?";
};
func int DIA_Tamir_DoUHaveSnare_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && (MIS_DS2P_DangerousHunting == LOG_Running) )	{return TRUE;};	
};
func void DIA_Tamir_DoUHaveSnare_info()
{
	AI_Output(other,self,"DIA_Tamir_DoUHaveSnare_15_00");	//У тебя есть силки?
	AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_00");	//Есть, а тебе зачем?
	AI_Output(other,self,"DIA_Tamir_DoUHaveSnare_15_01");	//Барок попросил меня поймать ему несколько кроликов.
	if(MIS_DS2P_TamirChoice == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_01");	//Ты очень помог мне, поэтому я отдам тебе силки просто так. 
		Tamir_Give_Snares_GG();
	}
	else
	{
		AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_03");	//Все имеет свою цену. Если у тебя есть 300 золотых, я поделюсь с тобой тремя силками. По сотне за штуку.
		Tamir_Trade_Snare = TRUE;
	};
};
//----
//Появляется после после предыдущего ("У тебя есть силки?") и взятия квеста "Опасная охота" и если надо покупать силки
//----
var int Tamir_Give_Snares;
instance DIA_Tamir_ThatsGold4Snares(C_Info)	//Вот золото за силки.		nr=12;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 12;
	permanent = TRUE;
	condition = DIA_Tamir_ThatsGold4Snares_condition;	
	information = DIA_Tamir_ThatsGold4Snares_info;
	description = "Вот золото за силки.";
};
func int DIA_Tamir_ThatsGold4Snares_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_DoUHaveSnare) && (MIS_DS2P_DangerousHunting == LOG_Running) && Tamir_Trade_Snare && !Tamir_Give_Snares)	
	{return TRUE;};	
};
func void DIA_Tamir_ThatsGold4Snares_info()
{
	AI_Output(other,self,"DIA_Tamir_ThatsGold4Snares_15_00");	//Вот золото за силки.
	if(MIS_DS2P_TamirChoice == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Tamir_DoUHaveSnare_12_01");	//Ты очень помог мне, поэтому я отдам тебе силки просто так. 
		Tamir_Give_Snares_GG();
		Tamir_Give_Snares = TRUE;
	}
	else
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,300))
		{
			AI_Output(self,other,"DIA_Tamir_ThatsGold4Snares_12_00");	//Хорошо, здесь все, что тебе нужно. 
			Tamir_Give_Snares_GG();
			Tamir_Give_Snares = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Tamir_ThatsGold4Snares_12_01");	//Я не ведусь на такие фокусы. Принеси оговоренную сумму.
		};
	};
};
//////////////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////
//----------------------
//Появляется после предыдущего ("Как тебя зовут?") и если узнал от Никки "Тамир говорил, что у тебя скверный характер"
//----------------------
instance DIA_Tamir_DidUWantToMarryNikki(C_Info)	//Ты хотел жениться на Никки?  //nr = 13;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 13;
	permanent = FALSE;
	condition = DIA_Tamir_DidUWantToMarryNikki_condition;	
	information = DIA_Tamir_DidUWantToMarryNikki_info;
	description = "Ты хотел жениться на Никки?";
};
func int DIA_Tamir_DidUWantToMarryNikki_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_WhatIsYourName) && Npc_KnowsInfo(other,DIA_Nikki_TamirSaidThatUHaveBadTemper))
	{	return TRUE;};	
};
func void DIA_Tamir_DidUWantToMarryNikki_info()
{
	AI_Output(other,self,"DIA_Tamir_DidUWantToMarryNikki_15_00");	//Ты хотел жениться на Никки?
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_01");	//Я похож на психа? Чтобы она меня ночью укокошила за то, что я накануне не подмел пол или не сходил за водой?!
	
	AI_Output(other,self,"DIA_Tamir_DidUWantToMarryNikki_15_02");	//Ты серьезно?
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_03");	//Более чем!
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_04");	//Ты думаешь, почему она одна, и ни один деревенский мужик даже близко к ней не подходит?
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_05");	//Да потому, что был у нас один бедолага Коло, который втюрился в Никки до безумия. Ходил за ней как верный пес, любые капризы исполнял, а она из него веревки вила.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_06");	//На людях-то все было чинно-благородно, слова плохого от нее не услышишь, а на следующий день Коло с синяком под глазом или хромает, или еще чего.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_07");	//Осунулся весь, глаза ввалились. Всем говорил, что, дескать, споткнулся, неуклюжий и прочее. Но мы-то не дураки, понимали, что здесь что-то не то, но он ничего не хотел слушать.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_08");	//Как-то вечером мы с Томом решили поглядеть, что там у них происходит.
	
	AI_Output(other,self,"DIA_Tamir_DidUWantToMarryNikki_15_09");	//И что же вы увидели?
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_10");	//Как вспомню, мурашки по телу.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_11");	//Никки где-то раздобыла черное платье с капюшоном, ну точь-в-точь ведьма.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_12");	//Носилась в нем за Коло, орала как сумасшедшая, стегала его розгами, пинала, кидала в него кружки и сковородки.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_13");	//Коло метался по дому как загнанный зверь. Мы тогда решили, что в нее вселился бес, и решили спасти несчастного. Лучше бы мы не вмешивались.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_14");	//Когда Никки увидела нас, стоящих в дверях дома, она зашипела как змея, глаза налились кровью, округлились, словно сейчас выпадут из орбит.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_15");	//Она была в ярости, что кто-то посмел ей помешать, дескать, она решила проучить Коло за неповиновение.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_16");	//Никки пригрозила нам, что проклянет, если мы кому-нибудь разболтаем об увиденном.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_17");	//Признаться честно, мы с Томом тогда трухнули неслабо, поэтому решили помалкивать от греха. Но это еще не все.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_18");	//Через пару дней Коло отправился на охоту и не вернулся.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_19");	//Такое, конечно, бывало и раньше, звери в наших лесах встречаются опасные, и парням не всегда удавалось их победить.
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_20");	//Но Коло был опытным охотником, да и тела мы так и не нашли, хотя обшарили почти весь лес. 
	AI_Output(self,other,"DIA_Tamir_DidUWantToMarryNikki_12_21");	//В общем, я более чем уверен, что это она его укокошила, но, увы, доказательств у меня нет.
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_Running,TOPIC_DS2P_YouAreWitch_Start);
};
//----------------------
//Появляется после предыдущего ("Ты хотел жениться на Никки?")
//----------------------
instance DIA_Tamir_DidUSearchEverywhereInForest(C_Info)	//Вы прочесали весь лес?  //nr = 13;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 13;
	permanent = FALSE;
	condition = DIA_Tamir_DidUSearchEverywhereInForest_condition;	
	information = DIA_Tamir_DidUSearchEverywhereInForest_info;
	description = "Вы прочесали весь лес?";
};
func int DIA_Tamir_DidUSearchEverywhereInForest_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_DidUWantToMarryNikki)){	return TRUE;};	};
func void DIA_Tamir_DidUSearchEverywhereInForest_info()
{
		AI_Output(other,self,"DIA_Tamir_DidUSearchEverywhereInForest_15_00");	//Вы прочесали весь лес?
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_00");	//Нет, конечно. На это не хватило бы ни людей, ни времени.
	
		AI_Output(other,self,"DIA_Tamir_DidUSearchEverywhereInForest_15_01");	//Где вы еще не искали?
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_01");	//Ты хочешь найти тело Коло? Но прошла уже не одна неделя. Даже если его тело в лесу, то там остались уже одни кости.
	
		AI_Output(other,self,"DIA_Tamir_DidUSearchEverywhereInForest_15_02");	//Может быть, у него была какая-нибудь вещь, по которой я бы смог его опознать?
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_02");	//Дай подумать...
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_03");	//Ах да, конечно!. Он никогда не расставался с двумя вещами – старым секстантом и кольцом своего отца.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_04");	//Тот был моряком, но был убит в стычке с головорезами, когда в очередной раз вернулся с промысла.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_05");	//Мы похоронили его на кладбище неподалеку от деревни. Коло очень любил отца и мечтал когда-нибудь тоже стать мореходом.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_06");	//Но, увы, мечте не суждено сбыться.
	
		AI_Output(other,self,"DIA_Tamir_DidUSearchEverywhereInForest_15_03");	//Значит, секстант и кольцо. Я попробую найти их.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_07");	//Если хочешь мой совет, то я бы стал искать либо на болоте, либо в какой-нибудь пещере, где живет крупный хищник.
	AI_Output(self,other,"DIA_Tamir_DidUSearchEverywhereInForest_12_08");	//Если я ошибаюсь, и Никки ни при чем, то, скорее всего, он попал в лапы мракорису или его затоптал болотный голем, коими кишит болото.
	
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_Running,TOPIC_DS2P_YouAreWitch_BodySearch);
};
//----------------------
//Появляется после предыдущего ("Вы прочесали весь лес?")
//----------------------
instance DIA_Tamir_WhereIsSwamp(C_Info)	//Где находится болото?  //nr = 13;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 13;
	permanent = FALSE;
	condition = DIA_Tamir_WhereIsSwamp_condition;	
	information = DIA_Tamir_WhereIsSwamp_info;
	description = "Где находится болото?";
};
func int DIA_Tamir_WhereIsSwamp_condition(){	if(Npc_KnowsInfo(other,DIA_Tamir_DidUWantToMarryNikki)){	return TRUE;};	};
func void DIA_Tamir_WhereIsSwamp_info()
{
	//UNFINISHED
	AI_Output(other,self,"DIA_Tamir_WhereIsSwamp_15_00");	//Где находится болото?
	AI_Output(self,other,"DIA_Tamir_WhereIsSwamp_12_00");	// /*Redleha: Оно находится там-то и там-то. НАДО ИСПРАВИТЬ*/
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_Running,TOPIC_DS2P_YouAreWitch_Swamp);
};
//-----------------------------------------------------------------------------------------------------------
//Появляется после предыдущего ("Вы прочесали весь лес?")
//----------------------
//В StoryGlobals:
		//var int DIA_Tamir_WithRegardToNikki_CHOICE;		//Выбор ГГ в диалоге: решить, что Никки убила Коло или она "хорошая"
			//const int NIKKI_IS_BAD_WOMAN = 1;	//Никки плохая
				//const int NIKKI_IS_GOOD_WOMAN = 2;	//Никки хорошая
var int DIA_Tamir_WithRegardToNikki_KnowsAboutRing;
var int DIA_Tamir_WithRegardToNikki_KnowsAboutSextant;
instance DIA_Tamir_WithRegardToNikki(C_Info)	//По поводу Никки...  //nr = 130;
{
	npc = BAU_105_DS2P_Tamir;
	nr = 130;
	permanent = TRUE;
	condition = DIA_Tamir_WithRegardToNikki_condition;	
	information = DIA_Tamir_WithRegardToNikki_info;
	description = "По поводу Никки...";
};
func int DIA_Tamir_WithRegardToNikki_condition(){	
	if(Npc_KnowsInfo(other,DIA_Tamir_DidUWantToMarryNikki) && !DIA_Tamir_WithRegardToNikki_CHOICE)
	{	return TRUE;};	
};
func void DIA_Tamir_WithRegardToNikki_info()
{
	Info_ClearChoices(DIA_Tamir_WithRegardToNikki);
	if(DIA_Tamir_WithRegardToNikki_KnowsAboutRing && DIA_Tamir_WithRegardToNikki_KnowsAboutSextant)
	{
		Info_AddChoice(DIA_Tamir_WithRegardToNikki,"Я думаю, Никки не виновна.",DIA_Tamir_WithRegardToNikki_GoodWoman);
		Info_AddChoice(DIA_Tamir_WithRegardToNikki,"Я уверен, что Никки убила Коло.",DIA_Tamir_WithRegardToNikki_BadWoman);
	}
	else
	{
		Info_AddChoice(DIA_Tamir_WithRegardToNikki,"Пока ничего...",DIA_Tamir_WithRegardToNikki_Nothing);
		//Если есть только секстант
		if(!DIA_Tamir_WithRegardToNikki_KnowsAboutSextant && Npc_HasItems(other,ItMi_Sextant) && !Npc_HasItems(other,ItRi_DS2P_Kolo))
		{
			Info_AddChoice(DIA_Tamir_WithRegardToNikki,"Я нашел секстант.",DIA_Tamir_WithRegardToNikki_FindSextant);
		};
		//Если есть только кольцо
		if(!DIA_Tamir_WithRegardToNikki_KnowsAboutRing && Npc_HasItems(other,ItRi_DS2P_Kolo) && !Npc_HasItems(other,ItMi_Sextant))
		{
			Info_AddChoice(DIA_Tamir_WithRegardToNikki,"Я нашел кольцо отца Коло.",DIA_Tamir_WithRegardToNikki_FindRing);
		};
		//Если есть и секстант, и кольцо
		if(!(DIA_Tamir_WithRegardToNikki_KnowsAboutRing && DIA_Tamir_WithRegardToNikki_KnowsAboutSextant) && Npc_HasItems(other,ItRi_DS2P_Kolo) && Npc_HasItems(other,ItMi_Sextant))
		{
			Info_AddChoice(DIA_Tamir_WithRegardToNikki,"Я нашел кольцо отца Коло и секстант.",DIA_Tamir_WithRegardToNikki_FindAll);
		};
	};
};
func void DIA_Tamir_WithRegardToNikki_Nothing()
{
	Info_ClearChoices(DIA_Tamir_WithRegardToNikki);
};
func void DIA_Tamir_WithRegardToNikki_FindSextant()
{
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindSextant_15_00");	//Я нашел секстант.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindSextant_12_00");	//Где ты нашел его?
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindSextant_15_01");	//На болоте возле одного из големов. Пришлось с ним повозиться.
	if(!DIA_Tamir_WithRegardToNikki_KnowsAboutRing)
	{
		AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindSextant_12_01");	//Хм... Давай не будем торопиться с выводами. Найди кольцо. Если я прав, то, скорее всего, оно у Никки.
	};
	B_GivePlayerXP(XP_MIS_YouAreWitch_01);
	DIA_Tamir_WithRegardToNikki_KnowsAboutSextant = TRUE;
	if(!DIA_Tamir_WithRegardToNikki_KnowsAboutRing)
	{
		Info_ClearChoices(DIA_Tamir_WithRegardToNikki);
	}
	else
	{
		DIA_Tamir_WithRegardToNikki_info();
	};
};
func void DIA_Tamir_WithRegardToNikki_FindRing()
{
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindRing_15_00");	//Я нашел кольцо отца Коло.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_00");	//И где оно было?
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindRing_15_01");	//В сундуке в доме Никки.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_01");	//Ага, я так и знал. Это она его убила!
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindRing_15_02");	//Это ничего не значит. Он мог просто подарить ей кольцо.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_02");	//Да, наверное, ты прав.
	if(!DIA_Tamir_WithRegardToNikki_KnowsAboutSextant)
	{
		AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_03");	//Нужно найти секстант.
	};
	B_GivePlayerXP(XP_MIS_YouAreWitch_02);
	DIA_Tamir_WithRegardToNikki_KnowsAboutRing = TRUE;
	if(!DIA_Tamir_WithRegardToNikki_KnowsAboutSextant)
	{
		Info_ClearChoices(DIA_Tamir_WithRegardToNikki);
	}
	else
	{
		DIA_Tamir_WithRegardToNikki_info();
	};
};
func void DIA_Tamir_WithRegardToNikki_FindAll()
{
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindAll_15_00");	//Я нашел кольцо отца Коло и секстант.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindAll_12_00");	//И где же они были?
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindAll_15_01");	//Секстант - на болоте возле одного из големов. Пришлось с ним повозиться.
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindAll_15_02");	//Кольцо - в сундуке в доме Никки.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_FindRing_12_01");	//Ага, я так и знал. Это она его убила!
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_FindRing_15_02");	//Это ничего не значит. Он мог просто подарить ей кольцо.
	DIA_Tamir_WithRegardToNikki_KnowsAboutRing = TRUE;
	DIA_Tamir_WithRegardToNikki_KnowsAboutSextant = TRUE;
	DIA_Tamir_WithRegardToNikki_info();
};
func void DIA_Tamir_WithRegardToNikki_GoodWoman()
{
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_GoodWoman_15_00");	//Похоже, Никки не виновата. Коло погубил один из големов, а перед этим он подарил ей кольцо отца.
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_GoodWoman_15_01");	//Ты сам говорил, что Коло был без ума от Никки.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_GoodWoman_12_00");	//Похоже ты прав. У нее просто не все дома. (смеется) Я благодарен тебе за то, что выяснил правду.
	B_GiveInvItems(self,other,ItBe_DS2P_Sniper,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_YouAreWitch_SuccessInnocent);
	DIA_Tamir_WithRegardToNikki_CHOICE = NIKKI_IS_GOOD_WOMAN;
};
func void DIA_Tamir_WithRegardToNikki_BadWoman()
{
	B_StartOtherRoutine(BAU_107_DS2P_Nikki,"WAIT");
	AI_Teleport(BAU_107_DS2P_Nikki,"");
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_BadWoman_15_00");	//Я уверен, что Никки убила Коло.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_00");	//Я тоже склоняюсь к этой версии, но у нас совершенно нет доказательств.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_01");	//То, что она хранит кольцо Коло, ничего не значит. Может быть, Коло сам подарил его.
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_02");	//Нужно что-то более веское.
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_BadWoman_15_01");	//Что ты предлагаешь?
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_03");	//У меня есть идея!
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_04");	//Что, если мы скажем, что Коло жив? Что он только что вернулся в деревню и ищет ее.
	AI_Output(other,self,"DIA_Tamir_WithRegardToNikki_BadWoman_15_02");	//И что это даст?
	AI_Output(self,other,"DIA_Tamir_WithRegardToNikki_BadWoman_12_05");	//Увидишь, пошли!
	DIA_Tamir_WithRegardToNikki_CHOICE = NIKKI_IS_BAD_WOMAN;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"GoToNikki");
};
//
//	Диалог появляется после: триалога "Никки, мы видели его!"
//
instance DIA_Tamir_ShitShitOMG(C_Info)	//	"Черт! Черт! Белиар ее забери!"  //nr = 130
{
	npc = BAU_105_DS2P_Tamir;
	nr = 130;
	permanent = FALSE;
	condition = DIA_Tamir_ShitShitOMG_condition;	
	information = DIA_Tamir_ShitShitOMG_info;
	important = true;
};
func int DIA_Tamir_ShitShitOMG_condition(){	if(Npc_KnowsInfo(other,DIA_Nikki_KoloHasReturned)){	return TRUE;};	};
func void DIA_Tamir_ShitShitOMG_info()
{
	AI_Output(self,other,"DIA_Tamir_ShitShitOMG_12_00");	//Черт! Черт! Белиар ее забери!
	AI_Output(other,self,"DIA_Tamir_ShitShitOMG_15_00");	//Но ведь она права. Ты ничего сейчас не можешь с этим сделать.
	AI_Output(self,other,"DIA_Tamir_ShitShitOMG_12_01");	//Надо было просто перерезать ее поганую глотку!
	AI_Output(other,self,"DIA_Tamir_ShitShitOMG_15_01");	//Иннос всех рассудит.
	AI_Output(self,other,"DIA_Tamir_ShitShitOMG_12_02");	//Ты прав. Спасибо тебе за помощь, я очень ценю то, что ты сделал. 
	AI_Output(self,other,"DIA_Tamir_ShitShitOMG_12_03");	//Вот, держи этот скромный подарок.
	B_GiveInvItem_red(self,other,ItRw_DS2P_Bow_Tamir,1,34);
	B_GiveInvItem_red(self,other,ItMi_Gold,1,37);
	B_DSG_Log_OpenClose(TOPIC_DS2P_YouAreWitch,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_YouAreWitch_SuccessGuilty);
	AI_StopProcessInfos(self);
};



//NS - 27/06/2013 ===========
// По квесту "Кто украл мое железо?" 	nr=101
//===========================

instance DIA_Tamir_AboutStolenIron(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 101;
	condition = DIA_Tamir_AboutStolenIron_condition;	
	information = DIA_Tamir_AboutStolenIron_info;
	description = "Ты не видел ничего подозрительного?";
};
func int DIA_Tamir_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Tamir_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Tamir_AboutStolenIron_15_00");	//Ты не видел ничего подозрительного?
		AI_Output(self,other,"DIA_Tamir_AboutStolenIron_12_01");	//Ты о чем?
	AI_Output(other,self,"DIA_Tamir_AboutStolenIron_15_02");	//Ночью кто-то украл всю железную руду из кузницы. Ты что-нибудь знаешь об этом?
		AI_Output(self,other,"DIA_Tamir_AboutStolenIron_12_03");	//Наверняка это Дил. Что еще можно ожидать от этого малого?!
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 27/06/2013 ======================================================
// По квесту "Старая мельница"
//======================================================================

//----------------------------
// Где найти гранит?		nr=20
// после взятия квеста и разговора с Марией
instance DIA_Tamir_WhereGetStone4Mill(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 20;
	condition = DIA_Tamir_WhereGetStone4Mill_condition;	
	information = DIA_Tamir_WhereGetStone4Mill_info;
	description = "Ты не знаешь, где на острове можно найти гранит?";
};
func int DIA_Tamir_WhereGetStone4Mill_condition()
{
	if ((MIS_DS2P_OldMill == LOG_Running) && (Npc_KnowsInfo(other,DIA_Maria_WhereGetStone4Mill)))
	{	return TRUE;	};
};
func void DIA_Tamir_WhereGetStone4Mill_info()
{
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_00");	//Ты не знаешь, где на острове можно найти гранит? 
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_01");	//Дай-ка подумать. Нет, кажется нет...
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_02");	//Очень жаль, мне нужно починить мельницу, а без гранита это невозможно.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_03");	//(задумался) Погоди. Есть одно место, но, боюсь, тебе это мало поможет.
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_04");	//Рассказывай.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_05");	//Есть тут у нас одна пещерка, мы между охотниками называем ее “Врата преисподней“. Там когда-то был древний склеп.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_06");	//Похоже, в древности там хоронили всяких магов. Так вот, как-то мы с Томом решили наведаться туда, ну мало ли, золотишка или артефакт найти.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_07");	//В общем, это была глупая идея. Не прошли мы и пары шагов, как изо всех щелей на нас полезла нежить всех мастей.
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_08");	//Я со страха чуть в штаны не наделал. Еле ноги уволокли оттуда. 
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_09");	//И как это относится к моей проблеме?
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_10");	//Да очень просто! Из того, что я сумел разглядеть, все саркофаги были каменные и не просто из камня, а из гранита!
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_11");	//Но я бы на твоем месте не совался, если, конечно, тебе дорога жизнь.
	AI_Output(other,self,"DIA_Tamir_WhereGetStone4Mill_15_12");	//Где находится эта пещера?
	// UNFINISHED вписать путь к склепу
		AI_Output(self,other,"DIA_Tamir_WhereGetStone4Mill_12_13");	// /*Redleha: Она находится там-то и там-то. НАДО ИСПРАВИТЬ*/

	//Запись в дневнике "Старая мельница" 
	// UNFINISHED вписать путь к склепу
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldMill_CaveTold);
};


//NS - 02/07/2013 ================================================
// После смерти Кадара
//================================================================
instance DIA_Tamir_KadarDead(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 0;
	condition = DIA_Tamir_KadarDead_condition;	
	information = DIA_Tamir_KadarDead_info;
	important = TRUE;
};
func int DIA_Tamir_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Tamir_KadarDead_info()
{
		AI_Output(self,other,"DIA_Tamir_KadarDead_12_00");	//Ты уже слышал? Хотя какая в этом разница. Кадар был хорошим старостой, да будут к нему милостивы духи!
};

// Активируется на следующий день, после выполнения квеста "Найти сбежавших охотников"
// nr = 1

instance DIA_Tamir_AfterEscapedHunters(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 1;
	condition = DIA_Tamir_AfterEscapedHunters_condition;	
	information = DIA_Tamir_AfterEscapedHunters_info;
	permanent = FALSE;
	description = "Грустишь?";
};

func int DIA_Tamir_AfterEscapedHunters_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == LOG_Success) && (EscapedHunters_QuestComplete - Wld_GetDay() >= 1))
	{	
		return TRUE;	
	};
};

func void DIA_Tamir_AfterEscapedHunters_info()
{
	AI_Output(other,self,"DIA_Tamir_AfterEscapedHunters_15_00");	//Грустишь?
	AI_Output(self,other,"DIA_Tamir_AfterEscapedHunters_12_01");	//Уже знаешь, что пираты убили Густава вместе с парнями?
	AI_Output(other,self,"DIA_Tamir_AfterEscapedHunters_15_02");	//Да, слышал.
	AI_Output(self,other,"DIA_Tamir_AfterEscapedHunters_12_03");	//Почему меня не было вместе с ними?
	AI_Output(other,self,"DIA_Tamir_AfterEscapedHunters_15_04");	//И что бы ты изменил? Погиб бы вместе с остальными ни за грош. А так у тебя есть шанс отомстить.
	AI_Output(self,other,"DIA_Tamir_AfterEscapedHunters_12_05");	//И я им воспользуюсь! Я сделаю так, что жизнь пиратов превратится в ад.
	AI_Output(other,self,"DIA_Tamir_AfterEscapedHunters_15_06");	//Только прошу без фанатизма. Никому не станет лучше, если ты погибнешь зазря. Если я буду бороться с пиратами, то обязательно позову тебя. Идет?
	AI_Output(self,other,"DIA_Tamir_AfterEscapedHunters_12_07");	//Ладно.
	AI_StopProcessInfos(self);
};

