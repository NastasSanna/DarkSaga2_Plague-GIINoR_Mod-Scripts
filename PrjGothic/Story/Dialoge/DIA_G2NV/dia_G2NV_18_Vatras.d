//*--------------------------------------------------------------------
//*---------   ВАТРАС НА КОРАБЛЕ на стартовой локе		-------------------
//*--------------------------------------------------------------------
prototype DIA_Vatras_EXIT(C_Info)	//КОНЕЦ
{
	npc = none_18_Vatras;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Vatras_EXIT_condition;	
	information = DIA_Vatras_EXIT_info;
	description = Dialog_Ende;
};
instance DIA_Vatras_EXIT_pre(DIA_Vatras_EXIT){npc = pre_none_18_Vatras;};
instance DIA_Vatras_EXIT_main(DIA_Vatras_EXIT){};
func int DIA_Vatras_EXIT_condition(){	return TRUE;};
func void DIA_Vatras_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_VATRAS_REINIT(C_Info)
{
	npc = pre_none_18_Vatras;
	nr = 1;
	permanent = TRUE;
	condition = DIA_VATRAS_REINIT_condition;	
	information = DIA_VATRAS_REINIT_info;
	description = "test_dialog";
};
func int DIA_VATRAS_REINIT_condition(){	return FALSE;};
func void DIA_VATRAS_REINIT_info(){	Print("1111111111111");};

instance DIA_Vatras_PreStart(C_Info)	//Начальный диалог на корабле
{
	npc = pre_none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_PreStart_condition;	
	information = DIA_Vatras_PreStart_info;
	important = TRUE;
};
func int DIA_Vatras_PreStart_condition(){	return TRUE;};
func void DIA_Vatras_PreStart_info()
{	
	AI_Output(self,other,"DIA_Vatras_PreStart_05_00");	//У нас проблемы!
	AI_Output(self,other,"DIA_Vatras_PreStart_05_01");	//Я заходил к Горну, он тоже не может встать с кровати. Похоже, чума перекинулась и на него.
	AI_Output(self,other,"DIA_Vatras_PreStart_05_02");	//Сначала Аластер, затем Мильтен, Лестер, теперь Горн. Кто следующий?
	AI_Output(other,self,"DIA_Vatras_PreStart_15_00");	//Да... Нас осталось всего четверо. Если так будет продолжаться, то скоро ”Эсмеральда” превратится в корабль-призрак.
	AI_Output(other,self,"DIA_Vatras_PreStart_15_01");	//Ты можешь что-нибудь предпринять?
	AI_Output(self,other,"DIA_Vatras_PreStart_05_03");	//Боюсь, что это выше моих возможностей.
	AI_Output(self,other,"DIA_Vatras_PreStart_05_04");	//Я испробовал уже все, чтобы хоть как-то изменить ситуацию и привести в чувство людей. Но, увы...
	AI_Output(other,self,"DIA_Vatras_PreStart_15_02");	//Тогда остается только один вариант – искать сушу и надеяться, что там найдётся целитель, обладающий нужными знаниями.
	AI_Output(self,other,"DIA_Vatras_PreStart_05_05");	//Ты прав, нужно сказать об этом Джеку.
	AI_Output(other,self,"DIA_Vatras_PreStart_15_03");	//Я займусь этим, а ты пока побудь с Аластером.
	AI_Output(self,other,"DIA_Vatras_PreStart_05_06");	//Да, конечно. Я попробую еще одно заклинание, быть может, оно сработает.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_Start);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_Talk2Jack);
	B_Kapitelwechsel(1,DSG_PREPROLOG_ZEN);
	AI_StopProcessInfos(self);
};

instance DIA_Vatras_AfterStart_Const(C_Info)	//Постоянный диалог с Ватрасом на корабле
{
	npc = pre_none_18_Vatras;
	nr = 998;
	permanent = TRUE;
	condition = DIA_Vatras_AfterStart_Const_condition;
	information = DIA_Vatras_AfterStart_Const_info;
	description = "Есть улучшения?";
};
func int DIA_Vatras_AfterStart_Const_condition(){		if(Npc_KnowsInfo(other,DIA_Vatras_PreStart))	{	return TRUE;}	;};
func void DIA_Vatras_AfterStart_Const_info()
{	
	AI_Output(other,self,"DIA_Vatras_AfterStart_Const_15_00");	//Что-нибудь получилось? Есть улучшения?
	AI_Output(self,other,"DIA_Vatras_AfterStart_Const_05_00");	//Пока нет, но я буду продолжать!	
};
instance DIA_Vatras_BlaBlaBla(C_Info)	//Времянка
{
	npc = pre_none_18_Vatras;
	nr = 998;
	permanent = TRUE;
	condition = DIA_Vatras_BlaBlaBla_condition;
	information = DIA_Vatras_BlaBlaBla_info;
	description = "Заточка";
};
func int DIA_Vatras_BlaBlaBla_condition(){	return TRUE;};
func void DIA_Vatras_BlaBlaBla_info()
{	
	
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(ВЫЙТИ4)",dia_BlaBlaBla);
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(ВЫЙТИ3)",dia_BlaBlaBla);
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(ВЫЙТИ2)",dia_BlaBlaBla);
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(ВЫЙТИ1)",dia_BlaBlaBla);
	Info_Addchoice(DIA_Vatras_BlaBlaBla,"(ВЫЙТИ)",dia_BlaBlaBla);
	//oCInfo_AddChoice(DIA_Vatras_BlaBlaBla,"123",2);
	//Npc_OpenInventory(hero,0);
	
	//var zCViewDialogChoice dialogchoices;
	//dialogchoices = _^(MEM_zCViewDialogChoicePtr);
	//dialogchoices.activeTextColor = COL_Aqua;
	//MEM_zCViewDialogChoicePtr = MEM_ReadInt(MEMINT_oCInformationManager_Address + 20);
	
	
	MEM_zCViewDialogMessage.fontColor = COL_Aqua;
	//MEM_zCViewDialogMessage.fontColor
	MEM_SendToSpy(zERR_TYPE_FAULT,"____");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_InformationMan.DlgChoice));
	MEM_SendToSpy(zERR_TYPE_FAULT,"____");
	
