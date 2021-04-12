instance DIA_JaAfFar_EXIT(DIA_Proto_End)
{
	npc = Gobbo_DS2P_JaAfFar;
};

//////////////////////////// Общие /////////////////////////////

//===================================================
//(начальный)
//Обращается сам
instance DIA_JaAfFar_Hello(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 1;
	condition = DIA_NoCond_cond;
	information = DIA_JaAfFar_Hello_Info;
	important = TRUE;
};
func void DIA_JaAfFar_Hello_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_Hello_19_01");	//Члофе? Ощенно нежиданно фидеть члофе ф дерефня. Ощенно. Джа-Аф-Фар та-ка-мука!
};


//===================================================
//Постоянный
instance DIA_JaAfFar_HowAU(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 2;
	condition = DIA_JaAfFar_HowAU_Cond;
	information = DIA_JaAfFar_HowAU_Info;
	description = "Как дела?";
	permanent = TRUE;
	important = TRUE;
};
//Появление: был диалог «Ты кто?»
func int DIA_JaAfFar_HowAU_Cond()
{
	if (Npc_KnowsInfo(other, DIA_JaAfFar_WhoAU))	{
		return TRUE;
	};
};
func void DIA_JaAfFar_HowAU_Info()
{
		AI_Output(other,self,"DIA_JaAfFar_HowAU_15_01");	//Как дела?
	AI_Output(self,other,"DIA_JaAfFar_HowAU_19_02");	//Луще фсе!
};

//===================================================
//(ГГ приняли в племя)
//Обращается сам
instance DIA_JaAfFar_BecameGobbo(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 3;
	condition = DIA_JaAfFar_BecameGobbo_Cond;
	information = DIA_JaAfFar_BecameGobbo_Info;
	important = TRUE;
};
//Появление: ГГ приняли в племя и был диалог «Ты кто?»
func int DIA_JaAfFar_BecameGobbo_Cond()
{
	if (Gobbos_Attitude == Gobbos_Attitude_Gobbo)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_BecameGobbo_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_BecameGobbo_19_00");	//Щлофе становице гоблине? Не думая моя, щто таке може быти.
		AI_Output(other,self,"DIA_JaAfFar_BecameGobbo_15_01");	//А ты меня чему-нибудь в честь этого научишь?
	AI_Output(self,other,"DIA_JaAfFar_BecameGobbo_19_02");	//Ти-ка. Когде гофорище с другий щлофе, махае рукаме. Так его отвлекае, и ты легко тащи кошеля.
	//Ловкость +1
	B_RaiseAttribute(other, ATR_DEXTERITY, 1);
};

//===================================================
instance DIA_JaAfFar_WhoAU(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 4;
	condition = DIA_NoCond_cond;
	information = DIA_JaAfFar_WhoAU_Info;
	description = "Ты кто?";
};
func void DIA_JaAfFar_WhoAU_Info()
{
		AI_Output(other,self,"DIA_JaAfFar_WhoAU_15_01");	//Ты кто?
	AI_Output(self,other,"DIA_JaAfFar_WhoAU_19_02");	//Мой зфати Джа-Аф-Фар, лущще фор гоблина. Мой моще украдать щто угодни.
	//Выбор варианта (только один):
	Info_ClearChoices(DIA_JaAfFar_WhoAU);
	Info_AddChoice(DIA_JaAfFar_WhoAU, "Понятно.", DIA_JaAfFar_WhoAU_ISee);
	//(если есть хотя бы 20 золотых или какие-то золотые вещи)
	if (C_CanStealWealth_FromHero(other)) {
		Info_AddChoice(DIA_JaAfFar_WhoAU, "Прямо уж лучший?", DIA_JaAfFar_ReallyBest);
	};
};

//Понятно.
func void DIA_JaAfFar_WhoAU_ISee() {
	Info_ClearChoices(DIA_JaAfFar_WhoAU);
	AI_Output(other,self,"DIA_JaAfFar_WhoAU_Isee_15_01");	//Понятно.
};

