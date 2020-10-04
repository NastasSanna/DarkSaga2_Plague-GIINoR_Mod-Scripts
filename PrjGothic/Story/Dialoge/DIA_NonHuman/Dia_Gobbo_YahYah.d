instance DIA_YahYah_EXIT(DIA_Proto_End)
{
	npc = Gobbo_DS2P_YahYah;
};


//////////////////////////// Общие /////////////////////////////
// *при первой встрече
// Обращается сам
var int YahYah_LastDistToWP;
instance DIA_YahYah_Hello(C_Info)
{
	npc = Gobbo_DS2P_YahYah;
	condition = DIA_YahYah_Hello_Cond;
	information = DIA_YahYah_Hello_Info;
	important = TRUE;
};
// Условие: если Ба-Ба-По еще не вернулся в деревню
func int DIA_YahYah_Hello_Cond()
{
	if (MIS_DS2P_FigurinesGurun != LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_YahYah_Hello_Info()
{
	AI_Output(self,other,"DIA_YahYah_Hello_19_01");	//Ухых! Цых-вах-ухых!
	// поднимает топор
	AI_PlayAni(self, "T_WARN");
		AI_Output(other,self,"DIA_YahYah_Hello_15_02");	//Эй, я не причиню тебе вреда. Убери топор.
	// опускает топор UNFINISHED
	//AI_PlayAni(self, "T_LOOK");
	AI_Output(self,other,"DIA_YahYah_Hello_19_03");	//Чихач! Уходи, чужак. Человека нет места в наша деревня.
	// Запись в дневнике. Квест «Проход в деревню гоблинов»: Начало
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_Start);
	YahYah_LastDistToWP = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
};


// Проход разрешен, иди к вождю
func void DIA_YahYah_AccessGranted_GoToChief()
{
	// вход в деревню гоблинов разрешен
	B_DS2P_GobboVillage_GrantAccess();
	AI_Output(self,other,"DIA_YahYah_AccessGranted_GoToChief_19_01");	//Теперь Ях-Ях пропусти чужак. Чужак идти деревня, говори с Ца-Ха-Наух, наш вождь.
	AI_Output(self,other,"DIA_YahYah_AccessGranted_GoToChief_19_02");	//Чужак говори с вождь вежливо, скажи «Ца-Ха-Наух чи-та-ро, бо-на».
	// Запись в дневнике «Деревня гоблинов»: Обращение к вождю
	B_LogNote(TOPIC_GobboVillage, TOPIC_GobboVillage_HelloChief);
};


// *вести от Ба-Ба-По
// Обращается сам
instance DIA_YahYah_BaBaPoReturned(C_Info)
{
	npc = Gobbo_DS2P_YahYah;
	condition = DIA_YahYah_BaBaPoReturned_Cond;
	information = DIA_YahYah_BaBaPoReturned_Info;
	description = "*вести от Ба-Ба-По";
	important = TRUE;
};
// Условие: если Ба-Ба-По уже вернулся в деревню
func int DIA_YahYah_BaBaPoReturned_Cond()
{
	if (MIS_DS2P_FigurinesGurun == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_YahYah_BaBaPoReturned_Info()
{
	AI_Output(self,other,"DIA_YahYah_What_19_01");	//На-чи! Привет, человек!
	AI_Output(self,other,"DIA_YahYah_What_19_02");	//Ба-Ба-По говори человек его брат и друг гоблина.
	
	if (Gobbos_Attitude == Gobbos_Attitude_None) {
		AI_Output(self,other,"DIA_YahYah_What_19_03");	//Ба-Ба-По хороший охотник и умный гоблина. Человек может идти наш деревня.
		//Запись в дневнике. Квест «Проход в деревню гоблинов»: За статуэтки
		B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_Figurines);
		// вход в деревню гоблинов разрешен, иди к вождю
		DIA_YahYah_AccessGranted_GoToChief();
	};
};


// Ух ты! Говорящий гоблин!
instance DIA_YahYah_WowSpeakingGobbo(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 1;
	condition = DIA_YahYah_WowSpeakingGobbo_Cond;
	information = DIA_YahYah_WowSpeakingGobbo_Info;
	description = "Ух ты! Говорящий гоблин!";
};
// Появление: после начального
// Окончание: после завершения квеста «Проход в деревню» или «Статуэтки Гуруна»
func int DIA_YahYah_WowSpeakingGobbo_Cond()
{
	if (MIS_DS2P_EnterGobboVillage != LOG_SUCCESS && MIS_DS2P_FigurinesGurun != LOG_SUCCESS 
		&& !Npc_KnowsInfo(other, DIA_YahYah_WhoAreYou))	
	{
		return TRUE;
	};
};
func void DIA_YahYah_WowSpeakingGobbo_Info()
{
		AI_Output(other,self,"DIA_YahYah_WowSpeakingGobbo_15_01");	//Ух ты! Говорящий гоблин!
	// почти нормальным голосом, передразнивая
	AI_Output(self,other,"DIA_YahYah_WowSpeakingGobbo_19_02");	//(передразнивая) Ух ты! Говорящий человек!
};


// Кто ты?
// Появление: без условия
instance DIA_YahYah_WhoAreYou(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 2;
	condition = DIA_NoCond_cond;
	information = DIA_YahYah_WhoAreYou_Info;
	description = "Кто ты?";
};
func void DIA_YahYah_WhoAreYou_Info()
{
		AI_Output(other,self,"DIA_YahYah_WhoAreYou_15_01");	//Кто ты?
	AI_Output(self,other,"DIA_YahYah_WhoAreYou_19_02");	//Ях-Ях охранник. Охранять деревня от чужак и болотный змей.
	B_LogNote(TOPIC_GobboVillage,TOPIC_GobboVillage_YahYah);
};


// Откуда ты знаешь наш язык?
// Появление: без условия
instance DIA_YahYah_HowKnowsLanguage(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 3;
	condition = DIA_NoCond_cond;
	information = DIA_YahYah_HowKnowsLanguage_Info;
	description = "Откуда ты знаешь наш язык?";
};
func void DIA_YahYah_HowKnowsLanguage_Info()
{
			AI_Output(other,self,"DIA_YahYah_HowKnowsLanguage_15_00");	//Откуда ты знаешь наш язык?
	AI_Output(self,other,"DIA_YahYah_HowKnowsLanguage_19_01");	//Ях-Ях много знай. Ра-Да-По научи Ях-Ях.
			AI_Output(other,self,"DIA_YahYah_HowKnowsLanguage_15_02");	//А Ра-Да-По это?..
	AI_Output(self,other,"DIA_YahYah_HowKnowsLanguage_19_03");	//Ра-Да-По - наш великий шаман.
	B_LogNote(TOPIC_GobboVillage,TOPIC_GobboVillage_RaDaPo);
};


// Не устал охранять?
// Постоянный
instance DIA_YahYah_ArentTired(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 4;
	condition = DIA_YahYah_ArentTired_Cond;
	information = DIA_YahYah_ArentTired_Info;
	description = "Не устал охранять?";
	permanent = TRUE;
};
// Появление: после «Кто ты?»
func int DIA_YahYah_ArentTired_Cond()
{
	if (Npc_KnowsInfo(self,DIA_YahYah_WhoAreYou))	{
		return TRUE;
	};
};
func void DIA_YahYah_ArentTired_Info()
{
		AI_Output(other,self,"DIA_YahYah_ArentTired_15_01");	//Не устал охранять?
	AI_Output(self,other,"DIA_YahYah_ArentTired_19_02");	//Ях-Ях сильный гоблин. Ях-Ях не уставай.
};


// (приняли в племя)
instance DIA_YahYah_BecameGobbe(C_Info)
{
	npc = Gobbo_DS2P_YahYah;
	condition = DIA_YahYah_BecameGobbe_Cond;
	information = DIA_YahYah_BecameGobbe_Info;
	description = "(приняли в племя)";
	important = TRUE;
};
// Условие: ГГ приняли в племя
func int DIA_YahYah_BecameGobbe_Cond()
{
	if (Gobbos_Attitude == Gobbos_Attitude_Gobbo)	{
		return TRUE;
	};
};
func void DIA_YahYah_BecameGobbe_Info()
{
	AI_Output(self,other,"DIA_YahYah_BecameGobbe_19_01");	//Ях-Ях узнавай, что чужак наша много помогай и стань совсем как гоблин.
	AI_Output(self,other,"DIA_YahYah_BecameGobbe_19_02");	//Ях-Ях находи трава на болота. Ра-Да-По говори, это хороший трава, твоя бери.
	// дает царский щавель
	// UNFINISHED какая функция передачи?
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
};


///////////////////////////// Квест: Проход в деревню гоблинов ///////////////////////////////
// Я хочу пройти.
// Постоянный
instance DIA_YahYah_IWantInside(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 10;
	condition = DIA_YahYah_IWantInside_Cond;
	information = DIA_YahYah_IWantInside_Info;
	description = "Я хочу пройти.";
	permanent = TRUE;
};
// Появление: после «Кто ты?»
// Окончание: получили доступ в деревню
func int DIA_YahYah_IWantInside_Cond()
{
	if (Npc_KnowsInfo(self,DIA_YahYah_WhoAreYou) && Gobbos_Attitude == Gobbos_Attitude_None && !MIS_DS2P_EnterGobboVillage_SharkTeeth)	{
		return TRUE;
	};
};
func void DIA_YahYah_IWantInside_Info()
{
		AI_Output(other,self,"DIA_YahYah_IWantInside_15_01");	//Я хочу пройти.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_02");	//Нельзя чужак. Чужак уходи.
	// Выбор варианта (несколько, каждый если еще не пробовали):
	Info_ClearChoices(DIA_YahYah_IWantInside);
	Info_AddChoice(DIA_YahYah_IWantInside,Dialog_Back,DIA_YahYah_IWantInside_Back);
	if (!DIA_YahYah_IWantInside_WhatDoYouWant_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"Что я должен сделать, чтобы ты меня пропустил?",DIA_YahYah_IWantInside_WhatDoYouWant);
	};
	if (!DIA_YahYah_IWantInside_Necklace_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"Я могу дать тебе вот это ожерелье.",DIA_YahYah_IWantInside_Necklace);
	};
	if (!DIA_YahYah_IWantInside_Niente_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"Давай так: ты меня не видел, меня тут не было.",DIA_YahYah_IWantInside_Niente);
	};
	if (!DIA_YahYah_IWantInside_SheGobbo_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"О, смотри, какая гоблинша идет!",DIA_YahYah_IWantInside_SheGobbo);
	};
	if (!DIA_YahYah_IWantInside_100Gold_Once) {
		Info_AddChoice(DIA_YahYah_IWantInside,"Вот тебе сто золотых. Пропусти меня.",DIA_YahYah_IWantInside_100Gold);
	};
};
func void DIA_YahYah_IWantInside_Back()
{
	Info_ClearChoices(DIA_YahYah_IWantInside);
};
// Вот тебе сто золотых. Пропусти меня.
var int DIA_YahYah_IWantInside_100Gold_Once;
func void DIA_YahYah_IWantInside_100Gold()
{
	DIA_YahYah_IWantInside_100Gold_Once = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_100Gold_15_01");	//Вот тебе сто золотых. Пропусти меня.
	AI_Output(self,other,"DIA_YahYah_IWantInside_100Gold_19_02");	//Чужак уходи. Ях-Ях не бери золото.
};
// О, смотри, какая гоблинша идет!
var int DIA_YahYah_IWantInside_SheGobbo_Once;
func void DIA_YahYah_IWantInside_SheGobbo()
{
	DIA_YahYah_IWantInside_SheGobbo_Once = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_SheGobbo_15_01");	//О, смотри, какая гоблинша идет!
	// ГГ указывает рукой в сторону
	AI_PointAt(other,"DP_FOREST_GOBBOVIL_01");
	AI_Wait(self,0.8);
	AI_Output(self,other,"DIA_YahYah_IWantInside_SheGobbo_19_02");	//Ях-Ях есть жена.
	AI_StopPointAt(other);
};
// Давай так: ты меня не видел, меня тут не было.
var int DIA_YahYah_IWantInside_Niente_Once;
func void DIA_YahYah_IWantInside_Niente()
{
	DIA_YahYah_IWantInside_Niente_Once = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_Niente_15_01");	//Давай так: ты меня не видел, меня тут не было.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_Niente_02");	//Чужак есть. Чужак уходи!
};
// Я могу дать тебе ожерелье.
var int DIA_YahYah_IWantInside_Necklace_Once;
func void DIA_YahYah_IWantInside_Necklace()
{
	DIA_YahYah_IWantInside_Necklace_Once = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_Necklace_15_01");	//Я могу дать тебе ожерелье. Оно сделано из клыков дракона.
		AI_Output(other,self,"DIA_YahYah_IWantInside_Necklace_15_02");	//Только представь себе, какое уважение ты примешь в своем племени.
	AI_Output(self,other,"DIA_YahYah_IWantInside_Necklace_19_03");	//Нет. Ях-Ях сильный охотник, старый охотник.
	AI_Output(self,other,"DIA_YahYah_IWantInside_Necklace_19_04");	//Ях-Ях не надо уважение, надо покой. Чужак уходи.
};
// Что я должен сделать, чтобы ты меня пропустил?
var int DIA_YahYah_IWantInside_WhatDoYouWant_Once;
func void DIA_YahYah_IWantInside_WhatDoYouWant()
{
	DIA_YahYah_IWantInside_WhatDoYouWant_Once = TRUE;
	MIS_DS2P_EnterGobboVillage_SharkTeeth = TRUE;
		AI_Output(other,self,"DIA_YahYah_IWantInside_15_01");	//Что я должен сделать, чтобы ты меня пропустил?
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_02");	//Ничего. Чужак уходи.
		AI_Output(other,self,"DIA_YahYah_IWantInside_15_03");	//Да ладно, по твоим глазам вижу, что вам ОЧЕНЬ нужна помощь.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_04");	//Ладно, чужак прав. Наша надо помочь.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_05");	//Болотный змей много нападай наша деревня. Ях-Ях уже старый, тяжело бити змей.
	AI_Output(self,other,"DIA_YahYah_IWantInside_19_06");	//Чужак убий три змей, приноси Ях-Ях их клык, и Ях-Ях пропускай чужак.
	// Заспаунить трех акул недалеко от деревни
	Wld_InsertNpc(Swampshark, WP_GobboEntrance_Shark1);
	Wld_InsertNpc(Swampshark, WP_GobboEntrance_Shark2);
	Wld_InsertNpc(Swampshark, WP_GobboEntrance_Shark3);
	// Запись в дневнике. Квест «Проход в деревню гоблинов»: Задание
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage,LOG_MISSION,LOG_Running,TOPIC_DS2P_EnterGobboVillage_Problem);
	Info_ClearChoices(DIA_YahYah_IWantInside);
};


