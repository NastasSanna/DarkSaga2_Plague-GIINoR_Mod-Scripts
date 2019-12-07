instance DIA_TsaHaNauh_EXIT(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;
	nr = 999;
	permanent = TRUE;
	condition = DIA_TsaHaNauh_EXIT_condition;	
	information = DIA_TsaHaNauh_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_TsaHaNauh_EXIT_condition(){	return TRUE;};
func void DIA_TsaHaNauh_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// Знакомство и квест "Доверие вождя"
//===========================
//приветствие ----------------------------
instance DIA_TsaHaNauh_Hello(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 1;
	condition = DIA_TsaHaNauh_Hello_condition;	
	information = DIA_TsaHaNauh_Hello_info;
	important = TRUE;
};
func int DIA_TsaHaNauh_Hello_condition(){	return TRUE;};
func void DIA_TsaHaNauh_Hello_info()
{	
	//дошел до вождя - молодец!
	B_GivePlayerXP(XP_Ambient);
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_18_01");	//Человек? Человек в мой деревня?
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_15_02");	//Да. Меня зовут...
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_18_03");	//Моя не хотеть знать, как твоя звать. Твоя говорить, что надо в моя деревня, иначе моя напасть твоя.
	//Всего есть два варианта ответов (в зависимости от того, как прошли в деревню)
	Info_ClearChoices(DIA_TsaHaNauh_Hello);
	if (MIS_ReturnedStatues_Cnt > 0) 	{
		Info_AddChoice(DIA_TsaHaNauh_Hello,"Я помог вашему охотнику Ба-Ба-По.",DIA_TsaHaNauh_Hello_BaBaPo);
	}
	else if (Npc_KnowsInfo(other, DIA_YahYah_SharksKilled)) 	{
		Info_AddChoice(DIA_TsaHaNauh_Hello,"Я уничтожил трех болотных акул.",DIA_TsaHaNauh_Hello_Sharks);
	}
	else {	//заглушка! невозможный вариант
		Info_AddChoice(DIA_TsaHaNauh_Hello,"Да так, просто зашел...",DIA_TsaHaNauh_Hello_Cheating);
	};
};
func void DIA_TsaHaNauh_Hello_BaBaPo()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_01");	//Я помог вашему охотнику Ба-Ба-По.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_BaBaPo_18_02");	//(скептически) И как большой тупой человек помочь один из лучший охотник племя?
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_03");	//Эй, поосторожнее в словах - я, может, и большой, но не тупой. И я не люблю, когда меня оскорбляют. 
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_04");	//А помог вашему охотнику тем, что вернул ему изумрудную статуэтку Гуруна. Ба-Ба-По сказал мне заглянуть в гости в вашу деревню.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_BaBaPo_18_05");	//Да? Тогда человек не такой человек, но все равно человек.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_06");	//(про себя) Ох, ну и фраза.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BaBaPo_15_07");	//(вслух) Теперь ты мне веришь?
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_BaBaPo_18_08");	//Нет. Но напасть моя не будет. Прямо сейчас.
	Info_ClearChoices(DIA_TsaHaNauh_Hello);
	Info_AddChoice(DIA_TsaHaNauh_Hello,"Я помог вашему охотнику Ба-Ба-По.",DIA_TsaHaNauh_Hello_BaBaPo);
};
func void DIA_TsaHaNauh_Hello_Sharks()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_01");	//Я уничтожил трех болотных акул. Тех, что подобрались очень близко к деревне. И Ях-Ях пропустил меня.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_02");	//Все равно твоя человек.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_03");	//(про себя) О Иннос, только маленького расиста мне и не хватало для полного счастья.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_04");	//(вслух) Почему ты мне не веришь?
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_05");	//Люди лживы, порочны, коварны. Ваша умеет только лгать и убивать. Убивать тех, кто слабее.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_06");	//Не соглашусь с тобой. Люди встречаются разные.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_07");	//Несколько недель назад появиться много человек на остров, они убить много гоблин, половина племя погибнуть.
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Sharks_15_08");	//Это пираты. От них страдают не только гоблины, но и сами люди.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_09");	//Вот! Моя говорить, что человек убивать. Убивать даже себе подобный. 
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Sharks_18_10");	//Гоблин такого себе никогда не позволить! Наша всегда жить в мире с другой племя, не воевать.
};
func void DIA_TsaHaNauh_Hello_BothEnd()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_BothEnd_15_01");	//И что мне сделать, чтобы ты мне начал доверять хотя бы чуть-чуть?
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_BothEnd_18_02");	//Хм, твоя ходить по деревня, говорить другой гоблинб помогать. Если человек показать себя хорошо, то и моя лучше относиться к человек.
	//Запись в дневнике "Доверие вождя"
	B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust, LOG_MISSION, LOG_Running, TOPIC_DS2P_GobboLeaderTrust_Start);
};
func void DIA_TsaHaNauh_Hello_Cheating()
{	
	//NS по идее, невозможно. Привет читерам и багоюзерам
	// -Сынки, что ж вы мальчонку-то впятером бьете? 
	// -Да вот, бабушка, спамера [читера] поймали! 
	// -Ногами яво, ногами!
	AI_Output(other,self,"DIA_TsaHaNauh_Hello_Cheating_15_01");	//Да так, просто зашел...
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Cheating_18_02");	//Человек лгать! Человек нельзя просто зайти деревня гоблина.
		AI_Output(self,other,"DIA_TsaHaNauh_Hello_Cheating_18_03");	//Читер!!! Читер в деревне! Бей читера!
	Gobbos_Attitude = Gobbos_Attitude_Hostile;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};