//////////////////////////// Квест: Ушлый вор //////////////////////////// 

var int DIA_JaAfFar_ReallyBest_Once;
instance DIA_JaAfFar_ReallyBest(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 10;
	condition = DIA_NoCond_cond;
	information = DIA_JaAfFar_ReallyBest_Info;
	description = "Прямо уж лучший?";
};
//Появление: если из-за нехватки золота не выбрали второй вариант в диалоге, то можно спросить потом
//Есть, что украсть и еще не крали
func int DIA_JaAfFar_ReallyBest_Cond()
{
	if (C_CanStealWealth_FromHero(other) && !DIA_JaAfFar_ReallyBest_Once) {
		return TRUE;
	};
};
func void DIA_JaAfFar_ReallyBest_Info()
{
	Info_ClearChoices(DIA_JaAfFar_WhoAU);
	DIA_JaAfFar_ReallyBest_Once = TRUE;
		AI_Output(other,self,"DIA_JaAfFar_What_15_01");	//Прямо уж лучший?
	AI_Output(self,other,"DIA_JaAfFar_What_19_02");	//Ти-ка.
	//поворачивается в сторону, показывает рукой
	AI_TurnRight(self);
	AI_Output(self,other,"DIA_JaAfFar_What_19_03");	//Я-я-яй! Щлофе, смотри скоро туди!
	//поворачиваемся туда же
	AI_TurnLeft(self);
		AI_Output(other,self,"DIA_JaAfFar_What_15_04");	//Что там?
	//Джа-Аф-Фар крадет золото (не больше половины) или золотой предмет из инвентаря ГГ
	B_TrySteal_FromHero(self, other);
	//поворачиваются назад
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_Output(self,other,"DIA_JaAfFar_What_19_05");	//Показатьси.
	//Запись в дневнике. Квест «Ушлый вор»: Начало
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Start);
	MIS_DS2P_QuirkyThief_Round = 1;
};

//===================================================
instance DIA_JaAfFar_BruteForce(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 11;
	condition = DIA_JaAfFar_BruteForce_Cond;
	information = DIA_JaAfFar_BruteForce_Info;
	description = "Эй, жулик, верни мое золото! (припугнуть)";
	permanent = TRUE;
};
//Появление: Джа-Аф-Фар украл что-то у ГГ
func int DIA_JaAfFar_BruteForce_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round % 2 == 1)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_BruteForce_Info()
{
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_01");	//Эй, жулик, верни мое золото!
	AI_Output(self,other,"DIA_JaAfFar_BruteForce_19_02");	//Щито? Джа-Аф-Фар не понимать щлофе. Щлофе гофарить медлене. Утари-ша-га-чи-за!
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_03");	//Маленький воришка! Не притворяйся, что не понимаешь меня!
	AI_Output(self,other,"DIA_JaAfFar_BruteForce_19_04");	//(притворно) Ни-та, моя не понимайть, щто гофарить щлофе.
	//ГГ достает оружие
	AI_DrawWeapon(other);
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_05");	//Ну все, маленький паршивец. Если я не увижу свое золото, то тебе станет очень больно, обещаю.
	AI_Output(self,other,"DIA_JaAfFar_BruteForce_19_06");	//Я-я-яй! Воть, берить, щлофе берить деньга! Не бити Джа-Аф-Фар.
	//Дает 80% от украденного, либо прдемет
	if (StolenItem == ItMi_Gold) {
		var int firstPortion; firstPortion = StolenGoldAmount / 10 * 8;
		B_GiveInvItems(self, other, ItMi_Gold, firstPortion);
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_07");	//Эй, тут не все.
		//Дает оставшееся
		B_GiveInvItems(self, other, ItMi_Gold, StolenGoldAmount - firstPortion);
			AI_Output(self,other,"DIA_JaAfFar_BruteForce_19_08");	//Фсе, это фсе. У Джа-Аф-Фар неть больше.
		AI_Output(other,self,"DIA_JaAfFar_BruteForce_15_09");	//Так-то.
	}
	else {
		B_GiveInvItems(self, other, StolenItem, 1);
	};
	//ГГ убирает оружие
	AI_RemoveWeapon(other);
	//Запись в дневнике. Квест «Ушлый вор»: Грубая сила
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Failed,TOPIC_DS2P_QuirkyThief_BruteForce);
	StolenItem = 0;
	StolenGoldAmount = 0;
	MIS_DS2P_QuirkyThief_Round = -1000;
	//разговор обрывается
	AI_StopProcessInfos(self);
};

