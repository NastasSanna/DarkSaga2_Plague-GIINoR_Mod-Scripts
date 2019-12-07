
func void B_GrantAbsolution(var int location)
{
	if((location == LOC_PIR) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_PIR += 1;
		PETZCOUNTER_PIR_MURDER = 0;
		PETZCOUNTER_PIR_THEFT = 0;
		PETZCOUNTER_PIR_Attack = 0;
	};
	if((location == LOC_BAU) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_BAU += 1;
		PETZCOUNTER_BAU_MURDER = 0;
		PETZCOUNTER_BAU_THEFT = 0;
		PETZCOUNTER_BAU_Attack = 0;
		PETZCOUNTER_BAU_THEFT = 0;
	};
	if((location == LOC_PAL) || (location == LOC_ALL))
	{
		ABSOLUTIONLEVEL_PAL += 1;
		PETZCOUNTER_PAL_MURDER = 0;
		PETZCOUNTER_PAL_THEFT = 0;
		PETZCOUNTER_PAL_Attack = 0;
	};
};

