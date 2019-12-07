instance DIA_Karah_EXIT(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Karah_EXIT_condition;	
	information = DIA_Karah_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Karah_EXIT_condition(){	return TRUE;};
func void DIA_Karah_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 10/07/2013 ===================================
//  Стартовые 
//===================================================
instance DIA_Karah_Start(C_Info)	//TESTED
{
	npc = PIR_204_DS2P_Karah;
	nr = 0;
	condition = DIA_Karah_Start_condition;	
	information = DIA_Karah_Start_info;
	description = "Я смотрю, ты отлично управляешься с арбалетом.";
};
func int DIA_Karah_Start_condition()
{
	If((Npc_WasInState(self,ZS_DSG_Practice_RangedWeapon) && (self.aivar[AIV_LASTTARGET] != 0)))
	{	return TRUE;};
};
func void DIA_Karah_Start_info()
{
	//UNFINISHED
	var C_NPC tgt;	tgt = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	B_CreateAmmo(self);
	if(!Npc_HasReadiedRangedWeapon(self))
	{
		AI_WhirlAround(self, tgt);
		AI_ReadyRangedWeapon(self);
		AI_AimAt(self, tgt);
	};
	AI_StopLookAt(self);
	
	AI_Output(other,self,"DIA_Karah_Start_15_00");	//Я смотрю, ты отлично управляешься с арбалетом.
		AI_Output(self,other,"DIA_Karah_Start_13_01");	//(молчит)
	//Выстрел в мишень
		AI_ShootAt(self, tgt);
	AI_Output(other,self,"DIA_Karah_Start_15_02");	//Может быть покажешь пару приемов?
		AI_Output(self,other,"DIA_Karah_Start_13_03");	//(молчит)
	//Выстрел в мишень
		AI_ShootAt(self, tgt);
	AI_Output(other,self,"DIA_Karah_Start_15_04");	//Эй, ты меня слышишь?
	//Опускает арбалет и поворачивает голову к ГГ
		AI_StopAim(self);
		AI_TurnToNpc(self,other);
		AI_LookAtNpc(self,other);
	
		AI_Output(self,other,"DIA_Karah_Start_13_05");	//Тебе разве никто не говорил, что подходить к человеку, у которого в руках заряженный арбалет, очень опасно?
		AI_Output(self,other,"DIA_Karah_Start_13_06");	//С такого расстояния я могу пробить тебе грудную клетку, и никакая броня тебя не спасет.
	AI_Output(other,self,"DIA_Karah_Start_15_07");	//Я хочу поговорить с тобой.
		AI_Output(self,other,"DIA_Karah_Start_13_08");	//Ну хорошо, давай поговорим.
	//Убирает арбалет
		/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
		AI_Output(self,other,"DIA_Karah_Start_13_09");	//Ты уже все равно лишил меня требуемой концентрации, а без этого тренировка превращается в бессмысленный перевод болтов.

};

//NS - 10/07/2013 -----------------------------------
// "Как тебя зовут?", если не тренируется, или уже прервали его		nr = 1;	
instance DIA_Karah_WhatsUrName(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_WhatsUrName_condition;	
	information = DIA_Karah_WhatsUrName_info;
	description = "Как тебя зовут?";
};
func int DIA_Karah_WhatsUrName_condition()
{
	If(!DIA_Karah_Start_condition() || Npc_KnowsInfo(other,DIA_Karah_Start))
	{	return TRUE;};
};
func void DIA_Karah_WhatsUrName_info()
{
	AI_Output(other,self,"DIA_Karah_WhatsUrName_15_00");	//Как тебя зовут?
		AI_Output(self,other,"DIA_Karah_WhatsUrName_13_01");	//Можешь звать меня Карахом.
	// если еще не разговаривали
	if (!Npc_KnowsInfo(other,DIA_Karah_Start))
	{
		AI_Output(other,self,"DIA_Karah_WhatsUrName_15_02");	//Я бы хотел поговорить с тобой.
			AI_Output(self,other,"DIA_Karah_WhatsUrName_13_03");	//Говори, все равно в этой деревне кроме как тренироваться делать нечего, а я за сегодня уже порядком устал.
	};
};


//===================================================
//  По квесту "Зачарованные болты"
//===================================================
//NS - 10/07/2013 -----------------------------------
// "Ты можешь дать мне пару уроков?", если говорили на тренировке	nr = 10;	
instance DIA_Karah_CanUTeachMe(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 10;
	condition = DIA_Karah_CanUTeachMe_condition;	
	information = DIA_Karah_CanUTeachMe_info;
	description = "Ты можешь дать мне пару уроков?";
};
func int DIA_Karah_CanUTeachMe_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_Start) && Npc_KnowsInfo(self,DIA_Karah_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Karah_CanUTeachMe_info()
{
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_00");	//Ты можешь дать мне пару уроков?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_01");	//А зачем мне это? Давая тебе уроки, тем самым я повышаю мастерство своего потенциального врага, ведь так?!
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_02");	//Я не из тех людей, кто ищет соперников посильнее, чтобы себе что-то доказать. Это глупость, которая стала причиной смерти не одного мастера.
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_03");	//Лучше потратить время на повышение своих навыков!
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_04");	//Может быть есть то, что заинтересует тебя? 
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_05");	//(задумался) Хм... Может и есть... Да, это будет вполне адекватной сделкой...
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_06");	//О чем ты?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_07");	//Чтобы побеждать в бою нужно три вещи: мастерство, хороший арбалет и зачарованные магией болты.
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_08");	//Мастерством я обладаю, арбалет вполне неплох, а вот магических болтов у меня нет.
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_09");	//Если ты сумеешь принести мне два десятка рудных болтов, я покажу тебя пару приемов.
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_10");	//И где мне их взять?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_11");	//Не взять, а изготовить! Сходи к Джозефу и попроси их изготовить.
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_12");	//А почему ты сам этого до сих пор не сделал?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_13");	//Мы с Джозефом немного не поладили. Скажем так, он после одного случая не хочет со мной разговаривать.
	AI_Output(other,self,"DIA_Karah_CanUTeachMe_15_14");	//Какого случая?
		AI_Output(self,other,"DIA_Karah_CanUTeachMe_13_15");	//Я не хочу об этом говорить и тебе не советую упоминать мое имя с ним в беседе.

	//Запись в дневнике "Зачарованые болты" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_Running,TOPIC_DS2P_CharmedBolts_Start);
};


