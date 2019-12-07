instance DIA_Huno_EXIT(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Huno_EXIT_condition;	
	information = DIA_Huno_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Huno_EXIT_condition(){	return TRUE;};
func void DIA_Huno_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 23/06/2013 ===========
//  Стартовый: Кто ты? 
//===========================
instance DIA_Huno_Start(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 0;
	condition = DIA_Huno_Start_condition;	
	information = DIA_Huno_Start_info;
	description = "Кто ты?";
};
func int DIA_Huno_Start_condition()
{
	return TRUE;
};
func void DIA_Huno_Start_info()
{
	AI_Output(other,self,"DIA_Huno_Start_15_00");	//Кто ты?
		AI_Output(self,other,"DIA_Huno_Start_13_01");	//Я Хуно, пахарь. С утра до вечера работаю в поле, выращиваю пшеницу.
		AI_Output(self,other,"DIA_Huno_Start_13_02");	//Работа, конечно, не предел мечтаний, но мне нравится.
		AI_Output(self,other,"DIA_Huno_Start_13_03");	//За столько лет я уже так привык, что если хотя бы день не покопаюсь в земле, чувствую себя не в своей тарелке. (смеется)
};


//NS - 23/06/2013 ===========
//  Общий вопросы после знакомства
//===========================

// ---------------------------------
// "А кто еще работает в поле?"	nr = 1
instance DIA_Huno_WhoElseWorkOnFields(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 1;
	condition = DIA_Huno_WhoElseWorkOnFields_condition;	
	information = DIA_Huno_WhoElseWorkOnFields_info;
	description = "А кто еще работает в поле?";
};
func int DIA_Huno_WhoElseWorkOnFields_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_Start)) 
	{	return TRUE;	};
};
func void DIA_Huno_WhoElseWorkOnFields_info()
{
	AI_Output(other,self,"DIA_Huno_WhoElseWorkOnFields_15_00");	//А кто еще работает в поле?
		AI_Output(self,other,"DIA_Huno_WhoElseWorkOnFields_13_01");	//Сейчас мне помогает только Никки и пару крестьян. Раньше еще работали Лулу и Виола, но пираты утащили их в “Привал Путника“, небольшую пещеру неподалеку от деревни.
		AI_Output(self,other,"DIA_Huno_WhoElseWorkOnFields_13_02");	//Поэтому не думаю, что смогу собрать большой урожай в этом году. Сейчас как раз бы не помешали лишние руки. 
	AI_Output(other,self,"DIA_Huno_WhoElseWorkOnFields_15_03");	//Почему пираты удерживают их в пещере?
		AI_Output(self,other,"DIA_Huno_WhoElseWorkOnFields_13_04");	//Ну так понятное дело, чтобы мы сидели тихо-мирно, и не задумали их всех на вилы поставить.
		AI_Output(self,other,"DIA_Huno_WhoElseWorkOnFields_13_05");	//У меня давно руки чешутся с ними поквитаться за все.
};

// ---------------------------------
// "Как урожай?" (постоянный)	nr = 2
instance DIA_Huno_AboutYield(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 2;
	condition = DIA_Huno_AboutYield_condition;	
	information = DIA_Huno_AboutYield_info;
	permanent = TRUE;
	description = "Как урожай?";
};
func int DIA_Huno_AboutYield_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_Start)) 
	{	return TRUE;	};
};
func void DIA_Huno_AboutYield_info()
{
	AI_Output(other,self,"DIA_Huno_AboutYield_15_00");	//Как урожай?
		AI_Output(self,other,"DIA_Huno_AboutYield_13_01");	//Рано еще об урожае думать. Еще работать и работать! 
};

// ---------------------------------
// "Расскажи мне об острове."	nr = 3
instance DIA_Huno_AboutIsland(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 3;
	condition = DIA_Huno_AboutIsland_condition;	
	information = DIA_Huno_AboutIsland_info;
	description = "Расскажи мне об острове.";
};
func int DIA_Huno_AboutIsland_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_Start)) 
	{	return TRUE;	};
};
func void DIA_Huno_AboutIsland_info()
{
	AI_Output(other,self,"DIA_Huno_AboutIsland_15_00");	//Расскажи мне об острове.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_01");	//Ну, то, что деревня тут есть, ты и сам уже понял. (смеется)
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_02");	//А вот дальше советую не ходить. Наши леса просто кишат дикими волками, кабанами и прочей опасной дичью. Загрызут, глазом моргнуть не успеешь.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_03");	//Но это еще цветочки. В глухих местах, я слышал, варги завелись, эти пострашнее всех волков вместе взятых будут.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_04");	//Но и это все ерунда. Вот если ты мракориса встретишь, да еще ненароком разбудишь, то все – молись не молись Инносу, а поздно. Одним прыжком тебя прихлопнет.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_05");	//И это в том случае, что ты недалеко забредешь. А вот если на болота сунешься, то все. Не трясина засосет, так гоблины поймают да в котле сварят; а если гоблины не поймают, болотный голем в землю вобьет одним ударом, что даже макушки не видно будет.
		AI_Output(self,other,"DIA_Huno_AboutIsland_13_06");	//Да и это опять же ерунда. Вот если ты к драконьему пику пойдешь, то... Ну, тут тебе и рассказывать не стоит, сам уже все понять должен был.
};