//*===================================================
instance DIA_JaAfFar_Revenge1(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 12;
	condition = DIA_JaAfFar_Revenge1_Cond;
	information = DIA_JaAfFar_Revenge1_Info;
	description = "(отвлечь)";
	permanent = TRUE;
};
//Появление: Джа-Аф-Фар украл первый раз
func int DIA_JaAfFar_Revenge1_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 1)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Revenge1_Info()
{
	//Условие: есть навык карманной кражи и ловкость >= 30
	if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_NONE) {
		AI_PrintS_Ext(other, "Я не умею красть!", COL_Red);
		return;
	};
	if (other.attribute[ATR_DEXTERITY] < 30) {
		AI_PrintS_Ext(other, "Недостаточно ловкости", COL_Red);
		return;
	};
	AI_Output(other,self,"DIA_JaAfFar_Revenge1_15_01");	//Слушай, а что это за зверь такой, которого поймали ваши охотники? 
	//ГГ указывает рукой в сторону, на тушку падальщика
	AI_PointAt(other, "DP_FOREST_SWAMPTEMPLE_ROOM05_02_CAMPFIRE");
	AI_Output(other,self,"DIA_JaAfFar_Revenge1_15_02");	//Я таких раньше не видел.
	AI_Output(self,other,"XXX");	//
	AI_TurnToWP(self, "DP_FOREST_SWAMPTEMPLE_ROOM05_02_CAMPFIRE");
	AI_StopPointAt(other);
		AI_Output(self,other,"DIA_JaAfFar_Revenge1_19_03");	//Это больше птице. Ести щито мертво.
	AI_TurnToNpc(self, other);
	AI_Output(other,self,"DIA_JaAfFar_Revenge1_15_04");	//А, падальщик, не узнал сразу - старею видать.
	//ГГ забирает свое золото +10 монет
	if (StolenItem == ItMi_Gold) {
		StolenGoldAmount += 10;
		B_GiveInvItems(self, other, ItMi_Gold, StolenGoldAmount);
	}
	else {
		B_GiveInvItems(self, other, StolenItem, 1);
		B_GiveInvItems(self, other, ItMi_Gold, 10);
		StolenGoldAmount = 10;
	};
	//Запись в дневнике. Квест «Ушлый вор»: Реванш 1
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Revenge1);
	//разговор обрывается
	AI_StopProcessInfos(self);
	MIS_DS2P_QuirkyThief_Round = 2;
};

//===================================================
//Обращается сам
instance DIA_JaAfFar_Round2(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 13;
	condition = DIA_JaAfFar_Round2_Cond;
	information = DIA_JaAfFar_Round2_Info;
	description = "*(раунд 2)";
	important = TRUE;
};
//Появление: ГГ взял реванш 1 раз
func int DIA_JaAfFar_Round2_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 2)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Round2_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_Round2_19_01");	//Стой, щлофе. Моя к тфой ести фопроси.
		AI_Output(other,self,"DIA_JaAfFar_Round2_15_02");	//Задавай.
	AI_Output(self,other,"DIA_JaAfFar_Round2_19_03");	//Щлофе, бывати далека. Моя хоти знафть: ести больше земля за больше фода?
		AI_Output(other,self,"DIA_JaAfFar_Round2_15_04");	//Есть ли другие земли, кроме вашего острова? Конечно. Их очень много. На самом деле...
	//Джа-Аф-Фар ворует еще больше золота
	B_TrySteal_FromHero(self, other);
	AI_Output(self,other,"DIA_JaAfFar_Round2_19_05");	//Спасибо, щлофе. Моя знайть фсе, что хотейть.
	//Запись в дневнике. Квест «Ушлый вор»: Раунд 2
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Round2);
	MIS_DS2P_QuirkyThief_Round = 3;
};

