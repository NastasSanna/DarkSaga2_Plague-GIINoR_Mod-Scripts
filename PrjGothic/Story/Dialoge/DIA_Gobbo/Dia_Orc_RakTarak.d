instance DIA_RakTarak_EXIT(C_Info)
{
	npc = Orc_DS2P_RakTarak;
	nr = 999;
	permanent = TRUE;
	condition = DIA_RakTarak_EXIT_condition;	
	information = DIA_RakTarak_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_RakTarak_EXIT_condition(){	return TRUE;};
func void DIA_RakTarak_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 08/03/2016 ===========
// Знакомство
//===========================
//заговаривает первым ---------------------
instance DIA_RakTarak_Hello(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 1;
	condition = DIA_RakTarak_Hello_condition;	
	information = DIA_RakTarak_Hello_info;
	important = TRUE;
};
func int DIA_RakTarak_Hello_condition(){	return TRUE;};
func void DIA_RakTarak_Hello_info()
{	
		AI_Output(self,other,"DIA_RakTarak_Hello_18_01");	//Стой, морра. Моя не враг твоя.
	AI_Output(other,self,"DIA_RakTarak_Hello_15_02");	//Ого, нечасто мне встречаются орки, не хватающиеся за топор при первом приближении человека.
		AI_Output(self,other,"DIA_RakTarak_Hello_18_03");	//Моя - друг. Моя не драться с морра. Моя хотеть жить в мире.
	AI_Output(other,self,"DIA_RakTarak_Hello_15_04");	//Хотелось бы верить.
};
//кто ты? ---------------------
instance DIA_RakTarak_WhoAU(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 2;
	condition = DIA_RakTarak_WhoAU_condition;	
	information = DIA_RakTarak_WhoAU_info;
	description = "Кто ты?";
};
func int DIA_RakTarak_WhoAU_condition(){	return TRUE;};
func void DIA_RakTarak_WhoAU_info()
{	
	AI_Output(other,self,"DIA_RakTarak_WhoAU_15_01");	//Кто ты?
		AI_Output(self,other,"DIA_RakTarak_WhoAU_18_02");	//Моя звать Рак-Тарак, как великий предка. Он жить много-много зим назад и умереть в бою с хаз.
	AI_Output(other,self,"DIA_RakTarak_WhoAU_15_03");	//Хаз? Знакомое название.
		AI_Output(self,other,"DIA_RakTarak_WhoAU_18_04");	//Мракорис, говорить морра. Много сильный и могучий зверь. Его рог пробивать даже дерево. Большая честь убить хаз. Моя предка убить трех, но умереть сам от рог двух. Он быть великий воин.
};
//Откуда ты знаешь наш язык? ---------------------
instance DIA_RakTarak_HowLearntLang(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 3;
	condition = DIA_RakTarak_HowLearntLang_condition;	
	information = DIA_RakTarak_HowLearntLang_info;
	description = "Откуда ты знаешь наш язык?";
};
func int DIA_RakTarak_HowLearntLang_condition(){	return TRUE;};
func void DIA_RakTarak_HowLearntLang_info()
{	
	AI_Output(other,self,"DIA_RakTarak_HowLearntLang_15_01");	//Откуда ты знаешь наш язык?
		AI_Output(self,other,"DIA_RakTarak_HowLearntLang_18_02");	//Моя охотник, торговать с морра. Много слышать и говорить с вами и выучить ваш язык.
};
//Что вы тут делаете совсем одни? ---------------------
instance DIA_RakTarak_WhyAlone(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 4;
	condition = DIA_RakTarak_WhyAlone_condition;	
	information = DIA_RakTarak_WhyAlone_info;
	description = "Что вы тут делаете совсем одни?";
};
func int DIA_RakTarak_WhyAlone_condition(){	return TRUE;};
func void DIA_RakTarak_WhyAlone_info()
{	
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_01");	//Что вы тут делаете совсем одни? Этот остров довольно опасен. 
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_02");	//Тут есть и пираты, весьма обиженные на орков, и много диких зверей. 
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_03");	//А также где-то бродят охотники, настроенные весьма недружелюбно, особенно к твоему племени.
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_04");	//Наша много зим жить на много большой остров. Там, где земля белый и много высоко.
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_05");	//Ты говоришь про горы? Нордмар?
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_06");	//Да, моя жить там. И моя племя. Мы много поколений жить там, никогда не воевать с морра. Мы мирный племя, даже иногда торговать с морра. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_07");	//Когда начаться война, мы оказаться между морра и другие племена. Почти все моя племя умирать. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_08");	//Только моя и десять других мочь бежать по вода на большая лодка. Наша хотеть найти место, где жить в мире. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_09");	//Но духи предков гневаться на нас. Большая вода вспучиться и много качать лодка, вся еда и вода пропасть.
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_10");	//Все умирать, кроме моя и Ар-Туш. Наша выжить. Два лун наша лежать почти мертвый, а потом лодка прибить к один земля. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_11");	//Много-много лун наша искать новый дом, но другой орки не хотят жить мирно с морра, и моя уходить. 
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_12");	//Потом моя найти эта земля и остаться здесь. Здесь тихо, мирно. Почти нет морра и нет другой орки.
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_13");	//Ты мне напоминаешь одного моего друга орка. Его звали Ур-Шак. Он тоже предпочитал жить в мире с людьми и жить отшельником... до недавнего времени.
		AI_Output(self,other,"DIA_RakTarak_WhyAlone_18_14");	//Что с ним быть?
	AI_Output(other,self,"DIA_RakTarak_WhyAlone_15_15");	//Нет, просто он изменил свое мнение. Из-за моей ошибки, признаюсь. Мне жаль, что с ним так все вышло.
};
//Что ты будешь делать дальше? ---------------------
//после предыдущего
instance DIA_RakTarak_WhatNow(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 5;
	condition = DIA_RakTarak_WhatNow_condition;	
	information = DIA_RakTarak_WhatNow_info;
	description = "Что ты будешь делать дальше?";
};
func int DIA_RakTarak_WhatNow_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhyAlone))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhatNow_info()
{	
	AI_Output(other,self,"DIA_RakTarak_WhatNow_15_01");	//Что ты будешь делать дальше?
	if (MIS_DS2P_OrcInTrouble != LOG_SUCCESS)	{
		AI_Output(self,other,"DIA_RakTarak_WhatNow_18_02");	//Моя и Ар-Туш будем жить один. Моя не смог убедить другой орк отказаться от война. Никто не принять наша образ жизни.
	}
	else	{
		AI_Output(self,other,"DIA_RakTarak_WhatNow_18_03");	//Наша оставаться пока здесь. Наша некуда идти. Наша нет дом.
	};
};

