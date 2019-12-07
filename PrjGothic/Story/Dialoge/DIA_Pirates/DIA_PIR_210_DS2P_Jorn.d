instance DIA_Jorn_EXIT(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Jorn_EXIT_condition;	
	information = DIA_Jorn_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Jorn_EXIT_condition(){	return TRUE;};
func void DIA_Jorn_EXIT_info(){	AI_StopProcessInfos(self);};
//
//	СТАРТОВЫЙ ДИАЛОГ
//
var int Jorn_GetDistToWP_GG;	//Расстояние ГГ от вайпойнта, где охраняют.
const string Jorn_GuardWP = "";
var int Jorn_RightAnswer;	//Переменная, отвечающая за то, что Йорн начнёт нормально разговаривать с ГГ.
instance DIA_Jorn_Start(C_Info)	//Начальный диалог "А ну, стой!"  //nr = 1
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_Start_condition;	
	information = DIA_Jorn_Start_info;
	important = TRUE;
};
func int DIA_Jorn_Start_condition(){	return TRUE;};
func void DIA_Jorn_Start_info()
{
	If(Npc_HasEquippedRangedWeapon(self))
	{
		AI_ReadyRangedWeapon(self);
		AI_AimAt(self,other);
	}
	else if(Npc_HasEquippedMeleeWeapon(self))
	{
		AI_ReadyMeleeWeapon(self);
	};
	AI_Output(self,other,"DIA_Jorn_Start_13_00");	//А ну стой! Ты кто такой? Еще один шаг, и я стреляю.
	AI_Output(other,self,"DIA_Jorn_Start_15_00");	//Я пришел из деревни.
	AI_Output(self,other,"DIA_Jorn_Start_13_01");	//Это и кротокрысу понятно, что не с дерева упал!
	AI_Output(self,other,"DIA_Jorn_Start_13_02");	//Все сельчане должны находиться в деревне – это приказ Гарда!
	AI_Output(self,other,"DIA_Jorn_Start_13_03");	//Стоп, а  может ты из этих, беглых? Я слышал, что некоторым особо ретивым охотникам удалось сбежать.
	
	AI_Output(other,self,"DIA_Jorn_Start_15_01");	//По-твоему, я похож на крестьянина?
	AI_Output(self,other,"DIA_Jorn_Start_13_04");	//А кто вас разберет? Я не специалист по аборигенам.
	AI_Output(self,other,"DIA_Jorn_Start_13_05");	//В общем, у тебя есть пять секунд, чтобы убраться отсюда либо доказать мне, что ты не из этих долбаных охотников.
	Jorn_GetDistToWP_GG = Npc_GetDistToWP(other,Jorn_GuardWP);
};
//
//	Появляется после стартового, но до того момента, пока не сказал нужную фразу
//
instance DIA_Jorn_DoNotTemptFate(C_Info)	//	"Не искушай судьбу!"  //nr = 1
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Jorn_DoNotTemptFate_condition;	
	information = DIA_Jorn_DoNotTemptFate_info;
	important = TRUE;
};
func int DIA_Jorn_DoNotTemptFate_condition(){	
	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && C_Npc_GetDistToWP(other,Jorn_GuardWP,Jorn_GetDistToWP_GG,less) && !Jorn_RightAnswer)
	{return TRUE;};
};
func void DIA_Jorn_DoNotTemptFate_info()
{
	AI_Output(self,other,"DIA_Jorn_DoNotTemptFate_13_00");	//Еще один шаг... Не искушай судьбу!
	AI_StopProcessInfos(self);
};
//
//	Появляется после стартового, но до того момента, пока не сказал нужную фразу
//
instance DIA_Jorn_IwarnedU(C_Info)	//	"Я тебя предупреждал..."  //nr = 1
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Jorn_IwarnedU_condition;	
	information = DIA_Jorn_IwarnedU_info;
	important = TRUE;
};
func int DIA_Jorn_IwarnedU_condition(){	
	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && C_Npc_GetDistToWP(other,Jorn_GuardWP,Jorn_GetDistToWP_GG-100,less) && !Jorn_RightAnswer)
	{return TRUE;};
};
func void DIA_Jorn_IwarnedU_info()
{
	AI_Output(self,other,"DIA_Jorn_IwarnedU_13_00");	//Я тебя предупреждал...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
//
//	Появляется после стартового, но до того момента, пока не сказал нужную фразу
//
instance DIA_Jorn_ISailedOnShip(C_Info)	//	"Я совсем недавно приплыл на корабле."  //nr = 900
{
	npc = PIR_210_DS2P_Jorn;
	nr = 900;
	permanent = FALSE;
	condition = DIA_Jorn_ISailedOnShip_condition;	
	information = DIA_Jorn_ISailedOnShip_info;
	description = "Я совсем недавно приплыл на корабле.";
};
func int DIA_Jorn_ISailedOnShip_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && !Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_ISailedOnShip_info()
{
	AI_Output(other,self,"DIA_Jorn_ISailedOnShip_15_00");	//Я совсем недавно приплыл на корабле.
	AI_Output(self,other,"DIA_Jorn_ISailedOnShip_13_00");	//Да? И где твоя команда? Ах да, ты же оставил ее в деревне... Ну-ну...
	AI_Output(self,other,"DIA_Jorn_ISailedOnShip_13_01");	//Не парь мне мозги! Если бы у тебя был корабль, нас бы здесь уже давно не было. Уж я-то знаю Гарда, он не упустит свой шанс.	
	AI_Output(other,self,"DIA_Jorn_ISailedOnShip_15_01");	//Но...
	AI_Output(self,other,"DIA_Jorn_ISailedOnShip_13_02");	//Лучше по-хорошему возвращайся в деревню.
	AI_StopProcessInfos(self);
};
//
//	Появляется после стартового, но до того момента, пока не сказал нужную фразу
//
instance DIA_Jorn_AskGreg(C_Info)	//	"Если не веришь, спроси у Грега."  //nr = 901
{
	npc = PIR_210_DS2P_Jorn;
	nr = 901;
	permanent = FALSE;
	condition = DIA_Jorn_AskGreg_condition;	
	information = DIA_Jorn_AskGreg_info;
	description = "Если не веришь, спроси у Грега.";
};
func int DIA_Jorn_AskGreg_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && !Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_AskGreg_info()
{
	AI_Output(other,self,"DIA_Jorn_AskGreg_15_00");	//Если не веришь, спроси у Грега.
	AI_Output(self,other,"DIA_Jorn_AskGreg_13_00");	//Ага, уже бегу. Вон смотри пыли сколько поднялось, это все я!
	AI_Output(self,other,"DIA_Jorn_AskGreg_13_01");	//Ха! Придумай что-нибудь более умное.
	AI_StopProcessInfos(self);
};
//
//	Появляется после стартового, но до того момента, пока не сказал нужную фразу
//
instance DIA_Jorn_WhatWouldUDoIfImHunter(C_Info)	//	"Ну, и что ты мне сделаешь, если я охотник?"  //nr = 902
{
	npc = PIR_210_DS2P_Jorn;
	nr = 902;
	permanent = FALSE;
	condition = DIA_Jorn_WhatWouldUDoIfImHunter_condition;	
	information = DIA_Jorn_WhatWouldUDoIfImHunter_info;
	description = "Ну, и что ты мне сделаешь, если я охотник?";
};
func int DIA_Jorn_WhatWouldUDoIfImHunter_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && !Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_WhatWouldUDoIfImHunter_info()
{
	AI_Output(other,self,"DIA_Jorn_WhatWouldUDoIfImHunter_15_00");	//Ну, и что ты мне сделаешь, если я охотник?
	AI_Output(self,other,"DIA_Jorn_WhatWouldUDoIfImHunter_13_00");	//Хочешь узнать? Я тебе сейчас объясню.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
//
//	Появляется после стартового, но до того момента, пока не сказал нужную фразу (эту фразу)
//
instance DIA_Jorn_IKnowAboutCursedIsland(C_Info)	//	"Я знаю о проклятом острове."  //nr = 903
{
	npc = PIR_210_DS2P_Jorn;
	nr = 903;
	permanent = FALSE;
	condition = DIA_Jorn_IKnowAboutCursedIsland_condition;	
	information = DIA_Jorn_IKnowAboutCursedIsland_info;
	description = "Я знаю о проклятом острове.";
};
func int DIA_Jorn_IKnowAboutCursedIsland_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && !Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_IKnowAboutCursedIsland_info()
{
	AI_Output(other,self,"DIA_Jorn_IKnowAboutCursedIsland_15_00");	//Я знаю о проклятом острове, где у вас был лагерь. Мне даже удалось побывать там.
	AI_Output(self,other,"DIA_Jorn_IKnowAboutCursedIsland_13_00");	//Что значит был?
	AI_Output(other,self,"DIA_Jorn_IKnowAboutCursedIsland_15_01");	//То и значит. На острове произошел магический взрыв, все разрушено.
	AI_Output(other,self,"DIA_Jorn_IKnowAboutCursedIsland_15_02");	//Мой друг сразился с Темным в Храме Черепа и сумел победить его. Но за все приходится платить...
	AI_Output(other,self,"DIA_Jorn_IKnowAboutCursedIsland_15_03");	//Когда мы отплывали, я видел, как остров постепенно уходил под воду. Думаю, за время нашего путешествия сюда на месте вашего лагеря уже начали плескаться волны океана.
	AI_Output(self,other,"DIA_Jorn_IKnowAboutCursedIsland_13_01");	//Вот черт! Похоже, ты действительно много знаешь для простого охотника.
	Jorn_RightAnswer = TRUE;
};
//
//	Появляется после драки, если ГГ выиграл
//
instance DIA_Jorn_AfterWinGG(C_Info)	//	"А ты крепкий малый!"  important
{
	npc = PIR_210_DS2P_Jorn;
	nr = 0;
	permanent = FALSE;
	condition = DIA_Jorn_AfterWinGG_condition;	
	information = DIA_Jorn_AfterWinGG_info;
	important = true;
};
func int DIA_Jorn_AfterWinGG_condition(){	
	if(Npc_KnowsInfo(other,DIA_Jorn_Start) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && !Jorn_RightAnswer)
	{return TRUE;};
};
func void DIA_Jorn_AfterWinGG_info()
{
	AI_Output(self,other,"DIA_Jorn_AfterWinGG_13_00");	//А ты крепкий малый! Не ожидал.
	AI_Output(self,other,"DIA_Jorn_AfterWinGG_13_01");	//Похоже, ты не врешь. Не думаю, что среди крестьян кто-то смог бы так же умело сражаться.
	B_GivePlayerXP(XP_Ambient);
	Jorn_RightAnswer = TRUE;
};
///-------------------------------------------------------------------------------------------------
//--ЗДЕСЬ ДИАЛОГИ ПОСЛЕ ТОГО, КАК СКАЗАЛ НУЖНЫЙ ОТВЕТ: "Я знаю о проклятом острове." или побил ЙОРНА.
//--ФАКТИЧЕСКИ ИДЁТ НОВЫЙ СТАРТ
////////////////////////////////////////////////////////////////////////////////////////////////////

instance DIA_Jorn_WhoAU(C_Info)	//	"Кто ты?"  //nr = 1
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_WhoAU_condition;	
	information = DIA_Jorn_WhoAU_info;
	description = "Кто ты?";
};
func int DIA_Jorn_WhoAU_condition(){	if(Jorn_RightAnswer){return TRUE;};};
func void DIA_Jorn_WhoAU_info()
{
	AI_Output(other,self,"DIA_Jorn_WhoAU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_00");	//Меня зовут Йорн, я один из абордажников на судне капитана Гарда!
	AI_Output(other,self,"DIA_Jorn_WhoAU_15_01");	//На судне?
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_01");	//Тьфу ты! Я БЫЛ на судне капитана.
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_02");	//Теперь наша посудина украшает берег этого чертового острова, на котором мы застряли.
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_03");	//Но это ничего не меняет! Мой капитан – Гард, и этим все сказано!
	AI_Output(self,other,"DIA_Jorn_WhoAU_13_04");	//Кому посчастливилось ходить в море под его командованием, поймет, о чем я говорю.
};
//
//	Появляется после: стартового "Кто ты?"
//
instance DIA_Jorn_WhatAUDoingHere(C_Info)	//	"Что ты здесь делаешь?"  //nr = 3
{
	npc = PIR_210_DS2P_Jorn;
	nr = 3;
	permanent = FALSE;
	condition = DIA_Jorn_WhatAUDoingHere_condition;	
	information = DIA_Jorn_WhatAUDoingHere_info;
	description = "Что ты здесь делаешь?";
};
func int DIA_Jorn_WhatAUDoingHere_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_WhatAUDoingHere_info()
{
	AI_Output(other,self,"DIA_Jorn_WhatAUDoingHere_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Jorn_WhatAUDoingHere_13_00");	//А ты не видишь что ли? Сторожу эту чертову дверь.
	AI_Output(self,other,"DIA_Jorn_WhatAUDoingHere_13_01");	//Гард считает, что если мы будем держать взаперти несколько женщин из деревни, у местных не будет лишнего повода устроить нам неприятности.
	AI_Output(self,other,"DIA_Jorn_WhatAUDoingHere_13_02");	//Понятное дело, что если они решат поднять бунт, мы быстро их усмирим, но кому нужны лишние сложности?!
	AI_PlayAni(self,"T_LAUGH_01");
};
//
//	Появляется после: стартового "Кто ты?"
//
instance DIA_Jorn_HowManyPeasantsUHold(C_Info)	//	"Сколько крестьян вы удерживаете?"  //nr = 4
{
	npc = PIR_210_DS2P_Jorn;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Jorn_HowManyPeasantsUHold_condition;	
	information = DIA_Jorn_HowManyPeasantsUHold_info;
	description = "Сколько крестьян вы удерживаете?";
};
func int DIA_Jorn_HowManyPeasantsUHold_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_HowManyPeasantsUHold_info()
{
	AI_Output(other,self,"DIA_Jorn_HowManyPeasantsUHold_15_00");	//Сколько крестьян вы удерживаете?
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_00");	//Четверо – три бабы и старик. Думаю, этого более, чем достаточно.
	AI_Output(other,self,"DIA_Jorn_HowManyPeasantsUHold_15_01");	//А ты не боишься, что они ночью сумеют выбраться?
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_01");	//Нет, не боюсь. (смеется)
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_02");	//Во-первых, у меня отличный слух, а во-вторых, я практически никогда не сплю.
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_03");	//Поэтому-то Гард меня и выбрал для охраны. Знает, что я не подведу!
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_04");	//Ну и для подстраховки внутри сидит Адо, мой дружок.
	AI_PlayAni(self,"T_LAUGH_01");
	AI_Output(self,other,"DIA_Jorn_HowManyPeasantsUHold_13_05");	//Мимо него и мышь не проскочит, уж поверь мне!
};
//
//	Появляется после: стартового "Кто ты?"
//
instance DIA_Jorn_WhyDoULookSoIntently(C_Info)	//	"Почему ты так пристально смотришь?"  //nr = 5
{
	npc = PIR_210_DS2P_Jorn;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Jorn_WhyDoULookSoIntently_condition;	
	information = DIA_Jorn_WhyDoULookSoIntently_info;
	description = "Почему ты так пристально смотришь?";
};
func int DIA_Jorn_WhyDoULookSoIntently_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_WhyDoULookSoIntently_info()
{
	AI_Output(other,self,"DIA_Jorn_WhyDoULookSoIntently_15_00");	//Почему ты так пристально смотришь?
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_00");	//Слушай, может у тебя есть чего выпить?
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_01");	//Парни там, наверняка, хлебают каждый день шнапс и ром, а мне приходится стоять здесь каждый день практически на сухую.
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_02");	//Я так еще трезвенником стану. А это мне совсем нельзя! (смеется)
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_03");	//Я, конечно, могу тебе сейчас дать со всего маху по роже и забрать все, что у тебя есть, но тогда ты больше не вернешься.
	AI_Output(self,other,"DIA_Jorn_WhyDoULookSoIntently_13_04");	//А мне нужно много выпивки!
};
//
//	Появляется после: предыдущего "Почему ты так пристально смотришь?"
//
instance DIA_Jorn_AboutAlcohol(C_Info)	//	"По поводу выпивки..."  //nr = 50
{
	npc = PIR_210_DS2P_Jorn;
	nr = 50;
	permanent = TRUE;
	condition = DIA_Jorn_AboutAlcohol_condition;	
	information = DIA_Jorn_AboutAlcohol_info;
	description = "По поводу выпивки...";
};
func int DIA_Jorn_AboutAlcohol_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhyDoULookSoIntently)){return TRUE;};};
func void DIA_Jorn_AboutAlcohol_info()
{
	//Функция B_Build_TrdString возвращает строку "%text% Всего: xxx штук"
	Info_ClearChoices(DIA_Jorn_AboutAlcohol);
	Info_AddChoice(DIA_Jorn_AboutAlcohol, "Пока ничего...", DIA_Jorn_AboutAlcohol_Back);
	If(Npc_HasItems(other,ItFo_Addon_Grog))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("У меня есть грог.",ItFo_Addon_Grog), DIA_Jorn_AboutAlcohol_Grog);
	};
	If(Npc_HasItems(other,ItFo_Addon_Rum))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("У меня есть ром.",ItFo_Addon_Rum), DIA_Jorn_AboutAlcohol_Rum);
	};
	If(Npc_HasItems(other,ItFo_Wine))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("У меня есть вино.",ItFo_Wine), DIA_Jorn_AboutAlcohol_Wine);
	};
	If(Npc_HasItems(other,ITFO_SAMOGON))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("У меня есть самогон.",ITFO_SAMOGON), DIA_Jorn_AboutAlcohol_Samogon);
	};
	If(Npc_HasItems(other,ItFo_Booze))
	{	Info_AddChoice(DIA_Jorn_AboutAlcohol, B_Build_TrdString("У меня есть шнапс.",ItFo_Booze), DIA_Jorn_AboutAlcohol_Booze);
	};	
};
func void DIA_Jorn_AboutAlcohol_Back()
{
	Info_ClearChoices(DIA_Jorn_AboutAlcohol);
};
func void B_DSG_TransferAlcohol_Jorn(var int itemInstance,var int count)
{
	if(count == -1){count = Npc_HasItems(other,itemInstance);};
	B_GivePlayerXP(XP_Ambient);
	Npc_GetInvItem(other,itemInstance);
	B_DS_GiveRemoveItems_Red(other,self, itemInstance, count, 34);
	B_GiveInvItem_red(self,other, ItMi_Gold, count * item.value * 2, 37);
	DIA_Jorn_AboutAlcohol_info();
};
func void DIA_Jorn_AboutAlcohol_Grog()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Grog_15_00");	//У меня есть грог.
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Grog_13_00");	//Это то, что мне сейчас нужно.
	B_DSG_TransferAlcohol_Jorn(ItFo_Addon_Grog,1);
};
func void DIA_Jorn_AboutAlcohol_Rum()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Rum_15_00");	//Как насчет бутылки рома?
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Rum_13_00");	//Еще спрашиваешь! Давай сюда.
	B_DSG_TransferAlcohol_Jorn(ItFo_Addon_Rum,1);
};
func void DIA_Jorn_AboutAlcohol_Wine()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Wine_15_00");	//У меня есть вино.
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Wine_13_00");	//Напиток королей. Отлично, забираю все.
	B_DSG_TransferAlcohol_Jorn(ItFo_Wine,-1);
};
func void DIA_Jorn_AboutAlcohol_Samogon()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Samogon_15_00");	//У меня есть самогон.
	Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Samogon_13_00");	//(недовольно) Опять эта бурда! У меня от нее потом живот пучит. Ну, да ладно.
	B_DSG_TransferAlcohol_Jorn(ITFO_SAMOGON,1);
};
func void DIA_Jorn_AboutAlcohol_Booze()
{
	AI_Output(other,self,"DIA_Jorn_AboutAlcohol_Booze_15_00");	//У меня есть шнапс.
	AI_Output(self,other,"DIA_Jorn_AboutAlcohol_Booze_13_00");	//О, как же я по тебе соскучился!
	B_DSG_TransferAlcohol_Jorn(ItFo_Booze,1);
};
//
//	Появляется после: стартового "Кто ты?"
//
instance DIA_Jorn_MayIGoToPrisoners(C_Info)	//	"Я могу пройти к пленным?"  //nr = 6
{
	npc = PIR_210_DS2P_Jorn;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Jorn_MayIGoToPrisoners_condition;	
	information = DIA_Jorn_MayIGoToPrisoners_info;
	description = "Я могу пройти к пленным?";
};
func int DIA_Jorn_MayIGoToPrisoners_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_MayIGoToPrisoners_info()
{
	AI_Output(other,self,"DIA_Jorn_MayIGoToPrisoners_15_00");	//Я могу пройти к пленным?
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_00");	//Это еще зачем? Без приказа капитана я никого внутрь не пущу.
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_01");	//А если ты думаешь, что сможешь ночью подкрасться ко мне и вырубить, то не обольщайся.
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_02");	//Я все равно тебя замечу, уж поверь мне. Но даже если у тебя получится со мной справиться, тебе это не поможет.
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_03");	//Ключа у меня все равно нет.
	
	AI_Output(other,self,"DIA_Jorn_MayIGoToPrisoners_15_01");	//А как же ты сам попадешь внутрь?
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_04");	//Внутри Адо, дубина. Он слышит пароль и открывает дверь.
	AI_Output(self,other,"DIA_Jorn_MayIGoToPrisoners_13_05");	//Но ты-то пароля не знаешь, а я тебе не скажу. (смеется) Такие дела!
};
//
//	Появляется после: предыдущего "Я могу пройти к пленным?"
//
instance DIA_Jorn_AUOK(C_Info)	//	"Как служба? (постоянный)"  //nr = 6
{
	npc = PIR_210_DS2P_Jorn;
	nr = 60;
	permanent = true;
	condition = DIA_Jorn_AUOK_condition;	
	information = DIA_Jorn_AUOK_info;
	description = "Как служба?";
};
func int DIA_Jorn_AUOK_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_MayIGoToPrisoners)){return TRUE;};};
func void DIA_Jorn_AUOK_info()
{
	AI_Output(other,self,"DIA_Jorn_AUOK_15_00");	//Как служба?
	AI_Output(self,other,"DIA_Jorn_AUOK_13_00");	//Какая еще служба? Я на посту!
	AI_Output(self,other,"DIA_Jorn_AUOK_13_01");	//Не лезь ко мне со всякими глупыми вопросами!
};
//
//	Появляется после: стартового "Кто ты?" и если взят квест "Разбитое сердце"
//
instance DIA_Jorn_NikkiWantsMeToKillU(C_Info)	//	"Никки попросила убить тебя."  //nr = 7
{
	npc = PIR_210_DS2P_Jorn;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Jorn_NikkiWantsMeToKillU_condition;	
	information = DIA_Jorn_NikkiWantsMeToKillU_info;
	description = "Никки попросила убить тебя.";
};
func int DIA_Jorn_NikkiWantsMeToKillU_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU) && (MIS_DS2P_BrokenHeart == LOG_Running)){return TRUE;};};
func void DIA_Jorn_NikkiWantsMeToKillU_info()
{
	AI_Output(other,self,"DIA_Jorn_NikkiWantsMeToKillU_15_00");	//Никки попросила убить тебя.
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_00");	//Ты что несешь? Какая еще Никки?
	
	AI_Output(other,self,"DIA_Jorn_NikkiWantsMeToKillU_15_01");	//Крестьянка, которую ты обесчестил.
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_01");	//Тебе что, спрут все мозги съел?
	AI_PlayAni(self,"R_SCRATCHHEAD");
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_02");	//(задумался) А, погоди! Ты, наверное, говоришь об этой сумасшедшей бабе, которая носила нам еду?
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_03");	//Помню, помню! (смеется)
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_04");	//И она тебе сказала, что я ее обесчестил? Ха! Да она сама меня... Эм...
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_05");	//Ну, в общем, вела себя как портовая шлюха, которую укусил варан!
	
	AI_Output(other,self,"DIA_Jorn_NikkiWantsMeToKillU_15_02");	//Ты хочешь сказать, что Никки предлагала себя добровольно?
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_06");	//Ну, тебе нужно идти в советники к Робару с такими-то мозгами и сообразительностью! (громко смеется)
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_07");	//Я люблю девок легкого поведения, но это был перебор.
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_08");	//Она набросилась на меня как бешеный варг, царапалась, кричала, изорвала мне рубаху.
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_09");	//Говорю тебе – она совсем с катушек съехала. Я таких сумасшедших шлюх еще не встречал!
	AI_Output(self,other,"DIA_Jorn_NikkiWantsMeToKillU_13_10");	//С такой на ночь лучше не оставаться, а то под утро выяснится, что не ты с ней, а она с тобой, а твой труп найдут дня через два в канаве...
	
	AI_Output(other,self,"DIA_Jorn_NikkiWantsMeToKillU_15_03");	//Очень странно.
	B_DSG_Log_OpenClose(TOPIC_DS2P_BrokenHeart,LOG_MISSION,LOG_Running,TOPIC_DS2P_BrokenHeart_JornVersion);
};
//
//	Появляется после: стартового "Кто ты?"
//
instance DIA_Jorn_WhatHappenedToUrFace(C_Info)	//	"Что у тебя с лицом?"  //nr = 8
{
	npc = PIR_210_DS2P_Jorn;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Jorn_WhatHappenedToUrFace_condition;	
	information = DIA_Jorn_WhatHappenedToUrFace_info;
	description = "Что у тебя с лицом?";
};
func int DIA_Jorn_WhatHappenedToUrFace_condition(){	if(Npc_KnowsInfo(other,DIA_Jorn_WhoAU)){return TRUE;};};
func void DIA_Jorn_WhatHappenedToUrFace_info()
{
	AI_Output(other,self,"DIA_Jorn_WhatHappenedToUrFace_15_00");	//Что у тебя с лицом?
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_00");	//(недовольно) Чертовы гоблины!
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_01");	//Вчера вечером эти бестии напали на нас как раз перед закатом, когда солнце светило в глаза.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_02");	//Поэтому я не заметил их сразу, чем они и воспользовались.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_03");	//Уж не знаю, чем мы так им досадили, но они сражались как бешеные, постоянно что-то кричали на своем языке.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_04");	//Я думал, мы с Хобо не выстоим.
	
	AI_Output(other,self,"DIA_Jorn_WhatHappenedToUrFace_15_01");	//Сколько их было?
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_05");	//Больше десятка точно. Большую часть нам удалось перебить, остальные удрали в лес.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_06");	//Если бы не приказ Гарда, я бы достал их всех, но я не могу оставить пост, а Хобо не такой отличный боец, и один здесь не справится, если начнется заварушка.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_07");	//Слушай, а может ты добьешь их? А то мало ли, вдруг они опять соберут отряд и нападут.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_13_08");	//Мне как-то не очень нравится мысль, что кто-то жаждет перерезать мне глотку.
	Info_ClearChoices(DIA_Jorn_WhatHappenedToUrFace);
	Info_AddChoice(DIA_Jorn_WhatHappenedToUrFace, "Я расправлюсь с гоблинами.", DIA_Jorn_WhatHappenedToUrFace_Help);
	Info_AddChoice(DIA_Jorn_WhatHappenedToUrFace, "Разбирайся сам со своими проблемами.", DIA_Jorn_WhatHappenedToUrFace_Deny);
};
func void DIA_Jorn_WhatHappenedToUrFace_Deny()
{
	AI_Output(other,self,"DIA_Jorn_WhatHappenedToUrFace_Deny_15_00");	//Разбирайся сам со своими проблемами.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_Deny_13_00");	//Архх... Ладно, черт с тобой. Струсил, так и скажи!
	Info_ClearChoices(DIA_Jorn_WhatHappenedToUrFace);
};
func void DIA_Jorn_WhatHappenedToUrFace_Help()
{
	AI_Output(other,self,"DIA_Jorn_WhatHappenedToUrFace_Help_15_00");	//Я расправлюсь с гоблинами.
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_Help_13_00");	//Отлично! После нападения они удрали /*Redleha: вон туда...*/
	AI_Output(self,other,"DIA_Jorn_WhatHappenedToUrFace_Help_13_01");	//Достань этих тварей, а в качестве доказательства принеси мне три уха гоблина.
	B_DSG_Log_OpenClose(TOPIC_DS2P_CunningGoblins, LOG_MISSION, LOG_Running, TOPIC_DS2P_CunningGoblins_Start);
};