// Вот, я принес клыки.
// Появление: квест активен
// Условие: есть три клыка болотной акулы
instance DIA_YahYah_GiveSharkTeeth(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 11;
	condition = DIA_YahYah_GiveSharkTeeth_Cond;
	information = DIA_YahYah_GiveSharkTeeth_Info;
	description = "Вот, я принес клыки.";
};
func int DIA_YahYah_GiveSharkTeeth_Cond()
{
	if (MIS_DS2P_EnterGobboVillage_SharkTeeth && Npc_HasItems(other, ItAt_SharkTeeth) >= 3)	{
		return TRUE;
	};
};
func void DIA_YahYah_GiveSharkTeeth_Info()
{
		AI_Output(other,self,"DIA_YahYah_GiveSharkTeeth_15_01");	//Вот, я принес клыки.
	// Отдаем 3 клыка болотной акулы
	B_GiveInvItems(other, self, ItAt_SharkTeeth, 3);
	AI_Output(self,other,"DIA_YahYah_GiveSharkTeeth_19_00");	//Чужак доказал, что друг гоблина.
	if (MIS_DS2P_EnterGobboVillage == LOG_Running) {
		// Запись в дневнике. Квест «Проход в деревню гоблинов»: Отдал клыки
		B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage, LOG_MISSION, LOG_Running, TOPIC_DS2P_EnterGobboVillage_GaveTeeth);
		// Проход разрешен, иди к вождю
		DIA_YahYah_AccessGranted_GoToChief();
	};
};

