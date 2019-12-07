instance DIA_LanSkeleton_EXIT(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 999;
	permanent = TRUE;
	condition = DIA_LanSkeleton_EXIT_condition;	
	information = DIA_LanSkeleton_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_LanSkeleton_EXIT_condition(){	return TRUE;};
func void DIA_LanSkeleton_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_LanSkeleton_Start(C_Info)	//Начальный диалог на пристани	//nr = 1;
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	condition = DIA_LanSkeleton_Start_condition;	
	information = DIA_LanSkeleton_Start_info;
	important = TRUE;
};
func int DIA_LanSkeleton_Start_condition(){	if(Npc_IsInState(self,ZS_Talk)){return TRUE;}; };
func void DIA_LanSkeleton_Start_info()
{	
	AI_Output(self,other,"DIA_LanSkeleton_Start_13_00");	//Чего вылупился, скелета не видел что ли?
	AI_Output(other,self,"DIA_LanSkeleton_Start_15_00");	//Скелетов я встречал достаточно, а вот говорящего впервые.
	AI_Output(self,other,"DIA_LanSkeleton_Start_13_01");	//Ну теперь увидел, проходи мимо!
	AI_StopProcessInfos(self);
};
//----
//Появляется после стартового	//nr = 1;
//----
instance DIA_LanSkeleton_WhatIsYourName(C_Info)	//Как тебя зовут?
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	condition = DIA_LanSkeleton_WhatIsYourName_condition;	
	information = DIA_LanSkeleton_WhatIsYourName_info;
	description = "Как тебя зовут?";
};
func int DIA_LanSkeleton_WhatIsYourName_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_Start)){return TRUE;};
};	
func void DIA_LanSkeleton_WhatIsYourName_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_WhatIsYourName_15_00");	//Как тебя зовут?
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_00");	//А тебе какое дело до моего имени?
	AI_Output(other,self,"DIA_LanSkeleton_WhatIsYourName_15_01");	//Просто хочу быть вежливым.
	AI_PlayAni(self,"R_SCRATCHHEAD");
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_01");	//(пристально смотрит) Ладно. Я смотрю, ты не собираешься надо мной подшучивать по поводу моей внешности. Можешь звать меня Лан.
	AI_Output(other,self,"DIA_LanSkeleton_WhatIsYourName_15_02");	//А что, многие над тобой подшучивают?
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_02");	//Да почти вся команда. Если бы не Гард, давно бы вырезал всех до одного.
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_03");	//Все равно они ничего не смогли бы со мной сделать, я же проклят, и смерти мне не видать как своих ушей. Впрочем, у меня и ушей то нет...
	AI_Output(other,self,"DIA_LanSkeleton_WhatIsYourName_15_03");	//Расскажи, что случилось.
	AI_Output(self,other,"DIA_LanSkeleton_WhatIsYourName_13_04");	//Тебя это не касается, не лезь не в свое дело!
	AI_StopProcessInfos(self);
};
//
//Появляется после предыдущего	//nr = 1;
//
instance DIA_LanSkeleton_TellMeHowYouBecameSkeleton(C_Info)	//Расскажи, как ты стал скелетом?
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	condition = DIA_LanSkeleton_TellMeHowYouBecameSkeleton_condition;	
	information = DIA_LanSkeleton_TellMeHowYouBecameSkeleton_info;
	description = "Расскажи, как ты стал скелетом?";
};
func int DIA_LanSkeleton_TellMeHowYouBecameSkeleton_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_WhatIsYourName)){return TRUE;};
};	
func void DIA_LanSkeleton_TellMeHowYouBecameSkeleton_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_00");	//Расскажи, как ты стал скелетом?
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_00");	//Ну чего ты до меня докопался?! Тебе что, больше всех надо, проглоти тебя спрут?!
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_01");	//Нет, возможно, я смогу тебе помочь. Думаю, мы можем быть полезны друг другу.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_01");	//Не знаю, как ты можешь мне помочь... Ну ладно.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_02");	//В общем, это было лет пять назад. Тогда я промышлял на ”Черной Каракатице” вместе с капитаном Барабаром, грозой всех Южных островов!
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_03");	//Вся округа нас боялась, даже боевые корабли паладинов не решались с нами связываться.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_04");	//Так вот, однажды Барабар решил взять карт-бланш.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_05");	//Один из пленных матросов рассказал нам об одной пещерке на дальних рифах, где, как говорят местные поверья, спрятаны несметные сокровища.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_02");	//И вы, конечно же, отправились туда.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_06");	//А как же!
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_07");	//Этот моряк так заливал, что у Барабара даже слюна побежала, пока он слушал о количестве золота и самоцветах, спрятанных там.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_08");	//В общем, через неделю мы были на месте. Оказывается, моряк не соврал, и пещера там все же нашлась.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_09");	//Правда, эта скотина не сказал, что охраняют эту пещеру проклятые. Хорошо, что мы его повесили на рее загодя, чтобы он больше никому не сболтнул о наших планах.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_03");	//Ваша алчность вас и погубила.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_10");	//(грустно) Ты прав.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_11");	//Оказывается, те призраки, что охраняли пещеру, были некогда такими же как мы искателями приключений на свою задницу.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_12");	//И до тех пор, пока не придут следующие охотники за сокровищами, чтобы попробовать взять эти богатства, они будут вечными стражами этой пещеры.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_13");	//Так они провели не одну тысячу лет! Ну а дальше все, думаю, понятно...
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_14");	//Они обрели покой, а мы вместе Барабаром стали проклятыми.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_04");	//И как тебе удалось выбраться из этой передряги? Почему ты не сторожишь эту пещеру?
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_15");	//(хитро улыбается) А я не пошел со всеми! Я сразу смекнул, что тут что-то неладно, и притворился больным.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_16");	//Сказал капитану, что у меня скрутило желудок, и если он меня возьмет с собой, то вонь будет такая, что глаза из орбит вылезут. (смеется)
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_17");	//И в подтверждение своих слов ”дунул” так, что капитан вылетел из каюты как ужаленный. Не зря же я перед этим три дня ром хлебал.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_05");	//Если ты не пошел с остальными, то почему ты тоже проклят?
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_18");	//Почему, почему?! Потому что ночью Барабар с командой вернулись, но уже в новом обличье.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_19");	//Они сказали, что если я не приведу новых ”стражей”, то они убьют меня!
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_20");	//Я, естественно, согласился, надеясь поскорее убраться отсюда и забыть как страшный сон.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_21");	//Но Барабар был далеко не дурак. Он наслал проклятие и на меня и дал один из алмазов из сокровищ пещеры.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_22");	//Пока этот алмаз со мной, я выгляжу как человек, но если перестать его носить с собой, я превращаюсь в такого же стража, как и вся команда.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_06");	//Я так понимаю, ты лишился этого алмаза.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_23");	//Какая прозорливость!
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_24");	//Да, его забрал Гард. Как-то он увидел, что я держу его украдкой в руке. Он посчитал, что это часть добычи, которою я прикарманил.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_25");	//Потом-то он все понял, но алмаз так и не отдал.
	
	AI_Output(other,self,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_15_07");	//Так кто тебе мешает забрать алмаз? Ты же мертвец, тебя невозможно убить.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_26");	//Не все так просто. Я страж сокровищ, поэтому тот, кто обладает ими, становится моим хозяином.
	AI_Output(self,other,"DIA_LanSkeleton_TellMeHowYouBecameSkeleton_13_27");	//Я не могу противиться его воли, даже если бы сильно захотел. Поэтому-то я и терплю все эти издевательства и насмешки всей команды.
};
//
//Появляется после предыдущего	//nr = 1;
//
instance DIA_LanSkeleton_IllTryToHelpYou(C_Info)	//Я попробую помочь тебе.
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	condition = DIA_LanSkeleton_IllTryToHelpYou_condition;	
	information = DIA_LanSkeleton_IllTryToHelpYou_info;
	description = "Я попробую помочь тебе.";
};
func int DIA_LanSkeleton_IllTryToHelpYou_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_TellMeHowYouBecameSkeleton)){return TRUE;};
};	
func void DIA_LanSkeleton_IllTryToHelpYou_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_IllTryToHelpYou_15_00");	//Я попробую помочь тебе. Надеюсь, ты мне тоже в будущем не откажешь в услуге.
	AI_Output(self,other,"DIA_LanSkeleton_IllTryToHelpYou_13_00");	//Правда? Если ты вернешь мне алмаз, я все сделаю, что попросишь!
	B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_Running,TOPIC_DS2P_DamnSailor_Start);
};
//
//Появляется после стартового	//nr = 3;
//
instance DIA_LanSkeleton_WhyAreUSoAggressive(C_Info)	//Ты почему такой агрессивный?
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 3;
	permanent = FALSE;
	condition = DIA_LanSkeleton_WhyAreUSoAggressive_condition;	
	information = DIA_LanSkeleton_WhyAreUSoAggressive_info;
	description = "Ты почему такой агрессивный?";
};
func int DIA_LanSkeleton_WhyAreUSoAggressive_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_Start) && (MIS_DS2P_DamnSailor != LOG_SUCCESS)){return TRUE;};
};	
func void DIA_LanSkeleton_WhyAreUSoAggressive_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_WhyAreUSoAggressive_15_00");	//Ты почему такой агрессивный?
	AI_Output(self,other,"DIA_LanSkeleton_WhyAreUSoAggressive_13_00");	//А ты попробуй побыть в моей шкуре, еще и кусаться начнешь!
	AI_StopProcessInfos(self);
};
//
//Появляется после стартового (постоянный)	//nr = 4;
//
instance DIA_LanSkeleton_DidYouNotTireBeGuard(C_Info)	//Не устал караулить?
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 4;
	permanent = TRUE;
	condition = DIA_LanSkeleton_DidYouNotTireBeGuard_condition;	
	information = DIA_LanSkeleton_DidYouNotTireBeGuard_info;
	description = "Не устал караулить?";
};
func int DIA_LanSkeleton_DidYouNotTireBeGuard_condition(){	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_Start)){return TRUE;};
};	
func void DIA_LanSkeleton_DidYouNotTireBeGuard_info()
{	
	AI_Output(other,self,"DIA_LanSkeleton_DidYouNotTireBeGuard_15_00");	//Не устал караулить?
	AI_Output(self,other,"DIA_LanSkeleton_DidYouNotTireBeGuard_13_00");	//Приказы Гарда не обсуждаются!
	AI_StopProcessInfos(self);
};

