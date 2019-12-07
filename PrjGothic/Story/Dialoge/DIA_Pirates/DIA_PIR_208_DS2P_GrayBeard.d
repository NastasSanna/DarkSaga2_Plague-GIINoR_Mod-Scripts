instance DIA_GrayBeard_EXIT(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 999;
	permanent = TRUE;
	condition = DIA_GrayBeard_EXIT_condition;	
	information = DIA_GrayBeard_EXIT_info;
	description = Dialog_Ende;
};

func int DIA_GrayBeard_EXIT_condition()
{	
	return TRUE;
};

func void DIA_GrayBeard_EXIT_info()
{	
	AI_StopProcessInfos(self);
};

// Первый разговор с Серой Бородой. Начинается, если ГГ первый заговорит
// с ним. nr = 1

instance DIA_GrayBeard_Hello(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_Hello_condition;	
	information = DIA_GrayBeard_Hello_info;
	description = " ";
};

func int DIA_GrayBeard_Hello_condition()
{	
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_Hello_info()
{	
	AI_Output(self,other,"DIA_GrayBeard_Hello_13_00");	//Эй, сухопутная крыса, у тебя не найдется чего-нибудь выпить?
	AI_Output(other,self,"DIA_GrayBeard_Hello_15_01");	//Полагаю, вода тебе не подойдет.
	AI_Output(self,other,"DIA_GrayBeard_Hello_13_02");	//Нет, конечно! Мне нужен грог. Не ром, вино или пиво, а грог!
	Info_ClearChoices(DIA_GrayBeard_Hello);
	Info_AddChoice(DIA_GrayBeard_Hello,"Нет, нету.",DIA_GrayBeard_Hello_NoGrog);
	// Если у игрока есть Грог, то появляется топик "(дать грог)"
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_GrayBeard_Hello,"(дать грог)",DIA_GrayBeard_Hello_Grog);
	};
};

// Запускается при выборе реплики "Нет, нету." в первом разговоре с Седой Бородой

func void DIA_GrayBeard_Hello_NoGrog()
{
	AI_Output(other,self,"DIA_GrayBeard_Hello_NoGrog_15_00");	//Нет, нету.
	AI_Output(self,other,"DIA_GrayBeard_Hello_NoGrog_13_01");	//Черт, на этом проклятущем клочке суши вообще ничего нет.
	AI_Output(self,other,"DIA_GrayBeard_Hello_13_03");	//У меня к тебе предложение, парень. За каждую бутылку грога плачу двойную цену. Согласен?
	AI_Output(other,self,"DIA_GrayBeard_Hello_15_04");	//Буду иметь в виду.
};

// Запускается при выборе реплики "(дать грог)" в первом разговоре с Седой Бородой

func void DIA_GrayBeard_Hello_Grog()
{
	AI_Output(other,self,"DIA_GrayBeard_Hello_Grog_15_00");	//Вот, держи.
	// Отдаем грог Седой Бороде
	B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	// Седая Борода выпивает Грог
	B_UseItem(self,ItFo_Addon_Grog);
	AI_Output(self,other,"DIA_GrayBeard_Hello_NoGrog_13_01");	//(сыто отрыгивает) Лучший в мире напиток... Ик!
	AI_Output(self,other,"DIA_GrayBeard_Hello_13_03");	//У меня к тебе предложение, парень. За каждую бутылку грога плачу двойную цену. Согласен?
	AI_Output(other,self,"DIA_GrayBeard_Hello_15_04");	//Буду иметь в виду.
};

// "Кто ты?". Активируется, если произошел первый диалог с Седой Бородой
// nr = 1

instance DIA_GrayBeard_WhoAreYou(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_WhoAreYou_condition;	
	information = DIA_GrayBeard_WhoAreYou_info;
	description = "Кто ты?";
};

func int DIA_GrayBeard_WhoAreYou_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WhoAreYou_info()
{	
	AI_Output(other,self,"DIA_GrayBeard_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_GrayBeard_WhoAreYou_13_01");	//(гордо) Я – Серая Борода! Гроза морей, ужас торговцев и любимчик дам. Меня знают от Южных островов, Хориниса и до самого побережья материка, начиная с его южной оконечности и заканчивая снежным севером. Меня боятся и любят. Я внушаю неповторимый ужас и священный трепет. Я…
	AI_Output(other,self,"DIA_GrayBeard_WhoAreYou_15_02");	//Да, я уже понял, что ты излишней скромностью не страдаешь.
	AI_Output(self,other,"DIA_GrayBeard_WhoAreYou_13_03");	//Скромность для слабых людей. Сильные же личности, такие как я, не хранят в себе свои подвиги и достижения – любовные они или же получены на поле брани. Мы выставляем их напоказ, чтобы все видели, восхищались нами или завидовали.
	AI_Output(other,self,"DIA_GrayBeard_WhoAreYou_15_04");	//Ладно-ладно, я все понял.
};

// "Ты что, все время пьешь?". Активируется, если произошел первый диалог с Седой Бородой
// nr = 2

instance DIA_GrayBeard_DrinkAllTime(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 2;
	permanent = FALSE;
	condition = DIA_GrayBeard_DrinkAllTime_condition;	
	information = DIA_GrayBeard_DrinkAllTime_info;
	description = "Ты что, все время пьешь?";
};

func int DIA_GrayBeard_DrinkAllTime_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_DrinkAllTime_info()
{
	AI_Output(other,self,"DIA_GrayBeard_DrinkAllTime_15_00");	//Ты что, все время пьешь?
	AI_Output(self,other,"DIA_GrayBeard_DrinkAllTime_13_01");	//(хмуро) А что это уже нельзя?
	AI_Output(other,self,"DIA_GrayBeard_DrinkAllTime_15_02");	//Да нет, просто удивляюсь, как ты стоишь на ногах.
	AI_Output(self,other,"DIA_GrayBeard_DrinkAllTime_13_03");	//(хвастливо) Это еще что! Я даже Зедда могу перепить. Он уже давным-давно валяется с бутылкой под столом, а я еще трезв. После того, как я несколько раз его победил в выпивке, он со мной даже не хочет соревноваться.
	AI_Output(other,self,"DIA_GrayBeard_DrinkAllTime_15_04");	//Да-да, я уже понял и проникся твоим величием.
	AI_Output(self,other,"DIA_GrayBeard_DrinkAllTime_13_05");	//Предлагаю состязание. Мы с тобой идем в таверну, напиваемся там до чертиков и тот, кто вырубится первым, платит за выпивку и отдает 300 золотых победителю. Только деньги вперед.
	AI_Output(other,self,"DIA_GrayBeard_DrinkAllTime_15_06");	//Как-нибудь в другой раз. Сейчас у меня времени нет напиваться.
	AI_Output(self,other,"DIA_GrayBeard_DrinkAllTime_13_07");	//Ха! Слабачок! Испугался? Правильно боишься, ведь я – Серая Борода! 
};

// "Как ты относишься к Гарду?". Активируется, если произошел первый диалог с Седой Бородой
// nr = 3

instance DIA_GrayBeard_AboutGard(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 3;
	permanent = FALSE;
	condition = DIA_GrayBeard_AboutGard_condition;	
	information = DIA_GrayBeard_AboutGard_info;
	description = "Как ты относишься к Гарду?";
};

func int DIA_GrayBeard_AboutGard_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello) && GrayBeard_AboutGard > 0)
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_AboutGard_info()
{
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_00");	//Как ты относишься к Гарду?
	AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_01");	//КАПИТАНУ Гарду, сопляк! Запомни! Это для своих он просто Гард, а для тебя капитан Гард. Уяснил?
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_02");	//Чего ж тут непонятного? Как ты относишься к КАПИТАНУ Гарду?
	AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_03");	//Ну, он хороший лидер, знаменитый пират. Лишь только его слава бежит впереди моей, как это ни прискорбно. Наши с ним имена гремят по всему Миртанскому морю, внушая ужас торговцам. Мы…
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_04");	//(бормочет) Опять он за свое.
	AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_05");	//Мы два самых ужасных пирата во всем Мордраге.
	Info_ClearChoices(DIA_GrayBeard_AboutGard);
	Info_AddChoice(DIA_GrayBeard_AboutGard,"Хватит!",DIA_GrayBeard_AboutGard_Enough);
	Info_AddChoice(DIA_GrayBeard_AboutGard,"(слушать дальше)",DIA_GrayBeard_AboutGard_Continue);
};