// Что обо мне думают в поселении? ----------------------------
//пока идет квест "Доверие вождя"
//постоянный
instance DIA_TsaHaNauh_Reputation(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 12;
	condition = DIA_TsaHaNauh_Reputation_condition;	
	information = DIA_TsaHaNauh_Reputation_info;
	description = "Что обо мне думают в поселении?";
	permanent = TRUE;
};
func int DIA_TsaHaNauh_Reputation_condition()
{
	if (MIS_DS2P_GobboLeaderTrust == LOG_Running){
		return TRUE;
	};
};
var int DIA_TsaHaNauh_Reputation_Once;	//записи в журнал - только один раз
	const int DIA_TsaHaNauh_Reputation_Once_BaBaPo	= 1;
	const int DIA_TsaHaNauh_Reputation_Once_RaDaPo	= 1 << 1;
	const int DIA_TsaHaNauh_Reputation_Once_KuLa	= 1 << 2;
	const int DIA_TsaHaNauh_Reputation_Once_YahYah	= 1 << 3;
	const int DIA_TsaHaNauh_Reputation_Once_JaAfFar	= 1 << 4;
func void DIA_TsaHaNauh_Reputation_info()
{	
	var int Help_Count;	Help_Count = 0;
	AI_Output(other,self,"DIA_TsaHaNauh_Reputation_15_01");	//Что обо мне думают в поселении?

	if (MIS_DS2P_FigurinesGurun == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_02");	//Ба-Ба-По говорить, что твоя помочь добыть статуэтки Гуруна.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_BaBaPo))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_BaBaPo);
		};
		Help_Count += 1;
	};
	//кому помогли?
	if (MIS_DS2P_AncientStonePlates == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_03");	//Твоя помочь Ра-Да-По отнести старый каменный таблички.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_RaDaPo))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_RaDaPo);
		};
		Help_Count += 1;
	};
	if (MIS_DS2P_MissingFriend == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_04");	//Твоя найти Та-Ко-Пи, волк Ку-Ла.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_KuLa))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_KuLa);
		};
		Help_Count += 1;
	};
	if (MIS_DS2P_EnterGobboVillage == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_05");	//Чужак убить три болотный червь.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_YahYah))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_YahYah);
		};
		Help_Count += 1;
	};
	if (MIS_DS2P_QuirkyThief == LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_06");	//Джа-Аф-Фар рассказать, что твоя помочь ему украсть мешок муки. Моя не ожидать это.
		if (!HasFlags(DIA_TsaHaNauh_Reputation_Once,DIA_TsaHaNauh_Reputation_Once_JaAfFar))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_Running,TOPIC_DS2P_GobboLeaderTrust_JaAfFar);
		};
		Help_Count += 1;
	};
	//достаточно сделали?
	if (Help_Count >= 3)	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_07");	//Чужак много сделать для деревня, хоть и быть человек. Моя быть неправ, моя верить тебе.
		//Запись в дневнике "Доверие вождя". Квест выполнен.
		B_DSG_Log_OpenClose(TOPIC_DS2P_GobboLeaderTrust,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_GobboLeaderTrust_Success);
		B_GivePlayerXP(XP_MIS_GobboLeaderTrust_Success);
	}
	else	{
		AI_Output(self,other,"DIA_TsaHaNauh_Reputation_18_08");	//Твоя мало сделать для деревня. Моя тебе не верить.
	};
};

