instance DIA_Gard_EXIT(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Gard_EXIT_condition;	
	information = DIA_Gard_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Gard_EXIT_condition(){	return TRUE;};
func void DIA_Gard_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 19/06/2013 ===========
//  Ругается с Грегом
//===========================
instance DIA_Gard_WithGregStart(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 0;
	condition = DIA_Gard_WithGregStart_condition;	
	information = DIA_Gard_WithGregStart_info;
	important = TRUE;
};
func int DIA_Gard_WithGregStart_condition(){	return TRUE;};
func void DIA_Gard_WithGregStart_info()
{
	var C_NPC Gard;	Gard = Hlp_GetNpc(PIR_200_DS2P_Gard);
	var C_NPC Greg;	Greg = Hlp_GetNpc(PIR_201_DS2P_Greg);
	TRIA_Invite(Greg);
	TRIA_Start();
	
	AI_TurnToNpc(Gard,Greg); Mdl_StartFaceAni(Gard, "S_ANGRY",1,-1);
	AI_TurnToNpc(Greg,Gard); Mdl_StartFaceAni(Greg, "S_ANGRY",1,-1);
	
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_00");	//(взбешенно) Кто дал тебе право решать за меня? А? Ты всего лишь первый помощник, раздери тебя акула!
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_01");	//Ты что, решил, что здесь главный? А? Отвечай, рыбья чешуя!

	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Gard_WithGregStart_11_02");	//Я не мог рисковать командой. Там чума... Я сам видел, как их капитан повалился замертво.

	TRIA_Next(Gard);
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_03");	//Здесь я думаю и командую. Ты должен мне докладывать, а не делать тупые выводы своим куриными мозгами!

	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Gard_WithGregStart_11_04");	//(злобно) И каким образом я должен был узнать твое мнение? Ты же сидишь здесь в ратуше!

	TRIA_Next(Gard);
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_05");	//Не строй из себя полного идиота! Надо было послать ко мне человека. Что за команда дебилов и дегенератов.
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_06");	//Знал бы я, что Белиар меня сведет с вами, удавил бы ваших матерей еще до того, как в их тупую башку пришла мысль рожать вас! Убирайся с глаз моих!

	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_07");	//(злобно бубнит себе под нос) Мы еще с тобой погорим... Арххх...

	//Гард бьет Грега кулаком ПРОВЕРИТЬ!
	Npc_SetToFistMode(Gard);
	Npc_SetTarget(Gard, Greg);
	AI_Attack(Gard);
	B_RemoveWeapon(Gard);

	TRIA_Next(Gard);
	AI_Output(self,other,"DIA_Gard_WithGregStart_01_08");	//На будущее – если хочешь что-то сказать, говори мне в лицо и громко! Ты меня понял?

	TRIA_Next(Greg);
	AI_Output(self,other,"DIA_Gard_WithGregStart_11_09");	//Да, понял...

	DIAG_Reset();
	TRIA_Finish();
	// UNFINISHED Грег уходит в сторонку в какой-нибудь угол
	B_StartOtherRoutine(Greg, "START");
	// обычное расписанеи Гарда
	B_StartOtherRoutine(Gard, "START");
};

//NS - 19/06/2013 ===========
//  После ругани с Грегом Гард сам обращается к ГГ
//===========================
instance DIA_Gard_Start(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 0;
	condition = DIA_Gard_Start_condition;	
	information = DIA_Gard_Start_info;
	important = TRUE;
};
func int DIA_Gard_Start_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_WithGregStart)){	return TRUE;	};
};
func void DIA_Gard_Start_info()
{
		AI_Output(self,other,"DIA_Gard_Start_01_00");	//Кто к нам пожаловал? Наш спаситель собственной персоной. 
	AI_Output(other,self,"DIA_Gard_Start_15_01");	//Я не...
		AI_Output(self,other,"DIA_Gard_Start_01_02");	//Еще раз посмеешь меня перебить, и я вырежу твое сердце, зажарю на вертеле и съем, запивая бутылкой рома.
		AI_Output(self,other,"DIA_Gard_Start_01_03");	//Надеюсь, повторять не придется. Я не бросаю слова на ветер! Так что у тебя за чума на корабле? Отвечай!
	AI_Output(other,self,"DIA_Gard_Start_15_04");	//Мы не знаем. Это началось через несколько дней после того, как мы отплыли с острова некроманта...
		AI_Output(self,other,"DIA_Gard_Start_01_05");	//(перебивает) Острова некроманта? Ты имеешь ввиду Темного?
	AI_Output(other,self,"DIA_Gard_Start_15_06");	//Да. Там произошло сражение, Темный был повержен. После этого в храме Черепа произошел магический взрыв, который разрушил все вокруг.
	AI_Output(other,self,"DIA_Gard_Start_15_07");	//Когда мы отплывали, остров уже частично начал уходить под воду. 
		AI_Output(self,other,"DIA_Gard_Start_01_08");	//(задумчиво) Если ты не врешь... Хм... Надо это обмозговать... Так, ты не ответил на мой вопрос. Что с чумой?
	AI_Output(other,self,"DIA_Gard_Start_15_09");	//Так ты сам...
		AI_Output(self,other,"DIA_Gard_Start_01_10");	//(кричит) Заткни пасть и отвечай на вопрос!
	AI_Output(other,self,"DIA_Gard_Start_15_11");	//Это произошло через несколько дней после отплытия. Сначала слег Лестер, потом Мильтен. Каждый день кто-то из команды впадал в кому.
	AI_Output(other,self,"DIA_Gard_Start_15_12");	//Мы с Ватрасом, нашим магом, перепробовали разные заклинания, но все без результата. Подумав, мы решили искать помощи на одном из близлежащих островов.
	AI_Output(other,self,"DIA_Gard_Start_15_13");	//Так случилось, что это оказался именно этот остров.
		AI_Output(self,other,"DIA_Gard_Start_01_14");	//Понятно. А эта ваша чума не перекинется на нас? Ты же тоже был среди больных.
	AI_Output(other,self,"DIA_Gard_Start_15_15");	//Я отлично себя чувствую. Наверное, меня защищает Иннос, в противном случае, я был бы мертв задолго до начала чумы.
		AI_Output(self,other,"DIA_Gard_Start_01_16");	//Да, Грег мне кое-что рассказывал о твоих приключениях. Говорит, что ты даже с драконами сражался. (смеется) Хотя Грег соврет – недорого возьмет.
		AI_Output(self,other,"DIA_Gard_Start_01_17");	//Ну, да ладно. В общем, в твоих интересах как можно быстрее решить проблему с чумой. После этого ты отдаешь нам корабль, и мы уплываем.
		AI_Output(self,other,"DIA_Gard_Start_01_18");	//За это я оставлю тебя и твоих друзей в живых. По-моему, отличная сделка. (громко смеется)
	AI_Output(other,self,"DIA_Gard_Start_15_19");	//Ты так думаешь?
		AI_Output(self,other,"DIA_Gard_Start_01_20");	//Молчать! Я не давал тебе слово. Смотри, если ты не решишь проблему с чумой в ближайшее время, я решу ее сам и по-своему.
		AI_Output(self,other,"DIA_Gard_Start_01_21");	//Но, боюсь, тебе это не понравится.

	//Запись в дневнике "Остров в осаде" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Gard);
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_UnPirate);

	AI_StopProcessInfos(self);
};

