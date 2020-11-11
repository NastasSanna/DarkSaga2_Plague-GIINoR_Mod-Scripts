instance DIA_KuLa_EXIT(DIA_Proto_End)
{
	npc = Gobbo_DS2P_KuLa;
};

//////////////////////////// Общие /////////////////////////////


//===================================================

instance DIA_KuLa_Hello(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_KuLa_Hello_Info;
	description = "Привет.";
};
//Появление: без условия
func void DIA_KuLa_Hello_Info()
{
		AI_Output(other,self,"DIA_KuLa_Hello_15_01");	//Привет.
	AI_Output(self,other,"DIA_KuLa_Hello_19_02");	//Ки-ко, чужак. Моя звать Ку-Ла, быть лучший охотник в деревня.
};

//===================================================
instance DIA_KuLa_WhoIsMain(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 2;
	condition = DIA_KuLa_WhoIsMain_Cond;
	information = DIA_KuLa_WhoIsMain_Info;
	description = "Кто у вас главный?";
};
//Появление: после начального
func int DIA_KuLa_WhoIsMain_Cond()
{
	if (Npc_KnowsInfo(other, DIA_KuLa_Hello))	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsMain_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhoIsMain_15_01");	//Кто у вас главный?
	AI_Output(self,other,"DIA_KuLa_WhoIsMain_19_02");	//Ца-Ха-Наух наш великий вождь. Не такой как Гурун, но тоже великий. 
	AI_Output(self,other,"DIA_KuLa_WhoIsMain_19_03");	//Еще Ра-Да-По. Ра-Да-По - великий шаман. Он научився много у великий Од-Ди-Он.
};



//===================================================
instance DIA_KuLa_WhoIsGurun(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 3;
	condition = DIA_KuLa_WhoIsGurun_Cond;
	information = DIA_KuLa_WhoIsGurun_Info;
	description = "Кто такой Гурун?";
};
//Появление: после «Кто у вас главный?»)
func int DIA_KuLa_WhoIsGurun_Cond()
{
	if (Npc_KnowsInfo(other, DIA_KuLa_WhoIsMain))	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsGurun_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//Кто такой Гурун?
	AI_Output(self,other,"DIA_KuLa_WhoIsGurun_19_02");	//Гурун наш предок, великий шаман и воин.
	AI_Output(self,other,"DIA_KuLa_WhoIsGurun_19_03");	//Он сумей один убивай стая больший черный волки. И делай много добра для наша племя.
};

//===================================================
instance DIA_KuLa_WhoIsOdDiOn(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 4;
	condition = DIA_KuLa_WhoIsOdDiOn_Cond;
	information = DIA_KuLa_WhoIsOdDiOn_Info;
	description = "А Од-Ди-Он кто такой?";
	permanent = TRUE;
	important = TRUE;
};
//Появление: после «Кто у вас главный?»)
func int DIA_KuLa_WhoIsOdDiOn_Cond()
{
	if (Npc_KnowsInfo(other, DIA_KuLa_WhoIsMain))	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsOdDiOn_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhoIsOdDiOn_15_01");	//А Од-Ди-Он кто такой? Тоже великий гоблин?
	AI_Output(self,other,"DIA_KuLa_WhoIsOdDiOn_19_02");	//Ни-та. Од-Ди-Он человек. Он живи один, отшельника.
	AI_Output(self,other,"DIA_KuLa_WhoIsOdDiOn_19_03");	//Од-Ди-Он много помогай племя гоблина, а гоблина никогда не нападай Од-Ди-Он.
		AI_Output(other,self,"DIA_KuLa_WhoIsOdDiOn_15_04");	//Он еще живой?
	AI_Output(self,other,"DIA_KuLa_WhoIsOdDiOn_19_05");	//Ти-ка. Ра-Да-По редко-редко ходи к Од-Ди-Он. Если Од-Ди-Он настроений хороший, они говори.
};



//////////////////////////// Квест: Пропавший друг ////////////////////////////