//Запускается, если выбрана реплика "Хватит!" в диалоге с Серой Бородой "Как ты относишься к Гарду?"

func void DIA_GrayBeard_AboutGard_Enough()
{
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_Enough_15_00");	//Хватит! Мне идти надо, потом расскажешь.
	GrayBeard_AboutGard_Ended = TRUE;
	AI_StopProcessInfos(self);
};

//Высчитывает на каком моменте Серая Борода закончил историю, и продолжает ее

func void DIA_GrayBeard_AboutGard_Continue()
{
	if (GrayBeard_AboutGard == 1)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //На чем я остановился? А, да. Так вот.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_06");	//Вот помню случай был. Я со своим предыдущим капитаном встретил один корабль.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_07");	//Мы взяли его на абордаж, а он оказался военным. Враги окружили нас.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_08");	//Все наши полегли, кроме меня и капитана.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"Хватит!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(слушать дальше)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 2)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //На чем я остановился? А, да. Так вот.
			GrayBeard_AboutGard = FALSE;
		};
		//Создаем в инвентаре Серой Бороды Грог
		CreateInvItem(self,ItFo_Addon_Grog);
		//Серая Борода выпивает грог
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_09");	//Мы с ним встали спиной к спине у мачты и отбивались от превосходящего противника.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_10");	//Подобно волнам в штормовом море, кидались на нас враги.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_11");	//Руки наши были по локоть в крови, лезвия сабель стали красными.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"Хватит!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(слушать дальше)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 3)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //На чем я остановился? А, да. Так вот.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_12");	//Пронзенный тремя копьями, капитан пал, а я, получив три раны, едва стоял на ногах.
		//Создаем в инвентаре Серой Бороды Грог
		CreateInvItem(self,ItFo_Addon_Grog);
		//Серая Борода выпивает грог
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_13");	//А враги все не кончались. И вот передо мной встал сам капитан вражеского судна.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_14");	//Мы с ним рубились долго, не час и не два. Оба усталые и взмокшие, мы кое-как стояли на ногах.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"Хватит!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(слушать дальше)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 4)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //На чем я остановился? А, да. Так вот.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_15");	//Наконец мой враг сделал ошибку, и я пронзил его своей саблей насквозь.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_16");	//Тотчас же на меня кинулись остальные. Я был слишком ослаблен, чтобы продолжать схватку и, разбежавшись, прыгнул в море.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_17");	//К счастью, сгустилась темнота. Я зацепился за обломок реи и стал загребать воду руками.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_18");	//Целые сутки я находился в воде, и, когда уже собирался отпустить руки от бессилия, мне явилось спасение.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_19");	//Капитан Гард подобрал меня на своем судне и, выслушав мою историю, предложил мне вступить в его команду. Я согласился, и с тех самых пор являюсь самым почетным членом его экипажа. прыгнул в море.
		AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_20");	//И это все?
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_21");	//Ну да! Могу рассказать еще один случай, когда мы искали одни древние сокровища. В общем…
		AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_22");	//Нет, спасибо, но я тороплюсь. Как-нибудь в другой раз
		GrayBeard_AboutGard = 0;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
	};
};

// Продолжение рассказа Серой Бороды о капитане Гарде. Появляется, если прервать рассказ репликой "Хватит!"
// nr = 3

instance DIA_GrayBeard_AboutGard_Run(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 3;
	permanent = TRUE;
	condition = DIA_GrayBeard_AboutGard_Run_condition;	
	information = DIA_GrayBeard_AboutGard_Run_info;
	description = "Ты что-то рассказывал про Гарда.";
};

func int DIA_GrayBeard_AboutGard_Run_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_AboutGard) && (GrayBeard_AboutGard_Ended == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_AboutGard_Run_info()
{
	AI_Output(other,self,"DIA_GrayBeard_AboutGard_Run_15_00");	//Ты что-то рассказывал про Гарда.
	if (GrayBeard_AboutGard == 1)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //На чем я остановился? А, да. Так вот.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_06");	//Вот помню случай был. Я со своим предыдущим капитаном встретил один корабль.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_07");	//Мы взяли его на абордаж, а он оказался военным. Враги окружили нас.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_08");	//Все наши полегли, кроме меня и капитана.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"Хватит!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(слушать дальше)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 2)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //На чем я остановился? А, да. Так вот.
			GrayBeard_AboutGard = FALSE;
		};
		//Создаем в инвентаре Серой Бороды Грог
		CreateInvItem(self,ItFo_Addon_Grog);
		//Серая Борода выпивает грог
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_09");	//Мы с ним встали спиной к спине у мачты и отбивались от превосходящего противника.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_10");	//Подобно волнам в штормовом море, кидались на нас враги.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_11");	//Руки наши были по локоть в крови, лезвия сабель стали красными.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"Хватит!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(слушать дальше)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 3)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //На чем я остановился? А, да. Так вот.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_12");	//Пронзенный тремя копьями, капитан пал, а я, получив три раны, едва стоял на ногах.
		//Создаем в инвентаре Серой Бороды Грог
		CreateInvItem(self,ItFo_Addon_Grog);
		//Серая Борода выпивает грог
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_13");	//А враги все не кончались. И вот передо мной встал сам капитан вражеского судна.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_14");	//Мы с ним рубились долго, не час и не два. Оба усталые и взмокшие, мы кое-как стояли на ногах.
		GrayBeard_AboutGard = GrayBeard_AboutGard + 1;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"Хватит!",DIA_GrayBeard_AboutGard_Enough);
		Info_AddChoice(DIA_GrayBeard_AboutGard,"(слушать дальше)",DIA_GrayBeard_AboutGard_Continue);
	}
	else if (GrayBeard_AboutGard == 4)
	{
		if (GrayBeard_AboutGard == TRUE)
		{
			AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_23"); //На чем я остановился? А, да. Так вот.
			GrayBeard_AboutGard = FALSE;
		};
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_15");	//Наконец мой враг сделал ошибку, и я пронзил его своей саблей насквозь.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_16");	//Тотчас же на меня кинулись остальные. Я был слишком ослаблен, чтобы продолжать схватку и, разбежавшись, прыгнул в море.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_17");	//К счастью, сгустилась темнота. Я зацепился за обломок реи и стал загребать воду руками.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_18");	//Целые сутки я находился в воде, и, когда уже собирался отпустить руки от бессилия, мне явилось спасение.
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_19");	//Капитан Гард подобрал меня на своем судне и, выслушав мою историю, предложил мне вступить в его команду. Я согласился, и с тех самых пор являюсь самым почетным членом его экипажа. прыгнул в море.
		AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_20");	//И это все?
		AI_Output(self,other,"DIA_GrayBeard_AboutGard_13_21");	//Ну да! Могу рассказать еще один случай, когда мы искали одни древние сокровища. В общем…
		AI_Output(other,self,"DIA_GrayBeard_AboutGard_15_22");	//Нет, спасибо, но я тороплюсь. Как-нибудь в другой раз
		GrayBeard_AboutGard = 0;
		Info_ClearChoices(DIA_GrayBeard_AboutGard);
	};
};

// "Что вы здесь забыли?". Активируется после первого диалога с Серой Бородой
// nr = 4

instance DIA_GrayBeard_WhatAreYouDoingHere(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 4;
	permanent = FALSE;
	condition = DIA_GrayBeard_WhatAreYouDoingHere_condition;	
	information = DIA_GrayBeard_WhatAreYouDoingHere_info;
	description = "Что вы здесь забыли?";
};

func int DIA_GrayBeard_WhatAreYouDoingHere_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WhatAreYouDoingHere_info()
{
	AI_Output(other,self,"DIA_GrayBeard_WhatAreYouDoingHere_15_00");	//Что вы здесь забыли?
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_01");	//Вот и я о том же себя спрашиваю! Я, знаменитый пират Серая Борода, вынужден прозябать на этом забытом всеми богами клочке суши, где даже нормальной выпивки нету. А ведь я лучший абордажник в этой чертовой части света!
	AI_Output(other,self,"DIA_GrayBeard_WhatAreYouDoingHere_15_02");	//А где ваш корабль?
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_03");	//Проклятые орки отправили его на дно. Ух, попадись они мне – я их голыми руками передушу! Если бы меня в тот момент не сломила на кровать лихорадка, то итог того противостояния был бы совсем другим. 
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_04");	//Хотя я и в таком состоянии смог завалить двоих, прежде чем меня силком усадили на шлюпку, и мы уплыли. С тех пор мы вынуждены торчать в этом аду.
	AI_Output(other,self,"DIA_GrayBeard_WhatAreYouDoingHere_15_05");	//Захватывающая история! Прямо-таки пробирает до глубины души. Особенно в том месте, где ты заболел.
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_06");	//(угрожающе) Насмехаешься парень? Я, Серая Борода, не отличаюсь терпением!
	AI_Output(other,self,"DIA_GrayBeard_WhatAreYouDoingHere_15_07");	//Да что ты, и в мыслях не было насмехаться над такой великой личностью.
	AI_Output(self,other,"DIA_GrayBeard_WhatAreYouDoingHere_13_08");	//То-то же!
};

