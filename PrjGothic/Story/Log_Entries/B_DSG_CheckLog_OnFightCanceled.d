
//* NS - 18/07/2013
// ��������� �������, ���� �� ��� NPC ������, �������� �� ZS_Attack
func void B_DS2P_CheckLog_OnFightCanceled(var C_NPC slf, var C_NPC oth)
{
	// ���� ������
	if (MIS_DS2P_GrandsonOfFisherman == LOG_Running)
	{
		//�� ������ - ����� � ����� ��������
		if ((Garon_FightPirates == Garon_FightPirates_Started) && C_NpcIsHero(oth))
		{
			var C_NPC Garon;	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
			var C_NPC Harok;	Harok = Hlp_GetNpc(BAU_101_DS2P_HAROK);
			B_KillNpc(Garon);
			B_KillNpc(Harok);
			Garon_FightPirates = Garon_FightPirates_Canceled;
		};
	};
};
