instance DIA_Ado_EXIT(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Ado_EXIT_condition;	
	information = DIA_Ado_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Ado_EXIT_condition(){	return TRUE;};
func void DIA_Ado_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 01/05/2013 ===========
// Убийство Кары 
//===========================
instance DIA_Ado_KillKara(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 0;
	condition = DIA_Ado_KillKara_condition;	
	information = DIA_Ado_KillKara_info;
	important = TRUE;
};
func int DIA_Ado_KillKara_condition(){	return TRUE;};
func void DIA_Ado_KillKara_info()
{	
	var C_NPC Kara;	Kara = Hlp_GetNpc(BAU_112_DS2P_Kara);
	var C_NPC Ado;	Ado = Hlp_GetNpc(PIR_211_DS2P_Ado);
	TRIA_Invite(Kara);
	TRIA_Start();
	
	AI_TurnToNpc(self,Kara); Mdl_StartFaceAni(self, "S_ANGRY",1,-1);
	AI_TurnToNpc(Kara,self); Mdl_StartFaceAni(Kara, "S_ANGRY",1,-1);
	
	// self = Ado, other = Hero
	TRIA_Next(Ado);
	AI_Output(self,other, "DIA_Ado_KillKara_13_00");	//Ты что, дура набитая, решила со мной шутки шутить?! Мне плевать, что ты баба, мигом кишки выпущу!

	// self = Kara, other = Hero
	TRIA_Next(Kara);
	AI_Output(self,other, "DIA_Ado_KillKara_17_00");	//Да пошел ты к черту, ублюдок! Чтобы тебя черви сожрали!

	// self = Ado, other = Hero
	TRIA_Next(Ado);
	AI_Output(self,other, "DIA_Ado_KillKara_13_01");	//Еще одно слово...

	// self = Kara, other = Hero
	TRIA_Next(Kara);
	AI_Output(self,other, "DIA_Ado_KillKara_17_01");	//Клянусь Инносом, я не успокоюсь, пока не выцарапаю тебе глаза, прихвостень Белиара!

	// self = Ado, other = Hero
	TRIA_Next(Ado);
	AI_Output(self,other, "DIA_Ado_KillKara_13_02");	//Ты сама напросилась...

	DIAG_Reset();
	TRIA_Finish();
	// Адо нападает на Кару, она умирает с одного удара
	Mdl_StartFaceAni(self, "S_NEUTRAL",1,-1);
	Kara.flags = 0; Kara.attribute[ATR_HITPOINTS] = 1;
	B_StartOtherRoutine(self, "START");	// обычное расписание
	B_Attack(self,Kara, AR_KILL, 1);
	// только после этого ГГ может двигаться
	AI_StopProcessInfos(self);
};


//NS - 01/05/2013 ===========
// После убийтва Кары, ГГ принес еду (квест "Доставка припасов")
//===========================
instance DIA_Ado_Supplies(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 0;
	condition = DIA_Ado_Supplies_condition;	
	information = DIA_Ado_Supplies_info;
	important = TRUE;
};
func int DIA_Ado_Supplies_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_KillKara))
	{	return TRUE;	};
};
func void DIA_Ado_Supplies_info()
{	
	AI_Output(self,other, "DIA_Ado_Supplies_13_00");	//Чего вылупился? Она сама напросилась.
	//(обращается к остальным) 
	AI_TurnToNpc(self,BAU_110_DS2P_Viola); 
	AI_Output(self,other, "DIA_Ado_Supplies_13_01");	//Надеюсь, это будет для всех вас хорошим уроком!
	AI_TurnToNpc(self,other); 
		AI_Output(other,self, "DIA_Ado_Supplies_15_00");	//Он виновна лишь в том, что оскорбила тебя?
	AI_Output(self,other, "DIA_Ado_Supplies_13_02");	//Да мне плевать на ее слова. Эта вздорная баба подкралась ко мне, когда я задремал, и хотела задушить.
	AI_Output(self,other, "DIA_Ado_Supplies_13_03");	//А вот это уже совсем другое дело. Я не хочу отдавать душу Белиару из-за какой-то полоумной шлюхи!
	AI_Output(self,other, "DIA_Ado_Supplies_13_04");	//А ты как тут оказался, и кто ты вообще такой?
		AI_Output(other,self, "DIA_Ado_Supplies_15_01");	//Меня прислал Гард. Я принес еду для пленных.
	AI_Output(self,other, "DIA_Ado_Supplies_13_05");	//А, ты из деревни, еще один крестьянин. Отдай все Виоле, теперь она будет заниматься готовкой.
		AI_Output(other,self, "DIA_Ado_Supplies_15_02");	//Я не крестьянин.
	AI_Output(self,other, "DIA_Ado_Supplies_13_06");	//А кто тогда, черт тебя дери!
		AI_Output(other,self, "DIA_Ado_Supplies_15_03");	//Я недавно приплыл на остров, чтобы найти лекарство от чумы, охватившую мою команду.
	AI_Output(self,other, "DIA_Ado_Supplies_13_07");	//Так ты чумной. А ну пошел вон отсюда. Еще не хватало подцепить от тебя какую-нибудь заразу!
		AI_Output(other,self, "DIA_Ado_Supplies_15_04");	//Не бойся, я не болен.
	AI_Output(self,other, "DIA_Ado_Supplies_13_08");	//Надеюсь, что это так.
	// в дневник
	B_DSG_Log_OpenClose(TOPIC_DS2P_ShippingSupplies,LOG_MISSION,LOG_Running,TOPIC_DS2P_ShippingSupplies_KaraDead);
};


