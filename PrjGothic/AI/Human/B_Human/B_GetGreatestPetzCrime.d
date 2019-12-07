
func int B_GetGreatestPetzCrime(var C_Npc slf)
{
	if(C_NpcBelongsToPir(slf))
	{
		if(PETZCOUNTER_PIR_MURDER > 0)	{	return CRIME_MURDER;	};
		if(PETZCOUNTER_PIR_Theft > 0)		{	return CRIME_THEFT;	};
		if(PETZCOUNTER_PIR_Attack > 0)	{	return CRIME_ATTACK;	};
	};
	if(C_NpcBelongsToBau(slf))
	{
		if(PETZCOUNTER_Bau_MURDER > 0)	{	return CRIME_MURDER;	};
		if(PETZCOUNTER_Bau_Theft > 0)	{	return CRIME_THEFT;	};
		if(PETZCOUNTER_Bau_Attack > 0)	{	return CRIME_ATTACK;	};
		if(PETZCOUNTER_Bau_Sheepkiller > 0){	return CRIME_SHEEPKILLER;	};
	};
	if(C_NpcBelongsToPAL(slf))
	{
		if(PETZCOUNTER_PAL_MURDER > 0){	return CRIME_MURDER;	};
		if(PETZCOUNTER_PAL_Theft > 0)	{	return CRIME_THEFT;	};
		if(PETZCOUNTER_PAL_Attack > 0)	{	return CRIME_ATTACK;	};
	};	
	return CRIME_NONE;
};
