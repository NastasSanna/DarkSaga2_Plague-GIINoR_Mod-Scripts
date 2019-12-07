instance DIA_Barok_EXIT(C_Info)
{
	npc = BAU_104_DS2P_Barok;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Barok_EXIT_condition;	
	information = DIA_Barok_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Barok_EXIT_condition(){	return TRUE;};
func void DIA_Barok_EXIT_info(){	AI_StopProcessInfos(self);};

//
//**--СТАРТОВЫЙ ДИАЛОГ----***//
//
var int C_DIA_Barok_Start_Done;
instance DIA_Barok_Start(C_Info)	//Начальный диалог;  nr=1;
{
	npc = BAU_104_DS2P_Barok;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Barok_Start_condition;	
	information = DIA_Barok_Start_info;
	important = TRUE;
};
func int DIA_Barok_Start_condition(){	
	//(Если подойти к нему, когда он не в загоне)	|| (Если он в загоне)	
	if(((C_Npc_GetDistToWP(self,"",700,more) && Npc_IsInState(self,ZS_Talk)) || C_Npc_GetDistToWP(self,"",700,less)) && !C_DIA_Barok_Start_Done)
	{return TRUE;};
};
func void DIA_Barok_Start_info()
{
	if(C_Npc_GetDistToWP(self,"",700,more))	//отдыхает, не в загоне
	{
		AI_Output(self,other,"DIA_Barok_Start_01_00");	//Уходи! Не мешай мне отдыхать!
		AI_StopProcessInfos(self);
	}
	else if(C_Npc_GetDistToWP(self,"",700,less))
	{
		B_StartOtherRoutine(PIR_202_DS2P_Symon,"GoToBarok");		//Пират Саймон подходит к Бароку и убивает овцу.
		
		AI_Output(self,other,"DIA_Barok_Start_01_01");	//Эй, чего тебе нужно? Здесь не площадь для прогулок!
		AI_Output(other,self,"DIA_Barok_Start_15_00");	//А что же это?
		AI_Output(self,other,"DIA_Barok_Start_01_02");	//Загон для скота, что же еще?! Мои овечки не очень любят незваных гостей!
		AI_Output(other,self,"DIA_Barok_Start_15_01");	//Я так понимаю, ты – скотовод?
		AI_Output(self,other,"DIA_Barok_Start_01_03");	//Да, если можно так сказать в связи с последними событиями.
		AI_Output(other,self,"DIA_Barok_Start_15_02");	//А что случилось?
		AI_Output(self,other,"DIA_Barok_Start_01_04");	//Пираты – вот, что случилось.
		AI_Output(self,other,"DIA_Barok_Start_01_05");	//Эти отморозки перерезали всех свиней и коров. Дескать, им нужно свежее мясо.
		AI_Output(self,other,"DIA_Barok_Start_01_06");	//Я все понимаю, но нельзя же всех до одной убивать. Где я теперь возьму молодняк, чтобы восстановить поголовье?
		AI_Output(self,other,"DIA_Barok_Start_01_07");	//Но как им это объяснишь? Они ведь дикие, умеют только крушить и убивать, а мозгами их Иннос обделил.
		AI_Output(self,other,"DIA_Barok_Start_01_08");	//Вот, остались только три овцы и то потому, что дают молоко. Но, думаю, это ненадолго.
		if(Hlp_IsValidNpc(Sheep_Barok_01) && !Npc_IsDead(Sheep_Barok_01)) {Sheep_Barok_01.flags = 0;};
		if(Hlp_IsValidNpc(Sheep_Barok_02) && !Npc_IsDead(Sheep_Barok_02)) {Sheep_Barok_02.flags = 0;};
		if(Hlp_IsValidNpc(Sheep_Barok_03) && !Npc_IsDead(Sheep_Barok_03)) {Sheep_Barok_03.flags = 0;};
		C_DIA_Barok_Start_Done = TRUE;
	};
	
};

//ТЕСТ

instance DIA_Barok_SymonKillShip(C_Info)		//Подходит пират Саймон и убивает овцу.  nr=1;
{
	npc = BAU_104_DS2P_Barok;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Barok_SymonKillShip_condition;	
	information = DIA_Barok_SymonKillShip_info;
	important = TRUE;
};
func int DIA_Barok_SymonKillShip_condition(){	

	if(C_Npc_GetDistToWP(PIR_202_DS2P_Symon,"",500,less) && (C_DIA_Barok_Start_Done == TRUE))
	{
		other = Hlp_GetNpc(PIR_202_DS2P_Symon);
		AI_TurnToNpc(hero,other);
		AI_TurnToNpc(self,other);
		return TRUE;
	};
};
func void DIA_Barok_SymonKillShip_info()
{
	/*other - это пират Саймон*/
	AI_Output(other,self,"DIA_Barok_SymonKillShip_13_00");	//Эй, крестьянин! Мне нужно мясо!
	AI_Output(self,other,"DIA_Barok_SymonKillShip_01_00");	//Ты же приходил два дня назад и убил последнюю корову. Мяса больше нет!
	AI_Output(other,self,"DIA_Barok_SymonKillShip_13_01");	//А это что? У тебя осталось еще три овцы.
	AI_Output(self,other,"DIA_Barok_SymonKillShip_01_01");	//Но они же дают молоко.
	AI_Output(other,self,"DIA_Barok_SymonKillShip_13_02");	//Ничего, двух будет достаточно.
	AI_StopProcessInfos(self);
	Sheep_Barok_01.flags = 0;
	Sheep_Barok_02.flags = 0;
	Sheep_Barok_03.flags = 0;
	if(Hlp_IsValidNpc(Sheep_Barok_01) && !Npc_IsDead(Sheep_Barok_01))
	{
		B_Attack(PIR_202_DS2P_Symon,Sheep_Barok_01,AR_NONE,1);
		
	}
	else if(Hlp_IsValidNpc(Sheep_Barok_02) && !Npc_IsDead(Sheep_Barok_02))
	{
		B_Attack(PIR_202_DS2P_Symon,Sheep_Barok_02,AR_NONE,1);
	}
	else if(Hlp_IsValidNpc(Sheep_Barok_03) && !Npc_IsDead(Sheep_Barok_03))
	{
		B_Attack(PIR_202_DS2P_Symon,Sheep_Barok_03,AR_NONE,1);
	};
	B_StartOtherRoutine(PIR_202_DS2P_Symon,"START");
};

instance DIA_Barok_DidUSee(C_Info)		//Видел? Скоро я буду не скотовод ...  nr=1;
{
	npc = BAU_104_DS2P_Barok;
	nr = 1;
	permanent = FALSE;
	condition =DIA_Barok_DidUSee_condition;	
	information = DIA_Barok_DidUSee_info;
	important = TRUE;
};
func int DIA_Barok_DidUSee_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_SymonKillShip))	{return TRUE;	};};
func void DIA_Barok_DidUSee_info()
{
	AI_Output(self,other,"DIA_Barok_DidUSee_01_00");	//Видел? Скоро я буду не скотовод, а могильщик, каждый день закапывающий несчастную скотину.
	AI_Output(other,self,"DIA_Barok_DidUSee_15_00");	//Дааа! Не сладко вам тут живется.
};