//NS - 01/05/2013 ===========
// После убийтва Кары, знакомство
//===========================
instance DIA_Ado_WhoAreU(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 0;
	condition = DIA_Ado_WhoAreU_condition;	
	information = DIA_Ado_WhoAreU_info;
	description = "Я так понимаю, ты Адо.";
};
func int DIA_Ado_WhoAreU_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_Supplies))
	{
		return TRUE;
	};
};

func void DIA_Ado_WhoAreU_info()
{	
	AI_Output(other,self, "DIA_Ado_WhoAreU_15_00");	//Я так понимаю, ты Адо.
	AI_Output(self,other, "DIA_Ado_WhoAreU_13_00");	//Сам догадался или кто подсказал?
	AI_Output(other,self, "DIA_Ado_WhoAreU_15_01");	//Сам.
	AI_Output(self,other, "DIA_Ado_WhoAreU_13_02");	//Ладно, не будем накалять наши отношения.
	AI_Output(self,other, "DIA_Ado_WhoAreU_13_03");	//Да, я Адо, один из членов абордажной команды капитана Гарда.
};


//NS - 01/05/2013 ===========
// После знакомства. Открывает квест "В поисках сокровищ"
//===========================
instance DIA_Ado_WhatJob(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 0;
	condition = DIA_Ado_WhatJob_condition;	
	information = DIA_Ado_WhatJob_info;
	description = "Чем ты занимаешься?";
};
func int DIA_Ado_WhatJob_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU))
	{	return TRUE;	};
};
func void DIA_Ado_WhatJob_info()
{	
	AI_Output(other,self, "DIA_Ado_WhatJob_15_00");	//Чем ты занимаешься?
		AI_Output(self,other, "DIA_Ado_WhatJob_13_00");	//Тебе интересно, чем я занимаюсь кроме того, что выпускаю людям кишки? (смеется)
		AI_Output(self,other, "DIA_Ado_WhatJob_13_01");	//Я – профессиональный вор, один из лучших на Южных островах.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_02");	//Однажды мне даже удалось снять золотое ожерелье с шеи одной баронессы, а она не то, чтобы поднять панику, даже не заметила пропажу.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_03");	//Но тебе этого не понять, по глазам вижу, что ты чистоплюй, добренький, всех жалеешь, а если что натворишь, потом сожрешь себя сам. Совесть – страшный порок!
	AI_Output(other,self, "DIA_Ado_WhatJob_15_01");	//С чего ты взял?
		AI_Output(self,other, "DIA_Ado_WhatJob_13_04");	//Хочешь сказать, что это не так?
	AI_Output(other,self, "DIA_Ado_WhatJob_15_02");	//Испытай меня.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_05");	//Легко! В нашей команде есть один пират, да не просто пират, а проклятый скелет.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_06");	//Увидишь его сразу в штаны наделаешь. (громко смеется) Зовут его Лан-скелет.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_07");	//Так вот, этот бедолага попал в передрягу. Он с командой решил на дармовщинку захапать кучу золота, но вместо этого получил проклятие. Но суть не в этом.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_08");	//Хоть он и выглядит теперь как слуга Белиара, кое-что прихватить из сокровищ ему все-таки удалось.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_09");	//Одно из таких сокровищ - алмаз с мой кулак величиной - забрал Гард, а вот все остальное Лан где-то припрятал.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_10");	//Парни говорили, что видели у него несколько необычных старинных монет.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_11");	//Твоя задача – найти и принести их мне. Думаю, пятнадцати штук будет достаточно.
		AI_Output(self,other, "DIA_Ado_WhatJob_13_12");	//Если сделаешь это, я дам тебе один редкий кинжал.
	// в дневник
	B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_Running,TOPIC_DS2P_InSearchOfTreasure_Start);
};


//NS - 01/05/2013 ===========
// По квесту "В поисках сокровищ", обучение воровству
//===========================
instance DIA_Ado_WhereToStart(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 00;
	condition = DIA_Ado_WhereToStart_condition;	
	information = DIA_Ado_WhereToStart_info;
	description = "С чего мне начать?";
};
func int DIA_Ado_WhereToStart_condition()
{	
	if (MIS_DS2P_InSearchOfTreasure == LOG_Running)
	{	return TRUE;	};
};
func void DIA_Ado_WhereToStart_info()
{	
	AI_Output(other,self, "DIA_Ado_WhereToStart_15_00");	//С чего мне начать?
		AI_Output(self,other, "DIA_Ado_WhereToStart_13_01");	//Лан все-таки скелет, поэтому вряд ли будет таскать свое барахло с собой, все же повыпадет из костей. (громко смеется)
		AI_Output(self,other, "DIA_Ado_WhereToStart_13_02");	//Поэтому, я думаю, он зарыл свои богатства где-нибудь на острове. Тебе нужно только выяснить где.
		AI_Output(self,other, "DIA_Ado_WhereToStart_13_03");	//Я могу облегчить тебе задачу и подучить воровскому искусству, если у тебя есть золото, конечно.
	// в дневник
	B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_Running,TOPIC_DS2P_InSearchOfTreasure_Map);
	B_DSG_Log_OpenClose(TOPIC_PiratTeacher,LOG_NOTE,-1,"Адо может подучить меня воровскому искуству, за золото, конечно.");
	TEACH_Ado_Theft = TRUE;
	TEACH_Ado_Dex = TRUE;
};