//*****************************************************************************
	
	/*var oCInfo info;
	info = _^(MEM_InstToPtr(DIA_Vatras_BlaBlaBla) - oCInfo_C_INFO_Offset);
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_InstToPtr(info)));
	var oCInfoChoice choice;
	choice = _^(info.listChoices_next);
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(info.listChoices_next));
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(choice.Function));*/
	
	
	//Info_ClearChoices(DIA_Vatras_BlaBlaBla);
	/*var int x; 	//счётчик
	var oCInfo info;	//Сам диалог
	var int symbIDfunc;	//Символ-индекс вызываемой функции в чойсах
	var oCInfoChoice InfoChoice;	//Сами инфо-чойсы
	var int InfoChoice_ListPtr;		//Указатель на лист с инфо-чойсом
	var zCList InfoChoice_List;		//Сам лист с инфо-чойсом
	var string funcName_str;				//Имя функции, идущей на подмену.
	
	
	x=2;
	
	while(x);
		//Получаем лист - 1,2,3,4,5.
		Info_Addchoice(DIA_Vatras_BlaBlaBla,IntToString(x),dia_BlaBlaBla);
		x-=1;
	end;
	
	x=1;
	
	info = _^(MEM_InstToPtr(DIA_Vatras_BlaBlaBla) - oCInfo_C_INFO_Offset );
	InfoChoice_ListPtr = info.listChoices_next;
	InfoChoice_List = _^(info.listChoices_next);
	
	while(InfoChoice_ListPtr);
		
		funcName_str="dia_BlaBlaBla_";
		funcName_str = ConcatStrings(funcName_str,IntToString(x));
		symbIDfunc = MEM_FindParserSymbol(funcName_str);
		MEM_WARN(IntToString(InfoChoice_List.data));
		InfoChoice = _^(InfoChoice_List.data);
		InfoChoice.Function = symbIDfunc;
		
		if(InfoChoice_List.next)
		{
			InfoChoice_ListPtr = InfoChoice_List.next;
			InfoChoice_List = _^(InfoChoice_ListPtr);
		}
		else
		{
			InfoChoice_ListPtr = 0;
		};
		x+=1;
	end;*/
};
func void dia_BlaBlaBla()
{
	Npc_CloseInventory(hero);
	Info_ClearChoices(DIA_Vatras_BlaBlaBla);
	//Print("Вызвана dia_BlaBlaBla_   DEFAULT");
};
func void dia_BlaBlaBla_1(var int itemInstance)
{
	//Print("Вызвана dia_BlaBlaBla_   1");
};
func void dia_BlaBlaBla_2(var int itemInstance)
{
	//Print("Вызвана dia_BlaBlaBla_   2");
};
func void dia_BlaBlaBla_3(var int itemInstance)
{
	//Print("Вызвана dia_BlaBlaBla_   3");
};
func void dia_BlaBlaBla_4(var int itemInstance)
{
	//Print("Вызвана dia_BlaBlaBla_   4");
};
func void dia_BlaBlaBla_5(var int itemInstance)
{
	//Print("Вызвана dia_BlaBlaBla_   5");
};
func void dia_BlaBlaBla_6(var int itemInstance)
{
	//Print("Вызвана dia_BlaBlaBla_   6");
};
//*--------------------------------------------------------------------
//*---------   ВАТРАС НА основной локе		-------------------------------
//*--------------------------------------------------------------------
instance DIA_Vatras_GoToPirates(C_Info)	//Постоянный диалог до стартового с пиратом Грегом
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Vatras_GoToPirates_condition;	
	information = DIA_Vatras_GoToPirates_info;
	important = TRUE;
};
func int DIA_Vatras_GoToPirates_condition()
{	
	if(!Npc_KnowsInfo(other,DIA_Greg_Start) && Npc_IsInState(self,ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Vatras_GoToPirates_info()
{	
	AI_Output(self,other,"DIA_Vatras_GoToPirates_05_00");	//Похоже, Аданос отвернулся от нас.
	AI_Output(other,self,"DIA_Vatras_GoToPirates_15_00");	//И это говорит маг воды?
	AI_Output(self,other,"DIA_Vatras_GoToPirates_05_01");	//Слишком много неприятных совпадений...
	AI_Output(other,self,"DIA_Vatras_GoToPirates_15_01");	//Нам может понадобиться вся твоя магия.
	AI_Output(self,other,"DIA_Vatras_GoToPirates_05_02");	//Не волнуйся, я им покажу такую магию, что они никогда не забудут об этом, если выживут, конечно.
	AI_StopProcessInfos(self);
};
//
//Диалог, если Джек заболел
//
instance DIA_Vatras_JackFellIll(C_Info)	//(вздыхая) Джек...
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_JackFellIll_condition;	
	information = DIA_Vatras_JackFellIll_info;
	important = TRUE;
};
func int DIA_Vatras_JackFellIll_condition()
{	
	if(Npc_IsInRoutine(none_11_Jack,Rtn_SleepDeep_11))
	{	return TRUE;	};
};
func void DIA_Vatras_JackFellIll_info()
{	
	AI_Output(self,other,"DIA_Vatras_JackFellIll_05_00");	//(вздыхая) Джек...
	AI_Output(other,self,"DIA_Vatras_JackFellIll_15_00");	//Черт, нужно было убрать его с корабля, как же я сразу не сообразил.
	AI_Output(self,other,"DIA_Vatras_JackFellIll_05_01");	//Всего не предусмотришь, мой друг.
};
//
//Диалог, после встречи с пиратами.
//
instance DIA_Vatras_WhatEndedNegotiations(C_Info)	//Чем закончились переговоры? 	nr = 2;
{
	npc = none_18_Vatras;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Vatras_WhatEndedNegotiations_condition;	
	information = DIA_Vatras_WhatEndedNegotiations_info;
	important = TRUE;
};
func int DIA_Vatras_WhatEndedNegotiations_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Vatras_WhatEndedNegotiations_info()
{	
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_00");	//Чем закончились переговоры? Я смотрю, ты все же смог их убедить на время оставить нас в покое.
	AI_Output(other,self,"DIA_Vatras_WhatEndedNegotiations_15_00");	//Грег – хоть и редкостная скотина, но далеко не дурак. Ему, как и нам, ни к чему корабль, на котором вся команда на грани смерти.
	AI_Output(other,self,"DIA_Vatras_WhatEndedNegotiations_15_01");	//Он выждет, когда я решу проблему, а потом придет на все готовое.
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_01");	//(грустно смеется) Отличное решение.
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_02");	//И что будем делать? Похоже, у нас безвыходная ситуация.
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_03");	//Уплыть мы не можем, но и остаться тоже. И еще не факт, что нам удастся справиться с чумой.
	AI_Output(other,self,"DIA_Vatras_WhatEndedNegotiations_15_02");	//Я думаю, нужно решать задачи по порядку. Для начала я разведаю обстановку.
	AI_Output(other,self,"DIA_Vatras_WhatEndedNegotiations_15_03");	//Похоже, пираты расположились в небольшой деревне, расположенной неподалеку. Нужно попросить помощи у местных.
	AI_Output(self,other,"DIA_Vatras_WhatEndedNegotiations_05_04");	//Да, ты прав. Я останусь на корабле и буду следить за больными. Обращайся ко мне в любое время, если понадобиться помощь.
};
//----------------------------------------------------------------------------------------

instance DIA_Vatras_BlessMe(C_Info)	//Благослови меня! 	//nr = 50;
{
	npc = none_18_Vatras;
	nr = 50;
	permanent = TRUE;
	condition = DIA_Vatras_BlessMe_condition;	
	information = DIA_Vatras_BlessMe_info;
	description = "Благослови меня!";
};
func int DIA_Vatras_BlessMe_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{	return TRUE;	};
};
func void DIA_Vatras_BlessMe_info()
{	
	AI_Output(other,self,"DIA_Vatras_BlessMe_15_00");	//Благослови меня!
	AI_Output(self,other,"DIA_Vatras_BlessMe_05_00");	//Да прибудет с тобой благодать Аданоса, сын мой!
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_PlayFX(self,other,"SPELLFX_HEALSHRINE");
	/*Redleha: Здесь бы надо дать какой-то бонус. А то: "на 1 час увеличивается здоровье +30 и мана +10" некомильфо*/
};
//
instance DIA_Vatras_DoYouNeedAnything(C_Info)	//Тебе что-нибудь нужно?	nr = 4;
{
	npc = none_18_Vatras;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Vatras_DoYouNeedAnything_condition;	
	information = DIA_Vatras_DoYouNeedAnything_info;
	description = "Тебе что-нибудь нужно?";
};
func int DIA_Vatras_DoYouNeedAnything_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{	return TRUE;	};
};
func void DIA_Vatras_DoYouNeedAnything_info()
{	
	AI_Output(other,self,"DIA_Vatras_DoYouNeedAnything_15_00");	//Тебе что-нибудь нужно?
	AI_Output(self,other,"DIA_Vatras_DoYouNeedAnything_05_00");	//Мне не помешают лечебные зелья и зелья маны. Поддержка здоровья у зараженных вытягивает из меня все силы.
	AI_Output(self,other,"DIA_Vatras_DoYouNeedAnything_05_01");	//Если не чума убьет меня, то я просто свалюсь замертво от магического истощения.
	AI_Output(other,self,"DIA_Vatras_DoYouNeedAnything_15_01");	//Я принесу все, что найду.
	AI_Output(self,other,"DIA_Vatras_DoYouNeedAnything_05_02");	//Только не нужно приносить эссенции и экстракты, они вряд ли окажут должный эффект. Мне нужны только эликсиры.
	B_DSG_Log_OpenClose(TOPIC_DS2P_ElixirForVatras,LOG_NOTE,-1,"Ватрас попросил меня принести ему несколько эликсиров маны и жизни.");
};
instance DIA_Vatras_IBroughtPotion(C_Info)	//Я принес зелья. Посмотри.	nr = 4;
{
	npc = none_18_Vatras;
	nr = 4;
	permanent = FALSE;
	condition = DIA_Vatras_IBroughtPotion_condition;	
	information = DIA_Vatras_IBroughtPotion_info;
	description = "Я принес зелья. Посмотри.";
};
func int DIA_Vatras_IBroughtPotion_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_DoYouNeedAnything))
	{	return TRUE;	};
};
func void B_DIA_Vatras_IBroughtPotion_Choice()
{
	Info_ClearChoices(DIA_Vatras_IBroughtPotion);
	Info_AddChoice(DIA_Vatras_IBroughtPotion,Dialog_Back,DIA_Vatras_IBroughtPotion_BACK);
	if(Npc_HasItems(other,ItPo_Mana_03))
	{
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"Отдать 1 эликсир МАНЫ",DIA_Vatras_IBroughtPotion_Mana1);
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"Отдать все эликсиры МАНЫ",DIA_Vatras_IBroughtPotion_ManaAll);
	};
	if(Npc_HasItems(other,ItPo_Health_03))
	{
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"Отдать 1 эликсир ЖИЗНИ",DIA_Vatras_IBroughtPotion_HP1);
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"Отдать все эликсиры ЖИЗНИ",DIA_Vatras_IBroughtPotion_HPAll);
	};
	if(Npc_HasItems(other,ItPo_Mana_03) || Npc_HasItems(other,ItPo_Health_03))
	{
		Info_AddChoice(DIA_Vatras_IBroughtPotion,"Отдать все эликсиры",DIA_Vatras_IBroughtPotion_All);
	};
};
func void DIA_Vatras_IBroughtPotion_BACK()
{
	Info_ClearChoices(DIA_Vatras_IBroughtPotion);
};
func void b_GiveVatrasElixir(var int potionName, var int mount)
{
	B_DS_GiveRemoveItems_Red(other,self,potionName,mount,34);
	B_GiveInvItem_red(self,other,ItMi_Gold,100*mount,37);	/*Этого не было по тексту*/
	B_GivePlayerXP(300*mount);
};
func void DIA_Vatras_IBroughtPotion_Mana1()
{
	b_GiveVatrasElixir(ItPo_Mana_03,1);
	B_DIA_Vatras_IBroughtPotion_Choice();
};
func void DIA_Vatras_IBroughtPotion_ManaAll()
{
	b_GiveVatrasElixir(ItPo_Mana_03,Npc_HasItems(other,ItPo_Mana_03));
	B_DIA_Vatras_IBroughtPotion_Choice();
};
func void DIA_Vatras_IBroughtPotion_HP1()
{
	b_GiveVatrasElixir(ItPo_Health_03,1);
	B_DIA_Vatras_IBroughtPotion_Choice();
};
func void DIA_Vatras_IBroughtPotion_HPAll()
{
	b_GiveVatrasElixir(ItPo_Health_03,Npc_HasItems(other,ItPo_Health_03));
	B_DIA_Vatras_IBroughtPotion_Choice();
};
func void DIA_Vatras_IBroughtPotion_All()
{
	var int x; x = Npc_HasItems(other,ItPo_Health_03) + Npc_HasItems(other,ItPo_Mana_03);
	B_DS_GiveRemoveItems_Red(other,self,ItPo_Health_03,Npc_HasItems(other,ItPo_Health_03),34);
	B_DS_GiveRemoveItems_Red(other,self,ItPo_Mana_03,Npc_HasItems(other,ItPo_Mana_03),37);
	B_GiveInvItem_red(self,other,ItMi_Gold,100*x,40);	/*Этого не было по тексту*/
	B_GivePlayerXP(300*x);
	Info_ClearChoices(DIA_Vatras_IBroughtPotion);
};
func void DIA_Vatras_IBroughtPotion_info()
{	
	AI_Output(other,self,"DIA_Vatras_IBroughtPotion_15_00");	//Я принес зелья. Посмотри.
	if(!Npc_HasItems(other,ItPo_Health_03) &&  !Npc_HasItems(other,ItPo_Mana_03))
	{
		AI_Output(self,other,"DIA_Vatras_IBroughtPotion_05_00");	//Боюсь, что у тебя нет ничего подходящего.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_IBroughtPotion_05_01");	//О, это то, что нужно! Спасибо тебе!
		B_DIA_Vatras_IBroughtPotion_Choice();
	};
};
//
//ОБУЧЕНИЕ МАГИИ
//
	