//NS - 08/03/2016 ===========
// Об острове и драконе
//===========================
//А на этом острове нет других орков? ---------------------
instance DIA_RakTarak_OtherOrcs(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 11;
	condition = DIA_RakTarak_OtherOrcs_condition;	
	information = DIA_RakTarak_OtherOrcs_info;
	description = "А на этом острове нет других орков?";
};
func int DIA_RakTarak_OtherOrcs_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_Hello))	{
		return TRUE;
	};
};
func void DIA_RakTarak_OtherOrcs_info()
{	
	AI_Output(other,self,"DIA_RakTarak_OtherOrcs_15_01");	//А на этом острове нет других орков?
		AI_Output(self,other,"DIA_RakTarak_OtherOrcs_18_02");	//Нет, орки здесь не жить. Они бояться этого места.
	AI_Output(other,self,"DIA_RakTarak_OtherOrcs_15_03");	//Почему?
		AI_Output(self,other,"DIA_RakTarak_OtherOrcs_18_04");	//Здесь жить дракон, который они бояться.
};
//Можешь мне рассказать подробнее о драконе? ---------------------
instance DIA_RakTarak_AboutDragon(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 12;
	condition = DIA_RakTarak_AboutDragon_condition;	
	information = DIA_RakTarak_AboutDragon_info;
	description = "Можешь мне рассказать подробнее о драконе?";
};
func int DIA_RakTarak_AboutDragon_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_OtherOrcs))	{
		return TRUE;
	};
};
func void DIA_RakTarak_AboutDragon_info()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutDragon_15_01");	//Можешь рассказать мне подробнее о драконе?
		AI_Output(self,other,"DIA_RakTarak_AboutDragon_18_02");	//Он старый, очень старый. Моя чувствовать это даже отсюда. И могущественный.
	AI_Output(other,self,"DIA_RakTarak_AboutDragon_15_03");	//Еще один слуга Белиара? Сколько их вообще развелось на этом свете?!
		AI_Output(self,other,"DIA_RakTarak_AboutDragon_18_04");	//Нет, он не злой и не добрый. Дракон жить сам по себе. Он никому не служить, только себе. 
		AI_Output(self,other,"DIA_RakTarak_AboutDragon_18_05");	//Моя хотеть поговорить с ним, но до дракон не добраться. Пропасть закрыть проход, а мост обрушиться.
};


