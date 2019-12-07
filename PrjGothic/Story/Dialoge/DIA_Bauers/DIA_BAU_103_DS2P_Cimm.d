instance DIA_Cimm_EXIT(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Cimm_EXIT_condition;	
	information = DIA_Cimm_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Cimm_EXIT_condition(){	return TRUE;};
func void DIA_Cimm_EXIT_info(){	AI_StopProcessInfos(self);};
//
instance DIA_Cimm_Start(C_Info)	//Начальный диалог
{
	npc = BAU_103_DS2P_Cimm;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Cimm_Start_condition;	
	information = DIA_Cimm_Start_info;
	important = TRUE;
};
func int DIA_Cimm_Start_condition(){	return TRUE;};
func void DIA_Cimm_Start_info()
{
	AI_Output(self,other,"DIA_Cimm_Start_03_00");	//О, посетитель. Цимм всегда рад гостям!
	AI_Output(self,other,"DIA_Cimm_Start_03_01");	//Заходи в мою скромную хижину, сядь, отдохни с дороги, пусть твои усталые косточки почувствуют тепло моего очага.
};
//----
//Появляется после стартового
//----
instance DIA_Cimm_WhatDoUDo(C_Info)	//Чем ты занимаешься?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Cimm_WhatDoUDo_condition;	
	information = DIA_Cimm_WhatDoUDo_info;
	description = "Чем ты занимаешься?";
};
func int DIA_Cimm_WhatDoUDo_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_Start)){	return TRUE;};	};
func void DIA_Cimm_WhatDoUDo_info()
{
		AI_Output(other,self,"DIA_Cimm_WhatDoUDo_15_00");	//Чем ты занимаешься?
	AI_Output(self,other,"DIA_Cimm_WhatDoUDo_03_01");	//О, друг мой, у меня очень древнее занятие, несущее добро и свет Аданоса каждому человеку.
	AI_Output(self,other,"DIA_Cimm_WhatDoUDo_03_02");	//Я помогаю страждущим, лечу от недугов, даю ценные советы.
		AI_Output(other,self,"DIA_Cimm_WhatDoUDo_15_03");	//Ты целитель?
	AI_Output(self,other,"DIA_Cimm_WhatDoUDo_03_04");	//Да, целитель, алхимик, даже немного мудрец. (смеется)
	AI_PlayAni(self,"T_LAUGH_01");
};
//----
//Появляется после предыдущего ("Чем ты занимаешься?")
//----
instance DIA_Cimm_HelpMeToHealTeam(C_Info)	//Помоги мне излечить команду.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 50;
	permanent = FALSE;
	condition = DIA_Cimm_HelpMeToHealTeam_condition;	
	information = DIA_Cimm_HelpMeToHealTeam_info;
	description = "Помоги мне излечить команду.";
};
func int DIA_Cimm_HelpMeToHealTeam_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_WhatDoUDo)){	return TRUE;};	};
func void DIA_Cimm_HelpMeToHealTeam_info()
{
		AI_Output(other,self,"DIA_Cimm_HelpMeToHealTeam_15_00");	//У нас на корабле чума, каждый день кто-то из членов команды впадает в кому. Я не знаю, как помочь им. Помоги мне их излечить.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_01");	//Конечно, конечно! Я с радостью помогу тебе, если ты поможешь мне. (хитро улыбается)
	
		AI_Output(other,self,"DIA_Cimm_HelpMeToHealTeam_15_02");	//Что я должен сделать?
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_03");	//Как ты уже понял, мы оказались в несколько затруднительном положении.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_04");	//Эти пираты вероломно вторглись в нашу размеренную жизнь, и установили совершенно чуждые порядки. Теперь мы живем по принципу - кто сильнее, тот и прав.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_05");	//Чуждая, звериная, самая примитивная из всех систем общества.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_06");	//Так вот, пару дней назад один из этих дегенератов по имени Саймон, извиняюсь за мой миртанский, вломился ко мне в дом и сказал, что теперь я обязан платить ему налог.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_07");	//Дескать, у меня золота куры не клюют, что я наторговал целое богатство и не хочу делиться.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_08");	//А если я откажусь платить ему дань, то он будет каждый день навещать меня и проводить разъяснительную работу, а проще говоря - бить.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_09");	//Я человек мирный и не приемлю насилие, поэтому противопоставить ему ничего не могу.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_10");	//А те, кто может из деревенских, делать этого не хотят, так как пираты удерживают наших женщин в плену.
	AI_Output(self,other,"DIA_Cimm_HelpMeToHealTeam_03_11");	//В общем, я попал в трудное положение, и кроме тебя мне никто не сможет помочь избавить меня от этой проблемы.
		AI_Output(other,self,"DIA_Cimm_HelpMeToHealTeam_15_12");	//Я подумаю, что можно сделать.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_CimmHelp);
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_Start);
};
//----
//Появляется после предыдущего ("Помоги мне излечить команду.") при завершении квеста
//----
instance DIA_Cimm_SymonIsNotYourProblem(C_Info)	//Можешь больше не волноваться насчет Саймона, он отказался от дани.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 50;
	condition = DIA_Cimm_SymonIsNotYourProblem_condition;	
	information = DIA_Cimm_SymonIsNotYourProblem_info;
	description = "Можешь больше не волноваться насчет Саймона.";
};
func int DIA_Cimm_SymonIsNotYourProblem_condition(){	
	if((MIS_DS2P_UnhappyHealer == Log_Running) && Symon_IsNot_Problem_4Cimm)
	{	return TRUE;};	
};
func void DIA_Cimm_SymonIsNotYourProblem_info()
{
		AI_Output(other,self,"DIA_Cimm_SymonIsNotYourProblem_15_00");	//Можешь больше не волноваться насчет Саймона, он отказался от дани.
	AI_Output(self,other,"DIA_Cimm_SymonIsNotYourProblem_03_00");	//Неужели? Как хорошо. Наконец-то я смогу немного успокоиться, а то только и ждал стука в дверь.
		AI_Output(other,self,"DIA_Cimm_SymonIsNotYourProblem_15_01");	//Что насчет помощи в поиске лекарства от чумы?
	AI_Output(self,other,"DIA_Cimm_SymonIsNotYourProblem_03_01");	//Конечно, конечно, я все помню, я применю все свое искусство, чтобы помочь твоим друзьям. Зайди ко мне через денек-другой. Вероятно, мне придется посетить...
	AI_Output(self,other,"DIA_Cimm_SymonIsNotYourProblem_03_02");	//Кхм, посетить лес в поисках особых трав.	
		AI_Output(other,self,"DIA_Cimm_SymonIsNotYourProblem_15_02");	//Я полагаюсь на твою помощь.
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_UnhappyHealer_Success);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_CimmHelp_1);
	Cimm_HelpDay = Wld_GetDay();
};
//----
//Появляется после предыдущего ("Можешь больше не волноваться насчет Саймона.")
//----
instance DIA_Cimm_FindingCure(C_Info)	//Как идут поиски лекарства?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 50;
	condition = DIA_Cimm_FindingCure_condition;	
	information = DIA_Cimm_FindingCure_info;
	description = "Как идут поиски лекарства?";
};
func int DIA_Cimm_FindingCure_condition(){	
	if((MIS_DS2P_UnhappyHealer == LOG_SUCCESS) && (Wld_GetDay() > Cimm_HelpDay))
	{	return TRUE;};	
};
func void DIA_Cimm_FindingCure_info()
{
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_00");	//Как идут поиски лекарства?
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//Друг мой, все оказалось гораздо сложнее. В основе этой болезни мне видятся не естественные природные процессы, а рука высших сил.
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_01");	//Я работаю, но работа продвигается слишком медленно. Боюсь, что времени может не хватить.
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_01");	//(вздохнув) Я так и знал, что по-хорошему не получится. Можно как-то ускорить твою работу?
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_02");	//: (ворчливо) Если только ты не первоклассный алхимик или опытный маг, иначе только под ногами будешь путаться.
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_03");	//На этом острове есть только один человек, который сможет мне помочь.
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_02");	//Вообще-то есть еще Ватрас, я могу поручиться за него...
	if(Npc_KnowsInfo(other,DIA_Cimm_WhoIsEkor))	
	{
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_03");	//А тот человек, ты про Экора? Ты уже упоминал это имя.
		AI_Output(self,other,"DIA_Cimm_FindingCure_03_04");	//Да, про него, нужно просить помощи у него. 
	}
	else
	{
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_04");	//А что за человек?
		AI_Output(self,other,"DIA_Cimm_FindingCure_03_05");	//Его зовут Экор, он отшельник и очень нелюдимый, но при этом алхимик на порядок лучше меня.
	};
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_06");	//Я сейчас набросаю письмо, и ты его отнесешь.
	
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_00");	//Письмо? Да я и так смогу все растолковать. Где он живет?
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//(смущенно) Наверное сможешь, только вряд ли он тебя станет слушать. 
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//Понимаешь, он уже лет пятнадцать или двадцать... Даже и не знаю сколько, живет один, и характер от этого у него лучше не стал.
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//Меня он еще слушает, некоторых местных, но с тобой вряд ли станет общаться и тем более помогать.
		AI_Output(other,self,"DIA_Cimm_FindingCure_15_00");	//(задумчиво) Знаю такой тип. Брата по имени Ксардас у него никогда не было?
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//Ксардас? Мне это имя незнакомо. Вообще вряд ли, Экор местный, с самого рождения жил на острове.
	/*UNFINISH*/
	B_UseFakeBook();
	AI_Output(self,other,"DIA_Cimm_FindingCure_03_00");	//Экор обитает /*REDLEHA: там-то*. Вот письмо, передашь его, и он должен помочь.
	B_GiveInvItems(self,other,ITWr_DS2P_Letter_fCimm_tEkor,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_CimmGoToEkor);
	/*Вставляем Экора сейчас*/
	Wld_InsertNpc(OUT_400_DS2P_Ekor,"");
};
//----
//Появляется после предыдущего ("Помоги мне излечить команду.")
//----
instance DIA_Cimm_HowIsTheTrade(C_Info)	//Как идет торговля?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 501;
	permanent = TRUE;
	condition = DIA_Cimm_HowIsTheTrade_condition;	
	information = DIA_Cimm_HowIsTheTrade_info;
	description = "Как идет торговля?";
};
func int DIA_Cimm_HowIsTheTrade_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_HelpMeToHealTeam)){	return TRUE;};	};
func void DIA_Cimm_HowIsTheTrade_info()
{
		AI_Output(other,self,"DIA_Cimm_HowIsTheTrade_15_00");	//Как идет торговля?
	AI_Output(self,other,"DIA_Cimm_HowIsTheTrade_03_01");	//Сейчас не очень. Пиратам интересна больше выпивка, нежели мои припарки.
};
//----
//Появляется после предыдущего ("Помоги мне излечить команду.")
//----
instance DIA_Cimm_CanUMakePotions4Me(C_Info)	//Ты можешь изготовить для меня зелья? /*ИЗГОТОВЛЕНИЕ В ОТДЕЛЬНОМ ФАЙЛЕ С ОБУЧЕНИЕМ АЛХИМИИ*/
{
	npc = BAU_103_DS2P_Cimm;
	nr = 502;
	permanent = FALSE;
	condition = DIA_Cimm_CanUMakePotions4Me_condition;	
	information = DIA_Cimm_CanUMakePotions4Me_info;
	description = "Ты можешь изготовить для меня зелья?";
};
func int DIA_Cimm_CanUMakePotions4Me_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_HelpMeToHealTeam)){	return TRUE;};	};
func void DIA_Cimm_CanUMakePotions4Me_info()
{
		AI_Output(other,self,"DIA_Cimm_CanUMakePotions4Me_15_00");	//Ты можешь изготовить для меня зелья?
	AI_Output(self,other,"DIA_Cimm_CanUMakePotions4Me_03_01");	//В принципе, да. Если ты принесешь все необходимые травы и немного золота, то я с радостью сварю для тебя несколько зелий.
	B_DSG_Log_OpenClose(TOPIC_DS2P_MakingPotionsInVillage,LOG_NOTE,-1,"Алхимик Цимм может изготовить для меня зелья, если я принесу ему необходимые ингредиенты.");
	/*ИЗГОТОВЛЕНИЕ В ОТДЕЛЬНОМ ФАЙЛЕ С ОБУЧЕНИЕМ АЛХИМИИ*/
};
//----
//Появляется после предыдущего ("Чем ты занимаешься?")
//----
instance DIA_Cimm_PreTeachAlchemy(C_Info)	//Научи меня алхимии. /*ОБУЧЕНИЕ В ОТДЕЛЬНОМ ФАЙЛЕ*/
{
	npc = BAU_103_DS2P_Cimm;
	nr = 51;
	permanent = FALSE;
	condition = DIA_Cimm_PreTeachAlchemy_condition;	
	information = DIA_Cimm_PreTeachAlchemy_info;
	description = "Научи меня алхимии.";
};
func int DIA_Cimm_PreTeachAlchemy_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_WhatDoUDo)){	return TRUE;};	};
func void DIA_Cimm_PreTeachAlchemy_info()
{
	AI_Output(other,self,"DIA_Cimm_PreTeachAlchemy_15_00");	//Научи меня алхимии.
	AI_Output(self,other,"DIA_Cimm_PreTeachAlchemy_03_01");	//Ты хочешь познать искусство алхимии? Очень похвально! Я именно тот, кто тебе нужен.
	AI_Output(self,other,"DIA_Cimm_PreTeachAlchemy_03_02");	//За скромную плату я обучу тебя изготавливать все известные в королевстве зелья.
	AI_Output(self,other,"DIA_Cimm_PreTeachAlchemy_03_03");	//Скажу больше, помимо обычных эликсиров, я знаю, как изготовить такие напитки, которые на некоторое время увеличат твои возможности, а также укрепят дух и силу.
	AI_Output(self,other,"DIA_Cimm_PreTeachAlchemy_03_04");	//Но и это еще не все, я могу показать, как изготавливать яды и противоядия! А это, друг мой, умеет далеко не каждый алхимик.
	B_DSG_Log_OpenClose(TOPIC_BauerTeacher,LOG_NOTE,-1,"Алхимик Цимм может научить меня алхимии.");
	/*ОБУЧЕНИЕ В ОТДЕЛЬНОМ ФАЙЛЕ*/
	//UNFINISHED
};
//----
//Появляется после предыдущего ("Чем ты занимаешься?")
//----
instance DIA_Cimm_CanIBuyPotions(C_Info)	//Я могу купить у тебя зелья?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 52;
	permanent = FALSE;
	condition = DIA_Cimm_CanIBuyPotions_condition;	
	information = DIA_Cimm_CanIBuyPotions_info;
	description = "Я могу купить у тебя зелья?";
	trade = TRUE;
};
func int DIA_Cimm_CanIBuyPotions_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_WhatDoUDo)){	return TRUE;};	};
func void DIA_Cimm_CanIBuyPotions_info()
{
	AI_Output(other,self,"DIA_Cimm_CanIBuyPotions_15_00");	//Я могу купить у тебя зелья?
	AI_Output(self,other,"DIA_Cimm_CanIBuyPotions_03_00");	//Конечно! У меня множество всяких припарок, травок и зелий. Ото всех недугов и хворей. Смотри, выбирай.
	B_GiveTradeInv(self);
	B_DSG_Log_OpenClose(TOPIC_BauerTrader,LOG_NOTE,-1,"Целитель Цимм продает зелья и травы.");
};
instance DIA_Cimm_Trade(C_Info)	//Торговля
{
	npc = BAU_103_DS2P_Cimm;
	nr = 52;
	permanent = TRUE;
	condition = DIA_Cimm_Trade_condition;	
	information = DIA_Cimm_Trade_info;
	description = "Покажи мне свои травы и зелья.";
	trade = TRUE;
};
func int DIA_Cimm_Trade_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_CanIBuyPotions)){	return TRUE;};	};
func void DIA_Cimm_Trade_info()
{
	AI_Output(other,self,"DIA_Cimm_Trade_15_00");	//Покажи мне свои травы и зелья.
	AI_Output(self,other,"DIA_Cimm_Trade_03_00");	//У меня очень богатый выбор. Смотри, выбирай.
	B_GiveTradeInv(self);
};
//**------------------------------------------------------------------------------
//--------------------ПАУЗА-------------------------------------------------------
//**------------------------------------------------------------------------------

