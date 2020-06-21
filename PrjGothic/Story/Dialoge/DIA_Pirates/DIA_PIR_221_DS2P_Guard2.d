/***************************************************************
						ВТОРОЙ ОХРАННИК
//*NS - 19/06/2013
***************************************************************/

instance DIA_Guard2_EXIT(DIA_Proto_End)
{
	npc = PIR_221_DS2P_Guard2;
};

//--------------------------

instance DIA_Guard2_Sleep(C_Info)
{
	npc = PIR_221_DS2P_Guard2;
	nr = 0;
	condition = DIA_Guard2_Sleep_condition;	
	information = DIA_Guard2_Sleep_info;
	description = "Ты когда-нибудь спишь?";
	permanent = TRUE;
};
func int DIA_Guard2_Sleep_condition(){	return TRUE;};
func void DIA_Guard2_Sleep_info()
{
	AI_Output(other,self,"DIA_Guard2_Sleep_15_00");	//Ты когда-нибудь спишь?
		AI_Output(self,other,"DIA_Guard2_Sleep_13_01");	//Не твое дело. Отвали!
	AI_StopProcessInfos(self);
};