//NS - 14/06/2013 =============================================
// Сдача квеста "Хитрые гоблины"
//=============================================================
instance DIA_Jorn_GobboKilled(C_Info)	//	"Я убил гоблинов"  //nr = 8
{
	npc = PIR_210_DS2P_Jorn;
	nr = 8;
	permanent = FALSE;
	condition = DIA_Jorn_GobboKilled_condition;	
	information = DIA_Jorn_GobboKilled_info;
	description = "Я убил гоблинов.";
};
func int DIA_Jorn_GobboKilled_condition()
{
	if(Npc_HasItems(self, ITMI_DS2P_GoblinEar) >= 3)
	{	return TRUE;};
};

func void DIA_Jorn_GobboKilled_info()
{
	var int x;
	AI_Output(other,self,"DIA_Jorn_GobboKilled_15_00");	//Я убил гоблинов.
	B_GivePlayerXP(XP_MIS_CunningGoblins_Killed);
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_01");	//Ты принес в качестве доказательства их уши?
	AI_Output(other,self,"DIA_Jorn_GobboKilled_15_02");	//Да, вот они.
	//Отдаем три уха гоблина.
	x = 1;	if (x == 1)	{
		B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_GoblinEar,3,35);
	};
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_03");	//Отлично. Теперь я могу быть спокоен, что одной проблемой стало меньше.
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_04");	//Это тебе в награду – немного золота и железной руды, которую я нашел в пещере.
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_05");	//Если ты разбираешься в кузнечном деле, она тебе пригодится в изготовлении клинков, если нет – можешь  продать ее Джозефу.
		AI_Output(self,other,"DIA_Jorn_GobboKilled_13_06");	//Я слышал, у него кто-то выкрал все заготовки.
	//Дает 500 золотых и 5 кусков железной руды.
	x = 2;	if (x == 2)	{
		B_GiveInvItem_red(self,other,ITMI_Gold,500,40);
		B_GiveInvItem_red(self,other,ItMi_IronOre,5,45);
	};
	//Запись в дневнике "Хитрые гоблины", квест окончен
	B_DSG_Log_OpenClose(TOPIC_DS2P_CunningGoblins, LOG_MISSION, LOG_SUCCESS, TOPIC_DS2P_CunningGoblins_Success);
};