//NS - 19/06/2013 ===========
//  После стартового
//===========================
instance DIA_Gard_CanIAsk(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_CanIAsk_condition;	
	information = DIA_Gard_CanIAsk_info;
	description = "Я могу задать тебе несколько вопросов?";
};
func int DIA_Gard_CanIAsk_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_Start)){	return TRUE;	};
};
func void DIA_Gard_CanIAsk_info()
{
	AI_Output(other,self,"DIA_Gard_CanIAsk_15_00");	//Я могу задать тебе несколько вопросов?
	AI_Output(other,self,"DIA_Gard_CanIAsk_15_01");	//Мне нужна информация, которая поможет решить проблему с чумой.
		AI_Output(self,other,"DIA_Gard_CanIAsk_01_02");	//Хех! Хочешь узнать, что здесь творится, чтобы потом использовать это против меня?
		AI_Output(self,other,"DIA_Gard_CanIAsk_01_03");	//Умно! Ну да не страшно, у тебя кишка тонка, чтобы обхитрить самого Гарда! Спрашивай, что хотел.
};

//NS - 19/06/2013 ===========
//  Вопросы о ситуации на острове
//===========================

// ---------------------------------
// "Как давно вы на острове?"	nr = 1
instance DIA_Gard_HowLong(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_HowLong_condition;	
	information = DIA_Gard_HowLong_info;
	description = "Как давно вы на острове?";
};
func int DIA_Gard_HowLong_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_HowLong_info()
{
	AI_Output(other,self,"DIA_Gard_HowLong_15_00");	//Как давно вы на острове?
		AI_Output(self,other,"DIA_Gard_HowLong_01_01");	//Уже около месяца, пиранью тебе в печень!
		AI_Output(self,other,"DIA_Gard_HowLong_01_02");	//Я уже ненавижу этот остров больше, чем Грега. А это уже много, Грег может подтвердить. (громко смеется)
	AI_Output(other,self,"DIA_Gard_HowLong_15_03");	//Но как случилось, что вы оказались здесь?
		AI_Output(self,other,"DIA_Gard_HowLong_01_04");	//В первый раз в жизни я, капитан Гард, попался как прыщавый мальчишка, варг тебе в койку.
		AI_Output(self,other,"DIA_Gard_HowLong_01_05");	//Я всегда считал орков не больше, чем тупым куском мяса, способным лишь на то, чтобы махать топором и кричать “Грязный морра“. Но тут они меня сделали, демон им в кишки...
		AI_Output(self,other,"DIA_Gard_HowLong_01_06");	//Мой “Ветер“ получил несколько пробоин от пушек орочьих галер и начал тонуть. Мы еле унесли ноги. Сам Белиар нам помогал выжить, не иначе.
		AI_Output(self,other,"DIA_Gard_HowLong_01_07");	//Корабль затонул практически на берегу, поэтому почти вся команда осталась цела. Ну, ничего, с моим новым кораблем... Как, говоришь, он называется?
	AI_Output(other,self,"DIA_Gard_HowLong_15_08");	//“Эсмеральда“
		AI_Output(self,other,"DIA_Gard_HowLong_01_09");	//Да! На моей “Эсмеральде“ мы найдем этих зеленых тварей и вырежем их всех до одного.
		AI_Output(self,other,"DIA_Gard_HowLong_01_10");	//Жалко, что остров некроманта разрушен, а то бы я начал именно с него. Там их было более чем достаточно, целый лагерь с шахтой, где они добывали магическую руду. 
};

// ---------------------------------
// "Почему Грег всего лишь первый помощник?"	nr = 2
instance DIA_Gard_AboutGreg(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 2;
	condition = DIA_Gard_AboutGreg_condition;	
	information = DIA_Gard_AboutGreg_info;
	description = "Почему Грег всего лишь первый помощник?";
};
func int DIA_Gard_AboutGreg_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_AboutGreg_info()
{
	AI_Output(other,self,"DIA_Gard_AboutGreg_15_00");	//Почему Грег всего лишь первый помощник?
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_01");	//А кем еще ему быть, разрази тебя гром?!
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_02");	//Если бы не его опыт, будучи когда-то капитаном, я бы не взял его на корабль даже юнгой! От этой собаки того и гляди получишь неприятности.
	AI_Output(other,self,"DIA_Gard_AboutGreg_15_03");	//Что случилось?
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_04");	//Этот выкидыш акулы решил, что может занять мое место! Ха!
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_05");	//Думал, что тут такие же полудурки, как в его бывшей команде, но он просчитался!
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_06");	//Он решил прокрасться ночью в мою каюту и тихонечко так воткнуть кинжал мне в сердце. Но я не такой дурак, как он мог бы подумать.
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_07");	//Из старой команды вместе с Грегом пришел еще Скип. Я сразу понял, что Грег обязательно начнет мутить воду, поэтому “дружески“ поговорил со Скипом.
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_08");	//После этого я знал все, что замышлял Грег. Ну и, конечно же, когда Грег завалился с ножом в руке в мою каюту, я с парнями уже поджидал его.
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_09");	//Ха! Вот была потеха! (громко смеется)
	var C_NPC Greg; Greg = Hlp_GetNpc(PIR_201_DS2P_Greg);
	// обращается к Грегу
	if (Npc_GetDistToNpc(self, Greg) < PERC_DIST_ACTIVE_MAX)
	{
		AI_TurnToNpc(self, Greg);
		AI_Output(self,other,"DIA_Gard_AboutGreg_01_10");	//Грег, твои ребра уже зажили? Ха-ха-ха!
	};
};

