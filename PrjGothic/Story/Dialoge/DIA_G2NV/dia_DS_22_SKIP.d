instance DIA_Skip_EXIT(C_Info)
{
	npc = DS_22_SKIP;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Skip_EXIT_condition;	
	information = DIA_Skip_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Skip_EXIT_condition(){	return TRUE;};
func void DIA_Skip_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Skip_Start(C_Info)	//Начальный диалог на корабле
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_Start_condition;	
	information = DIA_Skip_Start_info;
	description = "Что ты тут делаешь?";
};
func int DIA_Skip_Start_condition(){	return TRUE;};
func void DIA_Skip_Start_info()
{
	AI_Output(other,self,"DIA_Skip_Start_15_00");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Skip_Start_08_01");	//(шепотом) Тише! Чего разорался?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(other,self,"DIA_Skip_Start_15_02");	//Как ты оказался на корабле? И почему ты шепчешь?
	AI_Output(self,other,"DIA_Skip_Start_08_03");	//Слишком много вопросов для одной встречи. Пираты уже на палубе?
	AI_Output(other,self,"DIA_Skip_Start_15_04");	//Нет, они не поднимались. Я сказал, что на корабле чума. Они не дураки лезть в самый рассадник заразы.
	AI_Output(other,self,"DIA_Skip_Start_15_05");	//Кстати, как ты умудрился не заболеть?
	AI_Output(self,other,"DIA_Skip_Start_08_06");	//(недовольно) Опять вопросы... А ты это хорошо придумал, с чумой.
	AI_Output(other,self,"DIA_Skip_Start_15_07");	//Я ничего не приду...
	AI_Output(self,other,"DIA_Skip_Start_08_08");	//(перебивает) Ладно, мне пора сваливать. А то мало ли, вдруг Грег передумает...
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"RunAway");	//Убегает быстро и где-то прячется
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldAcquaintance_Start);
};

// Активируется после того, как Скип убежал

instance DIA_Skip_FindYou(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_FindYou_condition;	
	information = DIA_Skip_FindYou_info;
	description = "Попался!";
};

func int DIA_Skip_FindYou_condition()
{
	//UNFINISHED
	return TRUE;
};

func void DIA_Skip_FindYou_info()
{
	AI_Output(other,self,"DIA_Skip_FindYou_15_00");	//Ага! Попался!
	AI_Output(self,other,"DIA_Skip_FindYou_08_01");	//Черт! Как ты меня нашел?
	AI_Output(other,self,"DIA_Skip_FindYou_15_02");	//Это было не так-то сложно. Ты шумишь как мракорис в фарфоровой лавке. Совершенно не умеешь себя вести в лесу.
	AI_Output(self,other,"DIA_Skip_FindYou_08_03");	//Проклятье! Надо что-то делать. Мне срочно нужно хорошее убежище.
};
	
// Активируется после того, как ГГ выбрал альтернативное прохождение "Заговора"

instance DIA_Skip_IMeetGreg(C_Info)
{
	npc = DS_22_SKIP;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Skip_IMeetGreg_condition;	
	information = DIA_Skip_IMeetGreg_info;
	description = "Я встретил Грега.";
};

func int DIA_Skip_IMeetGreg_condition()
{
	// UNFINISHED
	return TRUE;
};