instance DIA_Vatras_Teach(C_Info)
{
	npc = none_18_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};
func int DIA_Vatras_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{
		return TRUE;
	};
};
func void B_DIA_Vatras_Teach_choice()
{
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX,1)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX,5)),DIA_Vatras_Teach_5);
};
func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Я хочу повысить мои магические способности.
	AI_Output(self,other,"DIA_Vatras_Teach_05_01");	//Конечно, я к твоим услугам.
	B_DIA_Vatras_Teach_choice();
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Твоя магическая энергия стала слишком велика, чтобы я мог еще повысить ее.
	};
	Info_ClearChoices(DIA_Vatras_Teach);
};
func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX);
	B_DIA_Vatras_Teach_choice();
};
func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX);
	B_DIA_Vatras_Teach_choice();
};
//
//ПОВЫШЕНИЕ МАКС.ЖИЗНИ
//
instance DIA_Vatras_TeachHPMax(C_Info)
{
	npc = none_18_Vatras;
	nr = 101;
	condition = DIA_Vatras_TeachHPMax_Condition;
	information = DIA_Vatras_TeachHPMax_Info;
	permanent = TRUE;
	description = "Я бы хотел укрепить свое здоровье.";
};
func int DIA_Vatras_TeachHPMax_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{
		return TRUE;
	};
};
func void B_DIA_Vatras_TeachHPMax_choice()
{
	Info_ClearChoices(DIA_Vatras_TeachHPMax);
	Info_AddChoice(DIA_Vatras_TeachHPMax,Dialog_Back,DIA_Vatras_TeachHPMax_BACK);
	Info_AddChoice(DIA_Vatras_TeachHPMax,B_BuildLearnString(PRINT_LearnHITPOINTS10,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX,10)),DIA_Vatras_TeachHPMax_10);
	Info_AddChoice(DIA_Vatras_TeachHPMax,B_BuildLearnString(PRINT_LearnHITPOINTS20,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX,20)),DIA_Vatras_TeachHPMax_20);
	Info_AddChoice(DIA_Vatras_TeachHPMax,B_BuildLearnString(PRINT_LearnHITPOINTS50,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX,50)),DIA_Vatras_TeachHPMax_50);
};
func void DIA_Vatras_TeachHPMax_Info()
{
	AI_Output(other,self,"DIA_Vatras_TeachHPMax_15_00");	//Я бы хотел укрепить свое здоровье.
	AI_Output(self,other,"DIA_Vatras_TeachHPMax_05_01");	//Конечно. Я рад помочь тебе в этом.
	B_DIA_Vatras_TeachHPMax_choice();
};

func void DIA_Vatras_TeachHPMax_BACK()
{
	if(other.attribute[ATR_HITPOINTS_MAX] >= T_HP_MEGA)
	{
		AI_Output(self,other,"DIA_Vatras_TeachHPMax_05_00");	//Твоя жизненная энергия стала слишком велика, чтобы я мог еще повысить ее.
	};
	Info_ClearChoices(DIA_Vatras_TeachHPMax);
};
func void DIA_Vatras_TeachHPMax_10()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,10,T_HP_MEGA);
	B_DIA_Vatras_TeachHPMax_choice();
};
func void DIA_Vatras_TeachHPMax_20()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,20,T_HP_MEGA);
	B_DIA_Vatras_TeachHPMax_choice();
};
func void DIA_Vatras_TeachHPMax_50()
{
	B_TeachAttributePoints(self,other,ATR_HITPOINTS_MAX,50,T_HP_MEGA);
	B_DIA_Vatras_TeachHPMax_choice();
};