//NS - 14/06/2013 ==================================================
// Спросить про статуэтку 
//==================================================================
instance DIA_Jorn_AboutStatue(C_Info)	//	"Я слышал, что ты прикарманил статуэтку гоблинов."  //nr = 9
{
	npc = PIR_210_DS2P_Jorn;
	nr = 9;
	condition = DIA_Jorn_AboutStatue_condition;	
	information = DIA_Jorn_AboutStatue_info;
	description = "Я слышал, что ты прикарманил статуэтку гоблинов.";
};
func int DIA_Jorn_AboutStatue_condition()
{
	if (MIS_DS2P_FigurinesGurun == LOG_Running)
	{	return TRUE;};
};
func void DIA_Jorn_AboutStatue_info()
{
	var C_NPC Jorn; Jorn = Hlp_GetNpc(PIR_210_DS2P_Jorn);
	var C_NPC Hobo; Hobo = Hlp_GetNpc(PIR_215_DS2P_Hobo);
	
	if (!Npc_IsDead(Hobo))
	{
		TRIA_Invite(Hobo);
		TRIA_Start();
		
		// self = Jorn, other = Hero
		TRIA_Next(Jorn);
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_00");	//Я слышал, что ты прикарманил статуэтку гоблинов.
		B_GivePlayerXP(XP_MIS_FigurinesGurun_AscJorn);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_01");	//Эээ! Кто тебе сказал?
			AI_TurnToNpc(self, Hobo);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_02");	//Хобо, это ты что ли разболтал, а?!
		
		// self = Hobo, other = Hero
		TRIA_Next(Hobo);
			AI_TurnToNpc(Hobo, Jorn);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_03");	//Что?

		// self = Jorn, other = Hero
		TRIA_Next(Jorn);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_04");	//Аргхх! 
			AI_TurnToNpc(self, hero);
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_05");	//Хобо тут ни при чем, один гоблин на ушко шепнул.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_06");	//(злобно) Ты меня за кретина держишь? Чего тебе надо?
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_07");	//Статуэтку, конечно же.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_08");	//И почему ты думаешь, что я ее тебе отдам? Это моя добыча!
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_09");	//Мне казалось, что у вас кодекс, по которому вся добыча делится поровну.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_10");	//(злобно) Все-то он знает... Ладно. Давай так. Просто так я ее тебе не отдам.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_11");	//Мне какая разница, что при дележке получить долю, что так. Поэтому давай мне двести золотых, и статуэтка твоя.
		DIAG_Reset();
		TRIA_Finish();
	}
	// если Хобо мертв, краткий вариант
	else
	{
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_00");	//Я слышал, что ты прикарманил статуэтку гоблинов.
		B_GivePlayerXP(XP_MIS_FigurinesGurun_AscJorn);
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_01");	//Эээ! Кто тебе сказал?
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_05а");	//Один гоблин на ушко шепнул.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_06");	//(злобно) Ты меня за кретина держишь? Чего тебе надо?
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_07");	//Статуэтку, конечно же.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_08");	//И почему ты думаешь, что я ее тебе отдам? Это моя добыча!
		AI_Output(other,self,"DIA_Jorn_AboutStatue_15_09");	//Мне казалось, что у вас кодекс, по которому вся добыча делится поровну.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_10");	//(злобно) Все-то он знает... Ладно. Давай так. Просто так я ее тебе не отдам.
			AI_Output(self,other,"DIA_Jorn_AboutStatue_13_11");	//Мне какая разница, что при дележке получить долю, что так. Поэтому давай мне двести золотых, и статуэтка твоя.
		
	};
};

