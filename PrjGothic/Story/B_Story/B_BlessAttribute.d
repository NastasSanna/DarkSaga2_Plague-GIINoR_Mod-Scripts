
func void B_BlessAttribute(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] += points;
		oth.aivar[REAL_STRENGTH] += points;
		concatText = ConcatStrings(PRINT_BlessSTR,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] += points;
		oth.aivar[REAL_DEXTERITY] += points;
		//NS - 24/09/13
		if((oth.aivar[REAL_DEXTERITY] >= 90) && (Npc_GetTalentSkill(oth,NPC_TALENT_ACROBAT) == 0))
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
			PrintScreen(PRINT_Addon_AcrobatBonus,-1,55,FONT_Screen,2);
		};
		concatText = ConcatStrings(PRINT_BlessDEX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] += points;
		oth.aivar[REAL_MANA_MAX] += points;
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		concatText = ConcatStrings(PRINT_BlessMANA_MAX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] += points;
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		concatText = ConcatStrings(PRINT_BlessHitpoints_MAX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_HITPOINTS)
	{
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_BlessHitpoints,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_MANA)
	{
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		PrintScreen(PRINT_BlessMANA,-1,-1,FONT_Screen,2);
	};
};