//----
//Появляется после стартового (Если взят квест ”Внук рыбака”)(если еще не получил информацию у Марии))
//----
instance DIA_Cimm_ImLookingForGaron(C_Info)	//Я ищу Гарона.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Cimm_ImLookingForGaron_condition;	
	information = DIA_Cimm_ImLookingForGaron_info;
	description = "Я ищу Гарона.";
};
func int DIA_Cimm_ImLookingForGaron_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Cimm_Start) && (MIS_DS2P_GrandsonOfFisherman == LOG_Running) && !Npc_KnowsInfo(other,DIA_Maria_AboutGaron))
	{return TRUE;};	
};
func void DIA_Cimm_ImLookingForGaron_info()
{
	AI_Output(other,self,"DIA_Cimm_ImLookingForGaron_15_00");	//Я ищу Гарона.
	AI_Output(self,other,"DIA_Cimm_ImLookingForGaron_03_00");	//Гарон? Это внук рыбака, я ведь не ошибся?!
	AI_Output(other,self,"DIA_Cimm_ImLookingForGaron_15_01");	//Да, он самый. Ты видел его?
	AI_Output(self,other,"DIA_Cimm_ImLookingForGaron_03_01");	//Пару дней назад он забегал ко мне за зельями. Он был весь в крови, в ссадинах и синяках.
	AI_Output(self,other,"DIA_Cimm_ImLookingForGaron_03_02");	//Я дал несколько отваров. Гарон не стал отвечать на мои вопросы и сразу убежал.
	AI_Output(self,other,"DIA_Cimm_ImLookingForGaron_03_03");	//Больше я о нем ничего не знаю.
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_01);
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_CimmSeen);
};