// ---------------------------------
// "У вас на острове есть драконы?"	nr = 3
instance DIA_Huno_AboutDragons(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 3;
	condition = DIA_Huno_AboutDragons_condition;	
	information = DIA_Huno_AboutDragons_info;
	description = "У вас на острове есть драконы?";
};
func int DIA_Huno_AboutDragons_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_AboutIsland)) 
	{	return TRUE;	};
};
func void DIA_Huno_AboutDragons_info()
{
	AI_Output(other,self,"DIA_Huno_AboutDragons_15_00");	//У вас на острове есть драконы?
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_01");	//Ну, как есть?! Были когда-то, в далекой-далекой древности.
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_02");	//Ходит молва, что их тут много было. Они прилетали по ночам и сжирали путников, которые не успели найти ночлег.
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_03");	//Поэтому-то пещерка возле деревни и зовется “Привалом Путника“. Там ночевали те, кто вовремя не успел вернуться в поселение.
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_04");	//Не в нашу деревню, конечно. Тут раньше целый город был, да все быльем уже поросло.
	AI_Output(other,self,"DIA_Huno_AboutDragons_15_05");	//А в последнее время драконы не появлялись? В Хоринисе мне довелось встретиться с несколькими.
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_06");	//(недоверчиво смотрит) Ты ври-ври, да не завирайся! Откуда в наше время взяться драконам-то!
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_07");	//Думаешь, Хуно совсем из ума выжил и в басни всякие верит?
		AI_Output(self,other,"DIA_Huno_AboutDragons_13_08");	//Эээ нет! Драконы – это сказки для детей, чтобы те слушались, да не безобразничали, а то их папка скормит одному из них за плохое поведение. (громко смеется)

};

//NS - 24/06/2013 ===========
//  По квесту "Инструменты для Хуно"
//===========================

// ---------------------------------
// "У тебя усталый вид."	nr = 1
instance DIA_Huno_USeemTired(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 1;
	condition = DIA_Huno_USeemTired_condition;	
	information = DIA_Huno_USeemTired_info;
	description = "У тебя усталый вид.";
};
func int DIA_Huno_USeemTired_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_WhoElseWorkOnFields)) 
	{	return TRUE;	};
};
func void DIA_Huno_USeemTired_info()
{
	AI_Output(other,self,"DIA_Huno_USeemTired_15_00");	//У тебя усталый вид.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_01");	//Еще бы. Мало того, что в поле работать некому, так еще и моя мотыга почти развалилась.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_02");	//Еще пару дней и ее можно будет выбросить. Хоть руками землю обрабатывай. Но и это еще не все.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_03");	//Скоро созреет урожай, а серпов у меня нет. Я еще полгода назад просил Густава сделать новые, но он все отнекивался, дескать, некогда, потом да потом.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_04");	//А теперь нет ни Густава, ни серпов. В общем, если так все и останется, зимой мы будем не хлеб кушать, а снег со льдом грызть.
		AI_Output(self,other,"DIA_Huno_USeemTired_13_05");	//Оно, конечно, может большинству и нормально, но я как-то не привыкший.
};

// ---------------------------------
// "Я помогу тебе с инструментами."	nr = 1
instance DIA_Huno_HelpWithInstruments(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 1;
	condition = DIA_Huno_HelpWithInstruments_condition;	
	information = DIA_Huno_HelpWithInstruments_info;
	description = "Я помогу тебе с инструментами.";
};
func int DIA_Huno_HelpWithInstruments_condition()
{
	if (Npc_KnowsInfo(other,DIA_Huno_USeemTired)) 
	{	return TRUE;	};
};
func void DIA_Huno_HelpWithInstruments_info()
{
	AI_Output(other,self,"DIA_Huno_HelpWithInstruments_15_00");	//Я помогу тебе с инструментами.
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_01");	//И как интересно, у тебя это получится, скажи на милость? Или ты сам может кузнец?
	AI_Output(other,self,"DIA_Huno_HelpWithInstruments_15_02");	//Ну как тебе сказать, я больше по оружию...
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_03");	//Вот и я о том же. Вижу только один вариант – пойти к пиратам и просить их кузнеца сделать инструменты.
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_04");	//По-моему, его Джозефом звать. Он сейчас работает в кузне Густава.
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_05");	//Не знаю, как у тебя получится его убедить, но если сумеешь, то я отблагодарю тебя от чистого сердца. Да, что там?! Вся деревня тебе жизнью обязана будет!
	AI_Output(other,self,"DIA_Huno_HelpWithInstruments_15_06");	//Хорошо, я все сделаю.
		AI_Output(self,other,"DIA_Huno_HelpWithInstruments_13_07");	//Мне нужно две новые мотыги и пять серпов. Смотри, не перепутай.

	//Запись в дневнике "Инструменты для Хуно" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_Running,TOPIC_DS2P_Tools4Huno_Start);
};

