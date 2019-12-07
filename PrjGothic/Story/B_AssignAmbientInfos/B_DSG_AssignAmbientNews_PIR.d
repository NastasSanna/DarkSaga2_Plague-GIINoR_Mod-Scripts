
// диалог при убийстве пирата
instance DIA_Ambient_News_PIR_13(C_Info)
{
	nr = 1;
	condition = DIA_Ambient_News_PIR_13_Condition;
	information = DIA_Ambient_News_PIR_13_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Ambient_News_PIR_13_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Ambient_News_PIR_13_Info()
{
	AI_Output(self,other,"DIA_PIR_13_CrimeKill_13_01");	//Ты убил одного из наших! Катись прочь от меня, пока не заплатишь штраф.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,5);
};
instance DIA_Ambient_News_PIR_16(C_Info)
{
	nr = 1;
	condition = DIA_Ambient_News_PIR_16_Condition;
	information = DIA_Ambient_News_PIR_16_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Ambient_News_PIR_16_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Ambient_News_PIR_16_Info()
{
	AI_Output(self,other,"DIA_PIR_16_CrimeKill_16_01");	//Ты убил одного из наших! Катись прочь от меня, пока не заплатишь штраф.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,5);
};


func void B_DSG_AssignAmbientNews_PIR(var C_Npc slf)
{
	//UNFINISHED собрать все голоса пиратов
	if(slf.voice == 13)
	{
		DIA_Ambient_News_PIR_13.npc = Hlp_GetInstanceID(slf);
	};
	if(slf.voice == 16)	//Сью
	{
		DIA_Ambient_News_PIR_16.npc = Hlp_GetInstanceID(slf);
	};
};
