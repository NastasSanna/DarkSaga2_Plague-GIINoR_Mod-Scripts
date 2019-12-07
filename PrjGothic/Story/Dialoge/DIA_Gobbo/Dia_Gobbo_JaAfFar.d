instance DIA_JaAfFar_EXIT(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;
	nr = 999;
	permanent = TRUE;
	condition = DIA_JaAfFar_EXIT_condition;	
	information = DIA_JaAfFar_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_JaAfFar_EXIT_condition(){	return TRUE;};
func void DIA_JaAfFar_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 07/05/2016 ===========
// Знакомство 
//===========================
instance DIA_JaAfFar_Hello(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 1;
	condition = DIA_JaAfFar_Hello_condition;	
	information = DIA_JaAfFar_Hello_info;
	important = TRUE;
};
func int DIA_JaAfFar_Hello_condition(){	return TRUE;};
func void DIA_JaAfFar_Hello_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_Hello_15_01");	//Члофе? Ощенно нежиданно фидеть члофе ф дерефня. Ощенно. Джа-Аф-Фар-та-ка-мука!
};
// --------------------------------------------
instance DIA_JaAfFar_HowAU(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 2;
	condition = DIA_JaAfFar_HowAU_condition;	
	information = DIA_JaAfFar_HowAU_info;
	description = "Как дела?";
	permanent = TRUE;
};
func int DIA_JaAfFar_HowAU_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_Hello)) {
		return TRUE;
	};
};
func void DIA_JaAfFar_HowAU_info()
{	
		AI_Output(other,self,"DIA_JaAfFar_HowAU_15_01");	//Как дела?
	AI_Output(self,other,"DIA_JaAfFar_HowAU_18_02");	//Луще фсе.
};

