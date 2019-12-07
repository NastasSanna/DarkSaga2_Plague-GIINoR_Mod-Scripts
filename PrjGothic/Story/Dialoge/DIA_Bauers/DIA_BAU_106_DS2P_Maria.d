instance DIA_Maria_EXIT(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Maria_EXIT_condition;	
	information = DIA_Maria_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Maria_EXIT_condition(){	return TRUE;};
func void DIA_Maria_EXIT_info(){	AI_StopProcessInfos(self);};
//
//**--СТАРТОВЫЙ ДИАЛОГ----***//
//
instance DIA_Maria_Start(C_Info)	//Начальный диалог "Привет. Кто ты?"	nr=1;
{
	npc = BAU_106_DS2P_Maria;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Maria_Start_condition;	
	information = DIA_Maria_Start_info;
	description = "Привет! Кто ты?";
};
func int DIA_Maria_Start_condition(){	return TRUE;};
func void DIA_Maria_Start_info()
{
	AI_Output(other,self,"DIA_Maria_Start_15_00");	//Привет. Кто ты?
	AI_Output(self,other,"DIA_Maria_Start_17_00");	//Меня зовут Мария, я – жена Густава, нашего кузнеца, а здесь работаю поварихой.
	AI_Output(self,other,"DIA_Maria_Start_17_01");	//Я раньше не видела тебя в нашей деревне. Ты тоже из пиратов?
	AI_Output(other,self,"DIA_Maria_Start_15_01");	//Нет, я прибыл совсем недавно на корабле. К пиратам я не имею никакого отношения.
	AI_Output(self,other,"DIA_Maria_Start_17_02");	//Что-то в последнее время наш остров пользуется нешуточной популярностью. (грустно смеется)
};
//----
//Появляется после стартового "Привет. Кто ты?"
//----
instance DIA_Maria_TellMeWhatHappenedToU(C_Info)	//Расскажи, что у вас случилось.	nr=5;
{
	npc = BAU_106_DS2P_Maria;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Maria_TellMeWhatHappenedToU_condition;	
	information = DIA_Maria_TellMeWhatHappenedToU_info;
	description = "Расскажи, что у вас случилось.";
};
func int DIA_Maria_TellMeWhatHappenedToU_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_TellMeWhatHappenedToU_info()
{
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_00");	//Расскажи, что у вас случилось.
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_00");	//А разве ты не видишь?
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_01");	//Пираты держат наших друзей и близких в заложниках, а мы вынуждены все это терпеть и обслуживать этих выродков.
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_02");	//И что самое страшное, я даже не знаю, как это можно остановить.
	
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_01");	//Может быть вам поднять бунт? В деревне же есть крепкие мужчины?!
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_02");	//Одна группа нападает на пещеру и освобождает заложников, вторая нападает на пиратов.
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_03");	//Если будет ночь и эффект неожиданности, то шансы достаточно велики.
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_03");	//(пристально смотрит) Ты серьезно? Думаешь, у нас получится?
	
	AI_Output(other,self,"DIA_Maria_TellMeWhatHappenedToU_15_04");	//Во всяком случая, я бы попытался. Лучше умереть в бою, чем от страха, прозябая под ударами кулаков пиратов.
	AI_Output(self,other,"DIA_Maria_TellMeWhatHappenedToU_17_04");	//Да, ты прав.
};
//----
//Появляется после стартового "Привет. Кто ты?"
//----
instance DIA_Maria_CanIBuyUMeal(C_Info)	//Я могу купить у тебя еды?	nr=6;
{
	npc = BAU_106_DS2P_Maria;
	nr = 6;
	permanent = FALSE;
	condition = DIA_Maria_CanIBuyUMeal_condition;	
	information = DIA_Maria_CanIBuyUMeal_info;
	description = "Я могу купить у тебя еды?";
};
func int DIA_Maria_CanIBuyUMeal_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_CanIBuyUMeal_info()
{
	AI_Output(other,self,"DIA_Maria_CanIBuyUMeal_15_00");	//Я могу купить у тебя еды?
	AI_Output(self,other,"DIA_Maria_CanIBuyUMeal_17_00");	//Да, конечно.
	AI_Output(self,other,"DIA_Maria_CanIBuyUMeal_17_01");	//Так получилось, что теперь я ответственная за большую часть запасов в лагере и занимаюсь кормёжкой пиратов.
	AI_Output(self,other,"DIA_Maria_CanIBuyUMeal_17_02");	//Поэтому, если тебе что-то нужно, обращайся. Еды у меня предостаточно.
	B_DSG_Log_OpenClose(TOPIC_BauerTrader,LOG_NOTE,-1,"Повариха Мария продает продукты.");
};
//----
//Появляется после предыдущего "Я могу купить у тебя еды?".  ТОРГОВЛЯ
//----
instance DIA_Maria_Trade(C_Info)	//Покажи свои товары.		nr=6;
{
	npc = BAU_106_DS2P_Maria;
	nr = 6;
	permanent = TRUE;
	condition = DIA_Maria_Trade_condition;	
	information = DIA_Maria_Trade_info;
	description = "Покажи свои товары.";
	trade = TRUE;
};
func int DIA_Maria_Trade_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_Trade_info()
{
	AI_Output(other,self,"DIA_Maria_Trade_15_00");	//Покажи свои товары.
	AI_Output(self,other,"DIA_Maria_Trade_17_00");	//Выбирай.
	B_GiveTradeInv(self);
};
//----
//Появляется после стартового "Привет. Кто ты?"
//----
instance DIA_Maria_HasVillageWitchDoctor(C_Info)	//В деревне есть знахарь?		nr=7;
{
	npc = BAU_106_DS2P_Maria;
	nr = 7;
	permanent = FALSE;
	condition = DIA_Maria_HasVillageWitchDoctor_condition;	
	information = DIA_Maria_HasVillageWitchDoctor_info;
	description = "В деревне есть знахарь?";
};
func int DIA_Maria_HasVillageWitchDoctor_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_HasVillageWitchDoctor_info()
{
	AI_Output(other,self,"DIA_Maria_HasVillageWitchDoctor_15_00");	//В деревне есть знахарь? На моем корабле чума, и без помощи алхимика или целителя многие люди погибнут.
	AI_Output(self,other,"DIA_Maria_HasVillageWitchDoctor_17_00");	//Сочувствую!
	AI_Output(self,other,"DIA_Maria_HasVillageWitchDoctor_17_01");	//Нашего знахаря зовут Цимм. Его дом находится /*Redleha: там-то и там-то. НАДО ИСПРАВИТЬ*/.
	AI_Output(self,other,"DIA_Maria_HasVillageWitchDoctor_17_02");	//Я уверена, что он не откажет тебе в помощи. Правда, тебе придется раскошелиться. Цимм никогда не делает ничего просто так, уж такой он человек.
	AI_Output(other,self,"DIA_Maria_HasVillageWitchDoctor_15_01");	//Я это учту.
};
//----
//Появляется после стартового "Привет. Кто ты?"
//----
var int C_DIA_Maria_ImVeryHungry_FirstDialog;
instance DIA_Maria_ImVeryHungry(C_Info)	//Я очень голоден. (постоянный)		nr=8;
{
	npc = BAU_106_DS2P_Maria;
	nr = 8;
	permanent = TRUE;
	condition = DIA_Maria_ImVeryHungry_condition;	
	information = DIA_Maria_ImVeryHungry_info;
	description = "Я очень голоден.";
};
func int DIA_Maria_ImVeryHungry_condition(){	if(Npc_KnowsInfo(other,DIA_Maria_Start)){	return TRUE;};	};
func void DIA_Maria_ImVeryHungry_info()
{
	AI_Output(other,self,"DIA_Maria_ImVeryHungry_15_00");	//Я очень голоден. Нет ли у тебя чего-нибудь поесть?
	if(!C_DIA_Maria_ImVeryHungry_FirstDialog)
	{
		AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_00");	//(улыбается) Ты пришел по адресу.
		AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_01");	//Главный пират, по-моему его зовут Гард,  приказал кормить всех, кто находится в лагере.
		AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_02");	//Хоть ты и не один из крестьян или пиратов, думаю, ни от кого не убудет, если я дам тебе немного супчика по моему секретному рецепту.
		B_GiveInvItems(self,other,ItFo_DS2P_StewMaria,1);
		C_DIA_Maria_ImVeryHungry_FirstDialog = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_MariaSoups,LOG_NOTE,-1,"Раз в день можно получить у поварихи Марии порцию супа.");
	}
	else
	{
		if(Wld_GetDay() > Maria_GiveStew_Day)
		{
			AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_03");	//Держи свой супчик.
			B_GiveInvItems(self,other,ItFo_Stew,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Maria_ImVeryHungry_17_04");	//Ты уже получил свою порцию сегодня, приходи завтра.
		};
	};
	Maria_GiveStew_Day = Wld_GetDay();
};
//----
//Появляется после стартового "Привет. Кто ты?" и (если взят квест "Ужас в ночи")
//----
instance DIA_Maria_WhereCanIFindGustav(C_Info)	//Где мне найти Густава?		nr=9;
{
	npc = BAU_106_DS2P_Maria;
	nr = 9;
	permanent = FALSE;
	condition = DIA_Maria_WhereCanIFindGustav_condition;	
	information = DIA_Maria_WhereCanIFindGustav_info;
	description = "Где мне найти Густава?";
};
func int DIA_Maria_WhereCanIFindGustav_condition()
{	if(Npc_KnowsInfo(other,DIA_Maria_Start) && (MIS_DS2P_TerrorInNight == LOG_Running))
		{	return TRUE;};	
};
func void DIA_Maria_WhereCanIFindGustav_info()
{
	AI_Output(other,self,"DIA_Maria_WhereCanIFindGustav_15_00");	//Где мне найти Густава?
	AI_Output(self,other,"DIA_Maria_WhereCanIFindGustav_17_00");	//Он вместе с другими охотниками скрывается в лесу. Надеюсь, с ним все в порядке.
	AI_Output(self,other,"DIA_Maria_WhereCanIFindGustav_17_01");	//Мы не виделись уже очень давно. Если тебе удастся с ним встретиться, скажи мне об этом. Я не останусь в долгу.
};
//----
//Появляется после стартового "Привет. Кто ты?" и (если взят квест ”Рыбное дело”)
//----
instance DIA_Maria_IBroughtFishFromHarok(C_Info)		//Где мне найти Густава?		nr=10;
{
	npc = BAU_106_DS2P_Maria;
	nr = 10;
	permanent = FALSE;
	condition = DIA_Maria_IBroughtFishFromHarok_condition;	
	information = DIA_Maria_IBroughtFishFromHarok_info;
	description = "Я принес рыбу от Харока.";
};
func int DIA_Maria_IBroughtFishFromHarok_condition()
{	if(Npc_KnowsInfo(other,DIA_Maria_Start) && (MIS_DS2P_FishingBusiness == LOG_Running) && Npc_HasItems(other,ITMI_DS2P_FishBarrel))
		{	return TRUE;};	
};
func void DIA_Maria_IBroughtFishFromHarok_info()
{
	AI_Output(other,self,"DIA_Maria_IBroughtFishFromHarok_15_00");	//Я принес рыбу от Харока.
	AI_Output(self,other,"DIA_Maria_IBroughtFishFromHarok_17_00");	//О, это очень хорошо! А то мои запасы практически закончились. Давай ее сюда.
	B_DS_GiveRemoveItems_Red(other,self,ITMI_DS2P_FishBarrel,1,34);
	B_GiveInvItem_red(self,other,ItFo_DS2P_StewMaria,1,37);
	B_DSG_Log_OpenClose(TOPIC_DS2P_FishingBusiness,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_FishingBusiness_Success);
};
//----
//Появляется после стартового "Привет. Кто ты?" и (если взят квест ”Внук рыбака”) 
//----
instance DIA_Maria_AboutGaron(C_Info)		//Тебе известно, что случилось с Гароном?		nr=11;
{
	npc = BAU_106_DS2P_Maria;
	nr = 11;
	permanent = FALSE;
	condition = DIA_Maria_AboutGaron_condition;	
	information = DIA_Maria_AboutGaron_info;
	description = "Тебе известно, что случилось с Гароном?";
};
func int DIA_Maria_AboutGaron_condition()
{	if(Npc_KnowsInfo(other,DIA_Maria_Start) && (MIS_DS2P_GrandsonOfFisherman == LOG_Running))
		{	return TRUE;};	
};
func void DIA_Maria_AboutGaron_info()
{
	AI_Output(other,self,"DIA_Maria_AboutGaron_15_00");	//Тебе известно, что случилось с Гароном? Харок сказал, что пираты забрали его к себе на службу.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_00");	//(вздыхает) Да, это так.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_01");	//Пару дней назад они притащили его в деревню. Он брыкался, пинался, пробовал удрать, но пиратов это только еще больше раззадорило.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_02");	//Они утащили его в ратушу и долго били, пока он не потерял сознание. Я как раз в это время была в ратуше, принесла еду пиратам.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_03");	//Когда Гарон пришел в себя, капитан пиратов поставил условие – либо он с ними, либо они начнут с ним ”разговаривать” по-мужски. А все, что было до этого, просто детская забава.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_04");	//Я помогла Гарону добраться до постели. Он пролежал в беспамятстве несколько дней.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_05");	//Как только он пришел в себя, за ним пришли. Гарон стал сопротивляться, нокаутировал своих конвоиров и сбежал.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_06");	//Но, так как он был слаб, далеко удрать ему не удалось. Через несколько часов пираты нашли его.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_07");	//Думаю, они опять избили до полусмерти.
	
	AI_Output(other,self,"DIA_Maria_AboutGaron_15_01");	//Где сейчас Гарон?
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_08");	//В сарае под замком. Даже я не имею право подходить к нему.
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_09");	//Пираты уверены, что кто-нибудь из деревенских поможет сбежать Гарону.
	AI_Output(other,self,"DIA_Maria_AboutGaron_15_02");	//А кто носит еду Гарону?
	AI_Output(self,other,"DIA_Maria_AboutGaron_17_10");	//Один из пиратов. По-моему, его зовут Карах.
	B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_Running,TOPIC_DS2P_GrandsonOfFisherman_MariaSeen);
};


