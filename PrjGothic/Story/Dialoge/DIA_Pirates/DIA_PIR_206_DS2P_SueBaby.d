instance DIA_SueBaby_EXIT(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 999;
	permanent = TRUE;
	condition = DIA_SueBaby_EXIT_condition;	
	information = DIA_SueBaby_EXIT_info;
	description = Dialog_Ende;
};

func int DIA_SueBaby_EXIT_condition()
{	
	return TRUE;
};

func void DIA_SueBaby_EXIT_info()
{	
	AI_StopProcessInfos(self);
};

// Первый разговор. Начинает первая. nr = 1

instance DIA_SueBaby_Hello(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_Hello_condition;	
	information = DIA_SueBaby_Hello_info;
	description = " ";
};

func int DIA_SueBaby_Hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_Hello_info()
{	
	AI_Output(self,other,"DIA_SueBaby_Hello_13_00");	//Чего уставился? Никогда женщин не видел?
	AI_Output(other,self,"DIA_SueBaby_Hello_15_01");	//Женщин-пиратов? Нет.
	AI_Output(self,other,"DIA_SueBaby_Hello_13_02");	//Ну вот она я, шестьдесят килограммов счастья! (смеется)
};

// "Как тебя зовут, малышка?" nr = 1

instance DIA_SueBaby_WhatsYourName(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_WhatsYourName_condition;	
	information = DIA_SueBaby_WhatsYourName_info;
	description = "Как тебя зовут, малышка?";
};

func int DIA_SueBaby_WhatsYourName_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_Hello))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_WhatsYourName_info()
{
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName_15_00");	//Как тебя зовут, малышка?
	// Экипировка оружия
	AI_EquipBestMeleeWeapon(self);
	// Берет оружие в руки
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_SueBaby_WhatsYourName_13_01");	//Никогда не называй меня так! Иначе язык отрежу. И уши. И то, что ниже. Понял?
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName_15_02");	//(примирительно) Понял-понял. Зачем так заводиться-то?
	AI_Output(self,other,"DIA_SueBaby_WhatsYourName_13_03");	//Не люблю, когда меня называют Малышкой. Заруби это себе на носу.
	// Убирает оружие из рук
	AI_RemoveWeapon(self);
};

// "Почему ты не любишь, когда тебя называют так?" - появляется после
// диалога "Как тебя зовут, малышка?". nr = 1

instance DIA_SueBaby_CalledBaby(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_CalledBaby_condition;	
	information = DIA_SueBaby_CalledBaby_info;
	description = "Почему ты не любишь, когда тебя называют так?";
};

func int DIA_SueBaby_CalledBaby_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_WhatsYourName))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_CalledBaby_info()
{
	AI_Output(other,self,"DIA_SueBaby_CalledBaby_15_00");	//Почему ты не любишь, когда тебя называют так?
	AI_Output(self,other,"DIA_SueBaby_CalledBaby_13_01");	//Не твоего ума дело! И вообще, что ты пристал к бедной женщине?
};

// "Ты так и не представилась." - появляется после диалога
// "Как тебя зовут, малышка?". nr = 2

instance DIA_SueBaby_WhatsYourName2(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 2;
	permanent = FALSE;
	condition = DIA_SueBaby_WhatsYourName2_condition;	
	information = DIA_SueBaby_WhatsYourName2_info;
	description = "Ты так и не представилась.";
};

func int DIA_SueBaby_WhatsYourName2_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_WhatsYourName))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_WhatsYourName2_info()
{
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName2_15_00");	//Ты так и не представилась.
	AI_Output(self,other,"DIA_SueBaby_WhatsYourName2_13_01");	//Можешь звать меня Сью. Просто Сью.
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName2_15_02");	//Очень приятно. А меня…
	AI_Output(self,other,"DIA_SueBaby_WhatsYourName2_13_03");	//Меня это не интересует!
	AI_Output(other,self,"DIA_SueBaby_WhatsYourName2_15_02");	//(ехидно) Фи как невежливо.
};

// "Что такая красивая девушка делает среди пиратов?" - появляется после первого диалога
// со Сью. nr = 3.

instance DIA_SueBaby_BeautifulGirl(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	condition = DIA_SueBaby_BeautifulGirl_condition;	
	information = DIA_SueBaby_BeautifulGirl_info;
	description = "Что такая красивая девушка делает среди пиратов?";
};

func int DIA_SueBaby_BeautifulGirl_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_Hello))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_BeautifulGirl_info()
{
	AI_Output(other,self,"DIA_SueBaby_BeautifulGirl_15_00");	//Что такая красивая девушка делает среди пиратов?
	AI_Output(self,other,"DIA_SueBaby_BeautifulGirl_13_01");	//Что за дурацкий вопрос? С чего ты вообще взял, что красивые девушки не могут входить в пиратские команды?
	AI_Output(other,self,"DIA_SueBaby_BeautifulGirl_15_02");	//Ох, как же с тобой сложно. Ты неправильно меня поняла. Я просто хотел узнать, что ты делаешь среди пиратов.
	AI_Output(self,other,"DIA_SueBaby_BeautifulGirl_13_03");	//А что мне еще оставалось делать? Я была нищенкой, сиротой, не зная, что со мной будет в следующий час, поэтому решила начать новую жизнь. Ночью тайком пробралась на торговый корабль, который впоследствии атаковал капитан Гард. Так я и оказалась в его команде.
	AI_Output(other,self,"DIA_SueBaby_BeautifulGirl_15_04");	//Очень интересная история. А главное поучительная и длинная. Я едва не заснул.
	AI_Output(self,other,"DIA_SueBaby_BeautifulGirl_13_05");	//Не ерничай, иначе мигом языка лишишься.
};

// "Тебе идут штаны и куртка" - появляется после первого диалога со Сью.
// nr = 4.

instance DIA_SueBaby_NiceClothes(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	condition = DIA_SueBaby_NiceClothes_condition;	
	information = DIA_SueBaby_NiceClothes_info;
	description = "Тебе идут штаны и куртка.";
};