//===================================================
//  По квесту "Внук рыбака"
//===================================================
//NS - 10/07/2013 -----------------------------------
// "Я знаю, что ты носишь еду Гарону." (+опыт)	nr = 20;	
instance DIA_Karah_IKnowAboutGaron(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 20;
	condition = DIA_Karah_IKnowAboutGaron_condition;	
	information = DIA_Karah_IKnowAboutGaron_info;
	description = "Я знаю, что ты носишь еду Гарону.";
};
func int DIA_Karah_IKnowAboutGaron_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_WhatsUrName) && Npc_KnowsInfo(self,DIA_Maria_AboutGaron))
	{	return TRUE;};
};
func void DIA_Karah_IKnowAboutGaron_info()
{
	AI_Output(other,self,"DIA_Karah_IKnowAboutGaron_15_00");	//Я знаю, что ты носишь еду Гарону.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_GrandsonOfFisherman_AskedKarah);
		AI_Output(self,other,"DIA_Karah_IKnowAboutGaron_13_01");	//(пристально смотрит)
		AI_Wait(self,0.5);
		AI_Output(self,other,"DIA_Karah_IKnowAboutGaron_13_02");	//Вот черт!
	AI_Output(other,self,"DIA_Karah_IKnowAboutGaron_15_03");	//Что случилось?
		AI_Output(self,other,"DIA_Karah_IKnowAboutGaron_13_04");	//Я совсем забыл про этого малого. Он, скорее всего, там уже ноги протянул. Черт, мне Гард голову оторвет!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 5);
	//Карах бежит к подвалу, открывает дверь (до этого момента дверь закрыта)
	AI_SetWalkMode(self,NPC_RUN);
	Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
	// UNFINISHED вписать WP, октрыть дверь
	AI_GotoWP(self,"");
};