//
instance DIA_Vatras_IBeganToFeelFaint(C_Info)	//В последнее время я стал чувствовать слабость.	nr = 5;
{
	npc = none_18_Vatras;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Vatras_IBeganToFeelFaint_condition;	
	information = DIA_Vatras_IBeganToFeelFaint_info;
	description = "В последнее время я стал чувствовать слабость.";
};
func int DIA_Vatras_IBeganToFeelFaint_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations))
	{	return TRUE;	};
};
func void DIA_Vatras_IBeganToFeelFaint_info()
{	
	AI_Output(other,self,"DIA_Vatras_IBeganToFeelFaint_15_00");	//Я не хотел никому говорить, но в последнее время я стал чувствовать слабость. Мышцы словно одеревенели, и разум уже не так остр, как раньше.
	AI_Output(other,self,"DIA_Vatras_IBeganToFeelFaint_15_01");	//Я даже кое-что стал забывать. Мне кажется, что чума скоро доберется и до меня.
	AI_Output(self,other,"DIA_Vatras_IBeganToFeelFaint_05_00");	//Понимаю, о чем ты говоришь, и сам чувствую нечто подобное. Но я уверен, что Боги защищают нас.
	AI_Output(self,other,"DIA_Vatras_IBeganToFeelFaint_05_01");	//Наш единственный шанс – воспользоваться подаренной отсрочкой. Но, боюсь, времени осталось не так много.
	AI_Output(other,self,"DIA_Vatras_IBeganToFeelFaint_15_02");	//Как ты думаешь, сколько нам осталось?
	AI_Output(self,other,"DIA_Vatras_IBeganToFeelFaint_05_02");	//Не могу сказать, друг мой. Предполагаю, что срок пошел не на дни, а на часы.
};
//
//Появляется при наличии амулета от Барока
//
instance DIA_Vatras_IGotOneArtifact(C_Info)	//Мне удалось получить один артефакт.		//nr = 15
{
	npc = none_18_Vatras;
	nr = 15;
	permanent = FALSE;
	condition = DIA_Vatras_IGotOneArtifact_condition;	
	information = DIA_Vatras_IGotOneArtifact_info;
	description = "Мне удалось получить один артефакт.";
};
func int DIA_Vatras_IGotOneArtifact_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_WhatEndedNegotiations) && Npc_HasItems(other,ItAm_DS2P_WispDetector))
	{	return TRUE;	};
};
func void DIA_Vatras_IGotOneArtifact_info()
{	
	AI_Output(other,self,"DIA_Vatras_IGotOneArtifact_15_00");	//Мне удалось получить один артефакт. Но он не работает. Может быть, ты знаешь, как пробудить его силу?
	AI_Output(self,other,"DIA_Vatras_IGotOneArtifact_05_00");	//Дай-ка посмотреть.
	B_GiveInvItems(other,self,ItAm_DS2P_WispDetector,1);
	B_DSG_UseFakeAmulet();
	AI_Output(self,other,"DIA_Vatras_IGotOneArtifact_05_01");	//О, это невероятно! Это же еще один ”Ищущий огонек”. Я думал, это только слухи, что таких амулетов несколько, а точнее, три.
};
//
//Появляется после предыдущего: "Мне удалось получить один артефакт."
//
instance DIA_Vatras_CanUAactivateItsEffect(C_Info)	//Ты можешь пробудить его силу?		//nr = 150
{
	npc = none_18_Vatras;
	nr = 150;
	permanent = FALSE;
	condition = DIA_Vatras_CanUAactivateItsEffect_condition;	
	information = DIA_Vatras_CanUAactivateItsEffect_info;
	description = "Ты можешь пробудить его силу?";
};
func int DIA_Vatras_CanUAactivateItsEffect_condition(){	
	if(Npc_KnowsInfo(other,DIA_Vatras_IGotOneArtifact))	{	return TRUE;	};
};
func void DIA_Vatras_CanUAactivateItsEffect_info()
{	
	AI_Output(other,self,"DIA_Vatras_CanUAactivateItsEffect_15_00");	//Ты можешь пробудить его силу?
	AI_Output(self,other,"DIA_Vatras_CanUAactivateItsEffect_05_00");	//Да, конечно! Это достаточно простое заклинание. Отойди-ка в сторонку.
	AI_DropItem(self,ItAm_DS2P_WispDetector);
	AI_PlayFX(self,ItAm_DS2P_WispDetector,"SPELLFX_INCOVATION_BLUE");
	AI_Output(self,other,"DIA_Vatras_CanUAactivateItsEffect_05_01");	//Дориус, аторас, барадус! Домину партоус, аран! Дару саран гурок!
	AI_PlayFX(self,ItAm_DS2P_WispDetector,"SPELLFX_INCOVATION_RED");
	AI_Output(self,other,"DIA_Vatras_CanUAactivateItsEffect_05_02");	//Все, кажется готово. Теперь огонек полностью готов к использованию.
	AI_TakeItem(self,ItAm_DS2P_WispDetector);
	CreateInvItems(other,ItAm_DS2P_WispDetector,1);
	AI_Output(other,self,"DIA_Vatras_CanUAactivateItsEffect_15_01");	//И что он может?
	AI_Output(self,other,"DIA_Vatras_CanUAactivateItsEffect_05_03");	//О, очень много! Он может помочь тебе найти скрытые вещи, показать тайники и многое другое. Ты сам все поймешь, когда наденешь его.
};
//
//Появляется после предыдущего: "Ты можешь пробудить его силу?"
//
instance DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay(C_Info)	//Как ты узнал какое заклинание нужно произнести?		//nr = 151
{
	npc = none_18_Vatras;
	nr = 151;
	permanent = FALSE;
	condition = DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_condition;
	information = DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_info;
	description = "Как ты узнал, какое заклинание нужно произнести?";
};
func int DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_condition(){	
	if(Npc_KnowsInfo(other,DIA_Vatras_CanUAactivateItsEffect))	{	return TRUE;	};
};
func void DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_info()
{	
	AI_Output(other,self,"DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_15_00");	//Как ты узнал, какое заклинание нужно произнести? Ты же считал, что это всего лишь легенда, выдумка.
	AI_Output(self,other,"DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_05_00");	//(смеется) Все очень просто! Заклинание написано на ободе амулета. Просто язык очень древний, и видеть его могут только высшие маги.
	AI_Output(self,other,"DIA_Vatras_HowDoUKnowWhatSpellUNeedToSay_05_01");	//Я просто прочитал его и вложил немного своей силы. Все очень просто.
};
//
//Появляется после предыдущего: "Мне удалось получить один артефакт."
//
instance DIA_Vatras_WhatHappensIfUFind3Amul(C_Info)	//И что будет, если найти три Ищущих огонька?		//nr = 152
{
	npc = none_18_Vatras;
	nr = 152;
	permanent = FALSE;
	condition = DIA_Vatras_WhatHappensIfUFind3Amul_condition;	
	information = DIA_Vatras_WhatHappensIfUFind3Amul_info;
	description = "И что будет, если найти три Ищущих огонька?";
};
func int DIA_Vatras_WhatHappensIfUFind3Amul_condition(){	
	if(Npc_KnowsInfo(other,DIA_Vatras_IGotOneArtifact))	{	return TRUE;	};
};
func void DIA_Vatras_WhatHappensIfUFind3Amul_info()
{	
	AI_Output(other,self,"DIA_Vatras_WhatHappensIfUFind3Amul_15_00");	//И что будет, если найти три Ищущих огонька?
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_00");	//Если верить той же легенде, то из них можно выковать ”Амулет Арона”, создателя ”Ищущих огоньков”, великого волшебника-кузнеца древности.
	AI_Output(other,self,"DIA_Vatras_WhatHappensIfUFind3Amul_15_01");	//И что это даст?
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_01");	//Я не знаю, что именно, тут информация противоречивая.
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_02");	//Одни говорят, что ты сможешь призывать демонов преисподней, другие – что найдешь великие древние сокровища. Третьи же утверждали, что ты обретешь великую защиту, что ни одно заклятие тебя не сможет одолеть.
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_03");	//Я не склонен верить ни одной из этих версий. Но знаю точно – силу, которую даст этот артефакт, можно сравнить с подарком богов.
	AI_Output(other,self,"DIA_Vatras_WhatHappensIfUFind3Amul_15_02");	//Жаль, что тот ”огонек” остался вместе с другими сокровищами на Южных островах.
	AI_Output(self,other,"DIA_Vatras_WhatHappensIfUFind3Amul_05_04");	//Пути богов неисповедимы, друг мой!
};


