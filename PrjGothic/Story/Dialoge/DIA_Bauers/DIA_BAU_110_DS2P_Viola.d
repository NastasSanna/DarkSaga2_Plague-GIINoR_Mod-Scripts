instance DIA_Viola_EXIT(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Viola_EXIT_condition;	
	information = DIA_Viola_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Viola_EXIT_condition(){	return TRUE;};
func void DIA_Viola_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 01/07/2013 ===========
//  Стартовый 
//===========================
instance DIA_Viola_Start(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 0;
	condition = DIA_Viola_Start_condition;	
	information = DIA_Viola_Start_info;
	important = TRUE;
};
func int DIA_Viola_Start_condition()
{
	if (Npc_IsInState(self,ZS_Talk)){	return TRUE;};
};
func void DIA_Viola_Start_info()
{
		AI_Output(self,other,"DIA_Viola_Start_16_00");	//Почему ты не остановил его?! Ты же мог ее спасти! (плачет) Бедная Кара...
	AI_Output(other,self,"DIA_Viola_Start_15_01");	//Прости, я не знал, что он убьет ее. Мне жаль.
		AI_Output(self,other,"DIA_Viola_Start_16_02");	//Да, ты прав. Прости меня тоже. Ты не виноват, что этот сукин сын сотворил, будь он проклят!
		AI_Output(self,other,"DIA_Viola_Start_16_03");	//Если увидишь Кадара, скажи ему, что случилось. Он должен знать.
};


//NS - 01/07/2013 ===========
//  Знакомство 
//===========================
//"Как тебя зовут?"		nr = 1
instance DIA_Viola_WhatsUrName(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 1;
	condition = DIA_Viola_WhatsUrName_condition;	
	information = DIA_Viola_WhatsUrName_info;
	description = "Как тебя зовут?";
};
func int DIA_Viola_WhatsUrName_condition(){	return TRUE;};
func void DIA_Viola_WhatsUrName_info()
{
	AI_Output(other,self,"DIA_Viola_WhatsUrName_15_00");	//Как тебя зовут?
		AI_Output(self,other,"DIA_Viola_WhatsUrName_16_01");	//Прости, я не представилась. Меня зовут Виола, я жена Джина, охотника деревни.
};


//NS - 01/07/2013 ===========
//  После знакомства
//===========================
//"Чем ты занималась раньше?"		nr = 1
instance DIA_Viola_WhatWasUrJob(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 1;
	condition = DIA_Viola_WhatWasUrJob_condition;	
	information = DIA_Viola_WhatWasUrJob_info;
	description = "Чем ты занималась раньше?";
};
func int DIA_Viola_WhatWasUrJob_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_WhatWasUrJob_info()
{
	AI_Output(other,self,"DIA_Viola_WhatWasUrJob_15_00");	//Чем ты занималась раньше?
		AI_Output(self,other,"DIA_Viola_WhatWasUrJob_16_01");	//До того, как приплыли пираты, я работала в поле, помогала Хуно обрабатывать землю, собирать пшеницу.
		AI_Output(self,other,"DIA_Viola_WhatWasUrJob_16_02");	//А по вечерам вместе с Марией и Карой готовила нашим мужьям вкусные ужины. Хорошие были времена.
};
//----------------------------------------------
//"Кто такой Кадар?"		nr = 3
// если еще не знаем его
instance DIA_Viola_WhosKadar(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 3;
	condition = DIA_Viola_WhosKadar_condition;	
	information = DIA_Viola_WhosKadar_info;
	description = "Кто такой Кадар?";
};
func int DIA_Viola_WhosKadar_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName) && Npc_KnowsInfo(other,DIA_Kadar_WhoAU))
	{	return TRUE;};
};
func void DIA_Viola_WhosKadar_info()
{
	AI_Output(other,self,"DIA_Viola_WhosKadar_15_00");	//Кто такой Кадар?
		AI_Output(self,other,"DIA_Viola_WhosKadar_16_01");	//Это староста нашей деревни и муж Кары. Теперь уже бывший муж...
		AI_Output(self,other,"DIA_Viola_WhosKadar_16_02");	//Мы выбрали его на совете, который происходит раз в пять лет. Кадар спокойный, уравновешенный человек. Никогда ни на кого не кричит, старается сгладить все острые моменты.
		AI_Output(self,other,"DIA_Viola_WhosKadar_16_03");	//Также он хороший организатор, следит, чтобы в деревне всегда было достаточно провианта, шкур, инструментов. В общем, я считаю его очень хорошим человеком.
};
//----------------------------------------------
//"Пираты убили Кадара."	(+опыт)		nr = 3
instance DIA_Viola_KadarDead(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 3;
	condition = DIA_Viola_KadarDead_condition;	
	information = DIA_Viola_KadarDead_info;
	description = "Пираты убили Кадара.";
};
func int DIA_Viola_KadarDead_condition()
{
	//UNFINISHED вписать диалог, когда Кадара убивают
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_KadarDead_info()
{
	AI_Output(other,self,"DIA_Viola_KadarDead_15_00");	//Пираты убили Кадара. 
	//(+опыт)
	B_GivePlayerXP(XP_News_KadarDead);
		AI_Output(self,other,"DIA_Viola_KadarDead_16_01");	//(со слезами на глазах) Как?.. О Иннос! Почему? За что?
	AI_Output(other,self,"DIA_Viola_KadarDead_15_02");	//Он хотел отомстить за свою жену и поплатился за это. Гард убил его.
		AI_Output(self,other,"DIA_Viola_KadarDead_16_03");	//Будь проклят этот Гард, будь прокляты все эти мерзкие пираты! Иннос накажет их за все! (плачет)
};


//NS - 01/07/2013 ===========
//  По квесту "Амулет для Джина" 
//===========================
//"Ты знаешь, где искать охотников?"		nr = 2
instance DIA_Viola_WhereAHunters(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 2;
	condition = DIA_Viola_WhereAHunters_condition;	
	information = DIA_Viola_WhereAHunters_info;
	description = "Ты знаешь, где искать охотников?";
};
func int DIA_Viola_WhereAHunters_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_WhereAHunters_info()
{
	var int x;
	AI_Output(other,self,"DIA_Viola_WhereAHunters_15_00");	//Ты знаешь, где искать охотников?
		AI_Output(self,other,"DIA_Viola_WhereAHunters_16_01");	//Увы, нет. Перед нападением Джин с Томом и Фартом ушли на охоту. Больше я никого из них не видела. Я надеюсь, с ними все в порядке!
		AI_Output(self,other,"DIA_Viola_WhereAHunters_16_02");	//Послушай, если встретишь Джина, передай ему этот амулет и скажи ему, что я люблю его.
	//Дает «Амулет Виолы» +5 к лукам и +5 к ловкости
	x = 1; if (x == 1)	{
		B_GiveInvItems(self,other,ItAm_DS2P_Viola,1);
	};
		AI_Output(self,other,"DIA_Viola_WhereAHunters_16_03");	//Это был его свадебный подарок. Он сказал, что амулет зачарованный и всегда будет охранять меня от невзгод и опасностей. Я думаю, что Джину он сейчас более необходим.
	AI_Output(other,self,"DIA_Viola_WhereAHunters_15_04");	//Я обязательно передам амулет.

	//Запись в дневнике "Амулет для Джина" 
	B_DSG_Log_OpenClose(TOPIC_DS2P_Amulette4Jinn,LOG_MISSION,LOG_Running,TOPIC_DS2P_Amulette4Jinn_Start);
};


//NS - 01/07/2013 ===========
//  По квесту "Доставка припасов"
//===========================
//"Я принес припасы." (+опыт)		nr = 2
instance DIA_Viola_GiveSupplies(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 2;
	condition = DIA_Viola_GiveSupplies_condition;	
	information = DIA_Viola_GiveSupplies_info;
	description = "Я принес припасы.";
};
func int DIA_Viola_GiveSupplies_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName) && Npc_HasItems(other,ItMi_DS2P_Packet_ProductSupplies))
	{	return TRUE;};
};
func void DIA_Viola_GiveSupplies_info()
{
	var int x;
	AI_Output(other,self,"DIA_Viola_GiveSupplies_15_00");	//Я принес припасы. 
	//(+опыт)
	B_GivePlayerXP(XP_MIS_ShippingSupplies);
		AI_Output(self,other,"DIA_Viola_GiveSupplies_16_01");	//Спасибо, но после случившегося у меня весь желудок скрутило. Вряд ли в ближайшее время я смогу что-нибудь съесть. 
	AI_Output(other,self,"DIA_Viola_GiveSupplies_15_02");	//Но без еды вы умрете.
		AI_Output(self,other,"DIA_Viola_GiveSupplies_16_03");	//Может быть, так оно будет и лучше... 
	AI_Output(other,self,"DIA_Viola_GiveSupplies_15_04");	//Не говори глупости. Я уверен, что как только у пиратов появится возможность, они уплывут с острова и оставят вас в покое.
	AI_Output(other,self,"DIA_Viola_GiveSupplies_15_05");	//Ты должна быть сильной, чтобы суметь дождаться этого радостного момента.
		AI_Output(self,other,"DIA_Viola_GiveSupplies_16_06");	//Ты так думаешь? Наверное, ты прав. Я возьму продукты.
	//Забирает припасы (если Йорн мертв, то выпивка остается у ГГ)
	x = 1; if (x == 1)	{
		B_DS_GiveRemoveItems(other,self,ItMi_DS2P_Packet_ProductSupplies,1);
	};
	//Запись в дневнике "Доставка припасов" //NS - отсебятина
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_FoodDelivered);
	//начинает готовить
	B_StartOtherRoutine(self, "COOKING");
	
	Viola_SuppliesGiven = TRUE;
};


