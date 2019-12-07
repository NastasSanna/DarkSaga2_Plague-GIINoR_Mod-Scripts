instance DIA_Zedd_EXIT(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Zedd_EXIT_condition;	
	information = DIA_Zedd_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Zedd_EXIT_condition(){	return TRUE;};
func void DIA_Zedd_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 28/06/2013 ====================================================
// По квесту "Белая горячка"
//====================================================================

//----------------------------
//  Первая попытка знакомства, заговаривает сам Зедд		nr=1
instance DIA_Zedd_Start_Gluk1(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Gluk1_condition;	
	information = DIA_Zedd_Start_Gluk1_info;
	important = TRUE;
};
func int DIA_Zedd_Start_Gluk1_condition()
{
	return TRUE;
};
func void DIA_Zedd_Start_Gluk1_info()
{
	var int x;
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_00");	//О, ты кто такой? У меня уже побывала вся деревня, наших парней я тоже помню.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_01");	//Так кто ты такой, черт возьми?
	AI_Output(other,self,"DIA_Zedd_Start_Gluk1_15_02");	//Меня зовут...
	x = 1; if (x == 1) {
		Mdl_StartFaceAni(self,"S_FRIGHTENED",1.0,2.0);
	};
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_03");	//(округляет глаза) О блин, все-таки допился. Галлюцинация, да еще и со звуком.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_04");	//Так, так... С завтрашнего дня буду пить на две бутылки рома меньше... Нет, на три! Решено!
	AI_Output(other,self,"DIA_Zedd_Start_Gluk1_15_05");	//Я не галлюцинация!
		AI_Output(self,other,"DIA_Zedd_Start_Gluk1_13_06");	//Да, да! А то бы ты сказал по-другому! Уходи, по-хорошему прошу!
	AI_StopProcessInfos(self);
};