//NS - 07/05/2016 ===========
// Квест "Ушлый вор" 
//===========================
func void B_JaAfFar_StealGold(var int sum)
{
	Npc_RemoveInvItems(other, ItMi_Gold, MIS_DS2P_QuirkyThief_Sum);
	MIS_DS2P_QuirkyThief_Sum = sum;
	var string txt;	txt = CS3("Потеряно ",IntToString(MIS_DS2P_QuirkyThief_Sum)," золотых");
	AI_PrintScreen(txt, -1,YPOS_ItemGiven, FONT_ScreenSmall, 2);
};
instance DIA_JaAfFar_WhoAreU(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 10;
	condition = DIA_JaAfFar_WhoAreU_condition;	
	information = DIA_JaAfFar_WhoAreU_info;
	description = "Ты кто?";
};
func int DIA_JaAfFar_WhoAreU_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_Hello)) {
		return TRUE;
	};
};
func void DIA_JaAfFar_WhoAreU_info()
{	
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_15_01");	//Ты кто?
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_18_02");	//Моя зфать Джа-Аф-Фар, лучши фор гоблина. Мой мочь украдать щто хошь.
	Info_ClearChoices(DIA_JaAfFar_WhoAreU);
	Info_AddChoice(DIA_JaAfFar_WhoAreU,"Понятно.",DIA_JaAfFar_WhoAreU_OK);
	if (Npc_HasItems(other,ItMi_Gold) >= 75)	{
		Info_AddChoice(DIA_JaAfFar_WhoAreU,"Прямо уж лучший?",DIA_JaAfFar_WhoAreU_Steal1);
	};
};
func void DIA_JaAfFar_WhoAreU_OK()
{	
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_OK_15_01");	//Понятно.
	Info_ClearChoices(DIA_JaAfFar_WhoAreU);
};
// обворовывает нас 1 раз -----------------------------------------
func void DIA_JaAfFar_WhoAreU_Steal1()
{	
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_Steal1_15_01");	//Прямо уж лучший?
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_Steal1_18_02");	//Ти-ка, ти-ка.
	AI_PointAt(self,Npc_GetNearestWP(other));
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_Steal1_18_03");	//Смотре щлофе туди.
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_Steal1_15_04");	//Что там?
	AI_TurnToWP(other,Npc_GetNearestWP(other));
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_Steal1_18_05");	//Показатьси.
	//крадет 36 золотых
	B_JaAfFar_StealGold(36);
	AI_TurnToNpc(other,self);
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_Steal1_15_06");	//(про себя) Да этот мелкий хулиган пытается обокрасть меня!
	//Запись в дневнике "Ушлый вор"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Start);
	Info_ClearChoices(DIA_JaAfFar_WhoAreU);
	Info_AddChoice(DIA_JaAfFar_WhoAreU,"Эй, жулик, верни мое золото!",DIA_JaAfFar_GiveBackMyGold);
	//если можем украсть обратно
	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 50))	{
		Info_AddChoice(DIA_JaAfFar_WhoAreU,"(отвлечь)",DIA_JaAfFar_WhoAreU_StealBack1);
	};
};
func void DIA_JaAfFar_WhoAreU_StealBack1()
{	
	MIS_DS2P_QuirkyThief_StealBack = TRUE;
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack1_15_01");	//Слушай, а что это за зверь такой, которого несет ваш охотник? Я таких раньше не видел.
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_StealBack1_18_02");	//Гиде?
	AI_TurnAway(self,other);
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_StealBack1_18_03");	//Больше птице. Клевит мертвый.
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack1_15_04");	//А, так это падальщик, а я не узнал сразу. Старею, видать.
	//ГГ получает 49 золотых.
	B_GiveInvItems(self,other,ItMi_Gold,49);
	B_GiveThiefXP();
	Snd_Play("Geldbeutel");
	//Запись в дневнике "Ушлый вор"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_StealBack1);
	AI_StopProcessInfos(self);
};
// обворовывает нас 2 раз -----------------------------------------
instance DIA_JaAfFar_Steal2(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 11;
	condition = DIA_JaAfFar_Steal2_condition;	
	information = DIA_JaAfFar_Steal2_info;
	important = TRUE;
};
func int DIA_JaAfFar_Steal2_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_WhoAreU) && MIS_DS2P_QuirkyThief_StealBack) {
		return TRUE;
	};
};
func void DIA_JaAfFar_Steal2_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_Steal2_15_01");	//Стой, щлофе. Моя к тфой есть вопроси.
		AI_Output(self,other,"DIA_JaAfFar_Steal2_18_02");	//Спрашивай.
	AI_Output(other,self,"DIA_JaAfFar_Steal2_15_03");	//Щлофе, много путешестфи. Моя хоти знафть: есть ли больше земля за больше фода.
		AI_Output(self,other,"DIA_JaAfFar_Steal2_18_04");	//Есть ли другие земли, кроме вашего острова? Конечно. Их очень много. На самом деле...
	//ГГ вновь «передает» гоблину золото, на этот раз 77 монет.
	B_JaAfFar_StealGold(77);
	AI_Output(other,self,"DIA_JaAfFar_Steal2_15_05");	//Спасибо щлофе. Моя знайть фсе, что хотейть.
		AI_Output(self,other,"DIA_JaAfFar_Steal2_18_06");	//(про себя) Этот маленький паршивец никак не угомонится.
	//Запись в дневнике "Ушлый вор"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Steal2);
	Info_ClearChoices(DIA_JaAfFar_Steal2);
	Info_AddChoice(DIA_JaAfFar_Steal2,"Эй, жулик, верни мое золото!",DIA_JaAfFar_GiveBackMyGold);
	//если можем украсть обратно
	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 70))	{
		Info_AddChoice(DIA_JaAfFar_Steal2,"(отвлечь)",DIA_JaAfFar_WhoAreU_StealBack2);
	};
};
func void DIA_JaAfFar_WhoAreU_StealBack2()
{	
	MIS_DS2P_QuirkyThief_StealBack = TRUE;
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack2_15_01");	//А почему я не вижу у вас в деревне самок гоблинов?
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_StealBack2_18_02");	//Потому щти жена гоблине нельзе показываться щлофе.
	//ГГ крадет 96 золотых.
	B_GiveInvItems(self,other,ItMi_Gold,96);
	B_GiveThiefXP();
	Snd_Play("Geldbeutel");
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack2_15_03");	//Спасибо. Это все, что я хотел знать.
	//Запись в дневнике "Ушлый вор"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_StealBack2);
	AI_StopProcessInfos(self);
};
// обворовывает нас 3 раз -----------------------------------------
instance DIA_JaAfFar_Steal3(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 12;
	condition = DIA_JaAfFar_Steal3_condition;	
	information = DIA_JaAfFar_Steal3_info;
	important = TRUE;
};
func int DIA_JaAfFar_Steal3_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_Steal2) && MIS_DS2P_QuirkyThief_StealBack) {
		return TRUE;
	};
};
func void DIA_JaAfFar_Steal3_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_Steal3_18_01");	//Щлофе, щлофе стой. Джа-Аф-Фар хотейть предложить щлофе карта.
		AI_Output(other,self,"DIA_JaAfFar_Steal3_15_02");	//Какую карту?
	AI_Output(self,other,"DIA_JaAfFar_Steal3_18_03");	//Старый карте. Ощенно старый. Там быть указан спрятан сокровище. Щлофе найти сокровище.
		AI_Output(other,self,"DIA_JaAfFar_Steal3_15_04");	//Да? И что ты хочешь за эту карту?
	AI_Output(self,other,"DIA_JaAfFar_Steal3_18_05");	//Щлофе дать Джа-Аф-Фар золото. Много золото. 100 монет.
		AI_Output(other,self,"DIA_JaAfFar_Steal3_15_06");	//Покажи-ка ты, дружок, сначала мне эту карту.
	AI_Output(self,other,"DIA_JaAfFar_Steal3_18_07");	//(ищет) Моя оставите карта доме. Щлофе приходите завтре.
	//ГГ «передает» 97 золотых гоблину.
	B_JaAfFar_StealGold(97);
		AI_Output(other,self,"DIA_JaAfFar_Steal3_15_08");	//(про себя) Эдак можно и до бесконечности тут проторчать.
	//Запись в дневнике "Ушлый вор"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Steal3);
	Info_ClearChoices(DIA_JaAfFar_Steal3);
	Info_AddChoice(DIA_JaAfFar_Steal3,"Эй, жулик, верни мое золото!",DIA_JaAfFar_GiveBackMyGold);
	//если можем украсть обратно
	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 90))	{
		Info_AddChoice(DIA_JaAfFar_Steal3,"(отвлечь)",DIA_JaAfFar_WhoAreU_StealBack3);
	};
};
func void DIA_JaAfFar_WhoAreU_StealBack3()
{	
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack3_15_01");	//Слушай, а тебе не нужен кинжал? Ты бы видел его лезвие, как оно блестит на солнце! 
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack3_15_02");	//А сталь? Лучшей стали ты на всем острове не встретишь, головой ручаюсь! А как им удобно будет срезать кошели, а? 
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack3_15_03");	//И всего за сто золотых. Берешь?
	AI_Output(self,other,"DIA_JaAfFar_WhoAreU_StealBack3_18_04");	//Ньеть. Джа-Аф-Фар не нужне кинжале.
		AI_Output(other,self,"DIA_JaAfFar_WhoAreU_StealBack3_15_05");	//Ну, на нет и суда нет.
	//ГГ крадет 117 золотых.
	B_GiveInvItems(self,other,ItMi_Gold,117);
	B_GiveThiefXP();
	Snd_Play("Geldbeutel");

	//Запись в дневнике "Ушлый вор"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_StealBack3);
	AI_StopProcessInfos(self);
};

