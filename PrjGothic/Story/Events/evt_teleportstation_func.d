
func void EVT_TELEPORTSTATION_FUNC()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	SCUsed_TELEPORTER = TRUE;
	/*Redleha: здесь тело функции телепорта*/
		if(CurrentLevel == DSG_PROLOG_ZEN)
	{
		if(Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_CITY") < 3000)
		{
			AI_Teleport(hero,"NW_TELEPORTSTATION_TAVERNE");
			if(SCUsed_NW_TELEPORTSTATION_CITY == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
				B_LogEntry(TOPIC_Addon_TeleportsNW,"Телепорт в пещере к востоку от города ведет к таверне 'Мертвая Гарпия'.");
			};
			SCUsed_NW_TELEPORTSTATION_CITY = TRUE;
		}
	};
};


func void TRIGGER_TELEPORT_CAMPCAVE() 
{
	// TO DO
};

func void TRIGGER_TELEPORT_RUINS() 
{
	// TO DO
};

func void TRIGGER_TELEPORT_SWAMP() 
{
	// TO DO
};

func void TRIGGER_TELEPORT_LIBRARY() 
{
	// TO DO
};