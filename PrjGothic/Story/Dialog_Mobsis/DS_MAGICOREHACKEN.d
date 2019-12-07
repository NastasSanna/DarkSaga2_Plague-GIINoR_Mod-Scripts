var int OreForPack;

func int DS_OREHACKEN_COND()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		if(Npc_HasItems(self,ItMw_2H_Axe_L_01))
		{
			return TRUE;
		}
		else
		{
			Print(PRINT_MissingItem);
			return FALSE;
		};
	}
	else
	{
		return TRUE;
	};
	return FALSE;
};

func int minimum(var int x1,var int x2,var int x3,var int x4,var int min_num)
{
	var int min;var int min_2;
	min = x1;min_2 = x2;
	if min>x2 		{	min = x2;	min_2 = x1;	};
	if min>x3 		{	min_2 = min; 	min = x3;	}
	else if min_2>x3	{	min_2 = x3;	};
	if min>x4 		{	min_2 = min; min = x4;	}
	else if min_2>x4	{	min_2 = x4;	};
	if(min_num == 1)	{	return min;}
	else if(min_num == 2){	return min_2;};
	return 0;
};
func int maximum(var int x1,var int x2,var int x3,var int x4,var int max_num)
{
	var int max;var int max_2;
	max = x1;max_2 = x2;
	if max<x2 		{	max = x2;	max_2 = x1;	};
	if max<x3 		{	max_2 = max; max = x3;	}
	else if max_2<x3		{	max_2 = x3;	};
	if max<x4 		{	max_2 = max; max = x4;	}
	else if max_2<x4		{	max_2 = x4;	};
	if(max_num == 1){	return max;}
	else if(max_num == 2){	return max_2;};
	return 1;
};

func void b_orehacken()
{
	/*
	CurrentChance_1(2,3) - Даем три шанса на удачный удар.
	Dop_Chance - Доп.шанс(50/50) - выученный доп.навык.
	hack_ore - добытая руда
	randy_u(x,y,z) - даем три рандомных числа для расчета кол-ва добытой руды.
	ostatok - минимальное кол-во руды - зависит от навыка.
	*/
	var int CurrentChance_1; var int CurrentChance_2; var int CurrentChance_3; var int Dop_Chance;	
	var int ostatok;	ostatok = (HERO_MAGICOREHACKCHANCE - 40) / 25;
	var int hack_ore; hack_ore = 0;
	var int randy_u; var int randy_x; var int randy_y; var int randy_z;
	randy_u = Hlp_Random(28) + 17;
	randy_x = Hlp_Random(25) + 20;
	randy_y = Hlp_Random(22) + 22;
	randy_z = Hlp_Random(19) + 28;
	var string ConcatString; ConcatString = "";
	var int Randy_Color; Randy_Color = ~Randy_Color; var string FontColor;
	if(Randy_Color) {FontColor = FONT_ScreenSmall;} else {FontColor = FONT_ScreenSmall_Red_HI;};
	
	LEARN_DS_MAGICORE_BY_DOING += 1;
	if(LEARN_DS_MAGICORE_BY_DOING == 10)
	{
		b_upgrade_hero_magicorehackchance(3);
	}
	else if(LEARN_DS_MAGICORE_BY_DOING == 30)
	{
		b_upgrade_hero_magicorehackchance(4);
	}
	else if(LEARN_DS_MAGICORE_BY_DOING == 50)
	{
		b_upgrade_hero_magicorehackchance(5);
	};
	CurrentChance_1 = Hlp_Random(21) + Hlp_Random(21) + Hlp_Random(21) + Hlp_Random(21) + Hlp_Random(21);
	CurrentChance_2 = Hlp_Random(34) + Hlp_Random(34) + Hlp_Random(34);
	CurrentChance_3 = Hlp_Random(100);
	//	<ТЕСТ>
	//PrintScreen(IntToString(randy_u),70,3,FONT_ScreenSmall_Green_HI,10);
	//PrintScreen(IntToString(randy_x),73,3,FONT_ScreenSmall_Green_HI,10);
	//PrintScreen(IntToString(randy_y),76,3,FONT_ScreenSmall_Green_HI,10);
	//PrintScreen(IntToString(randy_z),79,3,FONT_ScreenSmall_Green_HI,10);
	//PrintScreen(IntToString(CurrentChance_1),82,3,FONT_ScreenSmall_Red_HI,10);
	//PrintScreen(IntToString(CurrentChance_2),85,3,FONT_ScreenSmall_Red_HI,10);
	//PrintScreen(IntToString(CurrentChance_3),88,3,FONT_ScreenSmall_Red_HI,10);
	//	</ТЕСТ>
	if(KNOWS_MAGICORETRUEMMERSCHLAG == TRUE)
	{
		Dop_Chance = Hlp_Random(2);
	}
	else
	{	Dop_Chance = 0;
	};
	if((HERO_MAGICOREHACKCHANCE >= CurrentChance_1) || (HERO_MAGICOREHACKCHANCE >= CurrentChance_2) 
	|| (HERO_MAGICOREHACKCHANCE >= CurrentChance_3) || (Dop_Chance == TRUE))
	{
		if( (MAGICORECOUNTER >= 200) && (HERO_MAGICOREHACKCHANCE >= (randy_u + randy_x + randy_y + randy_z)) )
		{
			hack_ore = 4;
			MAGICORETRUEMMER_COUNT = 0;
		}
		else if( (MAGICORECOUNTER >= 120) && (HERO_MAGICOREHACKCHANCE >= minimum(randy_u,randy_x,randy_y,randy_z,1) + minimum(randy_u,randy_x,randy_y,randy_z,2) + maximum(randy_u,randy_x,randy_y,randy_z,2)) )
		{
			hack_ore = 3;
			MAGICORETRUEMMER_COUNT = 0;
			MAGICORECOUNTER += 1;
		}
		else if( (MAGICORECOUNTER >= 70) && (HERO_MAGICOREHACKCHANCE >= minimum(randy_u,randy_x,randy_y,randy_z,1) + minimum(randy_u,randy_x,randy_y,randy_z,2)) )
		{
			hack_ore = 2;
			MAGICORETRUEMMER_COUNT = 0;
			MAGICORECOUNTER += 1;
		}
		else if(HERO_MAGICOREHACKCHANCE > minimum(randy_u,randy_x,randy_y,randy_z,1))
		{
			hack_ore = 1;
			MAGICORETRUEMMER_COUNT = 0;
			MAGICORECOUNTER += 1;
		}
		else
		{
			hack_ore = 0;
			MAGICORETRUEMMER_COUNT = 0;
			MAGICORECOUNTER += 1;
		};		
	};
	if(hack_ore > ostatok)
	{
	}
	else if(ostatok)
	{
		//PrintScreen("Осколки руды разлетаются во все стороны...",-1,34,FONT_ScreenSmall,2);
		//MAGICORETRUEMMER_COUNT += 1;
		hack_ore = ostatok;
	};
	if(hack_ore > 0)
	{
		CreateInvItems(hero,ItMi_Nugget,hack_ore);
		if(hack_ore > 1)
		{
			ConcatString = ConcatStrings("Добыто ",IntToString(hack_ore));
			if(hack_ore == 5)			{	ConcatString = ConcatStrings(ConcatString," кусков руды!");	}
			else if(hack_ore > 1)	{	ConcatString = ConcatStrings(ConcatString," куска руды!");	};
		}
		else if(hack_ore == 1)
		{
			ConcatString = "Добыт 1 кусок руды!";
		};
		PrintScreen(ConcatString,-1,(39-hack_ore),/*FONT_ScreenSmall*/FontColor,2);
		B_GivePlayerXP(5);
	}
	else
	{
		PrintScreen("Осколки руды разлетаются во все стороны...",-1,34,FontColor/*FONT_ScreenSmall*/,2);
	};
};

