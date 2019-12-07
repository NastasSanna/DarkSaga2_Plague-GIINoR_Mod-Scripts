const int Dex_Need_For_PickPocketTalent_Level_1 = 15;	//Ћовкость дл€ получени€ 1-го уровн€ воровства карманов
const int Dex_Need_For_PickPocketTalent_Level_2 = 30;	//Ћовкость дл€ получени€ 2-го уровн€ воровства карманов
const int Dex_Need_For_PickPocketTalent_Level_3 = 60;	//Ћовкость дл€ получени€ 3-го уровн€ воровства карманов
func void b_ds_getStrMessage(var int nDexDifference)
{
	var string strDexDifference;
	var string strMessage;
	strDexDifference = IntToString(nDexDifference);
	strMessage = ConcatStrings(PRINT_DEXTERITY_MISSING," ");
	strMessage = ConcatStrings(strMessage,"“ребуетс€ дополнительно: ");
	strMessage = ConcatStrings(strMessage,strDexDifference);
	Print(strMessage);
};
func int B_TeachThiefTalent(var C_Npc slf,var C_Npc oth,var int talent,var int level)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,talent,level);
	var int nDexDifference;
	var int hero_dex;
	hero_dex = oth.attribute[ATR_DEXTERITY];
	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT) && (talent != NPC_TALENT_PICKPOCKET))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		if(level == 1)
		{
			if(hero_dex < Dex_Need_For_PickPocketTalent_Level_1)
			{
				nDexDifference = Dex_Need_For_PickPocketTalent_Level_1 - hero_dex;
				b_ds_getStrMessage(nDexDifference);
				return FALSE;
			}
			else
			{
				PrintScreen(PRINT_LearnPickpocket,-1,-1,FONT_Screen,2);
			};
		}
		else if(level == 2)
		{
			if(hero_dex < Dex_Need_For_PickPocketTalent_Level_2)
			{
				nDexDifference = Dex_Need_For_PickPocketTalent_Level_2 - hero_dex;
				b_ds_getStrMessage(nDexDifference);
				return FALSE;
			}
			else
			{
				PrintScreen(PRINT_LearnPickpocket_2,-1,-1,FONT_Screen,2);
			};
		}
		else if(level == 3)
		{
			if(hero_dex < Dex_Need_For_PickPocketTalent_Level_3)
			{
				nDexDifference = Dex_Need_For_PickPocketTalent_Level_3 - hero_dex;
				b_ds_getStrMessage(nDexDifference);
				return FALSE;
			}
			else
			{
				PrintScreen(PRINT_LearnPickpocket_3,-1,-1,FONT_Screen,2);
			};
		};
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,level);
		oth.lp = oth.lp - kosten;
		return TRUE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		PrintScreen(PRINT_LearnPicklock,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
		PrintScreen(PRINT_LearnSneak,-1,-1,FONT_Screen,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		B_SetTalentAcrobat(oth,1);
		PrintScreen(PRINT_LearnAcrobat,-1,-1,FONT_Screen,2);
		return TRUE;
	};	
	return FALSE;
};

