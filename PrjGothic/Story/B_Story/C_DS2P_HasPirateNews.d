
//���� �� ��������� ����� ������
//(�� �������� �������)
func int C_DS2P_HasPirateNews()
{
	//���, ����
	//� �� �����
	if (self.guild != GIL_PIR)	{
		return FALSE;
	};
	//� ���� (��������� ������) ��� ���� (��� ���� �����) UNFINISHED ����? ���� �� ��������
	if (C_NpcIs(self, PIR_200_DS2P_GARD) || C_NpcIs(self, PIR_201_DS2P_Greg))	{
		return FALSE;
	};
	// ��� ������������ ������� �������
	if (CRIME_PiratesKilled_Cnt <= CRIME_PiratesKilled_Paid)	{
		return FALSE;
	};
	//����� - ����
	return TRUE;
};

