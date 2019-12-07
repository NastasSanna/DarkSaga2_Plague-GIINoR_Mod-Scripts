instance DIA_Lester_EXIT(C_Info)
{
	npc = none_16_Lester;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Lester_EXIT_condition;	
	information = DIA_Lester_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Lester_EXIT_condition(){	return TRUE;};
func void DIA_Lester_EXIT_info(){	AI_StopProcessInfos(self);};
