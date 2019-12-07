
//Есть ли пиратский общий диалог
//(по убийству пиратов)
func int C_DS2P_HasPirateNews()
{
	//НЕТ, если
	//я не пират
	if (self.guild != GIL_PIR)	{
		return FALSE;
	};
	//я Гард (отдельный диалог) или Грег (ему ваще пофиг) UNFINISHED Скип? пока не вернулся
	if (C_NpcIs(self, PIR_200_DS2P_GARD) || C_NpcIs(self, PIR_201_DS2P_Greg))	{
		return FALSE;
	};
	// нет неоплаченных убийств пиратов
	if (CRIME_PiratesKilled_Cnt <= CRIME_PiratesKilled_Paid)	{
		return FALSE;
	};
	//иначе - ЕСТЬ
	return TRUE;
};

