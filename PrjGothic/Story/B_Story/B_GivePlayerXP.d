
func void B_GivePlayerXP(var int add_xp)
{
	var string concatText;
	var int vHP_PER_LEVEL;
	vHP_PER_LEVEL = HP_PER_LEVEL + HP_PER_LEVEL*ComplexityLevel_Procent/100;
	if(hero.level == 0)
	{
		hero.exp_next = 500;
	};
	hero.exp += add_xp;
	concatText = PRINT_XPGained;
	concatText = ConcatStrings(concatText,IntToString(add_xp));
	PrintScreen(concatText,-1,YPOS_XPGained,FONT_ScreenSmall,2);
	if(hero.exp >= hero.exp_next)
	{
		hero.level += 1;
		hero.exp_next = hero.exp_next + ((hero.level + 1) * 500);
		hero.attribute[ATR_HITPOINTS_MAX] += vHP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] += vHP_PER_LEVEL;
		hero.lp += LP_PER_LEVEL;
		PrintScreen(PRINT_LevelUp,-1,YPOS_LevelUp,FONT_Screen,2);
		Snd_Play("LevelUp");
	};
	B_CheckLog();
};

