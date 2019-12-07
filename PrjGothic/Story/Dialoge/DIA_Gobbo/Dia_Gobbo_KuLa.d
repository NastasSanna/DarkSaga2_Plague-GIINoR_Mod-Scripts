instance DIA_KuLa_EXIT(C_Info)
{
	npc = Gobbo_DS2P_KuLa;
	nr = 999;
	permanent = TRUE;
	condition = DIA_KuLa_EXIT_condition;	
	information = DIA_KuLa_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_KuLa_EXIT_condition(){	return TRUE;};
func void DIA_KuLa_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 06/03/2016 ===========
// Знакомство 
//===========================
//Привет. -----------------------------
instance DIA_KuLa_Hello(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 1;
	condition = DIA_KuLa_Hello_condition;	
	information = DIA_KuLa_Hello_info;
	description = "Привет.";
};
func int DIA_KuLa_Hello_condition(){	return TRUE;};
func void DIA_KuLa_Hello_info()
{	
	AI_Output(other,self,"DIA_KuLa_Hello_15_01");	//Привет.
		AI_Output(self,other,"DIA_KuLa_Hello_18_02");	//Ки-ко, чужак. Моя звать Ку-Ла, быть лучший охотник в деревня.
};
//Кто у вас главный? -----------------------------
instance DIA_KuLa_WhoIsChief(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 2;
	condition = DIA_KuLa_WhoIsChief_condition;	
	information = DIA_KuLa_WhoIsChief_info;
	description = "Кто у вас главный?";
};
func int DIA_KuLa_WhoIsChief_condition()
{	
	if (Npc_KnowsInfo(other,DIA_KuLa_Hello))
	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsChief_info()
{	
	AI_Output(other,self,"DIA_KuLa_WhoIsChief_15_01");	//Кто у вас главный?
		AI_Output(self,other,"DIA_KuLa_WhoIsChief_18_02");	//Наш вожак Ца-Ха-Наух. Быть великий вождь, не такой как Гурун, но тоже великий. Есть еще Ра-Да-По. Ра-Да-По быть великий шаман племя.
	Hero_Knows_Gurun = TRUE;
};

//Кто у вас главный? -----------------------------
instance DIA_KuLa_WhoIsGurun(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 3;
	condition = DIA_KuLa_WhoIsGurun_condition;	
	information = DIA_KuLa_WhoIsGurun_info;
	description = "Кто у вас главный?";
};
func int DIA_KuLa_WhoIsGurun_condition()
{	
	if (Npc_KnowsInfo(other,DIA_KuLa_WhoIsChief))
	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoIsGurun_info()
{	
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//Кто такой Гурун?
		AI_Output(self,other,"DIA_KuLa_WhoIsGurun_18_02");	//Гурун быть наш предок. Быть великий шаман и воин. Он суметь одолеть стаю больших черных волков-убийц.
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//(удивленно) Один?
		AI_Output(self,other,"DIA_KuLa_WhoIsGurun_18_02");	//Ти-ка. Он учиться у Од-Ди-Он, великий маг научить Гурун своя магия.
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//(про себя) Что ни гоблин, то великий... 
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//(вслух) А Од-Ди-Он кто такой?
		AI_Output(self,other,"DIA_KuLa_WhoIsGurun_18_02");	//Человек. Жить один, быть отшельник. Он быть неприкасаем для гоблин.
	AI_Output(other,self,"DIA_KuLa_WhoIsGurun_15_01");	//Он еще живой?
		AI_Output(self,other,"DIA_KuLa_WhoIsGurun_18_02");	//Да, быть жив. Ра-Да-По иногда ходить к нему, редко-редко. Если Од-Ди-Он настроений хороший, он принимать его.
	Hero_Knows_OdDiOn = TRUE;
};

//NS - 11/03/2016 ===========
// Квест "Пропавший друг" 
//===========================
//после знакомства -----------------------------
instance DIA_KuLa_WhoHunt(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 10;
	condition = DIA_KuLa_WhoHunt_condition;	
	information = DIA_KuLa_WhoHunt_info;
	description = "На кого ты охотишься?";
};
func int DIA_KuLa_WhoHunt_condition()
{	
	if (Npc_KnowsInfo(other,DIA_KuLa_Hello))
	{
		return TRUE;
	};
};
func void DIA_KuLa_WhoHunt_info()
{	
	AI_Output(other,self,"DIA_KuLa_WhoHunt_15_01");	//На кого ты охотишься?
		AI_Output(self,other,"DIA_KuLa_WhoHunt_18_02");	//Ку-Ла охотиться на падальщик, крыс, большой жужжащий мух. Раз даже победить один болотный змей. Ку-Ла иметь много уважений другой гоблин за это.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_15_03");	//Да уж, действительно подвиг для такого малыша как ты.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_18_04");	//(кивает) Ти-ка, ти-ка. Моя обычно охотиться вместе Та-Ко-Пи, но Та-Ко-Пи пропасть.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_15_05");	//Та-Ко-Пи - твой друг?
		AI_Output(self,other,"DIA_KuLa_WhoHunt_18_06");	//Ти-ка. Та-Ко-Пи друг, Та-Ко-Пи волк. Ку-Ла найти пять лет назад в лес маленький щенок и оставить себе, назвать Та-Ко-Пи, Дух Лес. Он вырасти, стать большой, матерый волк и всегда ходить с Ку-Ла на охота.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_15_07");	//Когда он пропал?
		AI_Output(self,other,"DIA_KuLa_WhoHunt_18_08");	//Семь ночь назад, когда Ку-Ла сражаться с болотный змей. Тогда Та-Ко-Пи пропасть на болота. Ку-Ла много раз ходить искать его, но не найти даже след.
	Info_ClearChoices(DIA_KuLa_WhoHunt);
	Info_AddChoice(DIA_KuLa_WhoHunt,"Я уверен, что он еще найдется.",DIA_KuLa_WhoHunt_Refuse);
	Info_AddChoice(DIA_KuLa_WhoHunt,"Если встречу его, то приведу обратно в деревню.",DIA_KuLa_WhoHunt_Help);
	//спаун волка
	Wld_InsertNpc(Wolf_DS2P_TaKoPi,WP_TaKoPi_Lost);
};
func void DIA_KuLa_WhoHunt_Help()
{	
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_01");	//Если встречу его, то приведу обратно в деревню.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_02");	//Если чужак сделать это, то Ку-Ла щедро благодарить чужак. Моя есть много трофей.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_03");	//Посмотрим, что я могу сделать.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_04");	//Чужак быть осторожнее, Та-Ко-Пи не любить чужак. Чужак говорить Та-Ко-Пи: ”Чи-ма-ру-то. Ко-ми-га-на-бу.” Та-Ко-Пи понять и идти за чужак. Чужак повторить слова.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_05");	//(по слогам) Чи-ма-ру-та. Ко-ми-го-на-бу.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_06");	//Нет, неправильно. Чи-ма-ру-тО. Ко-ми-гА-на-бу.
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_07");	//Чи-ма-ру-то. Ко-ми-га-на-бу.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_08");	//Да, так правильно. Чужак записать слова, чтобы не забыть.
	Info_ClearChoices(DIA_KuLa_WhoHunt);
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_Running,TOPIC_DS2P_MissingFriend_Start);
};
func void DIA_KuLa_WhoHunt_Refuse()
{	
	AI_Output(other,self,"DIA_KuLa_WhoHunt_Help_15_01");	//Я уверен, что он еще найдется.
		AI_Output(self,other,"DIA_KuLa_WhoHunt_Help_18_02");	//Моя искать его.
	Info_ClearChoices(DIA_KuLa_WhoHunt);
};
//Переспросить фразу -----------------------------
//иначе слишком жестко
instance DIA_KuLa_RepeatPassword(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 11;
	condition = DIA_KuLa_RepeatPassword_condition;	
	information = DIA_KuLa_RepeatPassword_info;
	description = "Повтори еще раз, что нужно сказать волку?";
	permanent = TRUE;
};
func int DIA_KuLa_RepeatPassword_condition()
{	
	//еще не привели Та-Ко-Пи, но обещали
	if ((MIS_DS2P_MissingFriend == LOG_Running)
		&& !((Npc_GetDistToNpc(self, Wolf_DS2P_TaKoPi) <= PERC_DIST_INTERMEDIAT) || Npc_CanSeeNpc(self,Wolf_DS2P_TaKoPi)))
	{
		return TRUE;
	};
};
func void DIA_KuLa_RepeatPassword_info()
{	
	AI_Output(other,self,"DIA_KuLa_RepeatPassword_15_01");	//Повтори еще раз, что нужно сказать волку?
		AI_Output(self,other,"DIA_KuLa_RepeatPassword_18_02");	//У человек совсем худой память. Надо говорить: Чи-ма-ру-то. Ко-ми-га-на-бу.
};
//Привели волка -----------------------------
instance DIA_KuLa_WolfReturned(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 12;
	condition = DIA_KuLa_WolfReturned_condition;	
	information = DIA_KuLa_WolfReturned_info;
	description = "Я нашел твоего питомца.";
};
func int DIA_KuLa_WolfReturned_condition()
{	
	//привели Та-Ко-Пи: он близко или Ку-Ла его видит
	if ((MIS_DS2P_MissingFriend == LOG_Running)
		&& ((Npc_GetDistToNpc(self, Wolf_DS2P_TaKoPi) <= PERC_DIST_INTERMEDIAT) || Npc_CanSeeNpc(self,Wolf_DS2P_TaKoPi)))
	{
		return TRUE;
	};
};
func void DIA_KuLa_WolfReturned_info()
{	
	//возвращаем волка домой
	var C_NPC TaKoPi;	TaKoPi = Hlp_GetNpc(Wolf_DS2P_TaKoPi);
	B_StartOtherRoutine(TaKoPi,"HOME");
	Npc_ClearAIQueue(TaKoPi);
	TaKoPi.aivar[AIV_PARTYMEMBER] = FALSE;
	TaKoPi.aivar[AIV_StoryFlags] = TaKoPi.aivar[AIV_StoryFlags] | AIV_StoryFlag_SwampGoblin;
	TaKoPi_Follows = FALSE;

	AI_Output(other,self,"DIA_KuLa_WolfReturned_15_01");	//Я нашел твоего питомца.
		AI_Output(self,other,"DIA_KuLa_WolfReturned_18_02");	//(восторженно) Ипа-цу-на-ка! Ку-Ла благодарить чужак. Ку-Ла уже отчаяться.
	//волк бросается к хозяину
	AI_SetWalkmode(TaKoPi,NPC_RUN);
	AI_GotoNpc(TaKoPi,self);
	AI_PlayAni(TaKoPi,"R_HOWL");
		AI_Output(self,other,"DIA_KuLa_WolfReturned_18_03");	//Чужак взять награда. Ку-ла она не надо, а чужак пригодиться.
	//Дает десяток когтей, десяток клыков и пяток разных шкур.
	B_GiveInvItems(self,other,ItAt_Claw,8);
	B_GiveInvItems(self,other,ItAt_Teeth,10);
	B_GiveInvItems(self,other,ItAt_WolfFur,3);
	B_GiveInvItems(self,other,itAt_LurkerSkin,1);
	B_GiveInvItems(self,other,ItAt_SheepFur,1);
	//Запись в дневнике "Пропавший друг". Квест выполнен
	B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION, LOG_SUCCESS,TOPIC_DS2P_MissingFriend_Success);
	B_GivePlayerXP(XP_MIS_MissingFriend);
};