// отбираем золото силой - квест закрывается -----------------------------------------
func void DIA_JaAfFar_GiveBackMyGold()
{	
	MIS_DS2P_QuirkyThief_StealBack = FALSE;
	//возвращает золото 2-мя частями
	var int sum1;	sum1 = MIS_DS2P_QuirkyThief_Sum * 2 / 3;
	var int sum2;	sum2 = MIS_DS2P_QuirkyThief_Sum - sum1; 
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_01");	//Эй, жулик, верни мое золото!
	AI_Output(self,other,"DIA_JaAfFar_GiveBackMyGold_18_02");	//Щито? Джа-Аф-Фар не понимать щлофе. Щлофе гофарить медлене. Утари-ша-га-чи-за!
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_03");	//А ну, маленький воришка, не притворяйся, что не понимаешь меня!
	AI_Output(self,other,"DIA_JaAfFar_GiveBackMyGold_18_04");	//(притворно) Но моя не понимайть, щто гофарить щлофе.
	//ГГ достает оружие.
	if (Npc_HasEquippedMeleeWeapon(other))	{
		AI_ReadyMeleeWeapon(other);
	}
	else {
		Npc_SetToFistMode(other);
	};
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_05");	//Ну все, маленький паршивец. Если я не увижу свое золото, то тебе станет очень больно, обещаю.
	AI_Output(self,other,"DIA_JaAfFar_GiveBackMyGold_18_06");	//Воть, взять, щлофе забрать деньга, но не бить Джа-Аф-Фар.
	//Гоблин дает часть золота
	B_GiveInvItems(self,other,ItMi_Gold,sum1);
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_07");	//Эй, тут не все.
	//Гоблин возвращает остальное
	B_GiveInvItems(self,other,ItMi_Gold,sum2);
	AI_Output(self,other,"DIA_JaAfFar_GiveBackMyGold_18_08");	//Фсе, это фсе. У Джа-Аф-Фар неть больше.
		AI_Output(other,self,"DIA_JaAfFar_GiveBackMyGold_15_09");	//Так-то.
	//Убирает оружие.
	if (Npc_IsInFightMode(other,FMODE_MELEE))	{
		AI_RemoveWeapon(other);
	}
	else {
		Npc_SetToFightMode(other,FMODE_NONE);
	};
	//Запись в дневнике "Ушлый вор" - квест закрыт
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_QuirkyThief_BruteForce);
};
// говорит, что мы лучший вор, чем он -----------------------------------------
instance DIA_JaAfFar_BestThief(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 13;
	condition = DIA_JaAfFar_BestThief_condition;	
	information = DIA_JaAfFar_BestThief_info;
	important = TRUE;
};
func int DIA_JaAfFar_BestThief_condition()
{
	if (Npc_KnowsInfo(other,DIA_JaAfFar_Steal3) && MIS_DS2P_QuirkyThief_StealBack) {
		return TRUE;
	};
};
func void DIA_JaAfFar_BestThief_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_01");	//Стой, щлофе.
		AI_Output(other,self,"DIA_JaAfFar_BestThief_15_02");	//О Иннос, помоги мне! И тебе не надоело уже пытаться меня обокрасть, а?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_03");	//Ньеть-ньеть. Моя хотьеть гофорите с щлофе. Моя хотьеть сказате, щто щлофе ощенно хороше форе, луще Джа-Аф-Фар.
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_04");	//Моя просить щлофе помоще мне.
		AI_Output(other,self,"DIA_JaAfFar_BestThief_15_05");	//Помочь? В чем?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_06");	//Моя хотьеть украсте муке у щлофе ф дерефне на береге.
		AI_Output(other,self,"DIA_JaAfFar_BestThief_15_07");	//А от меня что требуется? Неужто сам не можешь стянуть мешок с мукой?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_18_08");	//Мельнице с муке охраняте злой щлофе. Моя уже пытатьсе, но еле убежате. Тфоя отвлечь злой щлофе, а моя красти.
	Info_ClearChoices(DIA_JaAfFar_BestThief);
	Info_AddChoice(DIA_JaAfFar_BestThief,"Некогда мне с мукой возиться.",DIA_JaAfFar_BestThief_No);
	Info_AddChoice(DIA_JaAfFar_BestThief,"Помогу.",DIA_JaAfFar_BestThief_Yes);
};
func void DIA_JaAfFar_BestThief_No()
{	
		AI_Output(other,self,"DIA_JaAfFar_BestThief_No_15_01");	//Некогда мне с мукой возиться.
	AI_Output(self,other,"DIA_JaAfFar_BestThief_No_18_02");	//Члофе не хотеть помочь?
		AI_Output(other,self,"DIA_JaAfFar_BestThief_No_15_03");	//Нет.
	Info_ClearChoices(DIA_JaAfFar_BestThief);
	//Запись в дневнике "Ушлый вор"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_QuirkyThief_Failed_FlourNo);
	AI_StopProcessInfos(self);
};
func void DIA_JaAfFar_BestThief_Yes()
{	
		AI_Output(other,self,"DIA_JaAfFar_BestThief_Yes_15_01");	//Хорошо. Я помогу тебе. Мне надо просто отвлечь охранника?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_Yes_18_02");	//Ти-ка. Тфоя наде отвлечь щлофе.
	AI_Output(self,other,"DIA_JaAfFar_BestThief_Yes_18_03");	//И ище ведите моя до деревне щлофе. И назад. Гоблине опасне ходите один.
		AI_Output(other,self,"DIA_JaAfFar_BestThief_Yes_15_04");	//Хорошо, когда идем?
	AI_Output(self,other,"DIA_JaAfFar_BestThief_Yes_18_05");	//Ноще. Опасне крадати днем. Тфоя приходите к моя середи ноще.
	Info_ClearChoices(DIA_JaAfFar_BestThief);
	//Запись в дневнике "Ушлый вор"
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_QuirkyThief_Flour);
	MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_Pre;
};
instance DIA_JaAfFar_LetsGo(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 14;
	condition = DIA_JaAfFar_LetsGo_condition;	
	information = DIA_JaAfFar_LetsGo_info;
	description = "Пошли.";
	permanent = TRUE;
};
func int DIA_JaAfFar_LetsGo_condition()
{
	if (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_Pre) {
		return TRUE;
	};
};
func void DIA_JaAfFar_LetsGo_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_LetsGo_15_01");	//Пошли.
	if (Wld_IsTime(22,0, 2, 0))	{
		AI_Output(self,other,"DIA_JaAfFar_LetsGo_18_02");	//Щлофе идти первый.
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		self.aivar[AIV_EnemyOverride] = TRUE;
	}
	else	{
		AI_Output(self,other,"DIA_JaAfFar_LetsGo_18_03");	//Ми-на! Среди ноче надо идите.
	};
};
// -----------------------------------------
instance DIA_JaAfFar_CameToMill(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 15;
	condition = DIA_JaAfFar_CameToMill_condition;	
	information = DIA_JaAfFar_CameToMill_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_JaAfFar_CameToMill_condition()
{
	if ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)
		 && (Npc_GetDistToWP(self, PIR_223_DS2P_GuardMill.wp) < 3000)) { //UNFINISHED WP у мельницы, проверить расстояние
		return TRUE;
	};
};
func void DIA_JaAfFar_CameToMill_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_CameToMill_15_01");	//Воте, мы пришли.
	//UNFINISHED добавить условие - охранник далеко от мельницы
	if (!C_NpcIsDown(PIR_223_DS2P_GuardMill))	{	//если охранник на месте
			AI_Output(other,self,"DIA_JaAfFar_CameToMill_18_02");	//Спрячься где-нибудь, пока я буду отвлекать охранника. И не зевай!
		AI_Output(self,other,"DIA_JaAfFar_CameToMill_15_03");	//Моя зевать нет.
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(self,"MILL");
		self.aivar[AIV_NoFightParker] = TRUE;	//спрятался, никто его не видит, он не нападает
		MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_CameTo;
	}
	else	{//охранника уже нет
			AI_Output(other,self,"DIA_JaAfFar_CameToMill_18_04");	//Похоже, сейчас мельницу никто не сторожит.
		AI_Output(self,other,"DIA_JaAfFar_CameToMill_15_05");	//Тогда моя крадати муке, а щлофе смотрети кругом.
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(self,"MILL");
		MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GotIt;
		Npc_SetRefuseTalk(self, 5);
	};
};
//Украл муку -----------------------------------------
instance DIA_JaAfFar_GotIt(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 16;
	condition = DIA_JaAfFar_GotIt_condition;	
	information = DIA_JaAfFar_GotIt_info;
	important = TRUE;
};
func int DIA_JaAfFar_GotIt_condition()
{
	if (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GotIt) {
		return TRUE;
	};
};
func void DIA_JaAfFar_GotIt_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_GotIt_15_01");	//Щлофе молодце! Сделать все как наде! Моя забрать муке.
};
//Ведем домой -----------------------------------------
instance DIA_JaAfFar_GoBack(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 16;
	condition = DIA_JaAfFar_GoBack_condition;	
	information = DIA_JaAfFar_GoBack_info;
	description = "Пойдем назад.";
};
func int DIA_JaAfFar_GoBack_condition()
{
	if (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GotIt) {
		return TRUE;
	};
};
func void DIA_JaAfFar_GoBack_info()
{	
		AI_Output(other,self,"DIA_JaAfFar_GoBack_18_01");	//Пойдем назад.
	AI_Output(self,other,"DIA_JaAfFar_GoBack_15_02");	//Ти-ка. Щлофе вести, моя нести муке. Больше мешок, тяжке. 
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"FOLLOW");
	self.aivar[AIV_NoFightParker] = FALSE;	//больше не прячется
	self.aivar[AIV_EnemyOverride] = TRUE;	//но с мукой не будет сам лезть в драку
	MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GoBack;
};
//Вернулись в деревню гоблинов -----------------------------------------
instance DIA_JaAfFar_CameBack(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 17;
	condition = DIA_JaAfFar_CameBack_condition;	
	information = DIA_JaAfFar_CameBack_info;
	important = TRUE;
};
func int DIA_JaAfFar_CameBack_condition()
{
	if ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoBack)
		 && (Npc_GetDistToWP(self,"") < 5000)) {//UNFINISHED пришли в деревню
		return TRUE;
	};
};
func void DIA_JaAfFar_CameBack_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_CameBack_15_02");	//Мы приходити! Спасибо, щлофе, помочь красть муке. Завтре мы все кушате хлеб.
		AI_Output(other,self,"DIA_JaAfFar_CameBack_18_01");	//Рад за вас.
	B_StartOtherRoutine(self,"START");
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GoBack;
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_QuirkyThief_Success);
	//UNFINISHED забрать муку у гоблина
};

