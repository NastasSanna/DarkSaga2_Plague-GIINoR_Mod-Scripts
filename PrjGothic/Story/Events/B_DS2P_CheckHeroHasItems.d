
//��������, �� ��������� �� � �� ������ �� ������-�� ������ ��������
//����� �� ds_time
//������ ����� ds_time, ���������� �������� ��� ��������
func void B_DS2P_CheckHeroHasItems()
{
	
	//NS - 10/12/15
	// ����� "�������� ����" ---------------------------------------------
	if (!MIS_DS2P_Fortitude)	//������ - ����� ���� �������� ��������
	{
		if (Npc_HasItems(other,ItAt_Egg_CrawlerQueen) > 0)		{
			//������ � ������� 
			B_DSG_Log_OpenClose(TOPIC_DS2P_Fortitude,LOG_MISSION,LOG_Running,TOPIC_DS2P_Fortitude_Start);
		};
	};
	if (MIS_DS2P_Fortitude == LOG_Running)
	{
		//����� ��� ��������� �����������
		if (MIS_DS2P_Fortitude_IngredientsKnow && !MIS_DS2P_Fortitude_IngredientsGotOnce
			&& (Npc_HasItems(other,ItAt_ShadowHorn) > 0)
			&& (Npc_HasItems(other,ItAt_DS2P_Teeth_Warg) > 0)
			&& (Npc_HasItems(other,ItAt_DS2P_Heart_SwampGolem) > 0))
		{
			//������ � ������� 
			B_DSG_Log_OpenClose(TOPIC_DS2P_Fortitude,LOG_MISSION,LOG_Running,TOPIC_DS2P_Fortitude_AllIngredients);
			MIS_DS2P_Fortitude_IngredientsGotOnce = TRUE;
		};
	};
	
	//NS - 19/12/15
	// ����� "� ������� ��������" ---------------------------------------------
	if (MIS_DS2P_InSearchOfTreasure == LOG_Running)
	{
		//����� 15 �����
		if (MIS_DS2P_Fortitude_IngredientsKnow && !MIS_DS2P_InSearchOfTreasure_CoinsGotOnce
			&& (Npc_HasItems(other,ItMi_OldCoin) >= 15))
		{
			//������ � ������� 
			B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_Running,TOPIC_DS2P_InSearchOfTreasure_CoinsGot);
			MIS_DS2P_InSearchOfTreasure_CoinsGotOnce = TRUE;
		};
	};
};

