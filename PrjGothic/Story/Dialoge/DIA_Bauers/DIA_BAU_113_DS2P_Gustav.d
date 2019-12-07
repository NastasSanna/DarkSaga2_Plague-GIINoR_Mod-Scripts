instance DIA_Gustav_EXIT(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Gustav_EXIT_Condition;	
	information = DIA_Gustav_EXIT_Info;
	description = Dialog_Ende;
};

func int DIA_Gustav_EXIT_Condition()
{	
	return TRUE;
};

func void DIA_Gustav_EXIT_Info()
{	
	AI_StopProcessInfos(self);
};

instance DIA_Gustav_CanIHelp(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Gustav_CanIHelp_Condition;	
	information = DIA_Gustav_CanIHelp_Info;
	description = "Могу я чем-то помочь?";
};

func int DIA_Gustav_CanIHelp_Condition()
{
	return TRUE;
};

func void DIA_Gustav_CanIHelp_Info()
{
	AI_Output(other,self,"DIA_Gustav_CanIHelp_15_00"); //Могу я чем-то помочь?
	AI_Output(self,other,"DIA_Gustav_CanIHelp_17_01"); //Думаю, да. Есть одно дело, в котором нам без тебя будет трудно обойтись.
	AI_Output(other,self,"DIA_Gustav_CanIHelp_15_02"); //Что за дело?
	AI_Output(self,other,"DIA_Gustav_CanIHelp_17_03"); //Недавно в лесу появился патруль пиратов. Далеко они пока боятся забираться, но, если рискнут, могут случайно добраться до нас. Мы, конечно, справимся, но тогда, боюсь, могут пострадать наши друзья в плену.
	AI_Output(other,self,"DIA_Gustav_CanIHelp_15_04"); //Ты хочешь, чтобы это сделал я?
	AI_Output(self,other,"DIA_Gustav_CanIHelp_17_05"); //Не совсем. Том придумал один план. Он-то тебе все и расскажет.
	AI_GotoNpc(Tom,other); // Том подбегает к ГГ
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Найти сбежавших охотников"

instance DIA_Gustav_GardWantsKillYou(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Gustav_GardWantsKillYou_Condition;	
	information = DIA_Gustav_GardWantsKillYou_Info;
	description = "У вас проблемы.";
};

func int DIA_Gustav_GardWantsKillYou_Condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && !Npc_IsDead(Jinn))
	{
		return TRUE;
	};
};

func void DIA_Gustav_GardWantsKillYou_info()
{
	TRIA_Start();
	TRIA_Invite(Jinn);
	TRIA_Invite(Gustav);
	TRIA_Next(Gustav);
	AI_TurnToNpc(Jinn,other);
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_00"); //У вас проблемы.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_01"); //Одна наша жизнь в последнее время – это сплошная проблема! Я уже устал от них. Что там еще?
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_02"); //Меня поймал Гард и велел выследить и найти вас, а потом убить и принести ваши головы ему на блюдечке. Велел это нетерпящим возражения тоном. И вот я здесь.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_03"); //Проклятие! Надо что-то делать с этим поскорее. Я так понимаю, что ты не хочешь нас убивать, раз рассказал нам обо всем. Верно?
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_04"); //Да. Я подумал, что, может быть, вы что-нибудь придумаете.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_05"); //Что мы можем придумать в этой ситуации? У нас нет в кармане четырех запасных голов, которые можно было бы показать этому кровожадному ублюдку.
	TRIA_Next(Jinn);
	// Может Джинн далеко?
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_06"); //А если слепить из глины и раскрасить?
	AI_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_07"); //Не считай Гарда глупее себя. Он хоть и параноик и жестокий тип, но совершенно не похож на дурака… хотя… что-то в твоей идее есть?
	TRIA_Next(Gustav);
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_08"); //Что-то придумал?
	AI_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_09"); //Вроде да, но не знаю, выгорит ли.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_10"); //Говори, потому что других выходов у нас нет.
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_11"); //У меня на корабле есть маг воды. Может, он сможет сделать так, чтобы глиняные головы были похожи на настоящие?
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_17_12"); //Действительно, здесь шанс пятьдесят на пятьдесят. Но попробовать стоит. Значит, ты идешь к своему магу, потому что мы не можем показаться в деревне, а мы пока найдем глину, и Джин слепит из них головы.
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_13"); //А краска?
	TRIA_Next(Jinn);
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_14"); //Краска есть в моем доме. В специальной запертой шкатулочке вместе с кисточками, так тебе придется принести еще и шкатулку. Ключ от нее у меня есть с собой.
	AI_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_15"); //Хорошо, я принесу ее.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_16"); //Шкатулка лежит в сундуке.
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_17"); //Пираты могли уже давно забрать эту шкатулочку.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_18"); //Вряд ли, у меня сундук со вторым дном. Вот в этом втором дне и лежит вместе с немногими драгоценностями. Последние можешь забрать себе, а шкатулочку будь добр мне.
	AI_Output(other,self,"DIA_Gustav_GardWantsKillYou_15_19"); //Хорошо, как только все выясню и сделаю, вернусь к вам.
	AI_Output(self,other,"DIA_Gustav_GardWantsKillYou_13_20"); //А я пока, на всякий случай, начну лепить головы.
	DIAG_Reset();
	TRIA_Finish();
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Running,TOPIC_DS2P_FindEscapedHunters_VatrasAndColors);
	AI_StopProcessInfos(self);
};
	