// Продажа Грога. Появляется после первого диалога с Серой Бородой
// nr = 

instance DIA_GrayBeard_SellGrog(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 5;
	permanent = TRUE;
	condition = DIA_GrayBeard_SellGrog_condition;	
	information = DIA_GrayBeard_SellGrog_info;
	description = "(продать грог)";
};

func int DIA_GrayBeard_SellGrog_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_SellGrog_info()
{
	AI_Output(other,self,"DIA_GrayBeard_SellGrog_15_00");	//У меня есть пара бутылок грога для тебя.
	AI_Output(self,other,"DIA_GrayBeard_SellGrog_13_01");	//Давай сюда!
	Info_ClearChoices(DIA_GrayBeard_SellGrog);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
	Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
};

// Запускается при выборе реплики "У меня ничего нет." в диалоге Серой Бороды о продаже Грога

func void DIA_GrayBeard_SellGrog_Nothing()
{
	AI_Output(other,self,"DIA_GrayBeard_SellGrog_Nothing_15_00");	//У меня ничего нет.
	AI_Output(self,other,"DIA_GrayBeard_SellGrog_Nothing_13_01");	//Тьфу ты! Зачем тогда отвлекаешь меня? У меня и без того полно дел.
	AI_StopProcessInfos(self);
};

// Запускается при выборе реплики "Продать все" в диалоге с Седой Бородой о продаже грога

func void DIA_GrayBeard_SellGrog_All()
{
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		var int Player_Grog; Player_Grog = Npc_HasItems(other,ItFo_Addon_Grog);
		B_GiveInvItems(other,self,ItFo_Addon_Grog,Player_Grog);
		// Если нужно сделать так, чтобы игрок мог забирать Грог при избиение Серой Бороды - поставьте комментарий к следующей строке
		Npc_RemoveInvItems(self,ItFo_Addon_Grog,Player_Grog);
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_00");	//(жадно) Давай сюда!
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
	}
	else
	{
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_01");	//(жадно) Эй! Ты пытаешься меня обмануть? Приходи, когда у тебя действительно будет грог.
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
	};
};

// Запускается при выборе реплики "Продать 10 бутылок" в диалоге с Седой Бородой о продаже грога

func void DIA_GrayBeard_SellGrog_Ten()
{
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 10)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,10);
		// Если нужно сделать так, чтобы игрок мог забирать Грог при избиение Серой Бороды - поставьте комментарий к следующей строке
		Npc_RemoveInvItems(self,ItFo_Addon_Grog,10);
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_00");	//(жадно) Давай сюда!
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
	}
	else
	{
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_01");	//(жадно) Эй! Ты пытаешься меня обмануть? Приходи, когда у тебя действительно будет грог.
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
	};
};

// Запускается при выборе реплики "Продать 5 бутылок" в диалоге с Седой Бородой о продаже грога

func void DIA_GrayBeard_SellGrog_Five()
{
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 5)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,5);
		// Если нужно сделать так, чтобы игрок мог забирать Грог при избиение Серой Бороды - поставьте комментарий к следующей строке
		Npc_RemoveInvItems(self,ItFo_Addon_Grog,5);
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_00");	//(жадно) Давай сюда!
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
	}
	else
	{
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_01");	//(жадно) Эй! Ты пытаешься меня обмануть? Приходи, когда у тебя действительно будет грог.
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
	};
};

// Запускается при выборе реплики "Продать 1 бутылку" в диалоге с Седой Бородой о продаже грога

func void DIA_GrayBeard_SellGrog_One()
{
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		// Если нужно сделать так, чтобы игрок мог забирать Грог при избиение Серой Бороды - поставьте комментарий к следующей строке
		Npc_RemoveInvItems(self,ItFo_Addon_Grog,1);
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_00");	//(жадно) Давай сюда!
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
	}
	else
	{
		AI_Output(self,other,"DIA_GrayBeard_SellGrog_Sell_13_01");	//(жадно) Эй! Ты пытаешься меня обмануть? Приходи, когда у тебя действительно будет грог.
		Info_ClearChoices(DIA_GrayBeard_SellGrog);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"У меня ничего нет.",DIA_GrayBeard_SellGrog_Nothing);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать все.",DIA_GrayBeard_SellGrog_All);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 10 бутылок.",DIA_GrayBeard_SellGrog_Ten);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 5 бутылок.",DIA_GrayBeard_SellGrog_Five);
		Info_AddChoice(DIA_GrayBeard_SellGrog,"Продать 1 бутылку.",DIA_GrayBeard_SellGrog_One);
	};
};

// "У тебя озадаченный вид.". Появляется после первого диалога с Седой Бородой
// nr = 6

instance DIA_GrayBeard_SkeletonHunting(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 6;
	permanent = FALSE;
	condition = DIA_GrayBeard_SkeletonHunting_condition;	
	information = DIA_GrayBeard_SkeletonHunting_info;
	description = "У тебя озадаченный вид.";
};

func int DIA_GrayBeard_SkeletonHunting_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_Hello))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_SkeletonHunting_info()
{
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_15_00");	//У тебя озадаченный вид. Может, нужна помощь?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_01");	//Эх, никогда бы не подумал, что я, Серая Борода, скажу такое. Но да, мне действительно нужна помощь.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_15_02");	//Расскажешь?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_03");	//(помедлив) Хм, ну да ладно. Черт с тобой! Когда мы вынужденно высадились на этом клочке суши, я расспросил одного крестьянина про местные сокровища. Тот долго отнекивался, но с кинжалом у горла рассказал мне про древний склеп на кладбище. 
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_04");	//В этом склепе похоронен один величайший герой древности со своим волшебным призрачным мечом. Говорят, что ни один блок или защита не могут сдержать удар этого меча.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_15_05");	//И ты хочешь добыть этот меч себе.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_06");	//Да, шныг тебя подери, да! Я в тот же день предпринял ходку к этому склепу. Провозившись весь день там, я не нашел ничего интересного.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_07");	//Я уже было решил, что крестьянин наврал мне, лишь бы избавиться от меня, как вдруг, когда уже сгустилась темнота, нашел небольшой каменный переключатель. Я нажал на него, и стоящий по центру саркофаг вдруг открылся.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_08");	//А из него начал вылезать закованный в латный доспех скелет. Мы схватились с ним в яростной схватке.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_09");	//Даже я, сам Серая Борода, лучший абордажник в этих чертовых водах, даже и близко не мог сравниться с ожившим мертвецом. На мое счастье, легенды врали, и мне вполне удавалось парировать его удары, хотя каждый удар призрачного меча портил мою саблю.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_10");	//Под конец схватки мое оружие вдруг разлетелось осколками, один из которых вонзился мне в руку. Мне пришлось бежать, чтобы выжить. Клянусь тебе, это был единственный случай, когда Серая Борода бежал от одного-единственного противника. 
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_11");	//С тех пор я еще два раза пробирался в тот склеп. Еще два раза сражался с тем скелетом, используя самые разные уловки, начиная от капканов и заканчивая магическими свитками. И оба раза я бежал поджав хвост!
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_12");	//Я, Серая Борода, лучший воин в команде Гарда, трижды потерпел поражение от какой-то кучки костей!
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_15_13");	//Занятная история. И ты больше не пытался пробраться в тот склеп?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_13_14");	//Пока нет. Я обдумываю свой следующий поход. В этот раз я разжился свитком «уничтожение нежити», он обязательно должен помочь.
	Info_ClearChoices(DIA_GrayBeard_SkeletonHunting);
	Info_AddChoice(DIA_GrayBeard_SkeletonHunting,"А, ну тогда удачи.",DIA_GrayBeard_SkeletonHunting_Deciline);
	Info_AddChoice(DIA_GrayBeard_SkeletonHunting,"Может, я могу помочь?",DIA_GrayBeard_SkeletonHunting_Accept);
};