//NS - 30/07/2013 ===================================
//  АРТЕФАКТЫ ХАОСА
//===================================================
func void DIA_Vatras_ChaosArtefacts_info(var int ArtefactIsAmulet)
{	
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_00");	//Интересно, интересно...
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_01");	//Что-то не так?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_02");	//Я всегда поражался, как тебе удается попадать во всякие неприятности.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_03");	//О чем ты?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_04");	//Несколько раз я посещал тайную библиотеку магов огня в Хоринисе, в которой хранятся различные древние свитки.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_05");	//Кто их автор и сколько им тысяч лет не знает даже верховный маг Пирокар.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_06");	//Так вот, в одном из свитков было написано про этот амулет.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_07");	//Согласно тексту, это один из редчайших артефактов, созданный древними мастерами из небесного камня.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_08");	//Небесного камня?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_09");	//Да, если сказать по-другому, камня, прилетевшего с неба.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_10");	//Кто-то считает, что это слезы Инноса, кто-то называет оружием Белиара. А третьи, самые немногочисленные из магов, уверяют, что это кусочек других миров.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_11");	//Но это не так важно. Важно то, что этот камень обладает очень необычной магией, которая не является в чистом виде силой одного из богов. Даже не так - ни одного из известных нам богов.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_12");	//Автор свитка утверждал, что после многолетних экспериментов над камнем им удалось понять только одно – структура магической силы непостоянна, хаотична.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_13");	//Как такое может быть?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_14");	//Теоретически это возможно. Если весь окружающий мир упорядочен и имеет четкую структуру, то должно быть что-то, что является противовесом, как день и ночь, зима и лето…
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_15");	//Ты хочешь сказать, что это частичка Хаоса?

	if (ArtefactIsAmulet)	{
	//Если амулет
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_16");	//Да, именно об этом я и говорю. Поэтому мне более чем удивительно, что такая редкая вещь могла быть у обычного мага огня, пусть даже не самого низкого ранга.
	}
	else	{
	//Если кольцо
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_17");	//Да, именно об этом я и говорю. Поэтому мне более чем удивительно, что такая редкая вещь могла оказаться на этом острове.
	};
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_18");	//Ладно, и как я могу использовать этот камень?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_19");	//(негодующе) Использовать? Мы даже не знаем что это; а значит, и не знаем, какие могут быть последствия его применения.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_20");	//Да ладно тебе. Кругом война, кругом орки, пираты, мир катится в бездну. Я считаю, что в данной ситуации нужно использовать все доступные средства, чтобы хоть как-то защитить себя.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_21");	//(задумчиво) С одной стороны ты прав, но... Хотя, ладно.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_22");	//Насколько я помню, в свитке было написано, что этот камень может дать некоторую силу или забрать ее у того, кто носит артефакт.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_23");	//Какую силу?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_24");	//Каждый раз - разную.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_25");	//Я не понимаю.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_26");	//Все предельно просто. Как я уже говорил тебе, это магия Хаоса, поэтому там нет чего-то постоянного.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_27");	//Каждый раз камень может дать тебе что-то полезное. Например, увеличить твою магическую силу, а может наоборот – забрать часть твоих знаний или здоровья.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_28");	//Но самое главное – артефакт можно перезаряжать. Для этого нужна кровь. 
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_29");	//Я должен отдать этому камню свою кровь?
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_30");	//Нет, зачем же?! Подойдет кровь любого животного. Думаю, любой охотник научит тебя ее добывать. Имея кровь, мензурку и камень, ты можешь зачаровать его на магию.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_31");	//Если результат зачаровывания будет отрицательным, можешь попробовать еще раз.
	AI_Output(other,self,"DIA_Vatras_ChaosArtefacts_15_32");	//Отлично. Я попробую.
		AI_Output(self,other,"DIA_Vatras_ChaosArtefacts_05_33");	//Очень тебя прошу – будь острожен! Мы не знаем всех последствий применения этой магии.
	//Запись в дневнике в разделе доп. инфо "Артефакты Хаоса" 
	B_DSG_Log_OpenClose(TOPIC_ChaosArtefacts,LOG_NOTE,-1,"Чтобы активировать артефакт необходимо на алхимическом столе использовать мензурку и кровь любого животного. Результат зачаровывания может быть каким угодно – как положительным, так и отрицательным. Но в любой момент можно попробовать еще раз.");
	PLAYER_TALENT_ALCHEMY[CHARGE_DSG_ChaosArtefacts] = TRUE;
	if (ArtefactIsAmulet)	{
		//Запись в дневнике в разделе доп. инфо "Артефакты Хаоса" 
		B_DSG_Log_OpenClose(TOPIC_ChaosArtefacts,LOG_NOTE,-1,"Мне удалось найти амулет Хаоса.");
	}
	else	{
		//Запись в дневнике в разделе доп. инфо "Артефакты Хаоса" 
		B_DSG_Log_OpenClose(TOPIC_ChaosArtefacts,LOG_NOTE,-1,"Мне удалось найти кольцо Хаоса.");
	};
};
//----------------------------
// "Посмотри этот амулет." если он есть и еще не знаем про артефакты		nr = 161
instance DIA_Vatras_ChaosAmulette(C_Info)
{
	npc = none_18_Vatras;
	nr = 161;
	permanent = FALSE;
	condition = DIA_Vatras_ChaosAmulette_condition;	
	information = DIA_Vatras_ChaosAmulette_info;
	description = "Посмотри этот амулет.";
};
func int DIA_Vatras_ChaosAmulette_condition()
{	
	if(Npc_HasItems(other,ItAm_DSG_Chaos_Discharged)
		&& !Npc_KnowsInfo(other,DIA_Vatras_ChaosRing))
	{	return TRUE;	};
};
func void DIA_Vatras_ChaosAmulette_info()
{	
	AI_Output(other,self,"DIA_Vatras_ChaosAmulette_15_00");	//Посмотри этот амулет.
		AI_Output(self,other,"DIA_Vatras_ChaosAmulette_05_01");	//(пристально смотрит) Откуда у тебя это?
	AI_Output(other,self,"DIA_Vatras_ChaosAmulette_15_02");	//Мне дал его один из пиратов. Говорит, что нашел его в карманах мага огня.
	DIA_Vatras_ChaosArtefacts_info(TRUE);
};
//----------------------------
// "Посмотри это кольцо." если он есть и еще не знаем про артефакты		nr = 162
instance DIA_Vatras_ChaosRing(C_Info)
{
	npc = none_18_Vatras;
	nr = 162;
	permanent = FALSE;
	condition = DIA_Vatras_ChaosRing_condition;	
	information = DIA_Vatras_ChaosRing_info;
	description = "Посмотри это кольцо.";
};
func int DIA_Vatras_ChaosRing_condition()
{	
	if((Npc_HasItems(other,ItRi_DSG_Chaos1_Discharged)
			|| Npc_HasItems(other,ItRi_DSG_Chaos2_Discharged))
		&& !Npc_KnowsInfo(other,DIA_Vatras_ChaosAmulette))
	{	return TRUE;	};
};
func void DIA_Vatras_ChaosRing_info()
{	
	AI_Output(other,self,"DIA_Vatras_ChaosRing_15_00");	//Посмотри это кольцо.
		AI_Output(self,other,"DIA_Vatras_ChaosRing_05_01");	//(пристально смотрит) Откуда у тебя это?
	AI_Output(other,self,"DIA_Vatras_ChaosRing_15_02");	//Я нашел его на острове.
	DIA_Vatras_ChaosArtefacts_info(FALSE);
};


//------------------------------------------------------------------
//REDLEHA: 09/03/2016
//	Поссорились с пиратами.
//	"При разговоре с Ватрасом (если еще всех пиратов не перебили)."