//NS - 01/05/2013 ===========
// Завершение квеста "В поисках сокровищ", отдать 15 древних монет
//===========================
instance DIA_Ado_GiveTreasure(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 00;
	condition = DIA_Ado_GiveTreasure_condition;	
	information = DIA_Ado_GiveTreasure_info;
	description = "Я достал старинные монеты.";
};
func int DIA_Ado_GiveTreasure_condition()
{	
	if ((MIS_DS2P_InSearchOfTreasure == LOG_Running) && (Npc_HasItems(self, ItMi_OldCoin) >= 15))
	{	return TRUE;	};
};
func void DIA_Ado_GiveTreasure_info()
{	
	var int x;
	AI_Output(other,self, "DIA_Ado_GiveTreasure_15_00");	//Я достал старинные монеты.
	B_GivePlayerXP(XP_MIS_InSearchOfTreasure);
		AI_Output(self,other, "DIA_Ado_GiveTreasure_13_01");	//Я в тебе не сомневался. Давай их сюда. Смотри, какая огранка, как переливаются. Я наверняка получу за них кучу золота.
		AI_Output(self,other, "DIA_Ado_GiveTreasure_13_02");	//Парни говорили, что подобные монеты встречаются в Хоринисе, в долине рудников.
	x = 1;	if (x == 1)	//Забирает 15 древних монет
	{
		B_DS_GiveRemoveItems_Red(other,self,ItMi_OldCoin,15,34);
	};
	AI_Output(other,self, "DIA_Ado_GiveTreasure_15_03");	//Как насчет моей награды?
		AI_Output(self,other, "DIA_Ado_GiveTreasure_13_04");	//Да, конечно. Вот, держи этот кинжал. Он не раз спасал мне шкуру. Даже жалко с ним расставаться, но, думаю, оно того стоит.
		AI_Output(self,other, "DIA_Ado_GiveTreasure_13_05");	//Предупреждаю – будь с кинжалом острожен, на его лезвие нанесен яд. Поэтому, если ты не будешь осторожно с ним обращаться и порежешься, рана будет очень долго заживать.
	x = 2;	if (x == 2)	//Дает кинжал ”Укус гадюки” отравленный
	{
		B_GiveInvItem_red(self,other, ItMw_DS2P_ViperSting ,1,37);	// UNFINISHED вписать кинжал
	};
	// в дневник
	B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_SUCCESS,"");
};


//NS - 01/05/2013 ===========
// После знакомства, о пиратстве и Гарде
//===========================
instance DIA_Ado_WhyPirate(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 20;
	condition = DIA_Ado_WhyPirate_condition;	
	information = DIA_Ado_WhyPirate_info;
	description = "Как ты стал пиратом?";
};
func int DIA_Ado_WhyPirate_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU))
	{	return TRUE;	};
};
func void DIA_Ado_WhyPirate_info()
{	
	AI_Output(other,self, "DIA_Ado_WhyPirate_15_00");	//Как ты стал пиратом?
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_01");	//Да как и все - хотел много золота, славы, морских приключений. Романтика!
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_02");	//В жизни, конечно, все оказалось не так, как мечталось в детстве, но тоже неплохо.
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_03");	//С Гардом мы всегда получаем большую долю от общей добычи, достаточно выпивки и портовых шлюх. Что еще для счастья нужно?! (смеется)
	AI_Output(other,self, "DIA_Ado_WhyPirate_15_04");	//Гард – справедливый капитан?
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_05");	//Да, он очень жесткий, не терпит неповиновения, резок и скор на расправу, но если делать как он хочет - все будет в лучшем виде.
		AI_Output(self,other, "DIA_Ado_WhyPirate_13_06");	//Поэтому, мой тебе совет - никогда не перечь Гарду, если хочешь прожить подольше.
};


//NS - 01/05/2013 ===========
// После знакомства, про заложников
//===========================
instance DIA_Ado_WhyHostage(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 21;
	condition = DIA_Ado_WhyHostage_condition;	
	information = DIA_Ado_WhyHostage_info;
	description = "Почему вы удерживаете этих людей?";
};
func int DIA_Ado_WhyHostage_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU))
	{	return TRUE;	};
};
func void DIA_Ado_WhyHostage_info()
{	
	AI_Output(other,self, "DIA_Ado_WhyHostage_15_00");	//Почему вы удерживаете этих людей?
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_00");	//А ты сам еще не понял?
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_01");	//Эти крестьяне, конечно, не воины, и в случае чего мы быстро их урезоним, но зачем рисковать?!
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_02");	//Гард – не дурак и знает, что если разозлить даже безмозглого барана, он побежит на своих обидчиков, даже если их в десять раз больше. А здесь люди!
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_03");	//При этом часть из самых боеспособных мужиков деревни скрываются в лесу, и рано или поздно они захотят вернуться.
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_04");	//А они – опытные охотники и знают, зачем им луки и стрелы.
		AI_Output(self,other, "DIA_Ado_WhyHostage_13_05");	//В общем, считай, это наша дополнительная гарантия, что все будет идти именно так, как надо. (подмигивает)
};


//NS - 01/05/2013 ===========
// После знакомства, постоянный
//===========================
instance DIA_Ado_NotBored(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 22;
	condition = DIA_Ado_NotBored_condition;	
	information = DIA_Ado_NotBored_info;
	permanent = TRUE;
	description = "Тебе не надоело здесь сидеть?";
};
func int DIA_Ado_NotBored_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU))
	{	return TRUE;	};
};
func void DIA_Ado_NotBored_info()
{	
	AI_Output(other,self, "DIA_Ado_NotBored_15_00");	//Тебе не надоело здесь сидеть?
		AI_Output(self,other, "DIA_Ado_NotBored_13_00");	//А чем здесь плохо?
		AI_Output(self,other, "DIA_Ado_NotBored_13_01");	//Спишь сколько влезет, никто ничего с тебя не требует, жратву приносят. Плохо только, что выпивки мало. Ну да это я переживу.
		AI_Output(self,other, "DIA_Ado_NotBored_13_02");	//Так что считай, что я хорошо устроился! Ха! А теперь, когда я прирезал эту психанутую крестьянку, вообще можно не переживать о проблемах.
};