//NS - 08/03/2016 ===========
// Квест "Орк в беде"
//===========================
//Что с твоим другом? ---------------------
instance DIA_RakTarak_WhatHappenedToFriend(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 21;
	condition = DIA_RakTarak_WhatHappenedToFriend_condition;	
	information = DIA_RakTarak_WhatHappenedToFriend_info;
	description = "Что с твоим другом?";
};
func int DIA_RakTarak_WhatHappenedToFriend_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_Hello))	{
		return TRUE;
	};
};
func void DIA_RakTarak_WhatHappenedToFriend_info()
{	
	AI_Output(other,self,"DIA_RakTarak_WhatHappenedToFriend_15_01");	//Что с твоим другом?
		AI_Output(self,other,"DIA_RakTarak_WhatHappenedToFriend_18_02");	//Он заболеть. Его укусить кшатор.
	AI_Output(other,self,"DIA_RakTarak_WhatHappenedToFriend_15_03");	//Что такое кшатор?
		AI_Output(self,other,"DIA_RakTarak_WhatHappenedToFriend_18_04");	//Кшатор – большой летающий муха с ядовитый жало.
	AI_Output(other,self,"DIA_RakTarak_WhatHappenedToFriend_15_05");	//Шершень?
		AI_Output(self,other,"DIA_RakTarak_WhatHappenedToFriend_18_06");	//Да, так говорить морра.
};
//Могу я чем-то помочь? ---------------------
//после предыдущего
instance DIA_RakTarak_MayIHelp(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 22;
	condition = DIA_RakTarak_MayIHelp_condition;	
	information = DIA_RakTarak_MayIHelp_info;
	description = "Могу я чем-то помочь?";
};
func int DIA_RakTarak_MayIHelp_condition(){
	if (Npc_KnowsInfo(other,DIA_RakTarak_WhatHappenedToFriend))	{
		return TRUE;
	};
};
func void DIA_RakTarak_MayIHelp_info()
{	
	AI_Output(other,self,"DIA_RakTarak_MayIHelp_15_01");	//Могу я чем-то помочь?
		AI_Output(self,other,"DIA_RakTarak_MayIHelp_18_02");	//Моя необходимо орочье зелье. Зелье помочь Ар-Туш.
	AI_Output(other,self,"DIA_RakTarak_MayIHelp_15_03");	//Дай-ка угадаю: у тебя его нет, да?
		AI_Output(self,other,"DIA_RakTarak_MayIHelp_18_04");	//Нет. Моя искать травы, но найти не все рядом. Далеко нельзя отойти, Ар-Туш может умереть без моя помощь.
	AI_Output(other,self,"DIA_RakTarak_MayIHelp_15_05");	//Я могу принести тебе эти травы. Что тебе нужно?
		AI_Output(self,other,"DIA_RakTarak_MayIHelp_18_06");	//Моя надо: три гдо-баш, два шти-ора, семь ура-гона, десять нори и один ктарто.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Start);
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Medicine);
	//UNFINISHED респаун растений в мире/у торговцев
};
//Могу я чем-то помочь? ---------------------
//пока идет квест
//записи в журнал по 1 разу
var int DIA_RakTarak_AboutMedicine01_Once;
var int DIA_RakTarak_AboutMedicine02_Once;
var int DIA_RakTarak_AboutMedicine03_Once;
var int DIA_RakTarak_AboutMedicine04_Once;
var int DIA_RakTarak_AboutMedicine05_Once;
var int DIA_RakTarak_AboutMedicineAll_Once;
//все спросили?
func int DIA_RakTarak_AboutMedicine_AllAsked()
{
	if (DIA_RakTarak_AboutMedicineAll_Once)	{
		return TRUE;
	};
	if (DIA_RakTarak_AboutMedicine01_Once && DIA_RakTarak_AboutMedicine02_Once && DIA_RakTarak_AboutMedicine03_Once
		&& DIA_RakTarak_AboutMedicine04_Once && DIA_RakTarak_AboutMedicine05_Once)
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_All);
		DIA_RakTarak_AboutMedicineAll_Once = TRUE;
		return TRUE;
	};
	return FALSE;
};
//.......................................
instance DIA_RakTarak_AboutMedicine(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 23;
	condition = DIA_RakTarak_AboutMedicine_condition;	
	information = DIA_RakTarak_AboutMedicine_info;
	description = "Насчет лекарства...";
};
func int DIA_RakTarak_AboutMedicine_condition(){
	if (MIS_DS2P_OrcInTrouble == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_RakTarak_AboutMedicine_info()
{	
	Info_ClearChoices(DIA_RakTarak_AboutMedicine);
	if (DIA_RakTarak_AboutMedicine_AllAsked())	{
		Info_AddChoice(DIA_RakTarak_AboutMedicine,"Я понял. (НАЗАД)",DIA_RakTarak_AboutMedicine_Back);
	};
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"Что такое ктарто?",DIA_RakTarak_AboutMedicine05);
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"Что такое нори?",DIA_RakTarak_AboutMedicine04);
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"Что такое ура-гона?",DIA_RakTarak_AboutMedicine03);
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"Что такое шти-ора?",DIA_RakTarak_AboutMedicine02);
	Info_AddChoice(DIA_RakTarak_AboutMedicine,"Что такое гдо-баш?",DIA_RakTarak_AboutMedicine01);
	if ((Npc_HasItems(other,ItPl_Health_Herb_01) >= 3) && (Npc_HasItems(other,ItPl_Mana_Herb_01) >= 2)
		&& (Npc_HasItems(other,ItPl_Mushroom_01) >= 7) && (Npc_HasItems(other,ItPl_Blueplant) >= 10)
		&& (Npc_HasItems(other,ItFo_DS2P_OrcBooze) >= 1))
	{
		Info_AddChoice(DIA_RakTarak_AboutMedicine,"Я все принес.",DIA_RakTarak_AboutMedicine_Ready);
	};
};
func void DIA_RakTarak_AboutMedicine_Back()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine_Back_15_01");	//Я понял.
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine_Back_18_02");	//Моя ждать и говорить - быстрее. Ар-Туш быстро слабеть. Он скоро мочь умереть.
	Info_ClearChoices(DIA_RakTarak_AboutMedicine);
};
func void DIA_RakTarak_AboutMedicine01()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine01_15_01");	//Что такое гдо-баш?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine01_18_02");	//Целебный растение.
	if (!DIA_RakTarak_AboutMedicine01_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_GroBash);
		DIA_RakTarak_AboutMedicine01_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"Я понял. (НАЗАД)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine02()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine02_15_01");	//Что такое шти-ора?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine02_18_02");	//Огненный крапива. Много острый и жгучий растений.
	if (!DIA_RakTarak_AboutMedicine02_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_ShtiOra);
		DIA_RakTarak_AboutMedicine02_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"Я понял. (НАЗАД)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine03()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine03_15_01");	//Что такое ура-гона?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine03_18_02");	//Ура-гона есть темный гриб. Маленький, хорошо пахнет.
	if (!DIA_RakTarak_AboutMedicine03_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_UraGona);
		DIA_RakTarak_AboutMedicine03_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"Я понял. (НАЗАД)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine04()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine04_15_01");	//Что такое нори?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine04_18_02");	//Есть ягода с листьями. Серафис, кажется говорить морра.
	if (!DIA_RakTarak_AboutMedicine04_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Nori);
		DIA_RakTarak_AboutMedicine04_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"Я понял. (НАЗАД)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine05()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine05_15_01");	//Что такое ктарто?
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine05_18_02");	//Самогон. Много крепкий и жгучий самогон. Орочий самогон. Морра опасно пить ктарто - мора мочь умереть.
	if (!DIA_RakTarak_AboutMedicine05_Once) {
		B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Ktarto);
		DIA_RakTarak_AboutMedicine05_Once = TRUE;
		if (DIA_RakTarak_AboutMedicine_AllAsked())	{
			Info_AddChoice(DIA_RakTarak_AboutMedicine,"Я понял. (НАЗАД)",DIA_RakTarak_AboutMedicine_Back);
		};
	};
};
func void DIA_RakTarak_AboutMedicine_Ready()
{	
	AI_Output(other,self,"DIA_RakTarak_AboutMedicine_Ready_15_01");	//Я все принес.
	//Даем травы и крепкий самогон
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01, 3);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,2);
	Npc_RemoveInvItems(other,ItPl_Mushroom_01, 7);
	Npc_RemoveInvItems(other,ItPl_Blueplant, 10);
	Npc_RemoveInvItems(other,ItFo_DS2P_OrcBooze, 1);
	AI_PrintScreen("Ингредиенты отданы",-1,YPOS_ItemGiven,FONT_ScreenSmall,5);
	
		AI_Output(self,other,"DIA_RakTarak_AboutMedicine_Ready_18_02");	//Моя благодарен чужак за помощь. Чужак не такой как другой морра.
	//Рак-Тарак подходит к лежащему орку и что-то химичит рядом с ним. Второй орк встает и выпивает зелье - B_DS2P_Talk_End
	AI_PlayAni(self,"T_LAB_STAND_2_S0");
	AI_PlayAni(self,"T_LAB_S0_2_S1");
	AI_PlayAni(self,"T_LAB_S1_2_S0");
	AI_PlayAni(self,"T_LAB_S0_2_STAND");
	ArTush_Healed = -1; //пора пить лекарство
	AI_StopProcessInfos(self);
};
// Исцеление - ТРИАЛОГ ----------------------------
instance DIA_RakTarak_Healed(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 24;
	condition = DIA_RakTarak_Healed_condition;	
	information = DIA_RakTarak_Healed_info;
	important = TRUE;
};
func int DIA_RakTarak_Healed_condition()
{
	if (ArTush_Healed && (Npc_GetDistToPlayer(Orc_DS2P_ArTush) < PERC_DIST_INTERMEDIAT))	{
		return TRUE;
	};
};
func void DIA_RakTarak_Healed_info()
{	
	//UNFINISHED
	var C_NPC RakTarak;	RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
	var C_NPC ArTush;	ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
	TRIA_Invite(ArTush);
	TRIA_Start();
	
	TRIA_Next(RakTarak);
	AI_LookAtNpc(RakTarak,hero);
		AI_Output(self,other,"DIA_RakTarak_Healed_18_01");	//Помочь! Зелье помочь!
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_OrcInTrouble_Success);
	B_GivePlayerXP(XP_MIS_OrcInTrouble_Success);
	
	//Рак-Тарак поворачивается к Ар-Тушу.
	AI_LookAtNpc(RakTarak,ArTush);
		AI_Output(self,other,"DIA_RakTarak_Healed_18_02");	//Утга краша брадо! Морра ингже штрассо, шебо нао харра.
	
	TRIA_Next(ArTush);
		AI_Output(self,other,"DIA_RakTarak_Healed_18_03");	//Фарре штабо удда морра!
	AI_Output(other,self,"DIA_RakTarak_Healed_15_04");	//А по-миртански можно? Ни слова не понимаю.
	
	TRIA_Next(RakTarak);
	AI_TurnToNpc(RakTarak,hero);
	AI_LookAtNpc(RakTarak,hero);
		AI_Output(self,other,"DIA_RakTarak_Healed_18_05");	//Ар-Туш говорить спасибо чужак.
	AI_Output(other,self,"DIA_RakTarak_Healed_15_06");	//На здоровье, конечно. Но разве нельзя это сказать мне лично?
		AI_Output(self,other,"DIA_RakTarak_Healed_18_07");	//Ар-Туш не знать язык морра. Моя тоже хотеть сказать спасибо чужак. 
		AI_Output(self,other,"DIA_RakTarak_Healed_18_08");	//Моя не мочь дать много. Чужак взять этот топор, а моя научить морра им драться.
	//дает топор и будет учить
	B_GiveInvItems(RakTarak,hero,ItMW_Ds_KrashDargot,1);
	TEACH_RakTarak = TRUE;

	TRIA_Finish();
};