// ---------------------------------
// "Где мне найти целителя?"	nr = 3
instance DIA_Gard_AboutHealer(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 3;
	condition = DIA_Gard_AboutHealer_condition;	
	information = DIA_Gard_AboutHealer_info;
	description = "Где мне найти целителя?";
};
func int DIA_Gard_AboutHealer_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_AboutHealer_info()
{
	AI_Output(other,self,"DIA_Gard_AboutHealer_15_00");	//Где мне найти целителя?
		AI_Output(self,other,"DIA_Gard_AboutHealer_01_01");	//А я откуда знаю? Ты совсем дебил, что ли? Ты еще спроси, где здесь купить выпивку или переночевать!
		AI_Output(self,other,"DIA_Gard_AboutHealer_01_02");	//Включи мозги и займись делом, а то я займусь им лично! Но тогда ты мне будешь не нужен, дружочек.
};

// ---------------------------------
// "Что ты планируешь предпринять?"	nr = 4
instance DIA_Gard_AboutPlans(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 4;
	condition = DIA_Gard_AboutPlans_condition;	
	information = DIA_Gard_AboutPlans_info;
	description = "Что ты планируешь предпринять?";
};
func int DIA_Gard_AboutPlans_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_AboutPlans_info()
{
	AI_Output(other,self,"DIA_Gard_AboutPlans_15_00");	//Что ты планируешь предпринять?
		AI_Output(self,other,"DIA_Gard_AboutPlans_01_01");	//Что планирую? Убраться с этого забытого богами острова.
		AI_Output(self,other,"DIA_Gard_AboutPlans_01_02");	//Если ты не врешь, и остров некроманта ушел на дно, то мне придется поискать новое место для нашей стоянки. Но островов тут навалом, поэтому проблем не будет.
};

// ---------------------------------
// "Мне нужно золото."	nr = 5
instance DIA_Gard_NeedGold(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 5;
	condition = DIA_Gard_NeedGold_condition;	
	information = DIA_Gard_NeedGold_info;
	description = "Мне нужно золото.";
};
func int DIA_Gard_NeedGold_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk)){	return TRUE;	};
};
func void DIA_Gard_NeedGold_info()
{
	AI_Output(other,self,"DIA_Gard_NeedGold_15_00");	//Мне нужно золото.
		AI_Output(self,other,"DIA_Gard_NeedGold_01_01");	//Ха! Разорви тебя глорх, всем нужно золото!
		AI_Output(self,other,"DIA_Gard_NeedGold_01_02");	//Предлагаю вступить в наши ряды искателей приключений, и у тебя будет столько золота, что твой хребет переломится при попытке его унести! (громко смеется)
	AI_Output(other,self,"DIA_Gard_NeedGold_15_03");	//Я подумаю. А пока, может быть, у тебя найдется какая-нибудь работа для меня?
		AI_Output(self,other,"DIA_Gard_NeedGold_01_04");	//Твоя главная задача разобраться с чумой, больше тебя ничего не должно волновать! Если, конечно, тебе дорога шкура! (смеется) 
	AI_Output(other,self,"DIA_Gard_NeedGold_15_05");	//Я не думаю, что местные жители будут мне помогать за так.
		AI_Output(self,other,"DIA_Gard_NeedGold_01_06");	//А кто их будет спрашивать? Ты что, первый день как на свет вылупился? У тебя есть меч, навыки бойца, так примени их!
		AI_Output(self,other,"DIA_Gard_NeedGold_01_07");	//Или ты тряпка и никчемный хлюпик, который только и умеет чесать языком и отвлекать меня от важных дел, акула тебя за жабры!
	AI_Output(other,self,"DIA_Gard_NeedGold_15_08");	//Нет, но...
		AI_Output(self,other,"DIA_Gard_NeedGold_01_09");	//(перебивает) Ладно. Спроси у Грега, он скажет, что делать. Может быть, и от тебя будет какой толк.

};

//NS - 23/06/2013 ===========
//  Спросить про проклятый алмаз
//===========================
instance DIA_Gard_AboutDamnedDiamond(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_AboutDamnedDiamond_condition;	
	information = DIA_Gard_AboutDamnedDiamond_info;
	description = "Я хочу вернуть Лану проклятый алмаз.";
};
func int DIA_Gard_AboutDamnedDiamond_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_CanIAsk) && (MIS_DS2P_DamnSailor == LOG_Running))
	{	return TRUE;	};
};
func void DIA_Gard_AboutDamnedDiamond_info()
{
	AI_Output(other,self,"DIA_Gard_AboutDamnedDiamond_15_00");	//Я хочу вернуть Лану проклятый алмаз. 
		AI_Output(self,other,"DIA_Gard_AboutDamnedDiamond_01_01");	//А больше ты ничего не хочешь? Лану просто не повезло, причем не один раз. (смеется) Не он первый, не он последний.
	AI_Output(other,self,"DIA_Gard_AboutDamnedDiamond_15_02");	//Но...
		AI_Output(self,other,"DIA_Gard_AboutDamnedDiamond_01_03");	//(перебивает) Разговор закончен! И предупреждаю тебя: если решишь покопаться в сундуке в мое отсутствие – пожалеешь! Я два раза предупреждать не буду.
	//Запись в дневнике "Проклятый моряк"
	B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_Running,TOPIC_DS2P_DamnSailor_GardChest);
	//Диалог обрывается
	AI_StopProcessInfos(self);
};