instance DIA_Vatras_WhatHappened(C_Info)
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_WhatHappened_condition;	
	information = DIA_Vatras_WhatHappened_info;
	important = TRUE;
};
func int DIA_Vatras_WhatHappened_condition()
{	
	if(War_Has_Come)
	{	return TRUE;	};
};
func void DIA_Vatras_WhatHappened_info()
{	
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_00");	//Сын мой, что случилось? Пираты ни с того, ни с сего попытались напасть на меня.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_00");	//Ты в порядке?
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_01");	//Да, нормально.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_02");	//Они ворвались на корабль, забрались в кубрик к нашим больным, чтобы убить их. Я в тот момент отошел к алхимическому столу, чтобы сварить пару зелий для них. 
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_03");	//Пришел я в самый последний момент. Задержись я еще на пару минут, и результат был бы печальным.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_04");	//Я смог отбиться и отогнать пиратов обратно на берег.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_01");	//Ты справился с пиратами в одиночку?
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_05");	//Конечно, молодой человек. Сила и численность отнюдь не являются решающими факторами, хотя в моем возрасте подобные нагрузки явно излишни.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_06");	//Заморозив пару пиратов, я заставил остальных отступить.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_02");	//И где эти двое?
	if(MIS_DS2P_DamnSailor == LOG_Running)
	{
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_07");	//Один скончался сразу, заключенный в ледяную ловушку.
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_08");	//Второй же и человеком-то не являлся.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_03");	//Хм, ты про пирата-скелета?
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_09");	//Да, с ним мне пришлось изрядно повозиться, чтобы одолеть его.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_04");	//Ты хочешь сказать, что убил его? Проклятого бессмертного?
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_10");	//Да, хоть и не скажу, что это было легко. На него почти не действовали мои заклинания, а некоторые руны вообще перестали действовать.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_05");	//Как это?
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_11");	//Я не знаю, сын мой. И это меня очень сильно беспокоит. Хочется верить, что дефект в самих рунах, но сердце подсказывается, что это не так.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_06");	//Это очень плохая новость, но как ты справился со скелетом?
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_12");	//Я несколько раз ударил по нему ”Уничтожением нежити”. Это помогло, хоть и не сразу.
			AI_Output(other,self,"DIA_Vatras_WhatHappened_15_07");	//Что ж, спасибо тебе старче, что избавил меня от этой проблемы, а то я никак не мог решить, что делать с бессмертным.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_WhatHappened_05_13");	//Cкончались практически сразу, заключенные в ледяную ловушку.
	};
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_08");	//Мне остается только как можно скорее избавиться от пиратов.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_09");	//Плевое дело. Я такой шорох наведу, какой даже орки в Миннентале не терпели от меня.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_10");	//А бедокурил я там знатно, когда пробирался в осажденный замок.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_14");	//Будь осторожен, сын мой.
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_11");	//Ты сам-то как, продержишься?
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_15");	//Продержусь, пираты не рискуют пока связываться с магом, но ты должен как можно скорее что-нибудь придумать.
	AI_Output(self,other,"DIA_Vatras_WhatHappened_05_16");	//Они еще не знают, что силы мои на исходе, но стоит им только предпринять вторую атаку...
		AI_Output(other,self,"DIA_Vatras_WhatHappened_15_12");	//Не волнуйся, Ватрас. Им сейчас совершенно не до тебя будет.
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Vatras);
};
//
//Если все пираты мертвы
//
instance DIA_Vatras_PiratesAreDead(C_Info)	//Пираты больше не станут помехой. nr = 10;
{
	npc = none_18_Vatras;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Vatras_PiratesAreDead_condition;	
	information = DIA_Vatras_PiratesAreDead_info;
	description = "Пираты больше не станут помехой.";
};
func int DIA_Vatras_PiratesAreDead_condition()
{	
	if(All_Pirat_Killed)
	{	return TRUE;	};
};
func void DIA_Vatras_PiratesAreDead_info()
{
	AI_Output(other,self,"DIA_Vatras_PiratesAreDead_15_00");	//Пираты больше не станут помехой, старче.
	AI_Output(self,other,"DIA_Vatras_PiratesAreDead_05_00");	//Упокой Аданос их грешные души. Да будет Он справедлив к ним на Суде.
};
//
//После разговора с Драконом. Разговор о мече.
//
var int Vatras_Dia_Dragon_day;
instance DIA_Vatras_IFoundWayToDealWithPlague(C_Info)	//Я, кажется, нашел способ разобраться с чумой. nr = 11;
{
	npc = none_18_Vatras;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Vatras_IFoundWayToDealWithPlague_condition;	
	information = DIA_Vatras_IFoundWayToDealWithPlague_info;
	description = "Я, кажется, нашел способ разобраться с чумой.";
};
func int DIA_Vatras_IFoundWayToDealWithPlague_condition()
{	
	if(Npc_KnowsInfo(other,DIA_DragonTalan_FirstDialog))
	{	return TRUE;	};
};
func void DIA_Vatras_IFoundWayToDealWithPlague_info()
{
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_00");	//Я, кажется, нашел способ разобраться с чумой, но мне потребуются кое-какие вещи и знания.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_00");	//Готов предложить любую помощь, что это за способ?
	
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_01");	//Местный отшельник, Экор, взялся мне помочь, но одним из компонентов лекарства является кровь дракона, а чтобы ее добыть, мне понадобился особый меч, заряженный магией руды.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_01");	//Меч... Постой, ты хочешь сказать?
	
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_02");	//Да, на этом острове есть дракон, но он мирный, ни на кого не нападает.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_02");	//Странно, впервые слышу о подобном. Мирный дракон, кто бы мог подумать.
	
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_03");	//Это не так важно, Ватрас, можешь помочь с мечом?
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_03");	//Конечно, нет. Чтобы создать подобный артефакт, нужно быть кузнецом исключительного мастерства и при этом обладающим немалыми знаниями о магии и о рунном письме.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_04");	//И тем более, у нас нет ничего необходимого, чтобы создать такой предмет. Неужели ты думаешь, что в кустарных условиях возможно создать меч подобный Уризелю?
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_05");	//Тогда бы подобного оружия было множество.
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_04");	//Ты слышал о нем? Я не ожидал этого. Да, хороший был меч, но его у меня больше нет.
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_05");	//Но хоть что-то мы можем сделать? Может зарядить меч магией временно?
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_06");	//Мне же надо не убивать дракона, а нанести ему всего одну рану.
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_06");	//Ты владел Уризелем? Хотя, у нас нет времени для подобных обсуждений... (пауза)
		AI_Output(self,other,"DIA_Vatras_IFoundWayToDealWithPlague_05_07");	//Думаю, что твоя идея осуществима, но мне нужно подготовиться.
	AI_Output(other,self,"DIA_Vatras_IFoundWayToDealWithPlague_15_07");	//Я понял, зайду завтра.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_VatrasAfterDragonDia);
	Vatras_Dia_Dragon_day = Wld_GetDay();
};
//
//После разговора о мече на след.день.
//
var int c_DIA_Vatras_HowSInvestigation_once;
instance DIA_Vatras_HowSInvestigation(C_Info)	//Как продвигаются исследования? nr = 11;
{
	npc = none_18_Vatras;
	nr = 11;
	permanent = TRUE;
	condition = DIA_Vatras_HowSInvestigation_condition;	
	information = DIA_Vatras_HowSInvestigation_info;
	description = "Как продвигаются исследования?";
};
func int DIA_Vatras_HowSInvestigation_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Vatras_IFoundWayToDealWithPlague) && !c_DIA_Vatras_HowSInvestigation_once)
	{	return TRUE;	};
};
func void DIA_Vatras_HowSInvestigation_info()
{
	AI_Output(other,self,"DIA_Vatras_HowSInvestigation_15_00");	//Как продвигаются исследования?
	if(Wld_GetDay() <= Vatras_Dia_Dragon_day)
	{
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//Мне нужно еще время.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//Я кое-что нашел. 
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//Если покрыть клинок меча особым составом, то можно добиться такого же эффекта как и с Уризелем, но, боюсь, всего на один удар.
			AI_Output(other,self,"DIA_Vatras_HowSInvestigation_15_00");	//Уже неплохо, что это за состав?
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//(смущенно) У него нет названия, я его еще не придумал. Несколько дней я только и занимался тем, что ставил опыты и кое-чего смог добиться.
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//Но у меня слишком мало компонентов, чтобы изготовленного состава хватило на целый меч.	
			AI_Output(other,self,"DIA_Vatras_HowSInvestigation_15_00");	//Это уже мои проблемы, давай список необходимого. Кстати, а какой меч я должен тебе принести?
		AI_Output(self,other,"DIA_Vatras_HowSInvestigation_05_00");	//Об оружии не беспокойся - у нас корабле я сам найду необходимое и соответствующим образом подготовлю.
		
		B_GiveInvItems(self,other, ItWr_DS2P_VatrasSpisok_4MagicSword,1);
		c_DIA_Vatras_HowSInvestigation_once = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_VatrasPotion4Sword);
	};
};