func int DIA_SueBaby_NiceClothes_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_Hello))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_NiceClothes_info()
{
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_00");	//Тебе идут штаны и куртка.
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_01");	//А меня они просто бесят!
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_02");	//Чего так?
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_03");	//Я все-таки женщина! Хоть и пиратка. И мне больше по нраву платья, чем мужской костюм.
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_04");	//В чем тогда проблема? Возьми платье да одень.
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_05");	//(раздраженно) Нету его у меня! Те несколько платьев, что у меня были, остались на нашем разбитом корабле и сейчас наверняка покоятся на дне морском, а если и выплыли, то уже неминуемо испорченны.
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_06");	//А у местных не пробовала купить?
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_07");	//(зло) Как же не пробовала! Но только эти старые кошелки даже говорить со мной не желают, а Гард попросил без особой нужды не доставать крестьян, ибо овцы спокойны пока волки особо далеко не забрались. Только всем остальным плевать на его приказ, а я, как дура, следую ему!
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_15_08");	//Эй, не заводись, красавица. Может, я могу чем-то тебе помочь?
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_13_09");	//Хм, а что, это может выйти. Если ты мне достанешь платье, то я в долгу не останусь. Ну как, возьмешься?
	Info_ClearChoices(DIA_SueBaby_NiceClothes);
	Info_AddChoice(DIA_SueBaby_NiceClothes,"Конечно.",DIA_SueBaby_NiceClothes_OFC);
	Info_AddChoice(DIA_SueBaby_NiceClothes,"Что-то мне эта идея не нравится.",DIA_SueBaby_NiceClothes_BadIdea);
};

// Вызывается при выборе фразы "Конечно." в диалоге со Сью - "Тебе идут штаны и куртка."

func void DIA_SueBaby_NiceClothes_OFC()
{
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_OFC_15_00");	//Конечно, достану. Скоро буду!
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_OFC_13_01");	//Отлично! Жду!
	// Запись в дневнике "Платье для Сью"
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,LOG_Running,TOPIC_DS2P_Dress4Sue_Start);
	AI_StopProcessInfos(self);
};

// Вызывается при выборе фразы "Что-то мне эта идея не нравится" в диалоге со Сью - "Тебе идут штаны и куртка."

func void DIA_SueBaby_NiceClothes_BadIdea()
{
	AI_Output(other,self,"DIA_SueBaby_NiceClothes_BadIdea_15_00");	//Что-то мне эта идея не нравится.
	AI_Output(self,other,"DIA_SueBaby_NiceClothes_BadIDea_13_01");	//Ни и вали тогда!
	AI_StopProcessInfos(self);
};

// "Что ты думаешь о Гарде?" - становится доступным только при активном квесте "Заговор".
// Является постоянным пунктом. nr = 1.

instance DIA_SueBaby_AboutGard(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = TRUE;
	condition = DIA_SueBaby_AboutGard_condition;	
	information = DIA_SueBaby_AboutGard_info;
	description = "Что ты думаешь о Гарде?";
};

func int DIA_SueBaby_AboutGard_condition()
{	
	if (MIS_DS2P_Conspiracy == Log_Running)
	{
		return TRUE;
	};
};

func void DIA_SueBaby_AboutGard_info()
{
	AI_Output(other,self,"DIA_SueBaby_AboutGard_15_00");	//Что ты думаешь о Гарде?
	AI_Output(self,other,"DIA_SueBaby_AboutGard_13_01");	//Тебя-то это почему волнует?
	AI_Output(other,self,"DIA_SueBaby_AboutGard_15_02");	//Ну, мне просто интересно твое мнение на его счет.
	AI_Output(self,other,"DIA_SueBaby_AboutGard_13_03");	//Мое мнение – это сугубо мое мнение и делиться им со всяким встречным поперечным я не намерена. Проваливай!
	AI_StopProcessInfos(self);
};

// Появляется эта реплика только если начат квест "Платье для Сью", и у ГГ имеется платье

instance DIA_SueBaby_BringDress(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = TRUE;
	condition = DIA_SueBaby_BringDress_condition;	
	information = DIA_SueBaby_BringDress_info;
	description = "Смотри, что я достал.";
};

func int DIA_SueBaby_BringDress_condition()
{	
	if ((MIS_DS2P_Dress4Sue == Log_Running) && Npc_HasItems(other,0/*ITAR_PIR_DSG_BABE*/) >= 1) //UNFINISHED Тут надо заменить на код платья для Сью.
	{
		return TRUE;
	};
};

func void DIA_SueBaby_BringDress_info()
{
	// На случай, если шпага вдруг не экипирована
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_SueBaby_BringDress_15_00");	//Смотри, что я достал.
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_01");	//Вот это красота!
	/* Тут тоже надо заменить на код платья Сью
	B_GiveInvItems(other,self,ITAR_PIR_DSG_BABE,1);
	AI_EquipArmor(self,ITAR_PIR_DSG_BABE);
	*/
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_02");	//Отлично! Как я тебе?
	 // Отворачивается от ГГ
	AI_TurnAway(self,other);
	// Поворачивается обратно
	AI_TurnToNpc(self,other);
	AI_Output(other,self,"DIA_SueBaby_BringDress_15_03");	//Очень красива, но шпага на поясе портит все впечатление.
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_04");	//Сама знаю, но мне без нее никуда. Надо же как-то отваживать всех этих ухажеров.
	AI_Output(other,self,"DIA_SueBaby_BringDress_15_05");	//Ты про остальных пиратов?
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_06");	//О них самих. Достали! Сил уже терпеть нет. Особенно Саймон. Сколько его ни отшивай, никогда не сдается.
	AI_Output(other,self,"DIA_SueBaby_BringDress_15_07");	//Ну, такую красивую девушку трудно не заметить.
	AI_Output(self,other,"DIA_SueBaby_BringDress_13_08");	//(улыбается) Льстец! Ну да ладно, дракон с ними со всеми! Вот, возьми это в качестве вознаграждения.
	// Создаем в инвентаре Сью 300 золотых
	CreateInvItems(self,ItMi_Gold,300);
	// Отдаем 300 золотых ГГ
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,LOG_Success,TOPIC_DS2P_Dress4Sue_Start);
};

//"Как дела?". Активируется, если пройти квест "Платье", и Серая Борода жив.
// nr = 1

instance DIA_SueBaby_HowDoYouDo(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_HowDoYouDo_condition;	
	information = DIA_SueBaby_HowDoYouDo_info;
	description = "Как дела?";
};