//NS - 23/06/2013 ===========
//  "Ты хорошо устроился!"	nr = 6
//===========================
instance DIA_Gard_UAreSittingPretty(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 6;
	condition = DIA_Gard_UAreSittingPretty_condition;	
	information = DIA_Gard_UAreSittingPretty_info;
	permanent = TRUE;
	description = "Ты хорошо устроился!";
};
func int DIA_Gard_UAreSittingPretty_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_AboutDamnedDiamond)){	return TRUE;	};
};
func void DIA_Gard_UAreSittingPretty_info()
{
	AI_Output(other,self,"DIA_Gard_UAreSittingPretty_15_00");	//Ты хорошо устроился!
		AI_Output(self,other,"DIA_Gard_UAreSittingPretty_01_01");	//Ха! Конечно, так всегда было, есть и будет! Не будь я капитаном Гардом, лопни твоя селезенка!
};

//NS - 23/06/2013 ===============================
//  ГГ вскрыл сундук с алмазом
//===============================================
instance DIA_Gard_CaughtU(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_CaughtU_condition;	
	information = DIA_Gard_CaughtU_info;
	important = TRUE;
};
func int DIA_Gard_CaughtU_condition()
{
	if (Gard_ChestForced == TRUE) 
	{	return TRUE;	};
		
};
func void DIA_Gard_CaughtU_info()
{
		AI_Output(self,other,"DIA_Gard_CaughtU_01_00");	//Попался, рыбий выкидыш!
	if (Npc_KnowsInfo(other, DIA_Gard_AboutDamnedDiamond))
	{
		AI_Output(self,other,"DIA_Gard_CaughtU_01_01");	//Я так и знал, что сунешь свой длинный нос в сундук.
	};
		AI_Output(self,other,"DIA_Gard_CaughtU_01_02");	//Теперь-то я тебе кишки выпущу, недоносок!
	AI_Output(other,self,"DIA_Gard_CaughtU_15_03");	//Я не...
	//Диалог обрывается, начинается бой либо до нокаута Гарда, либо смерти ГГ
	AI_StopProcessInfos(self);
	self.flags = self.flags & ~NPC_FLAG_IMMORTAL;	//снимаем бессмертие
	B_Attack(self, other, AR_KILL, 0);
};


//NS - 23/06/2013 ===============================
//  После драки с Гардом
//===============================================
instance DIA_Gard_AfterFight(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 0;
	condition = DIA_Gard_AfterFight_condition;	
	information = DIA_Gard_AfterFight_info;
	important = TRUE;
};
func int DIA_Gard_AfterFight_condition()
{
	if ((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)) 
	{	return TRUE;	};
		
};
func void DIA_Gard_AfterFight_info()
{
		AI_Output(self,other,"DIA_Gard_AfterFight_01_00");	//Белиар тебя дери, ты где научился так сражаться?
	//(+опыт)
	B_GivePlayerXP(XP_MIS_DamnSailor_DiamondStolen);
	AI_Output(other,self,"DIA_Gard_AfterFight_15_01");	//Были хорошие учителя.
		AI_Output(self,other,"DIA_Gard_AfterFight_01_02");	//Ладно, на первый раз тебя прощаю, забирай этот чертов алмаз.
		AI_Output(self,other,"DIA_Gard_AfterFight_01_03");	//Но если ты скажешь хоть одной душе, что победил меня, я с тебя живого шкуру сниму, понял?!
	AI_Output(other,self,"DIA_Gard_AfterFight_15_04");	//Договорились.
	//Запись в дневнике "Проклятый моряк"
	B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_Running,TOPIC_DS2P_DamnSailor_DiamondGot);
	AI_StopProcessInfos(self);
	self.flags = self.flags | NPC_FLAG_IMMORTAL;	//опять включаем бессмертие (контрольный, уже должно было сработаь в B_DSG_CheckLog_OnUnconscious)
	self.aivar[AIV_LastFightComment] = TRUE;
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
};

//NS - 02/07/2013 ===============================
//  Кадар пытается убить Гарда,
// через 2 дня после того, как узнает о смерти Кары
//===============================================
instance DIA_Gard_KadarTriesToKill(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 0;
	condition = DIA_Gard_KadarTriesToKill_condition;	
	information = DIA_Gard_KadarTriesToKill_info;
	important = TRUE;
};
func int DIA_Gard_KadarTriesToKill_condition()
{
	if ((Kadar_KnowsKaraDead_Day + 2) > Wld_GetDay()) 
	{	return TRUE;	};
		
};
func void DIA_Gard_KadarTriesToKill_info()
{
	var C_NPC Kadar;	Kadar = Hlp_GetNpc(BAU_100_DS2P_KADAR);
	var C_NPC Gard;		Gard = Hlp_GetNpc(PIR_200_DS2P_Gard);
	// подключаем Кадара
	AI_Teleport(Kadar,"");	AI_GotoNpc(Kadar,Gard);
	TRIA_Invite(Kadar);
	TRIA_Start();
	
	AI_TurnToNpc(Gard,Kadar);
	AI_TurnToNpc(Kadar,Gard);
	Mdl_StartFaceAni(Kadar, "S_ANGRY",1,-1);

	TRIA_Next(Kadar);
	AI_Output(self,other,"DIA_Gard_KadarTriesToKill_10_00");	//Ты убил мою жену!

	TRIA_Next(Gard);
		AI_Output(self,other,"DIA_Gard_KadarTriesToKill_01_01");	//Я? Ты что-то путаешь, недоносок. Кто разрешил тебе ко мне лезть со своими тупыми заявлениями. Пошел вон!

	TRIA_Next(Kadar);
	AI_Output(self,other,"DIA_Gard_KadarTriesToKill_10_02");	//За это я покараю тебя, как Иннос карает всех исчадий Белиара!

	TRIA_Next(Gard);
		AI_Output(self,other,"DIA_Gard_KadarTriesToKill_01_03");	//Ты что, грога обожрался, идиот? Если ты сейчас же не заткнешь свою пасть и не уберешься из ратуши, я тебе все кишки на клинок намотаю!

	TRIA_Next(Kadar);
	AI_Output(self,other,"DIA_Gard_KadarTriesToKill_10_04");	//Кара, прости меня!

	DIAG_Reset();
	TRIA_Finish();

	//Кадар нападает (дать ему меч, а не палку) ессно погибает
	CreateInvItem(Kadar, ItMw_ShortSword3);
	AI_EquipBestMeleeWeapon(Kadar);
	
	B_Attack(Kadar,Gard,AR_KILL,1);
	B_Attack(Gard,Kadar,AR_KILL,1);
};

