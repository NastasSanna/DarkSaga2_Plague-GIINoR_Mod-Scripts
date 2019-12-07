
const int LOC_ANGAR = 1;
const int LOC_ICE = 2;
const int LOC_SWAMP = 4;
const int LOC_FIRE = 3;
const int LOC_LAKE = 5;
const int LOC_XARDAS = 6;
const int LOC_FAJETHMINE = 7;
const int LOC_SILVESTROMINE = 8;
const int LOC_GRIMESMINE = 9;
const int LOC_BURG = 10;
const int LOC_ORCBARRIER = 11;
const int LOC_ORCBARRIER_FAR = 12;

func int C_DiegoTooFar(var int tolerance)
{
	if(Npc_GetDistToWP(hero,"SPAWN_OW_SHADOWBEAST_10_01") < (4000 + tolerance))
	{
		return LOC_ANGAR;
	}
	else if(Npc_GetDistToWP(hero,"OW_ICEREGION_ENTRANCE_01") < (3000 + tolerance))
	{
		return LOC_ICE;
	}
	else if(Npc_GetDistToWP(hero,"OW_PATH_046") < (1800 + tolerance))
	{
		return LOC_SWAMP;
	}
	else if(Npc_GetDistToWP(hero,"CASTLE_5") < (1500 + tolerance))
	{
		return LOC_FIRE;
	}
	else if((Npc_GetDistToWP(hero,"MT16") < (6500 + tolerance)) || (Npc_GetDistToWP(hero,"MT13") < (5500 + tolerance)))
	{
		return LOC_LAKE;
	}
	else if((Npc_GetDistToWP(hero,"DT_MAINGATE") < (500 + tolerance)) || (Wld_GetPlayerPortalGuild() == GIL_DMT) || ((Npc_GetDistToWP(hero,"DT_E3_03") < 1000) && (Npc_GetHeightToNpc(self,hero) > 1000)))
	{
		return LOC_XARDAS;
	}
	else if((Npc_GetDistToWP(hero,"OW_NEWMINE_03") < (2500 + tolerance)) || (Npc_GetDistToWP(hero,"OW_NEWMINE_03_B") < (2500 + tolerance)))
	{
		return LOC_FAJETHMINE;
	}
	else if(Npc_GetDistToWP(hero,"OW_MINE3_OUT") < (1200 + tolerance))
	{
		return LOC_SILVESTROMINE;
	}
	else if(Npc_GetDistToWP(hero,"OW_PATH_266") < (3000 + tolerance))
	{
		return LOC_GRIMESMINE;
	}
	else if((Npc_GetDistToWP(hero,"OC_CENTER_02") < (12000 + tolerance)) || (Npc_GetDistToWP(hero,"OC_CENTER_05") < (12000 + tolerance)))
	{
		return LOC_BURG;
	}
	else if((Npc_GetDistToWP(hero,"OC_ORCBARRIER_08") < (5000 + tolerance)) || (Npc_GetDistToWP(hero,"PATH_OC_PSI_01") < (5000 + tolerance)))
	{
		return LOC_ORCBARRIER;
	}
	else if(Npc_GetDistToWP(hero,"OW_PATH_BLOODFLY01_SPAWN01") < (5000 + tolerance))
	{
		return LOC_ORCBARRIER_FAR;
	};
	return FALSE;
};

func int C_FrensisTooFar(var int tolerance)
{
	if((Npc_GetDistToWP(hero,"SW_WAY_PIRATE_TO_ORC_38") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_WAY_PIRATE_TO_ORC_48") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_CAVE_UNDER_FORT_ZOMBIE_07") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_WAY_TO_FORT_21") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_WAY_IN_MOUNTAINS_TROLL_05") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_WAY_PIRATE_TO_HUNTERS_00") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"HC_LIGHTHOUSE_PATH_15") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_COAST_SHARD_WAY_09") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_GOLD_MINE_ENTER_CAVE_04") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_WATER_BARIER_01") < (2000 + tolerance)) || (Npc_GetDistToWP(hero,"SW_WATER_BARIER_02") < (2000 + tolerance)))
	{
	return true;
	};
	return FALSE;
};