func void MagicOreHacken_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MAGICOREHACKEN;
		AI_ProcessInfos(hero);
	};
};

instance PC_DS_MAGICOREHACKEN_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_ds_magicorehacken_end_condition;
	information = pc_ds_magicorehacken_end_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int pc_ds_magicorehacken_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MAGICOREHACKEN)
	{
		return TRUE;
	};
};
func void pc_ds_magicorehacken_end_info()
{
	MAGICORETRUEMMER_COUNT = 0;
	b_endproductiondialog();
};

instance PC_DS_MAGICOREHACKEN(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_ds_magicorehacken01_condition;
	information = pc_ds_magicorehacken01_info;
	permanent = TRUE;
	description = "Ударить несильно.";
};
func int pc_ds_magicorehacken01_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_MAGICOREHACKEN)
	{
		return TRUE;
	};
};
func void pc_ds_magicorehacken01_info()
{
	b_orehacken();
	MAGICOREFIRSTATTEMPT += 1;
	if(MAGICOREFIRSTATTEMPT == 5)
	{
		MAGICOREFIRSTATTEMPT = 0;
		b_endproductiondialog();
	};
};

instance PC_DS_MAGICOREHACKEN_CHECKLEVEL(C_Info)
{
	npc = PC_Hero;
	nr = 998;
	condition = pc_ds_magicorehacken_checklevel_condition;
	information = pc_ds_magicorehacken_checklevel_info;
	permanent = TRUE;
	description = "(проверить свой навык)";
};
func int pc_ds_magicorehacken_checklevel_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MAGICOREHACKEN) || (PLAYER_MOBSI_PRODUCTION == MOBSI_GOLDHACKEN)
	|| (PLAYER_MOBSI_PRODUCTION == MOBSI_SILVEROREHACKEN)	|| (PLAYER_MOBSI_PRODUCTION == MOBSI_IRONOREHACKEN)
	|| (PLAYER_MOBSI_PRODUCTION == MOBSI_BRILLIANTHACKEN))
	{
		return TRUE;
	};
};
func void pc_ds_magicorehacken_checklevel_info()
{
	var string concatText;
	if(HERO_MAGICOREHACKCHANCE < 25)
	{
		concatText = ConcatStrings("Новичок (",IntToString(HERO_MAGICOREHACKCHANCE));
	}
	else if(HERO_MAGICOREHACKCHANCE < 40)
	{
		concatText = ConcatStrings("Опытный рудокоп (",IntToString(HERO_MAGICOREHACKCHANCE));
	}
	else if(HERO_MAGICOREHACKCHANCE < 60)
	{
		concatText = ConcatStrings("Настоящий рудокоп ( ",IntToString(HERO_MAGICOREHACKCHANCE));
	}
	else if(HERO_MAGICOREHACKCHANCE < 80)
	{
		concatText = ConcatStrings("Чертовски хороший рудокоп ( ",IntToString(HERO_MAGICOREHACKCHANCE));
	}
	else if(HERO_MAGICOREHACKCHANCE < 90)
	{
		concatText = ConcatStrings("Великий рудокоп ( ",IntToString(HERO_MAGICOREHACKCHANCE));
	}
	else
	{
		concatText = ConcatStrings("Гуру среди рудокопов ( ",IntToString(HERO_MAGICOREHACKCHANCE));
	};
	concatText = ConcatStrings(concatText," проц.)");
	PrintScreen(concatText,-1,-1,FONT_ScreenSmall,2);
};