//NS - 23/06/2013 ===========
// Вернуть Лану алмаз, если есть
//===========================
instance DIA_LanSkeleton_ReturnDiamond(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 5;
	condition = DIA_LanSkeleton_ReturnDiamond_condition;	
	information = DIA_LanSkeleton_ReturnDiamond_info;
	description = "Я забрал твой алмаз у Гарда.";
};
func int DIA_LanSkeleton_ReturnDiamond_condition(){	
	if(Npc_HasItems(other,ITMI_DS2P_CursedDiamond) > 0){return TRUE;};
};	
func void DIA_LanSkeleton_ReturnDiamond_info()
{
	var int x;
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_00");	//Я забрал твой алмаз у Гарда.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_DamnSailor_Success);
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_01");	//Ты шутишь? Давай его скорее сюда.
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_02");	//Не торопись. Сначала награда.
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_03");	//Ладно, Белиар с тобой. Вот, держи золото.
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_04");	//А может быть у тебя есть что-нибудь более стоящее, чем пара сотен монет?
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_05");	//О чем ты?
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_06");	//Ты же сам говорил, что тебе удалось прикоснуться к несметным сокровищам.
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_07");	//Ты чем меня слушал? Я говорил, что не покидал корабль даже ни на минуту!
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_08");	//Я думаю, ты врешь. Чтобы пират спокойно сидел на корабле, когда вся команда отправилась за сокровищами – это сказка.
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_09");	//Аргхх! Ну да, я отлучался на пару минут, но это не значит, что мне удалось забрать что-нибудь ценное.
	AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_10");	//Ну, нет и нет. Значит, алмаз останется у меня.
	//ГГ разворачивается
	AI_TurnAway(other, self);
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_11");	//Стой!
	//ГГ поворачивается назад
	AI_TurnToNpc(other, self);
		AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_12");	//Ладно, твоя взяла. 

	//Если ГГ еще не спер карту
	if (Npc_HasItems(self, ItWr_DS2P_Map_LanSkeleton))
	{
			AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_13");	//Возьми эту карту. Тут указано, где я спрятал сокровища проклятой пещеры. Это все, что у меня есть.
		//Дает «Карту сокровищ Лана»
		x = 1; if (x == 1) {
			B_GiveInvItem_red(self,other,ItWr_DS2P_Map_LanSkeleton,1,35);
		};
		AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_14");	//Вот это другой разговор. Забирай свой алмаз.
	}
	//Если ГГ спер карту
	else
	{
			AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_15");	//У меня была карта сокровищ, но какая-то скотина украла ее у меня. Найти бы эту сволочь...
			AI_Output(self,other,"DIA_LanSkeleton_ReturnDiamond_13_16");	//Но у меня осталось немного простых алмазов. Поверь, это все, что у меня есть.
		AI_Output(other,self,"DIA_LanSkeleton_ReturnDiamond_15_17");	//Ладно, я тебе верю.
		//Дает 4 обычных алмаза для продажи
		x = 2; if (x == 2) {
			B_GiveInvItem_red(self,other,ItMi_DS_Almaz,4,35);
		};
	};
	//забирает проклятый алмаз
	x = 3; if (x == 3) {
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_CursedDiamond,1,40);
		//происходит магический эффект и Лан становится человеком.
		Wld_PlayEffect("spellFX_HealShrine", self,self,0,0,0,FALSE);
		B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_ToughBald01,BodyTex_L,ITAR_PIR_M_DS);
		Lan_BecameHuman = TRUE;
		Lan_TalkDay = Wld_GetDay();
	};
	//Запись в дневнике "Проклятый моряк" квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_DamnSailor_Success);
};