//
//После разговора о растворе для меча после нахождения всех ингридиентов.
//
instance DIA_Vatras_DoIt(C_Info)	//Можешь приступать, я все принес. nr = 11;
{
	npc = none_18_Vatras;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Vatras_DoIt_condition;	
	information = DIA_Vatras_DoIt_info;
	description = "Можешь приступать, я все принес.";
};
func int DIA_Vatras_DoIt_condition()
{	
	//UNFINISH - пока ерунда
	if(c_DIA_Vatras_HowSInvestigation_once && C_Npc_DS_HasItems(other,ItMi_Nugget,3) && C_Npc_DS_HasItems(other,ItMi_MoleratLubric,1) 
	&& C_Npc_DS_HasItems(other,ItAt_WaranFiretongue,1) && C_Npc_DS_HasItems(other,ItAt_Armour_Kraur,2))
	{	return TRUE;	};
};
func void DIA_Vatras_DoIt_info()
{
	AI_Output(other,self,"DIA_Vatras_DoIt_15_00");	//Можешь приступать, я все принес.
	B_DS_GiveRemoveItems_Red(other,self,ItMi_Nugget,3,34);
	B_DS_GiveRemoveItems_Red(other,self,ItMi_MoleratLubric,1,37);
	B_DS_GiveRemoveItems_Red(other,self,ItAt_WaranFiretongue,1,40);
	B_DS_GiveRemoveItems_Red(other,self,ItAt_Armour_Kraur,2,43);
		AI_Output(self,other,"DIA_Vatras_DoIt_05_00");	//Отлично, надеюсь, мы все же справимся с этой болезнью.
	
	
	CreateInvItem(self,ItMi_Flask_Stand);
	CreateInvItem(self,ItMw_DS2P_Sword_4DRAGON);
	
	AI_UseItemToState(self,ItMi_Flask_Stand,1);
	AI_Wait(self,0.5);
	AI_UseItemToState(self,ItMi_Flask_Stand,-1);
	
	AI_Output(self,other,"DIA_Vatras_DoIt_05_01");	//Я нанесу на него специальный раствор...
	
	AI_EquipBestMeleeWeapon(self);
	//AI_ReadyMeleeWeapon_ds(self);	//УБРАНО 3.12.2013
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_LAB_STAND_2_S0");
	AI_PlayAni(self,"T_LAB_S0_2_S1");
	AI_PlayAni(self,"T_LAB_S1_2_S0");
	AI_PlayAni(self,"T_LAB_S0_2_STAND");
	//AI_RemoveWeapon_ds(self);	//УБРАНО 3.12.2013
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);	
	AI_Output(self,other,"DIA_Lafer_SwordAtMe_08_02");	//Вот теперь лучше!
	AI_Output(self,other,"DIA_Lafer_SwordAtMe_08_03");	//Приходи ко мне ночью. Пора покончить с этим демоном.
	CreateInvItems(other,ItMw_DS2P_Sword_4DRAGON,1);
	//AI_Function_I(self,Npc_RemoveInvItem,ItMw_DSG_Sword_4DRAGON);
	
	AI_PrintScreen("Получен отравленный клинок",-1,-1,Font_Screen,4);
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_VatrasPotion4Sword);
};

//"У одного пирата проблемы со сном." - активируется, если взят квест "Кошмары"
// nr = 2

instance DIA_Vatras_AboutNightmares(C_Info)
{
	npc = none_18_Vatras;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Vatras_AboutNightmares_condition;	
	information = DIA_Vatras_AboutNightmares_info;
	description = "У одного пирата проблемы со сном.";
};

func int DIA_Vatras_AboutNightmares_condition()
{	
	if (MIS_DS2P_Nightmares == Log_Running)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AboutNightmares_info()
{
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_00");	//У одного пирата проблемы со сном. Он просит твоей помощи.
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_01");	//А что он сам не придет?
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_02");	//(ухмыляясь) Боится лишний раз ступить на палубу «Эсмеральды»
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_03");	//Что у него за проблема?
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_04");	//(коротко рассказывает историю Лана) Довольно долгое время Лан провел в шкуре нежити и теперь, когда он вновь принял человеческий облик, его мучают страшные кошмары, которые не дают ему спать ни днем, ни ночью.
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_05");	//Сохрани Аданос его душу! Я всегда знал, что бессмысленная погоня за золотом не приведет до добра.
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_06");	//Ты можешь ему помочь?
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_07");	//Кошмары эти носят злой характер, темную магию. Именно это и является причиной его плохих сновидений. Пойми, сын мой, проклятия такого рода, которые превращают человека в нежить, так просто не избыть. Возможно это вторая, так сказать, натура рвется наружу.
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_08");	//Ты хочешь сказать, что это скелет пытается таким образом вернуться обратно?
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_09");	//Да. Это не просто второй облик пирата. Это злой дух, который может натворить немало плохого. Тем более здесь, в такой дали от тех сокровищ, которые и являются источником проклятия. 
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_10");	//Чем дальше, тем больше свободы будет получать проклятый, но такую же свободу будет получать и злой дух, который, пробыв довольно долгое время в этом мире, захочет сюда вернуться.
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_11");	//А теперь представь, сын мой, что может натворить бессмертное существо, лишенное всяческих моральных принципов?
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_12");	//Даже представлять не хочу. И что нам делать?
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_13");	//Тебе надо войти в его сон и там сразиться со вторым обликом пирата. Если сумеешь одолеть его, то ты избавишь пирата Лана не только от кошмаров, но и от проклятия вообще.
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_14");	//И как мне войти в его сон? Это вообще возможно?
	AI_Output(self,other,"DIA_Vatras_AboutNightmares_13_15");	//Да, я приготовлю специальное зелье. У меня есть почти все ингредиенты для него, но не хватает самого главного – царского щавеля.
	AI_Output(other,self,"DIA_Vatras_AboutNightmares_15_16");	//Я принесу тебе его.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_VatrasPotion4Sword);
};

// Активируется, если ГГ взял квест "Кошмары", поговорил с Ватрасом насчет зелья, и принес царский щавель
	
instance DIA_Vatras_NightPotionIngredient(C_Info)
{
	npc = none_18_Vatras;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Vatras_NightPotionIngredient_condition;	
	information = DIA_Vatras_NightPotionIngredient_info;
	description = "Вот, я принес то, что ты просил.";
};

func int DIA_Vatras_NightPotionIngredient_condition()
{	
	if ((MIS_DS2P_Nightmares == Log_Running) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1)
		 && Npc_KnowsInfo(other,DIA_Vatras_AboutNightmares))
	{
		return TRUE;
	};
};

func void DIA_Vatras_NightPotionIngredient_info()
{
	AI_Output(other,self,"DIA_Vatras_NightPotionIngredient_15_00");	//Вот, я принес то, что ты просил.
	// Передаем Ватрасу растение
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	if (Npc_KnowsInfo(other,DIA_Cimm_VatrasIngredient)) // Если ГГ взял щавель у Цимма
	{
		AI_Output(other,self,"DIA_Vatras_NightPotionIngredient_15_01");	//Растение я взял у местного алхимика Цимма, он очень хочет поучиться у тебя чему-нибудь, Ватрас.
		AI_Output(self,other,"DIA_Vatras_NightPotionIngredient_13_02");	//Хорошо, когда нашим друзьям станет полегче я поговорю с ним.
	};
	AI_Output(self,other,"DIA_Vatras_NightPotionIngredient_13_03");	//Приходи через час, сын мой. К этому моменту зелье будет готово.
	Vatras_NightmaresPotionTime = C_GetTime_Plus(1,0,1);
};

// Активируется, если прошел час, как ГГ отдал Ватрасу царский щавель
// nr = 2

instance DIA_Vatras_NightPotion(C_Info)
{
	npc = none_18_Vatras;
	nr = 2;
	permanent = FALSE;
	condition = DIA_Vatras_NightPotion_condition;	
	information = DIA_Vatras_NightPotion_info;
	description = "Готово?";
};

func int DIA_Vatras_NightPotion_condition()
{	
	if ((MIS_DS2P_Nightmares == Log_Running) && Npc_KnowsInfo(other,DIA_Vatras_NightPotionIngredient)
		 && (Vatras_NightmaresPotionTime > Wld_GetPassedTime(0)))
	{
		return TRUE;
	};
};

