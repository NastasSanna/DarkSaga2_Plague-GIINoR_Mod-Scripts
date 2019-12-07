instance DIA_Milten_EXIT(C_Info)
{
	npc = none_14_Milten;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Milten_EXIT_condition;	
	information = DIA_Milten_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Milten_EXIT_condition(){	return TRUE;};
func void DIA_Milten_EXIT_info(){	AI_StopProcessInfos(self);};
