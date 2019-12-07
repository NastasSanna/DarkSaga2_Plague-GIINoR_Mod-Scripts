instance DIA_Gerard_EXIT(C_Info)
{
	npc = DS_19_Gerard;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Gerard_EXIT_condition;	
	information = DIA_Gerard_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Gerard_EXIT_condition(){	return TRUE;};
func void DIA_Gerard_EXIT_info(){	AI_StopProcessInfos(self);};