func int DIA_SueBaby_HowDoYouDo_condition()
{	
	if ((MIS_DS2P_Dress4Sue == Log_Success) && !Npc_IsDead(PIR_208_DS2P_GrayBeard))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_HowDoYouDo_info()
{
	AI_SetWalkMode(GrayBeard,NPC_RUN);
	AI_GotoNpc(GrayBeard,other);
	B_StartOtherRoutine(GrayBeard,"SUEATTACK");
	AI_Output(other,self,"DIA_SueBaby_HowDoYouDo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_SueBaby_HowDoYouDo_13_01");	//Все просто...
	AI_StopProcessInfos(self);
};

//Активируется в случае, если в драке между Сью, ГГ и Серой Бородой упал без сознания лишь Серая Борода
// nr = 1

instance DIA_SueBaby_GrayBeardFight_Win(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_GrayBeardFight_Win_condition;	
	information = DIA_SueBaby_GrayBeardFight_Win_info;
	description = " ";
};

func int DIA_SueBaby_GrayBeardFight_Win_condition()
{	
	if ((SueBaby_GrayBeard_Fight == 2) && (SueBaby_GrayBeard_Fight_End == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardFight_Win_info()
{
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Win_13_00");	//Фух, нелегкая была драка. Этот ощипанный курицей ублюдок порвал мне платье! Вот тварь.
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_Win_15_01");	//Придется зашивать.
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Win_13_02");	//Ну да, видимо, придется. Черт, как не вовремя!
};

//Активируется в случае, если в драке между Сью, ГГ и Серой Бородой упал без сознания Серая Борода и ГГ
// nr = 1

instance DIA_SueBaby_GrayBeardFight_SueWin(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_GrayBeardFight_SueWin_condition;	
	information = DIA_SueBaby_GrayBeardFight_SueWin_info;
	description = " ";
};

func int DIA_SueBaby_GrayBeardFight_SueWin_condition()
{	
	if ((SueBaby_GrayBeard_Fight == 3) && (SueBaby_GrayBeard_Fight_End == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardFight_SueWin_info()
{
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_SueWin_13_00");	//Ну что, герой. В порядке?
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_SueWin_15_01");	//Будто мне мракорис лапой по башке засадил.
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_SueWin_13_02");	//Ха-ха, а ты красиво умеешь падать. Научишь?
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_SueWin_15_03");	//Да без проблем. Тебя бьют по голове, ты притворяешься спящим и валишься на землю. Ничего сложного.
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_SueWin_13_04");	//(смех)
};

//Активируется в случае, если в драке между Сью, ГГ и Серой Бородой упал без сознания Серая Борода и Сью
// nr = 1

instance DIA_SueBaby_GrayBeardFight_GGWin(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_GrayBeardFight_GGWin_condition;	
	information = DIA_SueBaby_GrayBeardFight_GGWin_info;
	description = " ";
};

func int DIA_SueBaby_GrayBeardFight_GGWin_condition()
{	
	if ((SueBaby_GrayBeard_Fight == 4) && (SueBaby_GrayBeard_Fight_End == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardFight_GGWin_info()
{
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_GGWin_13_00");	//Ох, моя голова!
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_GGWin_15_01");	//Как ты?
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_GGWin_13_02");	//Этот ощипанный баран все платье мне изодрал своей саблей. Вот ублюдок! Теперь придется изгаляться, чтобы зашить и не оставить следов.
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_GGWin_15_03");	//Да, Борода на удивление ловко машет саблей.
};

//Активируется в случае, если в драке между Сью, ГГ и Серой Бородой упал без сознания ГГ и Сью
// nr = 1

instance DIA_SueBaby_GrayBeardFight_Lose(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_GrayBeardFight_Lose_condition;	
	information = DIA_SueBaby_GrayBeardFight_Lose_info;
	description = " ";
};

func int DIA_SueBaby_GrayBeardFight_Lose_condition()
{	
	if ((SueBaby_GrayBeard_Fight == 5) && (SueBaby_GrayBeard_Fight_End == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardFight_Lose_info()
{
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Lose_13_00");	//Ох, мракорис меня подери, чтоб мне никогда больше не подняться на палубу, как же хреново.
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_Lose_15_01");	//Ты как?
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Lose_13_02");	//Сам-то не видишь?! Уязвлена не только моя гордость, но и попорчено платье, а также самооценка. Вдвоем не смогли одолеть одну ощипанную курицу. Позор!
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_Lose_15_03");	//Да ладно, не стоит воспринимать все настолько близко к сердцу.
	AI_Output(self,other,"DIA_SueBaby_GrayBeard_Lose_13_04");	//Тебе-то легко говорить! Не ты же живешь в обществе шакалов, готовых вонзить тебе кинжал в брюхо, стоит только раз проявить слабость. А уж мне, женщине, живущей среди пиратов, даже дышать надо с осторожностью.
	AI_Output(other,self,"DIA_SueBaby_GrayBeard_Lose_15_05");	//Не волнуйся, все будет в порядке.
};

//"А ты неплохо владеешь шпагой.". Активируется после диалога о поражении Сью и ГГ
//nr = 1

instance DIA_SueBaby_FightStyle(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_FightStyle_condition;	
	information = DIA_SueBaby_FightStyle_info;
	description = "А ты неплохо владеешь шпагой.";
};

func int DIA_SueBaby_FightStyle_condition()
{	
	if (Npc_KnowsInfo(other,DIA_SueBaby_GrayBeardFight_Lose))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_FightStyle_info()
{
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_00");	//А ты неплохо владеешь шпагой.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_01");	//Сама знаю, научилась, чтобы выжить среди такого скота.
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_02");	//И часто такое случается?
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_03");	//Не всегда, конечно, но бывает. Серая Борода все не может мне простить, что я отказалась стать для него подстилкой. Вот и мстит мне при каждом случае.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_04");	//Как напьется, так сразу бежит высказывать мне все. Лишь когда трезв, хватает ума не связываться. Жаль только – трезв он бывает редко.
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_05");	//Может я могу чем-то помочь?
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_06");	//А чем? Это тебе не падальщиков по лугам гонять и не платье у крестьянок выкупать.
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_07");	//Может, я могу сделать так, чтобы Борода от тебя отстал раз и навсегда?
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_08");	//Как? Грубую силу он не понимает, к его разуму воззвать еще сложнее. Да легче мракориса свернуть с пути, чем этого барана с бородой!
	AI_Output(other,self,"DIA_SueBaby_FightStyle_15_09");	//Думаю, я что-нибудь придумаю.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_13_10");	//Правда? Ты это сделаешь?
	Info_ClearChoices(DIA_SueBaby_FightStyle);
	Info_AddChoice(DIA_SueBaby_FightStyle,"Хм, что-то я передумал.",DIA_SueBaby_FightStyle_Deciline);
	Info_AddChoice(DIA_SueBaby_FightStyle,"Да.",DIA_SueBaby_FightStyle_Accept);
};

// Запускается при выборе реплики "Хм, что-то я передумал." в диалоге Сью "А ты неплохо владеешь шпагой."

func void DIA_SueBaby_FightStyle_Deciline()
{
	AI_Output(other,self,"DIA_SueBaby_FightStyle_Deciline_15_00");	//Хм, что-то я передумал.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_Deciline_13_01");	//Только я подумала, что ты нормальный мужчина, а ты оказывается, как и все. Оставь меня, я хочу побыть одна.
	//Сью перестанет обижаться на ГГ через сутки
	SueBaby_DecilineQuestTime = C_GetTime_Plus(24,0,1);
	AI_StopProcessInfos(self);
};

// Запускается при выборе реплики "Да." в диалоге сью "А ты неплохо владеешь шпагой."

func void DIA_SueBaby_FightStyle_Accept()
{
	AI_Output(other,self,"DIA_SueBaby_FightStyle_Accept_15_00");	//Да.
	AI_Output(self,other,"DIA_SueBaby_FightStyle_Accept_13_01");	//Хорошо. И спасибо тебе, даже если из твоей затеи ничего не выйдет.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Start);
};

// Запускается, если Сью обижается на ГГ

instance DIA_SueBaby_DontWantTalk(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = TRUE;
	important = TRUE;
	condition = DIA_SueBaby_DontWantTalk_condition;	
	information = DIA_SueBaby_DontWantTalk_info;
	description = " ";
};

func int DIA_SueBaby_DontWantTalk_condition()
{	
	if (SueBaby_DecilineQuestTime < Wld_GetPassedTime(0) && Npc_IsInState(self,ZS_Talk)) // Прошло меньше 24 часов
	{
		return TRUE;
	};
};

func void DIA_SueBaby_DontWantTalk_info()
{
	if (MIS_DS2P_TeachGrayBeard == Log_Failed)
	{
		AI_Output(self,other,"DIA_SueBaby_DontWantToTalk_13_01");	//Я хочу побыть одна.
	}
	else
	{
		AI_Output(self,other,"DIA_SueBaby_DontWantToTalk_13_02");	//Оставь меня, я хочу побыть одна.
	};
	AI_StopProcessInfos(self);
};

//"По поводу Серой Бороды.".Активируется, при взятии квеста "Проучить Серую Бороду"
//nr = 2

instance DIA_SueBaby_GrayBeardSituation(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 2;
	permanent = TRUE;
	condition = DIA_SueBaby_GrayBeardSituation_condition;	
	information = DIA_SueBaby_GrayBeardSituation_info;
	description = "По поводу Серой Бороды.";
};

func int DIA_SueBaby_GrayBeardSituation_condition()
{	
	if ((MIS_DS2P_TeachGrayBeard == Log_Running) || (MIS_DS2P_TeachGrayBeard == Log_Failed) && (GrayBeardSituation_IsOver == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GrayBeardSituation_info()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_15_00");	//По поводу Серой Бороды.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_13_01");	//Да? Есть что-то новенькое?
	Info_ClearChoices(self);
	Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"Ничего нового.",DIA_SueBaby_GrayBeardSituation_NothingNew);
	if (MIS_DS2P_TeachGrayBeard == Log_Failed) // Если задание провалено, т.е. ГГ проиграл в битве с Серой Бородой
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"К сожалению, я не справился.",DIA_SueBaby_GrayBeardSituation_Failed);
	};
	if ((GrayBeard_AttackWinner == 2) && (GrayBeard_AttackNum == 3) && (SueBaby_IsKnownContinue == FALSE)) // Если ГГ выиграл 3 боя с Серой Бородой
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"Я в тупике.",DIA_SueBaby_GrayBeardSituation_Continue);
	};
	if ((SueBaby_WaitingIsOver == TRUE) && (SueBaby_AboutGrayBeardSolution == FALSE)) // Если прошло 24 часа
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"Я кое-что придумал.",DIA_SueBaby_GrayBeardSituation_Solution);
	};
	if (GB_CompetitionState == 10) // Победа ГГ
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"Радуйся, красавица.",DIA_SueBaby_GrayBeardSituation_Win);
	};
	if (GB_CompetitionState == 11) // Проигрыш ГГ
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"Мне очень жаль.",DIA_SueBaby_GrayBeardSituation_Lose);
	};
	if (Npc_IsDead(GrayBeard)) // Если Серая Борода мертв
	{
		Info_AddChoice(DIA_SueBaby_GrayBeardSituation,"Да, Серая Борода мертв.",DIA_SueBaby_GrayBeardSituation_Dead);
	};
};

//Запускается, при выборе реплики "Ничего нового" в диалоге Сью "По поводу Серой Бороды."

func void DIA_SueBaby_GrayBeardSituation_NothingNew()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_NothingNew_15_00");	//Нет, ничего нового.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_NothingNew_13_01");	//Держи меня в курсе.
	Info_ClearChoices(DIA_SueBaby_GrayBeardSituation);
};

