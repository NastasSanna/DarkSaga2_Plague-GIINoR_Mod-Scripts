instance DIA_Lee_EXIT(C_Info)
{
	npc = none_13_Lee;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Lee_EXIT_condition;	
	information = DIA_Lee_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Lee_EXIT_condition(){	return TRUE;};
func void DIA_Lee_EXIT_info(){	AI_StopProcessInfos(self);};
