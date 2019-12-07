instance DIA_Lares_EXIT(C_Info)
{
	npc = none_12_Lares;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Lares_EXIT_condition;	
	information = DIA_Lares_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Lares_EXIT_condition(){	return TRUE;};
func void DIA_Lares_EXIT_info(){	AI_StopProcessInfos(self);};