//Запускается, при выборе реплики "К сожалению, я не справился." в диалоге Сью "По поводу Серой Бороды,"

func void DIA_SueBaby_GrayBeardSituation_Failed()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Failed_15_00");	//К сожалению, я не справился.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Failed_13_01");	//Что ж, ожидаемо, хоть и печально. Спасибо, что хоть попытался. Буду справляться своими силами.
	GrayBeardSituation_IsOver = TRUE;
	AI_StopProcessInfos(self);
};

//Запускается, при выборе реплики "Я в тупике" в диалоге Сью "По поводу Серой Бороды,"

func void DIA_SueBaby_GrayBeardSituation_Continue()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Continue_15_00");	//Я в тупике. Мне несколько раз удалось поколотить Серую Бороду, но это все равно, что в мракориса камешками кидать. Силы тратишь, а эффекта ноль.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Continue_13_01");	//Я же говорила, что грубой силой тут ничего не добиться.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Continue_15_02");	//Может, у тебя есть какие-то идеи, как нам переубедить этого упрямца.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Continue_13_03");	//Сейчас в голову ничего не лезет. Приходи завтра, надеюсь к этому времени что-нибудь придумать.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Continue_15_04");	//Хорошо.
	SueBaby_WaitTimeQuest = C_GetTime_Plus(24,0,1); // Ставим ожидание на 24 часа
	SueBaby_IsKnownContinue = TRUE;
	AI_StopProcessInfos(self);
};

// Запускается, при выборе реплики "Я кое-что придумал." в диалоге Сью "По поводу Серой Бороды."