//===================================================
instance DIA_KuLa_WhomHunting(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 10;
	condition = DIA_KuLa_WhomHunting_Cond;
	information = DIA_KuLa_WhomHunting_Info;
	description = "На кого ты охотишься?";
};
//Появление: после начального
func int DIA_KuLa_WhomHunting_Cond()
{
	if (Npc_KnowsInfo(other, DIA_KuLa_Hello))	{
		return TRUE;
	};
};
func void DIA_KuLa_WhomHunting_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhomHunting_15_01");	//На кого ты охотишься?
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_02");	//Ку-Ла охотися на падальщик, крыс, большой жужжащий мух.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_03");	//Раз даже победи один болотный змей. Ку-Ла получай много-много уважений другой гоблин.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_15_04");	//Да уж, действительно подвиг.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_05");	//(кивая) Ти-ка, ти-ка. 
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_06");	//(грустно) Моя обычно охотиться вместе Та-Ко-Пи. Но Та-Ко-Пи пропасть.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_15_07");	//Та-Ко-Пи - твой друг?
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_08");	//Ти-ка. Та-Ко-Пи друг, Та-Ко-Пи волк.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_09");	//Ку-Ла найти пять весна назад маленький щенок и расти его. Назвать Та-Ко-Пи, Дух Лес.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_19_10");	//Теперь Та-Ко-Пи вырасти, стать большой волк и всегда ходи с Ку-Ла на охота.
	//Выбор варианта (один):
	Info_ClearChoices(DIA_KuLa_WhomHunting);
	Info_AddChoice(DIA_KuLa_WhomHunting, "Я уверен, что он еще найдется.", DIA_KuLa_WhomHunting_Dismiss);
	Info_AddChoice(DIA_KuLa_WhomHunting, "Если встречу его, то приведу обратно в деревню.", DIA_KuLa_WhomHunting_Help);
};

func void DIA_KuLa_WhomHunting_Help()
{
	Info_ClearChoices(DIA_KuLa_WhomHunting);
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Help_15_01");	//Если встречу его, то приведу обратно в деревню.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_02");	//Если чужак сделай так, то Ку-Ла много благодари чужак. Моя имей много трофеи.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Help_15_03");	//Посмотрим, что я могу сделать.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_04");	//Чужак будь осторожнее, Та-Ко-Пи не любить чужак.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_05");	//Чужак говори Та-Ко-Пи: «Чи-ма-ру-то. Ко-ми-га-на-бу». Та-Ко-Пи понимай и иди за чужак.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_06");	//Чужак повтори слова.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Help_15_07");	//(медленно) Чи-ма-ру-та. Ко-ми-го-на-бу.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_08");	//Нет, не так. Чи-ма-ру-тО. Ко-ми-гА-на-бу.
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Help_15_09");	//Чи-ма-ру-то. Ко-ми-га-на-бу.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Help_19_10");	//Да, так правильно. Чужак записай слова, чтобы не забыть.
	//Волк спаунится в дальней части болота
	Wld_InsertNpc(Wolf_DS2P_TaKoPi, WP_TaKoPi_Lost);
	//Запись в дневнике. Квест «Пропавший друг»: Начало
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_Running,TOPIC_DS2P_MissingFriend_Start);
};
func void DIA_KuLa_WhomHunting_Dismiss()
{
	Info_ClearChoices(DIA_KuLa_WhomHunting);
		AI_Output(other,self,"DIA_KuLa_WhomHunting_Dismiss_15_01");	//Я уверен, что он еще найдется.
	AI_Output(self,other,"DIA_KuLa_WhomHunting_Dismiss_19_02");	//Моя ищи его.
};

