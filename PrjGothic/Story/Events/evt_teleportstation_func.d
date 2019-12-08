
func void EVT_TELEPORTSTATION_FUNC()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	SCUsed_TELEPORTER = TRUE;
	/*Redleha: здесь тело функции телепорта*/
	if(CurrentLevel == DSG_PROLOG_ZEN)
	{
		if(Npc_GetDistToWP(hero,"DP_COAST_TOWN_CELLAR_IN_TELEPORT") < 3000)
		{
			AI_Teleport(hero,"CAMP_TELEPORTCAVE");
			if(SCUsed_TELEPORTER_TOWN == FALSE)
			{
				B_LogNote(TOPIC_DS2P_TELEPORT,TOPIC_DS2P_TELEPORT_TO_CAMPCAVE);
			};
			SCUsed_TELEPORTER_TOWN = TRUE;
		};
		if(Npc_GetDistToWP(hero,"DP_CAMP_CAVE_TELEPORTSTATION") < 3000)
		{
			AI_Teleport(hero,"RUINS");
			if(SCUsed_TELEPORTER_CAMPCAVE == FALSE)
			{
				B_LogNote(TOPIC_DS2P_TELEPORT,TOPIC_DS2P_TELEPORT_TO_RUINS);
			};
			SCUsed_TELEPORTER_CAMPCAVE = TRUE;
		};
		if(Npc_GetDistToWP(hero,"DP_RUINS_TELEPORTSTATION") < 3000)
		{
			AI_Teleport(hero,"SWAMP");
			if(SCUsed_TELEPORTER_RUINS == FALSE)
			{
				B_LogNote(TOPIC_DS2P_TELEPORT,TOPIC_DS2P_TELEPORT_TO_SWAMP);
			};
			SCUsed_TELEPORTER_RUINS = TRUE;
		};
		if(Npc_GetDistToWP(hero,"DP_FOREST_SWAMP_TELEPORTSTATION") < 3000)
		{
			AI_Teleport(hero,"LIBRARY");
			if(SCUsed_TELEPORTER_SWAMP == FALSE)
			{
				B_LogNote(TOPIC_DS2P_TELEPORT,TOPIC_DS2P_TELEPORT_TO_LIBRARY);
			};
			SCUsed_TELEPORTER_SWAMP = TRUE;
		};
		if(Npc_GetDistToWP(hero,"DP_FOREST_LIBRARY_BASEMENT_TELEPORT") < 3000)
		{
			AI_Teleport(hero,"TOWN");
			if(SCUsed_TELEPORTER_LIBRARY == FALSE)
			{
				B_LogNote(TOPIC_DS2P_TELEPORT,TOPIC_DS2P_TELEPORT_TO_TOWN);
			};
			SCUsed_TELEPORTER_LIBRARY = TRUE;
		};
	};
};


func void TRIGGER_TELEPORT_CAMPCAVE_FUNC() 
{
	// TO DO
	PrintDebug("Teleport CAMPCAVE activated");
};

func void TRIGGER_TELEPORT_RUINS_FUNC() 
{
	// TO DO
	PrintDebug("Teleport RUINS activated");
};

func void TRIGGER_TELEPORT_SWAMP_FUNC() 
{
	// TO DO
	PrintDebug("Teleport SWAMP activated");
};

func void TRIGGER_TELEPORT_LIBRARY_FUNC() 
{
	// TO DO
	PrintDebug("Teleport LIBRARY activated");
};

// Функции для проверки, можно ли активировать телепорт:
//  - только один раз
//  - нужен фокусирующий камень
//  - фокусирующий камень сразу удалится из инвентаря

func int CanUse_Have_Focus()
{
	if (Npc_HasItems(hero, ItMi_Focus)) {
		Npc_RemoveInvItem(hero, ItMi_Focus);
		return TRUE;
	};
	Print(PRINT_No_Focus);
	return FALSE;
};

var int Focus_Activated_CampCave;
func int CANUSE_FOCUS_CAMPCAVE_FUNC()
{
	if (!Focus_Activated_CampCave)
	{
		if (CanUse_Have_Focus())
		{
			Focus_Activated_CampCave = TRUE;
			return TRUE;
		};
	};
	return FALSE;
};

var int Focus_Activated_Ruins;
func int CANUSE_FOCUS_RUINS_FUNC()
{
	if (!Focus_Activated_Ruins)
	{
		if (CanUse_Have_Focus())
		{
			Focus_Activated_Ruins = TRUE;
			return TRUE;
		};
	};
	return FALSE;
};

var int Focus_Activated_Swamp;
func int CANUSE_FOCUS_SWAMP_FUNC()
{
	if (!Focus_Activated_Swamp)
	{
		if (CanUse_Have_Focus())
		{
			Focus_Activated_Swamp = TRUE;
			return TRUE;
		};
	};
	return FALSE;
};

var int Focus_Activated_Library;
func int CANUSE_FOCUS_LIBRARY_FUNC()
{
	if (!Focus_Activated_Library)
	{
		if (CanUse_Have_Focus())
		{
			Focus_Activated_Library = TRUE;
			return TRUE;
		};
	};
	return FALSE;
};


