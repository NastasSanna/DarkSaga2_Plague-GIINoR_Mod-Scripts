
func void B_AddPetzCrime(var C_Npc slf,var int crime)
{
	if(C_NpcBelongsToPir(slf))
	{
		if(crime == CRIME_MURDER)			{	PETZCOUNTER_PIR_MURDER += 1;	};
		if(crime == CRIME_THEFT)				{	PETZCOUNTER_PIR_Theft += 1;	};
		if(crime == CRIME_ATTACK)			{	PETZCOUNTER_PIR_Attack += 1;	};
	};
	if(C_NpcBelongsToBau(slf))
	{
		if(crime == CRIME_MURDER)			{	PETZCOUNTER_BAU_MURDER += 1;	};
		if(crime == CRIME_THEFT)				{	PETZCOUNTER_BAU_Theft += 1;	};
		if(crime == CRIME_ATTACK)			{	PETZCOUNTER_BAU_Attack += 1;	};
		if(crime == CRIME_SHEEPKILLER)	{	PETZCOUNTER_BAU_SHEEPKILLER += 1;};
	};
	if(C_NpcBelongsToPAL(slf))
	{
		if(crime == CRIME_MURDER)			{	PETZCOUNTER_PAL_MURDER += 1;	};
		if(crime == CRIME_THEFT)				{	PETZCOUNTER_PAL_Theft += 1;	};
		if(crime == CRIME_ATTACK)			{	PETZCOUNTER_PAL_Attack += 1;	};
	};
};

