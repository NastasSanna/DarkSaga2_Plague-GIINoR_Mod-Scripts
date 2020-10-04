
func void B_DS2P_GobboVillage_GrantAccess()
{
	Gobbos_Attitude = Gobbos_Attitude_Friendly;
	MIS_DS2P_EnterGobboVillage = LOG_SUCCESS;
	B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage, LOG_MISSION, LOG_SUCCESS, TOPIC_DS2P_EnterGobboVillage_Success);
	B_StartOtherRoutine(YahYah,"OPEN");
};

// Все гоблины становятся враждебными. Квесты отменяются
func void B_DS2P_GobboVillage_Hostile()
{
	MEM_Debug("Gobbos hostile");
	Gobbos_Attitude = Gobbos_Attitude_Hostile;
	if (MIS_DS2P_EnterGobboVillage == LOG_Running || MIS_DS2P_EnterGobboVillage == LOG_SUCCESS) {
		// Запись в дневнике. Квест «Проход в деревню гоблинов»: Провален
		MIS_DS2P_EnterGobboVillage = LOG_FAILED;
		B_DSG_Log_OpenClose(TOPIC_DS2P_EnterGobboVillage, LOG_MISSION, LOG_FAILED, TOPIC_DS2P_EnterGobboVillage_Failed);
		Log_SetTopicStatus(TOPIC_DS2P_GobboChiefTrust, LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_DS2P_FigurinesGurun, LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_DS2P_AncientStonePlates, LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_DS2P_MissingFriend, LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_DS2P_QuirkyThief, LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_DS2P_FuriousAncestors, LOG_OBSOLETE);
		Log_SetTopicStatus(TOPIC_DS2P_Protection4LittleOnes, LOG_OBSOLETE);
	};
	B_StartOtherRoutine(YahYah,"START");
	// UNFINISHED гоблины становятся враждебными
};
