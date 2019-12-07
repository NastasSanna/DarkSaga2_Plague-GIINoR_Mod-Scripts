instance DIA_Harok_EXIT(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Harok_EXIT_condition;	
	information = DIA_Harok_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Harok_EXIT_condition(){	return TRUE;};
func void DIA_Harok_EXIT_info(){	AI_StopProcessInfos(self);};
//
instance DIA_Harok_Start(C_Info)	//Начальный диалог
{
	npc = BAU_101_DS2P_HAROK;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Harok_Start_condition;	
	information = DIA_Harok_Start_info;
	description = "Здравствуй, рыбак!";
};
func int DIA_Harok_Start_condition(){	return TRUE;};
func void DIA_Harok_Start_info()
{
	AI_Output(other,self,"DIA_Harok_Start_15_00");	//Здравствуй, рыбак!
	AI_Output(self,other,"DIA_Harok_Start_01_00");	//И тебе не хворать, добрый человек! 
	AI_Output(self,other,"DIA_Harok_Start_01_01");	//Должно быть, ты один из тех, кто приплыл на большом корабле. Как это пираты оставили вас в покое?
	AI_Output(other,self,"DIA_Harok_Start_15_01");	//Ты прав, я один из команды ”Эсмеральды”. С пиратами удалось договориться, поэтому пока они нас не тронут.
	AI_Output(self,other,"DIA_Harok_Start_01_02");	//Мой тебе совет, не верь им! Это подлый народишко. Они захватили мою деревню, держат в заложниках наших женщин.
	AI_Output(self,other,"DIA_Harok_Start_01_03");	//Надеюсь, Иннос скоро покарает их!
};
//----
//Появляется после стартового
//----
instance DIA_Harok_WhatIsYourName(C_Info)	//Как тебя зовут?
{
	npc = BAU_101_DS2P_HAROK;
	nr = 3;
	permanent = FALSE;
	condition = DIA_Harok_WhatIsYourName_condition;	
	information = DIA_Harok_WhatIsYourName_info;
	description = "Как тебя зовут?";
};
func int DIA_Harok_WhatIsYourName_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_WhatIsYourName_info()
{
	AI_Output(other,self,"DIA_Harok_WhatIsYourName_15_00");	//Как тебя зовут?
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_00");	//Я не представился? Прости мою забывчивость, годы берут свое.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_01");	//Меня зовут Харок, я уже больше сорока лет занимаюсь рыбной ловлей.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_02");	//А это мой дом, в котором ты всегда можешь найти теплый очаг, крышу над головой и место для ночлега.
	AI_Output(other,self,"DIA_Harok_WhatIsYourName_15_01");	//Ты очень любезен, Харок.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_03");	//Просто у меня не так часто бывают гости.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_04");	//В основном ко мне приходят из деревни, раз или два в месяц, чтобы забрать бочки с засоленной рыбой.
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_05");	//Взамен приносят хлеб, мясо и прочую снедь, а один раз притащили целую бочку пива. (задумчиво) Эх...
	AI_Output(self,other,"DIA_Harok_WhatIsYourName_01_06");	//В общем, гости меня особо не балуют. Поэтому я рад любому путнику, если, конечно, он не бандит или пират.
};
//----
//Появляется после стартового
//----
instance DIA_Harok_WhatCatchOfFish(C_Info)	//Как улов? (постоянный)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 990;
	permanent = TRUE;
	condition = DIA_Harok_WhatCatchOfFish_condition;	
	information = DIA_Harok_WhatCatchOfFish_info;
	description = "Как улов?";
};
func int DIA_Harok_WhatCatchOfFish_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_WhatCatchOfFish_info()
{
	AI_Output(other,self,"DIA_Harok_WhatCatchOfFish_15_00");	//Как улов?
	AI_Output(self,other,"DIA_Harok_WhatCatchOfFish_01_00");	//Да разве это улов?! Вот во времена моей молодости был улов. А это так, слезы...
};
//----
//Появляется после стартового
//----
instance DIA_Harok_YouHaveSadLook(C_Info)	//У тебя печальный вид.
{
	npc = BAU_101_DS2P_HAROK;
	nr = 4;
	permanent = TRUE;
	condition = DIA_Harok_YouHaveSadLook_condition;	
	information = DIA_Harok_YouHaveSadLook_info;
	description = "У тебя печальный вид.";
};
func int DIA_Harok_YouHaveSadLook_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_YouHaveSadLook_info()
{
	AI_Output(other,self,"DIA_Harok_YouHaveSadLook_15_00");	//У тебя печальный вид.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_00");	//(вздыхает) Это так заметно? Да, у меня случилась беда.
	AI_Output(other,self,"DIA_Harok_YouHaveSadLook_15_01");	//Расскажи, что случилось.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_01");	//У меня есть внук, Гарон. Он еще молод, но уже очень смышленый парень.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_02");	//Он, как и я, очень любит море, любит подолгу сидеть на берегу и смотреть на закат, любит шум волн, любит слушать песни чаек...
	AI_PlayAni(self,"R_SCRATCHHEAD");
	AI_Wait(self,1);
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_03");	//Также он отличный рыбак, и всегда помогал мне в ловле рыбы.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_04");	//Но пришли пираты и забрали его. Они сказали, что им не хватает матросов.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_05");	//Я возразил, что парень молод, да и корабля теперь у них нет, но в ответ получил удар сапогом по лицу.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_06");	//Я очень переживаю за моего Гарона. Он очень добрый и отзывчивый человек, а эти выродки хотят из него сделать убийцу.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_07");	//Я не хочу, чтобы внуку была уготована такая судьба.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_01_08");	//Пожалуйста, помоги мне. Я вижу, что ты хороший человек, и тебе не чуждо чужое горе. Верни Гарона!
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);
	Info_AddChoice(DIA_Harok_YouHaveSadLook,"Я сделаю все, что в моих силах.",DIA_Harok_YouHaveSadLook_Help);
	Info_AddChoice(DIA_Harok_YouHaveSadLook,"Мне жаль, у меня и без того много проблем.",DIA_Harok_YouHaveSadLook_Deny);
};
func void DIA_Harok_YouHaveSadLook_Help()
{
	AI_Output(other,self,"DIA_Harok_YouHaveSadLook_Help_15_00");	//Я сделаю все, что в моих силах, обещаю!
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_Start);
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);
};
func void DIA_Harok_YouHaveSadLook_Deny()
{
	AI_Output(other,self,"DIA_Harok_YouHaveSadLook_Deny_15_00");	//Мне жаль, но сейчас у меня и без того много проблем.
	AI_Output(self,other,"DIA_Harok_YouHaveSadLook_Deny_01_00");	//(обреченно) Я понимаю. Иннос тебе судья!
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);
};
//----
//Появляется после стартового
//----
instance DIA_Harok_TellAboutYourIsland(C_Info)	//Расскажи о вашем острове.
{
	npc = BAU_101_DS2P_HAROK;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Harok_TellAboutYourIsland_condition;	
	information = DIA_Harok_TellAboutYourIsland_info;
	description = "Расскажи о вашем острове.";
};
func int DIA_Harok_TellAboutYourIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_TellAboutYourIsland_info()
{
	AI_Output(other,self,"DIA_Harok_TellAboutYourIsland_15_00");	//Расскажи о вашем острове.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_00");	//О, это очень древний остров! Называется он Атолл.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_01");	//Мой дед рассказывал, что очень давно здесь был большой порт, через который шел морской путь из Миртаны к Южным Островам и Хоринису.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_02");	//Остров был в несколько раз больше. В глухих лесах еще сохранились остатки нескольких боевых фортов и сторожевых башен.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_03");	//Здесь проживало много народностей, в том числе и варваров, диких кочевников, поэтому приходилось держать под защитой порт и окрестности.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_04");	//Ты, должно быть, обратил внимание, что пристань, к которой пришвартован корабль, сделана из камня.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_05");	//Правда, уже много лет как она осыпается и нам пришлось сооружать деревянные помосты, чтобы крупные суда могли причалить. (вздыхает)
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_06");	//Наша деревня, всего лишь небольшое селение, построенное на руинах прошлого.
	AI_Output(self,other,"DIA_Harok_TellAboutYourIsland_01_07");	//За последние полгода я не видел кораблей даже на горизонте, говорят в Миртане война с орками, а значит, нас окончательно забудут.
};
//----
//Появляется после предыдущего ("Расскажи о вашем острове.")
//----
instance DIA_Harok_IsYourVillageBig(C_Info)	//У вас большая деревня?
{
	npc = BAU_101_DS2P_HAROK;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Harok_IsYourVillageBig_condition;	
	information = DIA_Harok_IsYourVillageBig_info;
	description = "У вас большая деревня?";
};
func int DIA_Harok_IsYourVillageBig_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_TellAboutYourIsland)){	return TRUE;};	};
func void DIA_Harok_IsYourVillageBig_info()
{
	AI_Output(other,self,"DIA_Harok_IsYourVillageBig_15_00");	//У вас большая деревня?
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_00");	//Нет, совсем небольшая.
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_01");	//В деревне несколько домов, ратуша, где раньше располагался наш староста, а теперь сидит капитан этих чертовых пиратов, пара загонов для скота и склад.
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_02");	//За околицей расположились поля для пшеницы да мельница. Вот и все наши достопримечательности. (смеется)
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_03");	//Но все равно, я люблю нашу деревню. Это мой дом, здесь тихо и хорошо.
	AI_Output(self,other,"DIA_Harok_IsYourVillageBig_01_04");	//В детстве я часто любил гулять по округе. Тебе у нас понравится.
};
//----
//Появляется после стартового
//----
instance DIA_Harok_HowManyPiratesOnIsland(C_Info)	//Много ли пиратов на острове?
{
	npc = BAU_101_DS2P_HAROK;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Harok_HowManyPiratesOnIsland_condition;	
	information = DIA_Harok_HowManyPiratesOnIsland_info;
	description = "Много ли пиратов на острове?";
};
func int DIA_Harok_HowManyPiratesOnIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start)){	return TRUE;};	};
func void DIA_Harok_HowManyPiratesOnIsland_info()
{
	AI_Output(other,self,"DIA_Harok_HowManyPiratesOnIsland_15_00");	//Много ли пиратов на острове?
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_00");	//Чуть больше десятка. Все они находятся в деревне, даже нос высунуть оттуда не хотят.
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_01");	//Да, еще есть несколько пиратов, охраняющие ”Привал Путника”.
	AI_Output(other,self,"DIA_Harok_HowManyPiratesOnIsland_15_01");	//Привал Путника?
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_02");	//Да, небольшая пещерка неподалеку от деревни. Там они держат наших женщин.
	AI_Output(other,self,"DIA_Harok_HowManyPiratesOnIsland_15_02");	//А почему они держат там ваших женщин?
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_03");	//Ну как же? Мы хоть и мирный народ, но не потерпим никаких бандитов у себя дома.
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_04");	//Когда напали пираты, мы дали отпор как могли, но их оказалось намного больше, а часть мужчин были на охоте в лесах.
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_05");	//Пираты сразу смекнули, что если вернутся остальные, мы попробуем отбить деревню.
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_06");	//Поэтому они взяли большинство наших женщин и увели в пещеру. Там они и держат их под постоянным присмотром.
	AI_Output(self,other,"DIA_Harok_HowManyPiratesOnIsland_01_07");	//Теперь, если кто-то решит не подчиниться, то они убьют их.
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Hostages);
};
//----
//Появляется после предыдущего ("Много ли пиратов на острове?")
//----
instance DIA_Harok_WhyCaveIsCalledHaltViator(C_Info)	//А почему пещера называется ”Привал Путника”?
{
	npc = BAU_101_DS2P_HAROK;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Harok_WhyCaveIsCalledHaltViator_condition;	
	information = DIA_Harok_WhyCaveIsCalledHaltViator_info;
	description = "А почему пещера называется ”Привал Путника”?";
};
func int DIA_Harok_WhyCaveIsCalledHaltViator_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_HowManyPiratesOnIsland)){	return TRUE;};	};
func void DIA_Harok_WhyCaveIsCalledHaltViator_info()
{
	AI_Output(other,self,"DIA_Harok_WhyCaveIsCalledHaltViator_15_00");	//А почему пещера называется ”Привал Путника”?
	AI_Output(self,other,"DIA_Harok_WhyCaveIsCalledHaltViator_01_00");	//А это пошло издревле. Когда наша деревня была не деревней, а городом, то была окружена не частоколом, а большой стеной с огромными воротами.
	AI_Output(self,other,"DIA_Harok_WhyCaveIsCalledHaltViator_01_01");	//Вот эти ворота закрывались на ночь.
	AI_Output(self,other,"DIA_Harok_WhyCaveIsCalledHaltViator_01_02");	//И если горожанин или другой путник не успевали вовремя вернуться, они ночевали в этой пещере, а уже поутру шли в город.
};

