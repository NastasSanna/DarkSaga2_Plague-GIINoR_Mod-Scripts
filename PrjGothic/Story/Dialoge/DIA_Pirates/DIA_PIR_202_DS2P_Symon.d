instance DIA_Symon_EXIT(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Symon_EXIT_condition;	
	information = DIA_Symon_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Symon_EXIT_condition(){	return TRUE;};
func void DIA_Symon_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 29/07/2013 ===================================
//  Знакомство
//===================================================
//	"Привет, меня зовут..."	 	nr = 1;
instance DIA_Symon_Start(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_Start_condition;	
	information = DIA_Symon_Start_info;
	description = "Привет, меня зовут...";
};
func int DIA_Symon_Start_condition()
{
	return TRUE;
};
func void DIA_Symon_Start_info()
{
	AI_Output(self,other,"DIA_Symon_Start_15_00");	//Привет, меня зовут...
		AI_Output(self,other,"DIA_Symon_Start_13_01");	//(перебивает) О, еще один сельчанин, есть мясо?
	AI_Output(self,other,"DIA_Symon_Start_15_02");	//Какое мясо?
		AI_Output(self,other,"DIA_Symon_Start_13_03");	//Обычное мясо: овечье, варга, падальщика, кротокрыса наконец! Жрать хочу, сил нет!
	AI_Output(self,other,"DIA_Symon_Start_15_04");	//Я не сельчанин, и мяса у меня нет. И даже если бы и имелось, то с чего бы мне его отдавать?
		AI_Output(self,other,"DIA_Symon_Start_13_05");	//А с того, что если ты будешь мне дерзить, получишь по зубам, не будь я Саймон, мастер двуручного клинка!
	TEACH_Symon_2H = TRUE;
};


//NS - 29/07/2013 ===================================
//  Кормежка
//===================================================
//	"С чего это ты такой голодный?"	 	nr = 10;
instance DIA_Symon_WhyUASoHungry(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 10;
	condition = DIA_Symon_WhyUASoHungry_condition;	
	information = DIA_Symon_WhyUASoHungry_info;
	description = "С чего это ты такой голодный?";
};
func int DIA_Symon_WhyUASoHungry_condition()
{
	if (Npc_KnowsInfo(other,DIA_Symon_Start))
	{	return TRUE;	};
};
func void DIA_Symon_WhyUASoHungry_info()
{
	AI_Output(self,other,"DIA_Symon_WhyUASoHungry_15_00");	//С чего это ты такой голодный?
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_01");	//Что значит с чего? Жрать кроме травы в этой чертовой деревне вообще нечего.
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_02");	//Эти долбаные охотники прячутся в лесу, вместо того чтобы снабжать нас мясом. Полудурошный пастух готов меня задушить за каждую овцу. 
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_03");	//А Гарду, похоже, вообще наплевать, что мы тут можем застрять надолго и скоро начнем ловить крыс.
	AI_Output(self,other,"DIA_Symon_WhyUASoHungry_15_04");	//И кто мешает пойти самому на охоту?
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_05");	//Я похож на самоубийцу? В лесу полно троллей, варгов и мракорисов. Кто-то из парней говорил, что неподалеку от кладбища видел нежить.
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_06");	//Я, конечно, очень хочу жрать, но сдыхать из-за своего желудка не намерен.
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_07");	//Слушай, может, заключим сделку? Ты мне приносишь жареное мясо, а я покупаю его у тебя по более интересной цене. Что скажешь?
	AI_Output(self,other,"DIA_Symon_WhyUASoHungry_15_08");	//Я подумаю.
		AI_Output(self,other,"DIA_Symon_WhyUASoHungry_13_09");	//Белиар тебя дери, чего тут думать?! Давай, быстро двигай в лес!
	AI_StopProcessInfos(self);
	//Запись в дневнике в разделе доп. инфо "Торговля у пиратов" 
	B_DSG_Log_OpenClose(TOPIC_PiratTrader,LOG_NOTE,-1,"Пират Саймон будет покупать у меня жареное мясо по более высокой цене.");
};

//----------------------------------------------------
//	"По поводу мяса..."	 	nr = 50;
instance DIA_Symon_AboutMeat(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 50;
	condition = DIA_Symon_AboutMeat_condition;	
	information = DIA_Symon_AboutMeat_info;
	description = "По поводу мяса...";
};
func int DIA_Symon_AboutMeat_condition()
{
	if (Npc_KnowsInfo(other,DIA_Symon_WhyUASoHungry))
	{	return TRUE;	};
};
func void DIA_Symon_AboutMeat_info()
{
	Info_ClearChoices(DIA_Symon_AboutMeat);
	Info_AddChoice(DIA_Symon_AboutMeat,Dialog_Back,DIA_Symon_AboutMeat_back);
	Info_AddChoice(DIA_Symon_AboutMeat,"Отдать все жареное мясо.",DIA_Symon_AboutMeat_All);
	Info_AddChoice(DIA_Symon_AboutMeat,"Отдать 10 кусков  жареного мяса.",DIA_Symon_AboutMeat_10);
	Info_AddChoice(DIA_Symon_AboutMeat,"Отдать 5 кусков  жареного мяса.",DIA_Symon_AboutMeat_5);
	Info_AddChoice(DIA_Symon_AboutMeat,"Отдать 1 кусок жареного мяса.",DIA_Symon_AboutMeat_1);
};
func void DIA_Symon_AboutMeat_back()
{
	Info_ClearChoices(DIA_Symon_AboutMeat);
};
func void DIA_Symon_AboutMeat_Give(var int cnt)
{
	if((Npc_HasItems(other,ItFoMutton) < cnt) || (cnt == 0))
	{
		AI_Output(self,other,"DIA_Symon_AboutMeat_13_00");	//(недовольно) Где мясо, Белиар тебя дери? Шутки шутить вздумал?!
	}
	else
	{
		AI_Output(self,other,"DIA_Symon_AboutMeat_13_01");	//Отлично, мечты сбываются!
		B_GiveInvItems(other, self,ItFoMutton,cnt);
	};
	Info_ClearChoices(DIA_Symon_AboutMeat);
};
func void DIA_Symon_AboutMeat_All()
{
	DIA_Symon_AboutMeat_Give(Npc_HasItems(other,ItFoMutton));
};
func void DIA_Symon_AboutMeat_10()
{
	DIA_Symon_AboutMeat_Give(10);
};
func void DIA_Symon_AboutMeat_5()
{
	DIA_Symon_AboutMeat_Give(5);
};
func void DIA_Symon_AboutMeat_1()
{
	DIA_Symon_AboutMeat_Give(1);
};


//NS - 29/07/2013 ===================================
//  Квест "Мой друг Саймон!" 
//===================================================
//	"Каковы твои обязанности в лагере?"	 	nr = 20;
instance DIA_Symon_WhatsUrJob(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 20;
	condition = DIA_Symon_WhatsUrJob_condition;	
	information = DIA_Symon_WhatsUrJob_info;
	description = "Каковы твои обязанности в лагере?";
};
func int DIA_Symon_WhatsUrJob_condition()
{
	if (Npc_KnowsInfo(other,DIA_Symon_Start))
	{	return TRUE;	};
};
func void DIA_Symon_WhatsUrJob_info()
{
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_00");	//Каковы твои обязанности в лагере?
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_01");	//Очень простые – я смотрю, чтобы крестьяне делали то, что должны, и не задавали глупых вопросов!
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_02");	//Это и тебя касается. Ты меня понял?
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_03");	//Я уже тебе говорил, что я не крестьянин! Ты же был на пристани и сам видел, как я приплыл на корабле.
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_04");	//И что? Если ты приплыл на корабле, то перестал быть крестьянином?
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_05");	//По мне, так ты – самый что ни на есть пахарь или на худой конец пастух! (громко смеется)
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_06");	//Не думаю, что многие из тех, кого мне пришлось убить, согласились бы с тобой.
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_07");	//Да? Может быть, ты еще и с двуручником умеешь обращаться? Ха! Да я уложу тебя одной левой!
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_08");	//Я так не думаю.
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_09");	//Хорошо, давай пари – если побеждаю я, то естественно, забираю все твое барахло, но это еще не все, ты голышом пробежишь по деревне. Вот будет потеха! (громко смеется)
	AI_Output(self,other,"DIA_Symon_WhatsUrJob_15_10");	//Хм... А если побеждаю я – ты залезешь на ратушу и будешь сутки там изображать петуха. Как тебе такое предложение?
		AI_Output(self,other,"DIA_Symon_WhatsUrJob_13_11");	//Да ты совсем обнаглел!
	//Диалог обрывается, Саймон нападает
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Symon_Fight = TRUE;
	//Запись в дневнике "Мой друг Саймон!" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_Running,TOPIC_DS2P_MyFriendSymon_Start);
};

//----------------------------------------------------
//	Мы победили (в этот раз или потом)	 	important
instance DIA_Symon_WonBattle(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 0;
	condition = DIA_Symon_WonBattle_condition;	
	information = DIA_Symon_WonBattle_info;
	important = TRUE;
};
func int DIA_Symon_WonBattle_condition()
{
	if ((Symon_Fight == TRUE)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{	return TRUE;	};
};
func void DIA_Symon_WonBattle_info()
{
	self.aivar[AIV_LastFightComment] = TRUE;
	Symon_Fight = FALSE;
		AI_Output(self,other,"DIA_Symon_WonBattle_13_00");	//Ну ты силен! Давно я не встречал таких ловких парней! Уважаю!
		AI_Output(self,other,"DIA_Symon_WonBattle_13_01");	//Если бы не пара огрехов при выпаде и немного добавить плавности при отходе, было бы идеально.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_MyFriendSymon_WonFight);
	AI_Output(self,other,"DIA_Symon_WonBattle_15_02");	//(хитро улыбается) Ну, мы же теперь друзья... А друзья помогают друг другу..
		AI_Output(self,other,"DIA_Symon_WonBattle_13_03");	//Ладно, ладно. В этот раз я покажу тебе пару приемов просто так, но в будущем тебе придется раскошелиться.
	//Увеличивает владение одноручем и двуручем на 4
	B_RaiseFightTalent(other,NPC_TALENT_1H,4);
	B_RaiseFightTalent(other,NPC_TALENT_2H,4);

	//Запись в дневнике "Мой друг Саймон!" квест закончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_MyFriendSymon_SuccessWon);
};
//----------------------------------------------------
//	Саймон победил или мы сбежали	 	important
instance DIA_Symon_LostBattle(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 0;
	condition = DIA_Symon_LostBattle_condition;	
	information = DIA_Symon_LostBattle_info;
	important = TRUE;
};
func int DIA_Symon_LostBattle_condition()
{
	if ((Symon_Fight == TRUE)
		&& ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)))
	{	return TRUE;	};
};
func void DIA_Symon_LostBattle_info()
{
		AI_Output(self,other,"DIA_Symon_LostBattle_13_00");	//Теперь ты уяснил, кто здесь главный? То-то же. А за твою дерзость ты должен мне заплатить пятьсот монет. 
		AI_Output(self,other,"DIA_Symon_LostBattle_13_01");	//На это у тебя есть три дня. Если через три дня я не получу золото, то у тебя будут большие проблемы.
	Symon_Gold500 = TRUE;
	Symon_Gold_Day = Wld_GetDay_Plus(7);
	Symon_Gold_TalkDay = Symon_Gold_Day + 1;
	self.aivar[AIV_LastFightComment] = TRUE;
	Symon_Fight = FALSE;
	//Запись в дневнике "Мой друг Саймон!" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_Running,TOPIC_DS2P_MyFriendSymon_Lost);
};