// Активируется, если пройден квест "Найти сбежавших охотников"

instance DIA_Gustav_GardsTrust(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Gustav_GardsTrust_Condition;	
	information = DIA_Gustav_GardsTrust_Info;
	description = "Опасность миновала.";
};

func int DIA_Gustav_GardsTrust_Condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Success) && Hunters_IsNotKilled)
	{
		return TRUE;
	};
};

func void DIA_Gustav_GardsTrust_Info()
{
	AI_Output(other,self,"DIA_Gustav_GardsTrust_15_00"); //Опасность миновала. Гард поверил.
	AI_Output(self,other,"DIA_Gustav_GardsTrust_17_01"); //(с облегчением) Фух, прямо камень с души свалился.
	AI_Output(other,self,"DIA_Gustav_GardsTrust_15_02"); //Будьте осторожнее, не попадайтесь пиратам на глаза, иначе мой обман вскроется.
	AI_Output(self,other,"DIA_Gustav_GardsTrust_17_03"); //Конечно. Мы и раньше не высовывались, теперь же вообще под землю зароемся. Фигурально. Спасибо тебе, если бы не твоя порядочность, мы все бы сейчас червей кормили.
	AI_Output(other,self,"DIA_Gustav_GardsTrust_15_04"); //На здоровье. Сам не люблю лишнюю кровь.
	AI_Output(self,other,"DIA_Gustav_GardsTrust_17_05"); //Это-то тебя и отличает от этих головорезов с моря. Спасибо. Подойди к Джину, он тебе хотел что-то сказать.
	AI_StopProcessInfos(self);
};

// Активируется, если пройден квест "Чума" и взят квест "Заговор" с альтернативной концовкой

instance DIA_Gustav_AboutPirateAttack(C_Info)
{
	npc = BAU_113_DS2P_Gustav;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Gustav_AboutPirateAttack_Condition;	
	information = DIA_Gustav_AboutPirateAttack_Info;
	description = "Вы же хотите избавиться от пиратов?";
};

func int DIA_Gustav_AboutPirateAttack_Condition()
{
	if ((MIS_DS2P_Plague == Log_Success) && (MIS_DS2P_Conspiracy == Log_Running) && (Conspiracy_Mode == 1))
	{
		return TRUE;
	};
};