//NS - 01/07/2013 ===========
//  Общие диалоги после знакомства
//===========================
//"Давно вы здесь сидите?"		nr = 4
instance DIA_Viola_HowLongAUThere(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 4;
	condition = DIA_Viola_HowLongAUThere_condition;	
	information = DIA_Viola_HowLongAUThere_info;
	description = "Давно вы здесь сидите?";
};
func int DIA_Viola_HowLongAUThere_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_HowLongAUThere_info()
{
	AI_Output(other,self,"DIA_Viola_HowLongAUThere_15_00");	//Давно вы здесь сидите?
		AI_Output(self,other,"DIA_Viola_HowLongAUThere_16_01");	//Да уже второй месяц. Меня уже тошнит от этой пещеры!
		AI_Output(self,other,"DIA_Viola_HowLongAUThere_16_02");	//Сначала они согнали сюда полдеревни, но через пару дней передумали и увели всех мужчин, кроме Нарева.
		AI_Output(self,other,"DIA_Viola_HowLongAUThere_16_03");	//Видать смекнули, что держать всех в одном месте опасно, да и кормить и поить их некому. Привыкли на всем готовом жить, гадины...
};
//----------------------------------------------
//"Расскажи о твоих друзьях."		nr = 5
instance DIA_Viola_AboutFriends(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 5;
	condition = DIA_Viola_AboutFriends_condition;	
	information = DIA_Viola_AboutFriends_info;
	description = "Расскажи о твоих друзьях.";
};
func int DIA_Viola_AboutFriends_condition()
{
	if(Npc_KnowsInfo(other,DIA_Viola_WhatsUrName))
	{	return TRUE;};
};
func void DIA_Viola_AboutFriends_info()
{
	AI_Output(other,self,"DIA_Viola_AboutFriends_15_00");	//Расскажи о твоих друзьях.
		AI_Output(self,other,"DIA_Viola_AboutFriends_16_01");	//Ты имеешь в виду моих друзей по несчастью? Да тут и рассказывать особо нечего.
		AI_Output(self,other,"DIA_Viola_AboutFriends_16_02");	//Лулу, жена Тома, как и я, работала в поле. Тихая, спокойная, скромная девушка. Ты это сразу поймешь, пообщавшись с ней.
		AI_Output(self,other,"DIA_Viola_AboutFriends_16_03");	//Нарев – наш долгожитель, хороший добродушный старик. Он уже давно не работает, здоровье не позволяет, но зато всегда может рассказать какую-нибудь очень забавную историю из своей жизни.
		AI_Output(self,other,"DIA_Viola_AboutFriends_16_04");	//Вся деревня уверена, что большую часть он выдумывает сходу, но на это никто не обращает внимания и все просто смеются, радуются, коротая долгие зимние вечера.
};

