instance DIA_Gorn_EXIT(C_Info)
{
	npc = none_17_Gorn;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Gorn_EXIT_condition;	
	information = DIA_Gorn_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Gorn_EXIT_condition(){	return TRUE;};
func void DIA_Gorn_EXIT_info(){	AI_StopProcessInfos(self);};
