
//* NS - 18/07/2013
// ��������� ������� ��� ���������� NPC � ���, �������� �� ZS_Unconscious
func void B_DS2P_CheckLog_OnUnconscious(var C_NPC slf)
{
	// ���� ������
	if (MIS_DS2P_GrandsonOfFisherman == LOG_Running)
	{
		//�������� ����� ������� � ����� - ��������
		if ((C_NpcIs(slf,PIR_202_DS2P_Symon)	|| C_NpcIs(slf,Pir_204_DS2P_Karah))
			&& (Garon_FightPirates == Garon_FightPirates_Started))
		{
			var C_NPC Karah;	Karah = Hlp_GetNpc(Pir_204_DS2P_Karah);
			var C_NPC Symon;	Symon = Hlp_GetNpc(PIR_202_DS2P_Symon);
			if ((Karah.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
				 && (Symon.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
			{
				Garon_FightPirates = Garon_FightPirates_Finished;
			};
		};
	};
	// ��������� �����
	if (MIS_DS2P_DamnSailor == LOG_Running)
	{
		//������� ���������� �����
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PIR_200_DS2P_GARD))
		{
			self.flags = self.flags | NPC_FLAG_IMMORTAL;
		};
	};
	// ����� ����� ���, �� � ����� �������
	// ��������� ����� ������
	if ((SueBaby_GrayBeard_Fight > 0) && (SueBaby_GrayBeard_Fight_End == FALSE))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard))
		{
			if (SueBaby_GrayBeard_Fight == 1) // ���������, �� ���������� �� �� � ���
			{
				SueBaby_GrayBeard_Fight = 2;
				SueBaby_GrayBeard_Fight_End = TRUE;
			}
			else if (SueBaby_GrayBeard_Fight == 6) // ���������, ��������� �� ��
			{
				SueBaby_GrayBeard_Fight = 3;
				SueBaby_GrayBeard_Fight_End = TRUE;
			}
			else if (SueBaby_GrayBeard_Fight == 7) // ���������, ���������� �� ���
			{
				SueBaby_GrayBeard_Fight = 4;
				SueBaby_GrayBeard_Fight_End = TRUE;
			};
		};
	};
	// ��������� ��
	if ((SueBaby_GrayBeard_Fight > 0) && (SueBaby_GrayBeard_Fight_End == FALSE))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
		{
			if (SueBaby_GrayBeard_Fight == 2) // ���������, ��������� �� ����� ������
			{
				SueBaby_GrayBeard_Fight = 2;
				SueBaby_GrayBeard_Fight_End = TRUE;
			}
			else if (SueBaby_GrayBeard_Fight == 7) // ���������, ���������� �� ���
			{
				SueBaby_GrayBeard_Fight = 5;
				SueBaby_GrayBeard_Fight_End = TRUE;
			}
			else if (SueBaby_GrayBeard_Fight == 1) // ���� ����� �� ���������
			{
				SueBaby_GrayBeard_Fight = 6;
			};
		};
	};
	// ���������� ���
	if ((SueBaby_GrayBeard_Fight > 0) && (SueBaby_GrayBeard_Fight_End == FALSE))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SueBaby))
		{
			if (SueBaby_GrayBeard_Fight == 1) // ���� ����� �� ���������
			{
				SueBaby_GrayBeard_Fight = 7;
			}
			else if (SueBaby_GrayBeard_Fight == 6) // ���� ��������� ��
			{
				SueBaby_GrayBeard_Fight = 5;
				SueBaby_GrayBeard_Fight_End = TRUE;
			};
		};
	};
	if (GrayBeard_AttackIsOver == FALSE)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) //���� ��������� ����� ������
		{
			GrayBeard_AttackWinner = 1;
			GrayBeard_AttackNum = GrayBeard_AttackNum + 1; // ���������� ��� � ������ ���-�� ���� ����� ����� ������� � ��
			GrayBeard_AttackIsOver = TRUE;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard)) //���� ��������� ��
		{
			GrayBeard_AttackWinner = 2;
			GrayBeard_AttackNum = GrayBeard_AttackNum + 1; // ���������� ��� � ������ ���-�� ���� ����� ����� ������� � ��
			GrayBeard_AttackIsOver = TRUE; // ��������� �����
		};
	};
	// ������������ ����� �� � ����� �������
	if (GB_CompetitionState == 1 && Npc_KnowsInfo(hero,DIA_GrayBeard_KilledShadowbeast_01))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) // ���� ����� ������ ��������� �� � �������� ����
		{
			GB_CompetitionState = 3;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_09);
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard)) // ���� ����� ������ �� ���� �������� ��
		{
			GB_CompetitionState = 6;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_08);
		};
	};
	if (GB_CompetitionState == 4) // ���� �� ����� ����� ������ �� ������ � ������
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) // ���� �� �� ���� ������ ����� ������ �� ������ � ������
		{
			GB_CompetitionState = 8;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard)) // ���� �� ���� ������ ����� ������ �� ������ � ������
		{
			GB_CompetitionState = 5;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_11);
			B_StartOtherRoutine(GrayBeard,"START");
		};
	};
	if (GB_CompetitionState == 9) // ������ ���������
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) // ���� �� ��������
		{
			GB_Comp_02_Winner = 2;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard)) // ���� �� �������
		{
			GB_Comp_02_Winner = 1;
		};
	};
	if (Npc_KnowsInfo(hero,DIA_Ado_AfterSamogonAdo) && (AlternativeSamogon_FightAdo == 0)) // ����� ����� ��� � ��, ����� ��� �����, ��� �� ��� ��� ������������
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) // ���� �� ��������
		{
			AlternativeSamogon_FightAdo = 2;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ado)) // ���� �� �������
		{
			AlternativeSamogon_FightAdo = 1;
		};
	};
	if (Npc_KnowsInfo(hero,DIA_Skip_ConspiracyOver)) // ���� ���� ����� �� ����� �� ��, ��� ��� ������ ���
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skip))
		{
			self.attribute[ATR_HITPOINTS_MAX] = Skip_GregFight; // ���������� �� ����� � �����
			Skip_IsGregFight = TRUE;
		};
	};
};