//----
//Появляется после стартового
//----
instance DIA_Cimm_TellMeAboutVillage(C_Info)	//Расскажи мне о деревне.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Cimm_TellMeAboutVillage_condition;	
	information = DIA_Cimm_TellMeAboutVillage_info;
	description = "Расскажи мне о деревне.";
};
func int DIA_Cimm_TellMeAboutVillage_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Cimm_Start)) 	{return TRUE;};	
};
func void DIA_Cimm_TellMeAboutVillage_info()
{
	AI_Output(other,self,"DIA_Cimm_TellMeAboutVillage_15_00");	//Расскажи мне о деревне.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_00");	//Наша деревня очень древняя. Наши предки основали здесь поселение много столетий назад.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_01");	//Это был большой торговый пост.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_02");	//Но время и многочисленные войны стерли былое величие.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_03");	//Давно уже корабли не подходят к пристани, а значит, нет торговли, нет приезжих, мало золота.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_04");	//Мы остались никому не нужны, и выживаем, как можем.
	AI_Output(self,other,"DIA_Cimm_TellMeAboutVillage_03_05");	//Но я не отчаиваюсь, возможно, наши дети смогут восстановить все то, что мы потеряли.
};
//----
//Появляется после стартового (если хотя бы раз общался с Дилом)
//----
instance DIA_Cimm_IMetDil(C_Info)	//Я встретил Дила.
{
	npc = BAU_103_DS2P_Cimm;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Cimm_IMetDil_condition;	
	information = DIA_Cimm_IMetDil_info;
	description = "Я встретил Дила.";
};
func int DIA_Cimm_IMetDil_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Cimm_Start) && (Bau_102_DS2P_Dil.aivar[AIV_TalkedToPlayer] == TRUE)) 	{return TRUE;};	
};
func void DIA_Cimm_IMetDil_info()
{
	AI_Output(other,self,"DIA_Cimm_IMetDil_15_00");	//В деревне я встретил крестьянина, похоже, он тронулся умом.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_00");	//А, должно быть, ты говоришь о Диле, нашем юродивом. Но не торопись называть его сумасшедшим.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_01");	//Иногда, пообщавшись с ним, мне кажется, что это мы здесь все сошли с ума, а он самый разумный человек из тех, кого я встречал в жизни.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_02");	//Просто у него так много мыслей, что он не может их выстраивать в логические цепочки и доносить нам на понятном языке, но это не умаляет их смысла.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_03");	//”Умеющий уши да услышит!” - именно так он однажды сказал мне.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_04");	//После этого я перестал считать его дурачком.
	
	AI_Output(other,self,"DIA_Cimm_IMetDil_15_01");	//А что с ним случилось? Или он всегда был таким?
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_05");	//Отнюдь. Раньше он был вполне обычным молодым человеком, и никто никогда не замечал за ним никаких странностей.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_06");	//Но пару лет назад случилось несчастье. То есть даже череда несчастий.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_07");	//Сначала  скоропостижно скончалась его мать, через пару дней отец. Самое интересное, что перед смертью они ни на что не жаловались и вели себя как обычно.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_08");	//Перед погребением я осмотрел их тела и не нашел ничего необычного.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_09");	//Дил хорошо держался. Мы очень радовались, что парень не сломался и стойко переносит горе.
	
	AI_Output(other,self,"DIA_Cimm_IMetDil_15_02");	//Но это оказалось не так.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_10");	//Да. Сначала стали происходить странности.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_11");	//Из дома, где жила семья Дила по ночам стали доносится странные звуки.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_12");	//Мы думали, что это наш парень в тайне ото всех плачет по почившим родителям.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_13");	//Но через пару дней звуки повторились, но теперь это больше походило на рев или крик ужаса.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_14");	//В общем, когда я услышал эти вопли, у меня мурашки по телу побежали. 
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_15");	//Всей деревней мы выбежали из своих домов и побежали к дому Дила. Мы долго не решались войти.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_16");	//Первым решился наш кузнец Густав. Уж не знаю, что там он увидел, но когда он вернулся c бесчувственным Дилом, то был абсолютно седым.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_17");	//Дила я выхаживал около недели, но привести в чувство так и не смог.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_18");	//Пришлось идти в лес и собирать особо редкие травы для одного зелья, рецепт которого когда-то мне рассказал отшельник Экор.
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_19");	//Зелье вернуло Дилу сознание, но не смогло вернуть разум... (вздыхает)
	AI_Output(self,other,"DIA_Cimm_IMetDil_03_20");	//Потом мы не раз расспрашивали Густава, что случилось в ту ночь, но он просто смотрел на нас безразличными глазами и молча уходил.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TerrorInNight,LOG_MISSION,LOG_Running,TOPIC_DS2P_TerrorInNight_Start);
};
//----
//Появляется после предыдущего ("Я встретил Дила."), фактически взятия квеста "Ужас в ночи"
//----
instance DIA_Cimm_WhereCanIFindGustav(C_Info)	//Где я могу найти кузнеца Густава?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 80;
	permanent = FALSE;
	condition = DIA_Cimm_WhereCanIFindGustav_condition;	
	information = DIA_Cimm_WhereCanIFindGustav_info;
	description = "Где я могу найти кузнеца Густава?";
};
func int DIA_Cimm_WhereCanIFindGustav_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_IMetDil)) 	{return TRUE;};	};
func void DIA_Cimm_WhereCanIFindGustav_info()
{
	AI_Output(other,self,"DIA_Cimm_WhereCanIFindGustav_15_00");	//Где я могу найти кузнеца Густава?
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_00");	//Это хороший вопрос.
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_01");	//Когда напали пираты, была ночь, их было больше, а самые опытные бойцы - Том, Фарт и Джин за день до того ушли в лес на охоту.
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_02");	//Густав и еще несколько мужчин попытались оказать сопротивление, но все было тщетно.
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_03");	//Я видел, что Густав зарубил несколько пиратов, но был ранен, и в суматохе сражения я потерял его из виду.
	AI_Output(self,other,"DIA_Cimm_WhereCanIFindGustav_03_04");	//Поэтому, где он и жив ли, вообще я не знаю.
};
//----
//Появляется после предыдущего ("Я встретил Дила.")
//----
instance DIA_Cimm_WhoIsEkor(C_Info)	//Кто такой Экор?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 81;
	permanent = FALSE;
	condition = DIA_Cimm_WhoIsEkor_condition;	
	information = DIA_Cimm_WhoIsEkor_info;
	description = "Кто такой Экор?";
};
func int DIA_Cimm_WhoIsEkor_condition(){	
	if(Npc_KnowsInfo(other,DIA_Cimm_IMetDil) && !Npc_KnowsInfo(other,DIA_Cimm_FindingCure))
	{return TRUE;};	
};
func void DIA_Cimm_WhoIsEkor_info()
{
	AI_Output(other,self,"DIA_Cimm_WhoIsEkor_15_00");	//Кто такой Экор?
	AI_Output(self,other,"DIA_Cimm_WhoIsEkor_03_00");	//Это отшельник, живущий в лесу на другом конце острова. Он очень мудрый и загадочный человек.
	AI_Output(self,other,"DIA_Cimm_WhoIsEkor_03_01");	//Я несколько раз ходил к нему за советом и помощью, и он никогда мне не отказывал.
	AI_Output(other,self,"DIA_Cimm_WhoIsEkor_15_01");	//Как мне найти его?
	AI_Output(self,other,"DIA_Cimm_WhoIsEkor_03_02");	//(/*UNFINISHED УТОЧНЕНИЕ МЕСТА*/)
};
//----
//Появляется после предыдущего ("Я встретил Дила.")
//----
instance DIA_Cimm_WhoNowLivesInDilHouse(C_Info)	//Кто теперь живет в доме Дила?
{
	npc = BAU_103_DS2P_Cimm;
	nr = 82;
	permanent = FALSE;
	condition = DIA_Cimm_WhoNowLivesInDilHouse_condition;	
	information = DIA_Cimm_WhoNowLivesInDilHouse_info;
	description = "Кто теперь живет в доме Дила?";
};
func int DIA_Cimm_WhoNowLivesInDilHouse_condition(){	if(Npc_KnowsInfo(other,DIA_Cimm_IMetDil)) 	{return TRUE;};	};
func void DIA_Cimm_WhoNowLivesInDilHouse_info()
{
	AI_Output(other,self,"DIA_Cimm_WhoNowLivesInDilHouse_15_00");	//Кто теперь живет в доме Дила?
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_00");	//После того случая мы как-то с опаской стали относиться к этому дому. От него идет какая-то плохая энергия.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_01");	//Я даже не знаю как это объяснить... (задумался)
	AI_PlayAni(self,"R_SCRATCHHEAD");
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_02");	//Однажды я решил зайти в дом. Но стоило переступить порог, как меня начали переполнять страх и ужас.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_03");	//Я решил, что это самовнушение, и сделал еще несколько шагов. Страх перерос в такую силу, что меня начало трясти, а одежда пропиталась холодным потом.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_04");	//Я не выдержал и убежал оттуда. Не буду скрывать - так напуган я не был никогда в жизни.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_05");	//Мне кажется, Дил пробудил какие-то древние силы, которые теперь выбрались на свободу и облюбовали этот дом в качестве убежища.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_06");	//После этого случая Кадар, наш староста, приказал забить досками все окна, а на дверь поставить замок.
	AI_Output(self,other,"DIA_Cimm_WhoNowLivesInDilHouse_03_07");	//Теперь туда никто не может попасть, даже если захочет.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TerrorInNight,LOG_MISSION,LOG_Running,TOPIC_DS2P_TerrorInNight_DilsHouseKey);
};