//===================================================
instance DIA_KuLa_WhenSeenTaKoPi(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 11;
	condition = DIA_KuLa_WhenSeenTaKoPi_Cond;
	information = DIA_KuLa_WhenSeenTaKoPi_Info;
	description = "Когда ты в последний раз видел Та-Ко-Пи?";
};
//Условие: квест «Пропавший друг» активен и еще не говорили с волком
func int DIA_KuLa_WhenSeenTaKoPi_Cond()
{
	if (MIS_DS2P_MissingFriend == LOG_Running && !Wolf_DS2P_TaKoPi.aivar[AIV_TalkedToPlayer])	{
		return TRUE;
	};
};
func void DIA_KuLa_WhenSeenTaKoPi_Info()
{
		AI_Output(other,self,"DIA_KuLa_WhenSeenTaKoPi_15_01");	//Когда в последний раз видел Та-Ко-Пи?
	AI_Output(self,other,"DIA_KuLa_WhenSeenTaKoPi_19_02");	//Три ночь назад на охота на нас нападал болотный змей.
	AI_Output(self,other,"DIA_KuLa_WhenSeenTaKoPi_19_03");	//Та-Ко-Пи убегай и пропадай в глубь на болота. Ку-Ла много раз ходи искати его, но не найти.
	//Запись в дневнике. Квест «Пропавший друг»: Где
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_Running,TOPIC_DS2P_MissingFriend_Where);
};

//===================================================
//Постоянный
instance DIA_KuLa_PermTaKoPi(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 12;
	condition = DIA_KuLa_PermTaKoPi_Cond;
	information = DIA_KuLa_PermTaKoPi_Info;
	description = "Та-Ко-Пи еще не вернулся?";
	permanent = TRUE;
};
//Условие: квест «Пропавший друг» активен и еще не говорили с волком
func int DIA_KuLa_PermTaKoPi_Cond()
{
	if (MIS_DS2P_MissingFriend == LOG_Running && !Wolf_DS2P_TaKoPi.aivar[AIV_TalkedToPlayer])	{
		return TRUE;
	};
};
func void DIA_KuLa_PermTaKoPi_Info()
{
		AI_Output(other,self,"DIA_KuLa_PermTaKoPi_15_01");	//Та-Ко-Пи еще не вернулся?
	AI_Output(self,other,"DIA_KuLa_PermTaKoPi_19_02");	//Ни-та, чужак. Ку-Ла теряй надежда.
};



//===================================================
//Обращается сам
//Участники: Та-Ко-Пи
instance DIA_KuLa_TaKoPiReturned(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 13;
	condition = DIA_KuLa_TaKoPiReturned_Cond;
	information = DIA_KuLa_TaKoPiReturned_Info;
	description = "*Я нашел твоего питомца.";
	important = TRUE;
};
//Условие: возвращаемся с волком в деревню.
func int DIA_KuLa_TaKoPiReturned_Cond()
{
	if (Npc_GetDistToNpc(self, Wolf_DS2P_TaKoPi) < PERC_DIST_ACTIVE_MAX)	{
		return TRUE;
	};
};
func void DIA_KuLa_TaKoPiReturned_Info()
{
    var c_npc TaKoPi;   TaKoPi = Hlp_GetNpc(Wolf_DS2P_TaKoPi);
	//Ку-Ла поворачивается к волку
    AI_TurnToNpc(KuLa, TaKoPi);
	//Волк подбегает к нему и прекращает следовать за ГГ
    AI_GotoNpc(TaKoPi, KuLa);
	B_StartOtherRoutine(TaKoPi, "HOME");
	TaKoPi_FollowState = FollowState_Finished;
	AI_Output(self,other,"DIA_KuLa_TaKoPiReturned_19_01");	//(восторженно) Ипа-цу-на-ка! Та-Ко-Пи ва-да-да.
	//Ку-Ла поворачивается к нам
    AI_TurnToNpc(KuLa, hero);
	AI_Output(self,other,"DIA_KuLa_TaKoPiReturned_19_02");	//Ку-Ла благодари чужак. Чужак бери награда. Ку-ла она не надо, а для чужак полезный.
	//Дает 10 когтей, 10 клыков и шкуры овцы, волка и кабана
	B_GiveInvItems(self, other, ItAt_Claw, 10);
	B_GiveInvItems(self, other, ItAt_Teeth, 10);
	B_GiveInvItems(self, other, ItAt_SheepFur, 1);
	B_GiveInvItems(self, other, ItAt_WolfFur, 1);
	B_GiveInvItems(self, other, ItAt_Addon_KeilerFur, 1);
	//Будет торговать
	//Меняет расписание и иногда уходит с Та-Ко-Пи на охоту
	B_StartOtherRoutine(KuLa, "HUNTING");
	//Запись в дневнике. Квест «Пропавший друг»: Завершение
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_MissingFriend_Success);
};