func void DIA_Skip_IMeetGreg_info()
{
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_00");	//Я встретил Грега.
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_01");	//(нервно) Да? И что он сказал?
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_02");	//Он просил передать дословно: «Если вернешься сам – твоя смерть будет быстрой, но если я найду тебя – будешь завидовать демонам преисподней»
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_03");	//Что б тебя! Надо с этим что-то делать. Я не хочу попасть ему под горячую руку.
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_04");	//А что случилось-то?
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_05");	//Да это я сглупил, когда Грег хотел прикончить Гарда. Испугался, что взбешенная команда прикончит и его и меня, вот и сдал Грега со всеми потрохами. Теперь он этого мне простить не может. Я еле ноги унес. Теперь прячусь.
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_06");	//И что ты будешь делать дальше?
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_07");	//Пока не знаю. Мне надо схорониться где-нибудь, где Грег меня точно не найдет. У тебя, случаем, нет подходящего места на примете?
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_08");	//Нет.
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_09");	//Жаль. Значит, буду сам искать. Если будут новости по поводу Грега – скажи мне.
	AI_Output(other,self,"DIA_Skip_IMeetGreg_15_10");	//А сдаться Грегу не вариант?
	AI_Output(self,other,"DIA_Skip_IMeetGreg_08_11");	//Что ты! Едва я покажусь ему на глаза, как он сразу же сдерет с меня шкуру. Причем, с живого.
};	
	
// Активируется после того, как ГГ прослушает диалог "Я встретил Грега."

instance DIA_Skip_WhatAreYouDo(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_WhatAreYouDo_condition;	
	information = DIA_Skip_WhatAreYouDo_info;
	description = "Что будешь делать?";
};

func int DIA_Skip_WhatAreYouDo_condition()
{
	if (Npc_KnowsInfo(other,DIA_Skip_IMeetGreg))
	{
		return TRUE;
	};
};

func void DIA_Skip_WhatAreYouDo_info()
{
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_00");	//Что будешь делать?
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_01");	//Прятаться. До тех пор пока он не остынет, либо не сдохнет. Скорее – второе.
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_02");	//Тогда удачи тебе.
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_03");	//Подожди… Слушай, ты можешь мне помочь?
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_04");	//Смотря в чем.
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_05");	//Я хочу вернуться к своим, но боюсь. Грег не прощает ошибок.
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_06");	//Что от меня-то ты хочешь?
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_07");	//В общем, надо сделать так чтобы Грег простил меня.
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_08");	//И как я это сделаю? У меня самого с ним не особо дружественные отношения.
	AI_Output(self,other,"DIA_Skip_WhatAreYouDo_08_09");	//Я не знаю, как, но сделай, пожалуйста. В долгу не останусь. Я из Яркендара, перед нашим побегом, успел прихватить золото из своего тайника.
	AI_Output(other,self,"DIA_Skip_WhatAreYouDo_15_10");	//Хорошо, я посмотрю, что можно сделать.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldAcquaintance_Start);
	AI_StopProcessInfos(self);
};
	
// Активируется после того, как ГГ прослушает диалог "Что ты будешь делать?" и взят квест "Заговор"

instance DIA_Skip_News(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_News_condition;	
	information = DIA_Skip_News_info;
	description = "У меня для тебя новости.";
};

func int DIA_Skip_News_condition()
{
	if (Npc_KnowsInfo(other,DIA_Skip_WhatAreYouDo) && (MIS_DS2P_Conspiracy == Log_Running) && (MIS_DS2P_OldAcquaintance == Log_Running))
	{
		return TRUE;
	};
};	
	
func void DIA_Skip_News_info()
{
	AI_Output(other,self,"DIA_Skip_News_15_00");	//У меня для тебя новости.
	AI_Output(self,other,"DIA_Skip_News_08_01");	//Говори.
	Info_ClearChoices(DIA_Skip_News);
	if (Conspiracy_Alternative == TRUE) // Если Грег мертв
	{
		Info_AddChoice(DIA_Skip_News,"Грег мертв.",DIA_Skip_News_GregIsDead);
	}
	else
	{
		Info_AddChoice(DIA_Skip_News,"Мы с Грегом хотим сместить Гарда на совете пиратов.",DIA_Skip_News_Conspiracy);
	};
};