//NS - 23/06/2013 ===========
// Украсть карту, 
// если знаем про нее или много ловкости
//===========================
var int THIEF_LanSkeleton_Map;
instance DIA_LanSkeleton_PICKPOCKET(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 900;
	condition = DIA_LanSkeleton_PICKPOCKET_Condition;
	information = DIA_LanSkeleton_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Пытаться украсть его карту будет довольно рисковано)";
};
func int DIA_LanSkeleton_PICKPOCKET_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Ado_WhatJob) || (other.attribute[ATR_DEXTERITY] >= C_DS_GetTheftChanceMultiplier(other,60)))
		&& (Npc_HasItems(self,ItWr_DS2P_Map_LanSkeleton) > 0))
	{	return TRUE;	};
};
func void DIA_LanSkeleton_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_LanSkeleton_PICKPOCKET);
	Info_AddChoice(DIA_LanSkeleton_PICKPOCKET,Dialog_Back,DIA_LanSkeleton_PICKPOCKET_BACK);
	Info_AddChoice(DIA_LanSkeleton_PICKPOCKET,DIALOG_PICKPOCKET,DIA_LanSkeleton_PICKPOCKET_DoIt);
};
func void DIA_LanSkeleton_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= C_DS_GetTheftChanceMultiplier(other,60))
	{
		B_GiveInvItems(self,other,ItWr_DS2P_Map_LanSkeleton,1);
		THIEF_LanSkeleton_Map = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_LanSkeleton_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};