//NS - 10/07/2013 -----------------------------------
// Карах сам обращается к ГГ, после того как не нашел Гарона	important	
instance DIA_Karah_WhereIsGaron(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 0;
	condition = DIA_Karah_WhereIsGaron_condition;	
	information = DIA_Karah_WhereIsGaron_info;
	important = TRUE;
};
func int DIA_Karah_WhereIsGaron_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_IKnowAboutGaron))
	{	return TRUE;};
};
func void DIA_Karah_WhereIsGaron_info()
{
		AI_Output(self,other,"DIA_Karah_WhereIsGaron_13_00");	//Куда делся этот малый?! Дверь была закрыта!
		AI_Output(self,other,"DIA_Karah_WhereIsGaron_13_01");	//Не мог же он сквозь землю провалиться! Зачем только я согласился таскать пленнику эту чертову еду?!
		AI_Output(self,other,"DIA_Karah_WhereIsGaron_13_02");	//Не вздумай проболтаться о том, что ты видел. Я скажу, что пришел сегодня кормить пленника и обнаружил, что дверь открыта, и парень сбежал. Это все.
		AI_Output(self,other,"DIA_Karah_WhereIsGaron_13_03");	//А если откроешь рот – получишь болт между глаз! Я два раза повторять не буду! 
	AI_StopProcessInfos(self);
	//Запись в дневнике "Внук рыбака" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_Escaped);
};

//NS - 18/07/2013 -----------------------------------
// Cам обращается к ГГ, если побили его по квесту				important	
instance DIA_Karah_FightAgainstGaronLost(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 0;
	condition = DIA_Karah_FightAgainstGaronLost_condition;	
	information = DIA_Karah_FightAgainstGaronLost_info;
	important = TRUE;
};
func int DIA_Karah_FightAgainstGaronLost_condition()
{
	if ((Garon_FightPirates == Garon_FightPirates_Finished)
		//&& (self.aivar[AIV_LastFightComment] == FALSE)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{	return TRUE;};
};
func void DIA_Karah_FightAgainstGaronLost_info()
{
		AI_Output(self,other,"DIA_Karah_FightAgainstGaronLost_13_00");	//Какого черта ты в это ввязался? Теперь у меня будут проблемы с Гардом.
		AI_Output(self,other,"DIA_Karah_FightAgainstGaronLost_13_01");	//Ладно, Белиар с тобой. Пусть пацан живет. Скажу, что его в лесу сожрали варги, все равно никто проверять не будет.
	self.aivar[AIV_LastFightComment] = TRUE;
	AI_StopProcessInfos(self);
};


//NS - 10/07/2013 ===================================
//  Общие диалоги
//===================================================
// "Кто обучил тебя стрелять из арбалета?" если подходил на тренировке		nr = 40;	
instance DIA_Karah_WhoToughtU(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 40;
	condition = DIA_Karah_WhoToughtU_condition;	
	information = DIA_Karah_WhoToughtU_info;
	description = "Кто обучил тебя стрелять из арбалета?";
};
func int DIA_Karah_WhoToughtU_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_Start))
	{	return TRUE;};
};
func void DIA_Karah_WhoToughtU_info()
{
	AI_Output(other,self,"DIA_Karah_WhoToughtU_15_00");	//Кто обучил тебя стрелять из арбалета?
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_01");	//Мой друг Олаф. Когда-то мы были не разлей вода, дружили с пеленок.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_02");	//Олаф был очень толковым малым, все схватывал на лету. Плюс ко всему он обожал луки и арбалеты, мог со ста метров попасть ворону в глаз.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_03");	//Он показал мне много интересных приемов, как работать с дыханием, как учитывать силу ветра и многое другое.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_04");	//Затем Олаф вступил в гвардию, где стал одним из лучших бойцов.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_05");	//Я не оправдывал его решение, так как считал, что служить заевшимся вельможам и королям – огромная глупость. Но это – его жизнь, его выбор.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_06");	//Служба стала съедать все его свободное время, поэтому мы все реже стали общаться, а потом его отправили на границу с Нордмаром, где началось вторжение орков.
		AI_Output(self,other,"DIA_Karah_WhoToughtU_13_07");	//Больше я о нем ничего не слышал. Даже не знаю, жив ли он.
};


