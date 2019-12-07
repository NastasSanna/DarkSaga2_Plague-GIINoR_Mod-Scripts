
func int B_GetPlayerCrime(var C_Npc slf)
{
	if(slf.aivar[AIV_NpcSawPlayerCommit] <= CRIME_ATTACK)
	{
		if(slf.aivar[AIV_NpcSawPlayerCommitDay] < (Wld_GetDay() - 1))
		{
			return CRIME_NONE;
		};
	};
	if(slf.aivar[AIV_CrimeAbsolutionLevel] < B_GetCurrentAbsolutionLevel(slf)) // < ABSOLUTIONLEVEL_$LOC_NAME$
	{
		return CRIME_NONE;
	};
	return slf.aivar[AIV_NpcSawPlayerCommit];
};