//NS - 01/05/2013 ===========
// После знакомства, смерть Йорна. Открывает квест "Охранники для пещеры"
//===========================
instance DIA_Ado_JornDead(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 30;
	condition = DIA_Ado_JornDead_condition;	
	information = DIA_Ado_JornDead_info;
	description = "Йорн убит.";
};
func int DIA_Ado_JornDead_condition()
{	
	if (Npc_KnowsInfo(other, DIA_Ado_WhoAreU) && Npc_IsDead(PIR_210_DS2P_Jorn))
	{	return TRUE;	};
};
func void DIA_Ado_JornDead_info()
{	
	AI_Output(other,self, "DIA_Ado_JornDead_15_00");	//Йорн убит.
	B_GivePlayerXP(XP_News_JornDead);
		AI_Output(self,other, "DIA_Ado_JornDead_13_01");	//Как убит? Когда?
	AI_Output(other,self, "DIA_Ado_JornDead_15_02");	//Совсем недавно. Ему просто не повезло.
		AI_Output(self,other, "DIA_Ado_JornDead_13_03");	//(взволновано) Это были охотники, они напали на пещеру?
	AI_Output(other,self, "DIA_Ado_JornDead_15_04");	//Не знаю, я просто видел труп у пещеры.
		AI_Output(self,other, "DIA_Ado_JornDead_13_05");	//Раздери тебя Белиар! Мне что-то не по душе, что я тут остался практически в одиночку сторожить этих баб.
		AI_Output(self,other, "DIA_Ado_JornDead_13_06");	//Слушай, сделай одолжение, сбегай к Грегу и попроси, чтобы он прислал ко мне людей.
	// варианты
	Info_ClearChoices(DIA_Ado_JornDead);
	Info_AddChoice(DIA_Ado_JornDead, "Я не мальчик на побегушках.", DIA_Ado_GuardsForCave_No);
	Info_AddChoice(DIA_Ado_JornDead, "Хорошо, сделаю, но золото вперед.", DIA_Ado_GuardsForCave_Yes);
};
func void DIA_Ado_GuardsForCave_No()
{	
	AI_Output(other,self, "DIA_Ado_GuardsForCave_No_15_00");	//Я не мальчик на побегушках.
		AI_Output(self,other, "DIA_Ado_GuardsForCave_No_13_01");	//Черт тебя дери! Ладно, Адо и сам справится!
};
func void DIA_Ado_GuardsForCave_Yes()
{	
	var int x;
	AI_Output(other,self, "DIA_Ado_GuardsForCave_Yes_15_00");	//Хорошо, сделаю, но золото вперед.
		AI_Output(self,other, "DIA_Ado_GuardsForCave_Yes_13_01");	//Хех! Пользуешься моментом. Ну ладно. Я бы сделал на твоем месте тоже самое.
		AI_Output(self,other, "DIA_Ado_GuardsForCave_Yes_13_02");	//Вот, держи двести монет. Только поторопись!
	x = 1;	if (x == 1)	// Дает 200 монет
	{
		B_GiveInvItems(self,other, ItMi_Gold, 200);
	};
	// в дневник
	B_DSG_Log_OpenClose(TOPIC_DS2P_GuardsForCave,LOG_MISSION,LOG_Running,TOPIC_DS2P_GuardsForCave_Start);
};

// UNFINISHED Обучение воровств