//----------------------------------------------------
// Варианты диалогов, когда Саймон требует денег,
// сначала 500, потом еще 1000 золотых
func void DIA_Symon_GiveGold500_menu()		//ответы - Саймон требует 500 зол.
{
	Info_ClearChoices(DIA_Symon_GiveGold);
	Info_AddChoice(DIA_Symon_GiveGold,"Да пошел ты к черту!",DIA_Symon_GiveGold_GoToHell);
	Info_AddChoice(DIA_Symon_GiveGold,"У меня нет столько золота.",DIA_Symon_GiveGold_NoGold);
	if (Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(DIA_Symon_GiveGold,"Вот золото.",DIA_Symon_GiveGold_Give500);
	};
	if (Wld_GetDay_Plus(12) < (Symon_Gold_Day + 3))
	{
		Info_AddChoice(DIA_Symon_GiveGold,"Я еще не готов заплатить тебе.",DIA_Symon_GiveGold_NotReady);
	};
};
func void DIA_Symon_GiveGold1000_menu()		//ответы - Саймон требует 1000 зол.
{
	Info_ClearChoices(DIA_Symon_GiveGold);
	Info_AddChoice(DIA_Symon_GiveGold,"Да пошел ты к черту!",DIA_Symon_GiveGold_GoToHell);
	if (Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Symon_GiveGold,"Вот золото.",DIA_Symon_GiveGold_Give1000);
	};
};
func void DIA_Symon_GiveGold_Attack()		//ГГ убивают толпой
{
		//UNFINISHED (в сторону)
		//AI_TurnToNpc(self,);
		AI_Output(self,other,"DIA_Symon_GiveGold_GoToHell_13_02");	// Эй, парни, хотите повеселиться? Тогда вперед!
	//UNFINISHED Саймон, и еще 3 бота пирата нападают на ГГ, если побеждают, то валят ГГ 
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Kill,1);
	//B_Attack(,other,AR_Kill,1);
	//B_Attack(,other,AR_Kill,1);
	//B_Attack(,other,AR_Kill,1);
	Symon_Fight = TRUE;
	Symon_Gold500 = FALSE;
	Symon_Gold1000 = FALSE;
	//Запись в дневнике "Мой друг Саймон!" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_MyFriendSymon_FailNoGold);
};