//----
//Появляется после стартового, если отойти
//----
instance DIA_Harok_HelpMe(C_Info)	//
{
	npc = BAU_101_DS2P_HAROK;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Harok_HelpMe_condition;
	information = DIA_Harok_HelpMe_info;
	important = TRUE;
};
func int DIA_Harok_HelpMe_condition(){	if(Npc_KnowsInfo(other,DIA_Harok_Start) && !Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE))	{	return TRUE;};	};
func void DIA_Harok_HelpMe_info()
{
	AI_Output(self,other,"DIA_Harok_HelpMe_01_00");	//Прости за мою назойливость, но я хотел бы попросить тебя об услуге.
	AI_Output(other,self,"DIA_Harok_HelpMe_15_00");	//Я тебя слушаю.
	AI_Output(self,other,"DIA_Harok_HelpMe_01_01");	//Весь свой улов я храню в бочках, а чтобы рыба не испортилась, я использую соль.
	AI_Output(self,other,"DIA_Harok_HelpMe_01_02");	//Так вот, недавно помимо всех бед, что произошли с нами, свалилась еще одна. 
	AI_Output(self,other,"DIA_Harok_HelpMe_01_03");	//В пещере, где я раньше добывал соль, завелись шныги. Да не один, и не два, а целый выводок.
	AI_Output(self,other,"DIA_Harok_HelpMe_01_04");	//Я уже стар, чтобы идти и сражаться с ними, но ты - совсем другое дело. Помоги старику, принеси мне с десяток мер соли.
	Info_ClearChoices(DIA_Harok_HelpMe);
	Info_AddChoice(DIA_Harok_HelpMe,"Я принесу соль.",DIA_Harok_HelpMe_Help);
	Info_AddChoice(DIA_Harok_HelpMe,"У меня нет на это времени.",DIA_Harok_HelpMe_Deny);
};
func void DIA_Harok_HelpMe_Help()
{
	AI_Output(other,self,"DIA_Harok_HelpMe_Help_15_00");	//Я принесу соль.
	//UNFINISHED !!!
	AI_Output(self,other,"DIA_Harok_HelpMe_Help_01_00");	//Спасибо тебе, добрый человек. Пещера находится совсем недалеко. (там-то и там-то)
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishingBusiness,LOG_MISSION,LOG_Running,TOPIC_DS2P_FishingBusiness_Start);
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);
};
func void DIA_Harok_HelpMe_Deny()
{
	AI_Output(other,self,"DIA_Harok_HelpMe_Deny_15_00");	//У меня нет на это времени.
	AI_Output(self,other,"DIA_Harok_HelpMe_Deny_01_00");	//Очень жаль! Весь улов пропадет уже через пару дней.
	Info_ClearChoices(DIA_Harok_YouHaveSadLook);	
};
//----
//Появляется после предыдущего и взятия квеста "Рыбное дело"
//----
instance DIA_Harok_HereIsYourSalt(C_Info)	//Вот твоя соль, рыбак.
{
	npc = BAU_101_DS2P_HAROK;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Harok_HereIsYourSalt_condition;	
	information = DIA_Harok_HereIsYourSalt_info;
	description = "Вот твоя соль, рыбак.";
};
func int DIA_Harok_HereIsYourSalt_condition()
{
	if((MIS_DS2P_FishingBusiness == LOG_Running) && C_Npc_ds_HasItems(other,ITMI_DS2P_Salt,10)) {
		return TRUE;
	};	
};
func void DIA_Harok_HereIsYourSalt_info()
{
	AI_Output(other,self,"DIA_Harok_HereIsYourSalt_15_00");	//Вот твоя соль, рыбак.
	AI_Output(self,other,"DIA_Harok_HereIsYourSalt_01_00");	//Спасибо тебе. За твою помощь я дам тебе этот нож. Как-то я нашел его на берегу. Думаю, он будет тебе полезен.
	B_GivePlayerXP(XP_MIS_FishingBusiness_01);
	B_GiveInvItems(self,other,ITMW_DSG_Sword_2x2_01,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishingBusiness,LOG_MISSION,LOG_Running,TOPIC_DS2P_FishingBusiness_SaltGiven);
	AI_StopProcessInfos(self);
};
//----
//Появляется после предыдущего ("Вот твоя соль, рыбак.")
//----
instance DIA_Harok_WaitHelpMeYet(C_Info)	//
{
	npc = BAU_101_DS2P_HAROK;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Harok_WaitHelpMeYet_condition;	
	information = DIA_Harok_WaitHelpMeYet_info;
	important = TRUE;
};
func int DIA_Harok_WaitHelpMeYet_condition(){	if((MIS_DS2P_FishingBusiness == LOG_Running) && Npc_KnowsInfo(other,DIA_Harok_HereIsYourSalt)) {	return TRUE;};	};
func void DIA_Harok_WaitHelpMeYet_info()
{
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_00");	//Наверное, я покажусь тебе чересчур наглым, но все же попрошу еще об одной услуге.
	AI_Output(other,self,"DIA_Harok_WaitHelpMeYet_15_00");	//Ничего страшного, старик. Говори.
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_01");	//Если подождешь немного, я переложу рыбу и соль в бочку, а ты отнесешь ее Марии, поварихе. Погоди минуточку.
	AI_GotoWP(self,"");
	AI_Wait(self,2);
	AI_GotoNpc(self,other);
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_02");	//Вот, теперь все готово. Ты сильный, поэтому донести этот бочонок для тебя не составит труда.
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_03");	//Я уверен, что за твои старания Мария отблагодарит тебя отличным супом.
	AI_Output(other,self,"DIA_Harok_WaitHelpMeYet_15_01");	//Где мне найти Марию?
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_04");	//В деревне, конечно же! Она обычно готовит в таверне, либо прибирается в своем доме при кузнице.
	AI_Output(self,other,"DIA_Harok_WaitHelpMeYet_01_05");	//Пока Густава, ее мужа, нет в деревне, она следит за порядком в доме. А то эти пираты быстро все разнесут к чертям.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishingBusiness,LOG_MISSION,LOG_Running,TOPIC_DS2P_FishingBusiness_AskDelivery);
	B_GiveInvItems(self,other,ITMI_DS2P_FishBarrel,1);
	AI_StopProcessInfos(self);
};