//Redleha - 03/03/2016 ==========================
//  При убийстве хоть одного пирата
// 
//===============================================
instance DIA_Gard_GGKillPirat(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_GGKillPirat_condition;	
	information = DIA_Gard_GGKillPirat_info;
	important = TRUE;
};
func int DIA_Gard_GGKillPirat_condition()
{
	if (CRIME_GG_KillPirat_self_inVillage_once)
	{	return TRUE;	};
};
func void DIA_Gard_GGKillPirat_info()
{
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_00");	//Эй ты, чумная крыса, иди сюда ближе.	
	AI_Output(other,self,"DIA_Gard_GGKillPirat_15_00");	//Что тебе надо?
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_01");	//Одна птичка нашептала мне, что один из моих людей мертв и что причастен к этому именно ты.
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_02");	//Учти, если еще хоть один мой человек окажется на том свете раньше срока, я не только твои собственные кишки тебе на шею намотаю, но и глаза на одно место натяну.
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_03");	//Понял, гоблиново отродье?
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_04");	//А также я начну убивать сначала заложников, а потом и жителей деревни. Ты, как я погляжу, человек совестливый, поэтому все эти смерти лягут на тебя.
	AI_Output(self,other,"DIA_Gard_GGKillPirat_01_05");	//А теперь катись отсюда к черту!
	AI_StopProcessInfos(self);
	CRIME_GG_KillPirat_Cnt_now = CRIME_PiratesKilled_Cnt;	//Запомнили кол-во убитых пиратов
};
//Redleha - 03/03/2016 ==========================
//  "При убийстве хоть одного пирата" - дополнение
// 
//===============================================
instance DIA_Gard_GGKillPiratDop(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_GGKillPiratDop_condition;	
	information = DIA_Gard_GGKillPiratDop_info;
	important = TRUE;
};
func int DIA_Gard_GGKillPiratDop_condition()
{
	if (Npc_KnowsInfo(self,DIA_Gard_GGKillPirat))
	{	return TRUE;	};
};
func void DIA_Gard_GGKillPiratDop_info()
{
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_00");	//Стой, мракорисова душонка! Стой, сказал!
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_01");	//Чуть не забыл: так как ты убил МОЕГО человека, ты должен заплатить мне штраф.
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_15_00");	//Сколько?
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_02");	//1000 золотых монет.
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_15_01");	//ЧТО?! Это же чертова уйма денег!
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_03");	//Зато в следующий раз будешь думать, прежде чем махать своей железякой. Будешь ли ты платить?
	Info_ClearChoices(DIA_Gard_GGKillPiratDop);
	Info_AddChoice(DIA_Gard_GGKillPiratDop,"Вот, держи.",DIA_Gard_GGKillPiratDop_Pay);
	Info_AddChoice(DIA_Gard_GGKillPiratDop,"У меня нет с собой столько денег.",DIA_Gard_GGKillPiratDop_NoPay);
};
func void DIA_Gard_GGKillPiratDop_Pay()
{
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_Pay_15_00");	//Вот, держи.
	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_Pay_01_00");	//Отлично! Давай сюда!
		B_GiveInvItems(other,self,ItMi_Gold,1000);
		CRIME_PiratesKilled_Paid = CRIME_PiratesKilled_Cnt;
	}
	else
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_Pay_01_01");	//Сначала собери достаточную сумму, придурок! Если я пират, это еще не значит, что я считать не умею!
	};	
};
func void DIA_Gard_GGKillPiratDop_NoPay()
{
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_NoPay_15_00");	//У меня нет с собой столько денег.
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_NoPay_01_00");	//Тогда найди! Быстро! Чтобы деньги в самом скором времени были у меня!
	//GG_Dolg_PeredGardom_ZaKillPirat = TRUE;
};
//Redleha - 04/03/2016 ====================================
//  Оплата штрафа за убийство, если не убил новых пиратов.
// 
//=========================================================
instance DIA_Gard_PlataShtraf(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_PlataShtraf_condition;	
	information = DIA_Gard_PlataShtraf_info;
	permanent = TRUE;
	description = "Вот, держи штраф";
};
func int DIA_Gard_PlataShtraf_condition()
{
	if((CRIME_PiratesKilled_Cnt >= CRIME_PiratesKilled_Paid) && 
		(CRIME_GG_KillPirat_Cnt_now == CRIME_PiratesKilled_Cnt) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
	{	return TRUE;	};
};
func void DIA_Gard_PlataShtraf_info()
{
	AI_Output(other,self,"DIA_Gard_GGKillPiratDop_Pay_15_00");	//Вот, держи.
	AI_Output(self,other,"DIA_Gard_GGKillPiratDop_Pay_01_00");	//Отлично! Давай сюда!
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	CRIME_PiratesKilled_Paid = CRIME_PiratesKilled_Cnt;
};
//Redleha - 04/03/2016 ====================================
//  Если убил ещё пирата после предупреждения
// 
//=========================================================
var int DIA_Gard_GGKillPiratTwice_first;	//ГГ повторно нарушил. Убиваем ЛуЛу в пещере
var int DIA_Gard_GGKillPiratTwice_second;	//ГГ повторно нарушил. Убиваем Нарева и Виолу в пещере
var int DIA_Gard_GGKillPiratTwice_third;	//ГГ повторно нарушил. Всё, капец. Пираты ненавидят ГГ.

instance DIA_Gard_GGKillPiratTwice(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_GGKillPiratTwice_condition;	
	information = DIA_Gard_GGKillPiratTwice_info;
	important = TRUE;
};
func int DIA_Gard_GGKillPiratTwice_condition()
{
	if (Npc_KnowsInfo(self,DIA_Gard_GGKillPirat) && (CRIME_PiratesKilled_Cnt > CRIME_GG_KillPirat_Cnt_now))
	{	return TRUE;	};
};
func void DIA_Gard_GGKillPiratTwice_info()
{
	if(!DIA_Gard_GGKillPiratTwice_first)
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_00");	//Я тебя предупреждал, что если еще хоть один мой человек умрет, то я начну убивать заложников?
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_01");	//Сам виноват.
		AI_StopProcessInfos(self);
		B_KillNpc(BAU_109_DS2P_Lulu);	//МЕТКА!
		DIA_Gard_GGKillPiratTwice_first = TRUE;
	}
	else if(DIA_Gard_GGKillPiratTwice_first && !DIA_Gard_GGKillPiratTwice_second)
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_00");	//Ты совсем тупой, рыбье отродье?! Одна смерть селянина уже висела на твоей совести!
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_01");	//Теперь пожинай плоды своей глупости!
		AI_StopProcessInfos(self);
		B_KillNpc(BAU_111_DS2P_Narev);	//МЕТКА!
		B_KillNpc(BAU_110_DS2P_Viola);	//МЕТКА!
		DIA_Gard_GGKillPiratTwice_second = TRUE;
	}
	else if(DIA_Gard_GGKillPiratTwice_second && !DIA_Gard_GGKillPiratTwice_third)
	{
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_00");	//Ты я погляжу, щенок, по-хорошему не понимаешь. Значит, будет по-плохому.
		AI_Output(self,other,"DIA_Gard_GGKillPiratDop_01_01");	//Давно уже чесались руки тебе кишки наружу выпустить. А потом уже можно и твоими друзьями заняться.
		B_Attack(self,other,AR_KILL,1);
		/*
		UNFINISH
		Здесь идёт драка, присваивается ненависть пиратов к ГГ и Ко. События с Ватрасом на корабле. Пока оставим.
		Пришла пора выносить всех пиратов
		*/
		B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_AllPiratesMyEnemies);
		Wld_SetGuildAttitude(GIL_PIR,ATT_HOSTILE,GIL_VLK);
		Wld_SetGuildAttitude(GIL_PIR,ATT_HOSTILE,GIL_KDF);
		Wld_SetGuildAttitude(GIL_PIR,ATT_HOSTILE,GIL_KDW);
		//Убиваем пиратов у корабля.
		B_StartOtherRoutine(PIR_209_DS2P_Vales,"DEATH");
		B_StartOtherRoutine(PIR_207_DS2P_LanSkeleton,"DEATH");
		B_KillNpc(PIR_207_DS2P_LanSkeleton);
		B_KillNpc(PIR_209_DS2P_Vales);
		WAR_HAS_COME = TRUE;
	};
	CRIME_GG_KillPirat_Cnt_now = CRIME_PiratesKilled_Cnt;
};