//NS - 27/06/2013 ===========
// По квестам "Кто украл мое железо?" + "Оружие для борьбы" + "Остров в осаде"
//===========================

//----------------------------
// "Где железо из кузницы?"		nr=21
instance DIA_Maria_AboutStolenIron(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 21;
	condition = DIA_Maria_AboutStolenIron_condition;	
	information = DIA_Maria_AboutStolenIron_info;
	description = "Где железо из кузницы?";
};
func int DIA_Maria_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Maria_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Maria_AboutStolenIron_15_00");	//Где железо из кузницы?
		AI_Output(self,other,"DIA_Maria_AboutStolenIron_17_01");	//А я откуда знаю? 
	AI_Output(other,self,"DIA_Maria_AboutStolenIron_15_02");	//Но это же твой дом, и ты наверняка знаешь, кто его украл!
		AI_Output(self,other,"DIA_Maria_AboutStolenIron_17_03");	//Вот еще выдумал. Мало ли кто и где живет. Я хоть и жена кузнеца, но это еще не значит, что я интересуюсь всякими железяками.
		AI_Output(self,other,"DIA_Maria_AboutStolenIron_17_04");	//Давай закончим этот глупый разговор.
	B_DSG_Bauers_AboutStolenIron_Counter();
};

//----------------------------
// "Меня прислал Густав."	по плану Джозефа	nr=22
instance DIA_Maria_ImFromGustav(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 22;
	condition = DIA_Maria_ImFromGustav_condition;	
	information = DIA_Maria_ImFromGustav_info;
	description = "Меня прислал Густав.";
};
func int DIA_Maria_ImFromGustav_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_NooneConfess))
	{	return TRUE;	};
};
func void DIA_Maria_ImFromGustav_info()
{
	AI_Output(other,self,"DIA_Maria_ImFromGustav_15_00");	//Меня прислал Густав. Я должен отнести ему железо.
		AI_Output(self,other,"DIA_Maria_ImFromGustav_17_01");	//(пристально смотрит) А кто сказал, что я кого-то посылала к Густаву? Ты что-то путаешь.
	AI_Output(other,self,"DIA_Maria_ImFromGustav_15_02");	//Ты хочешь сказать, что у тебя нет железа?
		AI_Output(self,other,"DIA_Maria_ImFromGustav_17_03");	//Именно так я и хочу сказать. Я совершенно не понимаю, о чем ты говоришь.
	AI_StopProcessInfos(self);
};