//////////////////////////// Торговля ////////////////////////////


//===================================================
instance DIA_KuLa_PreTrade(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 1000;
	condition = DIA_KuLa_PreTrade_Cond;
	information = DIA_KuLa_PreTrade_Info;
	description = "Ты продаешь трофеи?";
};
//Появление: выполнен квест "Пропавший друг"
func int DIA_KuLa_PreTrade_Cond()
{
	if (MIS_DS2P_MissingFriend == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_KuLa_PreTrade_Info()
{
		AI_Output(other,self,"DIA_KuLa_PreTrade_15_01");	//Ты продаешь трофеи?
	AI_Output(self,other,"DIA_KuLa_PreTrade_19_02");	//Ти-ка. Ку-Ла сильный охотник, имей много трофей. Ку-Ла продавать их чужак.
	//Запись в дневнике «Торговля»
	B_LogNote(TOPIC_Trader,TOPIC_GobboVillage_Trade_KuLa);
	Gobbo_DS2P_KuLa_Trade = TRUE;
};

//===================================================
instance DIA_KuLa_Trade(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 1001;
	condition = DIA_KuLa_Trade_Cond;
	information = DIA_KuLa_Trade_Info;
	description = "Покажи мне свои товары.";
	trade = TRUE;

};
func int DIA_KuLa_Trade_Cond()
{
	if (Gobbo_DS2P_KuLa_Trade)	{
		return TRUE;
	};
};
func void DIA_KuLa_Trade_Info()
{
		AI_Output(other,self,"DIA_KuLa_Trade_15_01");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_KuLa_Trade_19_02");	//Смотри.
};

//////////////////////////// Обучение ////////////////////////////
//Учит охотничьим навыкам

//===================================================
//Обращается сам
instance DIA_KuLa_PreTeach(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 100;
	condition = DIA_KuLa_PreTeach_Cond;
	information = DIA_KuLa_PreTeach_Info;
	important = TRUE;
};
//Условие: ГГ приняли в племя гоблинов
func int DIA_KuLa_PreTeach_Cond()
{
	if (Gobbos_Attitude == Gobbos_Attitude_Gobbo)	{
		return TRUE;
	};
};
func void DIA_KuLa_PreTeach_Info()
{
	AI_Output(self,other,"DIA_KuLa_PreTeach_19_01");	//Моя слышать, твоя стань часть племя? Это большая честь. Твоя первый человек, кто стань гоблин.
		AI_Output(other,self,"DIA_KuLa_PreTeach_15_02");	//Спасибо. Хотя я сам еще не понимаю, что мне это дает.
	AI_Output(self,other,"DIA_KuLa_PreTeach_19_03");	//Ку-Ла научи твоя охота. Снимай шкур, клык, коготь и много другой.
	//Запись в дневнике «Обучение»
	B_DSG_Log_OpenClose(TOPIC_Teacher,LOG_NOTE,0,TOPIC_GobboVillage_Teach_KuLa);
	//будет учить
	Gobbo_DS2P_KuLa_Teach = TRUE;
};


//===================================================
//Без поддиалогов
instance DIA_KuLa_Teach(C_Info)
{
	npc = Gobbo_DS2P_KuLa;								nr = 101;
	condition = DIA_KuLa_Teach_Cond;
	information = DIA_KuLa_Teach_Info;
	description = "Научи меня.";
};
//Условие: Согласился учить
func int DIA_KuLa_Teach_Cond()
{
	if (Gobbo_DS2P_KuLa_Teach)	{
		return TRUE;
	};
};
func void DIA_KuLa_Teach_Info()
{
		AI_Output(other,self,"DIA_KuLa_Teach_15_01");	//Научи меня.
	// UNFINISHED Указать LP
	//Выбор варианта (один или несколько):
	//•	Снимать шкуры.
	//•	Удалять клыки.
	//•	Вырывать когти.
	//•	Удалять сердце.
	//•	Вырезать рог.
	//•	НАЗАД
};

