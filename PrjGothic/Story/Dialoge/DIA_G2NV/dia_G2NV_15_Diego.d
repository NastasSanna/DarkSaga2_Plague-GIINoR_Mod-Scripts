//*--------------------------------------------------------------------
//*---------   ДИЕГО НА КОРАБЛЕ на стартовой локе		-------------------
//*--------------------------------------------------------------------
prototype DIA_Diego_EXIT(C_Info)
{
	npc = none_15_Diego;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Diego_EXIT_condition;	
	information = DIA_Diego_EXIT_info;
	description = Dialog_Ende;
};
instance DIA_Diego_EXIT_pre(DIA_Diego_EXIT){npc = pre_none_15_Diego;};
instance DIA_Diego_EXIT_main(DIA_Diego_EXIT){};
func int DIA_Diego_EXIT_condition(){	return TRUE;};
func void DIA_Diego_EXIT_info(){	AI_StopProcessInfos(self);};

instance DIA_Diego_PreStart(C_Info)	//Начальный диалог на корабле
{
	npc = pre_none_15_Diego;
	nr = 1;
	permanent = FALSE;
	condition = DIA_Diego_PreStart_condition;	
	information = DIA_Diego_PreStart_info;
	important = TRUE;
};
func int DIA_Diego_PreStart_condition(){	return TRUE;};
func void DIA_Diego_PreStart_info()
{	
	AI_Output(self,other,"DIA_Diego_PreStart_11_00");	//Судя по твоему виду, хороших новостей нет.
	AI_Output(other,self,"DIA_Diego_PreStart_15_01");	//Да, ты прав, мой друг. Горн тоже заражен чумой, как и все остальные он впал в беспамятство.
	AI_Output(self,other,"DIA_Diego_PreStart_11_02");	//Что будем теперь делать?
	AI_Output(self,other,"DIA_Diego_PreStart_11_03");	//Я не думаю, что мы сможем долго сопротивляться этой болезни, и рано или поздно окажемся в том же положении, что и остальные.
	AI_Output(other,self,"DIA_Diego_PreStart_15_04");	//Мы с Ватрасом пришли к тому же мнению, поэтому решили искать помощи на одном из близлежащих островов.
	AI_Output(other,self,"DIA_Diego_PreStart_15_05");	//Мне кажется, мы как раз проплывали мимо одного из них день или два назад.
	AI_Output(self,other,"DIA_Diego_PreStart_11_06");	//Да, ты прав, сами мы не справимся. Надеюсь, еще не слишком поздно.
	AI_Output(other,self,"DIA_Diego_PreStart_15_07");	//Я тоже на это надеюсь.
	AI_StopProcessInfos(self);
};

instance DIA_Diego_AfterStart_Const(C_Info)	//Постоянный диалог с Диего
{
	npc = pre_none_15_Diego;
	nr = 998;
	permanent = TRUE;
	condition = DIA_Diego_AfterStart_Const_condition;	
	information = DIA_Diego_AfterStart_Const_info;
	description = "Как ты?";
};
func int DIA_Diego_AfterStart_Const_condition()
{	
	if(Npc_KnowsInfo(other,DIA_Diego_PreStart))	{	return TRUE;};
};
func void DIA_Diego_AfterStart_Const_info()
{	
	AI_Output(other,self,"DIA_Diego_AfterStart_Const_15_00");	//Как ты?
	AI_Output(self,other,"DIA_Diego_AfterStart_Const_11_00");	//Отлично, хотя это ничего не значит. Ведь парни тоже чувствовали себя как обычно, а на утро не приходили в сознание.
};
//*--------------------------------------------------------------------
//*---------   ДИЕГО НА основной локе		-------------------
//*--------------------------------------------------------------------

instance DIA_Diego_GoToPirates(C_Info)	//Постоянный диалог до стартового с пиратом Грегом
{
	npc = none_15_Diego;
	nr = 1;
	permanent = TRUE;
	condition = DIA_Diego_GoToPirates_condition;	
	information = DIA_Diego_GoToPirates_info;
	description = "Если что-то пойдет не так...";
};
func int DIA_Diego_GoToPirates_condition()
{	
	if(!Npc_KnowsInfo(other,DIA_Greg_Start))
	{	return TRUE;	};
};
func void DIA_Diego_GoToPirates_info()
{	
	AI_Output(other,self,"DIA_Diego_GoToPirates_15_00");	//Ну что, опять вляпались?!
	AI_Output(self,other,"DIA_Diego_GoToPirates_11_00");	//Двум смертям не бывать – пошли узнаем, что им нужно.
	AI_StopProcessInfos(self);
};