//----------------------------
// "Послушай. Если вы не вернете железо..."	после предыдущего	nr=23
instance DIA_Maria_IfUWontReturnIron(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 23;
	condition = DIA_Maria_IfUWontReturnIron_condition;	
	information = DIA_Maria_IfUWontReturnIron_info;
	description = "Послушай. Если вы не вернете железо...";
};
func int DIA_Maria_IfUWontReturnIron_condition()
{
	if (Npc_KnowsInfo(other,DIA_Joseph_NooneConfess))
	{	return TRUE;	};
};
func void DIA_Maria_IfUWontReturnIron_info()
{
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_00");	//Послушай. Если вы не вернете железо в ближайшее время, пираты начнут прочесывать всю деревню, и если после этого ничего не найдут, начнут вешать крестьян по одному, пока кто-нибудь не сознается.
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_01");	//Гард не остановится ни перед чем. Тебе решать.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_02");	//(напугано) Это правда? О нет! Что же делать?
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_03");	//Вернуть похищенное.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_04");	//Но я... Тогда мы точно обречены. У них нет оружия, Густав ранен... Мы обречены!
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_05");	//Я могу вам помочь. Ты расскажешь, где вы спрятали железо, а я сделаю так, что только часть похищенного вернется в кузницу, остальное отнесу Густаву.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_06");	//Ты действительно это сделаешь?
	AI_Output(other,self,"DIA_Maria_IfUWontReturnIron_15_07");	//Конечно. Я не менее вас заинтересован в избавлении от пиратов.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_08");	//Хорошо, я согласна. Отнеси часть железа пиратам, остальное Густаву в лес.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_10");	//Также я напишу послание и подготовлю сверток с продуктами.
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_11");	//В тексте я укажу, что тебе можно доверять, в противном случае они не будут с тобой говорить, а могут даже убить. Будь острожен.

	//Передает послание и «Сверток продуктов»
	B_GiveInvItems(self,other,ItWr_DS2P_Message_Maria2Gustav,1);
	B_GiveInvItems(self,other,ItMi_DS2P_ProductsPacket_Maria,1);
	
	AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_12");	//Где я могу найти охотников?
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_13");	//Я думаю, они стоят лагерем в чаще, недалеко от деревни. 
	// UNFINISHED вписать дорогу к лесу
		AI_Output(self,other,"DIA_Maria_IfUWontReturnIron_17_14");	// /*Redleha: Находится там-то и там-то. НАДО ИСПРАВИТЬ*/

	//Запись в дневнике "Остров в осаде" 
	// UNFINISHED вписать дорогу к лесу
	B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_Running,TOPIC_DS2P_IslandUnderSiege_Hunters);

	//Запись в дневнике "Оружие для борьбы" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WeaponsToFight,LOG_MISSION,LOG_Running,TOPIC_DS2P_WeaponsToFight_Start);
	
	//Запись в дневнике "Кто украл мое железо?" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_WeaponsToFight,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_ReturnPart);
};