//----------------------------
//  Вторая попытка знакомства, после первой		nr=1
instance DIA_Zedd_Start_Gluk2(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Gluk2_condition;	
	information = DIA_Zedd_Start_Gluk2_info;
	description = "Послушай...";
};
func int DIA_Zedd_Start_Gluk2_condition()
{
	if (Npc_KnowsInfo(other, DIA_Zedd_Start_Gluk1) && Npc_IsInState(self,ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Zedd_Start_Gluk2_info()
{
	var C_NPC Dil;	Dil = Hlp_GetNpc(Bau_102_DS2P_Dil);
	var C_NPC Zedd;	Zedd = Hlp_GetNpc(PIR_203_DS2P_Zedd);
	
	AI_Output(other,self,"DIA_Zedd_Start_Gluk2_15_00");	//Послушай...
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_01");	//(перебивает) Я не хочу тебя слушать! Я не хочу тебя видеть! Уходи морок, изыди!
	AI_Output(other,self,"DIA_Zedd_Start_Gluk2_15_02");	//Но я не морок! Тебе это любой подтвердит!
	//Спаним недалеко Дила
	// UNFINISHED вписать WP для Дила
	AI_Teleport(Dil, "");
	AI_StartState(Dil, ZS_Stand_WP, FALSE, "");
	
	// ТРИАЛОГ ----v
	TRIA_Invite(Dil);
	TRIA_Start();
	
	// self = Zedd, other = Hero
	TRIA_Next(Zedd);
	AI_TurnToNpc(self, Dil);
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_03");	//Эй, селянин, ну-ка подойди сюда.
	//Дил подходит
	AI_GotoNpc(Dil, Zedd);
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_04");	//Ты видишь его? Скажи, этот человек действительно существует?
		
	// self = Dil, other = Hero
	TRIA_Next(Dil);
	AI_TurnToNpc(self, Dil);
			AI_Output(self,other,"DIA_Zedd_Start_Gluk2_12_05");	//Ничего нет, кроме света, утреннего дождя  и смерти! Покайтесь, грешники!
	//Дил уходит
	AI_ContinueRoutine(Dil);
	
	DIAG_Reset();
	TRIA_Finish();	
	// ТРИАЛОГ ----^
	
	AI_TurnToNpc(self, other);
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_06");	//Понял, тебя нет! НЕТ! Так, мне нужно срочно протрезветь. Где тут вода?
	//Выпивает грога
	CreateInvItem(self, ItFo_Addon_Grog);
	AI_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_07");	//Черт! В этой треклятой деревне есть что-нибудь без градусов?!
		AI_Output(self,other,"DIA_Zedd_Start_Gluk2_13_08");	//Изыди от меня во имя Инноса, Белиара и всех демонов преисподней!
	AI_StopProcessInfos(self);
};

//----------------------------
//  Третья попытка знакомства, после второй		nr=1
instance DIA_Zedd_Start_Gluk3(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Gluk3_condition;	
	information = DIA_Zedd_Start_Gluk3_info;
	description = "Да послушай меня!";
};
func int DIA_Zedd_Start_Gluk3_condition()
{
	if (Npc_KnowsInfo(other, DIA_Zedd_Start_Gluk2)){	return TRUE;	};
};
func void DIA_Zedd_Start_Gluk3_info()
{
	AI_Output(other,self,"DIA_Zedd_Start_Gluk3_15_00");	//Да послушай меня! Я прибыл совсем недавно на корабле.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk3_13_01");	//Корабль? Какой корабль? Ты что несешь, видение? Наш корабль затонул!
		AI_Output(self,other,"DIA_Zedd_Start_Gluk3_13_02");	//Я сам лично это видел, и не только видел, но и чудом спасся.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk3_13_03");	//Думал уже, что мои косточки достанутся акулам на обглодание.
		AI_Output(self,other,"DIA_Zedd_Start_Gluk3_13_04");	//Не доводи до греха, исчезни по-хорошему.

	//Запись в дневнике "Белая горячка" 
	B_ds_LogEntry(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_Running,TOPIC_DS2P_DeliriumTremens_Start);
	AI_StopProcessInfos(self);
};

//----------------------------
//  Постоянный, пока не вылечим белую горячку		nr=1
instance DIA_Zedd_Start_Gluk_Perm(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Gluk_Perm_condition;	
	information = DIA_Zedd_Start_Gluk_Perm_info;
	description = "Послушай...";
	permanent = TRUE;
};
func int DIA_Zedd_Start_Gluk_Perm_condition()
{
	if (Npc_KnowsInfo(other, DIA_Zedd_Start_Gluk3) && (MIS_DS2P_DeliriumTremens != LOG_SUCCESS)){	return TRUE;	};
};
func void DIA_Zedd_Start_Gluk_Perm_info()
{
	AI_Output(other,self,"DIA_Zedd_Start_Gluk_Perm_15_00");	//Послушай...
		AI_Output(self,other,"DIA_Zedd_Start_Gluk_Perm_13_01");	//(перебивает) Я не хочу тебя слушать! Я не хочу тебя видеть! Уходи морок, изыди!
};


//----------------------------
// Дать "Отрезвительное зелье", если есть и взят квест
instance DIA_Zedd_GiveSoberingPotion(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 0;
	condition = DIA_Zedd_GiveSoberingPotion_condition;	
	information = DIA_Zedd_GiveSoberingPotion_info;
	important = TRUE;
};
func int DIA_Zedd_GiveSoberingPotion_condition()
{
	if ((MIS_DS2P_DeliriumTremens == LOG_Running) && Npc_IsInState(self,ZS_Talk)
		&& (Npc_HasItems(other,ItMi_DS2P_SoberingPotion) > 0))
	{	return TRUE;	};
};
func void DIA_Zedd_GiveSoberingPotion_info()
{
	var int x;
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_00");	//Я думал, что уже все наладилось, и ты больше не будешь мне мерещиться. Зачем ты вернулся? Ну скажи, зачем...
	//(+опыт)
	B_GivePlayerXP(XP_MIS_DeliriumTremens);
	AI_Output(other,self,"DIA_Zedd_GiveSoberingPotion_15_01");	//Да перестань ты так горевать! Давай лучше выпьем!
	AI_Output(other,self,"DIA_Zedd_GiveSoberingPotion_15_02");	//Раз уж я тебе все равно мерещусь, хуже уже не будет, ведь так?!
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_03");	//(задумчиво) Твоя правда, терять уже нечего. 
	AI_Output(other,self,"DIA_Zedd_GiveSoberingPotion_15_04");	//Вот, выпей это. Даю слово: такого напитка ты еще не пил!
	//Дать зелье
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems(other,self, ItMi_DS2P_SoberingPotion,1);
		CreateInvItem(self, ItFo_Addon_Grog);	//зелье выпить нельзя, по факту пить будет грог
	};
	
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_05");	//Я? Не пил? Да не бывает таких напитков, которые не попробовал Зедд! 
	//Выпивает
	AI_UseItem(self, ItFo_Addon_Grog);
	
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_06");	//Ха! Ты смешал пиво и грог и хотел меня удиви... Ох... Что-то происходит!
		AI_Output(self,other,"DIA_Zedd_GiveSoberingPotion_13_07");	//О как подкатило-то... Оооо... Погоди минутку, я сейчас вернусь...
	//Диалог обрывается, Зедд удирает со всего маху
	AI_StopProcessInfos(self);
	//UNFINISHED вписать WP, куда он убегает, возможно исправить состояние, чтоб бежал без оглядки
	AI_StartState(self,ZS_FleeToWP,0,"");
	B_StartOtherRoutine(self, "MAIN");
	
	//Запись в дневнике "Белая горячка" закончен
	B_ds_LogEntry(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_DeliriumTremens_Success);
};

//----------------------------
//  Когда протрезвеет, если с ним заговорить		nr=1
instance DIA_Zedd_Start_Sober(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_Start_Sober_condition;	
	information = DIA_Zedd_Start_Sober_info;
	important = TRUE;
};
func int DIA_Zedd_Start_Sober_condition()
{
	if ((MIS_DS2P_DeliriumTremens == LOG_SUCCESS) && (Npc_IsInState(self,ZS_Talk)))
	{	return TRUE;	};
};
func void DIA_Zedd_Start_Sober_info()
{
		AI_Output(self,other,"DIA_Zedd_Start_Sober_13_00");	//Ты чего мне подсунул? Я думал, меня разорвет! 
	AI_Output(other,self,"DIA_Zedd_Start_Sober_15_01");	//(улыбается) Похоже ты перестал думать, что я морок.
		AI_Output(self,other,"DIA_Zedd_Start_Sober_13_02");	//Хех! И правда! Твое пойло быстро привело меня в норму.
		AI_Output(self,other,"DIA_Zedd_Start_Sober_13_03");	//Я даже не помню, когда в последний раз был настолько трезв. (смеется)
	//Выпивает самогона
	CreateInvItem(self, ITFO_SAMOGON);
	AI_UseItem(self, ITFO_SAMOGON);
};


//NS - 28/06/2013 ====================================================
// Общие диалоги		после отрезвления 
//====================================================================

//--------------------------------
//  "Чем ты занимаешься?", вкл. торговлю		nr=1
instance DIA_Zedd_WhatsUrJob(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	condition = DIA_Zedd_WhatsUrJob_condition;	
	information = DIA_Zedd_WhatsUrJob_info;
	description = "Чем ты занимаешься?";
};
func int DIA_Zedd_WhatsUrJob_condition()
{
	if (MIS_DS2P_DeliriumTremens == LOG_SUCCESS)	{	return TRUE;	};
};
func void DIA_Zedd_WhatsUrJob_info()
{
	AI_Output(other,self,"DIA_Zedd_WhatsUrJob_15_00");	//Чем ты занимаешься?
		AI_Output(self,other,"DIA_Zedd_WhatsUrJob_13_01");	//О, мы же не познакомились. Зови меня Зеддом, я пивовар, гроговар, виновар и прочее, прочее.
		AI_Output(self,other,"DIA_Zedd_WhatsUrJob_13_02");	//В общем, если тебе нужен крепкий напиток, то ты обратился по адресу.
	//Запись в дневнике в разделе доп инфо "Торговцы у пиратов" 
	B_ds_LogEntry(TOPIC_PiratTrader,LOG_NOTE,-1,"Пират Зедд продает выпивку.");
	TRADE_Zedd = TRUE;
};

//--------------------------------
//  "Как ты можешь столько пить?", вкл. соревнование		nr=2
instance DIA_Zedd_DrinkSoMuch(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 2;
	condition = DIA_Zedd_DrinkSoMuch_condition;	
	information = DIA_Zedd_DrinkSoMuch_info;
	description = "Как ты можешь столько пить?";
};
func int DIA_Zedd_DrinkSoMuch_condition()
{
	if (MIS_DS2P_DeliriumTremens == LOG_SUCCESS)	{	return TRUE;	};
};
func void DIA_Zedd_DrinkSoMuch_info()
{
	AI_Output(other,self,"DIA_Zedd_DrinkSoMuch_15_00");	//Как ты можешь столько пить?
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_01");	//Да разве я много пью? Ха! Вот мой дед действительно пил!
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_02");	//Он за вечер мог влить в себя бочку пива, запить это самогоном, накатить пару бутылочек шнапса и после этого сказать, что выпивка нынче не та, как во времена его молодости и трезвыми уйти спать.
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_03");	//Вот это я понимаю! Мне до деда еще далеко. (смеется) 
	//Выпивает грога
	
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_04");	//Вот поэтому приходится постоянно тренироваться, чтобы не срамить великого родственника! Кстати, не хочешь со мной посоревноваться?
	AI_Output(other,self,"DIA_Zedd_DrinkSoMuch_15_05");	//Ты о чем?
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_06");	//Смотри, делаем ставки по сто золотых, пьем до того момента, пока один из нас не скажет стоп.
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_07");	//Кто первый остановил игру, тот и проиграл и потерял всю ставку. Что скажешь?
	AI_Output(other,self,"DIA_Zedd_DrinkSoMuch_15_08");	//Я подумаю.
		AI_Output(self,other,"DIA_Zedd_DrinkSoMuch_13_09");	//Да, подумай хорошенько. Зедда еще никто не смог перепить!

	//Запись в дневнике в разделе доп инфо "Особое"  //NS - отсебятина
	B_ds_LogEntry(Topic_Bonus,LOG_NOTE,-1,"Я могу посоревноваться в выпивке с пиратом Зеддом. Ставка 100 золотых.");
	Zedd_Competition = TRUE;
};

//--------------------------------
//  "Где ты научился делать все эти напитки?", вкл. оик рецептов		nr=3
instance DIA_Zedd_WhoTaughtU(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 3;
	condition = DIA_Zedd_WhoTaughtU_condition;	
	information = DIA_Zedd_WhoTaughtU_info;
	description = "Где ты научился делать все эти напитки?";
};
func int DIA_Zedd_WhoTaughtU_condition()
{
	if (MIS_DS2P_DeliriumTremens == LOG_SUCCESS)	{	return TRUE;	};
};
func void DIA_Zedd_WhoTaughtU_info()
{
	AI_Output(other,self,"DIA_Zedd_WhoTaughtU_15_00");	//Где ты научился делать все эти напитки?
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_01");	//Это у нас семейное. Из поколения в поколение передается.
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_02");	//Еще мой пра-пра-пра-пра-дед был пивоваром, потом его сын, мой пра-пра-пра-дед, потом его сын, мой пра-пра-дед, потом его сын...
	//Выпивает шнапса
	CreateInvItem(self,ItFo_booze);
	AI_UseItem(self,ItFo_Booze);
	AI_Output(other,self,"DIA_Zedd_WhoTaughtU_15_03");	//Я понял.
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_04");	//Так вот, помимо семейных традиций я решил расширить свои познания, поэтому, где бы ни путешествовал, собираю рецепты новых напитков.
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_05");	//Кстати, у тебя случайно нет такого? 
	//Выпивает рома
	CreateInvItem(self,ItFo_Addon_Rum);
	AI_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other,"DIA_Zedd_WhoTaughtU_13_06");	//Хорошо пошло... Если что-нибудь попадется, тащи мне. Дам тебе золота, да еще и угощу напитком.

	//Запись в дневнике в разделе доп инфо "Особое"  //NS - отсебятина
	B_ds_LogEntry(Topic_Bonus,LOG_NOTE,-1,"Пират Зедд собирает рецепты напитков. За каждый рецепт он платит золотом.");
	
	Zedd_Recipes = TRUE;
};


//NS - 28/06/2013 ====================================================
// Квест "Доставка припасов"		после отрезвления 
//====================================================================
//--------------------------------
//  "Мне нужна выпивка."		nr=10
instance DIA_Zedd_NeedBooze(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 10;
	condition = DIA_Zedd_NeedBooze_condition;	
	information = DIA_Zedd_NeedBooze_info;
	description = "Мне нужна выпивка.";
};
func int DIA_Zedd_NeedBooze_condition()
{
	if ((MIS_DS2P_DeliriumTremens == LOG_SUCCESS) && (MIS_DS2P_ShippingSupplies == LOG_Running))
	{	return TRUE;	};
};
func void DIA_Zedd_NeedBooze_info()
{
	var int x;
	AI_Output(other,self,"DIA_Zedd_NeedBooze_15_00");	//Меня прислал Грег. Я должен отнести выпивку пиратам, охраняющим пещеру.
		AI_Output(self,other,"DIA_Zedd_NeedBooze_13_01");	//Этим пропойцам? (смеется) Йорн мне еще долг не вернул за три бутылки грога.
		AI_Output(self,other,"DIA_Zedd_NeedBooze_13_02");	//Ну ладно, с Грегом мне связываться не с руки. Держи четыре бутылки.
	//Дает 4 бутылки шнапса.
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other, ItFo_Booze, 4);
	};
	
	//Запись в дневнике "Доставка припасов" 
	B_ds_LogEntry(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_BoozeGot);
};