func void DIA_SueBaby_GrayBeardSituation_Solution()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_00");	//Я кое-что придумал.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_01");	//Я тоже, но давай сначала ты изложишь свою идею.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_02");	//Что если нам попробовать собрать компромат на Серую Бороду? Он ведь наверняка не совсем чист на руку.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_03");	//(фыркает) Не выйдет. Если бы это было возможно, то я бы уже это давно сделала. Либо он действительно такой честный, либо просто действует ОЧЕНЬ осторожно, не подставляясь. Вернее – второе.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_04");	//И что нам тогда делать? Ты говорила, у тебя есть идейка. Расскажешь?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_05");	//Да, слушай. У пиратов есть один обычай: если двое никак не могут разрешить спорный момент, то они устраивают соревнования. Проигравший обязан выполнить один раз волю выигравшего.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_06");	//Ты хочешь устроить такое соревнование?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_07");	//Да. Только выступать будешь ты, от моего имени. Соревнования проходят в три этапа: выпивка, охота и поединок.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_08");	//Ну, я уже победил Серую Бороду. Причем, три раза.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_09");	//Значит, в этом у тебя проблем не будет. Остается победить еще хотя бы в одном состязании. Если ты наберешь два очка из трех, то победа будет за тобой. Ты согласен помочь?
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_10");	//Но у меня есть вопрос.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_11");	//Спрашивай.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_12");	//А почему ты раньше не устроила такое соревнование? Ведь победив, можно было на навсегда избавиться от ненужного внимания Серой Бороды.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_13");	//Ну… по правде говоря, я пить не умею. Совсем. И охочусь очень плохо. А Серая Борода как-никак охотник, хоть и бывший.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_14");	//Поэтому в соревновании с ним у меня не было никаких шансов. Просить же других пиратов выступить от моего имени я не хотела – потом еще больше буду должна им.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_15");	//Ясно. А если я проиграю, что тогда?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_16");	//Тогда мне придется выполнить любое желание Серой Бороды, ведь ты выступаешь от моего имени.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_17");	//И ты готова рискнуть?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_18");	//Придется. Если станет хотя бы на одного ухажера меньше, то мне будет легче отбиваться от всех остальных. Каждый третий пират в команде Гарда считает, что я должна принадлежать только ему. Раньше их было больше, но мне удалось отвадить от себя большую часть.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_19");	//Хорошо, тогда я немедленно займусь этим.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_20");	//Постой, тебе сначала надо найти пару свидетелей, которые подтвердят результат. Иначе, проиграв, Серая Борода может начать отнекиваться.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Solution_15_21");	//Я поищу людей. Может посоветуешь кого?
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_22");	//Хм, попроси Саймона, он тоже пытается за мной ухаживать, поэтому он однозначно подтвердит результат, если ты выиграешь. Караха тоже можешь позвать, он не откажет. 
	if (!Npc_IsDead(PIR_201_DS2P_Greg))
	{
		AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Solution_13_23");	//И хорошо бы Грега – он единственное незаинтересованное лицо в команде. Желательно этих троих, но можно и двух.
	};
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_StartCompetition);
	SueBaby_AboutGrayBeardSolution = TRUE;
	AI_StopProcessInfos(self);
};

//Запускается, если выбрать реплику "Радуйся, красавица" в диалоге Сью "По поводу Серой Бороды."

func void DIA_SueBaby_GrayBeardSituation_Win()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Win_15_00");	//Радуйся, красавица. Серая Борода больше тебя не побеспокоит.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Win_13_01");	//Отлично! Я рада, что положилась на тебя, без тебя у меня бы ничего не вышло. Трудно пришлось?
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Win_15_02");	//Не особо, в прошлом я попадал в переделки и похлеще.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Win_13_03");	//(смеется) Охотно верю. Вот, возьми этот амулет, он защитит тебя от подлого удара в спину или случайного ранения.
	// Создаем наградный амулет в инвентаре
	CreateInvItems(self,ItAm_DS2P_SueBaby,1);
	// Даем амулет ГГ
	B_GiveInvItems(self,other,ItAm_DS2P_SueBaby,1);
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Win_15_04");	//Спасибо.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Win_13_05");	//Кроме того я могу научить тебя лучше обращаться с одноручным оружием и технике боя с кинжалом и двумя мечами.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TeachGrayBeard_Success);
	B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"Малышка Сью может научить меня лучше обращаться с одноручным клинком, а также технике боя с парным оружием.");
	B_GivePlayerXP(XP_MIS_TeachGrayBeard_Success);
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Мне очень жаль." в диалоге Сью "По поводу Серой Бороды."

func void DIA_SueBaby_GrayBeardSituation_Lose()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Lose_15_00");	//Мне очень жаль. Я проиграл ему.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Lose_13_01");	//Что ж, спасибо, что хоть попытался.
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Lose_15_02");	//Извини.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Lose_13_03");	//Ничего, как-нибудь переживу. А теперь оставь меня, пожалуйста, я хочу побыть одна.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Failed,TOPIC_DS2P_TeachGrayBeard_Defeat);
	//Сью перестанет обижаться на ГГ через сутки
	SueBaby_DecilineQuestTime = C_GetTime_Plus(24,0,1);
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Да, Серая Борода мертв." в диалоге Сью "По поводу Серой Бороды."

func void DIA_SueBaby_GrayBeardSituation_Dead()
{
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Dead_15_00");	//Да, Серая Борода мертв. Думаю, больше он не будет доставлять тебе неприятности.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Dead_13_01");	//Что? Мертв? Ты убил его?
	AI_Output(other,self,"DIA_SueBaby_GrayBeardSituation_Dead_15_02");	//Да, мне пришлось. Борода совсем с катушек слетел, вот мне и пришлось его утихомирить.
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Dead_13_03");	//Не скажу, что мне жаль его, но он был одним из наших. Что ж, значит такова воля Аданоса. Спасибо за новость. Вот, возьми в благодарность этот амулет.
	// Создаем наградный амулет в инвентаре
	CreateInvItems(self,ItAm_DS2P_SueBaby,1);
	// Даем амулет ГГ
	B_GiveInvItems(self,other,ItAm_DS2P_SueBaby,1);
	AI_Output(self,other,"DIA_SueBaby_GrayBeardSituation_Dead_13_04");	//Также я могу научить тебя лучше владеть одноручным мечом и драться двумя мечами.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_TeachGrayBeard_Success_Alternative);
	B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"Малышка Сью может научить меня лучше обращаться с одноручным клинком, а также технике боя с парным оружием.");
	B_GivePlayerXP(XP_MIS_TeachGrayBeard_Success);
	Info_ClearChoices(DIA_SueBaby_GrayBeardSituation);
};

// "Грег хочет 300 монет за то, чтобы быть наблюдателем.". Активируется, если ГГ еще должен Грегу 300 золотых

instance DIA_SueBaby_GoldForGreg(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 2;
	permanent = FALSE;
	condition = DIA_SueBaby_GoldForGreg_condition;	
	information = DIA_SueBaby_GoldForGreg_info;
	description = "Грег хочет 300 монет за то, чтобы быть наблюдателем.";
};