//---------------------------------------------------
// "Почему ты прибился к банде Гарда?" после знакомства		nr = 41;	
instance DIA_Karah_WhyAUWithGard(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 41;
	condition = DIA_Karah_WhyAUWithGard_condition;	
	information = DIA_Karah_WhyAUWithGard_info;
	description = "Почему ты прибился к банде Гарда?";
};
func int DIA_Karah_WhyAUWithGard_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Karah_WhyAUWithGard_info()
{
	AI_Output(other,self,"DIA_Karah_WhyAUWithGard_15_00");	//Почему ты прибился к банде Гарда?
		AI_Output(self,other,"DIA_Karah_WhyAUWithGard_13_01");	//А выбора-то особого не было. Кругом война, орки опустошают Миртану.
		AI_Output(self,other,"DIA_Karah_WhyAUWithGard_13_02");	//Проливать свою кровь за крестьян, ремесленников или, еще лучше, короля мне нет никакого резона.
		AI_Output(self,other,"DIA_Karah_WhyAUWithGard_13_03");	//Служить оркам, как предпочли некоторые воины по своей трусости,	я не намерен.
		AI_Output(self,other,"DIA_Karah_WhyAUWithGard_13_04");	//Вот пораскинув мозгами, я и решил, что лучше уж примкнуть к пиратам, чем подохнуть от топора орков.
};

//"Есть дело.". Активируется, после диалога с Серой Бородой о соревновании
// nr = 1

instance DIA_Karah_GrayBeardCompetition(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Karah_GrayBeardCompetition_condition;	
	information = DIA_Karah_GrayBeardCompetition_info;
	description = "Есть дело.";
};

func int DIA_Karah_GrayBeardCompetition_condition()
{
	If(Npc_KnowsInfo(self,DIA_Karah_WhatsUrName))
	{	
		return TRUE;
	};
};

func void DIA_Karah_GrayBeardCompetition_info()
{
	AI_Output(other,self,"DIA_Karah_GrayBeardCompetition_15_00");	//Есть дело.
	AI_Output(self,other,"DIA_Karah_GrayBeardCompetition_13_01");	//Говори.
	AI_Output(other,self,"DIA_Karah_GrayBeardCompetition_15_02");	//Я хочу посоревноваться с Серой Бородой от имени Малышки Сью. Не хочешь быть наблюдателем?
	AI_Output(self,other,"DIA_Karah_GrayBeardCompetition_13_03");	//А что, это хорошая идея. Мне уже тошно становится от безделья, а тут хотя бы такое развлечение. Я согласен.
	AI_Output(other,self,"DIA_Karah_GrayBeardCompetition_15_04");	//Тогда подходи к Серой Бороде. Скоро начинаем.
	// Меняем расписание Караха для соревнований
	B_StartOtherRoutine(self,"GB_COMPETITION");
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_03);
	if (Npc_KnowsInfo(other,DIA_Symon_GrayBeardCompetition) && Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition_Gold)) // Если ГГ уже пригласил Саймона и Грега
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_06);
	};
	AI_StopProcessInfos(self);
};

// Запускается после окончания соревнования
// nr = 1
	
instance DIA_Karah_AfterCompetition(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_AfterCompetition_condition;	
	information = DIA_Karah_AfterCompetition_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};
func int DIA_Karah_AfterCompetition_condition()
{
	if (GB_CompetitionState > 9 && Npc_IsInState(self,ZS_Talk))
	{	
		return TRUE;	
	};
};	

func void DIA_Karah_AfterCompetition_info()
{
	if (GB_CompetitionState == 10) // Победа ГГ
	{
		AI_Output(self,other,"DIA_Karah_AfterCompetition_13_00");	//Поздравляю с победой. Давно не проходило таких интересных соревнований.
	}
	else // Проигрыш ГГ
	{
		AI_Output(self,other,"DIA_Karah_AfterCompetition_13_01");	//Не расстраивайся – в следующий раз повезет.
	};
};
	
// Активируется, если был диалог "Как тебя зовут?"
// nr = 2
	