//--------------------------------------------------------
//		ВСЁ ОСТАЛЬНОЕ РАЗВИВАЕТСЯ ПОСЛЕ ПРЕДЫДУЩИХ ДИАЛОГОВ
//--------------------------------------------------------

instance DIA_Barok_WhatAreUPlanningToDo(C_Info)		//Что ты планируешь делать?  nr=4;
{
	npc = BAU_104_DS2P_Barok;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Barok_WhatAreUPlanningToDo_condition;	
	information = DIA_Barok_WhatAreUPlanningToDo_info;
	description = "Что ты планируешь делать?";
};
func int DIA_Barok_WhatAreUPlanningToDo_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_DidUSee))	{return TRUE;	};};
func void DIA_Barok_WhatAreUPlanningToDo_info()
{
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_15_00");	//Что ты планируешь делать?
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_00");	//Есть у меня одна идея, но, боюсь, ничего не выйдет.
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_15_01");	//О чем ты?
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_01");	//Как я уже говорил, поголовье скота уничтожено, и скоро мне нечем будет заниматься.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_02");	//Новых коров или свиней сюда вряд ли кто-нибудь привезет. Наш остров уже давно не является частью торговых путей.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_03");	//А кроме разведения животных я ничего не умею.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_04");	//Так вот, из всех диких зверей, что есть на острове, можно разводить в домашних условиях, не боясь, что тебе откусят что-нибудь нужное, только кроликов.
	
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_15_02");	//Кролики? Ты шутишь?
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_05");	//Я абсолютно серьезно! Их достаточно много живет в окрестных лесах.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_06");	//Нужно просто поймать две особи разных полов, ну а дальше дело техники. (громко смеется)
	AI_PlayAni(self,"T_LAUGH_01");
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_07");	//Слушай, может ты сходишь в лес?
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_15_03");	//Ам...
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_08");	//Я заплачу золотом!
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_09");	//Нет? Тогда подарю тебе один ценный артефакт, который нашел мой дед в древних руинах острова. Он обладает большой силой.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_01_10");	// Соглашайся, выгодная сделка.
	Info_ClearChoices(DIA_Barok_WhatAreUPlanningToDo);
	Info_AddChoice(DIA_Barok_WhatAreUPlanningToDo,"Хорошо, что я должен делать?",DIA_Barok_WhatAreUPlanningToDo_Yes);
	Info_AddChoice(DIA_Barok_WhatAreUPlanningToDo,"Я не буду этим заниматься.",DIA_Barok_WhatAreUPlanningToDo_No);
};
func void DIA_Barok_WhatAreUPlanningToDo_No()
{
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_No_15_00");	//Я не буду этим заниматься.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_No_01_00");	//(злобно) Ну, и Белиар с тобой. Убирайся!
	AI_PlayAni(self,"T_COMEOVERHERE");
	AI_StopProcessInfos(self);
};
func void DIA_Barok_WhatAreUPlanningToDo_Yes()
{
	AI_Output(other,self,"DIA_Barok_WhatAreUPlanningToDo_Yes_15_00");	//Хорошо, что я должен делать?
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_01");	//Отлично! Ты очень выручишь меня! Смотри, что нужно сделать.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_02");	//Сходи к Тамиру, у него должны быть силки. Затем берешь их и идешь в лес за деревню, /*туда-то и туда-то*/.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_03");	//Я не раз видел там кроликов. Похоже, их там целый выводок.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_04");	//Твоя задача – расставить силки под деревьями. Как только сделаешь это, возвращайся назад. Смысла сидеть возле силков нет.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_05");	//Не думаю, что кролики при тебе полезут в ловушку. Поэтому нужно подождать несколько часов, а затем вернуться и проверить.
	AI_Output(self,other,"DIA_Barok_WhatAreUPlanningToDo_Yes_01_06");	//Я уверен, что тебе повезет.
	B_DSG_Log_OpenClose(TOPIC_DS2P_DangerousHunting,LOG_MISSION,LOG_Running,TOPIC_DS2P_DangerousHunting_Start);
};
//
//-----Диалог появляется после предыдущего "Что ты планируешь делать?" и если Тамир продаёт силки
//
instance DIA_Barok_TamirWantsGold4Snares(C_Info)		//Тамир хочет золото за силки.  nr=4;
{
	npc = BAU_104_DS2P_Barok;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Barok_TamirWantsGold4Snares_condition;	
	information = DIA_Barok_TamirWantsGold4Snares_info;
	description = "Тамир хочет золото за силки.";
};
func int DIA_Barok_TamirWantsGold4Snares_condition(){	
	if((MIS_DS2P_DangerousHunting == LOG_Running) && Tamir_Trade_Snare)	{return TRUE;	};
};
func void DIA_Barok_TamirWantsGold4Snares_info()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares_15_00");	//Тамир хочет золото за силки.
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares_01_00");	//Ах, ну да, конечно. Ты же чужак, и он не отдаст тебе силки просто так. Сколько он хочет?
	Info_ClearChoices(DIA_Barok_TamirWantsGold4Snares);
	Info_AddChoice(DIA_Barok_TamirWantsGold4Snares,"500 золотых",DIA_Barok_TamirWantsGold4Snares500);
	Info_AddChoice(DIA_Barok_TamirWantsGold4Snares,"400 золотых",DIA_Barok_TamirWantsGold4Snares400);
	Info_AddChoice(DIA_Barok_TamirWantsGold4Snares,"300 золотых",DIA_Barok_TamirWantsGold4Snares300);
	Info_AddChoice(DIA_Barok_TamirWantsGold4Snares,"200 золотых",DIA_Barok_TamirWantsGold4Snares200);
};
func void B_DIA_Barok_TamirWantsGold4SnaresUni() {	
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4SnaresUni_01_00");	//Вот половина, остальные получишь, когда принесешь кроликов.
};
func void DIA_Barok_TamirWantsGold4Snares500()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares500_15_00");	//500 золотых
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares500_01_00");	//500 золотых? Да ты решил меня надуть! Им красная цена 300 золотых.
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares500_01_01");	//Не, друг, меня не обведешь вокруг пальца. Извини, но золото тебе придется искать самому.
};
func void DIA_Barok_TamirWantsGold4Snares400()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares400_15_00");	//400 золотых
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares400_01_00");	//Что-то он дерет цены. Надо будет с ним поговорить.
	B_DIA_Barok_TamirWantsGold4SnaresUni();
	B_GiveInvItems(self,other,ItMi_Gold,200);
};
func void DIA_Barok_TamirWantsGold4Snares300()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares300_15_00");	//300 золотых
	B_DIA_Barok_TamirWantsGold4SnaresUni();
	B_GiveInvItems(self,other,ItMi_Gold,150);
};
func void DIA_Barok_TamirWantsGold4Snares200()
{
	AI_Output(other,self,"DIA_Barok_TamirWantsGold4Snares200_15_00");	//200 золотых
	AI_Output(self,other,"DIA_Barok_TamirWantsGold4Snares200_01_00");	//Хм... что-то он очень продешевил. Ну, да ладно.
	B_DIA_Barok_TamirWantsGold4SnaresUni();
	B_GiveInvItems(self,other,ItMi_Gold,100);
};
//
//-----Диалог появляется после: предыдущего "Что ты планируешь делать?"; если запущен квест "Опасная охота"; есть пойманные кролики
//
instance DIA_Barok_IveCaughtTwoRabbits(C_Info)		//Мне удалось поймать двух кроликов.  nr=4;
{
	npc = BAU_104_DS2P_Barok;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Barok_IveCaughtTwoRabbits_condition;	
	information = DIA_Barok_IveCaughtTwoRabbits_info;
	description = "Мне удалось поймать двух кроликов.";
};
func int DIA_Barok_IveCaughtTwoRabbits_condition(){	
	if((MIS_DS2P_DangerousHunting == LOG_Running) && C_Npc_DS_HasItems(other,ITMI_DS2P_SnaresForHunting_Full,2))	{return TRUE;	};
};
func void DIA_Barok_IveCaughtTwoRabbits_info()
{
	var int x; x = 0;
	AI_Output(other,self,"DIA_Barok_IveCaughtTwoRabbits_15_00");	//Мне удалось поймать двух кроликов.
	B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_SnaresForHunting_Full,2,34);
	AI_Output(self,other,"DIA_Barok_IveCaughtTwoRabbits_01_01");	//(внимательно смотрит) Хех! Так ты же притащил двух самцов!
	AI_PlayAni(self,"T_LAUGH_01");
	AI_Output(self,other,"DIA_Barok_IveCaughtTwoRabbits_01_02");	//(громко смеется) И как, по-твоему, они будут размножаться?
	AI_Output(other,self,"DIA_Barok_IveCaughtTwoRabbits_15_03");	//(недовольно) Я не специалист по кроликам.
	AI_Output(self,other,"DIA_Barok_IveCaughtTwoRabbits_01_04");	//Ладно, ладно! Ты выполнил часть своей сделки. Вот обещанная награда.
	B_GiveInvItem_red(self,other,ITMI_Gold,300,37);
	B_GiveInvItem_red(self,other,ItAm_DS2P_WispDetector,1,40);
	B_DSG_Log_OpenClose(TOPIC_DS2P_DangerousHunting,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_DangerousHunting_Success);
	x = 1;
	if(x==1)
	{
		Wld_InsertNpc(Rabbit,"");
		Wld_InsertNpc(Rabbit,"");
	};
};
//
//-----Диалог появляется после: выполнения квеста "Опасная охота"
//
instance DIA_Barok_HowAUGoingToBreedRabbits(C_Info)		//И как ты теперь будешь разводить кроликов?  nr=40;
{
	npc = BAU_104_DS2P_Barok;
	nr = 40;
	permanent = FALSE;
	condition = DIA_Barok_HowAUGoingToBreedRabbits_condition;	
	information = DIA_Barok_HowAUGoingToBreedRabbits_info;
	description = "И как ты теперь будешь разводить кроликов?";
};
func int DIA_Barok_HowAUGoingToBreedRabbits_condition(){	if(MIS_DS2P_DangerousHunting == LOG_SUCCESS)	{return TRUE;	};};
func void DIA_Barok_HowAUGoingToBreedRabbits_info()
{
	AI_Output(other,self,"DIA_Barok_HowAUGoingToBreedRabbits_15_00");	//И как ты теперь будешь разводить кроликов?
	AI_Output(self,other,"DIA_Barok_HowAUGoingToBreedRabbits_01_00");	//Попрошу Тарока. Он заходил недавно, долго смеялся над моей идеей, но все же вызывался помочь.
	AI_Output(self,other,"DIA_Barok_HowAUGoingToBreedRabbits_01_01");	//Думаю, скоро он принесет мне еще с десяток животин, и тогда моя кроликовая ферма будет известна на всю Миртану.
	AI_PlayAni(self,"T_LAUGH_01");		//(громко смеется)
};
//
//-----Диалог появляется после: выполнения квеста "Опасная охота"
//
instance DIA_Barok_YouHaveDeceivedMe(C_Info)		//Ты обманул меня.  nr=41;
{
	npc = BAU_104_DS2P_Barok;
	nr = 41;
	permanent = FALSE;
	condition = DIA_Barok_YouHaveDeceivedMe_condition;	
	information = DIA_Barok_YouHaveDeceivedMe_info;
	description = "Ты обманул меня.";
};
func int DIA_Barok_YouHaveDeceivedMe_condition(){	if(MIS_DS2P_DangerousHunting == LOG_SUCCESS)	{return TRUE;	};};
func void DIA_Barok_YouHaveDeceivedMe_info()
{
	AI_Output(other,self,"DIA_Barok_YouHaveDeceivedMe_15_00");	//Ты обманул меня.
	AI_Output(self,other,"DIA_Barok_YouHaveDeceivedMe_01_00");	//О чем ты говоришь?
	AI_Output(other,self,"DIA_Barok_YouHaveDeceivedMe_15_01");	//Какой прок в твоем артефакте? Просто красивая безделушка, не более.
	AI_Output(self,other,"DIA_Barok_YouHaveDeceivedMe_01_01");	//Мой дед говорил, что сила, заключенная в нем, требует высвобождения. А он знал в этом толк, уж поверь!
	AI_Output(self,other,"DIA_Barok_YouHaveDeceivedMe_01_02");	//Мой дед был алхимиком, да таким, что Цимм ему даже в подметки  не годится!
	AI_Output(self,other,"DIA_Barok_YouHaveDeceivedMe_01_03");	//Так вот, чтобы сила, заключенная в артефакте, проснулась, необходимо произнести определенное заклинание. Думаю, это сможет сделать опытный маг.
};
//-----------------------------
//-----------------------------
instance DIA_Barok_DoUHaveSomeMeat(C_Info)		//(дразнить) У тебя не найдется немного мяска?  nr=5;
{
	npc = BAU_104_DS2P_Barok;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Barok_DoUHaveSomeMeat_condition;	
	information = DIA_Barok_DoUHaveSomeMeat_info;
	description = "(дразнить) У тебя не найдется немного мяска?";
};
func int DIA_Barok_DoUHaveSomeMeat_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_DidUSee))	{return TRUE;	};};
func void DIA_Barok_DoUHaveSomeMeat_info()
{
	AI_Output(other,self,"DIA_Barok_DoUHaveSomeMeat_15_00");	//(дразнить) У тебя не найдется немного мяска?
	AI_Output(self,other,"DIA_Barok_DoUHaveSomeMeat_01_00");	//Ты что, решил поиздеваться надо мной?! Пиратам я это спускал, но ты не один из них.
	AI_DrawWeapon(self);
	AI_Output(self,other,"DIA_Barok_DoUHaveSomeMeat_01_01");	//Защищайся!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
//-----------------------------
//-----------------------------
instance DIA_Barok_GiveMeMilk(C_Info)		//Угости меня молоком.  nr=6;
{
	npc = BAU_104_DS2P_Barok;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Barok_GiveMeMilk_condition;	
	information = DIA_Barok_GiveMeMilk_info;
	description = "Угости меня молоком.";
};
func int DIA_Barok_GiveMeMilk_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_DidUSee))	{return TRUE;	};};
func void DIA_Barok_GiveMeMilk_info()
{
	AI_Output(other,self,"DIA_Barok_GiveMeMilk_15_00");	//Угости меня молоком.
	AI_Output(self,other,"DIA_Barok_GiveMeMilk_01_00");	//Извини, но молока сегодня нет, я все отдал нашей поварихе Марии. Сходи к ней, возможно, она тебе что-нибудь продаст.
};
//-----------------------------
//-----------------------------
instance DIA_Barok_WhatRumorsInVillage(C_Info)		//Что слышно в деревне? (постоянный)  nr=7;
{
	npc = BAU_104_DS2P_Barok;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Barok_WhatRumorsInVillage_condition;	
	information = DIA_Barok_WhatRumorsInVillage_info;
	description = "Что слышно в деревне?";
};
func int DIA_Barok_WhatRumorsInVillage_condition(){	if(Npc_KnowsInfo(other,DIA_Barok_DidUSee))	{return TRUE;	};};
func void DIA_Barok_WhatRumorsInVillage_info()
{
	AI_Output(other,self,"DIA_Barok_WhatRumorsInVillage_15_00");	//Что слышно в деревне?
	AI_Output(self,other,"DIA_Barok_WhatRumorsInVillage_01_00");	//Слышал, что у тебя есть корабль. Может, возьмешь меня с собой, а?! Поеду в столицу хвосты крутить придворным дамам. 
	AI_PlayAni(self,"T_LAUGH_01");
};