func void DIA_Symon_GiveGold_GoToHell()		//послать в разных диалогах - ГГ убивают толпой
{
	AI_Output(self,other,"DIA_Symon_GiveGold_GoToHell_15_00");	//Да пошел ты к черту!
		AI_Output(self,other,"DIA_Symon_GiveGold_GoToHell_13_01");	//Ну ладно, дружочек, придется научить тебя манерам!
	DIA_Symon_GiveGold_Attack();
};
func void DIA_Symon_GiveGold_NotReady()
{
	AI_Output(self,other,"DIA_Symon_GiveGold_NotReady_15_00");	//Я еще не готов заплатить тебе.
		AI_Output(self,other,"DIA_Symon_GiveGold_NotReady_13_01");	//Твое время истекает, дружок.
	Info_ClearChoices(DIA_Symon_GiveGold);
};
func void DIA_Symon_GiveGold_NoGold()
{
	AI_Output(self,other,"DIA_Symon_GiveGold_NoGold_15_00");	//У меня нет столько золота.
		AI_Output(self,other,"DIA_Symon_GiveGold_NoGold_13_01");	//Не ври мне, сельчанин! Я по глазам вижу, что ты мне врешь!
};
func void DIA_Symon_GiveGold_500()		//отдаем 500, Саймон хочет еще 1000
{
	var int x;
	AI_Output(self,other,"DIA_Symon_GiveGold_Give500_15_00");	//Вот золото. 
	//(+опыт)
	B_GivePlayerXP(XP_MIS_MyFriendSymon_GiveGold500);
	//Отдаем 500 монет
	x = 1; if (x == 1) {
		B_GiveInvItems(other,self,ItMi_Gold,500);
	};
		AI_Output(self,other,"DIA_Symon_GiveGold_Give500_13_01");	//Отлично, ты выполнил первую часть моего задания...
	AI_Output(self,other,"DIA_Symon_GiveGold_Give500_15_02");	//Что? Мы же договаривались...
		AI_Output(self,other,"DIA_Symon_GiveGold_Give500_13_03");	//(перебивает) Заткни свою пасть, щенок! Я с тобой ни о чем не договаривался.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give500_13_04");	//Завтра ты принесешь мне еще тысячу монет. И, возможно, тогда я прощу тебя

	Symon_Gold500 = FALSE;
	Info_ClearChoices(DIA_Symon_GiveGold);
	Info_AddChoice(DIA_Symon_GiveGold,"Да пошел ты к черту!",DIA_Symon_GiveGold_GoToHell);
	Info_AddChoice(DIA_Symon_GiveGold,"Хорошо, я принесу золото.",DIA_Symon_GiveGold_OK1000);
};
func void DIA_Symon_GiveGold_OK1000()
{
	AI_Output(self,other,"DIA_Symon_GiveGold_OK1000_15_00");	//Хорошо, я принесу золото.
	Mdl_StartFaceAni(self,"S_FRIENDLY",1,3);
		AI_Output(self,other,"DIA_Symon_GiveGold_OK1000_13_01");	//(ухмыляется) Так-то лучше. Ты знаешь, где меня найти.

	Symon_Gold1000 = TRUE;
	Symon_Gold_Day = Wld_GetDay_Plus(7);
	Symon_Gold_TalkDay = Symon_Gold_Day + 1;
	//Запись в дневнике "Мой друг Саймон!" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_Running,TOPIC_DS2P_MyFriendSymon_WantMoreGold);
	Info_ClearChoices(DIA_Symon_GiveGold);
};

func void DIA_Symon_GiveGold_1000()
{
	var int x;
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_00");	//Вот золото. 
	Mdl_StartFaceAni(self,"S_FRIENDLY",1,5);
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_01");	//(улыбается) Хороший мальчик! Я даже не мог и подумать, что в Миртане еще остались честные и благородные люди.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_02");	//Ха! Я настолько рад нашей встрече, что готов тебя даже наградить!
	//Забирает золото
	x = 1; if (x == 1) {
		B_GiveInvItems(other,self,ItMi_Gold,1000);
	};
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_03");	//(в недоумении) Наградить? Я предполагал, что ты вошел во вкус...
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_04");	//Я, конечно, люблю золото, но не настолько, чтобы терять при этом голову!
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_05");	//Если я потребую еще, то наверняка вместо золота получу вилы в бок. Например, когда я буду спать.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_06");	//Уже много парней лишились жизни из-за своей неуемной жадности.
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_07");	//Звучит разумно.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_08");	//Так вот, чтобы у тебя не было повода поднять сельчан с целью мне отмстить, я решил сделать тебе ответный подарок. 
	//Дает «Амулет Хаоса»
	x = 2; if (x == 2) {
		B_GiveInvItems(self,other,ItAm_DSG_Chaos_Discharged,1);
	};
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_09");	//И что это? 
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_10");	//А Белиар его знает! (смеется)
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_11");	//Эту фиговину я снял с трупа одного из магов огня после абордажа торгового судна.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_12");	//Парни говорили, что эта вещица волшебная, но как она работает – я не имею никакого понятия. Может, ты разберешься.
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_13");	//Понятно. Твой подарок – пустышка! Не стоило и сомневаться.
		AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_13_14");	//(невинно смотрит) Что ты, друг! Как можно. Это честная сделка, поверь мне! Ха-ха-ха! (громко смеется)
	AI_Output(self,other,"DIA_Symon_GiveGold_Give1000_15_15");	//Да, да... (про себя) Нужно показать эту вещицу Ватрасу.

	//Запись в дневнике "Мой друг Саймон!" квест закончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_MyFriendSymon,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_MyFriendSymon_Success);
	Symon_Gold1000 = FALSE;
};

//	Требует деньги	 	important
instance DIA_Symon_GiveGold(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 0;
	condition = DIA_Symon_GiveGold_condition;	
	information = DIA_Symon_GiveGold_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_Symon_GiveGold_condition()
{
	if (((Symon_Gold500 == TRUE) || (Symon_Gold1000 == TRUE))
		&& (Wld_GetDay_Plus(12) >= Symon_Gold_TalkDay))
	{	return TRUE;	};
};
func void DIA_Symon_GiveGold_info()
{
	if (Symon_Gold1000 == TRUE)	//1000зол.
	{
		if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 1))	{	// в срок
			AI_Output(self,other,"DIA_Symon_GiveGold_13_00");	//Где золото, пахарь?
			Symon_Gold_TalkDay += 1;
			DIA_Symon_GiveGold1000_menu();
		}
		else	if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 2))	{	// крайний срок
			AI_Output(self,other,"DIA_Symon_GiveGold_13_01");	//Даю тебе последний шанс. Где золото?
			DIA_Symon_GiveGold1000_menu();
		}
		else{	//опоздали
			AI_Output(self,other,"DIA_Symon_GiveGold_13_02");	//Похоже, ты так и не понял, где твое место, щенок.
			DIA_Symon_GiveGold_Attack();
		};
	}
	else {	//500зол.
		if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 1))	//в 1 день
		{
			AI_Output(self,other,"DIA_Symon_GiveGold_13_03");	//Прошел уже день, а я все еще не вижу своего золота.
			DIA_Symon_GiveGold500_menu();
			Symon_Gold_TalkDay += 1;
		}
		else if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 2))	//на 2 день
		{
			AI_Output(self,other,"DIA_Symon_GiveGold_13_04");	//Где мое золото, выкидыш акулы?
			DIA_Symon_GiveGold500_menu();
			Symon_Gold_TalkDay += 1;
		}
		else if (Wld_GetDay_Plus(7) == (Symon_Gold_Day + 3))	//на 3 день
		{
			AI_Output(self,other,"DIA_Symon_GiveGold_13_05");	//Твое время истекло, дружок. В последний раз спрашиваю - где мое золото?
			DIA_Symon_GiveGold500_menu();
		}
		else	//срок завален
		{
			AI_Output(self,other,"DIA_Symon_GiveGold_13_06");	//Твое время истекло, дружок.
			DIA_Symon_GiveGold_Attack();
		};
	};
};
//	ГГ сам отдает 500 монет		nr = 1;	 	
instance DIA_Symon_GiveGold_Give500(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_GiveGold500_condition;	
	information = DIA_Symon_GiveGold_500;
	description = "Вот золото.";
};
func int DIA_Symon_GiveGold500_condition()
{
	if ((Symon_Gold500 == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 500)
		&& (Wld_GetDay() >= Symon_Gold_Day) && (Wld_GetDay() <= (Symon_Gold_Day + 2)))
	{	return TRUE;	};
};
//	ГГ сам отдает 1000 монет		nr = 1;	 	
instance DIA_Symon_GiveGold_Give1000(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_GiveGold1000_condition;	
	information = DIA_Symon_GiveGold_1000;
	description = "Вот золото.";
};
func int DIA_Symon_GiveGold1000_condition()
{
	if ((Symon_Gold1000 == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 1000)
		&& (Wld_GetDay() >= Symon_Gold_Day) && (Wld_GetDay() <= (Symon_Gold_Day + 1)))
	{	return TRUE;	};
};