//NS - 28/06/2013 ====================================================
// По поводу РЕЦЕПТОВ		(+опыт, золото, выпивка)
//====================================================================
//--------------------------------
//  "По поводу рецептов..."		nr=11
instance DIA_Zedd_AboutRecipes(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 11;
	condition = DIA_Zedd_AboutRecipes_condition;	
	information = DIA_Zedd_AboutRecipes_info;
	description = "По поводу рецептов...";
};
func int DIA_Zedd_AboutRecipes_condition()
{
	if (Zedd_Recipes == TRUE)	{	return TRUE;	};
};
func void DIA_Zedd_AboutRecipes_info()
{
	Info_ClearChoices(DIA_Zedd_AboutRecipes);
	Info_AddChoice(DIA_Zedd_AboutRecipes,Dialog_Back,DIA_Zedd_AboutRecipes_Back);
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_BullSeed) && (Zedd_Recipe_Booze_BullSeed_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"Я нашел рецепт ”Бычье семя”",DIA_Zedd_AboutRecipes_BullSeed);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_GobboSmile) && (Zedd_Recipe_Booze_GobboSmile_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"Я нашел рецепт ”Улыбка гоблина”",DIA_Zedd_AboutRecipes_GobboSmile);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_Berserker) && (Zedd_Recipe_Booze_Berserker_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"Я нашел рецепт ”Берсеркер”",DIA_Zedd_AboutRecipes_Berserker);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_TrollBooze) && (Zedd_Recipe_Booze_TrollBooze_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"Я нашел рецепт ”Троллиное пойло”",DIA_Zedd_AboutRecipes_TrollBooze);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_MagicGrog) && (Zedd_Recipe_Booze_MagicGrog_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"Я нашел рецепт ”Магический грог”",DIA_Zedd_AboutRecipes_MagicGrog);	};
	
	if (Npc_HasItems(other,ITWr_DSG_Recipe_Booze_Kamikaze) && (Zedd_Recipe_Booze_Kamikaze_Once == FALSE))
	{	Info_AddChoice(DIA_Zedd_AboutRecipes,"Я нашел рецепт ”Камикадзе”",DIA_Zedd_AboutRecipes_Kamikaze);	};
};
func void DIA_Zedd_AboutRecipes_Back()
{
	Info_ClearChoices(DIA_Zedd_AboutRecipes);
};
func int DIA_Zedd_AboutRecipes_General()	//одинаковое для всех рецептов
{
	var int x;
	//(+опыт)
	B_GivePlayerXP(XP_Zedd_Recipe_Booze);
		AI_Output(self,other,"DIA_Zedd_AboutRecipes_13_01");	//Отлично! Давай его сюда. Да, действительно, такого рецепта я еще не знал. Сейчас почитаем.
	//Читает рецепт
	B_DIA_UseItem_Wait(self, other, Fakescroll, 0.7);
		AI_Output(self,other,"DIA_Zedd_AboutRecipes_13_02");	//Интересно, интересно... Сейчас попробуем смешать. Так, ага. По-моему получилось.
	//Дает 100 монет
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	return TRUE;
};
func void DIA_Zedd_AboutRecipes_BullSeed()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_BullSeed_15_00");	//Я нашел рецепт ”Бычье семя”.
	//отдаем рецепт
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_BullSeed,1);
	Zedd_Recipe_Booze_BullSeed_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//Дает выпивку
		B_GiveInvItems(self,other,ItFo_DS2P_BullSeed,1);
	};
};
func void DIA_Zedd_AboutRecipes_GobboSmile()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_GobboSmile_15_00");	//Я нашел рецепт ”Улыбка гоблина”.
	//отдаем рецепт
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_GobboSmile,1);
	Zedd_Recipe_Booze_GobboSmile_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//Дает выпивку
		B_GiveInvItems(self,other,ItFo_DS2P_GobboSmile,1);
	};
};
func void DIA_Zedd_AboutRecipes_Berserker()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_Berserker_15_00");	//Я нашел рецепт ”Берсеркер”.
	//отдаем рецепт
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_Berserker,1);
	Zedd_Recipe_Booze_Berserker_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//Дает выпивку
		B_GiveInvItems(self,other,ItFo_DS2P_Berserker,1);
	};
};
func void DIA_Zedd_AboutRecipes_TrollBooze()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_TrollBooze_15_00");	//Я нашел рецепт ”Троллиное пойло”.
	//отдаем рецепт
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_TrollBooze,1);
	Zedd_Recipe_Booze_TrollBooze_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//Дает выпивку
		B_GiveInvItems(self,other,ItFo_DS2P_TrollBooze,1);
	};
};
func void DIA_Zedd_AboutRecipes_MagicGrog()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_MagicGrog_15_00");	//Я нашел рецепт ”Магический грог”.
	//отдаем рецепт
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_MagicGrog,1);
	Zedd_Recipe_Booze_MagicGrog_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//Дает выпивку
		B_GiveInvItems(self,other,ItFo_DS2P_MagicGrog,1);
	};
};
func void DIA_Zedd_AboutRecipes_Kamikaze()
{
	AI_Output(other,self,"DIA_Zedd_NeedBooze_Kamikaze_15_00");	//Я нашел рецепт ”Камикадзе”.
	//отдаем рецепт
	B_DS_GiveRemoveItems(other,self,ITWr_DSG_Recipe_Booze_Kamikaze,1);
	Zedd_Recipe_Booze_Kamikaze_Once = TRUE;
	if (DIA_Zedd_AboutRecipes_General()) {
		//Дает выпивку
		B_GiveInvItems(self,other,ItFo_DS2P_Kamikaze,1);
	};
};


