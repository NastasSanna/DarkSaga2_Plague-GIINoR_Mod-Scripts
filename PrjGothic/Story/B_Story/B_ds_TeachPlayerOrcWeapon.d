
func int B_DS_TeachPlayerOrcWeapon(var C_Npc slf,var C_Npc oth,var int level)
{
	var C_ITEM hero_meleeweapon;
	hero_meleeweapon = Npc_GetEquippedMeleeWeapon(oth);
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ORCWEAPON,level);
	//		************************************
	if((level < 1) || (level >= MAX_ORCWEAPON_LEVEL))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_Screen,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_ORCWEAPON,level);
	B_DSG_Log_OpenClose(TOPIC_TalentOrcWeapon,LOG_NOTE,-1,"Теперь я умею правильно пользоваться орочьим оружием.");
	if(level == ORCWEAPON_LEVEL_FIRST)
	{
		PLAYER_TALENT_ORCWEAPON[ORCWEAPON_LEVEL_FIRST] = TRUE;
		PrintScreen(PRINT_DS_LearnOrcWeapon_Level_1,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
		//B_LogEntry(TOPIC_TalentOrcWeapon,".");
		if (Npc_HasEquippedMeleeWeapon(oth))	{	//NS (24/02/14)
			if(hero_meleeweapon.weight == 2)
			{
				Mdl_ApplyOverlayMds(oth,"Humans_O2h.MDS");
			};
		};
		return TRUE;
	};
	if(level == ORCWEAPON_LEVEL_SECOND)
	{
		PLAYER_TALENT_ORCWEAPON[ORCWEAPON_LEVEL_SECOND] = TRUE;
		PrintScreen(PRINT_DS_LearnOrcWeapon_Level_2,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
		//B_LogEntry(TOPIC_TalentOrcWeapon,".");
		if (Npc_HasEquippedMeleeWeapon(oth))	{	//NS (24/02/14)
			if(hero_meleeweapon.weight == 2)
			{
				Mdl_ApplyOverlayMds(oth,"HUMANS_O2hL2.MDS");
			};
		};
		return TRUE;
	};	
	return FALSE;
};

