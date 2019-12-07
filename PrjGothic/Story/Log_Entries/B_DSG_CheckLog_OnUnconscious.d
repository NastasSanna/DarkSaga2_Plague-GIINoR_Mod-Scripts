
//* NS - 18/07/2013
// квестовые события при поражениее NPC в бою, вызывать из ZS_Unconscious
func void B_DS2P_CheckLog_OnUnconscious(var C_NPC slf)
{
	// Внук рыбака
	if (MIS_DS2P_GrandsonOfFisherman == LOG_Running)
	{
		//Вырубили ОБОИХ пиратов в драке - отмечаем
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
	// Проклятый моряк
	if (MIS_DS2P_DamnSailor == LOG_Running)
	{
		//вернуть бессмертие Гарду
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PIR_200_DS2P_GARD))
		{
			self.flags = self.flags | NPC_FLAG_IMMORTAL;
		};
	};
	// Битва между Сью, ГГ и Серой Бородой
	// Вырубился Серая Борода
	if ((SueBaby_GrayBeard_Fight > 0) && (SueBaby_GrayBeard_Fight_End == FALSE))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard))
		{
			if (SueBaby_GrayBeard_Fight == 1) // Проверяем, не вырубились ли ГГ и Сью
			{
				SueBaby_GrayBeard_Fight = 2;
				SueBaby_GrayBeard_Fight_End = TRUE;
			}
			else if (SueBaby_GrayBeard_Fight == 6) // Проверяем, вырубился ли ГГ
			{
				SueBaby_GrayBeard_Fight = 3;
				SueBaby_GrayBeard_Fight_End = TRUE;
			}
			else if (SueBaby_GrayBeard_Fight == 7) // Проверяем, вырубилась ли Сью
			{
				SueBaby_GrayBeard_Fight = 4;
				SueBaby_GrayBeard_Fight_End = TRUE;
			};
		};
	};
	// Вырубился ГГ
	if ((SueBaby_GrayBeard_Fight > 0) && (SueBaby_GrayBeard_Fight_End == FALSE))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
		{
			if (SueBaby_GrayBeard_Fight == 2) // Проверяем, вырубился ли Серая Борода
			{
				SueBaby_GrayBeard_Fight = 2;
				SueBaby_GrayBeard_Fight_End = TRUE;
			}
			else if (SueBaby_GrayBeard_Fight == 7) // Проверяем, вырубилась ли Сью
			{
				SueBaby_GrayBeard_Fight = 5;
				SueBaby_GrayBeard_Fight_End = TRUE;
			}
			else if (SueBaby_GrayBeard_Fight == 1) // Если никто не вырубился
			{
				SueBaby_GrayBeard_Fight = 6;
			};
		};
	};
	// Вырубилась Сью
	if ((SueBaby_GrayBeard_Fight > 0) && (SueBaby_GrayBeard_Fight_End == FALSE))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SueBaby))
		{
			if (SueBaby_GrayBeard_Fight == 1) // Если никто не вырубился
			{
				SueBaby_GrayBeard_Fight = 7;
			}
			else if (SueBaby_GrayBeard_Fight == 6) // Если вырубился ГГ
			{
				SueBaby_GrayBeard_Fight = 5;
				SueBaby_GrayBeard_Fight_End = TRUE;
			};
		};
	};
	if (GrayBeard_AttackIsOver == FALSE)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) //Если побеждает Серая Борода
		{
			GrayBeard_AttackWinner = 1;
			GrayBeard_AttackNum = GrayBeard_AttackNum + 1; // Прибавляем бой к общему кол-ву боев между Серой Бородой и ГГ
			GrayBeard_AttackIsOver = TRUE;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard)) //Если побеждает ГГ
		{
			GrayBeard_AttackWinner = 2;
			GrayBeard_AttackNum = GrayBeard_AttackNum + 1; // Прибавляем бой к общему кол-ву боев между Серой Бородой и ГГ
			GrayBeard_AttackIsOver = TRUE; // Завершаем битву
		};
	};
	// Соревнование между ГГ и Серой Бородой
	if (GB_CompetitionState == 1 && Npc_KnowsInfo(hero,DIA_GrayBeard_KilledShadowbeast_01))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) // Если Серая Борода побеждает ГГ и забирает рога
		{
			GB_CompetitionState = 3;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_09);
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard)) // Если Серая Борода не смог победить ГГ
		{
			GB_CompetitionState = 6;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_08);
		};
	};
	if (GB_CompetitionState == 4) // Если ГГ напал Серую Бороду по дороге в лагерь
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) // Если ГГ не смог побить Серую Бороду по дороге в лагерь
		{
			GB_CompetitionState = 8;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard)) // Если ГГ смог побить Серую Бороду по дороге в лагерь
		{
			GB_CompetitionState = 5;
			B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_11);
			B_StartOtherRoutine(GrayBeard,"START");
		};
	};
	if (GB_CompetitionState == 9) // Второе испытание
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) // Если ГГ проиграл
		{
			GB_Comp_02_Winner = 2;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GrayBeard)) // Если ГГ выиграл
		{
			GB_Comp_02_Winner = 1;
		};
	};
	if (Npc_KnowsInfo(hero,DIA_Ado_AfterSamogonAdo) && (AlternativeSamogon_FightAdo == 0)) // Драка между Адо и ГГ, когда Адо узнал, что ГГ дал ему слабительное
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero)) // Если ГГ проиграл
		{
			AlternativeSamogon_FightAdo = 2;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ado)) // Если ГГ выиграл
		{
			AlternativeSamogon_FightAdo = 1;
		};
	};
	if (Npc_KnowsInfo(hero,DIA_Skip_ConspiracyOver)) // Если Грег напал на Скипа за то, что тот предал его
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skip))
		{
			self.attribute[ATR_HITPOINTS_MAX] = Skip_GregFight; // Возвращаем ХП Скипа в норму
			Skip_IsGregFight = TRUE;
		};
	};
};