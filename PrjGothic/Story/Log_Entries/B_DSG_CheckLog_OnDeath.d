
//* NS - 18/07/2013
// ��������� ������� ��� ������ NPC, �������� �� ZS_Dead
func void B_DS2P_CheckLog_OnDeath(var C_NPC slf)
{
	// �������� ������ ------------------------------------------------------------
	if(self.guild == GIL_PIR)	
	{
		if(Npc_IsPlayer(other))
		{
			GGKillPirat_self_inVillage = TRUE;
			CRIME_PiratesKilled_Cnt +=1;
			//UNFINISHED �������� ��������� ����������: 1) ����� ������ �� ������ "��� ���������" 2) ? ����, ���� �� ��������
		};
		PiratKillCount += 1;
		if(self.npcType = NPCTYPE_PIR_MAIN)
		{
			PiratMainKillCount += 1;
		};
		//* ���� ����������� � ��������, ��������� ������� ������� � ��������� ����� "������ � �����" *//
		if(WAR_HAS_COME && (PiratMainKillCount >= 13) && Npc_IsDead(Gard) && Npc_IsDead(Greg))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_IslandUnderSiege,LOG_MISSION,LOG_SUCCESS,TOPIC_DS2P_IslandUnderSiege_AllPiratesAreDead);
			WAR_HAS_COME = FALSE;
			All_Pirat_Killed = TRUE;
		};
	};
	//�� ������ "����� ������"------------------------------------------------------------
	if (MIS_DS2P_TamirChoice == LOG_Running)	{
		/*�ר���� ������ �����������	*/
		if (self.guild == GIL_SCAVENGER)		{
			Tamir_ScavengersDie_Count += 1;
		};
		/*�ר���� ������ ������	*/
		if (self.aivar[AIV_MM_REAL_ID] == ID_WARG)		{
			Tamir_WargsDie_Count += 1;
		};
	};
	// �������� ����� -------------------------------------------------------------
	if (MIS_DS2P_Gambler == LOG_Running)	{
		//������ - ��������
		if (C_NpcIs(slf,PIR_209_DS2P_Vales) || C_NpcIs(slf,PIR_203_DS2P_Zedd) || C_NpcIs(slf,PIR_205_DS2P_Joseph))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_OBSOLETE,"");
		};
		//�����
		if (C_NpcIs(slf,BAU_106_DS2P_Maria) && !Maria_MadeClothes)	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Gambler,LOG_MISSION,LOG_OBSOLETE,"");	//UNFINISHED - ������ ����� �������
		};
	};
	
	// ������ �������� -------------------------------------------------------------
	if (MIS_DS2P_OldMill == LOG_Running)	{
		//����� - ��������
		if (C_NpcIs(slf,PIR_205_DS2P_Joseph))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_OldMill,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	
	// ��� ����� ��� ������? -------------------------------------------------------------
	if (MIS_DS2P_WhoStoleMyIron == LOG_Running)	{
		//����� - ��������
		if (C_NpcIs(slf,PIR_205_DS2P_Joseph))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	
	// ���� ������ -------------------------------------------------------------
	if (MIS_DS2P_GrandsonOfFisherman == LOG_Running)
	{
		//����� �����, �� �� � ����
		if (C_NpcIs(slf, BAU_117_DS2P_Garon) && (Garon_Choice != Garon_Choice_GoForest))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_GrandsonOfFisherman_FailGaronDead);
		};
		//����� �����, �� �� � ����� � ��������
		if (C_NpcIs(slf, BAU_101_DS2P_HAROK) && (Garon_FightPirates == FALSE))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_GrandsonOfFisherman,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_GrandsonOfFisherman_FailHarokDead);
		};
	};
	
	// ����� ������� -------------------------------------------------------------
	if (MIS_DS2P_DeliriumTremens == LOG_Running)	{
		//���� - ��������
		if (C_NpcIs(slf,PIR_203_DS2P_Zedd))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_OBSOLETE,"");
		};
		//���� - ������
		if (C_NpcIs(slf,BAU_103_DS2P_Cimm) && !Npc_KnowsInfo(hero,DIA_Cimm_MadeSoberingPotion))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_DeliriumTremens,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_DeliriumTremens_FailCimmDead);
		};
	};
	
	// ��������� ����� -------------------------------------------------------------
	if (MIS_DS2P_DamnSailor == LOG_Running)	{
		//��� - ��������
		if (C_NpcIs(slf,PIR_207_DS2P_LanSkeleton))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_DamnSailor,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	
	// � ������� �������� -------------------------------------------------------------
	if (MIS_DS2P_InSearchOfTreasure == LOG_Running)	{
		//��� - ��������
		if (C_NpcIs(slf,PIR_211_DS2P_Ado))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	
	// ��� � ���� -------------------------------------------------------------
	if (MIS_DS2P_OrcInTrouble == LOG_Running)	{
		//���-����� - ��������
		if (C_NpcIs(slf,Orc_DS2P_RakTarak))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_OBSOLETE,"");
		};
		//��-��� - ������
		if (C_NpcIs(slf,Orc_DS2P_ArTush))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_OrcInTrouble,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_OrcInTrouble_Fail);
		};
	};
	
	// ��������� ���� -------------------------------------------------------------
	if (MIS_DS2P_MissingFriend == LOG_Running)	{
		//��-�� - ��������
		if (C_NpcIs(slf,Gobbo_DS2P_KuLa))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_OBSOLETE,"");
		};
		//��-��-�� - ������
		if (C_NpcIs(slf,Wolf_DS2P_TaKoPi))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_MissingFriend,LOG_MISSION,LOG_FAILED,TOPIC_DS2P_MissingFriend_Fail);
		};
	};
	
	// �������� ����� ������ -------------------------------------------------------------
	if (MIS_DS2P_TeachGrayBeard == Log_Running)
	{
		// ����� ������ - ���������, ��� ��������
		if (C_NpcIs(slf,GrayBeard))
		{
			if (MIS_DS2P_GhostsSword == Log_Running) // ���� ������� ����� "��� ���������", �� ����� "�������� ����� ������" ��������
			{
				B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_GrayBeardIsDead);
			}
			else // ���� �� ������� - �� ��������
			{
				B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_OBSOLETE,"");
			};
		};
		// ������� ��� - ��������
		if (C_NpcIS(slf,SueBaby))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// ������� -------------------------------------------------------------
	if (MIS_DS2P_Nightmares == Log_Running)
	{
		// ��� - ��������
		if (C_NpcIs(slf,LanSkeleton))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Nightmares,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// ���������� ����� -------------------------------------------------------------
	if (MIS_DS2P_ExposeJorn == Log_Running)
	{
		// ���� - ���������
		if (C_NpcIs(slf,Jorn))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_FAILED,"");
		};
		// ��� - ��������
		if (C_NpcIs(slf,Ado))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_OBSOLETE,"");
		};
		// ���� - ���������, ���� �� ��� �� ��� �������
		if (C_NpcIs(slf,Cimm))
		{
			if (Cimm_CookSamogon == FALSE)
			{
				B_DSG_Log_OpenClose(TOPIC_DS2P_ExposeJorn,LOG_MISSION,LOG_OBSOLETE,"");
			};
		};
	};
	// ������� ��� ������ -------------------------------------------------------------
	if (MIS_DS2P_Cbow4Karah == Log_Running)
	{
		// ����� - ��������
		if (C_NpcIs(slf,Karah))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Cbow4Karah,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// ������������ ����� -------------------------------------------------------------
	if (MIS_DS2P_CharmedBolts == Log_Running)
	{
		// ����� - ��������
		if (C_NpcIs(slf,Karah))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_OBSOLETE,"");
		};
		// ������ - ���� �� ��� �����, �� ��������� (�� ����� ������������� �����?)
		if (C_NpcIs(slf,Joseph))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_CharmedBolts,LOG_MISSION,LOG_FAILED,"");
		};
	};
	// ����� ��������� ��������� -------------------------------------------------------------
	if (MIS_DS2P_FindEscapedHunters == Log_Running)
	{
		// ���� - ��������
		if (C_NpcIs(slf,Gard))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_FindEscapedHunters,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// ������ ����� ��� ������� -------------------------------------------------------------
	if (MIS_DS2P_SpecialAxe4Joseph == Log_Running)
	{
		// ������ - ��������
		if (C_NpcIs(slf,Joseph))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// �� �������...� ��������� -------------------------------------------------------------
	if (MIS_DS2P_FromPiratesToPeasants == Log_Running)
	{
		// ����� - ��������
		if (C_NpcIs(slf,Vales))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,LOG_MISSION,LOG_OBSOLETE,"");
		};
		// ���� - ���������
		if (C_NpcIs(slf,Greg))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_FromPiratesToPeasants,LOG_MISSION,LOG_FAILED,"");
		};
	};
	// ������ �������� ��� -------------------------------------------------------------
	if (MIS_DS2P_WinSueHand == Log_Running)
	{
		// ������ - ��������
		if (C_NpcIs(slf,Symon))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_OBSOLETE,"");
		};
		// ��� - ���������
		if (C_NpcIs(slf,SueBaby))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_WinSueHand,LOG_MISSION,LOG_FAILED,"");
		};
	};
	// ��������� �� ����� -------------------------------------------------------------
	if (MIS_DS2P_CompromiseZedd == Log_Running)
	{
		// ���� - ��������
		if (C_NpcIs(slf,Zedd))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// ���������! -------------------------------------------------------------
	if (MIS_DS2P_Punishment == Log_Running)
	{
		// ����
		if (C_NpcIs(slf,Gard))
		{
			// �� �������� - ���������
			if (Conspiracy_IsStarted == FALSE)
			{
				B_DSG_Log_OpenClose(TOPIC_DS2P_Punishment,LOG_MISSION,LOG_FAILED,"");
			};
		};
		// ��� - ��������
		if (C_NpcIs(slf,SueBaby))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Punishment,LOG_MISSION,LOG_OBSOLETE,"");
		};
	};
	// ������� -------------------------------------------------------------


	// ����� ��� -------------------------------------------------------------
	if (MIS_DS2P_QuirkyThief == LOG_Running)	{
		//���-��-��� - ������
		if (C_NpcIs(slf,Gobbo_DS2P_KuLa))	{
			B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_FAILED,"���-��-��� �����.");
		};
	};
};