//===================================================
instance DIA_JaAfFar_Revenge2(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 14;
	condition = DIA_JaAfFar_Revenge2_Cond;
	information = DIA_JaAfFar_Revenge2_Info;
	description = "(отвлечь еще раз)";
	permanent = TRUE;
};
//Появление: Джа-Аф-Фар украл второй раз
func int DIA_JaAfFar_Revenge2_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 3)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Revenge2_Info()
{
	//Условие: есть навык карманной кражи и ловкость >= 50
	if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_NONE) {
		AI_PrintS_Ext(other, "Я не умею красть!", COL_Red);
		return;
	};
	if (other.attribute[ATR_DEXTERITY] < 50) {
		AI_PrintS_Ext(other, "Недостаточно ловкости", COL_Red);
		return;
	};
		AI_Output(other,self,"DIA_JaAfFar_Revenge2_15_01");	//А почему я не вижу у вас в деревне гоблиш?
	AI_Output(self,other,"DIA_JaAfFar_Revenge2_19_02");	//(непонимающе) Ф дерефня все кроме щлофе - гоблинша.
		AI_Output(other,self,"DIA_JaAfFar_Revenge2_15_03");	//Я имею в виду женщин-гоблинов.
	AI_Output(self,other,"DIA_JaAfFar_Revenge2_19_04");	//Потому щти жена гоблине нельзе фидети чужак.
	//ГГ ворует свое +15 золотых
	if (StolenItem == ItMi_Gold) {
		StolenGoldAmount += 15;
		B_GiveInvItems(self, other, ItMi_Gold, StolenGoldAmount);
	}
	else {
		B_GiveInvItems(self, other, StolenItem, 1);
		B_GiveInvItems(self, other, ItMi_Gold, 25);
		StolenGoldAmount = 25;
	};
		AI_Output(other,self,"DIA_JaAfFar_Revenge2_15_05");	//Ясно.
	//Запись в дневнике. Квест «Ушлый вор»: Реванш 2
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Revenge2);
	MIS_DS2P_QuirkyThief_Round = 4;
};


//===================================================
//Обращается сам
instance DIA_JaAfFar_Round3(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 15;
	condition = DIA_JaAfFar_Round3_Cond;
	information = DIA_JaAfFar_Round3_Info;
	description = "*(раунд 3)";
	important = TRUE;
};
//Появление: ГГ взял реванш второй раз
func int DIA_JaAfFar_Round3_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 4)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Round3_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_Round3_19_01");	//Щлофе, щлофе стой. Джа-Аф-Фар хотейть предложить щлофе карта.
		AI_Output(other,self,"DIA_JaAfFar_Round3_15_02");	//Какую еще карту?
	AI_Output(self,other,"DIA_JaAfFar_Round3_19_03");	//Старый карте. Ощенно старый. Там еси путя до сокровище. Щлофе идти карте, копай сокровище.
		AI_Output(other,self,"DIA_JaAfFar_Round3_15_04");	//Покажи-ка ты, дружок, сначала мне эту карту.
	//анимация, как будто ищет
	AI_Output(self,other,"XXX");	//
	AI_PlayAni(self, "T_PERCEPTION");
	//ворует еще больше золота
	B_TrySteal_FromHero(self, other);
	AI_Output(self,other,"DIA_JaAfFar_Round3_19_05");	//(ищет) Ай-яй! Моя оставите карта доме. Щлофе приходи завтре.
	//Запись в дневнике. Квест «Ушлый вор»: Раунд 3
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Round3);
	//разговор обрывается
	AI_StopProcessInfos(self);
	MIS_DS2P_QuirkyThief_Round = 5;
};


