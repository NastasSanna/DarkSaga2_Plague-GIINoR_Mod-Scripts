
//* NS - 18/07/2013
// квестовые события при смерти NPC, вызывать из ZS_Dead
func void B_DS2P_CheckLog_OnDeath(var C_NPC slf)
{
	// Убийство пирата ------------------------------------------------------------
	if(self.guild == GIL_PIR)	
	{
		if(Npc_IsPlayer(other))
		{
			GGKillPirat_self_inVillage = TRUE;
			CRIME_PiratesKilled_Cnt +=1;
			//UNFINISHED добавить квестовые исключения: 1) Серая Борода по квесту "Меч призраков" 2) ? Скип, пока не вернулся
		};
		PiratKillCount += 1;
		if(self.npcType = NPCTYPE_PIR_MAIN)
		{
			PiratMainKillCount += 1;
		};
		//* Если поссорились с пиратами, проверяем чистоту деревни и закрываем квест "Остров в осаде" *//
		if(WAR_HAS_COME && (PiratMainKillCount >= 13) && Npc_IsDead(Gard) && Npc_IsDead(Greg))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_IslandUnderSiege_AllPiratesAreDead);
			WAR_HAS_COME = FALSE;
			All_Pirat_Killed = TRUE;
		};
	};
	//по квесту "ВЫБОР ТАМИРА"------------------------------------------------------------
	if (MIS_DS2P_TamirChoice == LOG_Running)	{
		/*СЧЁТЧИК УБИТЫХ ПАДАЛЬЩИКОВ	*/
		if (self.guild == GIL_SCAVENGER)		{
			Tamir_ScavengersDie_Count += 1;
		};
		/*СЧЁТЧИК УБИТЫХ ВАРГОВ	*/
		if (self.aivar[AIV_MM_REAL_ID] == ID_WARG)		{
			Tamir_WargsDie_Count += 1;
		};
	};
	// Азартный игрок -------------------------------------------------------------
	if (MIS_DS2P_Gambler == LOG_Running)	{
		//пираты - отменить
		if (C_NpcIs(slf,PIR_209_DS2P_Vales) || C_NpcIs(slf,PIR_203_DS2P_Zedd) || C_NpcIs(slf,PIR_205_DS2P_Joseph))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_OBSOLETE,"");
		};
		//Мария
		if (C_NpcIs(slf,BAU_106_DS2P_Maria) && !Maria_MadeClothes)	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_OBSOLETE,"");	//UNFINISHED - некому сшить костюмы
		};
	};
	
	// Старая мельница -------------------------------------------------------------
	if (MIS_DS2P_OldMill == LOG_Running)	{
		//Джзеф - отменить
		if (C_NpcIs(slf,PIR_205_DS2P_Joseph))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	
	// Кто украл мое железо? -------------------------------------------------------------
	if (MIS_DS2P_WhoStoleMyIron == LOG_Running)	{
		//Джзеф - отменить
		if (C_NpcIs(slf,PIR_205_DS2P_Joseph))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	
	// Внук рыбака -------------------------------------------------------------
	if (MIS_DS2P_GrandsonOfFisherman == LOG_Running)
	{
		//Гарон погиб, но не в лесу
		if (C_NpcIs(slf, BAU_117_DS2P_Garon) && (Garon_Choice != Garon_Choice_GoForest))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_GrandsonOfFisherman_FailGaronDead);
		};
		//Харок погиб, но не в драке с пиратами
		if (C_NpcIs(slf, BAU_101_DS2P_HAROK) && (Garon_FightPirates == FALSE))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_GrandsonOfFisherman_FailHarokDead);
		};
	};
	
	// Белая горячка -------------------------------------------------------------
	if (MIS_DS2P_DeliriumTremens == LOG_Running)	{
		//Зедд - отменить
		if (C_NpcIs(slf,PIR_203_DS2P_Zedd))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_OBSOLETE,"");
		};
		//Цимм - провал
		if (C_NpcIs(slf,BAU_103_DS2P_Cimm) && !Npc_KnowsInfo(hero,DIA_Cimm_MadeSoberingPotion))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_DeliriumTremens_FailCimmDead);
		};
	};
	
	// Проклятый моряк -------------------------------------------------------------
	if (MIS_DS2P_DamnSailor == LOG_Running)	{
		//Лан - отменить
		if (C_NpcIs(slf,PIR_207_DS2P_LanSkeleton))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	
	// В поисках сокровищ -------------------------------------------------------------
	if (MIS_DS2P_InSearchOfTreasure == LOG_Running)	{
		//Адо - отменить
		if (C_NpcIs(slf,PIR_211_DS2P_Ado))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	
	// Орк в беде -------------------------------------------------------------
	if (MIS_DS2P_OrcInTrouble == LOG_Running)	{
		//Рак-Тарак - отменить
		if (C_NpcIs(slf,Orc_DS2P_RakTarak))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_OBSOLETE,"");
		};
		//Ар-Туш - провал
		if (C_NpcIs(slf,Orc_DS2P_ArTush))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_OrcInTrouble_Fail);
		};
	};
	
	// Пропавший друг -------------------------------------------------------------
	if (MIS_DS2P_MissingFriend == LOG_Running)	{
		//Ку-Ла - отменить
		if (C_NpcIs(slf,Gobbo_DS2P_KuLa))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_OBSOLETE,"");
		};
		//Та-Ко-Пи - провал
		if (C_NpcIs(slf,Wolf_DS2P_TaKoPi))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_MissingFriend_Fail);
		};
	};
	
	// Проучить Серую Бороду -------------------------------------------------------------
	if (MIS_DS2P_TeachGrayBeard == Log_Running)
	{
		// Серая Борода - выполнено, или отменено
		if (C_NpcIs(slf,GrayBeard))
		{
			if (MIS_DS2P_GhostsSword == Log_Running) // Если активен квест "Меч призраков", то квест "Проучить Серую Бороду" выполнен
			{
				B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_GrayBeardIsDead);
			}
			else // Если не активен - то отменить
			{
				B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_OBSOLETE,"");
			};
		};
		// Малышка Сью - отменить
		if (C_NpcIS(slf,SueBaby))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// Кошмары -------------------------------------------------------------
	if (MIS_DS2P_Nightmares == Log_Running)
	{
		// Лан - отменено
		if (C_NpcIs(slf,LanSkeleton))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Nightmares,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// Подставить Йорна -------------------------------------------------------------
	if (MIS_DS2P_ExposeJorn == Log_Running)
	{
		// Йорн - провалено
		if (C_NpcIs(slf,Jorn))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_FAILED,"");
		};
		// Адо - отменено
		if (C_NpcIs(slf,Ado))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_OBSOLETE,"");
		};
		// Цимм - провалено, если он еще не дал самогон
		if (C_NpcIs(slf,Cimm))
		{
			if (Cimm_CookSamogon == FALSE)
			{
				B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_OBSOLETE,"");
			};
		};
	};
	// Арбалет для Караха -------------------------------------------------------------
	if (MIS_DS2P_Cbow4Karah == Log_Running)
	{
		// Карах - отменено
		if (C_NpcIs(slf,Karah))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Cbow4Karah,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// Зачарованные болты -------------------------------------------------------------
	if (MIS_DS2P_CharmedBolts == Log_Running)
	{
		// Карах - отменено
		if (C_NpcIs(slf,Karah))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_OBSOLETE,"");
		};
		// Джозеф - если не дал болты, от провалено (ГГ может изготавливать болты?)
		if (C_NpcIs(slf,Joseph))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_FAILED,"");
		};
	};
	// Найти сбежавших охотников -------------------------------------------------------------
	if (MIS_DS2P_FindEscapedHunters == Log_Running)
	{
		// Гард - отменено
		if (C_NpcIs(slf,Gard))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// Особый топор для Джозефа -------------------------------------------------------------
	if (MIS_DS2P_SpecialAxe4Joseph == Log_Running)
	{
		// Джозеф - отменено
		if (C_NpcIs(slf,Joseph))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// Из пиратов...в крестьяне -------------------------------------------------------------
	if (MIS_DS2P_FromPiratesToPeasants == Log_Running)
	{
		// Валес - отменено
		if (C_NpcIs(slf,Vales))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,LOG_MISSION,LOG_OBSOLETE,"");
		};
		// Грег - провалено
		if (C_NpcIs(slf,Greg))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,LOG_MISSION,LOG_FAILED,"");
		};
	};
	// Помочь добиться Сью -------------------------------------------------------------
	if (MIS_DS2P_WinSueHand == Log_Running)
	{
		// Саймон - отменено
		if (C_NpcIs(slf,Symon))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_OBSOLETE,"");
		};
		// Сью - провалено
		if (C_NpcIs(slf,SueBaby))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_FAILED,"");
		};
	};
	// Компромат на Зедда -------------------------------------------------------------
	if (MIS_DS2P_CompromiseZedd == Log_Running)
	{
		// Зедд - отменено
		if (C_NpcIs(slf,Zedd))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// Возмездие! -------------------------------------------------------------
	if (MIS_DS2P_Punishment == Log_Running)
	{
		// Гард
		if (C_NpcIs(slf,Gard))
		{
			// До собрания - провалено
			if (Conspiracy_IsStarted == FALSE)
			{
				B_DSG_Log_OpenClose(TOPIC_DS2P_Punishment,LOG_MISSION,LOG_FAILED,"");
			};
		};
		// Сью - отменено
		if (C_NpcIs(slf,SueBaby))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Punishment,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// Заговор -------------------------------------------------------------


	// Ушлый вор -------------------------------------------------------------
	if (MIS_DS2P_QuirkyThief == LOG_Running)	{
		//Джа-Аф-Фар - провал
		if (C_NpcIs(slf,Gobbo_DS2P_KuLa))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_FAILED,"Джа-Аф-Фар мертв.");
		};
	};
};