func void DIA_LanSkeleton_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_LanSkeleton_PICKPOCKET);
};
//Redleha - 12/09/2014 ===========
// Если взят квест "В поисках сокровищ", а квест «Проклятый моряк» еще не пройден и/или карта не украдена
//===========================
instance DIA_LanSkeleton_YouPossessGreatTreasures(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 6;
	condition = DIA_LanSkeleton_YouPossessGreatTreasures_condition;	
	information = DIA_LanSkeleton_YouPossessGreatTreasures_info;
	description = "Говорят, что ты владеешь большими сокровищами.";
};
func int DIA_LanSkeleton_YouPossessGreatTreasures_condition(){	
	if(Npc_HasItems(self,ITMI_DS2P_CursedDiamond) && (MIS_DS2P_InSearchOfTreasure == LOG_Running) && (MIS_DS2P_DamnSailor != LOG_SUCCESS))
	{return TRUE;};
};	
func void DIA_LanSkeleton_YouPossessGreatTreasures_info()
{
	AI_Output(other,self,"DIA_LanSkeleton_YouPossessGreatTreasures_15_00");	//Говорят, что ты владеешь большими сокровищами.
		AI_Output(self,other,"DIA_LanSkeleton_YouPossessGreatTreasures_13_00");	//С чего ты взял? Если пару десятков монет, которые завалялись у меня в кармане, ты называешь сокровищем, то да – я несметно богат! (смеется)
	AI_Output(other,self,"DIA_LanSkeleton_YouPossessGreatTreasures_15_01");	//Нет, я говорю о древних монетах.
		AI_Output(self,other,"DIA_LanSkeleton_YouPossessGreatTreasures_13_01");	//(удивленно) Откуда ты...? (осекается) 
		AI_Output(self,other,"DIA_LanSkeleton_YouPossessGreatTreasures_13_02");	//Я ничего не знаю об этом. И вообще, не отвлекай меня от дел.
	//Запись в дневнике "В поисках сокровищ" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_Running,"Естественно, Лан ни в чем не признается. Нужно действовать по-другому.");
	AI_StopProcessInfos(self);
};