//NS - 27/06/2013 =========================================================
// ОБУЧЕНИЕ 
// Учит за очки опыта и золото
//=========================================================================
// ВОРОВСТВО ------------------
instance DIA_Ado_TEACH_Theft(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 500;
	condition = DIA_Ado_TEACH_Theft_condition;	
	information = DIA_Ado_TEACH_Theft_info;
	description = "Научи меня воровскому делу.";
	permanent = TRUE;
};
func int DIA_Ado_TEACH_Theft_condition()
{
	if (TEACH_Ado_Theft == TRUE)
	{	return TRUE;	};
};
func void DIA_Ado_TEACH_Theft_Menu()
{
	Info_ClearChoices(DIA_Ado_TEACH_Theft);
	Info_AddChoice(DIA_Ado_TEACH_Theft,Dialog_Back,DIA_Ado_TEACH_Theft_Back);
	var int Hero_PickpocketSkill; Hero_PickpocketSkill = Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET);
	if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_NONE)
	{
		Info_AddChoice(DIA_Ado_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_FIRST,-1),DIA_Ado_TEACH_Pickpocket1);
	}
	else if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_FIRST)
	{
		Info_AddChoice(DIA_Ado_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_SECOND,-1),DIA_Ado_TEACH_Pickpocket2);
	}
	else if (Hero_PickpocketSkill == PICKPOCKET_LEVEL_SECOND)
	{
		Info_AddChoice(DIA_Ado_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKPOCKET,PICKPOCKET_LEVEL_THIRD,-1),DIA_Ado_TEACH_Pickpocket3);
	};
	Info_AddChoice(DIA_Ado_TEACH_Theft,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_PICKLOCK,1,-1),DIA_Ado_TEACH_PickLock);
};
func void DIA_Ado_TEACH_Theft_info()
{
	AI_Output(other,self,"DIA_Ado_TEACH_Theft_15_00");	//Научи меня воровскому делу.
	DIA_Ado_TEACH_Theft_Menu();
};
func void DIA_Ado_TEACH_Theft_Back()
{
	Info_ClearChoices(DIA_Ado_TEACH_Theft);
};
func void DIA_Ado_TEACH_Theft_DoIt(var int talent, var int lvl, var int price)
{
	if(Npc_HasItems(other,ItMi_Gold) >= price)
	{
		if(B_TeachThiefTalent(self,other,talent,lvl))
		{
			b_giveInvItems(other,self,ItMi_Gold,price);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ado_NoGold_13_00");	//У тебя недостаточно золота.
	};
	DIA_Ado_TEACH_Theft_Menu();
};
// UNFINISHED добавить цены
func void DIA_Ado_TEACH_Pickpocket1()
{
	DIA_Ado_TEACH_Theft_DoIt(NPC_TALENT_PICKPOCKET,1,0);
};
func void DIA_Ado_TEACH_Pickpocket2()
{
	DIA_Ado_TEACH_Theft_DoIt(NPC_TALENT_PICKPOCKET,2,0);
};
func void DIA_Ado_TEACH_Pickpocket3()
{
	DIA_Ado_TEACH_Theft_DoIt(NPC_TALENT_PICKPOCKET,3,0);
};
func void DIA_Ado_TEACH_PickLock()
{
	DIA_Ado_TEACH_Theft_DoIt(NPC_TALENT_PICKLOCK,0,0);
};
// ЛОВКОСТЬ ------------------
instance DIA_Ado_TEACH_Dex(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 501;
	condition = DIA_Ado_TEACH_Dex_condition;	
	information = DIA_Ado_TEACH_Dex_info;
	description = "Я хочу повысить локвость.";
	permanent = TRUE;
};
func int DIA_Ado_TEACH_Dex_condition()
{
	if (TEACH_Ado_Dex == TRUE)
	{	return TRUE;	};
};
func void DIA_Ado_TEACH_Dex_Menu()
{
	Info_ClearChoices(DIA_Ado_TEACH_Dex);
	Info_AddChoice(DIA_Ado_TEACH_Dex,Dialog_Back,DIA_Ado_TEACH_Dex_Back);
	Info_AddChoice(DIA_Ado_TEACH_Dex,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,1,-1),DIA_Ado_TEACH_Dex_1);
	Info_AddChoice(DIA_Ado_TEACH_Dex,b_Ds_buildString_TeachPayment_Attr(other,"",ATR_DEXTERITY,5,-1),DIA_Ado_TEACH_Dex_5);
};
func void DIA_Ado_TEACH_Dex_info()
{
	AI_Output(other,self,"DIA_Ado_TEACH_Dex_15_00");	//Я хочу повысить ловкость.
	DIA_Ado_TEACH_Dex_Menu();
};
func void DIA_Ado_TEACH_Dex_Back()
{
	Info_ClearChoices(DIA_Ado_TEACH_Theft);
};
func void DIA_Ado_TEACH_Dex_DoIt(var int points)
{
	var int cost;
	cost = b_ds_GetTeachAtrPaymentAmount(other,ATR_DEXTERITY,points);
	if(Npc_HasItems(other,ItMi_Gold) >= cost)
	{
		if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,points,T_MAX))
		{
			b_giveInvItems(other,self,ItMi_Gold,cost);
			B_DS_ClearGold();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ado_NoGold_13_00");	//У тебя недостаточно золота.
	};
	DIA_Ado_TEACH_Dex_Menu();
};
func void DIA_Ado_TEACH_Dex_1()
{
	DIA_Ado_TEACH_Dex_DoIt(1);
};
func void DIA_Ado_TEACH_Dex_5()
{
	DIA_Ado_TEACH_Dex_DoIt(5);
};

// Активируется, после первого разговора с Адо, и если Йорн не убит
// nr = 2
instance DIA_Ado_UAIsFunny(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 2;
	condition = DIA_Ado_UAIsFunny_condition;	
	information = DIA_Ado_UAIsFunny_info;
	description = "Что-то ты невесел.";
	permanent = FALSE;
};

func int DIA_Ado_UAIsFunny_condition()
{
	if (Npc_KnowsInfo(other,DIA_Ado_WhoAreU) && !Npc_IsDead(PIR_210_DS2P_Jorn))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_UAIsFunny_info()
{
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_00");	//Что-то ты невесел.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_01");	//А чему радоваться? Приходится целыми днями торчать здесь, охраняя это мясо. Да еще и этот увалень Йорн вечно подкалывает. Скотина!
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_02");	//А что случилось?
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_03");	//Да случилась тут у меня одна ситуация. Не важно, в общем. С тех самых пор он меня и подкалывает.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_04");	//Не обращай внимания, вот и все.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_05");	//(вздыхает) Трудно не обращать внимания на постоянные подначивания.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_06");	//Так побей его. Подойди и отделай его так, чтобы он долго еще кровью харкал.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_07");	//Эх, я бы и рад, да Йорн посильнее меня будет, не справиться мне с ним.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_08");	//Тогда сочувствую. Может, я могу помочь? Пойти и отдубасить его за скромную плату?
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_09");	//Нет, если ты будешь улаживать за меня мою проблему – я все же мужчина, – меня вся остальная команда уважать перестанет. Хотя у меня появилась идея, и в ее реализации мне понадобится твоя помощь.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_10");	//Рассказывай.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_11");	//Гард иногда любит ходить и проверять нас, чем мы заняты. Такое редко, но бывает. И если он увидит, что кто-то не выполняет его указаний, он взбесится настолько, что провинившемуся мало не покажется. 
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_12");	//Скоро наступит как раз такой день, и я хочу подставить Йорна.
	AI_Output(other,self,"DIA_Ado_UAIsFunny_15_13");	//Мне пока не ясно, что от меня требуется. Увести Йорна от его поста?
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_14");	//Почти, ты попросишь у местного алхимика зелье, выпив которое Йорн будет бегать в кусты каждую минуту, что-то вроде сильного слабительного. Только это зелье обязательно смешай с самогоном, чтобы он ничего не заподозрил. Хорошо?
	AI_Output(self,other,"DIA_Ado_UAIsFunny_13_15");	//Когда Гард придет и увидит, что Йорна нет на посту, он взбесится, и Йорну мало не покажется. Ты со мной?
	Info_ClearChoices(DIA_Ado_UAIsFunny);
	Info_AddChoice(DIA_Ado_UAIsFunny,"Нет.",DIA_Ado_UAIsFunny_No);
	Info_AddChoice(DIA_Ado_UAIsFunny,"Да.",DIA_Ado_UAIsFunny_Yes);
};