//Запускается при выборе реплики "А, ну тогда удачи." в диалоге с Серой Бородой "У тебя озадаченный вид."

func void DIA_GrayBeard_SkeletonHunting_Deciline()
{
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Deciline_15_00");	//А, ну тогда удачи.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Deciline_13_00");	//Ничего, я еще заставлю того скелета сплясать под мою дудку.
};

//Запускается при выборе реплики "Может, я могу помочь?" в диалоге с Серой Бородой "У тебя озадаченный вид."

func void DIA_GrayBeard_SkeletonHunting_Accept()
{
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_00");	//Может, я могу помочь?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_01");	//Хм, это может сработать. Давай сделаем так: мы вместе идем в тот склеп, ты будешь меня прикрывать на тот случай, если что-то пойдет не так. Скажи, как только будешь готов.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_02");	//Эй, не торопись дружок. Сначала обговорим мою награду. Я не работаю за просто так.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_03");	//Нууу, я мог бы дать тебе золото. Сто золотых пойдет?
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_04");	//Ну и скупердяй же ты. Триста. Я сильно рискую, идя с тобой.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_05");	//(неуверенно) Может, двести?
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_06");	//Триста. Или я не иду.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_07");	//(колеблется) Ну, ладно. Деньги получишь после дела.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_08");	//Когда начинаем?
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_09");	//Приходи вечером.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_10");	//А зачем тянуть? Я и сейчас готов.
	AI_Output(self,other,"DIA_GrayBeard_SkeletonHunting_Accept_13_11");	//Потому что скелет появляется только в темное время суток. Поэтому вечером.
	AI_Output(other,self,"DIA_GrayBeard_SkeletonHunting_Accept_15_12");	//Хорошо.
	B_DSG_Log_OpenClose(TOPIC_DS2P_GhostsSword,LOG_MISSION,LOG_Running,TOPIC_DS2P_GhostsSword_Start);
};

//Запускается, если игрок прослушал диалог со Сью - "Как дела?"
// nr = 1

instance DIA_GrayBeard_SueBaby_Tria(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_SueBaby_Tria_condition;	
	information = DIA_GrayBeard_SueBaby_Tria_info;
	description = " ";
};

func int DIA_GrayBeard_SueBaby_Tria_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_HowDoYouDo))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_SueBaby_Tria_info()
{
	//Начинаем триалог между Серой Бородой, ГГ и Сью
	TRIA_Start();
	TRIA_Invite(SueBaby);
	TRIA_Invite(GrayBeard);
	TRIA_Next(GrayBeard);
	// self = GrayBeard, other = Hero
	AI_TurnToNpc(self,SueBaby);
	AI_TurnToNpc(SueBaby,self);
	AI_TurnToNpc(other,self);
	AI_Output(self,other,"DIA_GrayBeard_SueBaby_Tria_13_00");	//Ик! Ч-что это т-т-ты так выр… ик!.. ядилась, п-потаскушка? И-ик!
	TRIA_Next(SueBaby);
	// self = SueBaby, other = Hero
	AI_Output(self,other,"DIA_GrayBeard_SueBaby_Tria_17_01");	//Проваливай отсюда, покуда ноги целы, алкаш безбородый.
	TRIA_Next(GrayBeard);
	// self = GrayBeard, other = Hero
	AI_Output(self,other,"DIA_GrayBeard_SueBaby_Tria_13_02");	//М-молчать… ик! Да к-как ты с-сме… ик!.. смеешь со м-мной так… ик!.. разговаривать. Я т-тебя… ик!.. щас!
	AI_Output(other,self,"DIA_GrayBeard_SueBaby_Tria_15_03");	//Эй, ты! Невежливо разговаривать с дамами в таком тоне.
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_GrayBeard_SueBaby_Tria_13_04");	//А-а ты к-кто… ик!.. т-такой? З-защитник с-сирых… ик!.. и о-обездо… ик!.. ленных. Да я тебя… ик!.. одной л-левой у-урою… ик!
	AI_Output(other,self,"DIA_GrayBeard_SueBaby_Tria_15_05");	//Ну так иди сюда!
	DIAG_Reset();
	TRIA_Finish();
	SueBaby_GrayBeard_Fight = 1; // Инициализируем битву, чтобы сделать проверку в Unconscious
	// Серая Борода нападает на ГГ
	B_Attack(self,other,AR_NONE,0);
	// Сью нападает на Серую Бороду
	B_Attack(SueBaby,self,AR_NONE,0);
	AI_StopProcessInfos(self);
};

//"Я по поводу Сью.".Активируется, если взять квест "Проучить Серую Бороду".
// nr = 1

instance DIA_GrayBeard_AboutSue(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_AboutSue_condition;	
	information = DIA_GrayBeard_AboutSue_info;
	description = " ";
};

func int DIA_GrayBeard_AboutSue_condition()
{	
	if (MIS_DS2P_TeachGrayBeard == Log_Running)
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_AboutSue_info()
{
	AI_Output(other,self,"DIA_GrayBeard_AboutSue_15_00");	//Я по поводу Сью.
	AI_Output(self,other,"DIA_GrayBeard_AboutSue_13_01");	//Ты хочешь поговорить об этой потаскушке?
	AI_Output(other,self,"DIA_GrayBeard_AboutSue_15_02");	//Я бы воздержался от столь голословных утверждениях. Я хочу, чтобы ты отстал от нее раз и навсегда.
	AI_Output(self,other,"DIA_GrayBeard_AboutSue_13_03");	//Что?!! Да я сам Серая Борода! Как ты смеешь что-то мне указывать?!
	AI_Output(other,self,"DIA_GrayBeard_AboutSue_15_04");	//Может, успокоишься? Что ты орешь, будто падальщик в брачный период?
	if ((SueBaby_GrayBeard_Fight == 2) || (SueBaby_GrayBeard_Fight == 3) || (SueBaby_GrayBeard_Fight == 4)) //Если ГГ и Сью одолели Серую бороду в схватке
	{
		AI_Output(other,self,"DIA_GrayBeard_AboutSue_15_05");	//Тебе понравилось валяться в грязи?
		AI_Output(self,other,"DIA_GrayBeard_AboutSue_13_06");	//Ну все, держись! Ты тут один, а таких, как ты, я на завтрак по три штуки съедаю!
	}
	else if (SueBaby_GrayBeard_Fight == 5)
	{
		AI_Output(self,other,"DIA_GrayBeard_AboutSue_13_07");	//Вы вдвоем-то не смогли одолеть меня одного, что неудивительно, а теперь ты в одиночку нарываешься на драку? Держись, парень, сейчас ты познаешь весь мой гнев.
	};
	//Серая Борода атакует ГГ
	B_Attack(self,other,AR_NONE,0);
	//Инициализируем битву, чтобы проверить - кто вырубится
	GrayBeard_AttackIsOver = FALSE;
	AI_StopProcessInfos(self);
};

//Запускается, если ГГ проиграл бой

instance DIA_GrayBeard_LoseFight(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_LoseFight_condition;	
	information = DIA_GrayBeard_LoseFight_info;
	description = " ";
};

func int DIA_GrayBeard_LoseFight_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) && (GrayBeard_AttackNum > 0) && (GrayBeard_AttackWinner == 1))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_LoseFight_info()
{
	AI_Output(self,other,"DIA_GrayBeard_LoseFight_13_00");	//Я же говорил, что ты слабак и размазня. Я – Серая Борода, а не какой-нибудь пастух или пахарь. Меня так просто не взять. А теперь вали отсюда и радуйся, что остался жив.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Failed,TOPIC_DS2P_TeachGrayBeard_Failed);
	AI_StopProcessInfos(self);
};

//"И как? Желание впустую трепаться не пропало?".Активируется, если ГГ выйграл первый бой
// nr = 1

instance DIA_GrayBeard_WinOne(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_WinOne_condition;	
	information = DIA_GrayBeard_WinOne_info;
	description = "И как? Желание впустую трепаться не пропало?";
};