// Я пришел от Ба-Ба-По.
// Условие: вернули изумрудную статуэтку Ба-Ба-По
// Окончание: получили доступ в деревню
instance DIA_YahYah_FromBaBaPo(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 12;
	condition = DIA_YahYah_FromBaBaPo_Cond;
	information = DIA_YahYah_FromBaBaPo_Info;
	description = "Я пришел от Ба-Ба-По.";
};
func int DIA_YahYah_FromBaBaPo_Cond()
{
	if (MIS_DS2P_EnterGobboVillage == LOG_Running && Gobbos_Attitude == Gobbos_Attitude_None 
		&& MIS_FigurinesGurun_EmeraldReturned)	{
		return TRUE;
	};
};
func void DIA_YahYah_FromBaBaPo_Info()
{
		AI_Output(other,self,"DIA_YahYah_FromBaBaPo_15_01");	//Я пришел от Ба-Ба-По. Он сказал, что ты меня пропустишь.
	AI_Output(self,other,"DIA_YahYah_FromBaBaPo_19_00");	//Ба-Ба-По хороший охотник. Ях-Ях верь ему.
	if (MIS_DS2P_EnterGobboVillage == LOG_Running) {
		// Запись в дневнике. Квест «Проход в деревню гоблинов»: За статуэтки
		B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage, LOG_MISSION, LOG_Running, TOPIC_DS2P_EnterGobboVillage_Figurines);
		// Проход разрешен, иди к вождю
		DIA_YahYah_AccessGranted_GoToChief();
	};
};


