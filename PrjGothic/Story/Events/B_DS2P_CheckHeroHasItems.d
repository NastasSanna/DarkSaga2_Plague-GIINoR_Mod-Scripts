
//проверка, не появились ли у ГГ нужные по какому-то квесту предметы
//вызов из ds_time
//просто кусок ds_time, вынесенный отдельно для удобства
func void B_DS2P_CheckHeroHasItems()
{
	
	//NS - 10/12/15
	// Квест "Крепость духа" ---------------------------------------------
	if (!MIS_DS2P_Fortitude)	//начало - нашли яйцо кровяной королевы
	{
		if (Npc_HasItems(other,ItAt_Egg_CrawlerQueen) > 0)		{
			//Запись в дневник 
			B_DSG_Log_OpenClose(TOPIC_DS2P_Fortitude,LOG_MISSION,LOG_Running,TOPIC_DS2P_Fortitude_Start);
		};
	};
	if (MIS_DS2P_Fortitude == LOG_Running)
	{
		//нашли все остальные ингредиенты
		if (MIS_DS2P_Fortitude_IngredientsKnow && !MIS_DS2P_Fortitude_IngredientsGotOnce
			&& (Npc_HasItems(other,ItAt_ShadowHorn) > 0)
			&& (Npc_HasItems(other,ItAt_DS2P_Teeth_Warg) > 0)
			&& (Npc_HasItems(other,ItAt_DS2P_Heart_SwampGolem) > 0))
		{
			//Запись в дневник 
			B_DSG_Log_OpenClose(TOPIC_DS2P_Fortitude,LOG_MISSION,LOG_Running,TOPIC_DS2P_Fortitude_AllIngredients);
			MIS_DS2P_Fortitude_IngredientsGotOnce = TRUE;
		};
	};
	
	//NS - 19/12/15
	// Квест "В поисках сокровищ" ---------------------------------------------
	if (MIS_DS2P_InSearchOfTreasure == LOG_Running)
	{
		//нашли 15 монет
		if (MIS_DS2P_Fortitude_IngredientsKnow && !MIS_DS2P_InSearchOfTreasure_CoinsGotOnce
			&& (Npc_HasItems(other,ItMi_OldCoin) >= 15))
		{
			//Запись в дневник 
			B_DSG_Log_OpenClose(TOPIC_DS2P_InSearchOfTreasure,LOG_MISSION,LOG_Running,TOPIC_DS2P_InSearchOfTreasure_CoinsGot);
			MIS_DS2P_InSearchOfTreasure_CoinsGotOnce = TRUE;
		};
	};
};

