instance DIA_DIL_EXIT(C_Info)
{
	npc = BAU_102_DS2P_DIL;
	nr = 999;
	permanent = TRUE;
	condition = DIA_DIL_EXIT_condition;	
	information = DIA_DIL_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_DIL_EXIT_condition(){	return TRUE;};
func void DIA_DIL_EXIT_info(){	AI_StopProcessInfos(self);};
//
instance DIA_Dil_Start(C_Info)	//Начальный диалог
{
	npc = BAU_102_DS2P_DIL;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Dil_Start_condition;	
	information = DIA_Dil_Start_info;
	description = "Привет! Кто ты?";
};
func int DIA_Dil_Start_condition(){	return TRUE;};
func void DIA_Dil_Start_info()
{
	AI_Output(other,self,"DIA_Dil_Start_15_00");	//Привет! Кто ты?
	AI_Output(self,other,"DIA_Dil_Start_12_00");	//А, что? Нет-нет. Оно еще не готово!
	AI_Output(other,self,"DIA_Dil_Start_15_01");	//О чем ты говоришь?
	AI_Output(self,other,"DIA_Dil_Start_12_01");	//Молвлю тебе - через два года Миртана наскочит на небесную ось! Да, не спорь со мной!
	AI_Output(self,other,"DIA_Dil_Start_12_02");	//(кричит) Я прав! Прав!
	AI_Output(other,self,"DIA_Dil_Start_15_02");	//У тебя все хорошо?
	AI_Output(self,other,"DIA_Dil_Start_12_03");	//Вот послушай, я встал вчера с левой ноги, а должен был с правой. И что? Да НИЧЕГО!
	AI_PlayAni(self,"T_DONTKNOW");
	AI_PlayAni(self,"T_COMEOVERHERE");
	AI_Output(self,other,"DIA_Dil_Start_12_04");	//Ты хитрый, да, ты хитрый! Я не хочу с тобой говорить! Гоблин тебе судья!
	AI_StopProcessInfos(self);
};
//----
//Появляется после стартового
//----
var int Dil_randy_dialog_6_once;
instance DIA_Dil_RandyDialog(C_Info)	//Начальный диалог
{
	npc = BAU_102_DS2P_DIL;
	nr = 2;
	permanent = TRUE;
	condition = DIA_Dil_RandyDialog_condition;	
	information = DIA_Dil_RandyDialog_info;
	important = TRUE;
};
func int DIA_Dil_RandyDialog_condition(){	if(Npc_KnowsInfo(other,DIA_Dil_Start) && Npc_IsInState(self,ZS_Talk)) {return TRUE;};	};
func void DIA_Dil_RandyDialog_info()
{
	var int randy_dialog; randy_dialog = Hlp_Random(13);
	if(randy_dialog == 0)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_00");	//Вот знаешь, о чем я подумал, все эти букашки, люди, птицы – пустое.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_01");	//А все почему? Не знаешь? Потому что этого нет! Ничего нет! НИЧЕГО!
		AI_PlayAni(self,"R_SCRATCHHEAD");
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_02");	//(задумался) Хочешь яблоко?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_03");	//Задумался? И я не хочу. Пойду посплю... Или погуляю... Или...
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_04");	//(кричит в ужасе) О, боги!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_00");	//Стой!
		AI_StopProcessInfos(self);
		AI_SetWalkMode(self,NPC_RUN);
		Npc_SetTarget(self,other);
		AI_Flee(self);
	}
	else if(randy_dialog == 1)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_05");	//Раз человек, два человек. А присмотришься, затем моргнешь ненароком, и не человек это вовсе, а жук мясной.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_06");	//И бац ему на ус так, чтоб до писку.
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_01");	//Я понял, ты сумасшедший.
		AI_PlayAni(self,"T_COMEOVERHERE");
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_07");	//(внимательно смотрит) По всем тут нам Белиар плачет!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_08");	//Прости, я должен собрать урожай сорняка. Иначе придут ОНИ, и тогда конец!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_09");	//Я боюсь их, правда! Ты мне веришь? А еще я люблю дождь, он мокрый и веселый. Ой, что-то мне не по себе...
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 2)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_10");	//Вот живешь так: думаешь, чувствуешь, а оглянешься, ночь за окном. И тишина...
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_11");	//Я очень боюсь! Мама, спаси меня!
		AI_PlayAni(self,"T_CRY");
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 3)
	{
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_02");	//Как дела?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_12");	//Странно все это, очень странно! Я вчера летал как птица, а потом понял, что птица летала во мне.
		AI_PlayAni(self,"R_SCRATCHHEAD");
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_13");	//(задумчиво) Иннос нас простит, он добрый... Хотя, ничего нет, и его тоже нет.
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_03");	//А что есть?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_14");	//Уходи, ты – призрак! Прочь, прочь! Я очень боюсь призраков.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_15");	//(истошно кричит) Ааааа...
		AI_StopProcessInfos(self);
		AI_SetWalkMode(self,NPC_RUN);
		Npc_SetTarget(self,other);
		AI_Flee(self);
	}
	else if(randy_dialog == 4)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_16");	//Нет...
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_04");	//Что нет?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_17");	//Послушай, ты даже себя не знаешь, зачем спрашивать что-то у меня. 
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_18");	//Я - тишина, я - лес, я - облако, я - камень...
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_19");	//Да! Уходи, или я брошу в тебя камень!
		AI_PlayAni(self,"T_IGETYOU");
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 5)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_20");	//Ты чувствуешь? Чума! Она сожрет всех нас!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_05");	//Откуда ты знаешь про чуму?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_21");	//Курица - кудахчет, волк - воет, Дил - знает! 
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_22");	//Ты видел Тома? Я давно не видел Тома! Наверное, пришла пора брать лопату...
		AI_StopProcessInfos(self);
	}
	else if((randy_dialog == 6) && !Dil_randy_dialog_6_once)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_23");	//Солнце, оно поет песни. Я слышал! Да, оно придет и поглотит нас!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_24");	//Оно сожрет нас! Оно уже здесь! Ха-ха-ха! На колени, смертный!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_06");	//Ты что задумал?
		AI_StopProcessInfos(self);
		Dil_randy_dialog_6_once = TRUE;
		B_Attack(self,other,AR_NONE,1);
	}
	else if(randy_dialog < 8)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_25");	//Я видел поле, видел людей, они молчали и думали. В них нет больше света.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_26");	//Смерть! Кругом тучи смерти! Но мне уже все равно. Прощай!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_07");	//О чем ты говоришь?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_27");	//Как под ногтями земля, въедливая, грязная, омерзительная! 
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_28");	//Хочется разорвать свое тело и быть свободным! Но этого нет, ничего нет!
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 8)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_29");	//А я ждал тебя! Ты тот, кто изменит время. Ничего не бойся!
		AI_Output(other,self,"DIA_Dil_RandyDialog_15_08");	//Это предсказание?
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_30");	//Это пыль! (дует на руку)
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_31");	//Смотри, вот и нет ее!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_32");	//Жалко здесь нет Тома, он бы посмеялся вместе со мной... или поплакал. Я не знаю ответов. Их слишком много, я тону в них...
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 9)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_33");	//Ты когда-нибудь летал на облаке? Нет? А я летал.
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_34");	//И ты знаешь, оно липкое! Ха-ха-ха! Ха-ха-ха!
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 10)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_35");	//Слышишь? Слышишь ЕЕ? Какая нечеловеческая музыка!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_36");	//Тум-пум-пум...пурум-пум-пум-пум...
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 11)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_37");	//Ты знаешь, кто я? Нет, я не Дил. Это вранье, понимаешь?! ВРАНЬЕ!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_38");	//Меня зовут ПУСТОТА! Да, теперь пусть  все знают, что я - Дил Пустота!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_39");	//Да, да, да! Прости, я зря тебе все это говорю. Ты не поймешь...
		AI_StopProcessInfos(self);
	}
	else if(randy_dialog == 12)
	{
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_40");	//Видишь это море, раскинувшееся без начала и конца? Оно зовет меня, манит!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_41");	//Когда-нибудь я стану рыбой и уплыву в вечность!
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_42");	//А ты хотел бы стать каплей в пустыне?
		AI_PlayAni(self,"T_GETLOST");
		AI_PlayAni(self,"T_IGETYOU");
		AI_Output(self,other,"DIA_Dil_RandyDialog_12_43");	//(злобно) Молчи! Я не хочу тебя слушать!
		AI_StopProcessInfos(self);
	};
};