//NS - 14/06/2013 ==============================================
// Украсть статуэтку, 
//можно даже если не спрашивали, но нельзя если уже добыли иначе
//==============================================================
var int THIEF_Jorn_EmeraldStatue;
instance DIA_Jorn_PICKPOCKET(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 900;
	condition = DIA_Jorn_PICKPOCKET_Condition;
	information = DIA_Jorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть эту статуэтку будет легко)";
};
func int DIA_Jorn_PICKPOCKET_Condition()
{
	if((MIS_DS2P_FigurinesGurun == LOG_Running) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) > 0) 
		&& (THIEF_Jorn_EmeraldStatue == FALSE) && (Npc_HasItems(self,ITMI_DS2P_GobStatue_Emerald) > 0))
	{	return TRUE;	};
};
func void DIA_Jorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jorn_PICKPOCKET);
	Info_AddChoice(DIA_Jorn_PICKPOCKET,Dialog_Back,DIA_Jorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jorn_PICKPOCKET_DoIt);
};
func void DIA_Jorn_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= C_DS_GetTheftChanceMultiplier(other,40))
	{
		B_GiveInvItems(self,other,ITMI_DS2P_GobStatue_Emerald,1);
		THIEF_Jorn_EmeraldStatue = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Jorn_PICKPOCKET);
		//Запись в дневнике "Статуэтки Гуруна" 
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_EmeraldGot);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};
func void DIA_Jorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jorn_PICKPOCKET);
};