//NS - 03/07/2013 =========================
//  По квесту "Азартный игрок"
//=========================================

//----------------------------
// "Валес говорит, что ты виноват в его заикании."		nr=20
instance DIA_Zedd_UAStutterReason(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 20;
	condition = DIA_Zedd_UAStutterReason_condition;	
	information = DIA_Zedd_UAStutterReason_info;
	description = "Валес говорит, что ты виноват в его заикании.";
};
func int DIA_Zedd_UAStutterReason_condition()
{
	if (Npc_KnowsInfo(other,DIA_Vales_WhyDoYouStutter)){	return TRUE;};
};
func void DIA_Zedd_UAStutterReason_info()
{
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_00");	//Валес говорит, что ты виноват в его заикании.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_01");	//Ааа, ты уже в курсе этой истории. Да, мы тогда славно оторвались с Джозефом.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_02");	//Эта скотина Валес так хитро мухлюет, что мы так и не смогли его подловить. Он обчистил нас до штанов.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_03");	//Ну, мы ушли, накатили изрядно, и тут мне пришла гениальная идея – разыграть этого хитреца.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_04");	//Взяли парусины, намалевали углем страшные рожи, и ночью пьяные вдрызг пошли к нему. Если бы были трезвые, так натурально бы не сыграли.
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_05");	//Из-за вас Валес теперь заикается.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_06");	//Зато и в карты не играет. После того случая он сразу пасует после первой ставки и уходит. (смеется)
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_07");	//Я бы хотел помочь ему вылечится от заикания.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_08");	//А ты что, праведник? Что-то я не вижу, чтобы длань Инноса опустилась на тебя и сделала святым.
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_09");	//Я думаю Валес найдет, чем отплатить за мою помощь.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_10");	//Ааа! Решил покуситься на золото Валеса. Ну-ну! Он самый жадный пират из всех, кого я когда-нибудь встречал.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_11");	//Он даже за кружку пива будет торговаться до посинения. Ну да ладно. Идея-то интересная, надо обмозговать.
	//Выпивает грога
	CreateInvItem(self,ItFo_Addon_Grog);
	AI_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_12");	//О, придумал! Хотя нет, погоди...
	//Выпивает рома
	CreateInvItem(self,ItFo_Addon_Rum);
	AI_UseItem(self,ItFo_Addon_Rum);
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_13");	//Да, точно придумал! Или нет...
	//Выпивает самогона
	CreateInvItem(self,ITFO_SAMOGON);
	AI_UseItem(self,ITFO_SAMOGON);
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_14");	//Именно так мы и поступим! Смотри сюда. План гениальнейший!
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_15");	//Рассказывай уже.
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_16");	//Не перебивай меня! Так вот, сейчас ты идешь к Джозефу за кузнечными мехами.
	AI_Output(other,self,"DIA_Zedd_UAStutterReason_15_17");	//Зачем?
		AI_Output(self,other,"DIA_Zedd_UAStutterReason_13_18");	//Ну дай мне посмаковать мой план! Иди уже. Одна нога здесь, а другая здесь совсем не нужна. Ха!
	//Выпивает вина
	CreateInvItem(self,ItFo_Wine);
	AI_UseItem(self,ItFo_Wine);

	//Запись в дневнике "Азартный игрок" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_ZeddBellows);
};


//----------------------------
// "Я достал кузнечные меха."	(+опыт)		nr=21
instance DIA_Zedd_GotForgeBellows(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 21;
	condition = DIA_Zedd_GotForgeBellows_condition;	
	information = DIA_Zedd_GotForgeBellows_info;
	description = "Я достал кузнечные меха.";
};
func int DIA_Zedd_GotForgeBellows_condition()
{
	if ((MIS_DS2P_Gambler == LOG_Running) && Npc_HasItems(other,ITMI_DS2P_ForgeBellows))
	{	return TRUE;};
};
func void DIA_Zedd_GotForgeBellows_info()
{
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_00");	//Я достал кузнечные меха. 
	//(+опыт)
	B_GivePlayerXP(XP_MIS_Gambler_ForgeBellows);
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_01");	//Отлично, давай сюда.
	//Выпивает рома
	CreateInvItem(self,ItFo_Addon_Grog);
	AI_UseItem(self,ItFo_Addon_Grog);
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_02");	//Так, теперь нам нужны костюмы.
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_03");	//Какие еще костюмы?
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_04");	//Да любые, главное чтобы были белые и со страшными рожами.
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_05");	//Так ты решил опять его напугать как в первый раз?
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_06");	//Не все так просто! Теперь все будет по-настоящему!
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_07");	//Это как?
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_08");	//(вздыхает) Ты меня уже утомил своими вопросами.
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_09");	//Просто принеси два костюма, халата или чего-нибудь подобного. Главное чтобы они были белыми.
	AI_Output(other,self,"DIA_Zedd_GotForgeBellows_15_10");	//И где я их возьму?
	//Выпивает самогона
	CreateInvItem(self,ITFO_SAMOGON);
	AI_UseItem(self,ITFO_SAMOGON);
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_11");	//Если бы я был трезв, я бы тебя уже придушил. Сходи к какой-нибудь крестьянке что ли. Кто тут у них одежду шьет?! Подумай хоть маленько головой.
		AI_Output(self,other,"DIA_Zedd_GotForgeBellows_13_12");	//(ворчит) Вот нынче молодежь пошла, если маркером не накарябано на двери, дескать, сюда иди, вы не вжисть не догадаетесь, куда вам надо и что там делать...

	//Запись в дневнике "Азартный игрок" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_ZeddCostumes);
};