//NS - 24/06/2013 ==========================================================
// По квесту "Крепость духа" 
//==========================================================================

//----------------------------
// Отдать яйцо королевы ползунов Цимму	nr=91
instance DIA_Cimm_CrawlerEgg(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 91;
	condition = DIA_Cimm_CrawlerEgg_condition;	
	information = DIA_Cimm_CrawlerEgg_info;
	description = "Я нашел яйцо королевы ползунов.";
};
func int DIA_Cimm_CrawlerEgg_condition()
{
	if (Npc_HasItems(other,ItAt_Egg_CrawlerQueen) > 0)
	{	return TRUE;	};
};
func void DIA_Cimm_CrawlerEgg_info()
{
	AI_Output(other,self,"DIA_Cimm_CrawlerEgg_15_00");	//Я нашел яйцо королевы ползунов.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_Fortitude_CrawlerEgg);
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_01");	//Вот это да! Как тебе удалось заполучить такой редкий компонент? Невероятно.
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_02");	//Я думал, это просто легенды, что у ползунов есть королева! Дай-ка я разгляжу его получше.
	//Забирает яйцо
	B_DS_GiveRemoveItems(other,self,ItAt_Egg_CrawlerQueen,1);
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_03");	//Да, нет никакой ошибки, ты говоришь правду. Если отдашь мне это яйцо, я сумею сделать для тебя один очень редкий напиток, который сделает тебя намного сильнее.
	AI_Output(other,self,"DIA_Cimm_CrawlerEgg_15_04");	//Да забирай, оно мне ни к чему.
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_05");	//О да! Это будет венец моей славы! Да! Я сохранил один очень ветхий фолиант, в котором описывается это зелье - зелье ”Крепости духа”.
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_06");	//Он сделает тебя намного сильнее, укрепит твои мышцы так, что ни один меч и стрела тебе будут не страшны. Но придется еще кое в чем мне помочь. Одного яйца мало, нужны еще ингредиенты.
	AI_Output(other,self,"DIA_Cimm_CrawlerEgg_15_07");	//Что еще нужно?
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_08");	//Чтобы стать сильным и неуязвимым, помимо жизненной силы ползунов, сокрытой в этом яйце, необходимо добыть рог мракориса, клык варга и сердце голема.
		AI_Output(self,other,"DIA_Cimm_CrawlerEgg_03_09");	//Каждый из компонентов дает часть своей силы: рог мракорисадает крепость твоим мышцам, клык варга - скорость восстановления и заживления твоей кожи, а сердце голема - магическую силу зелью, связывая и укрепляя между собой все компоненты.

	//Запись в дневнике "Крепость духа" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Fortitude,LOG_MISSION,LOG_Running,TOPIC_DS2P_Fortitude_Potion);
	MIS_DS2P_Fortitude_IngredientsKnow = TRUE;
	
	//Варги и мракорис спаунятся в лесу, болотный голем на болоте
	/* UNFINISHED
	Wld_InsertNpc(Warg, "");
	Wld_InsertNpc(Warg, "");
	Wld_InsertNpc(Warg, "");
	Wld_InsertNpc(Shadowbeast, "");
	Wld_InsertNpc(SwampGolem, "");
	//*/
};