//----------------------------
// "Кто украл железную руду?"	после предыдущего	nr=24
instance DIA_Maria_WhoStoleIron(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 24;
	condition = DIA_Maria_WhoStoleIron_condition;	
	information = DIA_Maria_WhoStoleIron_info;
	description = "Кто украл железную руду?";
};
func int DIA_Maria_WhoStoleIron_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_IfUWontReturnIron))
	{	return TRUE;	};
};
func void DIA_Maria_WhoStoleIron_info()
{
	AI_Output(other,self,"DIA_Maria_WhoStoleIron_15_00");	//Кто украл железную руду?
		AI_Output(self,other,"DIA_Maria_WhoStoleIron_17_02");	//Да тут пол деревни в этом участвовало: Барок, Тамир и Хуно унесли железо, я следила за Джозефом, а Дил потом отвлек кузнеца.
	
	//Запись в дневнике "Кто украл мое железо?"
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_MariaConfess);

	// если уже говорили с Дилом
	var C_NPC Dil; Dil = Hlp_GetNpc(Bau_102_DS2P_Dil);
	if (Dil.aivar[AIV_TalkedToPlayer] == TRUE)
	{
	AI_Output(other,self,"DIA_Maria_WhoStoleIron_15_03");	//Мне показалось, что Дил немного не в себе.
		AI_Output(self,other,"DIA_Maria_WhoStoleIron_17_04");	//Он просто другой, но если к нему обратиться с лаской, то он все понимает.
	};
};

//----------------------------
// "Где вы храните украденное?"	после диалога про возврат железа (+опыт)	nr=25
instance DIA_Maria_WhereIsIron(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 25;
	condition = DIA_Maria_WhereIsIron_condition;	
	information = DIA_Maria_WhereIsIron_info;
	description = "Где вы храните украденное?";
};
func int DIA_Maria_WhereIsIron_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_IfUWontReturnIron))
	{	return TRUE;	};
};
func void DIA_Maria_WhereIsIron_info()
{
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_00");	//Где вы храните украденное?
	//(+опыт)
	B_GivePlayerXP(XP_MIS_WhoStoleMyIron_Found);
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_01");	//Мы разделили все железо на три части: две части спрятали у себя в доме Хуно и Барок, а третью отнесли в заброшенный дом Дила.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_02");	//Ключи от первых двух сундуков у меня, а вот ключ от дома Дила у Кадара. Но он никому его не дает.
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_03");	//И как же вы смогли тогда спрятать железо в этом доме? 
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_04");	//Очень просто – я выкрала ключ, а потом подбросила обратно Кадару. Чтобы он ничего не заподозрил.
	//Запись в дневнике "Кто украл мое железо?"
	B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_3Parts);
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_05");	//Так ты воровка?
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_06");	//Ну как тебе сказать?! Ошибки молодости. Я не всегда жила на этом острове.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_07");	//Я родилась на материке, а Ардее. Деревня у нас маленькая, семья была бедная, поэтому я перебралась в столицу в надежде на красивую жизнь.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_08");	//Естественно, никому я там оказалась не нужна, а чтобы прокормить себя было две альтернативы – торговать телом или воровать. Я выбрала второе.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_09");	//Потом уже, когда вся эта жизнь мне опостылела, я пробралась на торговое судно, которое шло в Хоринис через этот остров.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_10");	//Здесь мне очень понравилось, эта деревня напомнила мне о моем доме, а потом я встретила Густава и сразу влюбилась.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_11");	//Ну а дальше началась степенная жизнь без приключений.
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_12");	//А почему ты не вернулась домой?
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_13");	//Я долго не решалась, боялась позора и осуждения. А когда решилась, то вернувшись, узнала, что мои родители погибли от чумы, дом наш был сожжен, и я теперь никому не нужна.
	AI_Output(other,self,"DIA_Maria_WhereIsIron_15_14");	//Очень жаль.
		AI_Output(self,other,"DIA_Maria_WhereIsIron_17_15");	//Ничего. Это было очень и очень давно.
	//Дает 2 ключа: «Ключ от сундука Хуно», «Ключ от сундука Барока»
	B_GiveInvItems(self,other,ITKE_KEY_DS2P_HUNO_CHEST,1);
	B_GiveInvItems(self,other,ITKE_KEY_DS2P_BAROK_CHEST,1);
};

//----------------------------
// "Разве Кадар не с вами?"	после диалога про украденную руду	nr=26
instance DIA_Maria_AboutKadar(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 26;
	condition = DIA_Maria_AboutKadar_condition;	
	information = DIA_Maria_AboutKadar_info;
	description = "Разве Кадар не с вами?";
};
func int DIA_Maria_AboutKadar_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_WhereIsIron) && !Npc_IsDead(Kadar))
	{	return TRUE;	};
};
func void DIA_Maria_AboutKadar_info()
{
	AI_Output(other,self,"DIA_Maria_AboutKadar_15_00");	//Разве Кадар не с вами?
		AI_Output(self,other,"DIA_Maria_AboutKadar_17_01");	//Кадар в последнее время очень изменился. Совсем пал духом. Я даже не знаю, можно ли ему доверять. Люди в таком состоянии опасны.
		AI_Output(self,other,"DIA_Maria_AboutKadar_17_02");	//Не советую тебе говорить ему что-нибудь лишнее.

};


//NS - 27/06/2013 ====================================================
// По квесту "Старая мельница"
//====================================================================