//----------------------------
// "Я достал костюмы."	(+опыт)		nr=22
instance DIA_Zedd_GotClothes(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 22;
	condition = DIA_Zedd_GotClothes_condition;	
	information = DIA_Zedd_GotClothes_info;
	description = "Я достал костюмы.";
};
func int DIA_Zedd_GotClothes_condition()
{
	if ((MIS_DS2P_Gambler == LOG_Running) && Npc_HasItems(other,ItMi_DS2P_Packet_WhiteClothes))
	{	return TRUE;};
};
func void DIA_Zedd_GotClothes_info()
{
	var int x;
	AI_Output(other,self,"DIA_Zedd_GotClothes_15_00");	//Я достал костюмы.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_Gambler_Clothes);
		AI_Output(self,other,"DIA_Zedd_GotClothes_13_01");	//Дай-ка посмотрю. О, не дурно. Так, сейчас мы кое-что подправим, ага. Вроде, неплохо получилось. Теперь слушай сюда.
	//Выпивает грога, забирает костюмы
	CreateInvItem(self,ItFo_Addon_Grog);
	AI_UseItem(self,ItFo_Addon_Grog);
	x = 1; if (x == 1)	{
		B_DS_GiveRemoveItems(other,self,ItMi_DS2P_Packet_WhiteClothes,1);
	};
		AI_Output(self,other,"DIA_Zedd_GotClothes_13_02");	//Вот тебе колода картишек. В полночь иди к Валесу и предложи сыграть. Он, конечно же, откажется, но ты все равно настаивай.
		AI_Output(self,other,"DIA_Zedd_GotClothes_13_03");	//Я уверен, что жадность пересилит страх. Ну а дальше, чтобы ни происходило странное, подыгрывай и ничему не удивляйся.
	//Дает колоду карт
	x = 2; if (x == 2)	{
		B_GiveInvItems(self,other,ITMI_DS2P_Shulers_Colode,1);
	};
	AI_Output(other,self,"DIA_Zedd_GotClothes_15_04");	//О чем ты?
		AI_Output(self,other,"DIA_Zedd_GotClothes_13_05");	//Узнаешь потом. Запомни – главное подыгрывай!
	//Выпивает самогона
	CreateInvItem(self,ITFO_SAMOGON);
	AI_UseItem(self,ITFO_SAMOGON);

	//Запись в дневнике "Азартный игрок" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_ZeddPlayCards);
};


//----------------------------
// После того, как напугали Валеса		nr=0
instance DIA_Zedd_AfterScaredVales(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 0;
	condition = DIA_Zedd_AfterScaredVales_condition;	
	information = DIA_Zedd_AfterScaredVales_info;
	important = TRUE;
};
func int DIA_Zedd_AfterScaredVales_condition()
{
	if (Npc_KnowsInfo(other,DIA_Vales_LetsPlay))
	{	return TRUE;};
};
func void DIA_Zedd_AfterScaredVales_info()
{
	var C_NPC Zedd;		Zedd = Hlp_GetNpc(PIR_203_DS2P_Zedd);
	var C_NPC Joseph;	Joseph = Hlp_GetNpc(PIR_205_DS2P_Joseph);
	var C_NPC Vales;	Vales = Hlp_GetNpc(PIR_209_DS2P_Vales);

	//Подключаем Джозефа
	TRIA_Invite(Joseph);
	TRIA_Start();

	TRIA_Next(Zedd);
	AI_Output(other,self,"DIA_Zedd_AfterScaredVales_15_00");	//Похоже сработало.
	//Зедд и Джозеф переодеваются в свои броньки
	Npc_RemoveInvItem(Zedd,ITAR_DS2P_GHOST);		AI_EquipBestArmor(Zedd);
	AI_EquipBestMeleeWeapon(Zedd);		AI_EquipBestRangedWeapon(Zedd);
	Npc_RemoveInvItem(Joseph,ITAR_DS2P_GHOST);	AI_EquipBestArmor(Joseph);
	AI_EquipBestMeleeWeapon(Joseph);	AI_EquipBestRangedWeapon(Joseph);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_01");	//Я думал, у Валеса глаза из орбит вылезут, вот потеха.
	//Выпивает грога
	CreateInvItem(Zedd,ItFo_Addon_Grog);
	AI_UseItem(Zedd,ItFo_Addon_Grog);
	TRIA_Next(Zedd);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_02");	//Джозеф, ты это видел?
	TRIA_Next(Joseph);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_03_Joseph");	//Я думал, в штаны наделаю от смеха! Парням расскажу – не поверят. Ха-ха-ха!
	TRIA_Next(Zedd);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_04");	//А наш друг, похоже, лужу-то наделал. (громко смеется)
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_05");	//Ладно, мы так повеселились, что не будем с Валеса трясти золото. Это уже твое дело, как с ним поступить. Да, Джозеф?
	TRIA_Next(Joseph);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_06_Joseph");	//(сквозь смех) Ух... Это представление не купить ни за какие монеты! 
	TRIA_Next(Zedd);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_07");	//Это точно. 
	TRIA_Next(Joseph);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_08_Joseph");	//Зедд, пойдем еще накатим.
	TRIA_Next(Zedd);
		AI_Output(self,other,"DIA_Zedd_AfterScaredVales_13_09");	//С удовольствием!
	//Диалог обрывается, Зедд и Джозеф уходят.
	B_StartOtherRoutine(Zedd,"MAIN");
	B_StartOtherRoutine(Joseph,"START");
	AI_StopProcessInfos(self);
	
	//Запись в дневнике "Азартный игрок" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_ZeddSuccess);

	//Валес возвращается на свое место
	B_StartOtherRoutine(Vales,"START");
};


//NS - 10/03/2016 ====================================================
// По квесту "Орк в беде"
//====================================================================

//----------------------------
//Нужно купить крепкй самогон
instance DIA_Zedd_OrcBooze(C_Info)
{
	npc = PIR_203_DS2P_Zedd;						nr = 50;
	condition = DIA_Zedd_OrcBooze_condition;	
	information = DIA_Zedd_OrcBooze_info;
	description = "Ты можешь мне приготовить очень крепкий самогон?";
};
func int DIA_Zedd_OrcBooze_condition()
{
	if (MIS_DS2P_OrcInTrouble == LOG_Running)	{
		return TRUE;
	};
};
func void DIA_Zedd_OrcBooze_info()
{
	AI_Output(other,self,"DIA_Zedd_OrcBooze_15_01");	//Ты можешь мне приготовить очень крепкий самогон? Такой, чтобы человека от первого глотка унесло в далекие дали и надолго.
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_02");	//В принципе, могу. А тебе зачем?
	AI_Output(other,self,"DIA_Zedd_OrcBooze_15_03");	//Надо. Один сумасшедший хочет попробовать.
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_04");	//Да не вопрос. С тебя сто золотых, и я приготовлю нужное тебе пойло.
	B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_Running,TOPIC_DS2P_OrcInTrouble_Zedd);
};
//----------------------------
//Купить орочий самогон
instance DIA_Zedd_OrcBoozeBuy(C_Info)
{
	npc = PIR_203_DS2P_Zedd;						nr = 51;
	condition = DIA_Zedd_OrcBoozeBuy_condition;	
	information = DIA_Zedd_OrcBoozeBuy_info;
	description = "Вот деньги за самогон. (100 зол.)";
	permanent = TRUE;
};
func int DIA_Zedd_OrcBoozeBuy_condition()
{
	if ((MIS_DS2P_OrcInTrouble == LOG_Running)
		&& Npc_KnowsInfo(other,DIA_Zedd_OrcBooze))
	{
		return TRUE;
	};
};
func void DIA_Zedd_OrcBoozeBuy_info()
{
	AI_Output(other,self,"DIA_Zedd_OrcBooze_15_01");	//Вот деньги за самогон.
	if (B_GiveInvItems(other,self,ItMi_Gold,100))	{
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_01");	//Отлично. А вот твой самогон.
		B_GiveInvItems(self,other,ItFo_DS2P_OrcBooze,1);
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_02");	//Только я бы не советовал тебе его пробовать - уж больно заборист. Такой даже орка с ног свалит.
		B_GivePlayerXP(XP_MIS_OrcInTrouble_Booze);
	}
	else	{
		AI_Output(self,other,"DIA_Zedd_OrcBooze_13_03");	//Где? Я не настолько пьян, ик! Непорядок...
		CreateInvItem(self,ItFo_Addon_Rum);
		AI_UseItem(self,ItFo_Addon_Rum);
	};
};