//===================================================
instance DIA_JaAfFar_Revenge3(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 16;
	condition = DIA_JaAfFar_Revenge3_Cond;
	information = DIA_JaAfFar_Revenge3_Info;
	description = "(опять отвлечь)";
	permanent = TRUE;
};
//Появление: Джа-Аф-Фар украл третий раз
func int DIA_JaAfFar_Revenge3_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 5)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Revenge3_Info()
{
	//Условие: есть навык карманной кражи и ловкость >= 70
	if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_NONE) {
		AI_PrintS_Ext(other, "Я не умею красть!", COL_Red);
		return;
	};
	if (other.attribute[ATR_DEXTERITY] < 70) {
		AI_PrintS_Ext(other, "Недостаточно ловкости", COL_Red);
		return;
	};
	AI_Output(other,self,"DIA_JaAfFar_Revenge3_15_01");	//Слушай, а тебе кинжал не нужен? У меня есть один отличный!
	AI_Output(other,self,"DIA_JaAfFar_Revenge3_15_02");	//Ты бы видел, как он сверкает на солнце! Да ты такого на всем острове не сыщешь.
	AI_Output(self,other,"DIA_JaAfFar_Revenge3_19_03");	//Ньеть. Джа-Аф-Фар не нужне кинжале.
	//ГГ ворует свое золото + 20 золотых
	//Запись в дневнике. Квест «Ушлый вор»: Реванш 3
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Revenge3);
	MIS_DS2P_QuirkyThief_Round = 6;
};


//===================================================
//Обращается сам
instance DIA_JaAfFar_TheftFinal(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 17;
	condition = DIA_JaAfFar_TheftFinal_Cond;
	information = DIA_JaAfFar_TheftFinal_Info;
	description = "*(Стой, щлофе!)";
	important = TRUE;
};
//Появление: ГГ взял реванш в 3 раз
func int DIA_JaAfFar_TheftFinal_Cond()
{
	if (MIS_DS2P_QuirkyThief_Round == 6)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_TheftFinal_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_01");	//Стой, щлофе.
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_15_02");	//А тебе еще не надоело пытаться меня обокрасть, а?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_03");	//Ньеть-ньеть. Моя хотьеть гофорите с щлофе.
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_04");	//Моя хотети сказате, щто щлофе ощенно хороше форе, даже луще Джа-Аф-Фар.
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_05");	//Щлофе може помоще моя?
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_15_06");	//Помочь? В чем?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_07");	//Моя хотьеть украдате муке у щлофе ф дерефне на береге.
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_15_08");	//А от меня что требуется? Неужто сам не можешь стянуть мешок с мукой?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_09");	//Моя може, но муке охраняй злой щлофе. Моя одне разе крадати и еле смочи бежати.
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_19_10");	//Твоя отфлекай злой щлофе, моя бери муке. Ка-го та?
	//Выбор варианта (только один):
	Info_ClearChoices(DIA_JaAfFar_TheftFinal);
	Info_AddChoice(DIA_JaAfFar_TheftFinal,"Нет уж, у меня других дел полно.",DIA_JaAfFar_TheftFinal_No);
	//(если охранник мельницы убит)
	if (Npc_IsDead(PIR_223_DS2P_GuardMill)) {
		Info_AddChoice(DIA_JaAfFar_TheftFinal,"Охраны на мельнице больше нет.",DIA_JaAfFar_NoGuard_Info);
	};
	Info_AddChoice(DIA_JaAfFar_TheftFinal,"Хорошо, я помогу тебе.",DIA_JaAfFar_TheftFinal_Yes);
	MIS_DS2P_QuirkyThief_Round = -1;
};


//Нет уж, у меня других дел полно.
func void DIA_JaAfFar_TheftFinal_No()
{
	AI_Output(other,self,"DIA_JaAfFar_TheftFinal_No_15_01");	//Нет уж, у меня других дел полно.
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_No_19_02");	//Ощенно пещально, щлофе. Ощенно.
	//Запись в дневнике. Квест «Ушлый вор»: Отказались помочь
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Refused);
};

