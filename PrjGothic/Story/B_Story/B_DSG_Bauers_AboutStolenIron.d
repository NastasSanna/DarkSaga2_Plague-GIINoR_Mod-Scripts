
// ������������, ������� �������� �������� �� ������ ����������� ������
func void B_DSG_Bauers_AboutStolenIron_Counter()
{
	Bauers_AboutIron_Count += 1;
	// ���� ����������
	if (Bauers_AboutIron_Count >= Bauers_AboutIron_Max)
	{
		//������ � �������� "��� ����� ��� ������?" 
		B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_AskFail);
	};
};