//NS - 12/03/2016 ===========
// ТОРГОВЛЯ
//===========================
// -----------------------------
instance DIA_KuLa_preTrade(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 50;
	condition = DIA_KuLa_preTrade_condition;	
	information = DIA_KuLa_preTrade_info;
	description = "Ты продаешь трофеи?";
};
func int DIA_KuLa_preTrade_condition()
{	
	if (Npc_KnowsInfo(other,DIA_KuLa_Hello))
	{
		return TRUE;
	};
};
func void DIA_KuLa_preTrade_info()
{	
	AI_Output(other,self,"DIA_KuLa_preTrade_15_01");	//Ты продаешь трофеи?
		AI_Output(self,other,"DIA_KuLa_preTrade_18_02");	//Ку-Ла быть сильный охотник, Ку-Ла много трофей. Ку-Ла продавать их чужак.
	TRADE_KuLa = TRUE;
	B_DSG_Log_OpenClose(TOPIC_GobboTrader,LOG_NOTE,-1,"Гоблин Ку-Ла продает разнообразные охотничьи трофеи.");
};
// -----------------------------
instance DIA_KuLa_Trade(C_Info)
{
	npc = Gobbo_DS2P_KuLa;						nr = 51;
	condition = DIA_KuLa_Trade_condition;	
	information = DIA_KuLa_Trade_info;
	description = "Покажи мне свои товары.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_KuLa_Trade_condition()
{	
	if (TRADE_KuLa == TRUE)
	{
		return TRUE;
	};
};
func void DIA_KuLa_Trade_info()
{	
	AI_Output(other,self,"DIA_KuLa_Trade_15_01");	//Покажи мне свои товары.
		AI_Output(self,other,"DIA_KuLa_Trade_18_02");	//Чужак смотреть.
	B_GiveTradeInv(self);	
};

//NS - 12/03/2016 ===========
// ОБУЧЕНИЕ
//===========================
	
	
/* UNFINISHED
Проходим в деревню. Недалеко от входа сидит гоблин охотник Ку-Ла.


Ку-Ла: Моя слышать, твоя стать часть племя? Это большая честь. Твоя быть первый человек, кто стать гоблин.
ГГ: Спасибо, правда, сам еще не понимаю, что мне это дает.
Ку-Ла: Моя научить твоя охота. Снимать шкур, клык, коготь и много другой.

Научи меня.
ГГ: Научи меня.

Снимать шкуры.
Удалять клыки.
Вырывать когти.
Удалять сердце.
Вырезать рог.


//*/