//NS - 17/07/2013 ================================================
// По квесту "Внук рыбака"
//================================================================
// "Я нашел Гарона." (+опыт), Гарон стал пиратом			nr = 20
instance DIA_Harok_GaronBecomePirat(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 20;
	permanent = FALSE;
	condition = DIA_Harok_GaronBecomePirat_condition;	
	information = DIA_Harok_GaronBecomePirat_info;
	description = "Я нашел Гарона.";
};
func int DIA_Harok_GaronBecomePirat_condition()
{
	if(Garon_Choice == Garon_Choice_Pirate)
	{	return TRUE;};
};
func void DIA_Harok_GaronBecomePirat_info()
{
	AI_Output(other,self,"DIA_Harok_GaronBecomePirat_15_00");	//Я нашел Гарона. 
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_Pirat_ToldHakon);
		Mdl_StartFaceAni(self,"S_FRIENDLY",1,5);
		AI_Output(self,other,"DIA_Harok_GaronBecomePirat_01_01");	//(радостно) Да? И где же он? Я очень соскучился, так не терпится его увидеть!
		Mdl_StartFaceAni(self,"S_FRIGHTENED",1,1);
	AI_Output(other,self,"DIA_Harok_GaronBecomePirat_15_02");	//Ну... Он решил стать пиратом, поэтому он не вернется.
		AI_Output(self,other,"DIA_Harok_GaronBecomePirat_01_03");	//(удивленно) Что? Не верю своим ушам! Гарон стал пиратом?
	AI_Output(other,self,"DIA_Harok_GaronBecomePirat_15_04");	//Да, он решил, что так будет лучше для него.
		Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
		AI_Output(self,other,"DIA_Harok_GaronBecomePirat_01_05");	//(грустно) Эта новость сразила меня наповал.
		AI_Output(self,other,"DIA_Harok_GaronBecomePirat_01_06");	//(чуть слышно) Гарон, Гарон, как же ты мог?.. Прости, мне нужно побыть одному.
	//Диалог обрывается
	AI_StopProcessInfos(self);

	//Запись в дневнике "Внук рыбака" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GrandsonOfFisherman_SuccessPirat);
};