//Не успели за ночь, гоблин вернулся домой -----------------------------------------
instance DIA_JaAfFar_Late(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 18;
	condition = DIA_JaAfFar_Late_condition;	
	information = DIA_JaAfFar_Late_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_JaAfFar_Late_condition()
{
	if (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_Late) {
		return TRUE;
	};
};
func void DIA_JaAfFar_Late_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_CameBack_15_01");	//Щлофе забыть? Крадати надо пока ноще. 
	if (JaAfFar_Waits)	{
		AI_Output(self,other,"DIA_JaAfFar_CameBack_15_01");	//Моя ждати щлофе, но как утро - вернутьси домой.
		JaAfFar_Waits = FALSE;
	};
	AI_Output(self,other,"DIA_JaAfFar_CameBack_15_02");	//Наде идти снова.
	B_StartOtherRoutine(self,"START");
	self.aivar[AIV_NoFightParker] = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GoBack;
	B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_QuirkyThief_Success);
	//UNFINISHED забрать муку у гоблина
};
//Ждать ---------------------
instance DIA_JaAfFar_WaitHere(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;						nr = 20;
	condition = DIA_JaAfFar_WaitHere_condition;	
	information = DIA_JaAfFar_WaitHere_info;
	description = "Жди здесь!";
	permanent = TRUE;
};
func int DIA_JaAfFar_WaitHere_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		&& ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)
		  || (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoBack))) {
		return TRUE;
	};
};
func void B_DSG_JaAfFar_Wait()
{
	B_StartOtherRoutine(self,"WAIT");
	B_SetWaitWP(self, WP_JaAfFar_Wait);
	JaAfFar_Waits = TRUE;
};
func void DIA_JaAfFar_WaitHere_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_WaitHere_15_01");	//Жди здесь!
		AI_Output(self,other,"DIA_JaAfFar_WaitHere_18_02");	//Моя ждати пока ноще.
	AI_StopProcessInfos(self);
	B_DSG_JaAfFar_Wait();
};
//Туда нельзя ---------------------
instance DIA_JaAfFar_TooClose(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;						nr = 21;
	condition = DIA_JaAfFar_TooClose_condition;	
	information = DIA_JaAfFar_TooClose_info;
	important = TRUE;
	permanent = TRUE;
};
func int C_DSG_JaAfFarTooClose()
{
	//UNFINISHED слишком близко к центру деревни
	if (Npc_GetDistToWP(self,"DP_VILL_VILLAGE_01") < 5000)	{
		return FALSE;
	};
	if (Npc_GetDistToWP(self,"DP_VILL_VILLAGE_02") < 5000)	{
		return FALSE;
	};
	//UNFINISHED слишком близко к дракону
	if (Npc_GetDistToWP(self,"") < 5000)	{
		return FALSE;
	};
	return FALSE;
};
func int DIA_JaAfFar_TooClose_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		 && ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)
		  || (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoBack))
		 && C_DSG_JaAfFarTooClose())	{
		return TRUE;
	};
};
func void DIA_JaAfFar_TooClose_info()
{	
		AI_Output(self,other,"DIA_JaAfFar_TooClose_18_01");	//Щлофе идти не туди! Наде идти к деревне мельнице.
	AI_StopProcessInfos(self);
	B_DSG_JaAfFar_Wait();
};

