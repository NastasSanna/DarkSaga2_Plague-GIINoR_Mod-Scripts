/***************************************************************
						ОХРАННИК В ПЕЩЕРЕ
//*NS - 01/07/2013
***************************************************************/

instance DIA_GuardCave_EXIT(DIA_Proto_End)
{
	npc = PIR_222_DS2P_GuardCave;
};

//--------------------------
instance DIA_GuardCave_GoAhead(C_Info)
{
	npc = PIR_222_DS2P_GuardCave;
	nr = 0;
	condition = DIA_GuardCave_GoAhead_condition;	
	information = DIA_GuardCave_GoAhead_info;
	important = TRUE;
};
func int DIA_GuardCave_GoAhead_condition(){	return TRUE;};
func void DIA_GuardCave_GoAhead_info()
{
	// Адо еще не мог помереть, развязка не нужна
		AI_Output(self,other,"DIA_GuardCave_GoAhead_13_01");	//Иди дальше в пещеру. Адо ждет тебя.
		AI_Output(self,other,"DIA_GuardCave_GoAhead_13_02");	//И не вздумай создавать сложности, а то мы быстро отправим тебя на тот свет!
	AI_StopProcessInfos(self);
};

//--------------------------
instance DIA_GuardCave_IKnowNothing(C_Info)
{
	npc = PIR_222_DS2P_GuardCave;
	nr = 0;
	condition = DIA_GuardCave_IKnowNothing_condition;	
	information = DIA_GuardCave_IKnowNothing_info;
	important = TRUE;
	permanent = TRUE;
};
func int DIA_GuardCave_IKnowNothing_condition()
{
	if (Npc_IsInState(self,ZS_Talk)){	return TRUE;	};
};
func void DIA_GuardCave_IKnowNothing_info()
{
		AI_Output(self,other,"DIA_GuardCave_IKnowNothing_13_01");	//Я ничего не знаю.
	if (!Npc_IsDead(Ado))	{
		AI_Output(self,other,"DIA_GuardCave_IKnowNothing_13_02");	//Поговори с Адо.
	};
	AI_StopProcessInfos(self);
};