/* UNFINISHED
При убийстве хоть одного пирата (неважно – безымянный это НПС или именной) при следующем разговоре с Гардом.

Гард: Эй ты, чумная крыса, иди сюда ближе.
ГГ: Что тебе надо?
Гард: Одна птичка нашептала мне, что один из моих людей мертв и что причастен к этому именно ты. Учти, если еще хоть один мой человек окажется на том свете раньше срока, я не только твои собственные кишки тебе на шею намотаю, но и глаза на одно место натяну. Понял, гоблиново отродье? А также я начну убивать сначала заложников, а потом и жителей деревни. Ты, как я погляжу, человек совестливый, поэтому все эти смерти лягут на тебя. А теперь катись отсюда к черту!
Диалог обрывается, но Гард тут же снова заводит разговор.
Гард: Стой, мракорисова душонка! Стой, сказал! Чуть не забыл: так как ты убил МОЕГО человека, ты должен заплатить мне штраф.
ГГ: Сколько?
Гард: 1000 золотых монет.
ГГ: ЧТО?! Это же чертова уйма денег!
Гард: Зато в следующий раз будешь думать, прежде чем махать своей железякой. Будешь ли ты платить?

 Появляются подтопики
Вот, держи.
У меня нет с собой столько денег.

У меня нет с собой столько денег.
ГГ: У меня нет с собой столько денег.
Гард: Тогда найди! Быстро! Чтобы деньги в самом скором времени были у меня!
Диалог обрывается.

Вот, держи.
ГГ: Вот, держи.
Гард: Отлично! Давай сюда!
Либо, если денег не хватает.
Гард: Сначала собери достаточную сумму, придурок! Если я пират, это еще не значит, что я считать не умею!

*/

// Активируется, если ГГ поговорил с Адо насчет Лулу
// nr = 1

instance DIA_Gard_WhereIsLulu(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_WhereIsLulu_condition;	
	information = DIA_Gard_WhereIsLulu_info;
	permanent = FALSE;
	description = "(по поводу Лулу)";
};

func int DIA_Gard_WhereIsLulu_condition()
{
	if ((MIS_DS2P_TomsLetter == Log_Running) && Npc_KnowsInfo(other,DIA_Ado_WhereIsLulu))
	{	
		return TRUE;	
	};
};

func void DIA_Gard_WhereIsLulu_info()
{
	AI_Output(other,self,"DIA_Gard_WhereIsLulu_15_00");	//Есть вопрос.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu_01_01");	//Чего тебе, слизняк? Не видишь, что я очень занят?
	AI_Output(other,self,"DIA_Gard_WhereIsLulu_15_02");	//Это не займет много времени.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu_01_03");	//Аргх, все равно не отстанешь. Давай, только быстро!
	AI_Output(other,self,"DIA_Gard_WhereIsLulu_15_04");	//Вы действительно решили казнить селянку?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu_01_05");	//Пришел ходатайствовать за нее? Только зря, я все равно лично обезглавлю эту тварь.
	AI_Output(other,self,"DIA_Gard_WhereIsLulu_15_06");	//Но за что?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu_01_07");	//Не твое дело, щенок! А теперь проваливай, не трать попусту мое время.
	AI_StopProcessInfos(self);
};
	