//NS - 21/03/2016 ===========
// Квест "Защита для маленьких"
//===========================
//зовем к гоблинам ---------------------
instance DIA_RakTarak_GobboCall(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 30;
	condition = DIA_RakTarak_GobboCall_condition;	
	information = DIA_RakTarak_GobboCall_info;
	description = "Привет, волосатый. Еще не нашел, куда податься?";
};
func int DIA_RakTarak_GobboCall_condition(){
	if (MIS_DS2P_OrcInTrouble == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_RakTarak_GobboCall_info()
{	
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_01");	//Привет, волосатый. Еще не нашел, куда податься?
		AI_Output(self,other,"DIA_RakTarak_GobboCall_18_02");	//Нет, моя не знай, куда идти. Моя с Ар-Туш, наверное, продолжить наш путешествие.
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_03");	//Есть предложение получше.
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_04");	//На этом острове, на болотах, живет племя гоблинов, которым грозит вымирание. На них постоянно нападают болотные черви, с которыми гоблины не могут справиться. 
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_05");	//Им нужны такие защитники, как вы. У тебя с Ар-Тушом появится свой дом, и вам не надо будет кочевать с места на место.
		AI_Output(self,other,"DIA_RakTarak_GobboCall_18_06");	//Моя нравиться твой предложение. Наша согласна. Моя и Ар-Туш защищать деревня гоблинов и остаться жить там.
	AI_Output(other,self,"DIA_RakTarak_GobboCall_15_07");	//Вот и славно.
		AI_Output(self,other,"DIA_RakTarak_GobboCall_18_08");	//Но наша не знать, куда идти. Друг морра вести нас.
	//Запись в дневнике "Защита для маленьких"
	B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_OrcsAgree);
	B_GivePlayerXP(XP_MIS_Protection4LittleOnes_Agreed);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Orc_DS2P_ArTush.aivar[AIV_PARTYMEMBER] = TRUE;
};
//ведем к гоблинам ---------------------
instance DIA_RakTarak_LetsGo(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 31;
	condition = DIA_RakTarak_LetsGo_condition;	
	information = DIA_RakTarak_LetsGo_info;
	description = "Я отведу вас. Пошли!";
	permanent = TRUE;
};
func int DIA_RakTarak_LetsGo_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && (Orcs_Follow == FALSE))	{
		return TRUE;
	};
};
func void DIA_RakTarak_LetsGo_info()
{	
	B_StartOtherRoutine(self,"FOLLOW");
	B_StartOtherRoutine(Orc_DS2P_ArTush,"FOLLOW");
	AI_Output(other,self,"DIA_RakTarak_LetsGo_15_01");	//Я отведу вас. Пошли!
	AI_StopProcessInfos(self);
	Orcs_Follow = TRUE;
};
//Ждать ---------------------
instance DIA_RakTarak_WaitHere(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 32;
	condition = DIA_RakTarak_WaitHere_condition;	
	information = DIA_RakTarak_WaitHere_info;
	description = "Подождите тут!";
	permanent = TRUE;
};
func int DIA_RakTarak_WaitHere_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && (Orcs_Follow == TRUE))	{
		return TRUE;
	};
};
func void B_DS2P_OrcsWait()
{
	Orcs_Follow = FALSE;
	B_SetWaitWP(self, WP_RakTarak_Wait);
	B_StartOtherRoutine(self,"WAIT");
//	B_SetWaitWP(self, WP_ArTush_Wait); WP общий у 2х орков
	B_StartOtherRoutine(Orc_DS2P_ArTush,"WAIT");
};
func void DIA_RakTarak_WaitHere_info()
{	
	B_DS2P_OrcsWait();
	AI_Output(other,self,"DIA_RakTarak_WaitHere_15_01");	//Подождите тут!
		AI_Output(self,other,"DIA_RakTarak_WaitHere_18_02");	//Наша ждать здесь. Морра возвращаться.
	AI_StopProcessInfos(self);
};
//Туда нельзя ---------------------
instance DIA_RakTarak_TooClose(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 33;
	condition = DIA_RakTarak_TooClose_condition;	
	information = DIA_RakTarak_TooClose_info;
	important = TRUE;
	permanent = TRUE;
};
func int C_DS2P_OrcsTooClose()
{
	//UNFINISHED слишком близко к деревне
	if (Npc_GetDistToWP(self,"DP_VILL_VILLAGE_01") < 5000)	{
		return FALSE;
	};
	if (Npc_GetDistToWP(self,"DP_VILL_VILLAGE_02") < 5000)	{
		return FALSE;
	};
	//UNFINISHED слишком близко к охотникам
	if (Npc_GetDistToWP(self,"") < 3000)	{
		return FALSE;
	};
	return FALSE;
};
func int DIA_RakTarak_TooClose_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && (Orcs_Follow == TRUE)
		 && C_DS2P_OrcsTooClose())	{
		return TRUE;
	};
};
func void DIA_RakTarak_TooClose_info()
{	
	B_DS2P_OrcsWait();
		AI_Output(self,other,"DIA_RakTarak_TooClose_18_01");	//Наша дальше не идти. Много морра, слишком опасно.
	AI_StopProcessInfos(self);
};
//Пришли! ---------------------
instance DIA_RakTarak_CameToGobbos(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 34;
	condition = DIA_RakTarak_CameToGobbos_condition;	
	information = DIA_RakTarak_CameToGobbos_info;
	description = "Все, мы пришли.";
	permanent = TRUE;
};
func int C_DS2P_OrcsCameToGobbos()
{
	//UNFINISHED пришли в деревню
	if (Npc_GetDistToWP(self,"") < 3000)	{
		return FALSE;
	};
	return FALSE;
};
func int DIA_RakTarak_CameToGobbos_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && (Orcs_Follow == TRUE)
		 && C_DS2P_OrcsCameToGobbos())	{
		return TRUE;
	};
};
func void DIA_RakTarak_CameToGobbos_info()
{	
	//обновить глоб. переменные
	ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
	RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
	//будут жить в деревне
	B_StartOtherRoutine(RakTarak,"GOBBOCAMP");
	B_StartOtherRoutine(ArTush,"GOBBOCAMP");
	
	TRIA_Start();
	TRIA_Invite(ArTush);
	
	AI_Output(other,self,"DIA_RakTarak_CameToGobbos_15_01");	//Все, мы пришли.
		AI_Output(self,other,"DIA_RakTarak_CameToGobbos_18_02");	//Спасибо, морра. Твоя много делай для нас. Моя не знай, как твоя благодарить.

	TRIA_Next(ArTush);
		AI_TurnToNpc(self,other);
		AI_TurnToNpc(other,self);
		AI_Output(self,other,"DIA_RakTarak_CameToGobbos_18_03");	//Уша бара, Рак-Тарак. Иште купра фэрес идга.
	TRIA_Next(RakTarak);
		AI_TurnToNpc(self,other);
		AI_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_RakTarak_CameToGobbos_15_04");	//Что он говорит?
		AI_Output(self,other,"DIA_RakTarak_CameToGobbos_18_05");	//Ар-Туш говорить, что научить морра лучше сражаться с большой меч.
	//После этих слов Ар-Туш вынимает свое оружие из ножен и пару раз машет им
	//TEST NEEDED
	TRIA_Next(ArTush);
		AI_TurnToNpc(self,other);
		AI_TurnToNpc(other,self);
		AI_ReadyMeleeWeapon(self);
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_SpawnNpcRange(self,MEATBUG_Invisible,1,10);
		self = Hlp_GetNpc(self_bkup);
		Npc_SetTarget(self,MEATBUG_Invisible);
		AI_Attack(self);
	TRIA_Next(RakTarak);
		AI_TurnToNpc(self,other);
		AI_TurnToNpc(other,self);
		AI_Output(self,other,"DIA_RakTarak_CameToGobbos_18_06");	//Запомнить? Такой прием может спасти морра жизнь.
	TRIA_Finish();

	//Владение двуручным оружием +3
	B_RaiseFightTalent(other,NPC_TALENT_2H, 3);
	//Запись в дневнике "Защита для маленьких"
	B_DSG_Log_OpenClose(TOPIC_DS2P_Protection4LittleOnes,LOG_MISSION,LOG_Running,TOPIC_DS2P_Protection4LittleOnes_OrcsCame);
	
	//привели, больше не ведем
	Orcs_Follow = FALSE;
	Orcs_CameToGobbos = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Orc_DS2P_ArTush.aivar[AIV_PARTYMEMBER] = FALSE;
};