func void DIA_Vatras_NightPotion_info()
{
	AI_Output(other,self,"DIA_Vatras_NightPotion_15_00");	//Готово?
	AI_Output(self,other,"DIA_Vatras_NightPotion_13_01");	//Да, вот оно.
	// Создаем зелье в инвентаре Ватраса и отдаем
	CreateInvItems(self,ItMi_DS2P_LanNightmaresPotion,1);
	B_GiveInvItems(self,other,ItMi_DS2P_LanNightmaresPotion,1);
	AI_Output(self,other,"DIA_Vatras_NightPotion_13_02");	//Теперь тебе остается только взять пару волос с головы нужного тебе пирата и добавить в зелье. Когда он ляжет спать, выпиваешь это зелье, и тебя перенесет в его мир снов.
	AI_Output(other,self,"DIA_Vatras_NightPotion_15_03");	//Мало того, что мне придется пить ЭТО, так мне еще придется взять в рот чьи-то волосы? У кого-то явно растет долг. Еще один Ватрас. Как я побью скелета, если он бессмертен?
	AI_Output(self,other,"DIA_Vatras_NightPotion_13_04");	//Бессмертно может быть только его тело, а никак не дух. Если ты сразишься с ним в царстве снов, то у тебя есть высокие шансы одолеть его.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Nightmares,LOG_MISSION,LOG_Running,TOPIC_DS2P_Nightmares_HasPotion);
	AI_StopProcessInfos(self);
};
	
// Активируется, если ГГ поговорил с Густавом насчет поддельных голов
// nr = 1

instance DIA_Vatras_SelfmadeHeads(C_Info)
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_SelfmadeHeads_condition;	
	information = DIA_Vatras_SelfmadeHeads_info;
	description = "Мне нужна твоя помощь.";
};

func int DIA_Vatras_SelfmadeHeads_condition()
{	
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && Npc_KnowsInfo(other,DIA_Gustav_GardWantsKillYou))
	{
		return TRUE;
	};
};

func void DIA_Vatras_SelfmadeHeads_info()
{
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_00");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Vatras_SelfmadeHeads_13_01");	//Что-то случилось, сын мой?
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_02");	//Да, Гард велел мне найти беглых охотников и убить их, а в качестве доказательства принести ему их головы.
	AI_Output(self,other,"DIA_Vatras_SelfmadeHeads_13_03");	//Смилуйся над душой этого грешника, Аданос. А от меня ты что хочешь, сын? Не найти же беглецов? Помогать в этом деле я тебе не стану.
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_04");	//Нет, я и так знаю, где они прячутся. Я не хочу их убивать, поэтому мы придумали, как обмануть Гарда, но в этом деле нам нужна твоя помощь.
	AI_Output(self,other,"DIA_Vatras_SelfmadeHeads_13_05");	//Что от меня требуется.
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_06");	//Джин, один из беглецов, может слепить фальшивые головы из глины и раскрасить их. Но этого будет мало, Гард сразу поймет, что я пытаюсь его обмануть. Ты можешь сделать так, что глиняные головы станут как настоящие, неотличимы?
	AI_Output(self,other,"DIA_Vatras_SelfmadeHeads_13_07");	//Хм, я могу наложить иллюзию на них, которая продержится примерно месяц. И все. Но иллюзия эта будет очень качественной, и на ощупь и на вид.
	AI_Output(other,self,"DIA_Vatras_SelfmadeHeads_15_08");	//Это подойдет, старче. Тогда я скоро вернусь вместе с материалом.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Running,TOPIC_DS2P_FindEscapedHunters_SelfmadeHeads);
	AI_StopProcessInfos(self);
};

// Активируется, если ГГ забрал у Джина 4 фальшивых головы охотников по квесту "Найти сбежавших охотников"
// nr = 1

instance DIA_Vatras_CreateSpellHeads(C_Info)
{
	npc = none_18_Vatras;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Vatras_CreateSpellHeads_condition;	
	information = DIA_Vatras_CreateSpellHeads_info;
	description = "Наложи иллюзию.";
};

func int DIA_Vatras_CreateSpellHeads_condition()
{	
	if ((MIS_DS2P_FindEscapedHunters == Log_Running) && Npc_KnowsInfo(other,DIA_Jinn_SelfmadeHeads_Ready)
		 && (Npc_HasItems(other,ItMi_DS2P_HuntersHead_Selfmade) >= 4))
	{
		return TRUE;
	};
};

func void DIA_Vatras_CreateSpellHeads_info()
{
	AI_Output(other,self,"DIA_Vatras_CreateSpellHeads_15_00");	//Наложи иллюзию.
	// Отдаем Ватрасу головы
	B_GiveInvItems(other,self,ItMi_DS2P_HuntersHead_Selfmade,4);
	// Удаляем головы
	Npc_RemoveInvItems(self,ItMi_DS2P_HuntersHead_Selfmade,4);
	AI_Output(self,other,"DIA_Vatras_CreateSpellHeads_13_01");	//Отступи чуть-чуть.
	Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",none_18_Vatras,none_18_Vatras,0,0,0,FALSE);
	AI_PlayAni(none_18_Vatras,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Vatras_CreateSpellHeads_13_02");	//Все готово.
	// Создаем головы и отдаем ГГ
	CreateInvItems(self,ItMi_DS2P_HuntersHead_Selfmade_Illusion,4);
	B_GiveInvItems(self,other,ItMi_DS2P_HuntersHead_Selfmade_Illusion,4);
	AI_Output(other,self,"DIA_Vatras_CreateSpellHeads_15_03");	//Так быстро?
	AI_Output(self,other,"DIA_Vatras_CreateSpellHeads_13_04");	//Я все же безусый юнец. Научился кое-чему на склоне лет.
	AI_Output(other,self,"DIA_Vatras_CreateSpellHeads_15_05");	//Спасибо.
	B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_Running,TOPIC_DS2P_FindEscapedHunters_ReturningToGard);
	AI_StopProcessInfos(self);
};

//NS - 26/04/2016 ===========
// Квест "Каменные таблички древних"
//===========================

//(спросить по поводу Экора)
instance DIA_Vatras_AskAncientNotes(C_Info)
{
	npc = none_18_Vatras;
	nr = 20;
	permanent = FALSE;
	condition = DIA_Vatras_PiratesAreDead_condition;	
	information = DIA_Vatras_PiratesAreDead_info;
	description = "Помнишь старые каменные таблички, которые я приносил тебе в Хоринисе?";
};
func int DIA_Vatras_AskAncientNotes_condition()
{	
	if(All_Pirat_Killed)
	{	return TRUE;	};
};
func void DIA_Vatras_AskAncientNotes_info()
{
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_01");	//Ватрас, помнишь старые каменные таблички, которые я приносил тебе в Хоринисе?
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_02");	//Разумеется. Почему ты спрашиваешь?
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_03");	//Мне попалось несколько таких и на этом острове, хоть я и не видел ничего похожего на руины Зодчих.
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_04");	//Отшельник Экор исследует эти таблички, но пока не сильно продвинулся в изучении языка Зодчих.
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_05");	//Может, у тебя найдется что-то, что поможет ему?
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_06");	//Да, я взял с собой кое-какие записи с расшифровкой текстов. Думаю, грамотному человеку не составит труда разобраться в них и вычленить главное.
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_07");	//Они лежат в сундуке в моей каюте. Вот, возьми ключ.
	//ключ от сундука Ватраса
	B_GiveInvItems(self,other,ITKE_Key_DS2P_VATRAS_CHEST,1);
		AI_Output(other,self,"DIA_Vatras_AskAncientNotes_15_08");	//Не жалко? Столько труда ушло, чтобы их составить.
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_09");	//Знания должны распространяться, а не превращаться в метрвый груз на дне пыльных сундуков.
	AI_Output(self,other,"DIA_Vatras_AskAncientNotes_05_10");	//В другое время я бы с удовольствием пообщался с этим отшельником. Но, видно, Аданос направляет меня иной дорогой.
	//Запись в дневнике "Каменные таблички древних"
	B_DSG_Log_OpenClose(TOPIC_DS2P_AncientStonePlates,LOG_MISSION,LOG_Running, TOPIC_DS2P_AncientStonePlates_VatrasKey);
};