instance DIA_Karah_NiceCrossbow(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 2;
	condition = DIA_Karah_NiceCrossbow_condition;	
	information = DIA_Karah_NiceCrossbow_info;
	description = "У тебя неплохой арбалет.";
	permanent = FALSE;
};
func int DIA_Karah_NiceCrossbow_condition()
{
	if (Npc_KnowsInfo(other,DIA_Karah_WhatsUrName))
	{	
		return TRUE;	
	};
};

func void DIA_Karah_NiceCrossbow_info()
{
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_15_00");	//У тебя неплохой арбалет.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_01");	//Да, мне тоже нравится. Плечи сделаны из вяза, растущего на Южных островах. Ложе изготовлено из миртанского дуба, а тетива сплетена из сухожильных нитей.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_02");	//Редкий мастер может изготовить такой арбалет. Лучшее дальнобойное оружие… почти.
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_15_03");	//Почти?
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_04");	//(вздыхает) Да, почти. Видел я однажды, как какой-то матрос отстреливался от нас магическим арбалетом. Это было нечто. Арбалет весь светился синим светом, наконечники сияли будто полярная звезда, оставляя след в воздухе.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_05");	//Ни одна броня не спасала от такого болта. Она даже фальшборт пробивала навылет! Эх, жаль, что у меня такого нет.
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_15_06");	//А в чем была проблема? Почему не забрал с трупа того матроса?
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_07");	//Да все этот увалень Саймон, кретина кусок. Он напал на того матроса и разрубил плечи и тетиву арбалета. «Случайно!», как он тогда сказал. Идиот!
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_08");	//Я смог восстановить арбалет, приделать к нему новые плечи и тетиву, но это было уже не то оружие. Оно не обладало той убийственной в прямом смысле мощью.
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_15_09");	//Печально. А если я, вдруг, найду такой магический арбалет, что ты мне за него дашь?
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_13_10");	//Ха, вряд ли ты вообще найдешь нечто подобное. Такое оружие не просто редкость, а… даже слов нет. Но если вдруг действительно отыщишь, то я отдам тебе за него все свои сбережения. Так как?
	Info_ClearChoices(DIA_Karah_NiceCrossbow);
	Info_AddChoice(DIA_Karah_NiceCrossbow,"Пожалуй, нет.",DIA_Karah_NiceCrossbow_Deciline);
	Info_AddChoice(DIA_Karah_NiceCrossbow,"По рукам.",DIA_Karah_NiceCrossbow_Accept);
};

// Запускается, если выбрать реплику "Пожалуй, нет." в диалоге Караха "У тебя неплохой арбалет."

func void DIA_Karah_NiceCrossbow_Deciline()
{
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_Deciline_15_00");	//Пожалуй, нет.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_Deciline_13_01");	//Уже сдался? Ну, я тебя не виню. Я сам после двух лет поисков опустил руки.
	Info_ClearChoices(DIA_Karah_NiceCrossbow);
};

// Запускается, если выбрать реплику "По рукам." в диалоге Караха "У тебя неплохой арбалет."

func void DIA_Karah_NiceCrossbow_Accept()
{
	AI_Output(other,self,"DIA_Karah_NiceCrossbow_Accept_15_00");	//По рукам. Если я найду магический арбалет, то вспомню обязательно про тебя.
	AI_Output(self,other,"DIA_Karah_NiceCrossbow_Accept_13_01");	//Успеха!
	B_DSG_Log_OpenClose(TOPIC_DS2P_Cbow4Karah,LOG_MISSION,LOG_Running,TOPIC_DS2P_Cbow4Karah_Start);
	AI_StopProcessInfos(self);
};
	
// Активируется, если взят квест "Арбалет для Караха", и в инвентаре у ГГ есть магический арбалет
// nr = 1
	
instance DIA_Karah_BringCrossbow(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_BringCrossbow_condition;	
	information = DIA_Karah_BringCrossbow_info;
	description = "Я нашел магический арбалет.";
	permanent = FALSE;
};
func int DIA_Karah_BringCrossbow_condition()
{
	if ((MIS_DS2P_Cbow4Karah == Log_Running) && Npc_HasItems(other,ITRW_DS2P_Crossbow_Karah) >= 1)
	{	
		return TRUE;	
	};
};	