//----------------------------
// Где Густав брал камни для ремонта мельницы?		nr=31
// после взятия квеста
instance DIA_Maria_WhereGetStone4Mill(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 31;
	condition = DIA_Maria_WhereGetStone4Mill_condition;	
	information = DIA_Maria_WhereGetStone4Mill_info;
	description = "Ты не знаешь, где твой муж брал камни для ремонта мельницы?";
};
func int DIA_Maria_WhereGetStone4Mill_condition()
{
	if (MIS_DS2P_OldMill == LOG_Running){	return TRUE;	};
};
func void DIA_Maria_WhereGetStone4Mill_info()
{
	AI_Output(other,self,"DIA_Maria_WhereGetStone4Mill_15_00");	//Ты не знаешь, где твой муж брал камни для ремонта мельницы?
		AI_Output(self,other,"DIA_Maria_WhereGetStone4Mill_17_01");	//Не имею ни малейшего представления.
	AI_Output(other,self,"DIA_Maria_WhereGetStone4Mill_15_02");	//Но ведь твой муж раньше занимался ремонтом.
		AI_Output(self,other,"DIA_Maria_WhereGetStone4Mill_17_03");	//Да, я знаю, но никогда не вникала в подробности. У меня и так куча дел по хозяйству, и времени на всякую ерунду совершенно не остается.
	AI_Output(other,self,"DIA_Maria_WhereGetStone4Mill_15_04");	//Хм... Может быть, ты знаешь, где я могу найти залежи гранита на вашем острове?
		AI_Output(self,other,"DIA_Maria_WhereGetStone4Mill_17_05");	//(смеется) О да, ты нашел именно ту, кто все об этом знает. Хи-хи-хи!
		AI_Output(self,other,"DIA_Maria_WhereGetStone4Mill_17_06");	//Ладно, не серчай, я советую тебе спросить об этом Тамира. Он же охотник и много путешествует по острову.

	//Запись в дневнике "Старая мельница" 
	B_ds_LogEntry(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_Running,TOPIC_DS2P_OldMill_AskTamir);
};


//NS - 28/06/2013 ====================================================
// По квесту "Доставка припасов"
//====================================================================

//----------------------------
// Взять продукты для пленных, после взятия квеста 		nr=41
instance DIA_Maria_GetFoodSupplies(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 41;
	condition = DIA_Maria_GetFoodSupplies_condition;	
	information = DIA_Maria_GetFoodSupplies_info;
	description = "";
};
func int DIA_Maria_GetFoodSupplies_condition()
{
	if (MIS_DS2P_ShippingSupplies == LOG_Running){	return TRUE;	};
};
func void DIA_Maria_GetFoodSupplies_info()
{
	var int x;
	AI_Output(other,self,"DIA_Maria_GetFoodSupplies_15_00");	//Грег хочет, чтобы я отнес припасы в пещеру.
		AI_Output(self,other,"DIA_Maria_GetFoodSupplies_17_01");	//Ну, наконец-то! А то я уже собиралась сама это сделать.
		AI_Output(self,other,"DIA_Maria_GetFoodSupplies_17_02");	//Не хочу, чтобы мои подруги погибли от голода. Им и так нелегко.
		AI_Output(self,other,"DIA_Maria_GetFoodSupplies_17_03");	//Держи этот сверток, отдашь его Каре. Она разогреет еду на костре и всех накормит.
	//Дает «Сверток еды для пленных»
	x = 1; if (x == 1) {
		B_GiveInvItems(self,other, ItMi_DS2P_Packet_ProductSupplies, 1);
	};

	//Запись в дневнике "Доставка припасов" 
	B_ds_LogEntry(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_FoodGot);
};

//----------------------------
// Сразу как сообщили Кадару о смерти Кары 		nr=42
instance DIA_Maria_OnKadar_KaraDead(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 42;
	condition = DIA_Maria_OnKadar_KaraDead_condition;	
	information = DIA_Maria_OnKadar_KaraDead_info;
	important = TRUE;
};
func int DIA_Maria_OnKadar_KaraDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Kadar_KaraDead)){	return TRUE;	};
};
func void DIA_Maria_OnKadar_KaraDead_info()
{
		AI_Output(self,other,"DIA_Maria_OnKadar_KaraDead_17_00");	//Это правда? Кара мертва?
	AI_Output(other,self,"DIA_Maria_OnKadar_KaraDead_15_01");	//Да, все произошло на моих глазах.
		AI_Output(self,other,"DIA_Maria_OnKadar_KaraDead_17_02");	//(плачет) О боги, за что?!
	AI_StopProcessInfos(self);
};

//----------------------------
// Позже, если сообщили Кадару о смерти Кары 		nr=43
instance DIA_Maria_AfterKadar_KaraDead(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 43;
	condition = DIA_Maria_AfterKadar_KaraDead_condition;	
	information = DIA_Maria_AfterKadar_KaraDead_info;
	important = TRUE;
};
func int DIA_Maria_AfterKadar_KaraDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_OnKadar_KaraDead) && (Npc_IsInState(self, ZS_Talk)))
	{	return TRUE;	};
};
func void DIA_Maria_AfterKadar_KaraDead_info()
{
		AI_Output(self,other,"DIA_Maria_AfterKadar_KaraDead_17_00");	//Я думаю, нужно оставить Кадара в покое. Мы ничем не сможем ему помочь.
		AI_Output(self,other,"DIA_Maria_AfterKadar_KaraDead_17_01");	//Уверена, пройдет пара дней, и он придет в норму.
};

//----------------------------
// После смерти Кадара 		nr=44
instance DIA_Maria_KadarDead(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 44;
	condition = DIA_Maria_KadarDead_condition;	
	information = DIA_Maria_KadarDead_info;
	important = TRUE;
};
func int DIA_Maria_KadarDead_condition()
{
	if (Npc_KnowsInfo(other,DIA_Gard_KadarTriesToKill) && Npc_IsInState(self, ZS_Talk))
	{	return TRUE;	};
};
func void DIA_Maria_KadarDead_info()
{
		AI_Output(self,other,"DIA_Maria_KadarDead_17_00");	//Сначала Кара, теперь Кадар...  (плачет) Скоро мы все станем покойниками.
};


//NS - 03/07/2013 ================================================
// По квесту "Азартный игрок"
//================================================================
// Попросить сшить косюмы 		nr=50
instance DIA_Maria_CanUSewClothes(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 50;
	condition = DIA_Maria_CanUSewClothes_condition;	
	information = DIA_Maria_CanUSewClothes_info;
	description = "Мне нужна одежда.";
};
func int DIA_Maria_CanUSewClothes_condition()
{
	if (Npc_KnowsInfo(other,DIA_Zedd_GotForgeBellows))
	{	return TRUE;	};
};
func void DIA_Maria_CanUSewClothes_info()
{
	AI_Output(other,self,"DIA_Maria_CanUSewClothes_15_00");	//Мне нужна одежда. Может быть, ты сошьешь для меня?
		AI_Output(self,other,"DIA_Maria_CanUSewClothes_17_01");	//У меня дел выше крыши, а ты пристаешь со всякой ерундой.
	AI_Output(other,self,"DIA_Maria_CanUSewClothes_15_02");	//Это очень важно, я заплачу.
		AI_Output(self,other,"DIA_Maria_CanUSewClothes_17_03");	//Ты лучше вот что сделай. Я тут грядку свеклы посадила, а собрать все руки не доходят. Сходи, нарви с десяток и принеси мне.
	// UNFINISHED вписать, где находится грядка со свеклой
		AI_Output(self,other,"DIA_Maria_CanUSewClothes_17_04");	//Она находится /*Redleha: там-то и там-то. НАДО ИСПРАВИТЬ*/. Тогда и поговорим о твоем деле.
	AI_Output(other,self,"DIA_Maria_CanUSewClothes_15_05");	//Опять свекла...
		AI_Output(self,other,"DIA_Maria_CanUSewClothes_17_06");	//Что?
	AI_Output(other,self,"DIA_Maria_CanUSewClothes_15_07");	//Да нет, ничего, вспомнилось просто...

	//Запись в дневнике "Азартный игрок" 
	// UNFINISHED вписать, где находится грядка со свеклой
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_MariaBeet);
};

