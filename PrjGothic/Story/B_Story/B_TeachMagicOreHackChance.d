
func int B_TeachMagicOreHackChance(var C_Npc slf,var C_Npc oth,var int percent)
{
	var int kosten;
	kosten = (B_GetLearnCostTalent(oth,NPC_TALENT_PICKORE,1) * percent) / 2;
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	b_upgrade_hero_magicorehackchance(percent);
	return TRUE;
};