//NS - 10/03/2016 ===========
// ОБУЧЕНИЕ
//===========================
instance DIA_RakTarak_preTeach(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 51;
	condition = DIA_RakTarak_preTeach_condition;	
	information = DIA_RakTarak_preTeach_info;
	description = "Чему ты можешь научить меня?";
};
func int DIA_RakTarak_preTeach_condition()
{
	if (TEACH_RakTarak)	{
		return TRUE;
	};
};
func void DIA_RakTarak_preTeach_info()
{	
	AI_Output(other,self,"DIA_RakTarak_preTeach_15_01");	//Чему ты можешь научить меня?
		AI_Output(self,other,"DIA_RakTarak_preTeach_18_02");	//Моя научить твоя драться топор, также делать твоя сильнее.
	B_ds_LogEntry(TOPIC_TeacherOther,LOG_NOTE,-1,"Орк Рак-Тарак покажет, как правильно сражаться орочьим оружием, а также пару упражнений для повышения силы.");
};
// ----------------------------------------------------------
// Орк обучает нас владению орочьим оружием, а также повышает силу до 200.
instance DIA_RakTarak_Teach(C_Info)
{
	npc = Orc_DS2P_RakTarak;						nr = 52;
	condition = DIA_RakTarak_Teach_condition;	
	information = DIA_RakTarak_Teach_info;
	description = "Научи меня...";
	permanent = TRUE;
};
func int DIA_RakTarak_Teach_condition()
{
	if (TEACH_RakTarak
		&& Npc_KnowsInfo(other,DIA_RakTarak_preTeach))	{
		return TRUE;
	};
};
func void DIA_RakTarak_Teach_info()
{	
	Info_ClearChoices(DIA_RakTarak_Teach);
	Info_AddChoice(DIA_RakTarak_Teach,Dialog_Back,DIA_RakTarak_Teach_Back);
	Info_AddChoice(DIA_RakTarak_Teach,"Сила +5",DIA_RakTarak_Teach_Strength5);
	Info_AddChoice(DIA_RakTarak_Teach,"Сила +1",DIA_RakTarak_Teach_Strength1);
	Info_AddChoice(DIA_RakTarak_Teach,"Орочье оружие",DIA_RakTarak_Teach_OrcWeapon);
};
func void DIA_RakTarak_Teach_Back()
{	
	Info_ClearChoices(DIA_RakTarak_Teach);
};
func void DIA_RakTarak_Teach_OrcWeapon()
{	
	if(B_DS_TeachPlayerOrcWeapon(self,other,ORCWEAPON_LEVEL_FIRST))
	{
		AI_Output(other,self,"DIA_RakTarak_Teach_OrcWeapon_15_01");	//Научи меня сражатсья твоим топором.
			AI_Output(self,other,"DIA_RakTarak_Teach_OrcWeapon_18_02");	//Морра должен помнить, что орочий топор тяжелее, чем у морра. Сражаться им надо иметь много сила и сноровка.
			AI_Output(self,other,"DIA_RakTarak_Teach_OrcWeapon_18_03");	//Морра держать рукоять две руки, опустить оружие кончиком к земле, чтобы не тратить много сила. 
			AI_Output(self,other,"DIA_RakTarak_Teach_OrcWeapon_18_04");	//Бить надо широкими замахами, первый удар сверху вниз. Такой удар нанести много урон врагу, доспех мочь не спасти.
	};
	DIA_RakTarak_Teach_info();
};
func void DIA_RakTarak_Teach_Strength1()
{	
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,200))
	{
		AI_Output(self,other,"DIA_RakTarak_Teach_Strength_18_01");	//Так морра быть сильнее.
	};
	DIA_RakTarak_Teach_info();
};
func void DIA_RakTarak_Teach_Strength5()
{	
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,200))
	{
		AI_Output(self,other,"DIA_RakTarak_Teach_Strength_18_01");	//Так морра быть сильнее.
	};
	DIA_RakTarak_Teach_info();
};



/* UNFINISHED

SVN
Рак-Тарак: Моя больше ничему не научить морра.



//*/