//////////////////////////// ОХРАНА /////////////////////////////
// Не пускает в деревню, если ГГ не друг гоблинам
// Появление: подошли ближе
// Окончание: получили доступ в деревню
// Постоянный
// Обращается сам

// *первый рубеж
instance DIA_YahYah_FirstWarn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 0;
	condition = DIA_YahYah_FirstWarn_Cond;
	information = DIA_YahYah_FirstWarn_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_FirstWarn_Cond()
{
	if (Gobbos_Attitude == 0 
		&& self.aivar[AIV_Guardpassage_Status] == GP_NONE 
		&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		&& YahYah_LastDistToWP > Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint))
	{
		return TRUE;
	};
};
func void DIA_YahYah_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_YahYah_FirstWarn_19_01");	//Ррр, дальше нельзя чужак.
	YahYah_LastDistToWP = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	AI_StopProcessInfos(self);
};

// *второй рубеж
instance DIA_YahYah_SecondWarn(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 0;
	condition = DIA_YahYah_SecondWarn_Cond;
	information = DIA_YahYah_SecondWarn_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_SecondWarn_Cond()
{
	if (Gobbos_Attitude == 0 
		&& self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven
		&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		&& YahYah_LastDistToWP > Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint))	{
		return TRUE;
	};
};
func void DIA_YahYah_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_YahYah_SecondWarn_19_00");	//Чужак, еще шаг, и Ях-Ях нападай.
	YahYah_LastDistToWP = Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};

// *последний рубеж
instance DIA_YahYah_Attack(C_Info)
{
	npc = Gobbo_DS2P_YahYah;								nr = 0;
	condition = DIA_YahYah_Attack_Cond;
	information = DIA_YahYah_Attack_Info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_YahYah_Attack_Cond()
{
	if (Gobbos_Attitude == 0 
		&& self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven
		&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE)
		&& YahYah_LastDistToWP > Npc_GetDistToWP(other,WP_GobboEntrance_Checkpoint))	{
		return TRUE;
	};
};
func void DIA_YahYah_Attack_Info()
{
	YahYah_LastDistToWP = PERC_DIST_ACTIVE_MAX;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_YahYah_Attack_19_00");	//Кити-ша-мо!
	// Гоблины становятся враждебными
	B_DS2P_GobboVillage_Hostile();
	// Нападает
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};

////////////////////////////////// Обучение /////////////////////////////////////
// Извлекать клыки


////////////////////////////////// Кража /////////////////////////////////////
// Клык болотожора, сложно
