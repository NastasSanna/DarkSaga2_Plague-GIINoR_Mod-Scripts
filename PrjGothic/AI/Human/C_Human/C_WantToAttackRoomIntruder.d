
func int C_WantToAttackRoomIntruder(var C_Npc slf)
{
	if(B_GetPlayerCrime(self) != CRIME_NONE)
	{
		return TRUE;
	};
	return FALSE;
};