// Запускается после двух дней, как Лан стал человеком. Он сам обращается к ГГ
// nr = 1

instance DIA_LanSkeleton_AboutNightmares(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_LanSkeleton_AboutNightmares_condition;	
	information = DIA_LanSkeleton_AboutNightmares_info;
	description = " ";
};

func int DIA_LanSkeleton_AboutNightmares_condition()
{	
	if((Wld_GetDay() - Lan_TalkDay) >= 2)
	{
		return TRUE;
	};
};

func void DIA_LanSkeleton_AboutNightmares_info()
{
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_00");	//Иди сюда.
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_01");	//Что тебе надо?
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_02");	//Ты должен мне помочь.
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_03");	//Должен? С чего бы это? Я никому ничего не должен.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_04");	//Меня мучают кошмары. Я совсем не могу спать после того, как ты вернул мне мой алмаз и человеческий облик.
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_05");	//Кошмар… ну и ладно, пройдет со временем. Ты все же был скелетом, а это наложило определенный отпечаток на твою психику.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_06");	//Психику? Я не понял, ты меня психом назвал?
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_07");	//Так, успокойся, никак я тебя не называл. Это слово такое, причем к оскорблениям не имеющее никакого отношения.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_08");	//(зло) Да как тут успокоиться?!! Я спать нормально не могу! Жрать нормально не могу! Даже облегчиться получается не сразу! А ты просишь успокоиться!
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_15_09");	//Хм, похоже все и вправду серьезно.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_13_10");	//Ты мне поможешь?
	Info_ClearChoices(DIA_LanSkeleton_AboutNightmares);
	Info_AddChoice(DIA_LanSkeleton_AboutNightmares,"Нет.",DIA_LanSkeleton_AboutNightmares_No);
	Info_AddChoice(DIA_LanSkeleton_AboutNightmares,"Да.",DIA_LanSkeleton_AboutNightmares_Yes);
};

// Запускается, если выбрать реплику "Нет." в диалоге с Ланом о кошмарах

func void DIA_LanSkeleton_AboutNightmares_No()
{
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_No_15_00");	//Нет. У меня и без этого проблем хватает. Да и как прикажешь тебя от кошмаров избавлять? Стоять всю ночь над спящим тобой с палкой и отпугивать кошмары, ударяя каждый раз тебя по голове, когда ты начинаешь кричать? Нет, разбирайся сам.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_No_13_01");	//А ладно, катись к Белиару! Сам справлюсь.
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Да." в диалоге с Ланом о кошмарах

func void DIA_LanSkeleton_AboutNightmares_Yes()
{
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_Yes_15_00");	//Да. Что надо делать? Стоять всю ночь рядом с тобой и бить тебя палкой по голове каждый раз, когда ты начинаешь кричать? Когда начинаем?
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_Yes_13_01");	//(раздраженно) Прекрати паясничать. У тебя на корабле вроде бы был маг?
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_Yes_15_02");	//Даже два, но на ногах только один.
	AI_Output(self,other,"DIA_LanSkeleton_AboutNightmares_Yes_13_03");	//Спроси у него, можно ли чего сделать. Сам я боюсь на корабль ступать – заражусь еще чумой вашей.
	AI_Output(other,self,"DIA_LanSkeleton_AboutNightmares_Yes_15_04");	//Ладно, схожу, спрошу.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Nightmares,LOG_MISSION,LOG_Running,TOPIC_DS2P_Nightmares_Start);
	AI_StopProcessInfos(self);
};

// Активируется, если активен квест "Кошмары" и взяли у Ватраса зелье
// nr = 1

instance DIA_LanSkeleton_BringNighPotion(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	important = FALSE;
	condition = DIA_LanSkeleton_BringNighPotion_condition;	
	information = DIA_LanSkeleton_BringNightPotion_info;
	description = "Кажется, я знаю, как тебе помочь.";
};

func int DIA_LanSkeleton_BringNighPotion_condition()
{	
	if((MIS_DS2P_Nightmares == Log_Running)
		 && Npc_KnowsInfo(other,DIA_Vatras_NightPotion) && (Npc_HasItems(other,ItMi_DS2P_LanNightmaresPotion) >= 1))
	{
		return TRUE;
	};
};