//Активируется, если взят квест "Письмо"
// nr = 1

instance DIA_Viola_WhereIsLulu(C_Info)
{
	npc = BAU_110_DS2P_Viola;
	nr = 5;
	permanent = FALSE;
	condition = DIA_Viola_WhereIsLulu_condition;	
	information = DIA_Viola_WhereIsLulu_info;
	description = "А где Лулу?";
};

func int DIA_Viola_WhereIsLulu_condition()
{
	if(MIS_DS2P_TomsLetter == Log_Running)
	{	
		return TRUE;
	};
};

func void DIA_Viola_WhereIsLulu_info()
{
	AI_Output(other,self,"DIA_Viola_WhereIsLulu_15_00");	//А где Лулу?
	AI_Output(self,other,"DIA_Viola_WhereIsLulu_16_01");	//Ее забрали пираты. Просто пришли и, невзирая на слезы и мольбы не трогать ее, уволокли, наградив парой затрещин.
	AI_Output(other,self,"DIA_Viola_WhereIsLulu_15_02");	//За что?
	AI_Output(self,other,"DIA_Viola_WhereIsLulu_16_03");	//Не сказали. Ответили лишь, что так надо, и гнусно захохотали. Ох, чувствую, недоброе они замыслили.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TomsLetter,LOG_MISSION,LOG_Running,TOPIC_DS2P_TomsLetter_LuluIsGone);
};
	