//NS - 14/06/2013 =================================================
// Купить статуэтку, если она еще у него
//=================================================================
instance DIA_Jorn_BuyStatue(C_Info)		// "Я хочу купить у тебя статуэтку.";	//nr = 1;
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	condition = DIA_Jorn_BuyStatue_Condition;
	information = DIA_Jorn_BuyStatue_Info;
	permanent = TRUE;
	description = "Я хочу купить у тебя статуэтку.";
};
func int DIA_Jorn_BuyStatue_Condition()
{
	if((MIS_DS2P_FigurinesGurun == LOG_Running) && (Npc_HasItems(self,ITMI_DS2P_GobStatue_Emerald) > 0))
	{	return TRUE;	};
};
func void DIA_Jorn_BuyStatue_Info()
{
	AI_Output(other,self,"DIA_Jorn_BuyStatue_15_00");	//Я хочу купить у тебя статуэтку.
	if (Npc_HasItems(other, ItMi_Gold) < 200)
	{
		AI_Output(self,other,"DIA_Jorn_BuyStatue_13_01");	//Двести золотых и ни золотым меньше!
	}
	else
	{
		AI_Output(self,other,"DIA_Jorn_BuyStatue_13_02");	//Забирай. Мне все-таки интересно, кто же проболтался...
		B_DS_GiveRemoveItems_Red(other,self,ItMi_Gold,100,40);
		B_GiveInvItem_red(self,other,ITMI_DS2P_GobStatue_Emerald,1,45);
		//Запись в дневнике "Статуэтки Гуруна" 
		B_DSG_Log_OpenClose(TOPIC_DS2P_FigurinesGurun, LOG_MISSION, LOG_Running, TOPIC_DS2P_FigurinesGurun_EmeraldGot);
	};
};