//Хорошо, я помогу тебе.
func void DIA_JaAfFar_TheftFinal_Yes()
{
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_Yes_15_01");	//Хорошо. Я помогу тебе. 
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_Yes_15_02");	//Мне надо просто отвлечь охранника мельницы?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_Yes_19_03");	//Ти-ка. Тфоя наде отвлекай злой щлофе.
		AI_Output(other,self,"DIA_JaAfFar_TheftFinal_Yes_15_04");	//Хорошо. Когда выступаем?
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_Yes_19_05");	//Ноще. Гоблине опасне ходити днем. 
	AI_Output(self,other,"DIA_JaAfFar_TheftFinal_Yes_19_06");	//Тфоя приходите ноще к мельниса, моя ждати в лесе за зади.
	//Запись в дневнике. Квест «Ушлый вор»: Согласились помочь
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_Agreed);
	//Джа-Аф-Фар будет по ночам ждать за мельницей
	B_StartOtherRoutine(self, "MILL");
	MIS_DS2P_QuirkyThief_GuardMill = TRUE;
};

//===================================================
instance DIA_JaAfFar_NoGuard(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 18;
	condition = DIA_JaAfFar_NoGuard_Cond;
	information = DIA_JaAfFar_NoGuard_Info;
	description = "Охраны на мельнице больше нет.";
};
//Появление: Джа-Аф-Фар попросил помощи, охранник на мельнице убит
//Условие: ГГ пустили в деревню, квест «Ушлый вор» активен
func int DIA_JaAfFar_NoGuard_Cond()
{
	if (MIS_DS2P_QuirkyThief == LOG_Running && MIS_DS2P_QuirkyThief_GuardMill && Npc_IsDead(PIR_223_DS2P_GuardMill))	{
		return TRUE;
	};
};
func void DIA_JaAfFar_NoGuard_Info()
{
	Info_ClearChoices(DIA_JaAfFar_TheftFinal);
	AI_Output(other,self,"DIA_JaAfFar_NoGuard_15_01");	//Охраны на мельнице больше нет.
	AI_Output(self,other,"DIA_JaAfFar_NoGuard_19_02");	//Щито? Ньеть охрана?
	AI_Output(other,self,"DIA_JaAfFar_NoGuard_15_03");	//Да, можешь спокойно забирать муку. 
	AI_Output(self,other,"DIA_JaAfFar_NoGuard_19_04");	//Спасибо, щлофе!
	AI_Output(self,other,"DIA_JaAfFar_NoGuard_19_05");	//Джа-Аф-Фар забирате мешок с муке и относите в деревне. Теперя мы все кушате хлеб!
	//Запись в дневнике. Квест «Ушлый вор»: Охраны нет
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_NoGuard);
	//Джа-Аф-Фар больше не будет по ночам ждать за мельницей
	B_StartOtherRoutine(self, "START");
	MIS_DS2P_QuirkyThief_GuardMill = FALSE;
};


//===================================================
//При попытке заговорить, постоянный
instance DIA_JaAfFar_KeepSilence(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 19;
	condition = DIA_JaAfFar_KeepSilence_Cond;
	information = DIA_JaAfFar_KeepSilence_Info;
	description = "*(ждет у мельницы)";
	permanent = TRUE;
	important = TRUE;
};
//Появление: договорились о краже муки
//Условие: ночью, пока Джа-Аф-Фар ждет за мельцей
func int DIA_JaAfFar_KeepSilence_Cond()
{
	if (MIS_DS2P_QuirkyThief == LOG_Running && MIS_DS2P_QuirkyThief_GuardMill && Wld_IsTime(22,0,8,0) && DIA_WhenAsked_cond())	
	{
		return TRUE;
	};
};
func void DIA_JaAfFar_KeepSilence_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_KeepSilence_19_01");	//Щлофе, тищще! Отфлеки охрана, а моя крадати муке.
	//Разговор завершается
	AI_StopProcessInfos(self);
};