//----------------------------
// "А почему зелье называется ”Крепость духа”?"	nr=92
instance DIA_Cimm_WhyFortitude(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 92;
	condition = DIA_Cimm_WhyFortitude_condition;	
	information = DIA_Cimm_WhyFortitude_info;
	description = "А почему зелье называется ”Крепость духа”?";
};
func int DIA_Cimm_WhyFortitude_condition()
{
	if (Npc_KnowsInfo(other,DIA_Cimm_CrawlerEgg))
	{	return TRUE;	};
};
func void DIA_Cimm_WhyFortitude_info()
{
	AI_Output(other,self,"DIA_Cimm_WhyFortitude_15_00");	//А почему зелье называется ”Крепость духа”?
	AI_Output(other,self,"DIA_Cimm_WhyFortitude_15_01");	//Если оно укрепляет не мои магические навыки, а защищает от оружия и стрел.
		AI_Output(self,other,"DIA_Cimm_WhyFortitude_03_02");	//Как ты не поймешь, это же все взаимосвязано! Если у тебя крепкий дух, то у тебя и крепкое тело.
		AI_Output(self,other,"DIA_Cimm_WhyFortitude_03_03");	//Дух дает концентрацию, способность так собрать свою жизненную энергию, что ты становишься практически неуязвимым.

};

//----------------------------
// "Где мне найти этих зверей?"	nr=93
instance DIA_Cimm_WhereFindAnimals(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 93;
	condition = DIA_Cimm_WhereFindAnimals_condition;	
	information = DIA_Cimm_WhereFindAnimals_info;
	description = "Где мне найти этих зверей?";
};
func int DIA_Cimm_WhereFindAnimals_condition()
{
	if (Npc_KnowsInfo(other,DIA_Cimm_CrawlerEgg) && (MIS_DS2P_Fortitude == LOG_Running))
	{	return TRUE;	};
};
func void DIA_Cimm_WhereFindAnimals_info()
{
	AI_Output(other,self,"DIA_Cimm_WhereFindAnimals_15_00");	//Где мне найти этих зверей?
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_01");	//Я не охотник, но могу предположить, что мракориса и варгов ты найдешь в наших лесах.
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_02");	//Я слышал от Тамира, что в последнее время их развелось более чем достаточно.
	AI_Output(other,self,"DIA_Cimm_WhereFindAnimals_15_03");	//А голема? Может быть големы тоже заполонили окрестные леса?
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_04");	//(смеется) Нет, конечно. Из того, что я знаю, големы обитают на болотах.
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_05");	//Насколько я знаю, их призывают шаманы гоблинов, у которых там лагерь.
		AI_Output(self,other,"DIA_Cimm_WhereFindAnimals_03_06");	//Это очень опасное место, поэтому советую хорошо подготовиться и прикупить у меня зелий. Големы очень опасны!
};

//----------------------------
// "Где находится болото?"	nr=94
instance DIA_Cimm_WhereFindSwamp(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 94;
	condition = DIA_Cimm_WhereFindSwamp_condition;	
	information = DIA_Cimm_WhereFindSwamp_info;
	description = "Где находится болото?";
};
func int DIA_Cimm_WhereFindSwamp_condition()
{
	if (Npc_KnowsInfo(other,DIA_Cimm_WhereFindAnimals) && (MIS_DS2P_Fortitude == LOG_Running))
	{	return TRUE;	};
};
func void DIA_Cimm_WhereFindSwamp_info()
{
	AI_Output(other,self,"DIA_Cimm_WhereFindSwamp_15_00");	//Где находится болото?
	// UNFINISHED
		AI_Output(self,other,"DIA_Cimm_WhereFindSwamp_03_01");	//Оно находится там-то и там-то.
};

