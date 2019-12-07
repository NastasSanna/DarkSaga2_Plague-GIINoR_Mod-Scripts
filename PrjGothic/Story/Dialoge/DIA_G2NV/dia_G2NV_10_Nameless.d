instance DIA_Nameless_EXIT(C_Info)
{
	npc = none_10_Nameless;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Nameless_EXIT_condition;	
	information = DIA_Nameless_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Nameless_EXIT_condition(){	return TRUE;};
func void DIA_Nameless_EXIT_info(){	AI_StopProcessInfos(self);};