// Запускается, если выбрать реплику "Нет." в диалоге Адо "Что-то ты невесел."

func void DIA_Ado_UAIsFunny_No()
{
	AI_Output(other,self,"DIA_Ado_UAIsFunny_No_15_00");	//Нет, разбирайся сам.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_No_13_01");	//Тогда не отвлекай меня и вали прочь.
	AI_StopProcessInfos(self);
};

// Запускается, если выбрать реплику "Да." в диалоге Адо "Что-то ты невесел."

func void DIA_Ado_UAIsFunny_Yes()
{
	AI_Output(other,self,"DIA_Ado_UAIsFunny_Yes_15_00");	//Да, это будет небезынтересно.
	AI_Output(self,other,"DIA_Ado_UAIsFunny_Yes_13_01");	//Отлично, тогда вот тебе самогон. В него и нальешь слабительное, а потом дашь Йорну. Пару дней он точно промучается.
	// Создаем самогон в инвентаре Адо и отдаем ГГ
	CreateInvItems(self,ItFo_Samogon,1);
	B_GiveInvItems(self,other,ItFo_Samogon,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_Start);
	AI_StopProcessInfos(self);
};

// Активируется, после того, как Йорн выпьет самогон
// nr = 1

instance DIA_Ado_AfterDrinkSamogon(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AfterDrinkSamogon_condition;	
	information = DIA_Ado_AfterDrinkSamogon_info;
	description = "Все готово.";
	permanent = FALSE;
};

func int DIA_Ado_AfterDrinkSamogon_condition()
{
	if (Npc_KnowsInfo(other,DIA_Jorn_BringCimmSamogon) && (MIS_DS2P_ExposeJorn == Log_Running))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AfterDrinkSamogon_info()
{
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_15_00");	//Все готово. Йорн с удовольствием выпил самогон, смешанный со слабительным.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_13_01");	//Отлично! Уже через пару часов его неудержимо пронесет по кустам. Пару дней это должно продлиться. Ха-ха, жду не дождусь, когда Гард придет нас проверять!
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_15_02");	//Я закончил со своей частью.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_13_03");	//Ты, наверное, ждешь награду? У меня есть вот эта двуручная сабля, она, правда, старая, но все еще крепкая. Еще у меня есть меч для второй руки, сделанный специально под бой с двумя мечами. И щит, хороший кулачный щит. Что ты выберешь?
	Info_ClearChoices(DIA_Ado_AfterDrinkSamogon);
	Info_AddChoice(DIA_Ado_AfterDrinkSamogon,"Дай мне щит.",DIA_Ado_AfterDrinkSamogon_RewardShield);
	Info_AddChoice(DIA_Ado_AfterDrinkSamogon,"Дай мне меч под вторую руку.",DIA_Ado_AfterDrinkSamogon_Reward2x2);
	Info_AddChoice(DIA_Ado_AfterDrinkSamogon,"Дай мне саблю.",DIA_Ado_AfterDrinkSamogon_RewardSabre);
};

// Запускается, если ГГ выбрал реплику "Дай мне саблю." в диалоге Адо "Все готово."

func void DIA_Ado_AfterDrinkSamogon_RewardSabre()
{
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_RewardSabre_15_00");	//Дай мне саблю. Всегда больше тяготел к двуручному оружию.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_RewardSabre_13_01");	//Вот, держи. Он прошел со мной немало схваток, пока не нашел оружие получше.
	//Создаем саблю в инвентаре Адо и отдаем ГГ (UNFINISHED: надо создать предмет, и вставить код)
	CreateInvItems(self,0/*"SABRE_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"SABRE_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_Success);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};
	
// Запускается, если ГГ выбрал реплику "Дай мне меч для второй руки." в диалоге Адо "Все готово."

func void DIA_Ado_AfterDrinkSamogon_Reward2x2()
{
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_Reward2x2_15_00");	//Дай мне меч под вторую руку. Люблю драться парным оружием.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_Reward2x2_13_01");	//Вот, возьми. Это хороший меч, он не раз спасет тебе жизнь.
	//Создаем меч в инвентаре Адо и отдаем ГГ (UNFINISHED: надо создать предмет, и вставить код)
	CreateInvItems(self,0/*"2x2_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"2x2_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_Success);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};
	
// Запускается, если ГГ выбрал реплику "Дай мне щит." в диалоге Адо "Все готово."

func void DIA_Ado_AfterDrinkSamogon_RewardShield()
{
	AI_Output(other,self,"DIA_Ado_AfterDrinkSamogon_RewardShield_15_00");	//Дай мне щит. Защита – это наше все.
	AI_Output(self,other,"DIA_Ado_AfterDrinkSamogon_RewardShield_13_01");	//Вот он. Он мне достался в качестве приза на одном захваченном нами судне. Как ты понимаешь, в абордажной схватке щит – немного не то оружие, которое мечтает видеть у себя уважающий себя пират.
	//Создаем щит в инвентаре Адо и отдаем ГГ (UNFINISHED: надо создать предмет, и вставить код)
	CreateInvItems(self,0/*"SHIELD_INSTANCE"*/,1);
	B_GiveInvItems(self,other,0/*"SHIELD_INSTANCE"*/,1);
	B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_Running,TOPIC_DS2P_ExposeJorn_Success);
	B_GivePlayerXP(XP_MIS_ExposeJorn_Success);
	AI_StopProcessInfos(self);
};	
	
