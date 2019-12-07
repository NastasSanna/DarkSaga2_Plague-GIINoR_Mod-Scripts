instance DIA_Hobo_EXIT(C_Info)
{
	npc = PIR_215_DS2P_Hobo;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Hobo_EXIT_condition;	
	information = DIA_Hobo_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Hobo_EXIT_condition(){	return TRUE;};
func void DIA_Hobo_EXIT_info(){	AI_StopProcessInfos(self);};

//NS - 14/06/2013 ===========
// Знакомство 
//===========================
instance DIA_Hobo_WhoAreU(C_Info)
{
	npc = PIR_215_DS2P_Hobo;
	nr = 0;
	condition = DIA_Hobo_WhoAreU_condition;	
	information = DIA_Hobo_WhoAreU_info;
	description = "Кто ты?";
};
func int DIA_Hobo_WhoAreU_condition(){	return TRUE;};
func void DIA_Hobo_WhoAreU_info()
{	
	AI_Output(other,self,"DIA_Hobo_WhoAreU_15_00");	//Кто ты?
		AI_Output(self,other,"DIA_Hobo_WhoAreU_13_01");	//Хобо.
	AI_Output(other,self,"DIA_Hobo_WhoAreU_15_02");	//Как дела?
		AI_Output(self,other,"DIA_Hobo_WhoAreU_13_03");	//Хорошо.
	AI_Output(other,self,"DIA_Hobo_WhoAreU_15_04");	//А ты не разговорчивый.
		AI_Output(self,other,"DIA_Hobo_WhoAreU_13_05");	//Точно.
};

//NS - 14/06/2013 ===========
// После знакомства, общие диалоги 
//===========================
instance DIA_Hobo_HowAreU(C_Info)
{
	npc = PIR_215_DS2P_Hobo;
	nr = 1;
	condition = DIA_Hobo_HowAreU_condition;	
	information = DIA_Hobo_HowAreU_info;
	description = "Как ты?";
};
func int DIA_Hobo_HowAreU_condition()
{
	if (Npc_KnowsInfo(other, DIA_Hobo_WhoAreU))
	{
		return TRUE;
	};
};
func void DIA_Hobo_HowAreU_info()
{	
	AI_Output(other,self,"DIA_Hobo_HowAreU_15_00");	//Как ты?
		AI_Output(self,other,"DIA_Hobo_HowAreU_13_01");	//Нормально.
};

//------------------
instance DIA_Hobo_AllIsQuiet(C_Info)
{
	npc = PIR_215_DS2P_Hobo;
	nr = 2;
	condition = DIA_Hobo_AllIsQuiet_condition;	
	information = DIA_Hobo_AllIsQuiet_info;
	description = "Все спокойно?";
};
func int DIA_Hobo_AllIsQuiet_condition()
{
	if (Npc_KnowsInfo(other, DIA_Hobo_WhoAreU))
	{
		return TRUE;
	};
};
func void DIA_Hobo_AllIsQuiet_info()
{	
	AI_Output(other,self,"DIA_Hobo_AllIsQuiet_15_00");	//Все спокойно?
		AI_Output(self,other,"DIA_Hobo_AllIsQuiet_13_01");	//Угу.
};

//------------------
instance DIA_Hobo_JornFriend(C_Info)
{
	npc = PIR_215_DS2P_Hobo;
	nr = 3;
	condition = DIA_Hobo_JornFriend_condition;	
	information = DIA_Hobo_JornFriend_info;
	description = "Йорн твой друг?";
};
func int DIA_Hobo_JornFriend_condition()
{
	if (Npc_KnowsInfo(other, DIA_Hobo_WhoAreU))
	{
		return TRUE;
	};
};
func void DIA_Hobo_JornFriend_info()
{	
	AI_Output(other,self,"DIA_Hobo_JornFriend_15_00");	//Йорн твой друг?
		AI_Output(self,other,"DIA_Hobo_JornFriend_13_01");	//Нет.
};

//------------------
instance DIA_Hobo_WhatGuarding(C_Info)
{
	npc = PIR_215_DS2P_Hobo;
	nr = 4;
	condition = DIA_Hobo_WhatGuarding_condition;	
	information = DIA_Hobo_WhatGuarding_info;
	description = "Что вы сторожите?";
};
func int DIA_Hobo_WhatGuarding_condition()
{
	if (Npc_KnowsInfo(other, DIA_Hobo_WhoAreU))
	{
		return TRUE;
	};
};
func void DIA_Hobo_WhatGuarding_info()
{	
	AI_Output(other,self,"DIA_Hobo_WhatGuarding_15_00");	//Что вы сторожите?
		AI_Output(self,other,"DIA_Hobo_WhatGuarding_13_01");	//Пещеру.
};

//------------------
instance DIA_Hobo_IveQuestions(C_Info)
{
	npc = PIR_215_DS2P_Hobo;
	nr = 5;
	condition = DIA_Hobo_IveQuestions_condition;	
	information = DIA_Hobo_IveQuestions_info;
	description = "Ответь мне на пару вопросов.";
};
func int DIA_Hobo_IveQuestions_condition()
{
	if (Npc_KnowsInfo(other, DIA_Hobo_WhoAreU))
	{
		return TRUE;
	};
};
func void DIA_Hobo_IveQuestions_info()
{	
	AI_Output(other,self,"DIA_Hobo_IveQuestions_15_00");	//Ответь мне на пару вопросов.
		AI_Output(self,other,"DIA_Hobo_IveQuestions_13_01");	//Мне некогда.
};

//NS - 14/06/2013 ===========
// Про ядро, после разговора я Йорном 
//===========================
instance DIA_Hobo_CanonBall(C_Info)
{
	npc = PIR_215_DS2P_Hobo;
	nr = 1;
	condition = DIA_Hobo_CanonBall_condition;	
	information = DIA_Hobo_CanonBall_info;
	description = "Я слышал, что в тебя попало ядро.";
};
func int DIA_Hobo_CanonBall_condition()
{
	if (Npc_KnowsInfo(other, DIA_Jorn_AboutHobo))
	{
		return TRUE;
	};
};
func void DIA_Hobo_CanonBall_info()
{	
	AI_Output(other,self,"DIA_Hobo_CanonBall_15_00");	//Я слышал, что в тебя попало ядро.
	B_GivePlayerXP(XP_Ambient);	// UNFINISHED уточнить опыт
		AI_Output(self,other,"DIA_Hobo_CanonBall_13_01");	//(злобно) И что? Нет, и что? Значит, из-за этого Хобо дебил, значит, из-за этого над Хобо можно подшучивать, шушукаться за спиной?
		AI_Output(self,other,"DIA_Hobo_CanonBall_13_02");	//Хобо умнее всех вас вместе взятых! Понял-нет?!
	AI_Output(other,self,"DIA_Hobo_CanonBall_15_03");	//(ошарашенно) Понял.
		AI_Output(self,other,"DIA_Hobo_CanonBall_13_04");	//(спокойно) Хорошо.
};


