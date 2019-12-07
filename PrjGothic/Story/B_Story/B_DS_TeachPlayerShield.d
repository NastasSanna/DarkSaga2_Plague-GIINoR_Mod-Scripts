
func int B_DS_TeachPlayerShield(var C_Npc slf,var C_Npc oth,var int level)
{
//	var C_ITEM hero_rangedweapon; //NS - 20/12/13
//	hero_rangedweapon = Npc_GetEquippedRangedWeapon(oth);
	var C_ITEM hero_mweapon;	hero_mweapon = Npc_GetEquippedMeleeWeapon(oth);
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SHIELD,level);
	//		************************************
	if((level < 1) || (level >= MAX_SHIELD_LEVEL))
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
	Npc_SetTalentSkill(oth,NPC_TALENT_SHIELD,level);
	HERO_TALENT_SHIELD = level;	//NS - 20/12/13
	b_dsg_log_openclose(TOPIC_TalentShield,LOG_NOTE,-1,"Теперь я умею пользоваться щитом.");
//	oth.attribute[ATR_REGENERATEMANA] = 30;
	if(level == SHIELD_LEVEL_FIRST)
	{
		PLAYER_TALENT_SHIELD[SHIELD_LEVEL_FIRST] = TRUE;
		PrintScreen(PRINT_DS_LearnSHIELD_Level_1,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
		//B_LogEntry(TOPIC_TalentShield,".");
		//if(hero_rangedweapon.cond_atr[0] == ATR_REGENERATEMANA) //&& (hero_rangedweapon.cond_value[0] > 10))//NS - 20/12/13
		if (Npc_HasEquippedMeleeWeapon(oth))	{	//NS (24/02/14)
			if((hero_mweapon.flags & ITEM_SHIELD) == ITEM_SHIELD)
			{
				Mdl_ApplyOverlayMds(oth,"HUM_SHIELD2.MDS");
			};
		};
		return TRUE;
	};
	if(level == SHIELD_LEVEL_SECOND)
	{
		PLAYER_TALENT_SHIELD[SHIELD_LEVEL_SECOND] = TRUE;
		PrintScreen(PRINT_DS_LearnSHIELD_Level_2,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
		//B_LogEntry(TOPIC_TalentShield,".");
		//if(hero_rangedweapon.cond_atr[0] == ATR_REGENERATEMANA) //&& (hero_rangedweapon.cond_value[0] > 10))//NS - 20/12/13
		if((hero_mweapon.flags & ITEM_SHIELD) == ITEM_SHIELD)
		{
			Mdl_ApplyOverlayMds(oth,"HUM_SHIELD2.MDS");
		};
		return TRUE;
	};	
	return FALSE;
};