// Активируется, после того, как Йорн поговорит с нами на следующий день, после выпивки самогона
// nr = 1

instance DIA_Ado_AfterJornSamogon(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AfterJornSamogon_condition;	
	information = DIA_Ado_AfterJornSamogon_info;
	description = "Как успехи?";
	permanent = FALSE;
};

func int DIA_Ado_AfterJornSamogon_condition()
{
	if (Npc_KnowsInfo(other,DIA_Jorn_AfterSamogonTalk) && (MIS_DS2P_ExposeJorn == Log_Success))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AfterJornSamogon_info()
{
	AI_Output(other,self,"DIA_Ado_AfterJornSamogon_15_00");	//Как успехи?
	AI_Output(self,other,"DIA_Ado_AfterJornSamogon_13_01");	//Все просто прекрасно! Все вышло так, как я и задумывал. Гард, как только увидел, что Йорна нет на посту, пришел в такую ярость, что мне даже стало жалко Йорна.
	AI_Output(self,other,"DIA_Ado_AfterJornSamogon_13_02");	//На минутку, правда, но потом, к счастью, все прошло. Теперь команда дала новое прозвище для Йорна. Ха-ха!
	AI_Output(other,self,"DIA_Ado_AfterJornSamogon_15_03");	//Какое?
	AI_Output(self,other,"DIA_Ado_AfterJornSamogon_13_04");	//Засранец! Йорн бесится, но ничего поделать не может. Ха-ха! Теперь над ним не насмехается только ленивый.
	AI_Output(other,self,"DIA_Ado_AfterJornSamogon_15_05");	//Рад за тебя. Удачи!
	AI_StopProcessInfos(self);
};
	
// Активируется, после того, как сдали Адо Йорну, и забрали особый самогон
// nr = 1

instance DIA_Ado_AlternativeSamogon(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AlternativeSamogon_condition;	
	information = DIA_Ado_AlternativeSamogon_info;
	description = "Все получилось.";
	permanent = FALSE;
};

func int DIA_Ado_AlternativeSamogon_condition()
{
	if ((MIS_DS2P_ExposeJorn == Log_Running) && Npc_KnowsInfo(other,DIA_Jorn_AfterSamogonTalk))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AlternativeSamogon_info()
{
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_00");	//Все получилось.
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_01");	//Йорн выпил самогон со слабительным?
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_02");	//И даже не поморщился. Результат можно ждать уже через пару часов.
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_03");	//Отлично! Теперь-то ему будет не до подколов в мой адрес.
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_04");	//Предлагаю, отметить наш совместный успех, компаньон. Отметить и рассчитаться.
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_05");	//Я тоже так думаю, вот только выпивки у меня не осталось. Последнюю бутылку тебе отдал.
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_06");	//Сейчас посмотрю, может винцо завалялась где-то… а, вот, есть.
	// Отдаем особый самогон Адо
	B_GiveInvItems(other,self,ItMi_DS2P_SamogonForJorn,1);
	// Удаляем самогон из инвентаря Адо
	Npc_RemoveInvItems(self,ItMi_DS2P_SamogonForJorn,1);
	// Создаем в инвентаре ГГ самогон и выпиваем его
	CreateInvItems(other,ItFo_Samogon,1);
	B_UseItem(other,ItFo_Samogon);
	// Создаем в инвентаре Адо самогон и выпиваем его
	CreateInvItems(self,ItFo_Samogon,1);
	B_UseItem(self,ItFo_Samogon);
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_07");	//Ах, хорошо пошла!
	AI_Output(other,self,"DIA_Ado_AlternativeSamogon_15_08");	//Теперь поговорим о моей награде.
	AI_Output(self,other,"DIA_Ado_AlternativeSamogon_13_09");	//Да, вот, держи 200 золотых.
	// Создаем в инвентаре Адо 200 золотых и отдаем ГГ
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Jorn_LastTalkDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};
	
// Активируется, после того, как поговорили с Йорном об Адо на след. день
// nr = 1

instance DIA_Ado_AfterSamogonAdo(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AfterSamogonAdo_condition;	
	information = DIA_Ado_AfterSamogonAdo_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ado_AfterSamogonAdo_condition()
{
	if (Npc_KnowsInfo(other,DIA_Jorn_AfterSamogonAdo))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AfterSamogonAdo_info()
{
	AI_Output(self,other,"DIA_Ado_AfterSamogonAdo_13_00");	//Ты что, придурок, сделал?
	AI_Output(other,self,"DIA_Ado_AfterSamogonAdo_15_01");	//Эй, полегче на поворотах! С чего вообще такая реакция?
	AI_Output(self,other,"DIA_Ado_AfterSamogonAdo_13_02");	//Ты, кретин, дал мне слабительное. МНЕ! А не Йорну!
	AI_Output(other,self,"DIA_Ado_AfterSamogonAdo_15_03");	//Перепутал, наверное.
	AI_Output(self,other,"DIA_Ado_AfterSamogonAdo_13_04");	//Да я тебя сейчас…
	AlternativeSamogon_FightAdo = 0;
	B_Attack(self,other,AR_NONE,0);
	AI_StopProcessInfos(self);
};

// Активируется, после того, как ГГ победит Адо (это на перманент ставить?)
// nr = 1

instance DIA_Ado_AfterSamogonFight(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_AfterSamogonFight_condition;	
	information = DIA_Ado_AfterSamogonFight_info;
	description = " ";
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ado_AfterSamogonFight_condition()
{
	if ((AlternativeSamogon_FightAdo == 1) && Npc_IsInState(self,ZS_Talk))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_AfterSamogonFight_info()
{
	AI_Output(other,self,"DIA_Ado_AfterSamogonFight_15_00");	//Остыл?
	AI_Output(self,other,"DIA_Ado_AfterSamogonFight_13_01");	//Катись к черту!
	AI_StopProcessInfos(self);
};

// Активируется, после того, как ГГ послал Караха на пост по квесту "Охранники для пещеры"
// nr = 1

instance DIA_Ado_GuardsForCaveComplete(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_GuardsForCaveComplete_condition;	
	information = DIA_Ado_GuardsForCaveComplete_info;
	description = "Я выполнил твою просьбу.";
	permanent = FALSE;
};

func int DIA_Ado_GuardsForCaveComplete_condition()
{
	if ((MIS_DS2P_GuardsForCave == Log_Running) && Npc_KnowsInfo(other,DIA_Karah_JornIsDead))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_GuardsForCaveComplete_info()
{
	AI_Output(other,self,"DIA_Ado_GuardsForCaveComplete_15_00");	//Я выполнил твою просьбу. Грег направил к тебе в помощь Караха.
	AI_Output(self,other,"DIA_Ado_GuardsForCaveComplete_13_01");	//Фух! Аж от сердца отлегло. Спасибо тебе.
	AI_Output(other,self,"DIA_Ado_GuardsForCaveComplete_15_02");	//Эй, а как же награда?
	AI_Output(self,other,"DIA_Ado_GuardsForCaveComplete_13_03");	//Награда? Ну, могу дать тебе пару целебных зелий. Подойдет?
	AI_Output(other,self,"DIA_Ado_GuardsForCaveComplete_15_04");	//Давай.
	// Создаем в инвентаре Адо 2 целебных зелья
	CreateInvItems(self,ItPo_DSG_Health_Mittel,2);
	B_GiveInvItems(self,other,ItPo_DSG_Health_Mittel,2);
	B_DSG_Log_OpenClose(TOPIC_DS2P_GuardsForCave,LOG_MISSION,LOG_Success,TOPIC_DS2P_GuardsForCave_Success);
	B_GivePlayerXP(XP_MIS_DS2P_GuardsForCave);
	AI_StopProcessInfos(self);
};

// Активируется, если активен квест "Письмо", и ГГ поговорил с Виолой
// nr = 1

instance DIA_Ado_WhereIsLulu(C_Info)
{
	npc = PIR_211_DS2P_Ado;
	nr = 1;
	condition = DIA_Ado_WhereIsLulu_condition;	
	information = DIA_Ado_WhereIsLulu_info;
	description = "(по поводу Лулу)";
	permanent = FALSE;
};

func int DIA_Ado_WhereIsLulu_condition()
{
	if ((MIS_DS2P_TomsLetter == Log_Running) && Npc_KnowsInfo(other,DIA_Viola_WhereIsLulu))
	{	
		return TRUE;	
	};
};

func void DIA_Ado_WhereIsLulu_info()
{
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_00");	//По-моему раньше пленников было больше.
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_01");	//А, да. Одну из этих никчемных баб забрали.
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_02");	//Зачем?
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_03");	//(угрожающе) Что-то ты больно любопытен, братец. Не укоротить ли тебе длинный нос?
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_04");	//Да ладно, мне-то можешь рассказать, я же не из крестьян. Обещаю, что никому не скажу.
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_05");	//Да секрета в общем-то и нет. Гард решил устроить показательную казнь через пару дней, вот ее и поселили отдельно ото всех. А чтобы она пришла в ужас, ее и поселили отдельно.
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_06");	//Знаешь это ощущение, когда ты смотришь на съежившуюся от страха девушку, которая знает о своей скорой судьбе?
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_07");	//(хмуро) Нет, и надеюсь не узнаю.
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_08");	//(смеясь) Узнаешь, ибо скоро ее казнят.
	AI_Output(other,self,"DIA_Ado_WhereIsLulu_15_09");	//А за что ее казнить-то?
	AI_Output(self,other,"DIA_Ado_WhereIsLulu_13_10");	//Мы знаем, что кто-то помогает беглецам, и никак не можем поймать. Надеюсь, эта показательная казнь заставит их раскрыть себя.
	B_DSG_Log_OpenClose(TOPIC_DS2P_TomsLetter,LOG_MISSION,LOG_Running,TOPIC_DS2P_TomsLetter_LuluIsGone_02);
	AI_StopProcessInfos(self);
};