//NS - 20/03/2016 ===========
// Общие
//===========================
// Ты ведь вождь этого поселения? ----------------------------
instance DIA_TsaHaNauh_AUChief(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 10;
	condition = DIA_TsaHaNauh_AUChief_condition;	
	information = DIA_TsaHaNauh_AUChief_info;
	description = "Ты ведь вождь этого поселения?";
};
func int DIA_TsaHaNauh_AUChief_condition(){	return TRUE;};
func void DIA_TsaHaNauh_AUChief_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_AUChief_15_01");	//Ты ведь вождь этого поселения?
		AI_Output(self,other,"DIA_TsaHaNauh_AUChief_18_02");	//Да, моя быть вождь. И моя предупреждай человек: если человек делай плохо гоблин, моя делай плохо человек.
};

// Сколько всего гоблинов в деревне? ----------------------------
//после "Ты ведь вождь этого поселения?"
instance DIA_TsaHaNauh_HowManyGobbos(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 11;
	condition = DIA_TsaHaNauh_HowManyGobbos_condition;	
	information = DIA_TsaHaNauh_HowManyGobbos_info;
	description = "Сколько всего гоблинов в деревне?";
};
func int DIA_TsaHaNauh_HowManyGobbos_condition()
{
	if (Npc_KnowsInfo(other,DIA_TsaHaNauh_AUChief))	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_HowManyGobbos_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_HowManyGobbos_15_01");	//Сколько всего гоблинов в деревне?
		AI_Output(self,other,"DIA_TsaHaNauh_HowManyGobbos_18_02");	//(подозрительно) Зачем человек спрашивать? Чтобы другие человеки напасть на нас?
		AI_Output(self,other,"DIA_TsaHaNauh_HowManyGobbos_18_03");	//Нет, моя не говорить это человек.
	AI_Output(other,self,"DIA_TsaHaNauh_HowManyGobbos_15_04");	//(бормочет) Ох, как же сложно с тобой.
};

// Расскажи о себе. ----------------------------
//после "Ты ведь вождь этого поселения?" и квест "Доверие вождя" сдан
//постоянный
instance DIA_TsaHaNauh_AboutYourself(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 12;
	condition = DIA_TsaHaNauh_AboutYourself_condition;	
	information = DIA_TsaHaNauh_AboutYourself_info;
	description = "Расскажи о себе.";
	permanent = TRUE;
};
func int DIA_TsaHaNauh_AboutYourself_condition()
{
	if ((Npc_KnowsInfo(other,DIA_TsaHaNauh_AUChief))
		 && (MIS_DS2P_GobboLeaderTrust == LOG_SUCCESS)){
		return TRUE;
	};
};
func void DIA_TsaHaNauh_AboutYourself_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_AboutYourself_15_01");	//Расскажи о себе.
		AI_Output(self,other,"DIA_TsaHaNauh_AboutYourself_18_02");	//Моя быть вождь племени. Моя стать им рано, когда еще быть очень молод и глуп.
};

// Ты можешь меня чему-нибудь обучить? ----------------------------
//после "Ты ведь вождь этого поселения?" и квест "Доверие вождя" сдан
instance DIA_TsaHaNauh_TeachNot(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 13;
	condition = DIA_TsaHaNauh_TeachNot_condition;	
	information = DIA_TsaHaNauh_TeachNot_info;
	description = "Ты можешь меня чему-нибудь обучить?";
};
func int DIA_TsaHaNauh_TeachNot_condition()
{
	if (Npc_KnowsInfo(other,DIA_TsaHaNauh_AUChief)
		 && (MIS_DS2P_GobboLeaderTrust == LOG_SUCCESS)){
		return TRUE;
	};
};
func void DIA_TsaHaNauh_TeachNot_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_TeachNot_15_01");	//Ты можешь меня чему-нибудь обучить?
		AI_Output(self,other,"DIA_TsaHaNauh_TeachNot_18_02");	//Нет, моя обучать только гоблин.
		AI_Output(self,other,"DIA_TsaHaNauh_TeachNot_18_03");	//Но твоя мочь спросить другой гоблины в деревня.
};