func void DIA_Karah_BringCrossbow_info()
{
	AI_Output(other,self,"DIA_Karah_BringCrossbow_15_00");	//Я нашел магический арбалет.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_01");	//Что? Ну-ка покажи его мне!
	// Отдаем арбалет Караху
	B_GiveInvItems(other,self,ITRW_DS2P_Crossbow_Karah,1);
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_02");	//Да, это, если и не тот самый арбалет, то нечто очень на него похожее. Ты посмотри, какой он легкий. А плечи! Я никогда не видел таких плеч, кажется, что они сделаны вовсе не из дерева. Интересно, что за материал.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_03");	//Так, ложе прямое, с какими-то древними письменами по бокам. Тетива, тоже материал мне неизвестен. Это не сухожильные нити и не обработанные кишки животных.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_04");	//Вот черт! Теперь я не успокоюсь, пока не пойму, из чего изготовлен этот арбалет.
	AI_Output(other,self,"DIA_Karah_BringCrossbow_15_05");	//Ты ничего не забыл?
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_06");	//О чем?
	AI_Output(other,self,"DIA_Karah_BringCrossbow_15_07");	//Кажется кто-то неосмотрительно обещал отдать мне все свои сбережения за магический арбалет.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_08");	//Ну… Ладно, держи.
	// Создаем в инвентаре Карах 2000 золотых и отдаем ГГ
	CreateInvItems(self,ItMi_Gold,2000);
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(other,self,"DIA_Karah_BringCrossbow_15_09");	//С тобой приятно иметь дело.
	AI_Output(self,other,"DIA_Karah_BringCrossbow_13_10");	//Да-да. Все, иди, не мешай. Я хочу опробовать арбалет.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Cbow4Karah,LOG_MISSION,LOG_Success,TOPIC_DS2P_Cbow4Karah_Success);
	B_GivePlayerXP(XP_MIS_Cbow4Karah_Success);
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Зачарованные болты", и в инвентаре у ГГ есть 20 болтов с наконечником из магической руды
// nr = 1
	
instance DIA_Karah_BringCharmedBolts(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_BringCharmedBolts_condition;	
	information = DIA_Karah_BringCharmedBolts_info;
	description = "Вот твои болты.";
	permanent = FALSE;
};
func int DIA_Karah_BringCharmedBolts_condition()
{
	if ((MIS_DS2P_CharmedBolts == Log_Running) && Npc_HasItems(other,ITRW_ADDON_MAGICOREBOLT) >= 20)
	{	
		return TRUE;	
	};
};

func void DIA_Karah_BringCharmedBolts_info()
{
	AI_Output(other,self,"DIA_Karah_BringCharmedBolts_15_00");	//Вот твои болты.
	AI_Output(self,other,"DIA_Karah_BringCharmedBolts_13_01");	//Давай сюда!
	// Отдаем болты Караху
	B_GiveInvItems(other,self,ITRW_ADDON_MAGICOREBOLT,20);
	AI_Output(self,other,"DIA_Karah_BringCharmedBolts_13_02");	//(изучает) Неплохо, очень неплохо. Сразу видна работа мастера. Как и обещал, я буду учить тебя стрельбе из арбалета.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_Success,TOPIC_DS2P_CharmedBolts_Success);
	B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"Карах будет учить меня стрельбе из арбалета.");
	B_GivePlayerXP(XP_MIS_DS2P_CharmedBolts);
};
	
// Активируется, если пройден квест "Зачарованные болты"
// nr = 5
	
instance DIA_Karah_TeachMe(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 5;
	condition = DIA_Karah_TeachMe_condition;	
	information = DIA_Karah_TeachMe_info;
	description = "Учи меня.";
	permanent = TRUE;
};

func int DIA_Karah_TeachMe_condition()
{
	if (MIS_DS2P_CharmedBolts == Log_Success)
	{	
		return TRUE;	
	};
};