func int DIA_GrayBeard_WinOne_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) && (GrayBeard_AttackNum == 1) && (GrayBeard_AttackWinner == 2))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WinOne_info()
{
	AI_Output(other,self,"DIA_GrayBeard_WinOne_15_00");	//И как? Желание впустую трепаться не пропало?
	AI_Output(self,other,"DIA_GrayBeard_WinOne_13_01");	//А, чтоб тебя шныг задрал! Что тебе нужно?
	AI_Output(other,self,"DIA_GrayBeard_WinOne_15_02");	//Просто хочу, чтобы ты, наконец, отстал от Сью. Раз и навсегда.
	AI_Output(self,other,"DIA_GrayBeard_WinOne_13_03");	//С чего ты взял, что я послушаюсь тебя? То, что ты побил меня, еще не значит, что я, Серая Борода, буду подобно смирной овечке слепо исполнять твои прихоти.
	AI_Output(other,self,"DIA_GrayBeard_WinOne_15_04");	//Что ж, видно ты не понял. Тогда тебе не помешает еще одна трепка.
	//Серая Борода атакует ГГ
	B_Attack(self,other,AR_NONE,0);
	//Инициализируем битву, чтобы проверить - кто вырубится
	GrayBeard_AttackIsOver = FALSE;
	GrayBeard_AttackWinner = 0;
	AI_StopProcessInfos(self);
};

//"Теперь попробуем поговорить еще раз.".Активируется, если ГГ выйграл второй бой
// nr = 1

instance DIA_GrayBeard_WinTwo(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_WinTwo_condition;	
	information = DIA_GrayBeard_WinTwo_info;
	description = "И как? Желание впустую трепаться не пропало?";
};

func int DIA_GrayBeard_WinTwo_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) && (GrayBeard_AttackNum == 2) && (GrayBeard_AttackWinner == 2))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WinTwo_info()
{
	AI_Output(other,self,"DIA_GrayBeard_WinTwo_15_00");	//Теперь попробуем поговорить еще раз.
	AI_Output(self,other,"DIA_GrayBeard_WinTwo_13_01");	//Аргх, будь ты проклят! Отстань уже от меня!
	AI_Output(other,self,"DIA_GrayBeard_WinTwo_15_02");	//Отстану, но только когда ты пообещаешь больше не трогать Малышку Сью. Поверь, я могу колотить тебя так хоть до скончания века.
	AI_Output(self,other,"DIA_GrayBeard_WinTwo_13_03");	//Я не боюсь боли!
	AI_Output(other,self,"DIA_GrayBeard_WinTwo_15_04");	//Ладно, ты сам напросился.
	//Серая Борода атакует ГГ
	B_Attack(self,other,AR_NONE,0);
	//Инициализируем битву, чтобы проверить - кто вырубится
	GrayBeard_AttackIsOver = FALSE;
	GrayBeard_AttackWinner = 0;
	AI_StopProcessInfos(self);
};

//"Жив, висельник?".Активируется, если ГГ выйграл третий бой
// nr = 1

instance DIA_GrayBeard_WinThree(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = TRUE;
	condition = DIA_GrayBeard_WinThree_condition;	
	information = DIA_GrayBeard_WinThree_info;
	description = "Жив, висельник?";
};

func int DIA_GrayBeard_WinThree_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) && (GrayBeard_AttackNum == 3) && (GrayBeard_AttackWinner == 2))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_WinThree_info()
{
	AI_Output(other,self,"DIA_GrayBeard_WinThree_15_00");	//Жив, висельник?
	AI_Output(self,other,"DIA_GrayBeard_WinThree_13_01");	//Ох, моя голова!
	AI_Output(other,self,"DIA_GrayBeard_WinThree_15_02");	//Не передумал еще?
	AI_Output(self,other,"DIA_GrayBeard_WinThree_13_03");	//Иди к черту!
	AI_Output(other,self,"DIA_GrayBeard_WinThree_15_04");	//Ладно, ты сам напросился.
	AI_StopProcessInfos(self);
};

// "Я опять по поводу Сью.". Активируется, если ГГ знает о соревновании из диалога Сью
// nr = 1

instance DIA_GrayBeard_AgainAboutSue(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_AgainAboutSue_condition;	
	information = DIA_GrayBeard_AgainAboutSue_info;
	description = "Я опять по поводу Сью.";
};

func int DIA_GrayBeard_AgainAboutSue_condition()
{	
	if (SueBaby_AboutGrayBeardSolution == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_AgainAboutSue_info()
{
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_00");	//Я опять по поводу Сью.
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_01");	//Что?! Я же сказал, что ты меня не переубедишь.
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_02");	//Сью предложила устроить соревнования. Я буду выступать от ее имени. Если выигрываю я, то ты навсегда отстаешь от Малышки Сью. Если ты, то она выполнит одно твое желание. Любое.
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_03");	//Соревнования? Хм, мне надо подумать.
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_04");	//(презрительно) Я так и думал, что Серая Борода трус!
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_05");	//(гневно) ЧТО?!! Я трус?!! Да я храбрее вас всех, вместе взятых! Я самый лучший боец в Миртанском море!
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_06");	//Но это не отменяет того факта, что ты боишься устроить соревнования.
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_07");	//ЧТО?!! Я тебе покажу, что я ничего не боюсь! Давай, устроим эти соревнования прямо сейчас!
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_08");	//Так ты согласен?
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_09");	//Да!!! Черт тебя подери! Да!
	AI_Output(other,self,"DIA_GrayBeard_AgainAboutSue_15_10");	//Тогда подожди немного – я поищу зрителей. Ты же не хочешь, чтобы такое событие прошло незамеченным?
	AI_Output(self,other,"DIA_GrayBeard_AgainAboutSue_13_11");	//Давай быстрее, шныжий выродок.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_01);
	AI_StopProcessInfos(self);
};

// "Ну что, начнем?". Активируется, если ГГ знает о соревновании и пригласил 2-3 зрителя
// Если Грег жив - обязательно 3 зрителя, если нет - то 2
// nr = 1

instance DIA_GrayBeard_StartCompetition(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	condition = DIA_GrayBeard_StartCompetition_condition;	
	information = DIA_GrayBeard_StartCompetition_info;
	description = "Ну что, начнем?";
};

func int DIA_GrayBeard_StartCompetition_condition()
{	
	if (Npc_KnowsInfo(other,DIA_Symon_GrayBeardCompetition) && Npc_KnowsInfo(other,DIA_Karah_GrayBeardCompetition))
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			if (Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition_Gold))
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		};
	};
};

func void DIA_GrayBeard_StartCompetition_info()
{
	TRIA_Start();
	TRIA_Invite(GrayBeard);
	if (!Npc_IsDead(PIR_201_DS2P_Greg)) // Если Грег мертв, то говорит Карах
	{
		TRIA_Invite(Greg);
	}
	else
	{
		TRIA_Invite(Karah);
	};
	AI_Output(other,self,"DIA_GrayBeard_StartCompetition_15_00");	//Ну что, начнем?
	AI_Output(self,other,"DIA_GrayBeard_StartCompetition_13_01");	//Давай, шныжья печенка! Я сделаю тебя по всем пунктам.
	if (!Npc_IsDead(PIR_201_DS2P_Greg))
	{
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_GrayBeard_StartCompetition_17_02");	//Итак, первый этап – охота. Ваша задача найти, выследить и убить стаю мракорисов, обитающих в пещере на западе.
		AI_Output(self,other,"DIA_GrayBeard_StartCompetition_17_03");	//В качестве доказательства надо принести их рога. Все ясно? Тогда бегом, гоблиновы выкормышы, шевелите плавниками!
	}
	else
	{
		TRIA_Next(Karah);
		AI_Output(self,other,"DIA_GrayBeard_StartCompetition_17_04");	//Итак, первый этап – охота. Ваша задача найти, выследить и убить стаю мракорисов, обитающих в пещере на западе.
		AI_Output(self,other,"DIA_GrayBeard_StartCompetition_17_05");	//В качестве доказательства надо принести их рога. Все ясно? Тогда бегом, гоблиновы выкормышы, шевелите плавниками!
	};
	DIAG_Reset();
	TRIA_Finish();
	// Ставим другое расписание для Серой Бороды
	B_StartOtherRoutine(self,"COMP_SHADOWBEAST_01");
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_07);
	// Инициализируем соревнование, чтобы Серая Борода мог забирать рога мракорисов у упавшего ГГ
	GB_CompetitionState = 1;
	GB_CompetitionTime_01 = C_GetTime_Plus(6,0,1);
	AI_StopProcessInfos(self);
};