//NS - 14/06/2013 ==================================================
// По поводу Хобо 
//==================================================================
instance DIA_Jorn_AboutHobo(C_Info)	//	"Твой друг совсем неразговорчивый."  //nr = 9
{
	npc = PIR_210_DS2P_Jorn;
	nr = 9;
	condition = DIA_Jorn_AboutHobo_condition;	
	information = DIA_Jorn_AboutHobo_info;
	description = "Твой друг совсем неразговорчивый.";
};
func int DIA_Jorn_AboutHobo_condition()
{
	if (Npc_KnowsInfo(other, DIA_Hobo_WhoAreU) && !Npc_IsDead(Hobo))
	{	return TRUE;};
};
func void DIA_Jorn_AboutHobo_info()
{	
	AI_Output(other,self,"DIA_Jorn_AboutHobo_15_00");	//Твой друг совсем неразговорчивый.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_01");	//(смеется) Ты про Хобо? Да, есть такое. Не обращай внимания, это его ядром задело чуток.
	AI_Output(other,self,"DIA_Jorn_AboutHobo_15_02");	//Это как?
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_03");	//Ну, так. Мы часто охотились на Южных островах на мелкие торговые суда.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_04");	//Обычно, если торговец идeт без охранных кораблей, то предпочитают сдаться без боя. Своя жизнь ведь дороже, чем всякое барахло.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_05");	//Так вот пару месяцев назад мы сели на хвост такому судну.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_06");	//А его капитан оказался не так прост, начал отстреливаться, пытался удрать через рифы.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_07");	//Ему, конечно, это не удалось, но при обстреле одно из ядер “поймал“ наш Хобо.
		AI_Output(self,other,"DIA_Jorn_AboutHobo_13_08");	//(смеется) Не скажу, что он раньше был особо разговорчив, но после этого случая последние мозги, похоже, вылетели. 
};