//NS - 18/07/2013 ===================================
//  По квесту "Внук рыбака"
//===================================================
// Cам обращается к ГГ, если побили его по квесту				important	
instance DIA_Symon_FightAgainstGaronLost(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 0;
	condition = DIA_Symon_FightAgainstGaronLost_condition;	
	information = DIA_Symon_FightAgainstGaronLost_info;
	important = TRUE;
};
func int DIA_Symon_FightAgainstGaronLost_condition()
{
	if ((Garon_FightPirates == Garon_FightPirates_Finished)
		//&& (self.aivar[AIV_LastFightComment] == FALSE)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{	return TRUE;};
};
func void DIA_Symon_FightAgainstGaronLost_info()
{
		AI_Output(self,other,"DIA_Symon_FightAgainstGaronLost_13_00");	//Черт, твоя взяла! Ладно, пускай этот жалкий рыбак живет... Пока...
	self.aivar[AIV_LastFightComment] = TRUE;
	AI_StopProcessInfos(self);
};



//NS - 30/07/2013 ===================================
//  По квесту "Несчастный целитель" UNFINISHED
//===================================================
// 	"Перестань вымогать деньги у Цимма." если взят квест				nr = 30;	
instance DIA_Symon_StopExtortMoneyFromCimm(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 30;
	condition = DIA_Symon_StopExtortMoneyFromCimm_condition;	
	information = DIA_Symon_StopExtortMoneyFromCimm_info;
	description = "Перестань вымогать деньги у Цимма.";
};
func int DIA_Symon_StopExtortMoneyFromCimm_condition()
{
	if (MIS_DS2P_UnhappyHealer == LOG_Running)
	{	return TRUE;};
};
func void DIA_Symon_StopExtortMoneyFromCimm_info()
{
	AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_15_00");	//Перестань вымогать деньги у Цимма.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_01");	//А то что? Ты пожалуешься на меня своей мамочке? (громко смеется)
	AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_15_02");	//Я...
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_03");	//(перебивает) Хотя погоди. Есть у меня одна идея. Тебе она точно понравится! (хитро улыбается)
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_04");	//Когда мы только прибыли на остров, я решил погулять в окрестностях деревни, посмотреть что тут и как, может быть чем-нибудь поживиться... Ну, ты понимаешь.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_05");	//Так вот, когда я обшаривал старую мельницу, ко мне подкрались чертовы гоблины и двинули палкой по затылку.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_06");	//Очнулся я часа через два, в карманах ветер гуляет, хорошо хоть меч не утащили, проклятые бестии.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_07");	//А у меня, между прочим, было не меньше шестисот золотых с последнего рейда.
		AI_Output(self,other,"DIA_Symon_StopExtortMoneyFromCimm_13_08");	//Вернешь их, и твой ненаглядный алхимик будет спать спокойно. (смеется)

	//Запись в дневнике "Несчастный целитель" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_SymonCondition);
};

//----------------------------------------------------
// 	"Где искать этих гоблинов?" после предыдущего				nr = 30;	
//17.03.2016 Redleha
instance DIA_Symon_WhereAGoblins(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 30;
	condition = DIA_Symon_WhereAGoblins_condition;	
	information = DIA_Symon_WhereAGoblins_info;
	description = "Где искать этих гоблинов?";
};
func int DIA_Symon_WhereAGoblins_condition()
{
	if ((MIS_DS2P_UnhappyHealer == LOG_Running) && Npc_KnowsInfo(other,DIA_Symon_StopExtortMoneyFromCimm))
	{	return TRUE;};
};
func void DIA_Symon_WhereAGoblins_info()
{
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_00");	//Где искать этих гоблинов?
		AI_Output(self,other,"DIA_Symon_WhereAGoblins_13_01");	//А я откуда знаю?! Но могу предположить, что они спрятались в какой-нибудь пещере неподалеку.
		AI_Output(self,other,"DIA_Symon_WhereAGoblins_13_02");	//Наверняка, у них мозгов не хватило убраться подальше.

	//Запись в дневнике "Несчастный целитель" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_GobbosNearMill);
	//UNFINISH / Вставляем гоблинов неподалёку, особенных.
	Wld_InsertNpc(Gobbo_Warrior,"");
	Wld_InsertNpc(Gobbo_Warrior,"");
};
//----------------------------------------------------
// 	"Нашел я твоих гоблинов" после "Где искать этих гоблинов?" при убийстве гоблинов				nr = 31;
//17.03.2016 Redleha
instance DIA_Symon_IveFoundYourGoblins(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 31;
	condition = DIA_Symon_IveFoundYourGoblins_condition;	
	information = DIA_Symon_IveFoundYourGoblins_info;
	description = "Нашел я твоих гоблинов.";
};
func int DIA_Symon_IveFoundYourGoblins_condition()
{
	if ((MIS_DS2P_UnhappyHealer == LOG_Running) && Npc_KnowsInfo(other,DIA_Symon_WhereAGoblins) && Npc_IsDead(Gobbo_Warrior) /*&& Npc_IsDead(Gobbo_Warrior)*/)
	{	return TRUE;};
};
func void DIA_Symon_IveFoundYourGoblins_info()
{
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_00");	//Нашел я твоих гоблинов, убил, но золота при них не было.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_00");	//Естественно, ты же присвоил его себе.
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_01");	//Хватит уже этих шуток, при мне только мое золото, гоблины мертвы, для чего ты вообще приплел эту ложь насчет ограбления.
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_02");	//(с сарказмом) Да к тому же, если бы гоблины огрели тебя по голове, в возможности чего я по некоторым причинам, связанным с ростом этих бестий, сильно сомневаюсь, то сейчас ты не стоял бы и не разговаривал со мной.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_01");	//(немного смущенно) Кхм, да. Насчет удара по голове, это я перемудрил...
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_02");	//Ну ладно, раз уж ты выполнил за меня мою работу, то я так и быть, расскажу тебе где тут был подвох.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_03");	//Понимаешь, не так давно у Гарда как всегда было дурное настроение, по близости оказался я, и капитан, чтобы хоть кто-нибудь в этом мире разделил его тоску, решил озадачить работой и меня.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_04");	//Причем выбрал именно ту, которую я на дух не переношу. Видишь мой меч? 
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_05");	//Обрати внимание, какой он длинный и тяжелый, и вспомни, какие гоблины мелкие и верткие, и теперь ты должен понимать, почему мне не хотелось связываться с этой работой. 
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_06");	//Я лучше против трех бойцов в одиночку выйду, чем против стаи гоблинов.
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_03");	//Ну, я все понял, что дальше?
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_07");	//Дальше все для тебя отлично, уговор остается в силе, претензии к твоему несчастному другу остаются в прошлом.
	Symon_IsNot_Problem_4Cimm = TRUe;
	//Запись в дневнике "Несчастный целитель" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_PreSuccess);
};
//----------------------------------------------------
// 	"Вот золото, которое ты хотел получить." после "Где искать этих гоблинов?" без убийства гоблинов				nr = 31;
//17.03.2016 Redleha
instance DIA_Symon_YourGold(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 31;
	condition = DIA_Symon_YourGold_condition;	
	information = DIA_Symon_YourGold_info;
	description = "Вот золото, которое ты хотел получить.";
};
func int DIA_Symon_YourGold_condition()
{
	if ((MIS_DS2P_UnhappyHealer == LOG_Running) && Npc_KnowsInfo(other,DIA_Symon_WhereAGoblins) && C_Npc_DS_HasItems(other,ItMi_Gold,600) && !(Npc_IsDead(Gobbo_Warrior) /*&& Npc_IsDead(Gobbo_Wariior)*/))
	{	return TRUE;};
};
func void DIA_Symon_YourGold_info()
{
	AI_Output(self,other,"DIA_Symon_WhereAGoblins_15_00");	//Вот золото, которое ты хотел получить.
		AI_Output(self,other,"DIA_Symon_IveFoundYourGoblins_13_01");	//Да ну? И где ты его раздобыл?
	Info_ClearChoices(DIA_Symon_YourGold);
	Info_AddChoice(DIA_Symon_YourGold, "Из своих кровных отдаю.", DIA_Symon_YourGold_true);
	Info_AddChoice(DIA_Symon_YourGold, "Как где? У твоих гоблинов.", DIA_Symon_YourGold_false);
};
func void DIA_Symon_YourGold_false()
{
	AI_Output(self,other,"DIA_Symon_YourGold_false_15_00");	//Как  где? У твоих гоблинов.
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_00");	//(смеясь) Да ну? Неужели? И как, яростной была схватка?
	AI_Output(self,other,"DIA_Symon_YourGold_false_15_01");	//(озадачено) Не понял, к чему ты эти вопросы задаешь.
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_01");	//Трусишка ты и лжец, вот что я тебе скажу...
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_02");	//Ну да ладно, мне такие люди нравятся, стричь вас удобно. Шестьсот монет за просто так - неплохо, согласись.
	AI_Output(self,other,"DIA_Symon_YourGold_false_15_02");	//(сердито) Не соглашусь! Что насчет Цимма?
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_03");	//(хохоча) Да все нормально с ним, ты же победил гоблинов и даже золото мне вернул, спасибо тебе дружок. Скажи, а ты всегда так деньгами разбрасываешься?
	AI_Output(self,other,"DIA_Symon_YourGold_false_15_03");	//Пошел к Белиару!
		AI_Output(self,other,"DIA_Symon_YourGold_false_13_04");	//Сам иди, неудачник.
	Symon_IsNot_Problem_4Cimm = TRUe;
	//Запись в дневнике "Несчастный целитель" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_PreSuccess_1);
	Info_ClearChoices(DIA_Symon_YourGold);
};
func void DIA_Symon_YourGold_true()
{
	AI_Output(self,other,"DIA_Symon_YourGold_true_15_00");	//Из своих кровных отдаю, нет сейчас у меня времени по округе шляться, зайду к ним позже.
		AI_Output(self,other,"DIA_Symon_YourGold_true_13_00");	//(излишне серьезно) Понимаю,  по тебе сразу видно, что ты занятой человек, но все же не затягивай с этим, а то я знаю этих гоблинов, у них золото не задерживается.
	AI_Output(self,other,"DIA_Symon_YourGold_true_15_01");	//(с сарказмом) Здесь какие-то особые гоблины, которые умеют тратить деньги?
		AI_Output(self,other,"DIA_Symon_YourGold_true_13_01");	//Именно, сам видел, как они у Зедда бутылку самогона покупали.
	AI_Output(self,other,"DIA_Symon_YourGold_true_15_02");	//Да ты шутишь.
		AI_Output(self,other,"DIA_Symon_YourGold_true_13_02");	//(пожав плечами) Да как тебе угодно. Но если к тому времени гоблины уже все прогуляют, то потом не прибегай ко мне. Усек?
		AI_Output(self,other,"DIA_Symon_YourGold_true_13_03");	//Да, кстати, можешь передать своему алхимику, чтобы он перестал дрожать.
	Symon_IsNot_Problem_4Cimm = TRUe;
	//Запись в дневнике "Несчастный целитель" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_UnhappyHealer,LOG_MISSION,LOG_Running,TOPIC_DS2P_UnhappyHealer_PreSuccess_2);
	Info_ClearChoices(DIA_Symon_YourGold);
};

