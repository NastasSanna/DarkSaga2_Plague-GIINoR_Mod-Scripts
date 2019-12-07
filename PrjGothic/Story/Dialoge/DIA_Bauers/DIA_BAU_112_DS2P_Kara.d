instance DIA_Kara_EXIT(C_Info)
{
	npc = BAU_112_DS2P_Kara;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Kara_EXIT_condition;	
	information = DIA_Kara_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Kara_EXIT_condition(){	return TRUE;};
func void DIA_Kara_EXIT_info(){	AI_StopProcessInfos(self);};