//NS - 27/06/2013 ===========
// По квесту "Кто украл мое железо?" 	nr=101
//===========================

instance DIA_Barok_AboutStolenIron(C_Info)
{
	npc = BAU_104_DS2P_Barok;
	nr = 101;
	condition = DIA_Barok_AboutStolenIron_condition;	
	information = DIA_Barok_AboutStolenIron_info;
	description = "Кто-то ограбил кузницу.";
};
func int DIA_Barok_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Barok_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Barok_AboutStolenIron_15_00");	//Кто-то ограбил кузницу.
		AI_Output(self,other,"DIA_Barok_AboutStolenIron_01_01");	//Я даже знаю кто это – треклятые пираты. Они только и делают, что воруют, грабят и убивают!
	B_DSG_Bauers_AboutStolenIron_Counter();
};


//NS - 02/07/2013 ================================================
// После смерти Кадара
//================================================================
instance DIA_Barok_KadarDead(C_Info)
{
	npc = BAU_104_DS2P_Barok;
	nr = 0;
	condition = DIA_Barok_KadarDead_condition;	
	information = DIA_Barok_KadarDead_info;
	important = TRUE;
};
func int DIA_Barok_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Barok_KadarDead_info()
{
		AI_Output(self,other,"DIA_Barok_KadarDead_01_00");	//Чертовы пираты! Уже за невинных взялись...
};