//NS - 28/06/2013 ====================================================
// ТОРГОВЛЯ				nr=90
//====================================================================
instance DIA_Zedd_TRADE(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 90;
	condition = DIA_Zedd_TRADE_condition;	
	information = DIA_Zedd_TRADE_info;
	description = "Покажи свои товары.";
	permanent = TRUE;
	trade = TRUE;
};
func int DIA_Zedd_TRADE_condition()
{
	if (TRADE_Zedd == TRUE)	{	return TRUE;	};
};
func void DIA_Zedd_TRADE_info()
{
	AI_Output(other,self,"DIA_Zedd_TRADE_15_00");	//Покажи свои товары.
		AI_Output(self,other,"DIA_Zedd_TRADE_13_01");	//Смотри, выбирай, наливай. (смеется)
	B_GiveTradeInv(self);
};


//NS - 28/06/2013 ====================================================
// СОРЕВНОВАНИЕ  

//Суть игры такая: мы пьем, пока ГГ или Зедд не упадет в обморок.
//Зедд никогда не упадет раньше 3х выпитых бутылок
//ГГ никогда не упадет раньше 1й выпитой бутылки
//Рандом для Зедда включается после 3й бутылки
//Рандом для ГГ включается после 1 бутылки.

//NS - вероятность проигрыша после каждой выпитой бутылки
//	1	2	3	4	5	6	7	8	9	10
//	30%	51%	66%	38%	21%	11%	6%	3%	1%	0%
// т.е. если ГГ продержался 3 раунда, дальше шансы на победу возрастают
//====================================================================

//--------------------------------
//  "Давай соревноваться."		nr=200
instance DIA_Zedd_Competition(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 200;
	condition = DIA_Zedd_Competition_condition;	
	information = DIA_Zedd_Competition_info;
	description = "Давай соревноваться.";
};
func int DIA_Zedd_Competition_condition()
{
	if (Zedd_Competition == TRUE)	{	return TRUE;	};
};
func void DIA_Zedd_Competition_Drink()
{
	CreateInvItem(other,ItFo_DS2P_Booze_Zedd);
	AI_UseItem(other,ItFo_DS2P_Booze_Zedd);
	CreateInvItem(self,ItFo_DS2P_Booze_Zedd);
	AI_UseItem(self,ItFo_DS2P_Booze_Zedd);
};
func void DIA_Zedd_Competition_Menu()
{
	Info_ClearChoices(DIA_Zedd_Competition);
	Info_AddChoice(DIA_Zedd_Competition,"Нет.",DIA_Zedd_Competition_No);
	Info_AddChoice(DIA_Zedd_Competition,"Да.",DIA_Zedd_Competition_Yes);
};
func void DIA_Zedd_Competition_info()
{
	AI_Output(other,self,"DIA_Zedd_Competition_15_00");	//Давай соревноваться
	//Если пришел раньше
	if (Wld_GetDay() < Zedd_Competition_NextDay)
	{
		AI_Output(self,other,"DIA_Zedd_Competition_13_01");	//Ты что? Какое соревнование? Я еще от предыдущего не отошел.
		AI_Output(self,other,"DIA_Zedd_Competition_13_02");	//Или ты хочешь схитрить, споив меня, а потом обчистить?! Не, не выйдет! Завтра продолжим.
		return;
	};
	//Если нет денег
	if (Npc_HasItems(other, ItMi_Gold) < 100)
	{
		AI_Output(self,other,"DIA_Zedd_Competition_13_03");	//Э нет, я задаром с тобой не буду соревноваться, потому как это уже не соревнование, а обычная пьянка.
		AI_Output(self,other,"DIA_Zedd_Competition_13_04");	//А мне помощник в этом деле не нужен. Принесешь сто монет, тогда поговорим.
		return;
	};
	
	//Соревноваться
	Zedd_Competition_NextDay = Wld_GetDay() + 1;
		AI_Output(self,other,"DIA_Zedd_Competition_13_05");	//Отлично. Тебе повезло, что я добрый, и не беру с тебя деньги за выпивку. Начинай!
	// оба выпивают
	DIA_Zedd_Competition_Drink();
	Zedd_Competition_Cnt = 1;
	
		AI_Output(self,other,"DIA_Zedd_Competition_13_06");	//Хорошо пошла. Продолжим?
	DIA_Zedd_Competition_Menu();
};
func void DIA_Zedd_Competition_No()
{
	var int x;
	AI_Output(other,self,"DIA_Zedd_Competition_No_15_07");	//Нет.
		AI_Output(self,other,"DIA_Zedd_Competition_No_13_08");	//Ха! Слабак! Я так и знал. Отдавай мое золотишко.
	//Забирает 100 монет
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems(other,self,ItMi_Gold,100);
	};
	Info_ClearChoices(DIA_Zedd_Competition);
};
func void DIA_Zedd_Competition_Yes()
{
	var C_NPC npc_nil;	//никто
	var int Unc_Time;
	var int x;
	AI_Output(other,self,"DIA_Zedd_Competition_Yes_15_09");	//Да.
		AI_Output(self,other,"DIA_Zedd_Competition_Yes_13_10");	//Поехали!
	// оба выпивают
	DIA_Zedd_Competition_Drink();
	Wld_PlayEffect("SLOW_TIME_IMMEDIAT",other,other,0,0,0,FALSE);
	Zedd_Competition_Cnt += 1;
	if ((Zedd_Competition_Cnt > 3) && (C_Random(100) < 50))	//шанс, что Зедд свалится
	{
		Unc_Time = self.aivar[AIV_TIME_UNCONSCIOUS];
		self.aivar[AIV_TIME_UNCONSCIOUS] = 3;
		Npc_DropUnconscious(self,0,npc_nil);
		AI_Wait(self,10.0);
		self.aivar[AIV_TIME_UNCONSCIOUS] = Unc_Time;
		AI_Output(self,other,"DIA_Zedd_Competition_Yes_13_11");	//О как! Что-то я сегодня не в форме. А ты крепкий малый! Надо отдохнуть чуток.
		//Получаем 100 монет.
		x = 1; if (x == 1) {
			B_GiveInvItems(self,other,ItMi_Gold,100);
		};
		Info_ClearChoices(DIA_Zedd_Competition);
		return;
	};
	if ((Zedd_Competition_Cnt > 1) && (C_Random(100) < 25))	//шанс, что ГГ свалится
	{
		Unc_Time = other.aivar[AIV_TIME_UNCONSCIOUS];
		other.aivar[AIV_TIME_UNCONSCIOUS] = 3;
		Npc_DropUnconscious(other,0,npc_nil);
		AI_Wait(self,10.0);
		other.aivar[AIV_TIME_UNCONSCIOUS] = Unc_Time;
		AI_Output(self,other,"DIA_Zedd_Competition_Yes_13_12");	//Вставай, выпивоха! Куда тебе тягаться с Зеддом! (смеется)
		//Забирает 100 монет
		x = 1; if (x == 1) {
			B_DS_GiveRemoveItems(other,self,ItMi_Gold,100);
		};
		Info_ClearChoices(DIA_Zedd_Competition);
		return;
	};
		AI_Output(self,other,"DIA_Zedd_Competition_Yes_13_13");	//Еще?
	DIA_Zedd_Competition_Menu();
};

// Активируется, если взят квест "Заговор"
// nr = 1

instance DIA_Zedd_AboutConspiracy(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Zedd_AboutConspiracy_condition;	
	information = DIA_Zedd_AboutConspiracy_info;
	description = "Можно кое о чем спросить?";
};

func int DIA_Zedd_AboutConspiracy_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && C_DIA_Greg_OurIdea_Know_AboutZedd)	
	{	
		return TRUE;	
	};
};