//------------------------------------------
// Отдать свеклу (+опыт) 		nr=51
instance DIA_Maria_GiveBeet(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 51;
	condition = DIA_Maria_GiveBeet_condition;	
	information = DIA_Maria_GiveBeet_info;
	description = "Вот твоя свекла.";
};
func int DIA_Maria_GiveBeet_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_CanUSewClothes) && (Npc_HasItems(other,ItPl_Beet) >= 10))
	{	return TRUE;	};
};
func void DIA_Maria_GiveBeet_info()
{
	AI_Output(other,self,"DIA_Maria_GiveBeet_15_00");	//Вот твоя свекла.
	//(+опыт)
	B_GivePlayerXP(XP_MIS_Gambler_Beet);
	//Отдаем свеклу
	B_DS_GiveRemoveItems(other,self,ItPl_Beet,10);
		AI_Output(self,other,"DIA_Maria_GiveBeet_17_01");	//Хорошо. Так что там по поводу одежды?
	AI_Output(other,self,"DIA_Maria_GiveBeet_15_02");	//Мне нужно, чтобы ты сшила два костюма из белой материи. Качество не так важно. Можно даже особо не стараться.
		AI_Output(self,other,"DIA_Maria_GiveBeet_17_03");	//Странно. Зачем тебе белые костюмы?
	AI_Output(other,self,"DIA_Maria_GiveBeet_15_04");	//Это не для меня. Просто сделай.
		AI_Output(self,other,"DIA_Maria_GiveBeet_17_05");	//Ладно, что-нибудь придумаю. Приходи завтра.

	Maria_ClothesReady_Day = Wld_GetDay() + 1;
	//Запись в дневнике "Азартный игрок" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_MariaAgreed);
};

//------------------------------------------
// Забрать костюмы (на следующий день после 8 утра)		nr=52
instance DIA_Maria_GetClothes(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 52;
	condition = DIA_Maria_GiveBeet_condition;	
	information = DIA_Maria_GiveBeet_info;
	description = "Костюмы готовы?";
};
func int DIA_Maria_GetClothes_condition()
{
	if ((Maria_ClothesReady_Day > Wld_GetDay())
		|| ((Maria_ClothesReady_Day == Wld_GetDay()) && Wld_IsTime(8,0,0,0))
		&& (Maria_MadeClothes == FALSE))
	{	return TRUE;	};
};
func void DIA_Maria_GetClothes_info()
{
	var int x;
	AI_Output(other,self,"DIA_Maria_GetClothes_15_00");	//Костюмы готовы?
		AI_Output(self,other,"DIA_Maria_GetClothes_17_01");	//Да, вот, что удалось сделать за ночь. Уж извини, делала наспех, поэтому получилось не очень.
	AI_Output(other,self,"DIA_Maria_GetClothes_15_02");	//Это то, что мне нужно.
	//Забираем два костюма
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItMi_DS2P_Packet_WhiteClothes,1);
	};
	Maria_MadeClothes = TRUE;
	//Запись в дневнике "Азартный игрок" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_Running,TOPIC_DS2P_Gambler_MariaReady);
};


//NS - 27/06/2013 =========================================================
// ОБУЧЕНИЕ
// Учит за очки опыта, без золота
//=========================================================================

//----------------------------
// "Научи меня воровскому делу."	после диалога про украденную руду 	nr=100
instance DIA_Maria_PreTeach_Theft(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 100;
	condition = DIA_Maria_PreTeach_Theft_condition;	
	information = DIA_Maria_PreTeach_Theft_info;
	description = "Научи меня воровскому делу.";
};
func int DIA_Maria_PreTeach_Theft_condition()
{
	if (Npc_KnowsInfo(other,DIA_Maria_WhereIsIron))
	{	return TRUE;	};
};
func void DIA_Maria_PreTeach_Theft_info()
{
	AI_Output(other,self,"DIA_Maria_PreTeach_Theft_15_00");	//Научи меня воровскому делу.
		AI_Output(self,other,"DIA_Maria_PreTeach_Theft_17_01");	//Зачем тебе это? Я воровала, потому что мне нечего было есть, а что ты хочешь сделать с этими знаниями?
	AI_Output(other,self,"DIA_Maria_PreTeach_Theft_15_02");	//Это нужно, чтобы помочь всем на этом острове освободиться от зла, которое несут пираты.
		AI_Output(self,other,"DIA_Maria_PreTeach_Theft_17_03");	//Это достойный ответ. Я буду учить тебя.

	//Запись в дневнике в разделе доп инфо "Учителя у крестьян" 
	B_DSG_Log_OpenClose(TOPIC_BauerTeacher,LOG_NOTE,-1,"Мария может обучить меня воровскому делу.");
	TEACH_Maria_Theft = TRUE;
};

