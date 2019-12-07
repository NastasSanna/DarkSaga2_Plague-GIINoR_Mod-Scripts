
func void B_RaiseRealAttributeLearnCounter(var C_Npc oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		oth.aivar[REAL_STRENGTH] = oth.aivar[REAL_STRENGTH] + points;
	}
	else if(attrib == ATR_DEXTERITY)
	{
		oth.aivar[REAL_DEXTERITY] = oth.aivar[REAL_DEXTERITY] + points;
		//NS - 24/09/13
		if((oth.aivar[REAL_DEXTERITY] >= 90) && (Npc_GetTalentSkill(oth,NPC_TALENT_ACROBAT) == 0))
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
			PrintScreen(PRINT_Addon_AcrobatBonus,-1,55,FONT_Screen,2);
		};
	}
	else if(attrib == ATR_MANA_MAX)
	{
		oth.aivar[REAL_MANA_MAX] = oth.aivar[REAL_MANA_MAX] + points;
	};
};

func void B_RaiseAttribute(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] += points;
		concatText = ConcatStrings(PRINT_LearnSTR,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] += points;
		if((oth.attribute[ATR_DEXTERITY] >= 90)/* && (Npc_GetTalentSkill(oth,NPC_TALENT_ACROBAT) == 0)*/)
		{
			B_SetTalentAcrobat(oth,1);
			PrintScreen(PRINT_Addon_AcrobatBonus,-1,55,FONT_Screen,2);
		};
		concatText = ConcatStrings(PRINT_LearnDEX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] += points;
		concatText = ConcatStrings(PRINT_LearnMANA_MAX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] += points;
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(points));
		PrintScreen(concatText,-1,-1,FONT_Screen,2);
	};
	B_RaiseRealAttributeLearnCounter(oth,attrib,points);
};

func void b_raiseliveattribute(var C_Npc rab,var int znak)
{
	if(Hlp_IsValidNpc(rab) && !Npc_IsDead(rab))
	{
		Npc_ChangeAttribute(rab,ATR_HITPOINTS_MAX,100 * znak);
		Npc_ChangeAttribute(rab,ATR_STRENGTH,30 * znak);
		if(znak == 1)
		{
			Npc_ChangeAttribute(rab,ATR_HITPOINTS,100 * znak);
		}
		else if(znak == -1)
		{
			rab.attribute[ATR_HITPOINTS] = rab.attribute[ATR_HITPOINTS_MAX];
		};
	};
};
