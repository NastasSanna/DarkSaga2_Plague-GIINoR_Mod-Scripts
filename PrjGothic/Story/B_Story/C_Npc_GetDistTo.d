func int C_Npc_GetDistToWP(var C_NPC pointMan, var string waypoint, var int Dist, var int MoreOrLess)
{
	if(MoreOrLess == More)
	{
		if(Npc_GetDistToWP(pointMan,waypoint) > Dist)
		{return TRUE;}
		else
		{return FALSE;};
	}
	else
	{
		if(Npc_GetDistToWP(pointMan,waypoint) <= Dist)
		{return TRUE;}
		else
		{return FALSE;};
	};
	return FALSE;
};
func int C_Npc_GetDistToNpc(var C_NPC pointMan, var C_NPC targetMan, var int Dist, var int MoreOrLess)
{
	if(MoreOrLess == More)
	{
		if(Npc_GetDistToNpc(pointMan,targetMan) > Dist)
		{return TRUE;}
		else
		{return FALSE;};
	}
	else
	{
		if(Npc_GetDistToNpc(pointMan,targetMan) <= Dist)
		{return TRUE;}
		else
		{return FALSE;};
	};
	return FALSE;
};