//===================================================
//Обращается сам
instance DIA_JaAfFar_MillSuccess(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 21;
	condition = DIA_JaAfFar_MillSuccess_Cond;
	information = DIA_JaAfFar_MillSuccess_Info;
	description = "*(успешно украли муку)";
	important = TRUE;
};
//Появление: отвлекли охранника любым способом
func int DIA_JaAfFar_MillSuccess_Cond()
{
	if (MIS_DS2P_QuirkyThief == LOG_Running && MIS_DS2P_QuirkyThief_GuardMill && MIS_DS2P_QuirkyThief_GuardMill_Down)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_MillSuccess_Info()
{
	AI_Output(self,other,"DIA_JaAfFar_MillSuccess_19_01");	//Щлофе молодеце. Сделате все хороше.
	AI_Output(other,self,"DIA_JaAfFar_MillSuccess_15_02");	//Значит, у тебя получилось стащить мешок?
	AI_Output(self,other,"DIA_JaAfFar_MillSuccess_19_03");	//(согласно) Ти-ка.
	AI_Output(self,other,"DIA_JaAfFar_MillSuccess_19_04");	//Джа-Аф-Фар забирате мешок с муке и относите в деревне. Теперя мы все кушате хлеб!
	//Запись в дневнике. Квест «Ушлый вор»: Завершение
	B_ds_LogEntry(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_QuirkyThief_Success);
	//Джа-Аф-Фар больше не будет по ночам ждать за мельницей
	B_StartOtherRoutine(self, "START");
	MIS_DS2P_QuirkyThief_GuardMill = FALSE;
};


//////////////////////////// Обучение ////////////////////////////
//Учит краже, взлому замков, подкрадываию и ловкости
//Условия: выполнен квест «Ушлый вор»
const int DIA_JaAfFar_Teach_Dex_Max = 150;

//===================================================
instance DIA_JaAfFar_Preteach(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 50;
	condition = DIA_JaAfFar_Preteach_Cond;
	information = DIA_JaAfFar_Preteach_Info;
	description = "Ты можешь меня чему-нибудь научить?";
};
//Появление: успешно завершили квест «Ушлый вор»
func int DIA_JaAfFar_Preteach_Cond()
{
	if (MIS_DS2P_QuirkyThief == LOG_SUCCESS)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Preteach_Info()
{
	AI_Output(other,self,"DIA_JaAfFar_Preteach_15_01");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_JaAfFar_Preteach_19_02");	//Ти-ка. Моя можете научите щлофе двигатьсе тихе, быти луще вороватее и ловще.
	//Запись в дневнике «Учителя в деревне гоблинов»: Джа-Аф-Фар
	B_LogNote(TOPIC_GobboVillage,TOPIC_GobboVillage_Teach_JaAfFar);
	Gobbo_DS2P_JaAfFar_Teach = TRUE;
};



//===================================================
//(постоянный)
instance DIA_JaAfFar_Teach(C_Info)
{
	npc = Gobbo_DS2P_JaAfFar;								nr = 51;
	condition = DIA_JaAfFar_Teach_Cond;
	information = DIA_JaAfFar_Teach_Info;
	description = "Научи меня.";
	permanent = TRUE;
};
//Условие: Джа-Аф-Фар согласился учить
func int DIA_JaAfFar_Teach_Cond()
{
	if (Gobbo_DS2P_JaAfFar_Teach)	{
		return TRUE;
	};
};
func void DIA_JaAfFar_Teach_Menu()
{
	Info_ClearChoices(DIA_JaAfFar_Teach);
	if (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) && Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) > 1 && Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK)
		&& other.aivar[REAL_DEXTERITY] < DIA_JaAfFar_Teach_Dex_Max) {
		AI_Output(self,other,"DIA_JaAfFar_Teach_19_02");	//Твоя теперя знати все що знати Джа-Аф-Фар. Твоя стань лющий фор!
		Gobbo_DS2P_JaAfFar_Teach = FALSE;
		return;
	};
	Info_AddChoice(DIA_JaAfFar_Teach,Dialog_Back,DIA_JaAfFar_Teach_Back);
	//(еще не выучен)
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) {
		Info_AddChoice(DIA_JaAfFar_Teach,
			b_Ds_buildString_TeachPayment_Talent(other,"Научи меня красться.",NPC_TALENT_SNEAK,1,-1),
			DIA_JaAfFar_Teach_Sneak);
	};
	//(еще не выучен)
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) {
		Info_AddChoice(DIA_JaAfFar_Teach,
			b_Ds_buildString_TeachPayment_Talent(other,"Научи меня продвинутой карманной краже.",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_SECOND,-1),
			DIA_JaAfFar_Teach_PickPocket2);
	};
	//(еще не выучен)
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE) {
		Info_AddChoice(DIA_JaAfFar_Teach,
			b_Ds_buildString_TeachPayment_Talent(other,"Научи меня вскрывать замки.",NPC_TALENT_PICKLOCK,1,-1),
			DIA_JaAfFar_Teach_Picklock);
	};
	//до 150 = DIA_JaAfFar_Teach_Dex_Max
	Info_AddChoice(DIA_JaAfFar_Teach,"Повысь мою ловкость.",DIA_JaAfFar_Teach_Dex_Menu);
};
func void DIA_JaAfFar_Teach_Dex_Menu()
{
	Info_ClearChoices(DIA_JaAfFar_Teach);
	Info_AddChoice(DIA_JaAfFar_Teach,Dialog_Back,DIA_JaAfFar_Teach_Menu);
	Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,1,-1),DIA_JaAfFar_Teach_DEX_1);
	Info_AddChoice(DIA_JaAfFar_Teach,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,5,-1),DIA_JaAfFar_Teach_DEX_5);
};
func void DIA_JaAfFar_Teach_Back()
{
	Info_ClearChoices(DIA_JaAfFar_Teach);
};
//----------------------
func void DIA_JaAfFar_Teach_Info()
{
	AI_Output(other,self,"DIA_JaAfFar_Teach_15_01");	//Научи меня.
		AI_Output(self,other,"DIA_JaAfFar_Teach_19_03");	//Щито ущити?
	DIA_JaAfFar_Teach_Menu();
};
//----------------------
func void DIA_JaAfFar_Teach_NoGold()
{
	AI_Output(self,other,"DIA_JaAfFar_NoGold_19_00");	//Щлофе давай Джа-Аф-Фар золото - Джа-Аф-Фар учи щлофе.
};
func void DIA_JaAfFar_Teach_Attribute(var int attr, var int amount)
{
	var int x; x = b_ds_GetTeachAtrPaymentAmount(other,attr,amount);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachAttributePoints(self,other,attr,amount,DIA_JaAfFar_Teach_Dex_Max))
		{
			B_GiveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();			
		};
	};
	DIA_JaAfFar_Teach_Dex_Menu();
};
func void DIA_JaAfFar_Teach_DEX_1()
{
	DIA_JaAfFar_Teach_Attribute(ATR_DEXTERITY,1);
};
func void DIA_JaAfFar_Teach_DEX_5()
{
	DIA_JaAfFar_Teach_Attribute(ATR_DEXTERITY,5);
};
//----------------------
func void DIA_JaAfFar_Teach_Talent(var int talent, var int level)
{
	var int x;	x = b_ds_GetTeachPaymentAmount(other,talent,level);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{
		if(B_TeachThiefTalent(self,other,talent,level))
		{
			B_GiveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			B_DS_ClearGold();
		};
	}
	else
	{
		DIA_JaAfFar_Teach_NoGold();
	};
	DIA_JaAfFar_Teach_Menu();
};
func void DIA_JaAfFar_Teach_Sneak()
{
	DIA_JaAfFar_Teach_Talent(NPC_TALENT_SNEAK, 1);
};
func void DIA_JaAfFar_Teach_PickPocket2()
{
	DIA_JaAfFar_Teach_Talent(NPC_TALENT_PICKPOCKET, 2);
};
func void DIA_JaAfFar_Teach_Picklock()
{
	DIA_JaAfFar_Teach_Talent(NPC_TALENT_PICKLOCK, 1);
};