// Активируется, если ГГ повторно обращается к Гарду по поводу Лулу
// nr = 1

instance DIA_Gard_WhereIsLulu2(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_WhereIsLulu2_condition;	
	information = DIA_Gard_WhereIsLulu2_info;
	permanent = FALSE;
	description = "(переубедить)";
};

func int DIA_Gard_WhereIsLulu2_condition()
{
	if ((MIS_DS2P_TomsLetter == Log_Running) && Npc_KnowsInfo(other,DIA_Ado_WhereIsLulu))
	{	
		return TRUE;	
	};
};

func void DIA_Gard_WhereIsLulu2_info()
{
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_00");	//Я еще не закончил.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_01");	//Ты еще здесь, щенок? Все, ты меня достал.
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_02");	//(миролюбиво) Погоди, подраться мы всегда успеем. А вот поговорить надо.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_03");	//(рычит) Ох, чтоб тебя Белиар сожрал!
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_04");	//Ты, конечно, привык иметь дело с матросами и захваченными в плен пассажирами, за которыми уже никто не стоит. Но казнив девушку, ты сам себя обречешь на поражение.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_05");	//(зло) Что за вздор?!!
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_06");	//Подумай сам, крестьяне доведены до крайности действиями твоим головорезов. Если ты дашь им повод, то они взбунтуются, ударят в спину, а там подоспеют и беглые охотники. Думаешь, смерть твоя будет легкой в этом случае?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_07");	//Аргх, что тебе от меня надо, слизняк?
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_08");	//Я хочу, чтобы ты отменил казнь. Пойми, ты сам себе роешь этим могилу.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_09");	//Тебе-то какое дело, мракорисова отрыжка?
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_10");	//Не люблю лишней крови, а ее будет много, если произойдет бунт, погибнет много хороших людей.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_11");	//Я все равно не отступлюсь, даже если придется сдохнуть!
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_12");	//Может, я могу для тебя что-то сделать? Я тебе окажу услугу, а ты отпустишь Лулу.
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_13");	//(категорично) Нет!.. (задумчиво) Хотя… да. Есть кое-что. Если сделаешь это, то я верну девушку к остальным пленникам.
	AI_Output(other,self,"DIA_Gard_WhereIsLulu2_15_14");	//Что надо сделать?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_15");	//(ухмыляясь) Изначально этой казнью я хотел, чтобы охотники сами раскрыли себя, но у меня появилась идея получше. (кровожадно) Ты пойдешь в лес, найдешь там этих беглецов и убьешь их, а мне принесешь головы этих кретинов. Усек?
	AI_Output(self,other,"DIA_Gard_WhereIsLulu2_01_16");	//И да, возражения не принимаются, раз уж сам захотел. Ха-ха-ха!
	B_DSG_Log_OpenClose(TOPIC_DS2P_TomsLetter,LOG_MISSION,LOG_Running,TOPIC_DS2P_TomsLetter_LuluIsGone);
	// Создаем головы в инвентаре Густава, Джина, Фарта и Тома, которые нужны Гарду
	CreateInvItems(Tom,ItMi_DS2P_HuntersHead,1);
	CreateInvItems(Jinn,ItMi_DS2P_HuntersHead,1);
	CreateInvItems(Fart,ItMi_DS2P_HuntersHead,1);
	CreateInvItems(Gustav,ItMi_DS2P_HuntersHead,1);
	AI_StopProcessInfos(self);
};

// Активируется, взят квест "Найти сбежавших охотников", охотники убиты и у ГГ есть их головы
// nr = 1

instance DIA_Gard_HuntersIsKilled(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_HuntersIsKilled_condition;	
	information = DIA_Gard_HuntersIsKilled_info;
	permanent = FALSE;
	description = "Я выполнил твое поручение.";
};

func int DIA_Gard_HuntersIsKilled_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && (Npc_HasItems(other,ItMi_DS2P_HuntersHead) >= 4))
	{	
		return TRUE;	
	};
};

func void DIA_Gard_HuntersIsKilled_info()
{
	AI_Output(other,self,"DIA_Gard_HuntersIsKilled_15_00");	//Я выполнил твое поручение. Вот их головы.
	// Отдаем головы Гарду
	B_GiveInvItems(other,self,ItMi_DS2P_HuntersHead,4);
	AI_Output(self,other,"DIA_Gard_HuntersIsKilled_01_01");	//Ха! Эти жалкие черви посмели прятаться от меня, теперь их тела будут кормить червей, а головы будут покоиться на кольях перед ратушей, чтобы все остальные знали, чего будет стоить им неповиновение.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Success,TOPIC_DS2P_FindEscapedHunters_HuntersIsKilled);
	B_GivePlayerXP(XP_MIS_DS2P_FindEscapedHunters);
	EscapedHunters_QuestComplete = Wld_GetDay();
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Найти сбежавших охотников", все охотники живы, а в инвентаре у ГГ есть 4 фальшивых головы
// nr = 1

instance DIA_Gard_SelfMadeHeads(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_SelfMadeHeads_condition;	
	information = DIA_Gard_SelfMadeHeads_info;
	permanent = FALSE;
	description = "Охотники мертвы.";
};

func int DIA_Gard_SelfMadeHeads_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && (Npc_HasItems(other,ItMi_DS2P_HuntersHead_Selfmade_Illusion) >= 4)
		 && !Npc_IsDead(Gustav) && !Npc_IsDead(Tom) && !Npc_IsDead(Jinn) && !Npc_IsDead(Fart))
	{	
		return TRUE;	
	};
};

