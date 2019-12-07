
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
			// TO DO добавить квестовые исключения: 1) Серая Борода по квесту "Меч призраков" 2) ? Скип, пока не вернулся
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
};