//----------------------------
// Обучение ВОРОВСТВО и ЛОВКОСТЬ 	nr=101
// за очки опыта, без золота
instance DIA_Maria_TEACH_Theft(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 101;
	condition = DIA_Maria_TEACH_Theft_condition;	
	information = DIA_Maria_TEACH_Theft_info;
	description = "Научи меня воровскому делу.";
	permanent = TRUE;
};
func int DIA_Maria_TEACH_Theft_condition()
{
	if (TEACH_Maria_Theft == TRUE)
	{	return TRUE;	};
};
func void DIA_Maria_TEACH_Theft_Menu()
{
	Info_ClearChoices(DIA_Maria_TEACH_Theft);
	Info_AddChoice(DIA_Maria_TEACH_Theft,Dialog_Back,DIA_Maria_TEACH_Theft_Back);
	Info_AddChoice(DIA_Maria_TEACH_Theft,"Повысить ловкость.",DIA_Maria_TEACH_Dex);
	var int Hero_PickpocketSkill; Hero_PickpocketSkill = Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET);
	if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_NONE)
	{
		Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_FIRST,-1),DIA_Maria_TEACH_Pickpocket1);
	}
	else if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_FIRST)
	{
		Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_SECOND,-1),DIA_Maria_TEACH_Pickpocket2);
	}
	else if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_SECOND)
	{
		Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_THIRD,-1),DIA_Maria_TEACH_Pickpocket3);
	};
	Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKLOCK,1,-1),DIA_Maria_TEACH_PickLock);
};
func void DIA_Maria_TEACH_Theft_info()
{
	AI_Output(other,self,"DIA_Maria_TEACH_Theft_15_00");	//Научи меня воровскому делу.
	DIA_Maria_TEACH_Theft_Menu();
};
func void DIA_Maria_TEACH_Theft_Back()
{
	Info_ClearChoices(DIA_Maria_TEACH_Theft);
};
// Взлом замков ------------------
func void DIA_Maria_TEACH_PickLock()
{
	AI_Output(other,self,"DIA_Maria_TEACH_PickLock_15_00");	//Научи меня вскрывать замки.
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK,1))
	{
		// Bla bla bla...
	};
	DIA_Maria_TEACH_Theft_Menu();
};
// Карманная кража ------------------
func void DIA_Maria_TEACH_Pickpocket1()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK,PICKPOCKET_LEVEL_FIRST))
	{
		// Bla bla bla...
	};
	DIA_Maria_TEACH_Theft_Menu();
};
func void DIA_Maria_TEACH_Pickpocket2()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK,PICKPOCKET_LEVEL_SECOND))
	{
		// Bla bla bla...
	};
	DIA_Maria_TEACH_Theft_Menu();
};
func void DIA_Maria_TEACH_Pickpocket3()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK,PICKPOCKET_LEVEL_THIRD))
	{
		// Bla bla bla...
	};
	DIA_Maria_TEACH_Theft_Menu();
};
// Ловкость ------------------
func void DIA_Maria_TEACH_Dex_Menu()
{
	Info_ClearChoices(DIA_Maria_TEACH_Theft);
	Info_AddChoice(DIA_Maria_TEACH_Theft,Dialog_Back,DIA_Maria_TEACH_Theft_Back);
	Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,1,-1),DIA_Maria_TEACH_Theft_Dex_1);
	Info_AddChoice(DIA_Maria_TEACH_Theft,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,5,-1),DIA_Maria_TEACH_Theft_Dex_5);
};
func void DIA_Maria_TEACH_Dex()
{
	AI_Output(other,self,"DIA_Maria_TEACH_Dex_15_00");	//Я бы хотел повысить свою ловкость.
	DIA_Maria_TEACH_Dex_Menu();
};
func void DIA_Maria_TEACH_Dex_DoIt(var int points)
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,points,T_MAX);
	DIA_Maria_TEACH_Dex_Menu();
};
func void DIA_Maria_TEACH_Theft_Dex_1()
{
	DIA_Maria_TEACH_Dex_DoIt(1);
};
func void DIA_Maria_TEACH_Theft_Dex_5()
{
	DIA_Maria_TEACH_Dex_DoIt(5);
};

//"Мне нужно платье." - появляется, если взят квест "Платье"
// nr = 1

instance DIA_Maria_Dress4Sue(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 1;
	condition = DIA_Maria_Dress4Sue_condition;	
	information = DIA_Maria_Dress4Sue_info;
	description = "Мне нужно платье.";
	permanent = FALSE;
};

func int DIA_Maria_Dress4Sue_condition()
{
	if (MIS_DS2P_Dress4Sue == Log_Running)
	{	
		return TRUE;	
	};
};

func void DIA_Maria_Dress4Sue_info()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_15_00");	//Мне нужно платье.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_13_01");	//А зачем оно ТЕБЕ?
	Info_ClearChoices(DIA_Maria_Dress4Sue);
	Info_AddChoice(DIA_Maria_Dress4Sue,"Пиратка Сью попросила.",DIA_Maria_Dress4Sue_Sue);
	Info_AddChoice(DIA_Maria_Dress4Sue,"Никки попросила. У нее оно порвалось.",DIA_Maria_Dress4Sue_Nikki);
	Info_AddChoice(DIA_Maria_Dress4Sue,"Жена попросила привезти ей из поездки какой-нибудь подарок.",DIA_Maria_Dress4Sue_Wife);
	Info_AddChoice(DIA_Maria_Dress4Sue,"Хочу примерить.",DIA_Maria_Dress4Sue_Me);
};

// Запускается, если выбрать реплику "Хочу примерить" в диалоге Марии "Мне нужно платье."

func void DIA_Maria_Dress4Sue_Me()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Me_15_00");	//Хочу примерить.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Me_13_01");	//Знаешь-ка что, дружок. Иди, пожалуйста, отсюда подобру-поздорову. Я с такими, как ты, не хочу иметь никаких дел.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,Log_Running,TOPIC_DS2P_Dress4Sue_InProgress_01);
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Жена попросила привезти ей из поездки какой-нибудь подарок." в диалоге Марии "Мне нужно платье."

func void DIA_Maria_Dress4Sue_Wife()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Wife_15_00");	//Жена попросила привести ей из поездки какой-нибудь подарок.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Wife_13_01");	//И почему я тебе не верю? Убирайся!
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,Log_Running,TOPIC_DS2P_Dress4Sue_InProgress_01);
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Никки попросила. У нее оно порвалось." в диалоге Марии "Мне нужно платье."

func void DIA_Maria_Dress4Sue_Nikki()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Nikki_15_00");	//Никки попросила. У нее оно порвалось.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Nikki_13_01");	//Не ври мне. У Никки этих платьев, что блох на собаке.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,Log_Running,TOPIC_DS2P_Dress4Sue_InProgress_01);
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Пиратка Сью попросила." в диалоге Марии "Мне нужно платье."

