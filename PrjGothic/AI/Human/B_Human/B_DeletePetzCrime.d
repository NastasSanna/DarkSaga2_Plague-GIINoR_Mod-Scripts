
func void B_DeletePetzCrime(var C_Npc slf)
{
	if(C_NpcBelongsToPir(slf))
	{
		if(B_GetPlayerCrime(slf) == CRIME_MURDER)			{	PETZCOUNTER_PIR_MURDER -= 1;	};
		if(B_GetPlayerCrime(slf) == CRIME_THEFT)				{	PETZCOUNTER_PIR_Theft -= 1;	};
		if(B_GetPlayerCrime(slf) == CRIME_ATTACK)			{	PETZCOUNTER_PIR_Attack -= 1;	};
	};
	if(C_NpcBelongsToBau(slf))
	{
		if(B_GetPlayerCrime(slf) == CRIME_MURDER)			{	PETZCOUNTER_BAU_MURDER -= 1;};
		if(B_GetPlayerCrime(slf) == CRIME_THEFT)				{	PETZCOUNTER_BAU_Theft -= 1;	};
		if(B_GetPlayerCrime(slf) == CRIME_ATTACK)			{	PETZCOUNTER_BAU_Attack -= 1;	};
		if(B_GetPlayerCrime(slf) == CRIME_SHEEPKILLER)	{	PETZCOUNTER_BAU_SHEEPKILLER -= 1;};
	};
	if(C_NpcBelongsToPAL(slf))
	{
		if(B_GetPlayerCrime(slf) == CRIME_MURDER)			{	PETZCOUNTER_PAL_MURDER -= 1;	};
		if(B_GetPlayerCrime(slf) == CRIME_THEFT)				{	PETZCOUNTER_PAL_Theft -= 1;	};
		if(B_GetPlayerCrime(slf) == CRIME_ATTACK)			{	PETZCOUNTER_PAL_Attack -= 1;	};
	};
};
