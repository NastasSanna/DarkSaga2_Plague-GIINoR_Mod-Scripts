instance DIA_DragonTalan_EXIT(C_Info)
{
	npc = Dragon_Fire;
	nr = 999;
	permanent = TRUE;
	condition = DIA_DragonTalan_EXIT_condition;	
	information = DIA_DragonTalan_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_DragonTalan_EXIT_condition(){	return TRUE;};
func void DIA_DragonTalan_EXIT_info(){	AI_StopProcessInfos(self);};

//-------Диалоги с Драконом Таланом

//Redleha - 23/03/2016 ===========
// Знакомство 
//===========================

instance DIA_DragonTalan_FirstDialog(C_Info)	//nr = 1;
{
	npc = Dragon_Fire;
	nr = 1;
	condition = DIA_DragonTalan_FirstDialog_condition;	
	information = DIA_DragonTalan_FirstDialog_info;
	important = TRUE;
	permanent = FALSE;
};
func int DIA_DragonTalan_FirstDialog_condition(){	return TRUE;};
func void DIA_DragonTalan_FirstDialog_info()
{	
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_00");	//Многие годы я живу на этом острове, и до сего момента никто из людей не осмеливался посетить меня, хоть я и не старался никого напугать.
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_00");	//Так Экор меня не обманул, значит, ты и правда не враг людей.
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_01");	//Враг людей? Мне нет дела до вас и ваших ничтожных проблем.
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_01");	//А как же твой хозяин, Белиар, разве он не принуждает тебя творить его волю?
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_02");	//Мой хозяин? У меня нет хозяев. Так зачем ты пришел ко мне?
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_02");	//Не пойми меня неправильно, но мне нужна твоя кровь. Она необходима для лекарства от чумы, охватившей мой корабль.
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_03");	//Мы (вздохнув), подхватили ее на острове некроманта. (после паузы) В который раз уже это повторять приходится.
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_03");	//Я чувствовал, что в мире что-то произошло...
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_04");	//Значит, это прощальный подарок темного мага? И чтобы от него избавиться, вам понадобилась моя кровь. 
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_05");	//Но ее не так-то просто получить. Тебе понадобится особый клинок, заряженный магией руды. Ничем другим мою чешую не пробьешь.
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_04");	//Может, язык прикусишь?
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_06");	//Что?
	AI_Output(other,self,"DIA_DragonTalan_FirstDialog_15_05");	//Мысли вслух. А где мне взять столько руды и нужный меч, способный впитать магию?
		AI_Output(self,other,"DIA_DragonTalan_FirstDialog_18_07");	//Если ты тот, за кого я тебя принимаю, то сам сможешь до всего додуматься.
	B_DSG_Log_OpenClose(TOPIC_DS2P_Plague,LOG_MISSION,LOG_Running,TOPIC_DS2P_Plague_DragonFirstDia);
};
//
//Если ударить дракона
//
instance DIA_DragonTalan_AfterHit(C_Info)	//nr = 1;
{
	npc = Dragon_Fire;
	nr = 1;
	condition = DIA_DragonTalan_AfterHit_condition;	
	information = DIA_DragonTalan_AfterHit_info;
	important = TRUE;
	permanent = FALSE;
};
func int DIA_DragonTalan_AfterHit_condition(){	return TRUE;};
func void DIA_DragonTalan_AfterHit_info()
{	
	AI_Output(self,other,"DIA_DragonTalan_AfterHit_18_00");	//Даже не пытайся ранить меня этим оружием. 
	AI_Output(self,other,"DIA_DragonTalan_AfterHit_18_01");	//Не путай меня с теми, кого уже убил: я один из Изначальных драконов, не тебе решать мою судьбу.
	AI_StopProcessInfos(self);
};