func void DIA_Karah_TeachMe_info()
{
	Info_ClearChoices(DIA_Karah_TeachMe);
	Info_AddChoice(DIA_Karah_TeachMe,Dialog_Back,DIA_Karah_TeachMe_BACK);
	Info_AddChoice(DIA_Karah_TeachMe,"Стрельба из арбалета + 5",DIA_Karah_TeachMe_5);
	Info_AddChoice(DIA_Karah_TeachMe,"Стрельба из арбалета + 1",DIA_Karah_TeachMe_1);
};

func void DIA_Karah_TeachMe_BACK()
{
	Info_ClearChoices(DIA_Karah_TeachMe);
};

func void DIA_Karah_TeachMe_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100);
	Info_ClearChoices(DIA_Karah_TeachMe);
	Info_AddChoice(DIA_Karah_TeachMe,Dialog_Back,DIA_Karah_TeachMe_BACK);
	Info_AddChoice(DIA_Karah_TeachMe,"Стрельба из арбалета + 5",DIA_Karah_TeachMe_5);
	Info_AddChoice(DIA_Karah_TeachMe,"Стрельба из арбалета + 1",DIA_Karah_TeachMe_1);
};

func void DIA_Karah_TeachMe_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100);
	Info_ClearChoices(DIA_Karah_TeachMe);
	Info_AddChoice(DIA_Karah_TeachMe,Dialog_Back,DIA_Karah_TeachMe_BACK);
	Info_AddChoice(DIA_Karah_TeachMe,"Стрельба из арбалета + 5",DIA_Karah_TeachMe_5);
	Info_AddChoice(DIA_Karah_TeachMe,"Стрельба из арбалета + 1",DIA_Karah_TeachMe_1);
};

// Активируется, если взят квест "Охранники для пещеры", и Йорн мертв
// nr = 1
	
instance DIA_Karah_JornIsDead(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_JornIsDead_condition;	
	information = DIA_Karah_JornIsDead_info;
	description = "Йорн мертв.";
	permanent = FALSE;
};
func int DIA_Karah_JornIsDead_condition()
{
	if (MIS_DS2P_GuardsForCave == Log_Running && Npc_IsDead(Jorn))
	{	
		return TRUE;	
	};
};

func void DIA_Karah_JornIsDead_info()
{
	AI_Output(other,self,"DIA_Karah_JornIsDead_15_00");	//Йорн мертв.
	AI_Output(self,other,"DIA_Karah_JornIsDead_13_01");	//И что? Меня это должно волновать?
	AI_Output(other,self,"DIA_Karah_JornIsDead_15_02");	//Да. Грег приказал тебе вместо него идти и охранять вход в пещеру с пленниками.
	AI_Output(self,other,"DIA_Karah_JornIsDead_13_03");	//Проклятье! Надо же было этого идиоту сдохнуть в такой неподходящий момент. Ладно, пойду!
	B_StartOtherRoutine(self,"GUARDSFORCAVE"); // Отправляем Караха на пост
	B_DSG_Log_OpenClose(TOPIC_DS2P_GuardsForCave,LOG_MISSION,LOG_Running,TOPIC_DS2P_GuardsForCave_KarahIsSend);
	AI_StopProcessInfos(self);
};
	
// Активируется, если выполнен квест "Охранники для пещеры"
// nr = 1
	
instance DIA_Karah_HowAreYouAfterQuest(C_Info)
{
	npc = PIR_204_DS2P_Karah;
	nr = 1;
	condition = DIA_Karah_HowAreYouAfterQuest_condition;	
	information = DIA_Karah_HowAreYouAfterQuest_info;
	description = "Как дела?";
	permanent = TRUE;
};
func int DIA_Karah_HowAreYouAfterQuest_condition()
{
	if (MIS_DS2P_GuardsForCave == Log_Success)
	{	
		return TRUE;	
	};
};

func void DIA_Karah_HowAreYouAfterQuest_info()
{
	AI_Output(other,self,"DIA_Karah_HowAreYouAfterQuest_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Karah_HowAreYouAfterQuest_13_01");	//А, и не спрашивай. Весь день приходится торчать на этой жаре. И зачем вообще, спрашивается, столько охранников для нескольких неспособных к бунту крестьян?
};