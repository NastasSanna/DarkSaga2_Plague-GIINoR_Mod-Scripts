
const int LeGo_Init_Once = 0;
const int LeGo_Init_MyFlags = LeGo_Trialoge | LeGo_AI_Function | LeGo_View | LeGo_FrameFunctions; //Trialoge requires AI_Function!

func void LeGo_Init_DoIt()
{
	if (!LeGo_Init_Once)	{
		MEM_InitAll();
		LeGo_Init(LeGo_Init_MyFlags);
		MoreAlphaVobs(2048); //normal: 256
		MoreAlphaPolys(16384); //normal: 2048
		//InstallHook_oCInfoMan_OnChoice();
		InstallHook_ItmCont();
		B_ReadOpt_MoveKeys();	//NS - 01/07/13
		NPC_SetLastPlayer();	//NS - 25/07/13	для переселения ГГ
		//Hook_View();
		Shields_Init1();
		
		MEM_Debug("LeGo initialized!");
		
		LeGo_Init_Once = TRUE;
	};
};

func void startup_global()
{
	Game_InitGerman();
	Wld_SendTrigger("TIME");
	LeGo_Init_DoIt();
};

//==========================
func void init_global()
{
	Game_InitGerman();
	Wld_SendTrigger("TIME");
	LeGo_Init_DoIt();
};
//
//Грузим стартовую локу с одним кораблём
//
func void STARTUP_DS2P_STARTOCEAN()
{
	/*Wld_InsertNpc(pre_none_10_Nameless,"");
	Wld_InsertNpc(pre_none_11_Jack,"");
	Wld_InsertNpc(pre_none_12_Lares,"");
	Wld_InsertNpc(pre_none_13_Lee,"");
	Wld_InsertNpc(pre_none_14_Milten,"");
	Wld_InsertNpc(pre_none_15_Diego,"");
	Wld_InsertNpc(pre_none_16_Lester,"");
	Wld_InsertNpc(pre_none_17_Gorn,"");
	Wld_InsertNpc(pre_none_18_Vatras,"");*/
};
func void INIT_SUB_DS2P_STARTOCEAN()
{
};
func void INIT_DS2P_STARTOCEAN()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_DS2P_STARTOCEAN();
	//SearchNpcAndCreateSlotsForShields();
};
//
//Грузим главную локу
//
func void STARTUP_DS2P_ATOLL()
{
	CurrentLevel = DSG_PROLOG_ZEN;
	/*Вставляем ГГ, Аластера и друзей/
	Wld_InsertNpc(none_10_Nameless,"");
	Wld_InsertNpc(none_11_Jack,"");
	Wld_InsertNpc(none_12_Lares,"");
	Wld_InsertNpc(none_13_Lee,"");
	Wld_InsertNpc(none_14_Milten,"");
	Wld_InsertNpc(none_15_Diego,"");
	Wld_InsertNpc(none_16_Lester,"");
	Wld_InsertNpc(none_17_Gorn,"");
	Wld_InsertNpc(none_18_Vatras,"");*/
	/*Вставляем пиратов/
	Wld_InsertNpc(PIR_200_DS2P_GARD,"");
	Wld_InsertNpc(PIR_201_DS2P_Greg,"");
	Wld_InsertNpc(PIR_202_DS2P_Symon,"");
	Wld_InsertNpc(PIR_203_DS2P_Zedd,"");
	Wld_InsertNpc(Pir_204_DS2P_Karah,"");
	Wld_InsertNpc(PIR_205_DS2P_Joseph,"");
	Wld_InsertNpc(PIR_206_DS2P_SueBaby,"");
	Wld_InsertNpc(PIR_207_DS2P_LanSkeleton,"");
	Wld_InsertNpc(PIR_208_DS2P_GrayBeard,"");
	Wld_InsertNpc(PIR_209_DS2P_Vales,"");
	Wld_InsertNpc(PIR_210_DS2P_Jorn,"");
	Wld_InsertNpc(PIR_211_DS2P_Ado,"");
	Wld_InsertNpc(PIR_215_DS2P_Hobo,"");*/
	/*Вставляем крестьян/
	Wld_InsertNpc(BAU_100_DS2P_KADAR,"");
	Wld_InsertNpc(BAU_101_DS2P_HAROK,"");
	Wld_InsertNpc(Bau_102_DS2P_Dil,"");
	Wld_InsertNpc(BAU_103_DS2P_Cimm,"");
	Wld_InsertNpc(BAU_104_DS2P_Barok,"");
	Wld_InsertNpc(BAU_105_DS2P_Tamir,"");
	Wld_InsertNpc(BAU_106_DS2P_Maria,"");
	Wld_InsertNpc(BAU_107_DS2P_Nikki,"");
	Wld_InsertNpc(BAU_108_DS2P_Huno,"");
	Wld_InsertNpc(BAU_109_DS2P_Lulu,"");
	Wld_InsertNpc(BAU_110_DS2P_Viola,"");
	Wld_InsertNpc(BAU_111_DS2P_Narev,"");
	Wld_InsertNpc(BAU_112_DS2P_Kara,"");
	Wld_InsertNpc(BAU_113_DS2P_Gustav,"");
	Wld_InsertNpc(BAU_114_DS2P_Tom,"");
	Wld_InsertNpc(BAU_115_DS2P_Jinn,"");
	Wld_InsertNpc(BAU_116_DS2P_Fart,"");*/
	/*Вставляем остальных/
	Wld_InsertNpc(OUT_400_DS2P_Ekor,"");
	Wld_InsertNpc(OUT_401_DS2P_Izmar,"");
	Wld_InsertNpc(Orc_DS2P_ArTush,"");
	Wld_InsertNpc(Orc_DS2P_RakTarak,"");*/
	/*Вставляем гоблинов/
	Wld_InsertNpc(Gobbo_DS2P_JaAfFar,"");
	Wld_InsertNpc(Gobbo_DS2P_KuLa,"");
	Wld_InsertNpc(Gobbo_DS2P_RaDaPo,"");
	Wld_InsertNpc(Gobbo_DS2P_TsaHaNauh,"");
	Wld_InsertNpc(Gobbo_DS2P_YahYah,"");*/
	//Wld_InsertNpc(Swampshark_DS2P_LargeSnake,""); NS - вырезан
	/*Вставляем нежить в склепе с гранитом/
	Wld_InsertNpc(Skeleton_Lord_DS2P_GraniteGrave,"");
	Wld_InsertNpc(Skeleton_Ghost_Mage_DS2P_GraniteGrave,"");*/
	// UNFINISHED еще зомби и скелеты
	/*Вставляем квестового огненного мракориса ("Внук рыбака")/
	Wld_InsertNpc(Shadowbeast_Addon_Fire_Garon,"");*/
	/*Вставляем монстрятину*/
};
// Эсмеральда
func void INIT_SUB_DS2P_ATOLL_SHIP()
{
	Wld_AssignRoomToGuild("BUG",GIL_G2NV);
	Wld_AssignRoomToGuild("CAPTAIN",GIL_G2NV);
	Wld_AssignRoomToGuild("NAVIGATION",GIL_G2NV);
	Wld_AssignRoomToGuild("KOMBUESE",GIL_G2NV);
};
func void INIT_SUB_DS2P_ATOLL_COAST()
{
	// TO DO pirates owners
	Wld_AssignRoomToGuild("FISHERHUT",GIL_BAU);
	Wld_AssignRoomToGuild("MADHUT",GIL_BAU);
	Wld_AssignRoomToGuild("HEALERHOUSEFLOOR1",GIL_BAU);
	Wld_AssignRoomToGuild("HEALERHOUSEFLOOR2",GIL_BAU);
	Wld_AssignRoomToGuild("BIGBAUHOUSE",GIL_BAU);
	Wld_AssignRoomToGuild("HOUSEHUNTERS",GIL_HUN);
	Wld_AssignRoomToGuild("BARN",GIL_BAU);
	Wld_AssignRoomToGuild("HERDSHOUSEROOM1",GIL_BAU);
	Wld_AssignRoomToGuild("HERDSHOUSEROOM2",GIL_BAU);
	Wld_AssignRoomToGuild("TAVERN",GIL_PUBLIC);
	Wld_AssignRoomToGuild("SALTCAVE",GIL_CAVE);
};
func void INIT_SUB_DS2P_ATOLL_FORT()
{
	Windmill_Enabled = TRUE; // TO DO by quest + timer
	if (Windmill_Enabled == TRUE) {
		Wld_SendTrigger("WINDMILL_ROTOR");
	};
	
	// TO DO pirates owners
	Wld_AssignRoomToGuild("BAUHOUSE1",GIL_BAU);
	Wld_AssignRoomToGuild("BAUHOUSE2",GIL_BAU);
	Wld_AssignRoomToGuild("SMITHHOUSE",GIL_BAU);
	Wld_AssignRoomToGuild("TOWNHALL",GIL_BAU);
	Wld_AssignRoomToGuild("ABANDONEDHOUSE",GIL_ROOMNONE);
	
	Wld_AssignRoomToGuild("RESTCAVE",GIL_PIR);
	Wld_AssignRoomToGuild("TOWNCAVE",GIL_DUNGEON);
	Wld_AssignRoomToGuild("CEMETERYCRYPT",GIL_DUNGEON);
	Wld_AssignRoomToGuild("PILLARCAVE",GIL_CAVE);
	Wld_AssignRoomToGuild("OLDMINE",GIL_CAVE);
	
};
func void INIT_SUB_DS2P_ATOLL_CAMP()
{
	Wld_AssignRoomToGuild("CAMPTELEPORTCAVE",GIL_CAVE);
	Wld_AssignRoomToGuild("WATERCAVE",GIL_CAVE);
	Wld_AssignRoomToGuild("CAMPTUNNEL",GIL_DUNGEON);
	Wld_AssignRoomToGuild("CAMPLEFTROOM",GIL_ROOMNONE);
	Wld_AssignRoomToGuild("CAMPRIGHTROOM",GIL_ROOMNONE);
	// удалены из-за неудачной конфигурации поверхности
	//Wld_AssignRoomToGuild("CAMPDOWNCAVE",GIL_CAVE);
	//Wld_AssignRoomToGuild("DRAGONFORT",GIL_ROOMNONE);
	//Wld_AssignRoomToGuild("DRAGONFORTTUNNEL",GIL_ROOMNONE);
};
func void INIT_SUB_DS2P_ATOLL_FOREST()
{
	Wld_SetMobRoutine(0, 0,"MAGICLAMP",1);
	Wld_SetMobRoutine(20,0,"MAGICLAMP",1);
	Wld_SetMobRoutine(4,30,"MAGICLAMP",0);
	
	Wld_AssignRoomToGuild("BIDGEHOUSE",GIL_OUT);
	Wld_AssignRoomToGuild("LIBRARY",GIL_OUT);
	Wld_AssignRoomToGuild("LIBRARYCELLAR",GIL_DUNGEON);
	Wld_AssignRoomToGuild("CAVEUNDERLIBRARY",GIL_CAVE);
	Wld_AssignRoomToGuild("FORESTHUT",GIL_HUN);
	Wld_AssignRoomToGuild("SWAMPTEMPLE",GIL_GOBBO);
	Wld_AssignRoomToGuild("SWAMPTEMPLECAVES",GIL_GOBBO);
	Wld_AssignRoomToGuild("RUINSUNDERWATER",GIL_DUNGEON);
	Wld_AssignRoomToGuild("RUINSTEMPLE",GIL_DUNGEON);
	Wld_AssignRoomToGuild("RUINSLEFTROOM",GIL_DUNGEON);
	Wld_AssignRoomToGuild("RUINSRIGHTROOM",GIL_DUNGEON);
	Wld_AssignRoomToGuild("RUINSMIDROOM",GIL_DUNGEON);
	Wld_AssignRoomToGuild("CAVEOVERSWAMP",GIL_CAVE);
	Wld_AssignRoomToGuild("FORESTCAVE",GIL_CAVE);
	Wld_AssignRoomToGuild("FORESTMINE",GIL_CAVE);
	
};
func void INIT_DS2P_ATOLL()
{
	CurrentLevel = DSG_PROLOG_ZEN;
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	B_DS2P_InitLanSkeleton();//внешность Лана
	INIT_SUB_DS2P_ATOLL_SHIP();
	INIT_SUB_DS2P_ATOLL_COAST();
	INIT_SUB_DS2P_ATOLL_FORT();
	INIT_SUB_DS2P_ATOLL_CAMP();
	INIT_SUB_DS2P_ATOLL_FOREST();
};

/*======================================
            Сон Лана
========================================*/

func void STARTUP_DS2P_LAN_DREAM()
{
	Wld_InsertNpc(PIR_2071_DS2P_LanSkeleton_SK_Dream,""); // Лан-скелет, который стоит возле клетки
	Wld_InsertNpc(PIR_2072_DS2P_LanSkeleton_HM_Dream,""); // Лан-человек, который стоит в клетке
};
func void INIT_SUB_DS2P_LAN_DREAM()
{
};
func void INIT_DS2P_LAN_DREAM()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_DS2P_LAN_DREAM();
};


/*======================================
        Храм Черепа (сон Аластера)
========================================*/

func void STARTUP_DS2P_SKULLTEMPLE()
{

};
func void INIT_SUB_DS2P_SKULLTEMPLE()
{
};
func void INIT_DS2P_SKULLTEMPLE()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_DS2P_SKULLTEMPLE();
};

//* МУСОР *//
//* VVVVV *//
func void STARTUP_Testlevel()
{
};
func void INIT_SUB_Testlevel()
{
};
func void INIT_Testlevel()
{
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_InitNpcGlobals();
	INIT_SUB_Testlevel();
};