func void DIA_Maria_Dress4Sue_Sue()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Sue_15_00");	//Пиратка Сью попросила.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Sue_13_01");	//Что?! Да никогда! Никогда я не продам этой пиратской подстилке что-то из своих вещей!
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Sue_15_02");	//Но почему?
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Sue_13_03");	//Потому что эти пираты заняли нашу деревню, убивают наших односельчан, а я еще должна торговать с ними? Да ни в жизнь!
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Sue_15_04");	//Мария, послушай. Сью могла бы принудить тебя отдать ей платье и даже бы ничего тебе не заплатила. Но она готова расстаться с деньгами и не портить и без того плохие отношения с вами.
	AI_Output(other,self,"DIA_Maria_Dress4Sue_Sue_15_05");	//Кроме того подумай вот о чем: ты женщина, тебе было бы приятно постоянно ходить в штанах и куртке? Нет! Вот и Малышке Сью тоже не нравится, но она терпит.
	AI_Output(self,other,"DIA_Maria_Dress4Sue_Sue_13_06");	//Хм, возможно ты и прав, чужеземец. Эмоции говорят за меня. Ладно, я продам ей платье. Но за 200 золотых. И ни монетой меньше.
	Info_ClearChoices(DIA_Maria_Dress4Sue);
	Info_AddChoice(DIA_Maria_Dress4Sue,"У меня пока нет такой суммы, но я принесу.",DIA_Maria_Dress4Sue_NoGold);
	Info_AddChoice(DIA_Maria_Dress4Sue,"Вот, держи деньги.",DIA_Maria_Dress4Sue_HaveGold);
};

// Запускается, если выбрать реплику "Вот, держи деньги." в диалоге марии "Мне нужно платье."

func void DIA_Maria_Dress4Sue_HaveGold()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_HaveGold_15_00");	//Вот, держи деньги.
	if (Npc_HasItems(other,ItMi_Gold) >= 200)    // Если у ГГ есть 200 золотых
	{
		AI_Output(self,other,"DIA_Maria_Dress4Sue_HaveGold_13_01");	//Хорошо, вот платье.
		// Создаем платье в инвентаре Марии и отдаем ГГ
		CreateInvItems(self,0,1); // UNFINISHED - Надо вставить код платья
		B_GiveInvItems(self,other,0,1); // UNFINISHED - Надо вставить код платья
		B_GiveInvItems(other,self,ItMi_Gold,200); // Отдаем 200 золотых Марии
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Dress4Sue_HaveGold_13_02");	//Двести монет, чужеземец, ровно двести.
		Maria_KnowAboutDress = TRUE;
	};
	Info_ClearChoices(DIA_Maria_Dress4Sue);
};

//UNFINISWHED
func void DIA_Maria_Dress4Sue_NoGold()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_NoGold_15_00");	//У меня пока нет такой суммы, но я принесу.
	Info_ClearChoices(DIA_Maria_Dress4Sue);
};

//"Вот, держи деньги." - появляется, если взят квест "Платье", и Мария готова продать платье ГГ
// nr = 1

instance DIA_Maria_SellDress(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 1;
	condition = DIA_Maria_SellDress_condition;	
	information = DIA_Maria_SellDress_info;
	description = "Вот, держи деньги.";
	permanent = TRUE;
};

func int DIA_Maria_SellDress_condition()
{
	if ((MIS_DS2P_Dress4Sue == Log_Running) && Maria_KnowAboutDress)
	{	
		return TRUE;	
	};
};

func void DIA_Maria_SellDress_info()
{
	AI_Output(other,self,"DIA_Maria_Dress4Sue_HaveGold_15_00");	//Вот, держи деньги.
	if (Npc_HasItems(other,ItMi_Gold) >= 200)    // Если у ГГ есть 200 золотых
	{
		AI_Output(self,other,"DIA_Maria_Dress4Sue_HaveGold_13_01");	//Хорошо, вот платье.
		// Создаем платье в инвентаре Марии и отдаем ГГ
		CreateInvItems(self,0,1); // UNFINISHED - Надо вставить код платья
		B_GiveInvItems(self,other,0,1); // UNFINISHED - Надо вставить код платья
		B_GiveInvItems(other,self,ItMi_Gold,200); // Отдаем 200 золотых Марии
		Maria_KnowAboutDress = FALSE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_Dress4Sue,LOG_MISSION,LOG_Running,TOPIC_DS2P_Dress4Sue_InProgress_02);
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Dress4Sue_HaveGold_13_02");	//Двести монет, чужеземец, ровно двести.
	};
};

//Активируется на следующий день, после выполнения квеста "Найти сбежавших охотников"
// nr = 1

instance DIA_Maria_AfterEscapedHunters(C_Info)
{
	npc = BAU_106_DS2P_Maria;
	nr = 1;
	condition = DIA_Maria_AfterEscapedHunters_condition;	
	information = DIA_Maria_AfterEscapedHunters_info;
	description = "Чего плачешь?";
};

func int DIA_Maria_AfterEscapedHunters_condition()
{
	if ((MIS_DS2P_FindEscapedHunters == LOG_Success) && (EscapedHunters_QuestComplete - Wld_GetDay() >= 1))
	{	
		return TRUE;	
	};
};

func void DIA_Maria_AfterEscapedHunters_info()
{
	AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_00");	//Чего плачешь?
	AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_01");	//(всхлипывая) Они… они убили его… убили моего Густава… уби-и-или…
	if (Hunters_IsNotKilled == FALSE) // Если убили охотников
	{
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_02");	//Не плач, такое надо просто пережить. Пережить, чтобы однажды отомстить.
		AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_03");	//Да, ты, наверное, прав. Но все равно… очень тяжело. Столько лет прожить вместе.
		AI_StopProcessInfos(self);
	}
	else // Если не убили охотников
	{
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_04");	//Вообще-то я не должен этого говорить.
		AI_PlayAni(other,"T_SEARCH");
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_05");	//(шепотом) Густав и остальные живы. Мы с парнями сфальсифицировали их смерть. Зато теперь пираты полностью уверены в их смерти и не ищут их.
		AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_06");	//Правда? Ты не врешь?
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_07");	//Посмертием своим клянусь! Я сам лично только недавно доказывал Гарду, что они все мертвы.
		AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_08");	//Благослови тебя Иннос! Это самая радостная новость в моей жизни.
		AI_Output(other,self,"DIA_Maria_AfterEscapedHunters_15_09");	//Только молчи об этом. Не говори даже своим, пираты могут случайно подслушать. Я бы и тебе не сказал, но уж больно ты убивалась. И изобрази, пожалуйста, скорбь, а то ты вся светишься.
		AI_Output(self,other,"DIA_Maria_AfterEscapedHunters_13_10");	//Конечно, я буду молчать. Ради Густава. Спасибо тебе.
		AI_StopProcessInfos(self);
	};
};
	