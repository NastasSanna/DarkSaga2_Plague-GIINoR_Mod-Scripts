
// ѕодсчитываем, сколько кресть€н опросили по поводу украденного железа
func void B_DSG_Bauers_AboutStolenIron_Counter()
{
	Bauers_AboutIron_Count += 1;
	// если достаточно
	if (Bauers_AboutIron_Count >= Bauers_AboutIron_Max)
	{
		//«апись в дневнике " то украл мое железо?" 
		B_DSG_Log_OpenClose(TOPIC_DS2P_WhoStoleMyIron,LOG_MISSION,LOG_Running,TOPIC_DS2P_WhoStoleMyIron_AskFail);
	};
};