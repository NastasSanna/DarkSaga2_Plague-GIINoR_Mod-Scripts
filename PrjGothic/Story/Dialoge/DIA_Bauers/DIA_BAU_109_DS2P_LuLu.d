instance DIA_LuLu_EXIT(C_Info)
{
	npc = BAU_109_DS2P_LuLu;
	nr = 999;
	permanent = TRUE;
	condition = DIA_LuLu_EXIT_condition;	
	information = DIA_LuLu_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_LuLu_EXIT_condition(){	return TRUE;};
func void DIA_LuLu_EXIT_info(){	AI_StopProcessInfos(self);};


//NS - 01/07/2013 ===========
//  Стартовый 
//===========================
instance DIA_LuLu_Start(C_Info)
{
	npc = BAU_109_DS2P_LuLu;
	nr = 0;
	condition = DIA_LuLu_Start_condition;	
	information = DIA_LuLu_Start_info;
	description = "Приветствую тебя.";
};
func int DIA_LuLu_Start_condition(){	return TRUE;};
func void DIA_LuLu_Start_info()
{
	AI_Output(other,self,"DIA_LuLu_Start_15_00");	//Приветствую тебя.
		AI_Output(self,other,"DIA_LuLu_Start_16_01");	//(напугано) Что тебе нужно? Я не сделала ничего плохого!
	AI_Output(other,self,"DIA_LuLu_Start_15_02");	//Я просто хотел поговорить с тобой. Не бойся.
		AI_Output(self,other,"DIA_LuLu_Start_16_03");	//Я... Я очень напугана и не смогу составить вам компанию и поддержать беседу.
		AI_Output(self,other,"DIA_LuLu_Start_16_04");	//Вы не будете злиться и бить меня за это? (умоляюще смотрит)
	AI_Output(other,self,"DIA_LuLu_Start_15_05");	//Конечно же нет. Я не обижу тебя.
		AI_Output(self,other,"DIA_LuLu_Start_16_06");	//Спасибо. Я бы хотела остаться одна. Вы разрешите?
	AI_Output(other,self,"DIA_LuLu_Start_15_07");	//Да, конечно. Прости за беспокойство.
	AI_StopProcessInfos(self);	
};


//NS - 01/07/2013 ===========
//  Постоянный 
//===========================
instance DIA_LuLu_AUOK(C_Info)
{
	npc = BAU_109_DS2P_LuLu;
	nr = 1;
	condition = DIA_LuLu_AUOK_condition;	
	information = DIA_LuLu_AUOK_info;
	description = "С тобой все в порядке?";
	permanent = TRUE;
};
func int DIA_LuLu_AUOK_condition()
{
	if (Npc_KnowsInfo(other,DIA_LuLu_Start))
	{	return TRUE;};
};
func void DIA_LuLu_AUOK_info()
{
	AI_Output(other,self,"DIA_LuLu_AUOK_15_01");	//С тобой все в порядке?
		AI_Output(self,other,"DIA_LuLu_AUOK_16_00");	//Да, спасибо. Но мне очень страшно. Простите меня, но я хочу побыть одна.
	AI_StopProcessInfos(self);	
};