func void DIA_Skip_News_GregIsDead()
{
	AI_Output(other,self,"DIA_Skip_News_GregIsDead_15_00");	//Грег мертв.
	AI_Output(self,other,"DIA_Skip_News_GregIsDead_08_01");	//Что? Как это случилось?
	AI_Output(other,self,"DIA_Skip_News_GregIsDead_15_02");	//Он допек Гарда.
	AI_Output(self,other,"DIA_Skip_News_GregIsDead_08_03");	//Отлично! Значит, я могу вернуться к своим. Вот, возьми немного золота за хорошую новость.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,Log_Mission,Log_Success,TOPIC_DS2P_OldAcquaintance_GregIsDead);
	B_StartOtherRoutine(self,"AFTERQUEST");
	B_GivePlayerXP(XP_MIS_DS2P_OldAcquaintance);
	// Создаем 150 золотых и отдаем ГГ
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_News_Conspiracy()
{
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_00");	//Мы с Грегом хотим сместить Гарда на совете пиратов.
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_01");	//Ему все неймется? Он после того случая неделю пластом провалялся, а все туда же рвется.
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_02");	//Я тут прикинул, что нам может понадобиться твоя помощь.
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_03");	//Это Грег сказал?
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_04");	//Нет, это я говорю. Если ты нам поможешь и проголосуешь за Грега, то велика вероятность, что он тебя простит.
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_05");	//Ты в этом уверен? Не хотелось бы ошибиться.
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_06");	//На самом деле нет, но если поговорить с Грегом и сказать, что ты за нас, то он, может, и сменит гнев на милость.
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_07");	//Вот черт! Везде засада! Ладно, скажи ему, что если он обещает оставить меня в живых, то я проголосую за него на совете.
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_08");	//А с чего ты решил помогать нам, после того, как однажды уже предал Грега?
	AI_Output(self,other,"DIA_Skip_News_Conspiracy_08_09");	//Парень, я уже устал прятаться и в страхе оглядывать каждый куст. Ты знаешь, сколько я уже нормально не спал? Вот и я уже со счета сбился, так что готов рискнуть.
	AI_Output(other,self,"DIA_Skip_News_Conspiracy_15_10");	//Ладно я передам Грегу твои слова.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,Log_Mission,Log_Running,TOPIC_DS2P_OldAcquaintance_SkipHelps);
	AI_StopProcessInfos(self);
};
	
// Активируется после того, как ГГ рассказал Скипу о смерти Грега

instance DIA_Skip_HowAreYou(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Skip_HowAreYou_condition;	
	information = DIA_Skip_HowAreYou_info;
	description = "Как дела?";
};

func int DIA_Skip_HowAreYou_condition()
{
	if (MIS_DS2P_OldAcquaintance == Log_Success)
	{
		return TRUE;
	};
};

func void DIA_Skip_HowAreYou_info()
{
	AI_Output(other,self,"DIA_Skip_HowAreYou_15_00");	//Как дела?
	if (Conspiracy_Alternative == TRUE)
	{
		AI_Output(self,other,"DIA_Skip_HowAreYou_08_01");	//Неплохо. Учитывая последние события. Теперь, когда Грега нет, можно вернуться к нормальной жизни и не оглядываться в страхе по сторонам.
		AI_Output(self,other,"DIA_Skip_HowAreYou_08_02");	//Если бы мы еще могли убраться с этого проклятущего острова, я бы сказал, что все просто прекрасно.
	}
	else
	{
		AI_Output(self,other,"DIA_Skip_HowAreYou_08_03");	//Не так хорошо, как хотелось бы, не так плохо, как моглось. Грег хоть и не в восторге от моего присутствия, но слово держит.
	};
};
	
// Активируется после того, как Грег согласится простить Скипа

instance DIA_Skip_GregAccept(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Skip_GregAccept_condition;	
	information = DIA_Skip_GregAccept_info;
	description = "Грег согласен. ";
};

func int DIA_Skip_GregAccept_condition()
{
	if ((MIS_DS2P_OldAcquaintance == Log_Running) && Npc_KnowsInfo(other,DIA_Greg_SkipHelps))
	{
		return TRUE;
	};
};

func void DIA_Skip_GregAccept_info()
{
	AI_Output(other,self,"DIA_Skip_GregAccept_15_00");	//Грег согласен. Он сказал, что если ты проголосуешь за него, то он оставит тебя в живых. Но он пообещал, что ты испытаешь все муки Бездны Белира, если предашь его еще раз.
	AI_Output(self,other,"DIA_Skip_GregAccept_08_01");	//Что ж, шанс на благополучный исход у меня есть, и я благодарен тебе за него. Вот, это тебе за твои труды.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Running,TOPIC_DS2P_Conspiracy_SkipIn);
	Skip_InConspiracy = TRUE;
	B_StartOtherRoutine(self,"AFTERQUEST");
	// Создаем 200 золотых и отдаем ГГ
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_StopProcessInfos(self);
};

// Активируется после того, как "Заговор" закончен и Гард мертв

instance DIA_Skip_ConspiracyOver(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Skip_ConspiracyOver_condition;	
	information = DIA_Skip_ConspiracyOver_info;
	description = " ";
};

func int DIA_Skip_ConspiracyOver_condition()
{
	if ((MIS_DS2P_OldAcquaintance == Log_Running) && (MIS_DS2P_Conspiracy == Log_Success) && Conspiracy_IsStarted
		&& Npc_IsInState(self,ZS_TALK))
	{
		return TRUE;
	};
};

func void DIA_Skip_ConspiracyOver_info()
{
	TRIA_Start();
	TRIA_Invite(Greg);
	TRIA_Invite(Skip);
	AI_GotoNpc(Greg,Skip);
	TRIA_Next(Skip);
	AI_Output(self,other,"DIA_Skip_ConspiracyOver_08_00");	//Фух, неужели все закончилось, а мы все еще живы?
	AI_Output(other,self,"DIA_Skip_ConspiracyOver_15_01");	//Живы и даже целы.
	AI_Output(self,other,"DIA_Skip_ConspiracyOver_08_02");	//Честно говоря, я даже немного сомневался, что ваша затея выгорит.
	AI_Output(other,self,"DIA_Skip_ConspiracyOver_15_03");	//И ты не попытался переметнуться на сторону Гарда?
	AI_Output(self,other,"DIA_Skip_ConspiracyOver_08_04");	//(хмыкнув) Грег бы мне не простил повторного предательства. Меня даже удивляет, чтоон решился дать мне второй шанс. Не такой он человек.
	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Skip_ConspiracyOver_11_05");	//Вот об этом бы я и хотел поговорить, мой вероломный друг. Я обещал, что не убью тебя, но не обещал, что ты останешься целым и здоровым.
	Skip_GregFight = self.attribute[ATR_HITPOINTS_MAX]; // Делаем так, чтобы Скип упал с одного удара
	self.attribute[ATR_HITPOINTS_MAX] = 1;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	B_Attack(Greg,Skip,AR_NONE,0);
	DIAG_Reset();
//???	TRIA_Next();
	AI_StopProcessInfos(self);
};

// Активируется после того, как Грег побьет Скипа

instance DIA_Skip_SkipIsDown(C_Info)
{
	npc = DS_22_SKIP;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Skip_SkipIsDown_condition;	
	information = DIA_Skip_SkipIsDown_info;
	description = " ";
};

func int DIA_Skip_SkipIsDown_condition()
{
	if (Skip_IsGregFight == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Skip_SkipIsDown_info()
{
	AI_Output(self,other,"DIA_Skip_SkipIsDown_08_00");	//Вот теперь я верю, что это тот Грег, которого я долго знал. Ох, хорошо, что хоть живым оставил. Чего у Грега не отнять, так это того, что он держит свое слово.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OldAcquaintance,Log_Mission,Log_Success,TOPIC_DS2P_OldAcquaintance_Success);
	B_GivePlayerXP(XP_MIS_DS2P_OldAcquaintance);
	B_StartOtherRoutine(self,"AFTERQUEST");
	AI_StopProcessInfos(self);
};
	