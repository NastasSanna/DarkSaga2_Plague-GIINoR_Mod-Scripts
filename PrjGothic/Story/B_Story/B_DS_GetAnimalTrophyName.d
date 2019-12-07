func string B_DS_GetAnimalTrophyName(var int trophy)
{
	var string TrophyName;
	if(Trophy == TROPHY_Teeth)
	{
		TrophyName = TXT_DS_TROPHYS_0;		//здесь 0 = TROPHY_Teeth из Constants.d ; ниже всё по аналогии...
	}
	else if(trophy == TROPHY_Claws)
	{
		TrophyName = TXT_DS_TROPHYS_1;
	}
	else if(trophy == TROPHY_Fur)
	{
		TrophyName = TXT_DS_TROPHYS_2;
	}
	else if(trophy == TROPHY_Heart )
	{
		TrophyName = TXT_DS_TROPHYS_3;
	}
	else if(trophy == TROPHY_ShadowHorn )
	{
		TrophyName = TXT_DS_TROPHYS_4;
	}
	else if(trophy == TROPHY_FireTongue)
	{
		TrophyName = TXT_DS_TROPHYS_5;
	}
	else if(trophy ==  TROPHY_BFWing)
	{
		TrophyName = TXT_DS_TROPHYS_6;
	}
	else if(trophy ==  TROPHY_BFSting)
	{
		TrophyName = TXT_DS_TROPHYS_7;
	}
	else if(trophy ==  TROPHY_Mandibles)
	{
		TrophyName = TXT_DS_TROPHYS_8;
	}
	else if(trophy ==  TROPHY_CrawlerPlate)
	{
		TrophyName = TXT_DS_TROPHYS_9;
	}
	else if(trophy ==  TROPHY_DrgSnapperHorn)
	{
		TrophyName = TXT_DS_TROPHYS_10;
	}
	else if(trophy ==  TROPHY_DragonScale)
	{
		TrophyName = TXT_DS_TROPHYS_11;
	}
	else if(trophy == TROPHY_DragonBlood )
	{
		TrophyName = TXT_DS_TROPHYS_12;
	}
	else if(trophy == TROPHY_ReptileSkin )
	{
		TrophyName = TXT_DS_TROPHYS_13;
	};
	return TrophyName;
};
