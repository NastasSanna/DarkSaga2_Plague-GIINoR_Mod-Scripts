instance DIA_Fart_EXIT(C_Info)
{
	npc = BAU_116_DS2P_Fart;
	nr = 999;
	permanent = TRUE;
	condition = DIA_Fart_EXIT_condition;	
	information = DIA_Fart_EXIT_info;
	description = Dialog_Ende;
};
func int DIA_Fart_EXIT_condition(){	return TRUE;};
func void DIA_Fart_EXIT_info(){	AI_StopProcessInfos(self);};