//NS - 20/03/2016 ===========
// Квест "Защита для маленьких"
//===========================

//У тебя есть для меня задания? ----------------------------
//ответ - нет
//постоянный, пока не заработаем доверие
instance DIA_TsaHaNauh_AnyJob1(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 20;
	condition = DIA_TsaHaNauh_AnyJob1_condition;	
	information = DIA_TsaHaNauh_AnyJob1_info;
	description = "У тебя есть для меня задания?";
	permanent = TRUE;
};
func int DIA_TsaHaNauh_AnyJob1_condition()
{
	if (MIS_DS2P_GobboLeaderTrust != LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_AnyJob1_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_01");	//У тебя есть для меня задания?
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_02");	//Сначала человек показать себя.
};
//У тебя есть для меня задания? ----------------------------
//ответ - да
//когда заработаем доверие
instance DIA_TsaHaNauh_AnyJob2(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 21;
	condition = DIA_TsaHaNauh_AnyJob2_condition;	
	information = DIA_TsaHaNauh_AnyJob2_info;
	description = "У тебя есть для меня задания?";
};
func int DIA_TsaHaNauh_AnyJob2_condition()
{
	if (MIS_DS2P_GobboLeaderTrust == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_AnyJob2_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_01");	//У тебя есть для меня задания?
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_03");	//Да, быть. Теперь, когда чужак доказать, что не враг деревня, моя просить помощь.
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_04");	//Что надо сделать?
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_05");	//Наша племя становиться очень маленький, много гоблин умирать за последние поколения. Еще наша есть болотный черви, они большие, а наша маленькие. Они наша есть.
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_06");	//Наше оружие не делать им много вреда. Чтобы убить один червь, на него охотиться пять гоблин-охотник.
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_07");	//Ты хочешь, чтобы я вывел всех болотных червей?
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_08");	//Нет! Черви на болото много-много, сегодня человек бить один, завтра приползать другой.
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_09");	//Не так. Наша надо защитник. Кто будет жить наша деревня и защищать нас.
	AI_Output(other,self,"DIA_TsaHaNauh_AnyJob_15_10");	//И ты предлагаешь стать мне этим защитником? Лестно, конечно, но я не могу всю жизнь провести на болотах, оберегая вас.
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_11");	//Моя и не просить это.
		AI_Output(self,other,"DIA_TsaHaNauh_AnyJob_18_12");	//Но наш разведчик видеть, что на остров приплыть два орка. Твоя говорить с ними, уговорить их жить у нас.
};
//берем квест ----------------------------
//после предыдущего
instance DIA_TsaHaNauh_IWillHelp(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 22;
	condition = DIA_TsaHaNauh_IWillHelp_condition;	
	information = DIA_TsaHaNauh_IWillHelp_info;
	description = "Хорошо, я поговорю с орками.";
};
func int DIA_TsaHaNauh_IWillHelp_condition()
{
	if (Npc_KnowsInfo(other, DIA_TsaHaNauh_AnyJob2))	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_IWillHelp_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_IWillHelp_15_01");	//Хорошо, я поговорю с орками. Но не обещаю, что смогу уговорить их.
		AI_Output(self,other,"DIA_TsaHaNauh_IWillHelp_18_02");	//Человек попытаться.
	//в дневник
	B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Protection4LittleOnes_Start);
};

//ну почему опять я? ----------------------------
//после разговора про орков
instance DIA_TsaHaNauh_WhyMe(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 23;
	condition = DIA_TsaHaNauh_WhyMe_condition;	
	information = DIA_TsaHaNauh_WhyMe_info;
	description = "Почему вы сами не попросите орков?";
};
func int DIA_TsaHaNauh_WhyMe_condition()
{
	if ((MIS_DS2P_Protection4LittleOnes == LOG_Running)
		 && Npc_KnowsInfo(other, DIA_TsaHaNauh_AnyJob2) && !Orcs_CameToGobbos)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_WhyMe_info()
{	
	AI_Output(other,self,"DIA_TsaHaNauh_WhyMe_15_01");	//Почему вы сами не попросите орков?
		AI_Output(self,other,"DIA_TsaHaNauh_WhyMe_18_02");	//Наша опасно уходить с болот.
};

//привели орков ----------------------------
instance DIA_TsaHaNauh_OrcsCame(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 24;
	condition = DIA_TsaHaNauh_OrcsCame_condition;	
	information = DIA_TsaHaNauh_OrcsCame_info;
	description = "Теперь орки будут защищать вас.";
};
func int DIA_TsaHaNauh_OrcsCame_condition()
{
	if ((MIS_DS2P_Protection4LittleOnes == LOG_Running)
		 && Orcs_CameToGobbos)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_OrcsCame_info()
{	
		AI_Output(other,self,"DIA_TsaHaNauh_OrcsCame_15_01");	//Теперь орки будут защищать вас.
		AI_Output(other,self,"DIA_TsaHaNauh_OrcsCame_15_02");	//Я уже привел их в деревню.
	AI_Output(self,other,"DIA_TsaHaNauh_OrcsCame_18_03");	//Спасибо, чужак. Твоя еще раз доказать, что не враг наш деревня. Моя стыдно, что так встретить твоя. Моя просить прощения.
	if (Npc_KnowsInfo(other, DIA_RaDaPo_AboutChief))	{
		AI_Output(other,self,"DIA_TsaHaNauh_OrcsCame_15_04a");	//Да ладно, у тебя была причина, и я не сержусь.
	}
	else	{
		AI_Output(other,self,"DIA_TsaHaNauh_OrcsCame_15_04b");	//Ладно, забыли.
	};
	AI_Output(self,other,"DIA_TsaHaNauh_OrcsCame_18_05");	//Чужак взять этот меч. Он раньше принадлежать великий Гурун, только сильный воин поднять его.
	//Дает меч Гуруна - одноручник с требованием к ловкости
	B_GiveInvItems(self,other,ItMw_DS2P_1H_GurunSword,1);
	//Запись в дневнике "Защита для маленьких". Квест выполнен.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Protection4LittleOnes_Success);
	B_GivePlayerXP(XP_MIS_Protection4LittleOnes_Success);
};


//NS - 20/06/2016 ===========
// Квест "Разгневанные предки"
//===========================

//У тебя есть для меня задания? ----------------------------
//отправляет к шаману за заданием, квест пока не открыт
instance DIA_TsaHaNauh_RaDaPoCalls(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;						nr = 30;
	condition = DIA_TsaHaNauh_RaDaPoCalls_condition;	
	information = DIA_TsaHaNauh_RaDaPoCalls_info;
	important = TRUE;
};
func int DIA_TsaHaNauh_RaDaPoCalls_condition()
{
	if (MIS_DS2P_FuriousAncestors_Stage == MIS_DS2P_FuriousAncestors_TsaHaNauhRemembered)	{
		return TRUE;
	};
};
func void DIA_TsaHaNauh_RaDaPoCalls_info()
{	
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_01");	//Постой, человек, моя забыть. Ра-Да-По хотеть видеть твоя.
		AI_Output(other,self,"DIA_TsaHaNauh_RaDaPoCalls_15_02");	//Что ему надо?
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_03");	//Моя не знать. Твоя идти к шаман и все узнавать.
	MIS_DS2P_FuriousAncestors_Stage = MIS_DS2P_FuriousAncestors_TsaHaNauhTold;
};


//NS - 20/06/2016 ===========
// Приняли в племя
//===========================
instance DIA_TsaHaNauh_JoinedTribe(C_Info)
{
	npc = Gobbo_DS2P_TsaHaNauh;				nr = 40;
	condition = DIA_TsaHaNauh_JoinedTribe_condition;	
	information = DIA_TsaHaNauh_JoinedTribe_info;
	important = TRUE;
};
func int DIA_TsaHaNauh_JoinedTribe_condition()
{
	if (Joined_Gobbos_Tribe && Npc_IsInState(self,ZS_Talk)) {
		return TRUE;
	};
};
func void DIA_TsaHaNauh_JoinedTribe_info()
{	
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_01");	//Моя не думать, что настать такой день, когда человек стать часть племя гоблин. 
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_02");	//Но моя также не думать, что быть день, когда орк и гоблин жить дружно. 
	AI_Output(self,other,"DIA_TsaHaNauh_RaDaPoCalls_18_03");	//Твоя заслужить этот званий.
};

/* UNFINISHED

Ца-Ха-Наух: Моя не думать, что настать такой день, когда человек стать часть племя гоблин. Но моя также не думать, что быть день, когда орк и гоблин жить дружно. Твоя заслужить этот званий.
//*/