//NS - 01/07/2013 ==================================================
// По квесту "Доставка припасов" 
//==================================================================
//	"Я принес провиант и выпивку." (+опыт)		nr = 1
//Если взят квест "Доставка припасов" и выпивка с собой
instance DIA_Jorn_GiveSupplies(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	condition = DIA_Jorn_GiveSupplies_condition;	
	information = DIA_Jorn_GiveSupplies_info;
	description = "";
};
func int DIA_Jorn_GiveSupplies_condition()
{
	if ((MIS_DS2P_ShippingSupplies == LOG_Running) && (Npc_HasItems(other,ItFo_Booze) >= 4))
	{	return TRUE;};
};
func void DIA_Jorn_GiveSupplies_info()
{	
	var int x;
	AI_Output(other,self,"DIA_Jorn_GiveSupplies_15_00");	//Я принес провиант и выпивку.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_ShippingSupplies_Booze);
		AI_Output(self,other,"DIA_Jorn_GiveSupplies_13_01");	//О, великолепно. Давай бутылки сюда, а еду тащи в пещеру. Я пока не голоден.
	//Забирает 4 бутылки шнапса
	x = 1; if (x == 1) {
		B_GiveInvItems(other,self, ItFo_Booze, 4);
	};
		AI_Output(self,other,"DIA_Jorn_GiveSupplies_13_02");	//Кстати, почему так мало выпивки?! Сам поди половину выхлестал по дороге?!
	AI_Output(other,self,"DIA_Jorn_GiveSupplies_15_03");	//Я не...
		AI_Output(self,other,"DIA_Jorn_GiveSupplies_13_04");	//(перебивает) Ладно, верю. И не вздумай сказать Адо, что ты принес что-нибудь кроме еды!
	if (!Npc_IsDead(Hobo))	{
		AI_Output(self,other,"DIA_Jorn_GiveSupplies_13_05");	//Пускай сторожит насухую, правда Хобо?! (смеется)
	};
	//Запись в дневнике "Доставка припасов" //NS - отсебятина
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_BoozeDelivered);
};

// Активируется, если в инвентаре есть особый самогон, и активен квест "Подставить Йорна"

instance DIA_Jorn_BringCimmSamogon(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_BringCimmSamogon_condition;	
	information = DIA_Jorn_BringCimmSamogon_info;
	description = "";
};

func int DIA_Jorn_BringCimmSamogon_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Running) && (Npc_HasItems(other,ItMi_DS2P_SamogonForJorn) >= 1) && !Npc_KnowsInfo(other,DIA_Jorn_AlternativeSamogon))
	{	
		return TRUE;
	};
};

func void DIA_Jorn_BringCimmSamogon_info()
{
	AI_Output(other,self,"DIA_Jorn_BringCimmSamogon_15_00");	//Не жарко все время тут стоять?
	AI_Output(self,other,"DIA_Jorn_BringCimmSamogon_13_01");	//Еще как жарко! Духота неимоверная.
	// Создаем в инвентаре ГГ самогон и выпиваем его
	CreateInvItems(other,ItFo_Samogon,1);
	B_UseItem(other,ItFo_Samogon);
	AI_Output(other,self,"DIA_Jorn_BringCimmSamogon_15_02");	//Нет ничего лучше, чем холодное пиво в такую погоду.
	AI_Output(self,other,"DIA_Jorn_BringCimmSamogon_13_03");	//(облизываясь) Слушай, у тебя ничего выпить не найдется?
	AI_Output(other,self,"DIA_Jorn_BringCimmSamogon_15_04");	//Сейчас, вроде где-то было. Так… Это тебе, а вот эту бутылочку я приберегу для себя.
	// Отдаем самогон Цимма Йорну
	B_GiveInvItems(other,self,ItMi_DS2P_SamogonForJorn,1);
	// Удаляем самогон Цимма из инвентаря Йорна
	Npc_RemoveInvItems(self,ItMi_DS2P_SamogonForJorn,1);
	// Создаем в инвентаре ГГ самогон и выпиваем его
	CreateInvItems(other,ItFo_Samogon,1);
	B_UseItem(other,ItFo_Samogon);
	// Создаем в инвентаре Йорна самогон и выпиваем его
	CreateInvItems(self,ItFo_Samogon,1);
	B_UseItem(self,ItFo_Samogon);
	AI_Output(self,other,"DIA_Jorn_BringCimmSamogon_13_05");	//Божественно! (сыто отрыгивает) Я твой вечный должник.
	AI_Output(other,self,"DIA_Jorn_BringCimmSamogon_15_06");	//Ничего, как-нибудь сочтемся.
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_DrinkSamogon);
	Jorn_LastTalkDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};

// Йорн обращается к нам спустя сутки, после того, как выпил самогон со слабительным
	
instance DIA_Jorn_AfterSamogonTalk(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_Jorn_AfterSamogonTalk_condition;	
	information = DIA_Jorn_AfterSamogonTalk_info;
	description = "";
};

func int DIA_Jorn_AfterSamogonTalk_condition()
{
	if (Npc_KnowsInfo(other,DIA_Jorn_BringCimmSamogon) && (Jorn_LastTalkDay - Wld_GetDay()) >= 1)
	{	
		return TRUE;
	};
};

func void DIA_Jorn_AfterSamogonTalk_info()
{
	AI_Output(self,other,"DIA_Jorn_AfterSamogonTalk_13_00");	//Что ты мне вчера дал парень?
	AI_Output(other,self,"DIA_Jorn_AfterSamogonTalk_15_01");	//Что-то не так?
	AI_Output(self,other,"DIA_Jorn_AfterSamogonTalk_13_02");	//Чтоб тебя кашалот сожрал! Да! Не так! Я со вчерашнего дня из кустов не вылезаю.
	AI_Output(other,self,"DIA_Jorn_AfterSamogonTalk_15_03");	//Может, ты просто отравился чем-то? Такое иногда бывает. Со мной же все в порядке, а пили мы вместе.
	AI_Output(self,other,"DIA_Jorn_AfterSamogonTalk_13_04");	//Ой, кажется, опять началось…
	// "Йорн драпает в сторону ближайших кустов."
	// Тут меня расписание ему, или просто он добежит до кустов, и вернется обратно?
	AI_StopProcessInfos(self);
};
	
// Активируется, когда мы узнаем, что Адо хочет подставить Йорна
// nr = 1
	
instance DIA_Jorn_AlternativeSamogon(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_AlternativeSamogon_condition;	
	information = DIA_Jorn_AlternativeSamogon_info;
	description = "У меня есть для тебя новость.";
};

func int DIA_Jorn_AlternativeSamogon_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Running) && !Npc_KnowsInfo(other,DIA_Jorn_BringCimmSamogon))
	{	
		return TRUE;
	};
};

func void DIA_Jorn_AlternativeSamogon_info()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_00");	//У меня есть для тебя новость.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_01");	//Говори.
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_02");	//500 монет.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_03");	//Что?! Да за такие деньги…
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_04");	//Поверь, новость стоит этих денег.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_05");	//Хм, ладно. Но если это все окажется пустышкой, ты об этом пожалеешь.
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_06");	//Конечно.
	// Создаем в инвентаре Йорна 500 монет и отдаем ГГ
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_07");	//Теперь говори.
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_08");	//Адо хочет тебя подставить. Он попросил меня, чтобы я взял у местного алхимика слабительное, смешал его с самогоном и дал выпить тебе. Ты бы начал мучиться страшным запором и, когда бы Гард увидел, что тебя нет на посту, сразу попался в объятия разъяренного капитана. Надо ли говорить, какие последствия это бы имело для тебя?
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_09");	//Вот он собачий сын! Помесь хряка и крысы! Я ему глаза… Хотя, стоп. У меня есть идея.
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_10");	//Какая?
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_11");	//Ты выполнишь просьбу Адо, но выпить особый самогон дашь не мне, а ему. Предложишь отметить ваш совместный успех. Ну как?
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_15_12");	//А мне что-то за это будет? Премия от тебя?
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_13_13");	//Ладно, я дам тебе на выбор одно оружие. Идет?
	Info_ClearChoices(DIA_Jorn_AlternativeSamogon);
	Info_AddChoice(DIA_Jorn_AlternativeSamogon,"Нет, разбирайся сам.",DIA_Jorn_AlternativeSamogon_Deciline);
	Info_AddChoice(DIA_Jorn_AlternativeSamogon,"По рукам.",DIA_Jorn_AlternativeSamogon_Accept);
};