//NS - 30/07/2013 ===================================
//  По квесту "Выбор Тамира"
//===================================================
// 	"У меня мясо от Тамира." если взят квест и есть мясо (+опыт)				nr = 40;	
instance DIA_Symon_MeatFromTamir(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 40;
	condition = DIA_Symon_MeatFromTamir_condition;	
	information = DIA_Symon_MeatFromTamir_info;
	description = "У меня мясо от Тамира.";
};
func int DIA_Symon_MeatFromTamir_condition()
{
	if((MIS_DS2P_TamirChoice == LOG_Running) && (Npc_HasItems(other,ItFoMutton) > 10))
	{	return TRUE;};
};
func void DIA_Symon_MeatFromTamir_info()
{
	var int x;
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_15_00");	//У меня мясо от Тамира.
	//Отдаем 10 кусков
	x = 1; if (x == 1) {
		B_DS_GiveRemoveItems(other,self,ItFoMutton,10);
	};
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_13_01");	//Это хорошо, это очень хорошо!
	//(+опыт)
	B_GivePlayerXP(XP_MIS_TamirChoice_GiveMeat);
	//Забирает, ест
	CreateInvItems(self,ItFoMutton,2);
	AI_UseItem(self,ItFoMutton);
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_13_02");	//Белиар тебя дери, я давно так не ел...
	//Ест
	AI_UseItem(self,ItFoMutton);
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_13_03");	//(отрыгивает) Ух... (отрыгивает) Лопни моя селезенка, я, по-моему, обожрался! (икает)
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_13_04");	//У тебя есть что-нибудь попить?
	Info_ClearChoices(DIA_Symon_MeatFromTamir);
	Info_AddChoice(DIA_Symon_MeatFromTamir,"Извини, ничего нет.",DIA_Symon_MeatFromTamir_NoDrink);
	if (Npc_HasItems(other,ItFo_Milk))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(дать молоко)",DIA_Symon_MeatFromTamir_Milk);
	};
	if (Npc_HasItems(other,ItFo_Wine))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(дать вино)",DIA_Symon_MeatFromTamir_Wine);
	};
	if (Npc_HasItems(other,ItFo_Addon_Rum))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(дать ром)",DIA_Symon_MeatFromTamir_Rum);
	};
	if (Npc_HasItems(other,ItFo_Addon_Grog))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(дать грог)",DIA_Symon_MeatFromTamir_Grog);
	};
	if (Npc_HasItems(other,ITFO_SAMOGON))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(дать самогон)",DIA_Symon_MeatFromTamir_Samogon);
	};
	if (Npc_HasItems(other,ItFo_Booze))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(дать шнапс)",DIA_Symon_MeatFromTamir_Booze);
	};
	if (Npc_HasItems(other,ItFo_Beer))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(дать пиво)",DIA_Symon_MeatFromTamir_Beer);
	};
	if (Npc_HasItems(other,ItFo_Water))	{
		Info_AddChoice(DIA_Symon_MeatFromTamir,"(дать воду)",DIA_Symon_MeatFromTamir_Water);
	};
};
func void DIA_Symon_MeatFromTamir_AboutTamir()
{
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_AboutTamir_15_00");	//Эй! А что по поводу Тамира?
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_AboutTamir_13_01");	//Какого Тамира? Чего пристал!
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_AboutTamir_15_02");	//Охотник Тамир. Ты больше не будешь требовать с него мясо?
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_AboutTamir_13_03");	//Да Белиар с ним, с твоим Тамиром. Я сегодня добрый! А теперь отвали от меня. (отрыгивает)
	AI_StopProcessInfos(self);
	//Саймон идет вздремнуть UNFINISHED
	AI_StartState(self,ZS_Sleep,1,"");
	//Запись в дневнике "Выбор Тамира" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_TamirChoice,LOG_MISSION,LOG_Running,TOPIC_DS2P_TamirChoice_MeatDelivered);
	Info_ClearChoices(DIA_Symon_MeatFromTamir);
};
func void DIA_Symon_MeatFromTamir_NoDrink()
{
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_NoDrink_15_00");	//Извини, ничего нет
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_NoDrink_13_01");	//Белиар тебя дери! Так принеси!
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_NoDrink_15_02");	//А может мне врезать тебе? Ты сейчас не сможешь дать сдачи даже падальщику.
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_NoDrink_13_03");	//(отрыгивает) Черт, ладно. Пошел прочь с моей дороги!
	DIA_Symon_MeatFromTamir_AboutTamir();
};
func void DIA_Symon_MeatFromTamir_GiveDrink(var int ItemInst)
{
	var int x;
	AI_Output(self,other,"DIA_Symon_MeatFromTamir_GiveDrink_15_00");	//Вот, держи.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_TamirChoice_GiveDrink);
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_GiveDrink_13_01");	//Тебя послал сам Иннос!
	//Забирает, пьет
	x = 1; if (x == 1) {
		B_GiveInvItems(other,self,ItemInst,1);
		AI_UseItem(self,ItemInst);
	};
		AI_Output(self,other,"DIA_Symon_MeatFromTamir_GiveDrink_13_02");	//Ой, как хорошо. А теперь пора вздремнуть. Отойди с дороги!
	DIA_Symon_MeatFromTamir_AboutTamir();
};
func void DIA_Symon_MeatFromTamir_Water()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Water);
};
func void DIA_Symon_MeatFromTamir_Beer()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Beer);
};
func void DIA_Symon_MeatFromTamir_Booze()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Booze);
};
func void DIA_Symon_MeatFromTamir_SAMOGON()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ITFO_SAMOGON);
};
func void DIA_Symon_MeatFromTamir_Grog()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Addon_Grog);
};
func void DIA_Symon_MeatFromTamir_Rum()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Addon_Rum);
};
func void DIA_Symon_MeatFromTamir_Wine()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Wine);
};
func void DIA_Symon_MeatFromTamir_Milk()
{
	DIA_Symon_MeatFromTamir_GiveDrink(ItFo_Milk);
};