func void DIA_Zedd_AboutConspiracy_Menu()
{
	Info_ClearChoices(DIA_Zedd_AboutConspiracy);
	Info_AddChoice(DIA_Zedd_AboutConspiracy,"Извини, нету.",DIA_Zedd_AboutConspiracy_Nothing);
	if (Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(Дать вино)",DIA_Zedd_AboutConspiracy_HasWine);
	};
	if (Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(Дать грог)",DIA_Zedd_AboutConspiracy_HasGrog);
	};
	if (Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(Дать ром)",DIA_Zedd_AboutConspiracy_HasRum);
	};
	if (Npc_HasItems(other,ItFo_Samogon) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(Дать самогон)",DIA_Zedd_AboutConspiracy_HasSamogon);
	};
	if (Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		Info_AddChoice(DIA_Zedd_AboutConspiracy,"(Дать пиво)",DIA_Zedd_AboutConspiracy_HasBeer);
	};
};

func void DIA_Zedd_AboutConspiracy_info()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_15_00");	//Можно кое о чем спросить?
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_13_01");	//Валяй!
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_15_02");	//Я слышал, что ты занимаешься на корабле распределением добычи. Это так?
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_13_03");	//А что если и так?
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_15_04");	//Да мне интересно просто, сколько вы все зарабатываете.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_13_05");	//Ха, всем интересно. Но если ты меня угостишь чем-нибудь покрепче, то я, может, и расскажу тебе о том, что тебя интересует.
	DIA_Zedd_AboutConspiracy_Menu();
};

// Запускается, если выбрать реплику "Извини, нету." в диалоге Зедда

func void DIA_Zedd_AboutConspiracy_Nothing()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_Nothing_15_00");	//Извини, нету.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_Nothing_13_01");	//Как только найдешь выпить, приходи ко мне.
	AI_StopProcessInfos(self);
};

// Запускается после того, как дали Зедду выпивку

func void DIA_Zedd_AboutConspiracy_Continue()
{
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_01");	//(сыто отрыгивает) Ох, какое блаженство! Так на чем мы остановились?
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_02");	//Ты обещал рассказать мне о ваших заработках.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_03");	//А, там и рассказывать-то нечего. Вот, можешь посмотреть в мою учетную книгу, там все подробно написано: что, куда, откуда и сколько.
	// Создаем учетную книгу и отдаем ГГ
	CreateInvItems(self,ItWr_DS2P_ZeddDiary,1);
	B_GiveInvItems(self,other,ItWr_DS2P_ZeddDiary,1);
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_04");	//И ты мне просто так ее даешь?
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_05");	//Пфф, было бы там что-то ценное.
	// ГГ читает дневник
	AI_StopLookAt(other);
	AI_UseItemToState(other,Fakescroll,1);
	AI_Wait(other,3);
	AI_UseItemToState(other,Fakescroll,-1);
	B_LookAtNpc(other,self);
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_06");	//(про себя) Этого просто не может быть. С виду все правильно и честно. Но не может же пират быть настолько беспорочным. Это просто в голове не укладывается.
	// ГГ читает дневник
	AI_StopLookAt(other);
	AI_UseItemToState(other,Fakescroll,1);
	AI_Wait(other,3);
	AI_UseItemToState(other,Fakescroll,-1);
	B_LookAtNpc(other,self);
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_07");	//(про себя) Нет, такого попросту не бывает.
	// Отдаем дневник Зедду
	B_GiveInvItems(other,self,ItWr_DS2P_ZeddDiary,1);
	// Удаляем дневник
	Npc_RemoveInvItems(self,ItWr_DS2P_ZeddDiary,1);
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_08");	//Довольно интересно. Может тоже в пираты податься, я погляжу заработки у вас тут неплохие.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_09");	//Хе, если Гард тебя примет, то пожалуйста. Такие шустрые ребята, как ты нам нужны. Подумаешь?
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_10");	//Подумаю. Кроме того я уже состоял в пиратской команде.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_11");	//Да ладно! И под чьим началом ходил?
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_12");	//Под греговским. Однако наши дорожки очень быстро разбежались – такого жадного капитана я еще не встречал.
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_13");	//Что есть, то есть – из Грега монетки лишней не выпросишь, когда надо. Вот только наш Гард не такой – он всегда заботится о своих людях, хоть по его виду это и не скажешь.
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_14");	//Ладно, пойду я, дел еще много. Бывай!
	AI_Output(self,other,"DIA_Zedd_AboutConspiracy_HasWine_13_15");	//(отрыгивает)
	Zedd_IsDrunken_Conspiracy = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_Running,TOPIC_DS2P_CompromiseZedd_Start);
};

// Запускается, если выбрать реплику "(Дать вино)" в диалоге Зедда

func void DIA_Zedd_AboutConspiracy_HasWine()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//Держи!
	// Отдаем Зедду выпивку
	B_GiveInvItems(other,self,ItFo_Wine,1);
	// Зедд пьет
	AI_UseItem(self,ItFo_Wine);
	DIA_Zedd_AboutConspiracy_Continue();
};

// Запускается, если выбрать реплику "(Дать грог)" в диалоге Зедда

func void DIA_Zedd_AboutConspiracy_HasGrog()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//Держи!
	// Отдаем Зедду выпивку
	B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	// Зедд пьет
	AI_UseItem(self,ItFo_Addon_Grog);
	DIA_Zedd_AboutConspiracy_Continue();
};

// Запускается, если выбрать реплику "(Дать ром)" в диалоге Зедда

func void DIA_Zedd_AboutConspiracy_HasRum()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//Держи!
	// Отдаем Зедду выпивку
	B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	// Зедд пьет
	AI_UseItem(self,ItFo_Addon_Rum);
	DIA_Zedd_AboutConspiracy_Continue();
};

// Запускается, если выбрать реплику "(Дать самогон)" в диалоге Зедда

func void DIA_Zedd_AboutConspiracy_HasSamogon()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//Держи!
	// Отдаем Зедду выпивку
	B_GiveInvItems(other,self,ItFo_Samogon,1);
	// Зедд пьет
	AI_UseItem(self,ItFo_Samogon);
	DIA_Zedd_AboutConspiracy_Continue();
};

// Запускается, если выбрать реплику "(Дать пиво)" в диалоге Зедда

func void DIA_Zedd_AboutConspiracy_HasBeer()
{
	AI_Output(other,self,"DIA_Zedd_AboutConspiracy_HasWine_15_00");	//Держи!
	// Отдаем Зедду выпивку
	B_GiveInvItems(other,self,ItFo_Beer,1);
	// Зедд пьет
	AI_UseItem(self,ItFo_Beer);
	DIA_Zedd_AboutConspiracy_Continue();
};

// Активируется, если с самого начала не дали Зедду выпивку по квесту "Заговор"
// nr = 1

instance DIA_Zedd_AboutConspiracy_Again(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Zedd_AboutConspiracy_Again_condition;	
	information = DIA_Zedd_AboutConspiracy_Again_info;
	description = "Держи...";
};

func int DIA_Zedd_AboutConspiracy_Again_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running)
		 && Npc_KnowsInfo(other,DIA_Zedd_AboutConspiracy) && !Zedd_IsDrunken_Conspiracy)	
	{	
		return TRUE;	
	};
};

func void DIA_Zedd_AboutConspiracy_Again_info()
{
	DIA_Zedd_AboutConspiracy_Menu();
};

// Активируется после взятия квеста "Компромат на Зедда", и у ГГ есть навык карманной кражи
// nr = 555

instance DIA_Zedd_ZeddCompromise_Map(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 555;
	permanent = FALSE;
	condition = DIA_Zedd_ZeddCompromise_Map_condition;	
	information = DIA_Zedd_ZeddCompromise_Map_info;
	description = "(украсть его карту и ключ будет просто)";
};