func void DIA_Gard_SelfMadeHeads_info()
{
	AI_Output(other,self,"DIA_Gard_SelfMadeHeads_15_00");	//Охотники мертвы. Вот их головы.
	// Отдаем фальшивые головы Гарду
	B_GiveInvItems(other,self,ItMi_DS2P_HuntersHead_Selfmade_Illusion,4);
	//Удаляем головы
	Npc_RemoveInvItems(self,ItMi_DS2P_HuntersHead_Selfmade_Illusion,4);
	AI_Output(self,other,"DIA_Gard_SelfMadeHeads_01_01");	//Какого демона так долго, недоумок?! Я не обязан ждать!
	AI_Output(other,self,"DIA_Gard_SelfMadeHeads_15_02");	//Они хорошо прятались. Схоронились недалеко от затопленного храма. Кое-как их нашел.
	AI_Output(self,other,"DIA_Gard_SelfMadeHeads_01_03");	//Вот так прямо взял и убил их?
	AI_Output(other,self,"DIA_Gard_SelfMadeHeads_15_04");	//Они напали на меня. Видимо, приняли за одного из пиратов. Я защищался.
	AI_Output(self,other,"DIA_Gard_SelfMadeHeads_01_05");	//К черту этих неудачников! Теперь всякое неповиновение будет жестоко караться, эти тупорылые крестьяне даже пикнуть не смогут.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Success,TOPIC_DS2P_FindEscapedHunters_Success);
	B_GivePlayerXP(XP_MIS_DS2P_FindEscapedHunters);
	Hunters_IsNotKilled = TRUE;
	EscapedHunters_QuestComplete = Wld_GetDay();
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Заговор"
// nr = 1

instance DIA_Gard_AboutConspiracy(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_AboutConspiracy_condition;	
	information = DIA_Gard_AboutConspiracy_info;
	permanent = FALSE;
	important = TRUE;
	description = " ";
};

func int DIA_Gard_AboutConspiracy_condition()
{
	if (MIS_DS2P_Conspiracy == Log_Running)
	{	
		return TRUE;	
	};
};

func void DIA_Gard_AboutConspiracy_info()
{
	AI_Output(self,other,"DIA_Gard_AboutConspiracy_01_00");	//Эй ты, помойное семя, иди сюда живо! О чем вы трепались с этим смутьяном? Отвечать!
	Info_ClearChoices(DIA_Gard_AboutConspiracy);
	Info_AddChoice(DIA_Gard_AboutConspiracy,"Грег предложил мне одно дело.",DIA_Gard_AboutConspiracy_Alternative);
	Info_AddChoice(DIA_Gard_AboutConspiracy,"Посидели, выпили рому. Вспомнили былое.",DIA_Gard_AboutConspiracy_Nothing);
};

// Запускается, если выбрать реплику "Посидели, выпили рому. Вспомнили былое." в диалоге с Гардом

func void DIA_Gard_AboutConspiracy_Nothing()
{
	AI_Output(other,self,"DIA_Gard_AboutConspiracy_Nothing_15_00");	//Посидели, выпили рому. Вспомнили былое.
	AI_Output(self,other,"DIA_Gard_AboutConspiracy_Nothing_01_01");	//Самый умный, да? Щенок! Если узнаю, что вы что-то мутите против меня, – я вам обоим кишки на копья намотаю. Усек?
	AI_Output(other,self,"DIA_Gard_AboutConspiracy_Nothing_15_02");	//Вполне.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Running,TOPIC_DS2P_Conspiracy_GardSee);
	Conspiracy_Mode = 1;
	AI_StopProcessInfos(self);
};
	
// Запускается, если выбрать реплику "Грег предложил мне одно дело." в диалоге с Гардом

func void DIA_Gard_AboutConspiracy_Alternative()
{	
	AI_Output(other,self,"DIA_Gard_AboutConspiracy_Alternative_15_00");	//Грег предложил мне одно дело.
	AI_Output(self,other,"DIA_Gard_AboutConspiracy_Alternative_01_01");	//А ну быстро отвечай какое! Иначе будешь умирать долго и мучительно.
	AI_Output(other,self,"DIA_Gard_AboutConspiracy_Alternative_15_02");	//Он предложил мне помочь ему сместить тебя с поста капитана. Для этого он хочет заручиться поддержкой команды и устроить совет пиратов.
	AI_Output(self,other,"DIA_Gard_AboutConspiracy_Alternative_01_03");	//ЧТО?!! Ах ты ж отрыжка шныга, помесь крысы и падальщика! Я тебе покажу, как мутить воду вокруг меня!
	B_Attack(Gard,Greg,AR_NONE,0);
	Conspiracy_Mode = 2;
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Заговор", выбрана сторона Гарда и Гард убил Грега
// nr = 1

instance DIA_Gard_GregIsDead(C_Info)
{
	npc = PIR_200_DS2P_Gard;
	nr = 1;
	condition = DIA_Gard_GregIsDead_condition;	
	information = DIA_Gard_GregIsDead_info;
	permanent = FALSE;
	important = TRUE;
	description = " ";
};

func int DIA_Gard_GregIsDead_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && (Conspiracy_Mode == 2) && Npc_IsDead(Greg))
	{	
		return TRUE;	
	};
};
	
func void DIA_Gard_GregIsDead_info()
{
	AI_Output(self,other,"DIA_Gard_GregIsDead_01_00");	//Итак, с этим смутьяном покончено. Своими нелепыми выходками он окончательно достал меня. Осталось только решить, что делать с тобой.
	AI_Output(other,self,"DIA_Gard_GregIsDead_15_01");	//А что еще остается? Только отпустить. Я же честно рассказал тебе о планах Грега. Кроме того, если я не решу вопрос с чумой на корабле, то никто отсюда отплыть не сможет.
	AI_Output(self,other,"DIA_Gard_GregIsDead_01_02");	//Хм, ладно! Живи пока. И поторопись – с каждым днем, что я провожу на этом проклятом острове, во мне крепнет желание перерезать кому-нибудь глотку.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,Log_Mission,Log_Running,TOPIC_DS2P_Conspiracy_GregIsDead);
	AI_StopProcessInfos(self);
};
	
	
	