//----------------------------
// Сдать квест	nr=95
var int Cimm_FortitudeIngredients_Stage;
instance DIA_Cimm_FortitudeIngredients(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 95;
	condition = DIA_Cimm_FortitudeIngredients_condition;	
	information = DIA_Cimm_FortitudeIngredients_info;
	description = "Я нашел ингредиенты для зелья ”Крепость духа”.";
};
func int DIA_Cimm_FortitudeIngredients_condition()
{
	if ((MIS_DS2P_Fortitude == LOG_Running) && MIS_DS2P_Fortitude_IngredientsKnow 
		&& (Npc_HasItems(other,ItAt_ShadowHorn) > 0)
			&& (Npc_HasItems(other,ItAt_DS2P_Teeth_Warg) > 0)
			&& (Npc_HasItems(other,ItAt_DS2P_Heart_SwampGolem) > 0))
	{	return TRUE;	};
};
func void DIA_Cimm_FortitudeIngredients_DrinkFortitude()
{
	CreateInvItem(other, ItPo_DS2P_Perm_Fortitude);
	AI_TurnToNpc(other,self);
	AI_UseItem(other,ItPo_DS2P_Perm_Fortitude);
	Wld_PlayEffect("SLOW_TIME_IMMEDIAT",other,other,0,0,0,FALSE);
	AI_Wait(self,1.0);
	AI_StopFX(other,"SLOW_TIME_IMMEDIAT");
};
func void DIA_Cimm_FortitudeIngredients_DropUnconscious()
{
	// Ikarus/LeGo Needed
	var C_NPC npc_nil;
	other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
	Npc_DropUnconscious(other,0,npc_nil);
	AI_Wait(self,10.0);
	other.aivar[AIV_TIME_UNCONSCIOUS] = HAI_TIME_UNCONSCIOUS;
};
func void DIA_Cimm_FortitudeIngredients_BlackScreen()
{
	Wld_PlayEffect("BLACK_SCREEN_SLOW", other,other,0,0,0,FALSE);
	AI_Wait(self,1.5);
	AI_StopFX(other,"BLACK_SCREEN_SLOW");
};
func void DIA_Cimm_FortitudeIngredients_RaiseAtr()
{
	B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,Bonus_ItPo_DS2P_Perm_Fortitude_HPMax);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,Bonus_ItPo_DS2P_Perm_Fortitude_HPMax);
	B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT,Bonus_ItPo_DS2P_Perm_Fortitude_Prot);
};
func void DIA_Cimm_FortitudeIngredients_info()
{
	var int x;
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_00");	//Я нашел ингредиенты для зелья ”Крепость духа”.

	//(+опыт)
	B_GivePlayerXP(XP_MIS_Fortitude);
	//Отдаем рог, клык и сердце
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems_red(other,self,ItAt_ShadowHorn,1,34);
		B_DS_GiveRemoveItems_red(other,self,ItAt_DS2P_Teeth_Warg,1,37);
		B_DS_GiveRemoveItems_red(other,self,ItAt_DS2P_Heart_SwampGolem,1,40);
	};
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_01");	//Так, так... Давай сюда. Погоди минутку, я возьму свиток.

	//идет к сундуку, открывает, подходит, читает.
	B_DIA_UseMob(self, other, "CHESTBIG", 0.5);	// UNFINISHED проверить имя сундука, должен быть НЕ заперт!!!
	B_DIA_UseItem_Wait(self, other, Fakescroll, 0.7);

		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_02");	//Угу, ага.. Так! Отойди в сторонку, а то мало ли что!
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_03");	//О чем ты?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_04");	//Так, ни о чем. Не мешайся под ногами.

	//ГГ отходит, Цимм идет к алхим столу, бадяжет, возвращается
	// UNFINISHED вписать WP, куда отходит ГГ
	AI_GotoWP(other,Npc_GetNearestWP(other));
	B_DIA_UseMob(self, other, "LAB", 1.5);
	
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_05");	//Так, вроде все. Так, стоп! Я же забыл добавить сердце! Погоди!

	//Опять уходит, бадяжет, возвращается
	B_DIA_UseMob(self, other, "LAB", 0.5);
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"Ну теперь ничего не забыл?",DIA_Cimm_FortitudeIngredients_info1);
};
func void DIA_Cimm_FortitudeIngredients_info1()
{
	var int x;
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_06");	//Ну теперь ничего не забыл?

	//Цимм достает манускрипт, читает
	B_DIA_UseItem_Wait(self, other, Fakescroll, 0.7);
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_07");	//Вроде все.
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_08");	//Вроде?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_09");	//Понимаешь, фолиант очень ветхий, тут не все понятно, часть текста я не смог разобрать. 
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_10");	//Что?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_11");	//Да не бойся ты! Там всякая ерунда о магических пассах и прочим штучкам магов. А я простой алхимик и не владею такими знаниями.
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_12");	//Поэтому в нашей ситуации это все равно бы не помогло. Не бери в голову, пей!
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_13");	//Ты уверен, что это безопасно?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_14");	//Да точно тебе говорю, все пропорции я соблюдал, остальное детали. Пей!
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"(выпить)",DIA_Cimm_FortitudeIngredients_info2);
};
func void DIA_Cimm_FortitudeIngredients_info2()
{
	var int x;
	//ГГ пьет, его начинает колбасить
	x = 2; if (x == 2) {
		DIA_Cimm_FortitudeIngredients_DrinkFortitude();
	};	
	
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_15");	//Ну как?
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"Что-то у меня голова закружилась.",DIA_Cimm_FortitudeIngredients_info3);
	//UNFINISHED сделать эффект как для болотника, но без лучей
};
func void DIA_Cimm_FortitudeIngredients_info3()
{
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_16");	//Что-то у меня голова закружилась.
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_17");	//Ну слава Инносу, значит я все сделал правильно. В фолианте написано, что первым признаком, что зелье сварено верно и начинает действовать - легкое головокружение.

	//ГГ падает с 1 жизни, встает
		DIA_Cimm_FortitudeIngredients_DropUnconscious();
	
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_18");	//Что-то меня ноги не держат. Это тоже правильно?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_19");	//Ну... почти. Да ты не волнуйся так, сейчас все пройдет.
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"(дальше)",DIA_Cimm_FortitudeIngredients_info4);
};
func void DIA_Cimm_FortitudeIngredients_info4()
{
	var int x;
	//Цимм начинает очень медленно говорить
	AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_20");	//(очень медленно) Т-ы-ы м-е-н-я с-л-ы-ш-и-ш-ь?  С-к-а-ж-и х-о-т-ь что-н-и-б-у-д-ь...

	//Экран темнеет
	x = 1; if (x == 1) {
		DIA_Cimm_FortitudeIngredients_BlackScreen();
	};
	
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_21");	//Фух, похоже ты пришел в себя. Я уж думал... Как ты?
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_22");	//Бывало и лучше. Такое ощущение, что желудок сейчас вылезет наружу.
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_23");	//Это пройдет. Так, давай я тебя осмотрю. По-моему все на месте, копыта не выросли, хвоста нет. Все прошло как по маслу.
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_24");	//Ты шутишь?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_25");	//Нет, что ты! Зелье тебя не убило, а значит дало тебе силу. В свитке так и написано, если человек выпивает зелье духа, то он проходит по краю черты между жизнью и смертью.
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_26");	//Если его дух силен, то он становится сильнее, если же слаб – погибает или, что еще хуже, становится демоном. Ты оказался сильным, в чем я, в прочем, и не сомневался! (улыбается)
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_27");	//Почему ты мне раньше не сказал об этом?
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_28");	//А разве бы ты согласился? Нет! То-то же. Ну так что, ты чувствуешь в себе силу?
	
	Info_ClearChoices(DIA_Cimm_FortitudeIngredients);
	Info_AddChoice(DIA_Cimm_FortitudeIngredients,"Кажется, чувствую.",DIA_Cimm_FortitudeIngredients_info5);
};
func void DIA_Cimm_FortitudeIngredients_info5()
{
	var int x;
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_29");	//Кажется, чувствую.
	//У ГГ повышается защита от оружия и стрел +5, а также на 20 увеличивается макс здоровье
	B_GiveBonusProt(other, PROT_BLUNT, Bonus_Protect_Cimm);
	B_GiveBonusProt(other, PROT_EDGE, Bonus_Protect_Cimm);
	B_GiveBonusProt(other, PROT_POINT, Bonus_Protect_Cimm);
	B_RaiseAttribute(other, ATR_HITPOINTS_MAX, Bonus_HP_Cimm);
	x = 1; if (x == 1) {
		DIA_Cimm_FortitudeIngredients_RaiseAtr();
	};
	
		AI_Output(self,other,"DIA_Cimm_FortitudeIngredients_03_30");	//Ну и слава Инносу. Если найдешь еще яйца матки ползунов, приноси. У меня появились кое-какие мысли, как усилить зелье.
	AI_Output(other,self,"DIA_Cimm_FortitudeIngredients_15_31");	//Ага, непременно.
	
	x = 2; if (x == 2) {
		//Запись в дневнике "Крепость духа" квест окончен
		B_DSG_Log_OpenClose(TOPIC_DS2P_Fortitude,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Fortitude_Success);
	};
};


//NS - 27/06/2013 ============================================================
// По квесту "Кто украл мое железо?" 	nr=101
//============================================================================

instance DIA_Cimm_AboutStolenIron(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 101;
	condition = DIA_Cimm_AboutStolenIron_condition;	
	information = DIA_Cimm_AboutStolenIron_info;
	description = "Ты что-нибудь слышал о краже из кузницы?";
};
func int DIA_Cimm_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Cimm_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Cimm_AboutStolenIron_15_00");	//Ты что-нибудь слышал о краже из кузницы?
		AI_Output(self,other,"DIA_Cimm_AboutStolenIron_03_01");	//Нет, мне это совершенно неинтересно. 
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 28/06/2013 ============================================================
// По квесту "Белая горячка" 	nr=111
//============================================================================