//Подобрать ---------------------
instance DIA_JaAfFar_LetsGoFurther(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;						nr = 22;
	condition = DIA_JaAfFar_LetsGoFurther_condition;	
	information = DIA_JaAfFar_LetsGoFurther_info;
	description = "Идем дальше.";
	permanent = TRUE;
};
func int DIA_JaAfFar_LetsGoFurther_condition(){
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
		&& ((MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)
		  || (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoBack))
		&& JaAfFar_Waits) {
		return TRUE;
	};
};func void DIA_JaAfFar_LetsGoFurther_info()
{	
	AI_Output(other,self,"DIA_JaAfFar_LetsGoFurther_15_01");	//Идем дальше.
		AI_Output(self,other,"DIA_JaAfFar_LetsGoFurther_18_02");	//Ти-ка.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"FOLLOW");
	JaAfFar_Waits = FALSE;
};

//NS - 02/06/2016 ===========
// Приняли в племя
//===========================
instance DIA_JaAfFar_JoinedTribe(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 40;
	condition = DIA_JaAfFar_JoinedTribe_condition;	
	information = DIA_JaAfFar_JoinedTribe_info;
	important = TRUE;
};
func int DIA_JaAfFar_JoinedTribe_condition()
{
	if (Joined_Gobbos_Tribe && Npc_IsInState(self,ZS_Talk)) {
		return TRUE;
	};
};
func void DIA_JaAfFar_JoinedTribe_info()
{	
	AI_Output(self,other,"DIA_JaAfFar_JoinedTribe_18_01");	//Щлофе становице гоблине? Моя не думать, щто такой фозможне.
		AI_Output(other,self,"DIA_JaAfFar_JoinedTribe_15_02");	//А ты меня чему-нибудь в честь этого научишь?
	AI_Output(self,other,"DIA_JaAfFar_JoinedTribe_18_03");	//Ти-ка. Когде говоритешь с другим щлофе, размахивае рукаме. Это его отвлекати, и ты незаметне стащише кошель.
	//Ловкость +1
	B_RaiseAttribute(other,ATR_DEXTERITY,1);
};

//NS - 02/06/2016 ===========
// ОБУЧЕНИЕ
//===========================
instance DIA_JaAfFar_PreTeach(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;				nr = 50;
	condition = DIA_JaAfFar_PreTeach_condition;	
	information = DIA_JaAfFar_PreTeach_info;
	description = "Ты можешь меня чему-нибудь научить?";
};
func int DIA_JaAfFar_PreTeach_condition()
{
	if (MIS_DS2P_QuirkyThief == LOG_SUCCESS) {
		return TRUE;
	};
};
func void DIA_JaAfFar_PreTeach_info()
{	
		AI_Output(other,self,"DIA_JaAfFar_PreTeach_15_01");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_JaAfFar_PreTeach_18_02");	//Ти-ка. Моя можете научите щлофе двигатьсе тихе, луще вороватее и быть ловще.
	TEACH_JaAfFar = TRUE;
	B_DSG_Log_OpenClose(TOPIC_GobboTeacher,LOG_NOTE,-1,"Джа-Аф-Фар научит меня красться, воровать и повысит мою ловкость.");
};

//Обучение в B_DSG_JaAfFar_Teach_Dex_Theft.d