func int DIA_Zedd_ZeddCompromise_Map_condition()
{
	if (MIS_DS2P_CompromiseZedd == Log_Running)	
	{
		if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) > PICKPOCKET_LEVEL_NONE)
		{
			return TRUE;
		};
	};
};

func void DIA_Zedd_ZeddCompromise_Map_info()
{
	// Создаем карту в инвентаре Зедда и отдаем ГГ
	CreateInvItems(self,ItWr_DS2P_ZeddCompromise_Map,1);
	B_GiveInvItems(self,other,ItWr_DS2P_ZeddCompromise_Map,1);
	// Создаем ключ в инвентаре Зедда и отдаем ГГ
	CreateInvItems(self,ITKE_Key_DS2P_ZEDDCOMPROMISE,1);
	B_GiveInvItems(self,other,ITKE_Key_DS2P_ZEDDCOMPROMISE,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_Running,TOPIC_DS2P_CompromiseZedd_Map);
};

// Активируется после взятия квеста "Компромат на Зедда", у ГГ должна быть учетная книга, и он ее прочел
// nr = 1

instance DIA_Zedd_ZeddCompromise_Diary(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Zedd_ZeddCompromise_Diary_condition;	
	information = DIA_Zedd_ZeddCompromise_Diary_info;
	description = "Смотри, что я нашел.";
};

func int DIA_Zedd_ZeddCompromise_Diary_condition()
{
	if ((MIS_DS2P_CompromiseZedd == Log_Running)
		 && (Npc_HasItems(other,ItWr_DS2P_ZeddDiary) >= 1)
		 && (Hero_IsReadZeddDiary == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Zedd_ZeddCompromise_Diary_info()
{
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_00");	//Смотри, что я нашел.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_01");	//Вижу, книга. Ты, думаешь, я никогда до этого их не видел? Спешу тебя разочаровать.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_02");	//Я не о том. У нее очень интересное содержание. Прямо-таки смертельное содержание. Для кого-то.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_03");	//(нервно) Э-э, не понимаю, о чем ты.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_04");	//(притворно) Да? Пойду Гарду покажу. Думаю, ему очень понравится содержимое книги.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_05");	//Стой! Не уходи.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_06");	//Может, договоримся? Сколько ты хочешь?
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_07");	//Деньги меня сейчас интересуют в последнюю очередь.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_08");	//А что тебе надо?
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_09");	//Я хочу, чтобы ты проголосовал на грядущем собрании пиратов за Грега.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_10");	//Собрание? Какое собрание? Неужели меня опять забыли предупредить?
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_11");	//Нет, не волнуйся. О том, что скоро состоится общее собрание пиратов, пока мало кто знает. Мы с Грегом хотим сместить Гарда. Если ты на голосовании отдашь свой голос за Грега, то я отдам тебе твою книгу. Идет?
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_12");	//Эх, крепко ты меня прихватил за яйца. У меня и выбора-то нет. Ладно, согласен. Давай мне книгу.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_13");	//Э, нет, хитрюга. Пока голосование не пройдет успешно, книгу свою ты не получишь.
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_14");	//Может, я все же выкуплю ее просто у тебя, а? Вы ведь можете  и проиграть с Грегом.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_15");	//А вот это зависит исключительно от тебя. Если ты проголосуешь за одноглазого и не станешь пытаться юлить, как-то предупредить Гарда – поверь, я узнаю, если ты попытаешься – или выкинуть какой иной фокус, я отдам тебе твою книгу. Слово!
	AI_Output(self,other,"DIA_Zedd_ZeddCompromise_Diary_13_16");	//Ладно. Выбора все равно нет. Виселица или хождение под началом Грега? Второе определенно безопаснее.
	AI_Output(other,self,"DIA_Zedd_ZeddCompromise_Diary_15_17");	//Я рад, что мы пришли к взаимному соглашению.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_Running,TOPIC_DS2P_CompromiseZedd_Compr);
	Zedd_InConspiracy = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_ZeddIn);
};

// Активируется, если взят квест "Компромат на Зедда", квест "Заговор" выполнен и Гард мертв
// nr = 1

instance DIA_Zedd_BringBackDiary(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Zedd_BringBackDiary_condition;	
	information = DIA_Zedd_BringBackDiary_info;
	description = " ";
};

func int DIA_Zedd_BringBackDiary_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && (Conspiracy_IsStarted == TRUE) && Npc_IsDead(Gard))	
	{
		return TRUE;
	};
};

func void DIA_Zedd_BringBackDiary_info()
{
	AI_Output(self,other,"DIA_Zedd_BringBackDiary_13_00");	//(шепотом) Теперь, когда Грег стал капитаном, верни мне мою учетную книгу, как и обещал.
	Info_ClearChoices(DIA_Zedd_BringBackDiary);
	Info_AddChoice(DIA_Zedd_BringBackDiary,"У меня ее с собой нет.",DIA_Zedd_BringBackDiary_No);
	if (Npc_HasItems(other,ItWr_DS2P_ZeddDiary) >= 1) // Если у ГГ есть учетная книга
	{
		Info_AddChoice(DIA_Zedd_BringBackDiary,"Вот, держи.",DIA_Zedd_BringBackDiary_Yes);
	};
};

// Запускается, если выбрать реплику "У меня ее с собой нет." в диалоге с Зеддом

func void DIA_Zedd_BringBackDiary_No()
{
	AI_Output(other,self,"DIA_Zedd_BringBackDiary_No_15_00");	//У меня ее с собой нет.
	AI_Output(self,other,"DIA_Zedd_BringBackDiary_No_13_01");	//Что? Что значит – нет?
	AI_Output(other,self,"DIA_Zedd_BringBackDiary_No_15_02");	//Я не дурак, чтобы носить ее с собой.
	AI_Output(self,other,"DIA_Zedd_BringBackDiary_No_13_03");	//Тогда забери ее из своего тайника и верни мне. Быстро!
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Вот, держи." в диалоге с Зеддом

func void DIA_Zedd_BringBackDiary_Yes()
{
	AI_Output(other,self,"DIA_Zedd_BringBackDiary_Yes_15_00");	//Вот, держи.
	// Отдаем книгу Зедду
	B_GiveInvItems(other,self,ItWr_DS2P_ZeddDiary,1);
	AI_Output(self,other,"DIA_Zedd_BringBackDiary_Yes_13_01");	//Отлично! Уж теперь, я ее так запрячу, что сам Белиар ее не найдет.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,Log_Mission,Log_Success,TOPIC_DS2P_CompromiseZedd_Success);
	B_GivePlayerXP(XP_MIS_DS2P_CompromiseZedd);
	B_StartOtherRoutine(self,"START");
	AI_StopProcessInfos(self);
};
	
// Активируется, если взят квест "Компромат на Зедда" и ГГ с самого начала не отдал книгу
// nr = 1

instance DIA_Zedd_BringBackDiary2(C_Info)
{
	npc = PIR_203_DS2P_Zedd;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Zedd_BringBackDiary2_condition;	
	information = DIA_Zedd_BringBackDiary_Yes;
	description = "Вот, держи.";
};

func int DIA_Zedd_BringBackDiary2_condition()
{
	if (MIS_DS2P_Conspiracy == Log_Running && Npc_KnowsInfo(other,DIA_Zedd_BringBackDiary) && Npc_HasItems(other,ItWr_DS2P_ZeddDiary) >= 1)	
	{
		return TRUE;
	};
};
	
	