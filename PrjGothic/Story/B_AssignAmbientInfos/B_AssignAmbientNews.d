
instance DIA_Ambient_NEWS(C_Info)
{
	nr = 1;
	condition = DIA_Ambient_NEWS_Condition;
	information = DIA_Ambient_NEWS_Info;
	permanent = TRUE;
	important = TRUE;
};
func int DIA_Ambient_NEWS_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (B_GetPlayerCrime(self) != CRIME_NONE))
	{
		return TRUE;
	};
};
func void DIA_Ambient_NEWS_Info()
{
	if(B_GetPlayerCrime(self) == CRIME_SHEEPKILLER)
	{
		B_Say(self,other,"$SHEEPKILLER_CRIME");
	};
	if(B_GetPlayerCrime(self) == CRIME_ATTACK)
	{
		B_Say(self,other,"$ATTACK_CRIME");
	};
	if(B_GetPlayerCrime(self) == CRIME_THEFT)
	{
		B_Say(self,other,"$THEFT_CRIME");
	};
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,5);
};
func void B_AssignAmbientNEWS(var C_Npc slf)
{
	DIA_Ambient_NEWS.npc = Hlp_GetInstanceID(slf);
};

