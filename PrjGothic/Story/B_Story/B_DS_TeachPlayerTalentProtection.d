
func int B_TeachPlayerTalentProtection(var C_Npc slf,var C_Npc oth,var int protection,var int procent)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_DS_PROTECTION,protection);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if((protection == PROT_BLUNT) || (protection == PROT_EDGE))
	{
		B_GiveBonusProt(oth,PROT_DS_EDGE | PROT_DS_BLUNT,procent);
		PrintScreen(PRINT_DS_LearnProtectionEDGE,-1,-1,FONT_Screen,2);
	}
	else if(protection == PROT_FIRE)
	{
		B_GiveBonusProt(oth,PROT_DS_FIRE,procent);
		PrintScreen(PRINT_DS_LearnProtectionFIRE,-1,-1,FONT_Screen,2);
	}
	else if(protection == PROT_MAGIC)
	{
		B_GiveBonusProt(oth,PROT_DS_MAGIC,procent);
		PrintScreen(PRINT_DS_LearnProtectionMAGIC,-1,-1,FONT_Screen,2);
	}
	else if(protection == PROT_POINT)
	{
		B_GiveBonusProt(oth,PROT_DS_POINT,procent);
		PrintScreen(PRINT_DS_LearnProtectionPOINT,-1,-1,FONT_Screen,2);
	};
	return TRUE;
};

