const int decrease_multiplier = 30;
func void B_DS_DecreaseHeroHealth(var int multiplier)
{
	var int hero_health;
	var int hero_healthmax;
	var int hero_healthminus;
	var int healthminus;
	var string concatstr;
	hero_healthmax = hero.attribute[ATR_HITPOINTS_MAX];
	hero_health = hero.attribute[ATR_HITPOINTS];
	healthminus = hero_healthmax / (decrease_multiplier / multiplier);
	if(healthminus < (hero_health + 2))
	{
		hero.attribute[ATR_HITPOINTS] -= healthminus;
	}
	else
	{
		hero.attribute[ATR_HITPOINTS] = 2;
	};
	if(healthminus >= 6)
	{
		hero.attribute[ATR_HITPOINTS_MAX] -= 6;
		hero_healthminus = 6;
	}
	else if((healthminus < 6) && (hero_healthmax > 20))
	{
		hero.attribute[ATR_HITPOINTS_MAX] -= healthminus;
		hero_healthminus = healthminus;
	}
	else if((healthminus < 6) && (hero_healthmax > 3))
	{
		hero.attribute[ATR_HITPOINTS_MAX] -= 1;
		hero_healthminus = 1;
	}
	else
	{
		hero_healthminus = 0;
	};
	B_Say_OverLay(hero,hero,"$COUGH");
	PrintScreen(PRINT_DS_THISAIRCORRODESMYLUNGS,-1,25,FONT_ScreenSmall,5);
	PrintScreen(PRINT_DS_MYHEALTHHASIMPAIRED,-1,27,FONT_ScreenSmall,5);
	concatstr = ConcatStrings(PRINT_DS_LEARNHITPOINTS_MAX,IntToString(hero_healthminus));
	if(hero_healthminus > 0)
	{
		PrintScreen(concatstr,-1,31,FONT_Screen,5);
		Snd_Play("DEM_Die");
	};
};

