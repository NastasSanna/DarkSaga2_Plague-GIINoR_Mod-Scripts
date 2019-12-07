
func int B_DS_TeachPlayer2x2Weapon(var C_Npc slf,var C_Npc oth,var int level)
{
	var C_ITEM hero_rangedweapon;
	hero_rangedweapon = Npc_GetEquippedRangedWeapon(oth);
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_2X2H,level);
	//		************************************
	if((level < 1) || (level >= MAX_WEAPON_2X2_LEVEL))
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
	Npc_SetTalentSkill(oth,NPC_TALENT_2X2H,level);
	B_DSG_Log_OpenClose(TOPIC_Talent2x2Weapon,LOG_NOTE,-1,"Теперь я владею техникой боя с двумя клинками.");
	if(level == WEAPON_2X2_LEVEL_FIRST)
	{
		player_talent_2x2weapon[WEAPON_2X2_LEVEL_FIRST] = TRUE;
		PrintScreen(PRINT_DS_Learn2X2Weapon_Level_1,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
		//B_LogEntry(TOPIC_Talent2x2Weapon,"...");
		//if(hero_rangedweapon.weight == 3)
		//	{
		//	Mdl_ApplyOverlayMds(self,"Hum_2x2L2.MDS");
		//};
		return TRUE;
	};
	if(level == WEAPON_2X2_LEVEL_SECOND)
	{
		player_talent_2x2weapon[WEAPON_2X2_LEVEL_SECOND] = TRUE;
		PrintScreen(PRINT_DS_Learn2X2Weapon_Level_2,-1,YPOS_LOGENTRY - 4,FONT_Screen,3);
		//B_LogEntry(TOPIC_Talent2x2Weapon,"......");
		if (Npc_HasEquippedMeleeWeapon(oth))	{	//NS (24/02/14)
			if(hero_rangedweapon.weight == 3)
			{
				Mdl_ApplyOverlayMds(oth,"Hum_2x2L3.MDS");
			};
		};
		return TRUE;
	};	
	return FALSE;
};