//NS - 30/07/2013 ===================================
//  ОБУЧЕНИЕ
//===================================================
// 	"Научи меня лучше обращаться с двуручным клинком."				nr = 40;	
var int Symon_TeachMe_Once;
func void DIA_Symon_Teach_2H_Menu()
{
	Info_ClearChoices(DIA_Symon_TeachMe);
	Info_AddChoice(DIA_Symon_TeachMe,Dialog_Back,DIA_Symon_Teach_2H_Back);
	Info_AddChoice(DIA_Symon_TeachMe,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_2H,1,-1),DIA_Symon_Teach_2H_1);
	Info_AddChoice(DIA_Symon_TeachMe,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_2H,5,-1),DIA_Symon_Teach_2H_5);
};
instance DIA_Symon_TeachMe(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 40;
	condition = DIA_Symon_TeachMe_condition;	
	information = DIA_Symon_TeachMe_info;
	description = "Научи меня лучше обращаться с двуручным клинком.";
	permanent = TRUE;
};
func int DIA_Symon_TeachMe_condition()
{
	if (TEACH_Symon_2H == TRUE)
	{	return TRUE;	};
};
func void DIA_Symon_TeachMe_info()
{
	AI_Output(self,other,"DIA_Symon_TeachMe_15_00");	//Научи меня лучше обращаться с двуручным клинком.
	if (Symon_TeachMe_Once == FALSE)	{
		AI_Output(self,other,"DIA_Symon_TeachMe_13_01");	//Если у тебя есть золото, я могу показать тебе пару приемов.
		Symon_TeachMe_Once = TRUE;
		//Запись в дневнике в разделе доп инфо "Учителя у пиратов" 
		B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"Пират Саймон может научить меня лучше обращаться с двуручным оружием.");
	};
	DIA_Symon_Teach_2H_Menu();
};
func void DIA_Symon_Teach_2H_Back()
{
	Info_ClearChoices(DIA_Symon_TeachMe);
};
func void DIA_Symon_Teach_2H_DoIt(var int points)
{
	var int cost;
	cost = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_2H,points);
	if(Npc_HasItems(other,ItMi_Gold) >= cost)
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,points,T_MAX))
		{
			b_giveInvItems(other,self,ItMi_Gold,cost);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Symon_NoGold_13_00");	//Я не вижу золота.
	};
	DIA_Symon_Teach_2H_Menu();
};
func void DIA_Symon_Teach_2H_1()
{
	DIA_Symon_Teach_2H_DoIt(1);
};
func void DIA_Symon_Teach_2H_5()
{
	DIA_Symon_Teach_2H_DoIt(5);
};

//"У меня к тебе деловое предложение.". Активируется, после диалога с Серой Бородой о соревновании
// nr = 1

instance DIA_Symon_GrayBeardCompetition(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_GrayBeardCompetition_condition;	
	information = DIA_Symon_GrayBeardCompetition_info;
	description = "У меня к тебе деловое предложение.";
	permanent = FALSE;
};
func int DIA_Symon_GrayBeardCompetition_condition()
{
	if (Npc_KnowsInfo(other,DIA_GrayBeard_AgainAboutSue))
	{	
		return TRUE;	
	};
};

func void DIA_Symon_GrayBeardCompetition_info()
{
	AI_Output(other,self,"DIA_Symon_GrayBeardCompetition_15_00");	//У меня к тебе деловое предложение.
	AI_Output(self,other,"DIA_Symon_GrayBeardCompetition_13_01");	//Если оно сулит прибыль, то я за.
	AI_Output(other,self,"DIA_Symon_GrayBeardCompetition_15_02");	//В какой-то степени. Я собираюсь посоревноваться с Серой Бородой.
	AI_Output(self,other,"DIA_Symon_GrayBeardCompetition_13_03");	//Но ты же не пират. Ты не можешь участвовать в соревновании.
	AI_Output(other,self,"DIA_Symon_GrayBeardCompetition_15_04");	//Я буду действовать от имени Малышки Сью, так можно. Если побеждаю я, то Серая Борода навсегда оставит Малышку Сью в покое. Я хочу, чтобы ты был свидетелем моей победы.
	AI_Output(self,other,"DIA_Symon_GrayBeardCompetition_13_05");	//Ты так уверен в своей победе?
	AI_Output(other,self,"DIA_Symon_GrayBeardCompetition_15_06");	//Конечно. Серая Борода мне не соперник. Ручаюсь тебе в этим.
	AI_Output(self,other,"DIA_Symon_GrayBeardCompetition_13_07");	//Ладно, я согласен. Давно хотелось посмотреть, как этого безбородого поставят на место. Я буду стоять рядом с Серой Бородой, чтобы не пропустить такое.
	// Меняем расписание Саймона для соревнований
	B_StartOtherRoutine(self,"GB_COMPETITION");
	B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_02);
	if (Npc_KnowsInfo(other,DIA_Karah_GrayBeardCompetition) && Npc_KnowsInfo(other,DIA_Greg_GrayBeardCompetition_Gold)) // Если ГГ уже пригласил Саймона и Грега
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_06);
	};
	AI_StopProcessInfos(self);
};

// Запускается после окончания соревнования
// nr = 1
	
instance DIA_Symon_AfterCompetition(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_AfterCompetition_condition;	
	information = DIA_Symon_AfterCompetition_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};
func int DIA_Symon_AfterCompetition_condition()
{
	if (GB_CompetitionState > 9)
	{	
		return TRUE;	
	};
};	

func void DIA_Symon_AfterCompetition_info()
{
	if (GB_CompetitionState == 10) // Победа ГГ
	{
		AI_Output(self,other,"DIA_Symon_AfterCompetition_13_00");	//Ха! Наконец-то с этого безбородого сбили спесь. Так держать, парень!
	}
	else // Проигрыш ГГ
	{
		AI_Output(self,other,"DIA_Symon_AfterCompetition_13_01");	//Эх, а говорил, что победишь его.
	};
};

// Активируется, если взят квест "Заговор"
// nr = 1
	
instance DIA_Symon_AboutConspiracy(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_AboutConspiracy_condition;	
	information = DIA_Symon_AboutConspiracy_info;
	description = "Привет.";
	permanent = FALSE;
};
func int DIA_Symon_AboutConspiracy_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && C_DIA_Greg_OurIdea_Know_AboutSymon)
	{	
		return TRUE;	
	};
};