// Запускается, если попытаемся поговорить с Серой Бородой во время первого испытания
// nr = 1

instance DIA_GrayBeard_Comp01GoAway(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = TRUE;
	important = TRUE;
	condition = DIA_GrayBeard_Comp01GoAway_condition;	
	information = DIA_GrayBeard_Comp01GoAway_info;
	description = " ";
};

func int DIA_GrayBeard_Comp01GoAway_condition()
{	
	if ((GB_CompetitionState == 1) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_Comp01GoAway_info()
{
	AI_Output(self,other,"DIA_GrayBeard_Comp01GoAway_13_00");	//Ха-ха, я успею первым!
	AI_StopProcessInfos(self);
};

// Запускается, если ГГ добыл рога мракорисов меньше, чем за 6 чаcов
// nr = 1

instance DIA_GrayBeard_KilledShadowBeast_01(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_KilledShadowBeast_01_condition;	
	information = DIA_GrayBeard_KilledShadowBeast_01_info;
	description = " ";
};

func int DIA_GrayBeard_KilledShadowBeast_01_condition()
{	
	if ((Npc_HasItems(hero,ItAt_DS2P_ShadowHorn_Competition) >= 3)
		 && (GB_CompetitionTime_01 < Wld_GetPassedTime(0)) && (GB_CompetitionState == 1))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_KilledSHadowBeast_01_info()
{
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_01_13_00");	//Черт! Как ты оказался здесь раньше меня?
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_01_15_01");	//Шустрее надо быть, дружок. Может, сразу признаешь свое поражение?
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_01_13_02");	//Вот еще! Я – Серая Борода! И я приказываю тебе отдать мне трофеи, иначе я намну тебе бока.
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_01_15_03");	//Вот как? Ну тогда попробуй отнять их силой!
	// Серая Борода нападает на ГГ
	B_Attack(self,other,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// Запускается, если ГГ встретил Серую Бороду по дороге обратно в лагерь
// nr = 1

instance DIA_GrayBeard_KilledShadowBeast_02(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_KilledShadowBeast_02_condition;	
	information = DIA_GrayBeard_KilledShadowBeast_02_info;
	description = " ";
};

func int DIA_GrayBeard_KilledShadowBeast_02_condition()
{	
	if ((GB_CompetitionState == 4) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_KilledSHadowBeast_02_info()
{
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_02_13_00");	//Ха-ха! Я успел раньше тебя! Серая Борода победил, как и всегда!
	Info_ClearChoices(DIA_GrayBeard_KilledShadowBeast_02);
	Info_AddChoice(DIA_GrayBeard_KilledShadowBeast_02,"Отдай мне рога мракорисов.",DIA_GrayBeard_KilledShadowBeast_02_Fight);
	Info_AddChoice(DIA_GrayBeard_KilledShadowBeast_02,"Тебе повезло.",DIA_GrayBeard_KilledShadowBeast_02_NoFight);
};

// Запускается, если выбрать реплику "Тебе повезло." в диалоге с Серой Бородой

func void DIA_GrayBeard_KilledShadowBeast_02_NoFight()
{
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_02_NoFight_15_00");	//Тебе просто повезло.
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_02_NoFight_13_01");	//Ха-ха, никакого везения! Чистая сноровка! Куда тебе тягаться с Серой Бородой, неудачник!
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Отдай мне рога мракорисов." в диалоге с Серой Бородой

func void DIA_GrayBeard_KilledShadowBeast_02_Fight()
{
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_02_Fight_15_00");	//Отдай мне рога мракорисов.
	AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_02_Fight_13_01");	//Что?! Я их добыл, этой мой трофей.
	AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_02_Fight_15_02");	//Не хочешь по-хорошему, будет по-плохому.
	// Серая Борода нападает на ГГ
	B_Attack(self,other,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// Активируетася, если после первого испытания Серая Борода уже в лагере
// nr = 1

instance DIA_GrayBeard_KilledShadowBeast_03(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_KilledShadowBeast_03_condition;	
	information = DIA_GrayBeard_KilledShadowBeast_03_info;
	description = " ";
};

func int DIA_GrayBeard_KilledShadowBeast_03_condition()
{	
	if (GB_CompetitionState > 1 && Npc_IsInState(self,ZS_Talk) && Hlp_StrCmp(Npc_GetNearestWP(self),"TEST_WP")) //UNFINISHED - Надо вписать вэйпоинт из расписания START
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_KilledShadowBeast_03_info()
{
	TRIA_Start();
	TRIA_Invite(GrayBeard);
	if (!Npc_IsDead(PIR_201_DS2P_Greg)) // Если Грег мертв, то реплики говорит Карах
	{
		TRIA_Invite(Greg);
	}
	else
	{
		TRIA_Invite(Karah);
	};
	if ((GB_CompetitionState == 6) || (GB_CompetitionState == 2)) // Если ГГ принес рога, и не отобрал их у Серой Бороды
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_00");	//Итак, ты, я вижу, преуспел в охоте. В первом этапе Серая Борода терпит поражение, наш безымянный друг получает одно очко.
			GB_Comp_01_Winner = 1;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_12);
		}
		else
		{
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_01");	//Итак, ты, я вижу, преуспел в охоте. В первом этапе Серая Борода терпит поражение, наш безымянный друг получает одно очко.
			GB_Comp_01_Winner = 1;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_12);
		};
	}
	else if (GB_CompetitionState == 3)
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_02");	//Итак, победителем объявляется Серая Борода. Он получает одно очко.
			AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_03_15_03");	//Так нечестно, я успел добрать до мракорисов раньше, а он отобрал у меня трофеи.
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_04");	//Главное – не только успеть первым, но и удержать победу в руках, дружок.
			GB_Comp_01_Winner = 2;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_13);
		}
		else
		{
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_05");	//Итак, победителем объявляется Серая Борода. Он получает одно очко.
			AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_03_15_03");	//Так нечестно, я успел добрать до мракорисов раньше, а он отобрал у меня трофеи.
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_06");	//Главное – не только успеть первым, но и удержать победу в руках,
			GB_Comp_01_Winner = 2;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_13);
		};
	}
	else if ((GB_CompetitionState == 7) || (GB_CompetitionState == 8))
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_07");	//Итак, победителем объявляется Серая Борода. Он получает одно очко.
			GB_Comp_01_Winner = 2;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_14);
		}
		else
		{
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_08");	//Итак, победителем объявляется Серая Борода. Он получает одно очко.
			GB_Comp_01_Winner = 2;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_14);
		};
	}
	else if (GB_CompetitionState == 5)
	{
		if (!Npc_IsDead(PIR_201_DS2P_Greg))
		{
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_09");	//Победа в этом этапе присуждается нашему безымянному другу, он получает одно очко.
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(self,Greg);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_13_10");	//Проклятье! Он обворовал меня!!!
			TRIA_Next(Greg);
			AI_TurnToNpc(self,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_11");	//Значит, в следующий раз не будешь спать и щелкать клювом.
			AI_TurnToNpc(self,other);
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_15);
		}
		else
		{
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_12");	//Победа в этом этапе присуждается нашему безымянному другу, он получает одно очко.
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(self,Karah);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_13_10");	//Проклятье! Он обворовал меня!!!
			TRIA_Next(Greg);
			AI_TurnToNpc(self,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_13");	//Значит, в следующий раз не будешь спать и щелкать клювом.
			AI_TurnToNpc(self,other);
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_15);
		};
	};
	if (!Npc_IsDead(PIR_201_DS2P_Greg))
	{
		GB_CompetitionState = 9;
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_14");	//Второй этап будет полегче. Вам не придется бегать по лесам и полям, чтобы найти противника. Вам предстоит сразиться друг с другом. В обычной ситуации вы бы сражались стоя на поперечной рее, но так как на единственном корабле свирепствует чума, придется драться на земле. Готовы?
		AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_03_15_15");	//Готов.
		TRIA_Next(GrayBeard);
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_13_16");	//Я ему сейчас задам.
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_17");	//Тогда начали!
	}
	else
	{
		GB_CompetitionState = 9;
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_18");	//Второй этап будет полегче. Вам не придется бегать по лесам и полям, чтобы найти противника. Вам предстоит сразиться друг с другом. В обычной ситуации вы бы сражались стоя на поперечной рее, но так как на единственном корабле свирепствует чума, придется драться на земле. Готовы?
		AI_Output(other,self,"DIA_GrayBeard_KilledShadowBeast_03_15_15");	//Готов.
		TRIA_Next(GrayBeard);
		AI_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_13_16");	//Я ему сейчас задам.
		TRIA_Next(Karah);
		AI_Output(self,other,"DIA_GrayBeard_KilledShadowBeast_03_17_19");	//Тогда начали!
	};
	DIAG_Reset();
	TRIA_Finish();
	// Серая Борода нападет на ГГ
	B_Attack(self,other,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// Запускается, когда кто-либо победил во втором испытании
// nr = 1

instance DIA_GrayBeard_SecondCompetition(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_SecondCompetition_condition;	
	information = DIA_GrayBeard_SecondCompetition_info;
	description = " ";
};

func int DIA_GrayBeard_SecondCompetition_condition()
{	
	if ((GB_CompetitionState == 9) && (GB_Comp_02_Winner > 0) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_SecondCompetition_info()
{
	TRIA_Start();
	TRIA_Invite(GrayBeard);
	if (!Npc_IsDead(PIR_201_DS2P_Greg)) // Если Грег мертв, то говорит Карах
	{
		TRIA_Invite(Greg);
		if (GB_Comp_02_Winner == 1)
		{
			AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_00");	//Серая Борода проиграл. Его противник получает одно очко.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_16);
		}
		else
		{
			AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_01");	//Победа присуждается Серой Бороде.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_17);
		};
		AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_02");	//Теперь третий этап. Совместим приятное с полезным. Участники соревнования будут пить до тех пор, пока один из них не свалится на землю. Вы готовы?
		AI_Output(other,self,"DIA_GrayBeard_SecondCompetition_15_03");	//Да.
		TRIA_Next(GrayBeard);
		AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_13_04");	//Всегда готов. Уж в этом я абсолютный чемпион.
		Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
		Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(выпить)",DIA_GrayBeard_DrinkCompetition);
		DIAG_Reset();
		TRIA_Finish();
	}
	else
	{
		TRIA_Invite(Karah);
		if (GB_Comp_02_Winner == 1)
		{
			AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_03");	//Серая Борода проиграл. Его противник получает одно очко.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_16);
		}
		else
		{
			AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_04");	//Победа присуждается Серой Бороде.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_17);
		};
		AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_17_05");	//Теперь третий этап. Совместим приятное с полезным. Участники соревнования будут пить до тех пор, пока один из них не свалится на землю. Вы готовы?
		AI_Output(other,self,"DIA_GrayBeard_SecondCompetition_15_03");	//Да.
		TRIA_Next(GrayBeard);
		AI_Output(self,other,"DIA_GrayBeard_SecondCompetition_13_04");	//Всегда готов. Уж в этом я абсолютный чемпион.
		Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
		Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(выпить)",DIA_GrayBeard_DrinkCompetition);
		DIAG_Reset();
		TRIA_Finish();
	};
};

func void DIA_GrayBeard_DrinkCompetition()
{
	var int UnconTime;
	if (GB_DrinkCompetition == 0)
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		CreateInvItem(self,ItFo_Addon_Grog);
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_GrayBeard_DrinkCompetition_13_00");	//Ух! Хорошо пошла. Еще!
		GB_DrinkCompetition = GB_DrinkCompetition + 1;
		Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
		Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(выпить)",DIA_GrayBeard_DrinkCompetition);
	}
	else if (GB_DrinkCompetition == 1)
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		CreateInvItem(self,ItFo_Addon_Grog);
		B_UseItem(self,ItFo_Addon_Grog);
		AI_Output(other,self,"DIA_GrayBeard_DrinkCompetition_15_01");	//Ха! Не готов еще сдаться, безбородый?
		GB_DrinkCompetition = GB_DrinkCompetition + 1;
		Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
		Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(выпить)",DIA_GrayBeard_DrinkCompetition);
	}
	else if (GB_DrinkCompetition == 2)
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		if (C_Random(100) < GG_Fallen)
		{
			UnconTime = other.aivar[AIV_TIME_UNCONSCIOUS];
			other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
			Npc_DropUnconscious(other,0,other);
			other.aivar[AIV_TIME_UNCONSCIOUS] = UnconTime;
			GB_Comp_03_Winner = 2;
			AI_StopProcessInfos(self);
		}
		else
		{
			CreateInvItem(self,ItFo_Addon_Grog);
			B_UseItem(self,ItFo_Addon_Grog);
			AI_Output(self,other,"DIA_GrayBeard_DrinkCompetition_13_02");	//Что-то слабоват алкоголь, не штырит.
			GB_DrinkCompetition = GB_DrinkCompetition + 1;
			Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
			Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(выпить)",DIA_GrayBeard_DrinkCompetition);
		};
	}
	else if (GB_DrinkCompetition == 3)
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		if (C_Random(100) < GG_Fallen)
		{
			UnconTime = other.aivar[AIV_TIME_UNCONSCIOUS];
			other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
			Npc_DropUnconscious(other,0,other);
			other.aivar[AIV_TIME_UNCONSCIOUS] = UnconTime;
			GB_Comp_03_Winner = 2;
			AI_StopProcessInfos(self);
		}
		else
		{
			CreateInvItem(self,ItFo_Addon_Grog);
			B_UseItem(self,ItFo_Addon_Grog);
			AI_Output(other,self,"DIA_GrayBeard_DrinkCompetition_15_03");	//Я так еще долго могу.
			GB_DrinkCompetition = GB_DrinkCompetition + 1;
			Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
			Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(выпить)",DIA_GrayBeard_DrinkCompetition);
		};
	}
	else
	{
		CreateInvItem(other,ItFo_Addon_Grog);
		B_UseItem(other,ItFo_Addon_Grog);
		if (C_Random(100) < GG_Fallen)
		{
			UnconTime = other.aivar[AIV_TIME_UNCONSCIOUS];
			other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
			Npc_DropUnconscious(other,0,other);
			other.aivar[AIV_TIME_UNCONSCIOUS] = UnconTime;
			GB_Comp_03_Winner = 2;
			AI_StopProcessInfos(self);
		}
		else
		{
			CreateInvItem(self,ItFo_Addon_Grog);
			B_UseItem(self,ItFo_Addon_Grog);
			if (C_Random(100) < GrayBeard_Fallen)
			{
				UnconTime = self.aivar[AIV_TIME_UNCONSCIOUS];
				self.aivar[AIV_TIME_UNCONSCIOUS] = 3;
				Npc_DropUnconscious(self,0,other);
				self.aivar[AIV_TIME_UNCONSCIOUS] = UnconTime;
				GB_Comp_03_Winner = 1;
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(other,self,"DIA_GrayBeard_DrinkCompetition_15_04");	//Еще!
				GB_DrinkCompetition = GB_DrinkCompetition + 1;
				Info_ClearChoices(DIA_GrayBeard_SecondCompetition);
				Info_AddChoice(DIA_GrayBeard_SecondCompetition,"(выпить)",DIA_GrayBeard_DrinkCompetition);
			};
		};
	};
};

