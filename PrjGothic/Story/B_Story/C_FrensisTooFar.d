
func int C_FrensisTooFar(var int tolerance)
{
	if((Npc_GetDistToWP(hero,"SW_WAY_PIRATE_TO_ORC_38") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_WAY_PIRATE_TO_ORC_48") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_CAVE_UNDER_FORT_ZOMBIE_07") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_WAY_TO_FORT_21") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_WAY_IN_MOUNTAINS_TROLL_05") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_WAY_PIRATE_TO_HUNTERS_00") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"HC_LIGHTHOUSE_PATH_15") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_COAST_SHARD_WAY_09") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_GOLD_MINE_ENTER_CAVE_04") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_WATER_BARIER_01") < (2000 + tolerance)) 
	|| (Npc_GetDistToWP(hero,"SW_WATER_BARIER_02") < (2000 + tolerance)))
	{
		return true;
	};
	return FALSE;
};