func void DIA_Symon_AboutConspiracy_info()
{
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_00");	//Привет.
	// Создаем кусок жаренного мяса в инвентаре Саймона и он его ест
	CreateInvItems(self,ItFoMutton,1);
	AI_UseItem(self,ItFoMutton);
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_01");	//(жует)
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_02");	//Может, прекратишь есть, пока я с тобой разговариваю?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_03");	//(с набитым ртом) Я фколотен.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_04");	//Ты всегда голоден. А у меня к тебе есть деловое предложение.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_05");	//(сглатывает) Говори.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_06");	//Не прочь немного заработать?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_07");	//Я весь во внимании.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_08");	//Скоро состоится собрание пиратов по поводу смены капитана.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_09");	//О!
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_10");	//Да, я хочу заручиться твоей поддержкой.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_11");	//Ты хочешь претендовать на роль капитана?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_12");	//Иннос упаси, нет. Капитаном хочет быть Грег, и именно ему нужен твой голос.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_13");	//А, этот одноглазый. С чего бы мне голосовать за него.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_14");	//Подумай сам. Под началом Гарда вас в последнее время преследуют только неудачи, одна за другой: потеряли корабль, вынуждены прозябать на этом клочке суши, ваш основной лагерь затонул вместе с островом…
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_15");	//Стоп! Как затонул? Откуда ты знаешь?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_16");	//Там была приведена в действие очень мощная магия, которая и погрузила остров под воду. Выжил всего один человек.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_17");	//Вот черт! Этот мракорисов выкидыш Моран должен был мне целую кучу денег. Проклятье!
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_18");	//Вот-вот. А ведь это именно Гард уговорил вас обустроить там лагерь и торговать с орками.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_19");	//Черт, кажется, ты прав! Похоже, Гард действительно израсходовал весь свой запас удачливости.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_20");	//Да, а Грег, насколько я знаю, пока еще не лишился милости богов. Так как?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_21");	//Хм, я проголосую за него… скажем, за чисто символическую плату. Две тысячи пятьсот монет.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_22");	//Что?!
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_23");	//Ты сам сказал, что наш лагерь на том острове погрузился в водную пучину, а там был человечек, который должен был мне эти деньги. Теперь отдавать их придется тебе.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_15_24");	//Потрясающая логика! Может, я лучше для тебя убью дракона и спасу принцессу, а?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_13_25");	//Хм, я могу простить тебе этот долг… если ты поможешь мне завоевать Малышку Сью. Что скажешь?
	Info_ClearChoices(DIA_Symon_AboutConspiracy);
	Info_AddChoice(DIA_Symon_AboutConspiracy,"Я лучше помогу тебе со Сью.",DIA_Symon_AboutConspiracy_Sue);
	Info_AddChoice(DIA_Symon_AboutConspiracy,"Вот деньги.",DIA_Symon_AboutConspiracy_Gold);
};

// Запускается, если выбрать реплику "Вот деньги." в диалоге с Саймоном

func void DIA_Symon_AboutConspiracy_Gold()
{
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Gold_15_00");	//Вот деньги.
	if (Npc_HasItems(other,ItMi_Gold) >= 2500) // Если у ГГ есть нужная сумма
	{
		// Отдаем Саймону деньги
		B_GiveInvItems(other,self,ItMi_Gold,2500);
		AI_Output(self,other,"DIA_Symon_AboutConspiracy_Gold_13_01");	//Хе, хорошо-то как. Можете рассчитывать на мой голос, я не подведу.
		AI_Output(other,self,"DIA_Symon_AboutConspiracy_Gold_15_02");	//Очень надеюсь. И старайся не трепаться лишний раз перед Гардом.
		B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_SymonIn);
		Symon_InConspiracy = TRUE;
		B_StartOtherRoutine(self,"START");
		if (MIS_DS2P_WinSueHand == Log_Running) // Если был взят квест "Помочь добится Сью"
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Failed,"");
		};
		AI_StopProcessInfos(self);
	}
	else // Если нужной суммы нет
	{
		AI_Output(self,other,"DIA_Symon_AboutConspiracy_Gold_13_03");	//Эй, тут не хватает!
	};
};

// Запускается, если выбрать реплику "Я лучше помогу тебе со Сью." в диалоге Саймона

func void DIA_Symon_AboutConspiracy_Sue()
{
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_00");	//Я лучше помогу тебе со Сью. Что надо делать?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_01");	//Мне очень нравится эта девушка, но она не отвечает мне взаимностью. Я уже раз двадцать подходил к ней, но она всякий раз высмеивала меня. Меня!!!
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_02");	//Ты хочешь, чтобы я поговорил с ней?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_03");	//Нет-нет-нет-нет. У меня есть ПЛАН!
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_04");	//Судя по многозначительному окончанию, он поистине многоходовый и дьявольский, настолько хитрый, что даже самые изворотливые умы не придумают его.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_05");	//Да, мне самому он нравится. В нем я продумал ВСЕ.
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_06");	//(про себя) Тьфу, вот тупица! И Грег надеется на этого увальня? (громко) Что мне надо делать?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_07");	//Ты должен вывести Малышку Сью в лес. Вы немного пройдетесь, прогуляетесь, потом ты отбежишь до ветра и оставишь девушку одну. Дальше смекаешь?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_08");	//Вообще-то нет. Говорю же, даже самые изворотливые умы не разгадают твоего плана.
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_09");	//Дальше на Сью нападет волк. Она завизжит, закричит, начнет звать на помощь. И тут выхожу Я. Я парой ударов убиваю волка, а Сью, благодарная к своему спасителю, бросается мне нашею. Каково, а?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_10");	//Поистине дьявольский план, столько ума, хитрости и неожиданностей, что даже за душу берет. Особенно мне понравился момент с обниманием. Я чуть не прослезился. 
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_11");	//Так ты согласен?
	AI_Output(other,self,"DIA_Symon_AboutConspiracy_Sue_15_12");	//(вздыхает) Да куда ж я денусь? Под каким предлогом мне вывести Малышку Сью в лес?
	AI_Output(self,other,"DIA_Symon_AboutConspiracy_Sue_13_13");	//Э, сам что-нибудь придумай. Тебе не составит труда. Встречаемся there.
	// UNFINISHED - вписать где встречаются
	B_StartOtherRoutine(self,"WAITINIGFORSUE");
	Wld_InsertNpc(Wolf_Symon,""); // UNFINISHED - вписать, где спавнится волк (рядом с Саймоном)
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Running,TOPIC_DS2P_WinSueHand_Start);
	AI_StopProcessInfos(self);
};

// Активируется, если взят квест "Заговор" и "Помочь добится Сью"
// nr = 1
	
instance DIA_Symon_AboutConspiracy_GoldAgain(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_AboutConspiracy_GoldAgain_condition;	
	information = DIA_Symon_AboutConspiracy_Gold;
	description = "Вот деньги.";
	permanent = TRUE;
};
func int DIA_Symon_AboutConspiracy_GoldAgain_condition()
{
	if ((MIS_DS2P_Conspiracy == Log_Running) && MIS_DS2P_WinSueHand)
	{	
		return TRUE;	
	};
};

// Активируется, если взят квест "Помочь добится Сью", и ГГ привел Сью в лес
// nr = 1
	
