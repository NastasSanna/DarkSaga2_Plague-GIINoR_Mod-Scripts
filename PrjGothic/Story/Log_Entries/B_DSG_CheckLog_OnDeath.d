
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
			// TO DO �������� ��������� ����������: 1) ����� ������ �� ������ "��� ���������" 2) ? ����, ���� �� ��������
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
};