func int DIA_SueBaby_GoldForGreg_condition()
{	
	if (Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition) && !Npc_KnowsInfo(self,DIA_Greg_GrayBeardCompetition_Gold))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_GoldForGreg_info()
{
	AI_Output(other,self,"DIA_SueBaby_GoldForGreg_15_00");	//Грег хочет 300 монет за то, чтобы быть наблюдателем.
	AI_Output(self,other,"DIA_SueBaby_GoldForGreg_13_01");	//Вот ведь рыбий выродок! У меня есть только 200 монет сейчас, больше, к сожалению, нет. Вот, возьми.
	// Создаем в инвентаре Сью 200 золотых и отдаем ГГ
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(other,self,"DIA_SueBaby_GoldForGreg_15_02");	//Ничего, остальное как-нибудь сам нарою.
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Помочь добится Сью"
// nr = 3

instance DIA_SueBaby_WinSueHand(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	condition = DIA_SueBaby_WinSueHand_condition;	
	information = DIA_SueBaby_WinSueHand_info;
	description = "Привет.";
};

func int DIA_SueBaby_WinSueHand_condition()
{	
	if (MIS_DS2P_WinSueHand == Log_Running)
	{
		return TRUE;
	};
};

func void DIA_SueBaby_WinSueHand_info()
{
	AI_Output(other,self,"DIA_SueBaby_WinSueHand_15_00");	//Привет. Как настроение?
	AI_Output(self,other,"DIA_SueBaby_WinSueHand_13_01");	//Скучно, если честно. На этом острове совершенно никаких развлечений нет.
	AI_Output(other,self,"DIA_SueBaby_WinSueHand_15_02");	//Так, может, прогуляемся по лесу? Хоть как-то вечер скоротаем.
	AI_Output(self,other,"DIA_SueBaby_WinSueHand_13_03");	//Ты меня так клеишь, парень? В жизни меня не пытались позвать на свидание более нелепо. Хотя вру, пытались. Саймон, будь он неладен.
	AI_Output(other,self,"DIA_SueBaby_WinSueHand_15_04");	//Так пойдешь?
	AI_Output(self,other,"DIA_SueBaby_WinSueHand_13_05");	//Ладно, все равно тут скоро пауки вокруг меня будут паутину плести, так хоть какое-то развлечение. Куда пойдем?
	AI_Output(other,self,"DIA_SueBaby_WinSueHand_15_06");	//Куда глаза глядят. Пошли!
	B_StartOtherRoutine(self,"FOLLOW");
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Running,TOPIC_DS2P_WinSueHand_InForrest);
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Помочь добится Сью", и ГГ привел ее в лес
// nr = 3

instance DIA_SueBaby_InForrest(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_InForrest_condition;	
	information = DIA_SueBaby_InForrest_info;
	description = " ";
};

func int DIA_SueBaby_InForrest_condition()
{	
	if ((MIS_DS2P_WinSueHand == Log_Running) && Npc_KnowsInfo(other,DIA_SueBaby_WinSueHand)
		 && (Npc_GetDistToWP(other,"TESTWP") <= 600)) //UNFINISHED - вписать где заканчивают путь Сью и ГГ по квесту "Помочь добится Сью"
	{
		return TRUE;
	};
};

func void DIA_SueBaby_InForrest_info()
{
	AI_Output(self,other,"DIA_SueBaby_InForrest_13_00");	//Фух, далековато забрались. Как бы на охотников не наткнуться.
	AI_Output(other,self,"DIA_SueBaby_InForrest_15_01");	//Зато повеселимся.
	AI_Output(self,other,"DIA_SueBaby_InForrest_13_02");	//Да. Тут какие хищники водятся?
	AI_Output(other,self,"DIA_SueBaby_InForrest_15_03");	//Разные. От волков до мракорисов. Слушай, я ненадолго отлучусь, хорошо? Всего на минутку.
	AI_Output(self,other,"DIA_SueBaby_InForrest_13_04");	//Хорошо, иди.
	B_StartOtherRoutine(self,"WAITINGFORSYMON");
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Помочь добится Сью", и Саймон с Волком побежали к Сью
// nr = 3

instance DIA_SueBaby_FailedPlan(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 3;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_FailedPlan_condition;	
	information = DIA_SueBaby_FailedPlan_info;
	description = " ";
};

func int DIA_SueBaby_FailedPlan_condition()
{	
	if ((MIS_DS2P_WinSueHand == Log_Running) && Npc_KnowsInfo(other,DIA_Symon_SueInForrest)) 
	{
		return TRUE;
	};
};

func void DIA_SueBaby_FailedPlan_info()
{
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_00");	//А вот и второй!
	AI_Output(other,self,"DIA_SueBaby_FailedPlan_15_01");	//Э, я вот только возвращаться собирался.
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_02");	//Не лги мне, я обо всем знаю. Ладно Саймон, у этого идиота каждую неделю безумный план рождается. Но ты мне казался нормальным, адекватным парнем. Как ты вообще согласился участвовать в предприятии Саймона?
	AI_Output(other,self,"DIA_SueBaby_FailedPlan_15_03");	//Так было нужно.
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_04");	//Ах, нужно? Ну-ну.
	AI_TurnToNpc(self,Symon);
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_05");	//А теперь слушай меня внимательно, Саймон. Если ты еще хоть раз попытаешься ко мне подкатить, я тебе все кости пересчитаю. Не смотри, что я женщина, а ты мужчина. Понял?
	AI_TurnToNpc(self,other);
	AI_Output(self,other,"DIA_SueBaby_FailedPlan_13_06");	//А ты меня разочаровал. Думала, просто прогуляемся, свежим воздухом подышим, может, даже поохотимся немного.
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Помочь добится Сью", и Саймон с Волком побежали к Сью
// nr = 1

instance DIA_SueBaby_AboutSymonPlan(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_AboutSymonPlan_condition;	
	information = DIA_SueBaby_AboutSymonPlan_info;
	description = "Насчет Саймона.";
};

func int DIA_SueBaby_AboutSymonPlan_condition()
{	
	if ((MIS_DS2P_WinSueHand == Log_Running) && Npc_KnowsInfo(other,DIA_Symon_SueInVillage)) 
	{
		return TRUE;
	};
};

func void DIA_SueBaby_AboutSymonPlan_info()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_15_00");	//Насчет Саймона.
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_13_01");	//Что тебе надо?
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_15_02");	//Понимаю, что прошу очень много, но может ты переменишь свое мнение насчет него?
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_13_03");	//Нет, нет и еще раз нет. Я с этим идиотом встречаться не буду.
	Info_ClearChoices(DIA_SueBaby_AboutSymonPlan);
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"(НАЗАД)",DIA_SueBaby_AboutSymonPlan_Back);
	if ((MIS_DS2P_Dress4Sue == Log_Success) || (MIS_DS2P_TeachGrayBeard == Log_Success)) // Если выполнен хоть 1 квест Сью
	{
		Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"Я ведь тебе помог недавно.",DIA_SueBaby_AboutSymonPlan_Help);
	};
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"Давай заключим сделку. Я тебе – ты мне.",DIA_SueBaby_AboutSymonPlan_Deal);
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"Может, передумаешь?",DIA_SueBaby_AboutSymonPlan_Think);
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"Я тебе заплачу.",DIA_SueBaby_AboutSymonPlan_Pay);
	Info_AddChoice(DIA_SueBaby_AboutSymonPlan,"Почему ты так категорична?",DIA_SueBaby_AboutSymonPlan_Why);
};