//-----------------------------------------------------
// "У тебя есть средство для отрезвления?", если взят квест		nr = 111;
instance DIA_Cimm_HaveSoberingPotion(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 111;
	condition = DIA_Cimm_HaveSoberingPotion_condition;	
	information = DIA_Cimm_HaveSoberingPotion_info;
	description = "У тебя есть средство для отрезвления?";
};
func int DIA_Cimm_HaveSoberingPotion_condition()
{
	if (MIS_DS2P_DeliriumTremens == LOG_Running)	{	return TRUE;	};
};
func void DIA_Cimm_HaveSoberingPotion_info()
{
	AI_Output(other,self,"DIA_Cimm_HaveSoberingPotion_15_00");	//У тебя есть средство для отрезвления?
		AI_Output(self,other,"DIA_Cimm_HaveSoberingPotion_03_01");	//О, опять кто-то перебрал? Хех! Есть у меня один рецептик, частенько его спрашивают.
		AI_Output(self,other,"DIA_Cimm_HaveSoberingPotion_03_02");	//Для отрезвительного зелья мне понадобится бутылка грога, кружка пива.
	AI_Output(other,self,"DIA_Cimm_HaveSoberingPotion_15_03");	//Тебе не кажется, что это не поможет?
		AI_Output(self,other,"DIA_Cimm_HaveSoberingPotion_03_04");	//Еще как поможет! Просто в этот целебный напиток нужно добавить одну травку, она-то и даст нужный эффект.
		AI_Output(self,other,"DIA_Cimm_HaveSoberingPotion_03_05");	//Не сомневайся, все будет в лучшем виде, ты главное принеси выпивку.

	//Запись в дневнике "Белая горячка" //NS - отсебятина
	B_ds_LogEntry(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_Running,TOPIC_DS2P_DeliriumTremens_CimmAgreed);	
};

//-----------------------------------------------------
// Дать грог и пиво	для зелья	(+опыт)		nr = 112;
instance DIA_Cimm_MadeSoberingPotion(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 112;
	condition = DIA_Cimm_MadeSoberingPotion_condition;	
	information = DIA_Cimm_MadeSoberingPotion_info;
	description = "Вот грог и пиво.";
};
func int DIA_Cimm_MadeSoberingPotion_condition()
{
	if ((Npc_KnowsInfo(other,DIA_Cimm_HaveSoberingPotion))
		&& (Npc_HasItems(other,ItFo_Beer) > 0) && (Npc_HasItems(other,ItFo_Addon_Grog) > 0))
	{	return TRUE;	};
};
func void DIA_Cimm_MadeSoberingPotion_info()
{
	var int x;
	AI_Output(other,self,"DIA_Cimm_MadeSoberingPotion_15_00");	//Вот грог и пиво.
	//отдаем грог и пиво
	B_DS_GiveRemoveItems_red(other,self,ItFo_Addon_Grog,1,YPOS_ItemGiven);
	B_DS_GiveRemoveItems_red(other,self,ItFo_Beer,1,YPOS_ItemGiven + 3);
		AI_Output(self,other,"DIA_Cimm_MadeSoberingPotion_03_01");	//Так, погоди минутку.
	//Отходит к алхим столу, химичит, возвращается
	B_DIA_UseMob(self,other,"LAB",1.0);
		AI_Output(self,other,"DIA_Cimm_MadeSoberingPotion_03_02");	//Готово. Отдай это больному. Алкоголь в этом напитке глушит вкус травы, поэтому твой дружок ничего не заподозрит.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_DeliriumTremens_MadePotion);
		AI_Output(self,other,"DIA_Cimm_MadeSoberingPotion_03_03");	//Да, и еще. После того, как он выпьет, отойди в сторонку.
	AI_Output(other,self,"DIA_Cimm_MadeSoberingPotion_15_04");	//Зачем?
		AI_Output(self,other,"DIA_Cimm_MadeSoberingPotion_03_05");	//Ну как тебе сказать... Чтобы удалить алкоголь из организма, нужно его очистить, а от этого напитка это произойдет очень быстро и полностью...
	AI_Output(other,self,"DIA_Cimm_MadeSoberingPotion_15_06");	//Я понял, спасибо.
	//Дает «Отрезвительное зелье»
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ItMi_DS2P_SoberingPotion,1);
	};

	//Запись в дневнике "Белая горячка" 
	B_ds_LogEntry(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_Running,TOPIC_DS2P_DeliriumTremens_PotionReady);	
};


//NS - 02/07/2013 ================================================
// После смерти Кадара
//================================================================
instance DIA_Cimm_KadarDead(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 0;
	condition = DIA_Cimm_KadarDead_condition;	
	information = DIA_Cimm_KadarDead_info;
	important = TRUE;
};
func int DIA_Cimm_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Cimm_KadarDead_info()
{
		AI_Output(self,other,"DIA_Cimm_KadarDead_03_00");	//Дух смерти так и летает над нашим островом. Надеюсь Иннос не оставит нас наедине с этим кошмаром. Да упокой душу Кары и Кадара.
};

// Активируется, если активен квест "Кошмары" и ГГ поговорил с Ватрасом о царском щавеле
// nr = 1

instance DIA_Cimm_VatrasIngredient(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Cimm_VatrasIngredient_condition;	
	information = DIA_Cimm_VatrasIngredient_info;
	description = "Мне нужен царский щавель.";
};