func void DIA_LanSkeleton_BringNightPotion_info()
{
	AI_Output(other,self,"DIA_LanSkeleton_BringNightPotion_15_00");	//Кажется, я знаю, как тебе помочь.
	AI_Output(self,other,"DIA_LanSkeleton_BringNightPotion_13_01");	//И? Не тяни угря за хвост! Говори!
	// Тут можно либо в реплику вставить вырывание волос, либо просто подождать, наверное
	AI_Wait(other,1);
	//AI_Output(other,self,"DIA_LanSkeleton_BringNightPotion_Hair");	//(вырывает пару волос с головы Лана)
	AI_Output(self,other,"DIA_LanSkeleton_BringNightPotion_13_02");	//Эй! Ты что творишь?
	AI_Output(other,self,"DIA_LanSkeleton_BringNightPotion_15_03");	//Так надо. Сейчас я закончу зелье, ты ляжешь спать, я приму зелье и отправлюсь вместе с тобой в твой кошмар, чтобы избавить тебя от него. Понятно?
	AI_Output(self,other,"DIA_LanSkeleton_BringNightPotion_13_04");	//Да. Это сработает?
	AI_Output(other,self,"DIA_LanSkeleton_BringNightPotion_15_05");	//Будем надеяться, что да. Теперь ложись спать.
	AI_PlayAniBS(self,"T_STAND_2_SLEEP",BS_LIE); // Лан ложится Спать. Точно не знаю, может придется заменить
	CreateInvItems(other,ItPo_DSG_LansPotion,1); // Создаем зелье Лана в инвентаре (которое можно выпить)
	Npc_RemoveInvItems(other,ItMi_DS2P_LanNightmaresPotion,1); // Удаляем зелье Лана из инвентаря (которое нельзя выпить)
	B_UseItem(other,ItPo_DSG_LansPotion); // Выпиваем зелье
	// Тут надо сделать смену уровня на Сон Лана. DSG_LAN_DREAM_ZEN
	// ГГ надо поставить прямо возле скелета-лана, чтобы диалог сразу же запустился
	AI_StopProcessInfos(self);
};
	
// Запускается, когда ГГ вышел из сна Лана
// nr = 1

instance DIA_LanSkeleton_ReturningFromDream(C_Info)
{
	npc = PIR_207_DS2P_LanSkeleton;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_LanSkeleton_ReturningFromDream_condition;	
	information = DIA_LanSkeleton_ReturningFromDream_info;
	description = " ";
};

func int DIA_LanSkeleton_ReturningFromDream_condition()
{	
	if(Npc_KnowsInfo(other,DIA_LanSkeleton_HM_Dream))
	{
		return TRUE;
	};
};

func void DIA_LanSkeleton_ReturningFromDream_info()
{
	// Делаем анимацию, что Лан проснулся. Честно, не знаю как сделать
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_00");	//Ох, как же болит голова!
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_01");	//Ты в порядке?
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_02");	//Да, кажется. Что это было там?
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_03");	//Это твой второй облик устраивал тебе кошмары. Мне пришлось убить его.
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_04");	//Убить?.. Подожди-ка, какие-то странные ощущения охватывают меня.
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_05");	//В смысле?
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_06");	//(достает алмаз). Ни черта себе!
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_07");	//Он рассыпался!
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_08");	//Это что, я теперь получается человек, человек окончательно? И проклятие спало?
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_09");	//Попробуй выбросить осколки алмаза. Посмотрим, превратишься ли ты в скелета.
	// "Лан делает движение рукой, будто что-то выкидывает. Ничего не происходит." -- тут должна быть какая-то анимация?
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_10");	//Вот это да! Проклятие спало! Спасибо тебе, чужак. Век благодарен буду. Человек! Как же я об этом мечтал!
	AI_Output(other,self,"DIA_LanSkeleton_ReturningFromDream_15_11");	//Раз уж ты сам завел об этом разговор, может, поговорим о моей награде?
	AI_Output(self,other,"DIA_LanSkeleton_ReturningFromDream_13_12");	//Да, конечно.
	// UNFINISHED -- Надо выдать награду. В сценарии не описано, что именно
	B_DSG_Log_OpenClose(TOPIC_DS2P_Nightmares,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Nightmares_Success);
	B_GivePlayerXP(XP_MIS_Nightmares_Success);
	AI_StopProcessInfos(self);
};