// Активируется, если выбрать "(НАЗАД)" в диалоге Сью

func void DIA_SueBaby_AboutSymonPlan_Back()
{
	Info_ClearChoices(DIA_SueBaby_AboutSymonPlan);
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Running,TOPIC_DS2P_WinSueHand_NoWays);
};

// Активируется, если выбрать "Я ведь тебе помог недавно." в диалоге Сью

func void DIA_SueBaby_AboutSymonPlan_Help()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Help_15_00");	//Я ведь тебе помог недавно.
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Help_13_01");	//И я тебе благодарна за это, но встречаться с Саймоном… нет уж, увольте. На такое я не пойду, даже если бы ты спас меня из-под лап тролля.
};

// Активируется, если выбрать "Давай заключим сделку. Я тебе – ты мне." в диалоге Сью

func void DIA_SueBaby_AboutSymonPlan_Deal()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Deal_15_00");	//Давай заключим сделку. Я тебе – ты мне. Готов выполнить любое твое желаение, а ты в обмен хотя бы пару раз встретишься с Саймоном.
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Deal_13_01");	//Что ты пристал ко мне? Я сказала нет, значит, нет!
};

// Активируется, если выбрать "Я тебе заплачу." в диалоге Сью

func void DIA_SueBaby_AboutSymonPlan_Pay()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Pay_15_00");	//Я тебе заплачу.
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Pay_13_01");	//Ах ты ж, я тебе что, портовая шлюха! Вали к Темному со своими деньгами!
};

// Активируется, если выбрать "Может, передумаешь?" в диалоге Сью

func void DIA_SueBaby_AboutSymonPlan_Think()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Think_15_00");	//Может, передумаешь?
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Think_13_01");	//Нет. Даже сам Белиар не заставит меня с ним встречаться.
};

// Активируется, если выбрать "Почему ты так категорична?" в диалоге Сью

func void DIA_SueBaby_AboutSymonPlan_Why()
{
	AI_Output(other,self,"DIA_SueBaby_AboutSymonPlan_Why_15_00");	//Почему ты так категорична?
	AI_Output(self,other,"DIA_SueBaby_AboutSymonPlan_Why_13_01");	//Потому, что Саймон самый настоящий придурок. Мне с ним рядом даже находиться стыдно, не то, что встречаться.
};

// Активируется, если взят квест "Заговор", и Зедд и Валес участвуют в заговоре
// nr = 1

instance DIA_SueBaby_AboutConspiracy(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_AboutConspiracy_condition;	
	information = DIA_SueBaby_AboutConspiracy_info;
	description = " ";
};

func int DIA_SueBaby_AboutConspiracy_condition()
{	
	if ((MIS_DS2P_Conspiracy == Log_Running) && (Zedd_InConspiracy == TRUE) && (Vales_InConspiracy == TRUE)
		 && (C_DIA_Greg_OurIdea_Know_AboutSue == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_AboutConspiracy_info()
{
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_00");	//Эй, псст. Подойди сюда, пожалуйста.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_01");	//Что? Опять проблемы?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_02");	//Не совсем. Я слышала, что ты и Грег хотите сместить Гарда. Это так?
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_03");	//Ну…
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_04");	//Я подслушала твой разговор с Зеддом и Валесом. Нет нужды пытаться убедить меня в том, что вы ничего не замышляете.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_05");	//Ладно, да, это так. Мы с Грегом действительно хотим избавиться от Гарда. Ты выступишь на нашей стороне, проголосуешь за Грега?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_06");	//Поэтому я завязала с тобой разговор. Я хочу избавиться от Гарда, убить его собственными руками.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_07");	//Вот как? А почему тогда все говорят, что ты его самый верный человек?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_08");	//Потому, что мне выгодно быть им. До поры до времени.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_09");	//А разъяснить можешь? Так может любой сказать, а потом «бац» и у тебя между лопаток нож торчит.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_10");	//Думаю, ты имеешь право знать. Годом раньше на корабле Гарда служил боцманом один человек, его звали Наттан. Красивый, сильный, властный, умный, а также бесстрашный. Не буду скрывать, что я влюбилась в него как девчонка.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_11");	//Мы некоторое время встречались с ним, втайне от остальных. Мы не то чтобы скрывали ото всех наши чувства, но просто не распространялись.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_12");	//И что с ним случилось, с Наттаном? Он был на вашем прежнем убежище, где вы торговали рабами с орками и погиб?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_13");	//Не совсем, он погиб месяцем раньше. Наттан был очень амбициозным и тщеславным человеком, и он вздумал устранить Гарда. Созвать собрание пиратов и низложить Гарда.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_14");	//Я, так понимаю, из его затеи ничего не вышло.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_15");	//Увы, но да. В момент голосования от него неожиданно отвернулись почти все сторонники, и Гард победил с огромным перевесом голосов. Чтобы не допустить в дальнейшем подобных случаев, наш капитан сам лично прирезал Наттана.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_16");	//Я тогда едва не выдала себя, хотела накинуться на Гарда и пронзить его гнилое сердце, но сдержалась. Потому что иначе погибла бы зазря под клинками его верных пиратов. С тех самых пор я и ношу в себе ту ненависть к Гарду и ищу подходящего момента, чтобы отомстить.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_17");	//То, что мы не афишировали с Наттаном наши отношения, сыграли мне на руку, и Гард все еще считает меня своей самой преданно сторонницей.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_18");	//Что ж, твои мотивы мне понятны. Но почему ты так долго терпела? Почему сама не устроила собрание, заручившись поддержкой пиратов?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_19");	//Не умею я убеждать людей. К тому же, до прихода Грега власть Гарда была практически абсолютной, никто и пикнуть против него не смел. Только одноглазый рискнул выступить против него.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_20");	//Я сожалею, что с твоим возлюбленным такое случилось, но очень рад, что ты на нашей стороне.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_21");	//Когда вы хотите устроить собрание?
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_22");	//Когда я и Грег убедим остальных пиратов выступить на нашей стороне.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_23");	//Не тяни, пожалуйста. С каждым прошедшим днем я чувствую, как ненависть становится все сильнее и сильнее. Еще немного, и я попросту сорвусь и воткну Гарду кинжал меж ребер.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_24");	//Не волнуйся, все будет в лучшем виде.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_25");	//Да, пока ты не ушел. У меня есть одно условие.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_26");	//Какое?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_27");	//Я сама лично прикончу Гарда. Если я устрою общий сбор пиратов, выдвинув на пост капитана Грега, и собрание решит в пользу одноглазого, то весь гнев Гарда падет на меня одну. Он нападет на меня и тогда-то, один на один, я смогу с ним сладить.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_28");	//Пока он окружен верными людьми, нечего и пытаться убить его. Если бы Грегу удалось совершить недавнее покушение на Гарда, то разгневанная команда попросту растерзала бы убийцу их капитана.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_29");	//Так что ему повезло, что его друг предал его, так он хотя бы жив остался.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_30");	//Хорошо. Я принимаю твои условия. Ты устраиваешь общий сбор, обвиняешь Гарда, убиваешь его, а Грег становится новым капитаном. Я правильно понял?
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_31");	//Да.
	AI_Output(other,self,"DIA_SueBaby_AboutConspiracy_15_32");	//Тогда по рукам.
	SueBaby_InConspiracy = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_SueBabyIn);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Punishment,LOG_MISSION,LOG_Running,TOPIC_DS2P_Punishment_Start);
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Заговор", "Помочь добиться Сью" и Сью отказалась встречаться с Саймоном, Сью согласилась участвовать в заговоре
// nr = 1