// ---------------------------------
// "Вот необходимые инструменты."	nr = 1
// квест еще не сдан и есть инструменты, неважно откуда
instance DIA_Huno_GiveInstruments(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 1;
	condition = DIA_Huno_GiveInstruments_condition;	
	information = DIA_Huno_GiveInstruments_info;
	description = "Вот необходимые инструменты. ";
};
func int DIA_Huno_GiveInstruments_condition()
{
	if ((MIS_DS2P_Tools4Huno == LOG_Running)
		&& (Npc_HasItems(other, ItMi_Rake) >= 2) && (Npc_HasItems(other, ItMw_1h_Bau_Axe) >= 5))
	{	return TRUE;	};
};
func void DIA_Huno_GiveInstruments_info()
{
	var int x;
	AI_Output(other,self,"DIA_Huno_GiveInstruments_15_00");	//Вот необходимые инструменты. 
	// Отдаем инструменты
	x = 1; if (x == 1) {
		B_GiveInvItem_red(other,self,ItMi_Rake,2,YPOS_ItemTaken);
		B_GiveInvItem_red(other,self,ItMw_1h_Bau_Axe,5,YPOS_ItemTaken + 3);
	};
		AI_Output(self,other,"DIA_Huno_GiveInstruments_13_01");	//Вот это да! Как тебе удалось добыть инструменты? Невероятно!
		AI_Output(self,other,"DIA_Huno_GiveInstruments_13_02");	//Ты спас не только меня, ты спас всех нас! Держи это золото.
	// Дает 500 золотых
	x = 2; if (x == 2) {
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
		AI_Output(self,other,"DIA_Huno_GiveInstruments_13_03");	//Я копил его не один год, но жизнь, как говорится, дороже!
	
	//Запись в дневнике "Инструменты для Хуно" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Tools4Huno,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_Tools4Huno_Success);
};

//NS - 27/06/2013 ===========
// По квесту "Кто украл мое железо?" 	nr=101
//===========================

instance DIA_Huno_AboutStolenIron(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 101;
	condition = DIA_Huno_AboutStolenIron_condition;	
	information = DIA_Huno_AboutStolenIron_info;
	description = "Ты не видел никого подозрительного возле кузницы?";
};
func int DIA_Huno_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Huno_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Huno_AboutStolenIron_15_00");	//Ты не видел никого подозрительного возле кузницы?
		AI_Output(self,other,"DIA_Huno_AboutStolenIron_13_01");	//Видел, конечно. Там постоянно отирается какой-то пират. По-моему, его звать Джозеф.
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 27/06/2013 ================================================
// После ремонта мельницы (+5 буханок хлеба. 50 золотых)
//================================================================

instance DIA_Huno_MillRepaired(C_Info)
{
	npc = BAU_108_DS2P_Huno;
	nr = 0;
	condition = DIA_Huno_MillRepaired_condition;	
	information = DIA_Huno_MillRepaired_info;
	important = TRUE;
};
func int DIA_Huno_MillRepaired_condition()
{
	if (Joseph_RepairMill_Done == TRUE)	{	return TRUE;	};
};
func void DIA_Huno_MillRepaired_info()
{
	var int x;
		AI_Output(self,other,"DIA_Huno_MillRepaired_13_00");	//Да храни тебя Иннос, добрый человек. Если бы не ты, не пережить бы нам будущую зиму.
		AI_Output(self,other,"DIA_Huno_MillRepaired_13_01");	//Вот, возьми мой скромный подарок.
	//Дает 5 буханок хлеба и 50 монет
	x = 1; if (x == 1) {
		B_GiveInvItem_red(self,other,ItFo_Bread,5,YPOS_ItemTaken);
		B_GiveInvItem_red(self,other,ItMi_Gold,50,YPOS_ItemTaken + 3);
	};
	AI_StopProcessInfos(self);
};