// Запускается, когда кто-либо победил в третьем испытании
// nr = 1

instance DIA_GrayBeard_ThirdCompetition(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_GrayBeard_ThirdCompetition_condition;	
	information = DIA_GrayBeard_ThirdCompetition_info;
	description = " ";
};

func int DIA_GrayBeard_ThirdCompetition_condition()
{	
	if (GB_Comp_03_Winner > 0)
	{
		return TRUE;
	};
};

func void DIA_GrayBeard_ThirdCompetition_info()
{
	const int GB_Wins = 0; // Победы Серой Бороды
	const int GG_Wins = 0; // Победы ГГ
	if (GB_Comp_01_Winner == 1)
	{
		GG_Wins = GG_Wins + 1;
	}
	else
	{
		GB_Wins = GB_Wins + 1;
	};
	if (GB_Comp_02_Winner == 1)
	{
		GG_Wins = GG_Wins + 1;
	}
	else
	{
		GB_Wins = GB_Wins + 1;
	};
	if (GB_Comp_03_Winner == 1)
	{
		GG_Wins = GG_Wins + 1;
	}
	else
	{
		GB_Wins = GB_Wins + 1;
	};
	TRIA_Start();
	TRIA_Invite(GrayBeard);
	if (!Npc_IsDead(PIR_201_DS2P_Greg)) // Если Грег мертв, то говорит Карах
	{
		TRIA_Invite(Greg);
		TRIA_Next(Greg);
		AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_00");	//Итак, пришло время подвести итоги.
		if (GB_Comp_03_Winner == 1) // Если победил ГГ
		{
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_01");	//Победа в этом этапе присуждается нашему безымянному другу. Эй, ребята, приведите-ка нашего слабака в чувство.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_18);
		}
		else
		{
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_02");	//В этот раз победу одержал Серая Борода.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_19);
		};
		if (GG_Wins > 1) // Если в соревновании победил ГГ
		{
			AI_TurnToNpc(Greg,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_03");	//Победу в соревновании одержал наш безымянный друг. Серая Борода, признаешь ли ты свое поражение?
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(GrayBeard,Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_04");	//Хм…
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_05");	//Ты проиграл.
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_06");	//Да, черт возьми! Признаю! Довольны?
			AI_TurnToNpc(other,GrayBeard);
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_07");	//Вполне.
			TRIA_Next(Greg);
			AI_TurnToNpc(Greg,other);
			AI_TurnToNpc(other,Greg);
			AI_TurnToNpc(GrayBeard,other);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_07");	//Итак, что же ты потребуешь от проигравшего?
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_08");	//Он уже знает. Условием было, что если выигрываю я, то он навсегда отстает от Малышки Сью.
			AI_TurnToNpc(Greg,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_09");	//Слышал, Борода? Выполнять придется, иначе мы заклеймим тебя, как человека, не выполняющего своих обязательств. Надо рассказывать, какие последствия тебя ожидают?
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(GrayBeard,Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_10");	// Нет, я отстану от нее и не заведу с ней разговор до тех пор, пока она сама не заговорит со мной. Так пойдет?
			AI_TurnToNpc(other,GrayBeard);
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_11");	//Вполне.
			AI_TurnToNpc(Greg,other);
			AI_TurnToNpc(GrayBeard,other);
			AI_TurnToNpc(other,Greg);
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_12");	//В таком случае соревнования объявляются закрытыми. Можем расходиться.
			GB_CompetitionState = 10;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_20);
			B_StartOtherRoutine(Greg,"START");
			B_StartOtherRoutine(Karah,"START");
			B_StartOtherRoutine(Symon,"START");
			DIAG_Reset();
			TRIA_Finish();
			AI_StopProcessInfos(self);
		}
		else // В соревновании победил Серая Борода
		{
			AI_TurnToNpc(other,Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_13");	//Победа в соревновании присуждается Серой Бороде.
			AI_TurnToNpc(GrayBeard,other);
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_14");	//Ха-ха! Я же говорил, что не тебе со мной тягаться, малец!
			AI_TurnToNpc(Greg,GrayBeard);
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_15");	//Что ты потребуешь от проигравшего?
			AI_TurnToNpc(GrayBeard,Greg);
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_16");	//Он выступал от имени Малышки Сью, и она будет отвечать передо мной, не он.
			TRIA_Next(Greg);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_17");	//Что ж, справедливо. Думаю я – да и все остальные – уже знаю, что ты потребуешь от нее.
			AI_TurnToNpc(Greg,other);
			AI_TurnToNpc(GrayBeard,other);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_18");	//Все согласны с таким исходом соревнований?
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_19");	//Признаю свой проигрыш.
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_20");	//Тогда можем расходиться.
			GB_CompetitionState = 11;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_21);
			B_StartOtherRoutine(Greg,"START");
			B_StartOtherRoutine(Karah,"START");
			B_StartOtherRoutine(Symon,"START");
			DIAG_Reset();
			TRIA_Finish();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		TRIA_Invite(Karah);
		TRIA_Next(Karah);
		AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_21");	//Итак, пришло время подвести итоги.
		if (GB_Comp_03_Winner == 1) // Если победил ГГ
		{
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_22");	//Победа в этом этапе присуждается нашему безымянному другу. Эй, ребята, приведите-ка нашего слабака в чувство.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_18);
		}
		else
		{
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_23");	//В этот раз победу одержал Серая Борода.
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_19);
		};
		if (GG_Wins > 1) // Если в соревновании победил ГГ
		{
			AI_TurnToNpc(Karah,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_24");	//Победу в соревновании одержал наш безымянный друг. Серая Борода, признаешь ли ты свое поражение?
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(GrayBeard,Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_04");	//Хм…
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_25");	//Ты проиграл.
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_06");	//Да, черт возьми! Признаю! Довольны?
			AI_TurnToNpc(other,GrayBeard);
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_07");	//Вполне.
			TRIA_Next(Karah);
			AI_TurnToNpc(Karah,other);
			AI_TurnToNpc(other,Karah);
			AI_TurnToNpc(GrayBeard,other);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_26");	//Итак, что же ты потребуешь от проигравшего?
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_08");	//Он уже знает. Условием было, что если выигрываю я, то он навсегда отстает от Малышки Сью.
			AI_TurnToNpc(Karah,GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_27");	//Слышал, Борода? Выполнять придется, иначе мы заклеймим тебя, как человека, не выполняющего своих обязательств. Надо рассказывать, какие последствия тебя ожидают?
			TRIA_Next(GrayBeard);
			AI_TurnToNpc(GrayBeard,Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_10");	// Нет, я отстану от нее и не заведу с ней разговор до тех пор, пока она сама не заговорит со мной. Так пойдет?
			AI_TurnToNpc(other,GrayBeard);
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_11");	//Вполне.
			AI_TurnToNpc(Karah,other);
			AI_TurnToNpc(GrayBeard,other);
			AI_TurnToNpc(other,Karah);
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_28");	//В таком случае соревнования объявляются закрытыми. Можем расходиться.
			GB_CompetitionState = 10;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_20);
			B_StartOtherRoutine(Karah,"START");
			B_StartOtherRoutine(Symon,"START");
			DIAG_Reset();
			TRIA_Finish();
			AI_StopProcessInfos(self);
		}
		else // В соревновании победил Серая Борода
		{
			AI_TurnToNpc(other,Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_29");	//Победа в соревновании присуждается Серой Бороде.
			AI_TurnToNpc(GrayBeard,other);
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_14");	//Ха-ха! Я же говорил, что не тебе со мной тягаться, малец!
			AI_TurnToNpc(Karah,GrayBeard);
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_30");	//Что ты потребуешь от проигравшего?
			AI_TurnToNpc(GrayBeard,Karah);
			TRIA_Next(GrayBeard);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_13_16");	//Он выступал от имени Малышки Сью, и она будет отвечать передо мной, не он.
			TRIA_Next(Karah);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_31");	//Что ж, справедливо. Думаю я – да и все остальные – уже знаю, что ты потребуешь от нее.
			AI_TurnToNpc(Karah,other);
			AI_TurnToNpc(GrayBeard,other);
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_32");	//Все согласны с таким исходом соревнований?
			AI_Output(other,self,"DIA_GrayBeard_ThirdCompetition_15_19");	//Признаю свой проигрыш.
			AI_Output(self,other,"DIA_GrayBeard_ThirdCompetition_17_33");	//Тогда можем расходиться.
			GB_CompetitionState = 11;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_21);
			B_StartOtherRoutine(Karah,"START");
			B_StartOtherRoutine(Symon,"START");
			DIAG_Reset();
			TRIA_Finish();
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_GrayBeard_AfterCompetition(C_Info)
{
	npc = PIR_208_DS2P_GrayBeard;
	nr = 1;
	condition = DIA_GrayBeard_AfterCompetition_condition;	
	information = DIA_GrayBeard_AfterCompetition_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};
func int DIA_GrayBeard_AfterCompetition_condition()
{
	if (GB_CompetitionState > 9)
	{	
		return TRUE;	
	};
};	

func void DIA_GrayBeard_AfterCompetition_info()
{
	if (GB_CompetitionState == 10) // Победа ГГ
	{
		AI_Output(self,other,"DIA_Karah_AfterCompetition_13_00");	//Радуйся своей победе, дружок. А теперь отстань от меня, пока я тебе челюсть не сломал.
	}
	else // Проигрыш ГГ
	{
		AI_Output(self,other,"DIA_Karah_AfterCompetition_13_01");	//Серая Борода вновь доказал, что он лучший. А ты иди, поплачь над своей никчемной жизнью, неудачник.
	};
};

/* UNFINISHED

Квест - Меч Призраков

*/
