//*--------------------------------------------------------------------
//*---------   ДЖЕК НА КОРАБЛЕ на стартовой локе		-------------------
//*--------------------------------------------------------------------
prototype DIA_Jack_EXIT(C_Info)
{
	npc = none_11_Jack;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Jack_EXIT_condition;	
	information = DIA_Jack_EXIT_info;
	description = Dialog_Ende;
};
instance DIA_Jack_EXIT_pre(DIA_Jack_EXIT){npc = pre_none_11_Jack;};
instance DIA_Jack_EXIT_main(DIA_Jack_EXIT){};
func int DIA_Jack_EXIT_condition(){	return TRUE;};
func void DIA_Jack_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Jack_PreStart(C_Info)	//Начальный диалог на корабле
{
	npc = pre_none_11_Jack;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jack_PreStart_condition;	
	information = DIA_Jack_PreStart_info;
	description = "Нам нужно срочно найти остров.";
};
func int DIA_Jack_PreStart_condition(){	return TRUE;};
func void DIA_Jack_PreStart_info()
{	
	AI_Output(other,self,"DIA_Jack_PreStart_15_00");	//Нам нужно срочно найти остров. Еще пару дней, и управлять кораблем будет некому.
	AI_Output(self,other,"DIA_Jack_PreStart_11_00");	//Кто сегодня?
	AI_Output(other,self,"DIA_Jack_PreStart_15_01");	//Горн. Он крепкий малый, но чума забрала и его.
	AI_Output(self,other,"DIA_Jack_PreStart_11_01");	//То есть нас осталось трое?! Не густо.
	AI_Output(self,other,"DIA_Jack_PreStart_11_02");	//Но за время путешествия вы уже немного подучились морскому ремеслу и даже уверенно передвигаетесь по палубе. (смеется)
	AI_Output(self,other,"DIA_Jack_PreStart_11_03");	//Думаю, у нас есть шанс доплыть до суши и при этом не разбить ”Эсмеральду” о рифы.
	AI_Output(self,other,"DIA_Jack_PreStart_11_04");	//Как раз пару часов назад мы проплывали небольшой остров. Я даже видел неподалеку от него рыбацкую шлюпку. А это значит, что он обитаем.
	AI_Output(other,self,"DIA_Jack_PreStart_15_02");	//Это наш последний шанс. Командуй, Джек!
	AI_Output(self,other,"DIA_Jack_PreStart_11_05");	//Свистать всех наверх!
	AI_StopProcessInfos(self);
};
//*--------------------------------------------------------------------
//*---------   ДЖЕК НА основной локе		-------------------------------
//*--------------------------------------------------------------------
instance DIA_Jack_Start(C_Info)	//Начальный диалог на корабле
{
	npc = none_11_Jack;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Jack_Start_condition;	
	information = DIA_Jack_Start_info;
	important = TRUE;
};
func int DIA_Jack_Start_condition(){	return TRUE;};
func void DIA_Jack_Start_info()
{	
	AI_Output(self,other,"DIA_Jack_Start_11_00");	//Похоже, нас встречают. И что-то мне подсказывает, что эта встреча будет не такой приятной.
	AI_Output(self,other,"DIA_Jack_Start_11_01");	//Ты посмотри на их рожи. Это же убийцы, я этот хищный взгляд ни с чем не спутаю после того случая с маяком.
	AI_Output(other,self,"DIA_Jack_Start_15_00");	//Ты прав, Джек, это пираты.
	AI_Output(self,other,"DIA_Jack_Start_11_02");	//(испуганно) Пираты? Лучше бы мы все передохли от чумы, разрази меня гром!
	AI_Output(other,self,"DIA_Jack_Start_15_01");	//Ладно, еще не все потеряно, пошли!
	AI_StopProcessInfos(self);
};
//
instance DIA_Jack_GoToPirates(C_Info)	//Постоянный диалог до стартового с пиратом Грегом
{
	npc = none_11_Jack;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Jack_GoToPirates_condition;	
	information = DIA_Jack_GoToPirates_info;
	description = "Если что-то пойдет не так...";
};
func int DIA_Jack_GoToPirates_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Jack_Start) && !Npc_KnowsInfo(other,DIA_Greg_Start))
	{	return TRUE;	};
};
func void DIA_Jack_GoToPirates_info()
{	
	AI_Output(other,self,"DIA_Jack_GoToPirates_15_00");	//Если что-то пойдет не так... По моему сигналу...
	AI_Output(self,other,"DIA_Jack_GoToPirates_11_00");	//Я все понял. Ты можешь положиться на меня.
	AI_StopProcessInfos(self);
};
//
instance DIA_Jack_WhatDoYouThink_Const(C_Info)	//Первый (постоянный) диалог после стартового с пиратом Грегом
{
	npc = none_11_Jack;
	nr = 998;
	permanent = TRUE;
	condition = DIA_Jack_WhatDoYouThink_Const_condition;	
	information = DIA_Jack_WhatDoYouThink_Const_info;
	description = "Что ты об этом думаешь?";
};
func int DIA_Jack_WhatDoYouThink_Const_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Jack_WhatDoYouThink_Const_info()
{	
	AI_Output(other,self,"DIA_Jack_WhatDoYouThink_Const_15_00");	//Что ты об этом думаешь?
	AI_Output(self,other,"DIA_Jack_WhatDoYouThink_Const_11_00");	//Я думаю, что мы оказались в большой заднице! И выбраться из нее будет очень трудно.
};
instance DIA_Jack_INeedSupplies(C_Info)	//Мне нужны припасы.
{
	npc = none_11_Jack;
	nr = 997;
	permanent = FALSE;
	condition = DIA_Jack_INeedSupplies_condition;	
	information = DIA_Jack_INeedSupplies_info;
	description = "Мне нужны припасы.";
};
func int DIA_Jack_INeedSupplies_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Jack_INeedSupplies_info()
{	
	AI_Output(other,self,"DIA_Jack_INeedSupplies_15_00");	//Мне нужны припасы.
	AI_Output(self,other,"DIA_Jack_INeedSupplies_11_00");	//Посмотри в трюме, в сундуках. Я перенес туда еду, немного зелий и оружия.
	AI_Output(self,other,"DIA_Jack_INeedSupplies_11_01");	//Остальное, как ты помнишь, мы разгрузили на Южных Островах. Кто бы мог подумать, что все так обернется.
};
instance DIA_Jack_HowDoYouFeel(C_Info)	//Как ты себя чувствуешь?
{
	npc = none_11_Jack;
	nr = 996;
	permanent = FALSE;
	condition = DIA_Jack_HowDoYouFeel_condition;	
	information = DIA_Jack_HowDoYouFeel_info;
	description = "Как ты себя чувствуешь?";
};
func int DIA_Jack_HowDoYouFeel_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Jack_HowDoYouFeel_info()
{	
	AI_Output(other,self,"DIA_Jack_HowDoYouFeel_15_00");	//Как ты себя чувствуешь?
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_00");	//Пока держусь.
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_01");	//Ты знаешь, эта неопределённость просто выматывает. Одно дело, когда ты знаешь: вот твой противник – дерись или умрешь; и совсем другое – когда врага нельзя увидеть, почувствовать.
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_02");	//Не знаешь, когда получишь удар в спину.
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_03");	//Как бы я не относился к пиратам, они хотя бы состоят из плоти и крови, и у тебя есть хоть маленький, но шанс выжить. А тут...
	AI_Output(other,self,"DIA_Jack_HowDoYouFeel_15_01");	//Мы обязательно что-нибудь придумаем, Джек. А пока, может, тебе покинуть корабль? Я неподалеку видел рыбацкий домик.
	AI_Output(self,other,"DIA_Jack_HowDoYouFeel_11_04");	//Да, наверное, ты прав. Теперь от меня толку мало.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(self,"START");	//Уходит жить в домик рыбака.
};
instance DIA_Jack_IsShipReadyToSail(C_Info)	//Корабль готов отплытию? (постоянный)
{
	npc = none_11_Jack;
	nr = 995;
	permanent = TRUE;
	condition = DIA_Jack_IsShipReadyToSail_condition;	
	information = DIA_Jack_IsShipReadyToSail_info;
	description = "Корабль готов отплытию?";
};
func int DIA_Jack_IsShipReadyToSail_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Greg_Start02))
	{	return TRUE;	};
};
func void DIA_Jack_IsShipReadyToSail_info()
{	
	AI_Output(other,self,"DIA_Jack_IsShipReadyToSail_15_00");	//Корабль готов отплытию?
	AI_Output(self,other,"DIA_Jack_IsShipReadyToSail_11_00");	//Если не считать, что там гуляет смерть, и нет команды, то да, готов. Немного провизии и еды, и можно отчаливать.
};
//
//Если у рыбака живёт, то периодически раз в два дня даёт ГГ рыбы
//
instance DIA_Jack_FishAsGift(C_Info)
{
	npc = none_11_Jack;
	nr = 990;
	permanent = TRUE;
	condition = DIA_Jack_FishAsGift_condition;	
	information = DIA_Jack_FishAsGift_info;
	important = TRUE;
};
func int DIA_Jack_FishAsGift_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Jack_HowDoYouFeel) && (Wld_GetDay() > 2) && (Wld_GetDay() > (Jack_GiveFish_Day + 1)) 
	&& Npc_IsInState(self,ZS_Talk) && Wld_IsTime(7,0,22,0))
	{	return TRUE;	};
};
func void DIA_Jack_FishAsGift_info()
{	
	AI_Output(self,other,"DIA_Jack_FishAsGift_11_00");	//Вот, я наловил немного рыбы. Держи, думаю, тебе пригодится.
	var int x, var int y;  x = Hlp_Random(4) + 2; y = Hlp_Random(x+1);
	B_GiveInvItem_Red(self,other,ItFo_DS2P_FishSea_1,x-y,34);
	B_GiveInvItem_Red(self,other,ItFo_DS2P_FishSea_2,y,37);
};