instance DIA_Symon_SueInForrest(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_SueInForrest_condition;	
	information = DIA_Symon_SueInForrest_info;
	description = " ";
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Symon_SueInForrest_condition()
{
	if ((MIS_DS2P_WinSueHand == Log_Running) && Npc_KnowsInfo(other,DIA_SueBaby_InForrest))
	{	
		return TRUE;	
	};
};

func void DIA_Symon_SueInForrest_info()
{
	var C_NPC symonwolf;
	symonwolf = Hlp_GetNpc(WOLF_SYMON);
	AI_Output(self,other,"DIA_Symon_SueInForrest_13_00");	//Ну как?
	AI_Output(other,self,"DIA_Symon_SueInForrest_15_01");	//Она здесь. А волка можно было и погрознее найти, у этого вон даже шкура облезлая.
	AI_Output(self,other,"DIA_Symon_SueInForrest_13_02");	//Другого не было, этого-то приручить было трудно. А теперь постой в сторонке и смотри, как работают профессионалы. Псинка, фас!
	AI_SetWalkMode(symonwolf,NPC_RUN);
	AI_GotoWP(symonwolf,"TESTWP"); //UNFINISHED - вписать вэйпоинт, куда бежит волк
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"TESTWP"); //UNFINISHED - вписать, куда бежит Саймон
	Wld_PlayEffect("BLACK_SCREEN_SLOW", other,other,0,0,0,FALSE);
	AI_Wait(self,4);
	AI_Teleport(symonwolf,"TESTWP"); // Телепортируем волка на вэйпоинт, если тот не успел добежать (рядом со старым положением Сью)
	B_KillNpc(symonwolf); // Убиваем волка
	AI_Teleport(self,"TESTWP"); // Телепортируем Саймона обратно
	AI_Teleport(SueBaby,"TESTWP"); // Телепортируем Сью к ГГ
	B_StartOtherRoutine(SueBaby,"NEARHERO");
	AI_TurnToNpc(self,SueBaby);
	AI_StopFX(other,"BLACK_SCREEN_SLOW");
	// UNFINISHED - вписать везде вэйпоинты
	AI_StopProcessInfos(self);
};

// Активируется, если Сью ушла в деревню по квесту "Помочь добится Сью"
// nr = 1
	
instance DIA_Symon_SueInVillage(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_SueInVillage_condition;	
	information = DIA_Symon_SueInVillage_info;
	description = " ";
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Symon_SueInVillage_condition()
{
	if ((MIS_DS2P_WinSueHand == Log_Running)
		 && Npc_KnowsInfo(other,DIA_SueBaby_FailedPlan) && Npc_IsInState(self,ZS_TALK))
	{	
		return TRUE;	
	};
};

func void DIA_Symon_SueInVillage_info()
{
	AI_Output(self,other,"DIA_Symon_SueInVillage_13_00");	//Кажется, не получилось.
	AI_Output(other,self,"DIA_Symon_SueInVillage_15_01");	//И что дальше делать? Что твой план советует?
	AI_Output(self,other,"DIA_Symon_SueInVillage_13_02");	//На самом деле я так далеко не заглядывал. Думал, план сработает.
	AI_Output(other,self,"DIA_Symon_SueInVillage_15_03");	//(про себя) Иннос, избавь меня от этого идиота! (в слух) И что ты намерен делать с нашим соглашением?
	AI_Output(self,other,"DIA_Symon_SueInVillage_13_04");	//Ну, раз у нас ничего не получилось, то и мой голос ты не получишь.
	AI_Output(other,self,"DIA_Symon_SueInVillage_15_05");	//Ах ты ж, шныжья печенка! Мы договаривались о том, что я помогу тебе в исполнении твоего плана.
	AI_Output(self,other,"DIA_Symon_SueInVillage_13_06");	//Не помню такого. Но ты все еще можешь заплатить мне две с половиной тысячи, и тогда я соглашусь.
	Info_ClearChoices(DIA_Symon_SueInVillage);
	Info_AddChoice(DIA_Symon_SueInVillage,"Давай я поговорю со Сью насчет тебя.",DIA_Symon_SueInVillage_Talk);
	Info_AddChoice(DIA_Symon_SueInVillage,"Вот деньги.",DIA_Symon_AboutConspiracy_Gold);
};

// Запускается, если выбрать реплику "Давай я поговорю со Сью насчет тебя." в диалоге Саймона

func void DIA_Symon_SueInVillage_Talk()
{
	AI_Output(other,self,"DIA_Symon_SueInVillage_Talk_15_00");	//Давай я сначала поговорю со Сью насчет тебя, вдруг я смогу ее убедить.
	AI_Output(self,other,"DIA_Symon_SueInVillage_Talk_13_01");	//Дело твое. Но деваха она упрямая.
	AI_Output(other,self,"DIA_Symon_SueInVillage_Talk_15_02");	//Ничего, мы тоже не лыком шиты.
	AI_Output(self,other,"DIA_Symon_SueInVillage_Talk_13_03");	//Давай, только не тяни. Я, когда пьяный, болтаю много.
	AI_Output(other,self,"DIA_Symon_SueInVillage_Talk_15_04");	//А ты постарайся не пить лишнего, тогда никто ни о чем не пожалеет. Сечешь?
	AI_StopProcessInfos(self);
};

// Активируется, если Сью ушла в деревню по квесту "Помочь добится Сью"
// nr = 1
	
instance DIA_Symon_AboutSue_AfterPlan(C_Info)
{
	npc = PIR_202_DS2P_Symon;
	nr = 1;
	condition = DIA_Symon_AboutSue_AfterPlan_condition;	
	information = DIA_Symon_AboutSue_AfterPlan_info;
	description = "По поводу Сью.";
	permanent = FALSE;
};

func int DIA_Symon_AboutSue_AfterPlan_condition()
{
	if (MIS_DS2P_WinSueHand == Log_Running && Npc_KnowsInfo(other,DIA_Symon_SueInVillage))
	{	
		return TRUE;	
	};
};

func void DIA_Symon_AboutSue_AfterPlan_info()
{
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_15_00");	//По поводу Сью.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_13_01");	//Да? Что-то новенькое?
	Info_ClearChoices(DIA_Symon_AboutSue_AfterPlan);
	Info_AddChoice(DIA_Symon_AboutSue_AfterPlan,"Нет, ничего.",DIA_Symon_AboutSue_AfterPlan_Nothing);
	if (Npc_KnowsInfo(other,DIA_SueBaby_AgainAboutSymon)) // Если Сью согласилась встречатся с Саймоном
	{
		Info_AddChoice(DIA_Symon_AboutSue_AfterPlan,"Да, я убедил ее, что ты – лучший вариант для нее.",DIA_Symon_AboutSue_AfterPlan_Done);
	};
};

// Запускается, если выбрать реплику "Нет, ничего." в диалоге с Саймоном

func void DIA_Symon_AboutSue_AfterPlan_Nothing()
{
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Nothing_15_00");	//Нет, ничего.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Nothing_13_01");	//Держи меня в курсе.
	Info_ClearChoices(DIA_Symon_AboutSue_AfterPlan);
};

// Запускается, если выбрать реплику "Да, я убедил ее, что ты – лучший вариант для нее." в диалоге с Саймоном

func void DIA_Symon_AboutSue_AfterPlan_Done()
{
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Done_15_00");	//Да, я убедил ее, что ты – лучший вариант для нее.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Done_13_01");	//Ха! Я был уверен, что она рано или поздно сдастся! Она уже, наверное, заждалась меня. Побегу!
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Done_15_02");	//Стой! Что насчет нашего уговора?
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Done_13_03");	//Ах да, я проголосую за Грега. Не волнуйся.
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Done_15_04");	//Только потерпи чуть-чуть со Сью, не лезь к ней сразу с  пристованиями.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Done_13_05");	//Что? Почему это?
	AI_Output(other,self,"DIA_Symon_AboutSue_AfterPlan_Done_15_06");	//Кажется у нее ЭТИ дни. Она меня так огрела по голове, что до сих пор звезды в глазах пляшут.
	AI_Output(self,other,"DIA_Symon_AboutSue_AfterPlan_Done_13_07");	//Саймон: Спасибо, приму во внимание.
	B_StartOtherRoutine(self,"TALKWITHSUE");
	B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_Success,TOPIC_DS2P_WinSueHand_Success);
	B_GivePlayerXP(XP_MIS_DS2P_WinSueHand);
	Symon_InConspiracy = TRUE;
	B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_SymonIn);
	AI_StopProcessInfos(self);
};