func void DIA_Gustav_AboutPirateAttack_info()
{
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_00"); //Вы же хотите избавиться от пиратов?
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_01"); //Раз пришел с таким вопросом, у тебя наверняка есть идеи, так?
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_02"); //Я предлагаю напасть на пиратов.
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_03"); //Вот так вот взять и напасть? Да без труда! Я им всем шеи голыми руками посворачиваю.
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_04"); //Давай без сарказма. К тому же я не договорил. Ребята с моего корабля выздоровели, и теперь у меня есть реальная сила, чтобы противостоять пиратам. Вместе с вами нас наберется полтора десятка человек, среди которых будет два мага.
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_05"); //Это в корне меняет дело! С такой силой мы их в открытом море утопим. Но что им помешает перебить заложников?
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_06"); //Поверь мне, им будет не до этого. Когда весть, что на корабле закончилась эпидемия, дойдет до пиратов, они тут же бросятся к нему всем скопом. Там-то я и мои парни и встретим их. Мы – в лоб, вы ударите им в спину. Согласны?
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_07"); //Я посоветуюсь с ребятами. (громко свистит) Парни! Есть предложение.
	TRIA_Start();
	B_StartOtherRoutine(Fart,"TALKWITHGUSTAV");
	AI_SetWalkMode(Fart,NPC_RUN);
	B_StartOtherRoutine(Tom,"TALKWITHGUSTAV");
	AI_SetWalkMode(Tom,NPC_RUN);
	B_StartOtherRoutine(Jinn,"TALKWITHGUSTAV");
	AI_SetWalkMode(Jinn,NPC_RUN);
	TRIA_Invite(Fart);
	TRIA_Invite(Tom);
	TRIA_Invite(Jinn);
	TRIA_Invite(Gustav);
	if (Garon_Choice == Garon_Choice_GoForest) // Если Гарон присоединился к повстанцам
	{
		B_StartOtherRoutine(Garon,"TALKWITHGUSTAV");
		AI_SetWalkMode(Garon,NPC_RUN);
		TRIA_Invite(Garon);
	};
	Wld_PlayEffect("BLACK_SCREEN_SLOW", other,other,0,0,0,FALSE);
	AI_Wait(self,4);
	AI_StopFX(other,"BLACK_SCREEN_SLOW");
	AI_TurnToNpc(Fart,other);
	AI_TurnToNpc(Tom,other);
	AI_TurnToNpc(Jinn,other);
	AI_TurnToNpc(Gustav,Tom);
	AI_TurnToNpc(other,Tom);
	if (Garon_Choice == Garon_Choice_GoForest)
	{
		AI_TurnToNpc(Garon,other);
	};
	TRIA_Next(Gustav);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_08"); //Ну как, ребята, ужалим наших морских рыбок так, что у них все плавники отнимутся?
	TRIA_Next(Tom);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_10_09"); //Ха, клянусь подштанниками моего дедушки, которые я продал за полцены, я согласен! Давно руки чешутся надавать этим наглым мордам.
	TRIA_Next(Jinn);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_11_10"); //Затея неплоха. Но ты уверен, что наши женщины не пострадают?
	AI_TurnToNpc(other,Jinn);
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_11"); //Я приложу все усилия, чтобы они и пальцем их не тронули.
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_11_12"); //Тогда я тоже за. Пора вернуть нам остров в свое владение.
	TRIA_Next(Fart);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_13"); //Прежде чем я выскажу свое мнение, хотелось бы задать пару вопросов. Как мы узнаем, в какой момент необходимо ударить? 
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_14"); //И где нам до этого момента прятаться? Не будем же мы сидеть посреди деревни и прикидываться пеньками с луками?
	AI_TurnToNpc(other,Fart);
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_15"); //Перед схваткой мы протрубим в горн, это и будет условным сигналом. По поводу второго вопроса: вы можете схорониться где-нибудь в лесу поближе к деревне, чтобы услышать сигнал и прибежать на него?
	TRIA_Next(Tom);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_10_16"); //Есть там одно укромное место. Главное – недалеко, но тогда нам понадобится время, чтобы прибежать на зов. Минут пять продержитесь?
	AI_TurnToNpc(other,Tom);
	AI_Output(other,self,"DIA_Gustav_AboutPirateAttack_15_17"); //Хоть десять. Но вы все равно лучше не затягивайте.
	TRIA_Next(Fart);
	AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_18"); //Заметанно! Я тоже с вами. Пора накостылять гостям!
	if (Garon_Choice == Garon_Choice_GoForest)
	{
		TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_19"); //Я тоже с вами.
		TRIA_Next(Gustav);
		AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_20"); //Ты уверен, Гарон? Ты ведь мечом владеешь не очень, а луком еще хуже.
		TRIA_Next(Garon);
		AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_12_21"); //Я уверен. Пора им заплатить за все издевательства.
		TRIA_Next(Gustav);
		AI_Output(self,other,"DIA_Gustav_AboutPirateAttack_17_22"); //Хорошо! Тогда мы выдвигаемся. Ждем условного сигнала.
	};
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Running,TOPIC_DS2P_Conspiracy_HuntersWithUs);
	B_StartOtherRoutine(Gustav,"WAITINGFORSIGNAL");
	B_StartOtherRoutine(Tom,"WAITINGFORSIGNAL");
	B_StartOtherRoutine(Jinn,"WAITINGFORSIGNAL");
	B_StartOtherRoutine(Fart,"WAITINGFORSIGNAL");
	if (Garon_Choice == Garon_Choice_GoForest)
	{
		B_StartOtherRoutine(Garon,"WAITINGFORSIGNAL");
	};
	AI_StopProcessInfos(self);
};
	
	