
//�� ���� � ������ ����� �� �������
func void EVT_DS2P_GardChestOpen()
{
	//���� ���
	if ((MIS_DS2P_DamnSailor == LOG_Running) && !Gard_ChestForced)	{
		Gard_ChestForced = TRUE;
		//UNFINISHED ������� WP ����� �������
		AI_Teleport(PIR_200_DS2P_GARD,"");
		AI_StartState(PIR_200_DS2P_GARD,ZS_Follow_Player,0,"");
	};
};