//NS - 27/06/2013 ===========
// По квесту "Кто украл мое железо?" 	nr=101
//===========================

instance DIA_Dil_AboutStolenIron(C_Info)
{
	npc = BAU_102_DS2P_DIL;
	nr = 101;
	condition = DIA_Dil_AboutStolenIron_condition;	
	information = DIA_Dil_AboutStolenIron_info;
	description = "Это ты утащил у Джозефа железную руду?";
};
func int DIA_Dil_AboutStolenIron_condition()
{
	if ((MIS_DS2P_WhoStoleMyIron == LOG_Running) && (Bauers_AboutIron_Count < Bauers_AboutIron_Max))
	{	return TRUE;	};
};
func void DIA_Dil_AboutStolenIron_info()
{
	AI_Output(other,self,"DIA_Dil_AboutStolenIron_15_00");	//Это ты утащил у Джозефа железную руду?
		AI_Output(self,other,"DIA_Dil_AboutStolenIron_12_01");	//Ключик, замочек, дверь... А вот куда она ведет?
		AI_Output(self,other,"DIA_Dil_AboutStolenIron_12_02");	//Может, в царство Инноса, а может, в бездну, в бездну голодных глаз! Кто знает?!
	AI_StopProcessInfos(self);
	B_DSG_Bauers_AboutStolenIron_Counter();
};