// Запускается, если выбрать реплику "Нет, разбирайся сам." в диалоге Йорна "У меня есть для тебя новость."

func void DIA_Jorn_AlternativeSamogon_Deciline()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_Deciline_15_00");	//Нет, разбирайся сам.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_Deciline_13_01");	//Трус! Боишься замараться! Катись отсюда!
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Failed,"");
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "По рукам." в диалоге Йорна "У меня есть для тебя новость."

func void DIA_Jorn_AlternativeSamogon_Accept()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogon_Accept_15_00");	//По рукам.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogon_Accept_13_01");	//Тогда иди и не задерживайся.
	AI_StopProcessInfos(self);
};
	
// Активируется, когда мы отдаем Адо самогон со слабительным
// nr = 1
	
instance DIA_Jorn_AlternativeSamogonForAdo(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_AlternativeSamogonForAdo_condition;	
	information = DIA_Jorn_AlternativeSamogonForAdo_info;
	description = "Я выполнил твое поручение.";
};

func int DIA_Jorn_AlternativeSamogonForAdo_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Running) && Npc_KnowsInfo(other,DIA_Ado_AlternativeSamogon))
	{	
		return TRUE;
	};
};

func void DIA_Jorn_AlternativeSamogonForAdo_info()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_15_00");	//Я выполнил твое поручение. Адо очень скоро почувствует непреодолимую тягу к кустам.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_13_01");	//Ха-ха! На это придут полюбоваться все остальные пираты, это я тебе обещаю. А уж что будет твориться, когда Гард придет, только Белиар ведает. Ха-ха!
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_15_02");	//Ты говорил об оружии на выбор.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_13_03");	//Да. У меня есть двуручная сабля. Оружие хорошее, но мне не по руке. Есть еще крепкий кулачный щит, самое то в кровавой схватке против толпы. Могу дать тебе меч для второй руки, если ты любишь бить врага со всех сторон разом. Что ты выберешь?
	Info_ClearChoices(DIA_Jorn_AlternativeSamogonForAdo);
	Info_AddChoice(DIA_Jorn_AlternativeSamogonForAdo,"Дай мне щит.",DIA_Jorn_AlternativeSamogonForAdo_RewardShield);
	Info_AddChoice(DIA_Jorn_AlternativeSamogonForAdo,"Дай мне меч под вторую руку.",DIA_Jorn_AlternativeSamogonForAdo_Reward2x2);
	Info_AddChoice(DIA_Jorn_AlternativeSamogonForAdo,"Дай мне саблю.",DIA_Jorn_AlternativeSamogonForAdo_RewardSabre);
};

// Запускается, если ГГ выбрал реплику "Дай мне саблю." в диалоге Йорна "Я выполнил твое поручение."

func void DIA_Jorn_AlternativeSamogonForAdo_RewardSabre()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_RewardSabre_15_00");	//Дай мне саблю. Всегда больше тяготел к двуручному оружию.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_RewardSabre_13_01");	//Вот, держи. Он прошел со мной немало схваток, пока не нашел оружие получше.
	//Создаем саблю в инвентаре Адо и отдаем ГГ (UNFINISHED: надо создать предмет, и вставить код)
	CreateInvItems(self,0/*SABRE_INSTANCE*/,1);
	B_GiveInvItems(self,other,0/*SABRE_INSTANCE*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_AlternativeSuccess);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};
	
// Запускается, если ГГ выбрал реплику "Дай мне меч для второй руки." в диалоге Йорна "Я выполнил твое поручение."

func void DIA_Jorn_AlternativeSamogonForAdo_Reward2x2()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_Reward2x2_15_00");	//Дай мне меч под вторую руку. Люблю драться парным оружием.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_Reward2x2_13_01");	//Вот, возьми. Это хороший меч, он не раз спасет тебе жизнь.
	//Создаем меч в инвентаре Адо и отдаем ГГ (UNFINISHED: надо создать предмет, и вставить код)
	CreateInvItems(self,0/*"2x2_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"2x2_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_AlternativeSuccess);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};
	
// Запускается, если ГГ выбрал реплику "Дай мне щит." в диалоге Йорна "Я выполнил твое поручение."

func void DIA_Jorn_AlternativeSamogonForAdo_RewardShield()
{
	AI_Output(other,self,"DIA_Jorn_AlternativeSamogonForAdo_RewardShield_15_00");	//Дай мне щит. Защита – это наше все.
	AI_Output(self,other,"DIA_Jorn_AlternativeSamogonForAdo_RewardShield_13_01");	//Вот он. Он мне достался в качестве приза на одном захваченном нами судне. Как ты понимаешь, в абордажной схватке щит – немного не то оружие, которое мечтает видеть у себя уважающий себя пират.
	//Создаем щит в инвентаре Адо и отдаем ГГ (UNFINISHED: надо создать предмет, и вставить код)
	CreateInvItems(self,0/*"SHIELD_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"SHIELD_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_AlternativeSuccess);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};

// Активируется, когда прошли сутки, после того, как мы отдали Адо слабительное
// nr = 1
	
instance DIA_Jorn_AfterSamogonAdo(C_Info)
{
	npc = PIR_210_DS2P_Jorn;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jorn_AfterSamogonAdo_condition;	
	information = DIA_Jorn_AfterSamogonAdo_info;
	description = "Чем тут пахнет?";
};

func int DIA_Jorn_AfterSamogonAdo_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Success) && (Jorn_LastTalkDay - Wld_GetDay()) >= 1)
	{	
		return TRUE;
	};
};

func void DIA_Jorn_AfterSamogonAdo_info()
{
	AI_Output(other,self,"DIA_Jorn_AfterSamogonAdo_15_00");	//Чем тут пахнет?
	AI_Output(self,other,"DIA_Jorn_AfterSamogonAdo_13_01");	//А это наш герой-засранец изволит благоухать. (смеется)
	AI_Output(other,self,"DIA_Jorn_AfterSamogonAdo_15_02");	//Вот это запашок.
	AI_Output(self,other,"DIA_Jorn_AfterSamogonAdo_13_03");	//Да, с ним теперь никто не общается ближе, чем на десять метров.
	AI_StopProcessInfos(self);
};
	
	