//-------------------------------------------------------------------
// "Как видишь, Гарон в полном порядке." (+опыт)		important	
// ТРИАЛОГ: Гарон, Харок, Карах, Саймон
// TEST NEEDED возможно, лучше разбить на 2 части
instance DIA_Harok_GaronReturned(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 0;
	condition = DIA_Harok_GaronReturne_condition;	
	information = DIA_Harok_GaronReturne_info;
	description = "Как видишь, Гарон в полном порядке.";
	important = TRUE;
};
func int DIA_Harok_GaronReturne_condition()
{
	var C_NPC Garon;	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
	if((Garon_Choice == Garon_Choice_GoHome) && (Npc_GetDistToNpc(self, Garon) < PERC_DIST_ACTIVE_MAX)
		&& (Npc_GetDistToNpc(other, Garon) <= PERC_DIST_ACTIVE_MAX))
	{	return TRUE;	};
};
func void DIA_Harok_GaronReturne_info()
{
	var C_NPC Garon;	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
	var C_NPC Harok;	Harok = Hlp_GetNpc(BAU_101_DS2P_HAROK);
	var C_NPC Karah;	Karah = Hlp_GetNpc(Pir_204_DS2P_Karah);
	var C_NPC Symon;	Symon = Hlp_GetNpc(PIR_202_DS2P_Symon);
	
	// UNFINISHED пираты телепортируются перед домом Хакона
	AI_StartState(Karah, ZS_Stand_WP, 0, "");	AI_Teleport(Karah, "");
	AI_StartState(Karah, ZS_Stand_WP, 0, "");	AI_Teleport(Symon, "");

	// пока в триалоге участвуют только Гарон и Харок
	TRIA_Invite(Garon);
	TRIA_Invite(Karah);
	TRIA_Invite(Symon);
	TRIA_Start();

	AI_Output(other,self,"DIA_Harok_GaronReturne_15_00");	//Как видишь, Гарон в полном порядке.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_GoHome);
	
	TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_12_01_Garon");	//Да, если не считать то, что пираты пересчитали мне кости. (смеется)
	
	// UNFINISHED пираты идут внутрь
	AI_GotoNpc(Karah, Garon);
	AI_GotoNpc(Symon, Garon);
	
	TRIA_Next(Harok);
		AI_Output(self,other,"DIA_Harok_GaronReturne_01_02_Harok");	//Ну, до свадьбы заживет! Гарон, как же я рад, что ты вернулся! Я грешным делом уже думал...

	
	///Появляются Карах и Саймон
	DIAG_Reset();
	
	
	TRIA_Next(Karah);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_03_Karah");	//(перебивает) Вот ты где, чертов рыбак! Я так и знал, что ты вернешься сюда, бежать то на этом проклятом острове тебе больше некуда! 
	
	TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_12_04_Garon");	//Вот черт...

	TRIA_Next(Symon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_05_Symon");	//Надеюсь, ты больше не совершишь глупостей, малыш. Я не собираюсь бегать за тобой по всему острову! У меня полно и других дел!
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_06_Symon");	//Быстро топай в деревню, там мы с тобой потолкуем, не будем печалить твоего деда еще больше. (громко смеется)
	
	TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_12_07_Garon");	//Я с вами никуда не пойду! 

	TRIA_Next(Karah);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_08_Karah");	//Пойдешь как миленький! А если не захочешь по-доброму, мы начнем прямо здесь выбивать из тебя дурь!
	
	TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_12_09_Garon");	//Вы можете убить меня, но с вами я не пойду!

	TRIA_Next(Symon);
		AI_DrawWeapon(self);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_10_Symon");	//Карах, похоже, парень совершенно туп, а такие нам в команде не нужны. Пора кончать его!

	AI_Output(other,self,"DIA_Harok_GaronReturne_15_11");	//Советую этого не делать. Гарон повел себя как настоящий мужчина и сделал свой выбор!

	TRIA_Next(Symon);
		AI_Output(self,other,"DIA_Harok_GaronReturne_13_12_Symon");	//Ты что, недоносок, решил дерзить нам? Похоже, придется преподать урок и тебе!
		AI_DrawWeapon(Garon);
		AI_DrawWeapon(Karah);
		AI_DrawWeapon(Harok);
	
	TRIA_Finish();
	AI_StopProcessInfos(self);

	//После драки пираты вернутся на свои места
	AI_ContinueRoutine(Karah);
	AI_ContinueRoutine(Symon);
	// Расписания Гарона и Хакона, если выживут
	B_StartOtherRoutine(Harok,"GARONRETURNED");
	B_StartOtherRoutine(Garon,"HOME");
	
	//Начинается драка
	Garon_FightPirates = Garon_FightPirates_Started;
	B_Attack(Symon,hero,AR_NONE, 1);
	B_Attack(Garon,Karah,AR_NONE, 1);
	B_Attack(Karah,Garon,AR_NONE, 1);
	B_Attack(Harok,Karah,AR_NONE, 1);
};


//-------------------------------------------------------------------
// Сам заговаривает, если Гарон после драки выжил (+опыт)		important
instance DIA_Harok_GaronReturnedAllAlive(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Harok_GaronReturnedAllAlive_condition;	
	information = DIA_Harok_GaronReturnedAllAlive_info;
	important = TRUE;
};
func int DIA_Harok_GaronReturnedAllAlive_condition()
{
	if((Garon_FightPirates == Garon_FightPirates_Finished) && !Npc_IsDead(BAU_117_DS2P_Garon)
		&& Npc_IsInState(self, ZS_Talk))
	{	return TRUE;};
};
func void DIA_Harok_GaronReturnedAllAlive_info()
{
	var int x;
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_00");	//Ты помог нам дважды, в первый раз, когда вырвал из лап пиратов Гарона, а второй, когда спас наши жизни.
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_01");	//Впервые встречаю человека, который просто так помогает незнакомым людям. Наверное, сам Иннос послал тебя.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_Pirat_ToldHakon);
	
	AI_Output(other,self,"DIA_Harok_GaronReturnedAllAlive_15_02");	//Я не...
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_03");	//(перебивает) Но я не хочу быть в долгу перед тобой.
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_04");	//Возьми этот ключ и иди в соляную пещеру, там в одной из штолен найдешь сундук. Это все, что мне удалось найти за годы работы старателем.
	//Дает ключ «от сундука в соляной пещере»
	x = 1; if (x == 1)	{
		B_GiveInvItems(self, other, ITKE_Key_DS2P_GARON, 1);
	};
	//Запись в дневнике "Внук рыбака" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GrandsonOfFisherman_SuccessReturned);
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_05");	//Также ты можешь приходить ко мне каждый день за свежей рыбой. Накормлю тебя до отвала.
		AI_Output(self,other,"DIA_Harok_GaronReturnedAllAlive_01_06");	//Держи, это то, что удалось поймать сегодня.
	//Дает 10 рыб
	x = 2; if (x == 2)	{
		B_GiveInvItems(self, other, ItFo_Fish, 10);
	};

	//Запись в дневнике в разделе доп. инфо "Рыба от Харока" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishFromHarok,LOG_NOTE,-1,"Я могу приходить к Хароку раз в день за рыбой.");
	Harok_FishGetDay = Wld_GetDay() + 1;
};


//-------------------------------------------------------------------
// "Я нашел Гарона." (+опыт), Гарон ушел в лес		nr = 22
instance DIA_Harok_GaronGoForest(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 22;
	permanent = FALSE;
	condition = DIA_Harok_GaronGoForest_condition;	
	information = DIA_Harok_GaronGoForest_info;
	description = "Я нашел Гарона.";
};
func int DIA_Harok_GaronGoForest_condition()
{
	if(Garon_Choice == Garon_Choice_GoForest)
	{	return TRUE;};
};
func void DIA_Harok_GaronGoForest_info()
{
	var int x;
	AI_Output(other,self,"DIA_Harok_GaronGoForest_15_00");	//Я нашел Гарона и помог ему сбежать от пиратов.
	AI_Output(other,self,"DIA_Harok_GaronGoForest_15_01");	//Он решил пока не возвращаться сюда, так как боится, что пираты могут найти его в твоем доме.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_GoForest_ToldHakon);
		AI_Output(self,other,"DIA_Harok_GaronGoForest_01_02");	//Я благодарен тебе за помощь. (вздыхает) Жаль, конечно, что Гарон даже на минутку не забежал меня навестить, но так будет лучше для всех. В этом я с ним согласен.
		AI_Output(self,other,"DIA_Harok_GaronGoForest_01_03");	//Возьми от меня в качестве награды этот ключ и иди в соляную пещеру, там в одной из штолен найдешь сундук. Это все, что мне удалось найти за годы работы старателем.
	//Дает ключ «от сундука в соляной пещере»
	x = 1; if (x == 1)	{
		B_GiveInvItems(self, other, ITKE_Key_DS2P_GARON, 1);
	};

	//Запись в дневнике "Внук рыбака" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GrandsonOfFisherman_SuccessHide);
};


//-------------------------------------------------------------------
// "Гарон мертв." (+опыт), если был взят квест, но Гарона не спасли		nr = 22
instance DIA_Harok_GaronDead(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 22;
	permanent = FALSE;
	condition = DIA_Harok_GaronDead_condition;	
	information = DIA_Harok_GaronDead_info;
	description = "Гарон мертв.";
};
func int DIA_Harok_GaronDead_condition()
{
	if((MIS_DS2P_GrandsonOfFisherman == LOG_FAILED) && Npc_IsDead(BAU_117_DS2P_Garon))
	{	return TRUE;};
};
func void DIA_Harok_GaronDead_info()
{
	AI_Output(other,self,"DIA_Harok_GaronDead_15_00");	//Гарон мертв.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_GaronDead);
		AI_Output(self,other,"DIA_Harok_GaronDead_01_01");	//(побледнев) Что? Откуда ты знаешь?
	if (Garon_DeadInForest_HeroKnows == TRUE)	//нашли его труп в лесу
	{
		AI_Output(other,self,"DIA_Harok_GaronDead_15_02");	//Я нашел его труп в лесу.
			AI_Output(self,other,"DIA_Harok_GaronDead_01_03");	//(со слезами на глазах) Я не верю! Ты врешь мне, убирайся!
		//Если пояс с собой
		if (B_GiveInvItems(other,self,ItBe_DS2P_Garon,1))
		{
			AI_Output(other,self,"DIA_Harok_GaronDead_15_04");	//Вот Пояс Гарона. Извини, но твой внук погиб.
				AI_Output(self,other,"DIA_Harok_GaronDead_01_05");	//(пристально смотрит на пояс) Бедный Гарон... Не уберег, старый дурень...
			AI_Output(self,other,"DIA_Harok_GaronGoDead_01_06");	//Извини, но мне нужно побыть одному.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Harok_GaronDead_15_07");	//Ему удалось сбежать от пиратов и укрыться в пещере, неподалеку отсюда.
		AI_Output(other,self,"DIA_Harok_GaronDead_15_08");	//Я хотел помочь ему вернуться к тебе, но по дороге мы попали в передрягу... Прости, но я ничего не смог сделать...
			AI_Output(self,other,"DIA_Harok_GaronDead_01_09");	//(со слезами на глазах) Я тебе верю... Гарон, Гарон, не уберег я тебя...
		AI_Output(self,other,"DIA_Harok_GaronDead_01_06");	//Извини, но мне нужно побыть одному.
	};
	Harok_GaronDeadDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};



//-------------------------------------------------------------------
// отказывается говорить в тот день, когда узнал о смерти Гарона		important
instance DIA_Harok_GaronDead_RefuseTalk(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Harok_GaronDead_RefuseTalk_condition;	
	information = DIA_Harok_GaronDead_RefuseTalk_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Harok_GaronDead_RefuseTalk_condition()
{
	if(Npc_IsInState(self, ZS_Talk) 
		&& Npc_KnowsInfo(other, DIA_Harok_GaronDead) && (Harok_GaronDeadDay == Wld_GetDay()))
	{	return TRUE;};
};
func void DIA_Harok_GaronDead_RefuseTalk_info()
{
		AI_Output(self,other,"DIA_Harok_GaronDead_RefuseTalk_01_01");	//Прости, но мне нужно побыть одному.
	AI_Output(other,self,"DIA_Harok_GaronDead_RefuseTalk_15_00");	//Я понимаю.
	AI_StopProcessInfos(self);
};


//NS - 17/07/2013 ================================================
// Попросить рыбу
//================================================================
// "У тебя есть рыба?" после успешного возвращения Гарона		nr = 100
instance DIA_Harok_GetFish(C_Info)
{
	npc = BAU_101_DS2P_HAROK;
	nr = 100;
	permanent = FALSE;
	condition = DIA_Harok_GetFish_condition;	
	information = DIA_Harok_GetFish_info;
	description = "У тебя есть рыба?";
	permanent = TRUE;
};
func int DIA_Harok_GetFish_condition()
{
	if(Npc_KnowsInfo(other, DIA_Harok_GetFish))
	{	return TRUE;};
};
func void DIA_Harok_GetFish_info()
{
	AI_Output(self,other,"DIA_Harok_GetFish_15_00");	//У тебя есть рыба?
	if (Wld_IsTime(0,0,8,0))	//NS - отсебятина
	{
		AI_Output(self,other,"DIA_Harok_GetFish_01_01");	//Извини, сегодня я еще не успел наловить рыбы. Приходи позже.
	}
	else if(Harok_FishGetDay >= Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Harok_GetFish_01_02");	//Извини, сегодня улов был небольшой, приходи завтра.
	}
	else
	{
		AI_Output(self,other,"DIA_Harok_GetFish_01_03");	//Да, конечно, держи, совсем свежая!
		//Дает от 5 до 10 рыбин рандом.
		B_GiveInvItems(self,other,ItFo_Fish,5 + Hlp_Random(6));
		Harok_FishGetDay = Wld_GetDay() + 1;
	};
};