func int DIA_Cimm_VatrasIngredient_condition()
{
	if ((MIS_DS2P_Nightmares == Log_Running) && Npc_KnowsInfo(other,DIA_Vatras_AboutNightmares))
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_VatrasIngredient_info()
{
	AI_Output(other,self,"DIA_Cimm_VatrasIngredient_15_00");	//Мне нужен царский щавель. У тебя есть?
	AI_Output(self,other,"DIA_Cimm_VatrasIngredient_13_01");	//А тебе для чего?
	AI_Output(other,self,"DIA_Cimm_VatrasIngredient_15_02");	//Меня попросил его добыть маг воды Ватрас с моего корабля.
	AI_Output(self,other,"DIA_Cimm_VatrasIngredient_13_03");	//Конечно, для хранителя равновесия у меня всегда есть парочка трав. Вот, держи.
	//Создаем царский щавель в инвентаре Цимма и передаем ГГ
	CreateInvItems(self,ItPl_Perm_Herb,1);
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	AI_Output(other,self,"DIA_Cimm_VatrasIngredient_15_04");	//Вот так просто? И ты ничего не просишь взамен?
	AI_Output(self,other,"DIA_Cimm_VatrasIngredient_13_05");	//(улыбается) Если уж ты так настаиваешь, то я бы хотел побеседовать с магом, если он не против. Может, он поделится со мной парочкой рецептов, а, может, и я смогу открыть ему что-то новое.
	AI_Output(self,other,"DIA_Cimm_VatrasIngredient_13_06");	//Человек должен всегда развиваться, иначе он будет деградировать. А обучение у мага воды явно пойдет мне на пользу.
	AI_Output(other,self,"DIA_Cimm_VatrasIngredient_15_07");	//Хорошо, я передам ему твою просьбу.
};

// Активируется, если активен квест "Подставить Йорна"
// nr = 2

instance DIA_Cimm_CanYouCreateJorn(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Cimm_CanYouCreateJorn_condition;	
	information = DIA_Cimm_CanYouCreateJorn_info;
	description = "У меня к тебе есть одна просьба.";
};

func int DIA_Cimm_CanYouCreateJorn_condition()
{
	if (MIS_DS2P_ExposeJorn == LOG_Running)
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_CanYouCreateJorn_info()
{
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_00");	//У меня к тебе есть одна просьба.
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_01");	//Какая?
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_02");	//Я хочу, чтобы ты сделал слабительное.
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_03");	//Хм, я конечно могу его сделать для тебя. Но меня мучает вопрос. А зачем он тебе?
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_04");	//Хочу смешать его с самогоном и напоить одного пирата.
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_05");	//Ха, ради этого я готов сделать тебе десять слабительных.
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_06");	//Нет, одного мне хватит.
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_07");	//Хорошо, тогда принеси мне пару трав. Раньше этим занимались охотники, но в последнее время ситуация маленько изменилась.
	AI_Output(other,self,"DIA_Cimm_CanYouCreateJorn_15_08");	//Какие именно травы тебе нужны?
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_09");	//Сейчас, я напишу.
	B_UseFakeScrollTime(3);
	AI_Output(self,other,"DIA_Cimm_CanYouCreateJorn_13_10");	//Вот, держи. Этого мне хватит.
	// Создаем листок в инвентаре Цимма и отдаем ГГ
	CreateInvItems(self,ItWr_DS2P_CimmsIngredients,1);
	B_GiveInvItems(self,other,ItWr_DS2P_CimmsIngredients,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_CimmsIngredients);
};

// Активируется, если активен квест "Подставить Йорна", должны принести Цимму ингредиенты, и собрали их
// nr = 2

instance DIA_Cimm_BringIngredientsJorn(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Cimm_BringIngredientsJorn_condition;	
	information = DIA_Cimm_BringIngredientsJorn_info;
	description = "Вот, я все собрал.";
};

func int DIA_Cimm_BringIngredientsJorn_condition()
{
	if ((MIS_DS2P_ExposeJorn == LOG_Running)
		 && Npc_KnowsInfo(other,DIA_Cimm_CanYouCreateJorn)
		 && (Npc_HasItems(other,ItPl_Mana_Herb_01) >= 3)
		 && (Npc_HasItems(other,ItPl_SwampHerb) >= 2)
		 && (Npc_HasItems(other,ItPl_DSG_Mountmoom) >= 2)
		 && (Npc_HasItems(other,ItPl_Mushroom_01) >= 1)
		 && (Cimm_CookSamogon == FALSE))
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_BringIngredientsJorn_info()
{
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_15_00");	//Вот, я все собрал.
	// Отдаем Цимму ингредиенты
	B_GiveInvItems(other,self,ItPl_Mana_Herb_01,3);
	B_GiveInvItems(other,self,ItPl_SwampHerb,2);
	B_GiveInvItems(other,self,ItPl_DSG_Mountmoom,2);
	B_GiveInvItems(other,self,ItPl_Mushroom_01,1);
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_13_01");	//Так, подожди чуть-чуть. Я быстро.
	B_DIA_UseMob(self,other,"LAB",1.0); // Уходит к алхим. столу, химичит, возвращается
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_13_02");	//Все готово. Теперь нужен самогон. У тебя он есть?
	Info_ClearChoices(DIA_Cimm_BringIngredientsJorn);
	Info_AddChoice(DIA_Cimm_BringIngredientsJorn,"Нет.",DIA_Cimm_BringIngredientsJorn_No);
	if (Npc_HasItems(other,ITFO_SAMOGON) >= 1) // Если у ГГ есть самогон
	{
		Info_AddChoice(DIA_Cimm_BringIngredientsJorn,"Да.",DIA_Cimm_BringIngredientsJorn_Yes);
	};
};

// Запускается, при выборе реплики "Нет." в диалоге Цимма "Вот, я все собрал."

func void DIA_Cimm_BringIngredientsJorn_No()
{
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_No_15_00");	//Нет. Сейчас принесу.
	AI_StopProcessInfos(self);
};
	
func void DIA_Cimm_BringIngredientsJorn_Yes()
{
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_Yes_15_00");	//Да. Вот, держи.
	// Отдаем Цимму самогон
	B_GiveInvItems(other,self,ITFO_SAMOGON,1);
	B_DIA_UseMob(self,other,"LAB",1.0); // Уходит к алхим. столу, химичит, возвращается
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_Yes_13_01");	//Все готово. Вот твое пойло. Пару дней тот, кто выпьет это, будет мучиться диким поносом.
	// Создаем новый самогон в инвентаре Цимма и отдаем ГГ
	CreateInvItems(self,ItMi_DS2P_SamogonForJorn,1);
	B_GiveInvItems(self,other,ItMi_DS2P_SamogonForJorn,1);
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_Yes_15_02");	//Спасибо. Я тебе что-нибудь должен?
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_Yes_13_03");	//Нет, ничего не надо. Одна мысль о мелкой пакости для пиратов греет мне сердце.
	Cimm_CookSamogon = TRUE;
	AI_StopProcessInfos(self);
};
	
// Активируется, если активен квест "Подставить Йорна", и не принесли Цимму самогон сначала
// nr = 2

instance DIA_Cimm_BringSamogonJorn(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Cimm_BringSamogonJorn_condition;	
	information = DIA_Cimm_BringSamogonJorn_info;
	description = "Вот, я принес самогон.";
};

func int DIA_Cimm_BringSamogonJorn_condition()
{
	if ((MIS_DS2P_ExposeJorn == LOG_Running) && (Npc_HasItems(other,ITFO_SAMOGON) >= 1)
		 && Npc_KnowsInfo(other,DIA_Cimm_BringIngredientsJorn) && (Cimm_CookSamogon == FALSE))
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_BringSamogonJorn_info()
{
	AI_Output(other,self,"DIA_Cimm_BringSamogonJorn_15_00");	//Вот, я принес самогон.
	// Отдаем Цимму самогон
	B_GiveInvItems(other,self,ItFo_Samogon,1);
	AI_Output(self,other,"DIA_Cimm_BringSamogonJorn_13_01");	//Сейчас, мы быстренько все смешаем…
	B_DIA_UseMob(self,other,"LAB",1.0); // Уходит к алхим. столу, химичит, возвращается
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_Yes_13_01");	//Все готово. Вот твое пойло. Пару дней тот, кто выпьет это, будет мучиться диким запором.
	// Создаем новый самогон в инвентаре Цимма и отдаем ГГ
	CreateInvItems(self,ItMi_DS2P_SamogonForJorn,1);
	B_GiveInvItems(self,other,ItMi_DS2P_SamogonForJorn,1);
	AI_Output(other,self,"DIA_Cimm_BringIngredientsJorn_Yes_15_02");	//Спасибо. Я тебе что-нибудь должен?
	AI_Output(self,other,"DIA_Cimm_BringIngredientsJorn_Yes_13_03");	//Нет, ничего не надо. Одна мысль о мелкой пакости для пиратов греет мне сердце.
	Cimm_CookSamogon = TRUE;
	AI_StopProcessInfos(self);
};

// Активируется на следующий день после выполнения квеста "Найти сбежавших охотников"
// nr = 1

instance DIA_Cimm_AfterEscapedHunters(C_Info)
{
	npc = BAU_103_DS2P_Cimm;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Cimm_AfterEscapedHunters_condition;	
	information = DIA_Cimm_AfterEscapedHunters_info;
	description = "Что ты там бормочешь?";
};

func int DIA_Cimm_AfterEscapedHunters_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == LOG_Success) && (EscapedHunters_QuestComplete - Wld_GetDay() >= 1))
	{	
		return TRUE;	
	};
};

func void DIA_Cimm_AfterEscapedHunters_info()
{
	AI_Output(other,self,"DIA_Cimm_AfterEscapedHunters_15_00");	//Что ты там бормочешь?
	AI_Output(self,other,"DIA_Cimm_AfterEscapedHunters_13_01");	//Я молюсь за погибших Густава, Тома, Джина и Фарта. Их души сейчас в лучшем мире. Они погибли как истинные воины, сражаясь с захватчиками. 
	AI_Output(self,other,"DIA_Cimm_AfterEscapedHunters_13_02");	//Скажи мне, чужак, выиграем ли мы войну с орками, если и дальше, подобные Гарду, будут убивать своих же?
	AI_Output(other,self,"DIA_Cimm_AfterEscapedHunters_15_03");	//Не думаю. Говорят, что война уже проиграна. Орки захватили большую часть Миртаны. Если мы не сплотимся в последний момент, будет уже поздно.
	AI_Output(self,other,"DIA_Cimm_AfterEscapedHunters_13_04");	//Эх, горько это все.
	AI_StopProcessInfos(self);
};
	