instance DIA_SueBaby_AgainAboutSymon(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	condition = DIA_SueBaby_AgainAboutSymon_condition;	
	information = DIA_SueBaby_AgainAboutSymon_info;
	description = "Насчет Саймона.";
};

func int DIA_SueBaby_AgainAboutSymon_condition()
{	
	if ((MIS_DS2P_Conspiracy == Log_Running) && MIS_DS2P_WinSueHand
		 && Npc_KnowsInfo(other,DIA_SueBaby_AboutSymonPlan) && (SueBaby_InConspiracy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SueBaby_AgainAboutSymon_info()
{
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_00");	//Насчет Саймона.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_01");	//Чего тебе? Я что, неясно сказала?
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_02");	//Послушай, нам нужен его голос, чтобы свалить Гарда. Он согласился проголосовать за Грега в том случае, если я помогу ему завоевать тебя. Я же не предлагаю спать с ним. Просто пару раз встретишься с ним, поболтаешь о том, о сем.
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_03");	//Слегка потянешь время. А когда собрание пройдет, сразу же порвешь с ним. И все.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_04");	//Черт!
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_05");	//Пойми, нам без этого увальня никак. Он может оказаться той соломинкой, что переломает хребет мракорису.
	AI_Output(self,other,"DIA_SueBaby_AboutConspiracy_13_06");	//Проклятие! Ладно! Я согласна, но если этот урод попробует пристать ко мне ко прибью его без лишних затей.
	AI_Output(other,self,"DIA_SueBaby_AgainAboutSymon_15_07");	//Хорошо-хорошо. Спасибо.
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Running,TOPIC_DS2P_WinSueHand_SueAccept);
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Заговор" и Гарда убили на собрании
// nr = 1

instance DIA_SueBaby_ConspiracyOver(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_ConspiracyOver_condition;	
	information = DIA_SueBaby_ConspiracyOver_info;
	description = " ";
};

func int DIA_SueBaby_ConspiracyOver_condition()
{	
	if ((MIS_DS2P_Conspiracy == Log_Running) && (Conspiracy_IsStarted == TRUE) && Npc_IsDead(Gard)) 
	{
		return TRUE;
	};
};

func void DIA_SueBaby_ConspiracyOver_info()
{
	AI_Output(self,other,"DIA_SueBaby_ConspiracyOver_13_00");	//Гард мертв, теперь у нас новый капитан. Да здравствует капитан Грег!
	B_DSG_StopConspiracy();
	AI_StopProcessInfos(self);
};

// Активируется, если сдан квест "Заговор" и Гард убит
// nr = 1

instance DIA_SueBaby_PunishmentOver(C_Info)
{
	npc = PIR_206_DS2P_SueBaby;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_SueBaby_PunishmentOver_condition;	
	information = DIA_SueBaby_PunishmentOver_info;
	description = " ";
};

func int DIA_SueBaby_PunishmentOver_condition()
{	
	if ((MIS_DS2P_Conspiracy == Log_Success) && (Conspiracy_IsStarted == TRUE)
		 && Npc_IsDead(Gard) && Npc_IsInState(self,ZS_TALK)) 
	{
		return TRUE;
	};
};

func void DIA_SueBaby_PunishmentOver_info()
{
	AI_Output(self,other,"DIA_SueBaby_PunishmentOver_13_00");	//Теперь, когда он мертв, у меня в груди царит такая странная пустота.
	AI_Output(other,self,"DIA_SueBaby_PunishmentOver_15_01");	//Такое всегда бывает, когда ты долго отдаешь себя одной цели, а потом, достигнув ее, не знаешь, что тебе дальше делать.
	AI_Output(self,other,"DIA_SueBaby_PunishmentOver_13_02");	//(вздыхает) Ты прав. Просто странно не чувствовать эту ненависть в душе, с которой я уже успела сродниться. Ладно, пойду посплю чуток.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Punishment,Log_Mission,Log_Running,TOPIC_DS2P_Punishment_Success);
	B_GivePlayerXP(XP_MIS_DS2P_Punishment);
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};
	
	
	
/* UNFINISHED


Появляется новый топик (после DIA_SueBaby_GrayBeardSituation_Win)

Научи меня. (постоянный)
ГГ: Научи меня.
Сью: Чему?

Одноручное оружие +1
Одноручное оружие +2
Бой с мечом и кинжалом
После «Боя с мечом и кинжалом» появится:
Бой с двумя мечами
Учит она владению одноручным оружием до 90%. Дальше будет отвечать:
Сью: Я научила тебя всему, что знала. Теперь мне самой впору брать у тебя уроки фехтования.

*/