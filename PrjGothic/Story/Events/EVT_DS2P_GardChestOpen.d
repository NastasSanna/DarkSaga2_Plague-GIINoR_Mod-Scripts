
//ГГ влез в сундук Гарда за алмазом
func void EVT_DS2P_GardChestOpen()
{
	// TO DO а если вскрыть до начала квеста?
	//один раз
	if ((MIS_DS2P_DamnSailor == LOG_Running) && !Gard_ChestForced)	{
		Gard_ChestForced = TRUE;
		// TO DO вписать WP возле сундука
		AI_Teleport(PIR_200_DS2P_GARD,"");
		AI_StartState(PIR_200_DS2P_GARD,ZS_Follow_Player,0,"");
	};
};