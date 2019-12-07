
var int SkinDarkSaga;
var int ArmorDarkSaga;
var int ArmorReDoDarkSaga;

instance PC_SkinAndArmor_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_SkinAndArmor_End_Condition;
	information = PC_SkinAndArmor_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int PC_SkinAndArmor_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) 
	&& (SkinDarkSaga == FALSE) && (ArmorDarkSaga == FALSE) && (ArmorReDoDarkSaga == FALSE))
	{
		return TRUE;
	};
};
func void PC_SkinAndArmor_End_Info()
{
	b_endproductiondialog();
	SkinDarkSaga = False;
	ArmorDarkSaga = FALSE;
	ArmorReDoDarkSaga = False;
};
//**************************************************************************************

//----<<<<<<<-----------ОБРАБОТКА КОЖИ-------->>>>>>>----------*************************

//**************************************************************************************

instance PC_Skin_Wolf_01(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_Wolf_01_Condition;
	information = PC_Skin_Wolf_01_Info;
	permanent 	= TRUE;
	description = "Обработать шкуру волка.";
};
func int PC_Skin_Wolf_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_WolfFur) > 0))
	{
		return TRUE;
	};
};
instance PC_Skin_Wolf_All(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_Wolf_All_Condition;
	information = PC_Skin_Wolf_All_Info;
	permanent 	= TRUE;
	description = "Обработать все шкуры волков.";
};
func int PC_Skin_Wolf_All_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_WolfFur) > 1))
	{
		return TRUE;
	};
};
instance PC_Skin_Warg_01(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_Warg_01_Condition;
	information = PC_Skin_Warg_01_Info;
	permanent 	= TRUE;
	description = "Обработать шкуру варга.";
};
func int PC_Skin_Warg_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_WargFur) > 0))
	{
		return TRUE;
	};
};
instance PC_Skin_Warg_All(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_Warg_All_Condition;
	information = PC_Skin_Warg_All_Info;
	permanent 	= TRUE;
	description = "Обработать все шкуры варгов.";
};
func int PC_Skin_Warg_All_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_WargFur) > 1))
	{
		return TRUE;
	};
};
instance PC_Skin_ShBeast_01(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_ShBeast_01_Condition;
	information = PC_Skin_ShBeast_01_Info;
	permanent 	= TRUE;
	description = "Обработать шкуру мракориса.";
};
func int PC_Skin_ShBeast_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_ShadowFur) > 0))
	{
		return TRUE;
	};
};
instance PC_Skin_ShBeast_All(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_ShBeast_All_Condition;
	information = PC_Skin_ShBeast_All_Info;
	permanent 	= TRUE;
	description = "Обработать все шкуры мракорисов.";
};
func int PC_Skin_ShBeast_All_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_ShadowFur) > 1))
	{
		return TRUE;
	};
};
instance PC_Skin_Troll_01(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_Troll_01_Condition;
	information = PC_Skin_Troll_01_Info;
	permanent 	= TRUE;
	description = "Обработать шкуру тролля.";
};
func int PC_Skin_Troll_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_TrollFur) > 0))
	{
		return TRUE;
	};
};
instance PC_Skin_Troll_All(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_Troll_All_Condition;
	information = PC_Skin_Troll_All_Info;
	permanent 	= TRUE;
	description = "Обработать все шкуры троллей.";
};
func int PC_Skin_Troll_All_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_TrollFur) > 1))
	{
		return TRUE;
	};
};
instance PC_Skin_TrollBlack_01(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_TrollBlack_01_Condition;
	information = PC_Skin_TrollBlack_01_Info;
	permanent 	= TRUE;
	description = "Обработать шкуру черного тролля.";
};
func int PC_Skin_TrollBlack_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_TrollBlackFur) > 0))
	{
		return TRUE;
	};
};
instance PC_Skin_TrollBlack_All(C_Info)
{
	npc 		= PC_Hero;
	condition 	= PC_Skin_TrollBlack_All_Condition;
	information = PC_Skin_TrollBlack_All_Info;
	permanent 	= TRUE;
	description = "Обработать все шкуры черных троллей.";
};
func int PC_Skin_TrollBlack_All_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE) && (Npc_HasItems(hero,ItAt_TrollBlackFur) > 1))
	{
		return TRUE;
	};
};
//----
func void pc_skin_nr_reset()
{
	PC_Skin_Wolf_01.nr = 10;
	PC_Skin_Wolf_All.nr = 15;
	PC_Skin_Warg_01.nr = 20;
	PC_Skin_Warg_All.nr = 25;
	PC_Skin_ShBeast_01.nr = 30;
	PC_Skin_ShBeast_All.nr = 35;
	PC_Skin_Troll_01.nr = 40;
	PC_Skin_Troll_All.nr = 45;
	PC_Skin_TrollBlack_01.nr = 50;
	PC_Skin_TrollBlack_All.nr = 60;
};
func void PC_Skin_Wolf_01_Info()
{
	Npc_RemoveInvItem(hero,ItAt_WolfFur);
	CreateInvItem(hero,ItAt_DS_WolfFur_H);
	Print(PRINT_DS_SkinSuccess);
	pc_skin_nr_reset();
	PC_Skin_Wolf_01.nr = 1;
	PC_Skin_Wolf_All.nr = 2;
};
func void PC_Skin_Wolf_All_Info()
{
	var int fur_amount;
	fur_amount = Npc_HasItems(hero,ItAt_WolfFur);
	Npc_RemoveInvItems(hero,ItAt_WolfFur,fur_amount);
	CreateInvItems(hero,ItAt_DS_WolfFur_H,fur_amount);
	Print(PRINT_DS_SkinsSuccess);
	pc_skin_nr_reset();
	PC_Skin_Wolf_01.nr = 1;
	PC_Skin_Wolf_All.nr = 2;
};
func void PC_Skin_Warg_01_Info()
{
	Npc_RemoveInvItem(hero,ItAt_WargFur);
	CreateInvItem(hero,ItAt_DS_WargFur_H);
	Print(PRINT_DS_SkinSuccess);
	pc_skin_nr_reset();
	PC_Skin_Warg_01.nr = 1;
	PC_Skin_Warg_All.nr = 2;
};
func void PC_Skin_Warg_All_Info()
{
	var int fur_amount;
	fur_amount = Npc_HasItems(hero,ItAt_WargFur);
	Npc_RemoveInvItems(hero,ItAt_WargFur,fur_amount);
	CreateInvItems(hero,ItAt_DS_WargFur_H,fur_amount);
	Print(PRINT_DS_SkinsSuccess);
	pc_skin_nr_reset();
	PC_Skin_Warg_01.nr = 1;
	PC_Skin_Warg_All.nr = 2;
};
func void PC_Skin_ShBeast_01_Info()
{
	Npc_RemoveInvItem(hero,ItAt_ShadowFur);
	CreateInvItem(hero,ItAt_DS_ShadowFur_H);
	Print(PRINT_DS_SkinSuccess);
	pc_skin_nr_reset();
	PC_Skin_ShBeast_01.nr = 1;
	PC_Skin_ShBeast_All.nr = 2;
};
func void PC_Skin_ShBeast_All_Info()
{
	var int fur_amount;
	fur_amount = Npc_HasItems(hero,ItAt_ShadowFur);
	Npc_RemoveInvItems(hero,ItAt_ShadowFur,fur_amount);
	CreateInvItems(hero,ItAt_DS_ShadowFur_H,fur_amount);
	Print(PRINT_DS_SkinsSuccess);
	pc_skin_nr_reset();
	PC_Skin_ShBeast_01.nr = 1;
	PC_Skin_ShBeast_All.nr = 2;
};
func void PC_Skin_Troll_01_Info()
{
	Npc_RemoveInvItem(hero,ItAt_TrollFur);
	CreateInvItem(hero,ItAt_DS_TrollFur_H);
	Print(PRINT_DS_SkinSuccess);
	pc_skin_nr_reset();
	PC_Skin_Troll_01.nr = 1;
	PC_Skin_Troll_All.nr = 2;
};
func void PC_Skin_Troll_All_Info()
{
	var int fur_amount;
	fur_amount = Npc_HasItems(hero,ItAt_TrollFur);
	Npc_RemoveInvItems(hero,ItAt_TrollFur,fur_amount);
	CreateInvItems(hero,ItAt_DS_TrollFur_H,fur_amount);
	Print(PRINT_DS_SkinsSuccess);
	pc_skin_nr_reset();
	PC_Skin_Troll_01.nr = 1;
	PC_Skin_Troll_All.nr = 2;
};
func void PC_Skin_TrollBlack_01_Info()
{
	Npc_RemoveInvItem(hero,ItAt_TrollBlackFur);
	CreateInvItem(hero,ItAt_DS_TrollBlackFur_H);
	Print(PRINT_DS_SkinSuccess);
	pc_skin_nr_reset();
	PC_Skin_Troll_01.nr = 1;
	PC_Skin_Troll_All.nr = 2;
};
func void PC_Skin_TrollBlack_All_Info()
{
	var int fur_amount;
	fur_amount = Npc_HasItems(hero,ItAt_TrollBlackFur);
	Npc_RemoveInvItems(hero,ItAt_TrollBlackFur,fur_amount);
	CreateInvItems(hero,ItAt_DS_TrollBlackFur_H,fur_amount);
	Print(PRINT_DS_SkinsSuccess);
	pc_skin_nr_reset();
	PC_Skin_TrollBlack_01.nr = 1;
	PC_Skin_TrollBlack_All.nr = 2;
};

instance PC_Skin_Stop(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 99;
	condition 	= PC_Skin_Stop_Condition;
	information = PC_Skin_Stop_Info;
	permanent 	= TRUE;
	description = Dialog_Back;
};
func int PC_Skin_Stop_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (SkinDarkSaga == TRUE))
	{
		return TRUE;
	};
};
func void PC_Skin_Stop_Info()
{
	pc_skin_nr_reset();
	SkinDarkSaga = FALSE;	
};

instance PC_Skin(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_Skin_Condition;
	information = PC_Skin_Info;
	permanent = TRUE;
	description = "Обработать кожу";
};
func int PC_Skin_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) 
	&& (SkinDarkSaga == FALSE) && (ArmorDarkSaga == FALSE) && (ArmorReDoDarkSaga == FALSE) 
	&& (PLAYER_TALENT_SKIN[SKIN_COMMON] == TRUE))
	{
		return TRUE;
	};
};
func void PC_Skin_Info()
{
	SkinDarkSaga = TRUE;
	pc_skin_nr_reset();
};

//****************************************************************************************************

//----<<<<<<<-----------СОЗДАНИЕ БРОНЕК-------->>>>>>>----------***************************************

//****************************************************************************************************
instance PC_Armor(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 4;
	condition 	= PC_Armor_Condition;
	information = PC_Armor_Info;
	permanent 	= TRUE;
	description = "Смастерить броню.";
};
func int PC_Armor_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) 
	&& (SkinDarkSaga == FALSE) && (ArmorDarkSaga == FALSE) && (ArmorReDoDarkSaga == FALSE))
	{
		return TRUE;
	};
};
func void PC_Armor_Info()
{
	ArmorDarkSaga = TRUE;
};

instance PC_Armor_Stop(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 99;
	condition 	= PC_Armor_Stop_Condition;
	information = PC_Armor_Stop_Info;
	permanent 	= TRUE;
	description = Dialog_Back;
};
func int PC_Armor_Stop_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorDarkSaga == TRUE))
	{
		return TRUE;
	};
};
func void PC_Armor_Stop_Info()
{
	ArmorDarkSaga = FALSE;	
};

instance PC_Armor_Light(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 10;
	condition 	= PC_Armor_Light_Condition;
	information = PC_Armor_Light_Info;
	permanent 	= TRUE;
	description = "Легкая броня охотников (защита - оружие:60, стрелы:80, магия и огонь:10)";
};
func int PC_Armor_Light_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorDarkSaga == TRUE)
	&& (player_talent_skin[SKIN_DO_LIGHT] == TRUE)	)
	{
		return TRUE;
	};
};
func void PC_Armor_Light_Info()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 5) && (Npc_HasItems(hero,ItAt_DS_WolfFur_H) >= 5))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,5);
		Npc_RemoveInvItems(hero,ItAt_DS_WolfFur_H,5);
		CreateInvItems(hero,ITAR_HUN_L,1);
		Print(PRINT_DS_ArmorSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
};

instance PC_Armor_Medium(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 11;
	condition 	= PC_Armor_Medium_Condition;
	information = PC_Armor_Medium_Info;
	permanent 	= TRUE;
	description = "Средняя броня охотников (защита - оружие:75, стрелы:85, магия и огонь:15)";
};
func int PC_Armor_Medium_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorDarkSaga == TRUE)
	&& (player_talent_skin[SKIN_DO_MEDIUM] == TRUE)	)
	{
		return TRUE;
	};
};
func void PC_Armor_Medium_Info()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 8) && (Npc_HasItems(hero,ItAt_DS_WargFur_H) >= 6))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,8);
		Npc_RemoveInvItems(hero,ItAt_DS_WargFur_H,6);
		CreateInvItems(hero,ITAR_HUN_BLACK_M04,1);
		Print(PRINT_DS_ArmorSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
};

instance PC_Armor_Hard(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 12;
	condition 	= PC_Armor_Hard_Condition;
	information = PC_Armor_Hard_Info;
	permanent 	= TRUE;
	description = "Тяжелая броня охотников (защита - оружие:90, стрелы:100, магия и огонь:20)";
};
func int PC_Armor_Hard_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorDarkSaga == TRUE)
	&& (player_talent_skin[SKIN_DO_HARD] == TRUE)	)
	{
		return TRUE;
	};
};
func void PC_Armor_Hard_Info()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 10) && (Npc_HasItems(hero,ItAt_DS_ShadowFur_H) >= 4))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,10);
		Npc_RemoveInvItems(hero,ItAt_DS_ShadowFur_H,4);
		CreateInvItems(hero,ITAR_HUN_H,1);
		Print(PRINT_DS_ArmorSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
};

instance PC_Armor_Troll(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 13;
	condition 	= PC_Armor_Troll_Condition;
	information = PC_Armor_Troll_Info;
	permanent 	= TRUE;
	description = "(”Защита Тролля”)";
};
func int PC_Armor_Troll_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorDarkSaga == TRUE)
	&& (player_talent_skin[SKIN_DO_TROLL] == TRUE)	)
	{
		return TRUE;
	};
};
func void PC_Armor_Troll_Info()
{
	Info_ClearChoices(PC_Armor_Troll);
	Info_AddChoice(PC_Armor_Troll,"Защита черного тролля (защита - оружие:125, стрелы:135, магия и огонь:45)",PC_Armor_Troll_Black);
	Info_AddChoice(PC_Armor_Troll,"Защита тролля  (защита - оружие:110, стрелы:120, магия и огонь:30)",PC_Armor_Troll_);
};
func void PC_Armor_Troll_()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 20) && (Npc_HasItems(hero,ItAt_DS_TrollFur_H) >= 3))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,20);
		Npc_RemoveInvItems(hero,ItAt_DS_TrollFur_H,3);
		CreateInvItems(hero,ITAR_HUN_TROLL,1);
		Print(PRINT_DS_ArmorSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
	Info_ClearChoices(PC_Armor_Troll);
};
func void PC_Armor_Troll_Black()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 20) && (Npc_HasItems(hero,ItAt_DS_TrollBlackFur_H) >= 3))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,20);
		Npc_RemoveInvItems(hero,ItAt_DS_TrollBlackFur_H,3);
		CreateInvItems(hero,ITAR_HUN_BLACKTROLL,1);
		Print(PRINT_DS_ArmorSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
	Info_ClearChoices(PC_Armor_Troll);
};

//****************************************************************************************************

//*************----<<<<<<<-----------УКРЕПЛЕНИЕ БРОНЕК-------->>>>>>>----------***********************

//****************************************************************************************************

instance PC_ArmorReDo(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 7;
	condition 	= PC_ArmorReDo_Condition;
	information = PC_ArmorReDo_Info;
	permanent 	= TRUE;
	description = "Укрепить броню.";
};
func int PC_ArmorReDo_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) 
	&& (SkinDarkSaga == FALSE) && (ArmorDarkSaga == FALSE) && (ArmorReDoDarkSaga == FALSE))
	{
		return TRUE;
	};
};
func void PC_ArmorReDo_Info()
{
	ArmorReDoDarkSaga = TRUE;
};
instance PC_ArmorReDo_Stop(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 99;
	condition 	= PC_ArmorReDo_Stop_Condition;
	information = PC_ArmorReDo_Stop_Info;
	permanent 	= TRUE;
	description = Dialog_Back;
};
func int PC_ArmorReDo_Stop_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorReDoDarkSaga == TRUE))
	{
		return TRUE;
	};
};
func void PC_ArmorReDo_Stop_Info()
{
	ArmorReDoDarkSaga = FALSE;	
};

instance PC_ArmorReDo_Light(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 10;
	condition 	= PC_ArmorReDo_Light_Condition;
	information = PC_ArmorReDo_Light_Info;
	permanent 	= TRUE;
	description = "Укрепить легкую броню охотников (защита +5)";
};
func int PC_ArmorReDo_Light_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorReDoDarkSaga == TRUE)
	&& (player_talent_skin[SKIN_REDO_LIGHT] == TRUE)	)
	{
		return TRUE;
	};
};
func void PC_ArmorReDo_Light_Info()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 2) && (Npc_HasItems(hero,ITAR_HUN_L) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,2);
		Npc_RemoveInvItems(hero,ITAR_HUN_L,1);
		CreateInvItems(hero,ITAR_HUN_L_FIX,1);
		Print(PRINT_DS_ArmorGoodSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
};
instance PC_ArmorReDo_Medium(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 11;
	condition 	= PC_ArmorReDo_Medium_Condition;
	information = PC_ArmorReDo_Medium_Info;
	permanent 	= TRUE;
	description = "Укрепить среднюю броню охотников (защита +5)";
};
func int PC_ArmorReDo_Medium_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorReDoDarkSaga == TRUE)
	&& (player_talent_skin[SKIN_REDO_MEDIUM] == TRUE)	)
	{
		return TRUE;
	};
};
func void PC_ArmorReDo_Medium_Info()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 4) && (Npc_HasItems(hero,ITAR_HUN_BLACK_M04) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,4);
		Npc_RemoveInvItems(hero,ITAR_HUN_BLACK_M04,1);
		CreateInvItems(hero,ITAR_HUN_BLACK_M04_FIX,1);
		Print(PRINT_DS_ArmorGoodSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
};

instance PC_ArmorReDo_Hard(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 12;
	condition 	= PC_ArmorReDo_Hard_Condition;
	information = PC_ArmorReDo_Hard_Info;
	permanent 	= TRUE;
	description = "Укрепить тяжелую броню охотников (защита +5)";
};
func int PC_ArmorReDo_Hard_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorReDoDarkSaga == TRUE)
	&& (player_talent_skin[SKIN_REDO_HARD] == TRUE)	)
	{
		return TRUE;
	};
};
func void PC_ArmorReDo_Hard_Info()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 6) && (Npc_HasItems(hero,ITAR_HUN_H) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,6);
		Npc_RemoveInvItems(hero,ITAR_HUN_H,1);
		CreateInvItems(hero,ITAR_HUN_H_FIX,1);
		Print(PRINT_DS_ArmorGoodSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
};

instance PC_ArmorReDo_Troll(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 13;
	condition 	= PC_ArmorReDo_Troll_Condition;
	information = PC_ArmorReDo_Troll_Info;
	permanent 	= TRUE;
	description = "(укрепить ”Защиту Тролля”)";
};
func int PC_ArmorReDo_Troll_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SkinAndArmor) && (ArmorReDoDarkSaga == TRUE)
	&& (player_talent_skin[SKIN_REDO_TROLL] == TRUE)	)
	{
		return TRUE;
	};
};
func void PC_ArmorReDo_Troll_Info()
{
	Info_ClearChoices(PC_ArmorReDo_Troll);
	Info_AddChoice(PC_ArmorReDo_Troll,"Укрепить ”Защиту Черного Тролля” (защита +5)",PC_ArmorReDo_Troll_Black);
	Info_AddChoice(PC_ArmorReDo_Troll,"Укрепить ”Защиту Тролля” (защита +5)",PC_ArmorReDo_Troll_);	
};
func void PC_ArmorReDo_Troll_()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 10) && (Npc_HasItems(hero,ITAR_HUN_TROLL) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,10);
		Npc_RemoveInvItems(hero,ITAR_HUN_TROLL,1);
		CreateInvItems(hero,ITAR_HUN_TROLL_H,1);
		Print(PRINT_DS_ArmorGoodSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
	Info_ClearChoices(PC_ArmorReDo_Troll);
};
func void PC_ArmorReDo_Troll_Black()
{
	if((Npc_HasItems(hero,ItMi_DS_SteelPlate) >= 10) && (Npc_HasItems(hero,ITAR_HUN_BLACKTROLL) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_DS_SteelPlate,10);
		Npc_RemoveInvItems(hero,ITAR_HUN_BLACKTROLL,1);
		CreateInvItems(hero,ITAR_HUN_BLACKTROLL_H,1);
		Print(PRINT_DS_ArmorGoodSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
	};
	Info_ClearChoices(PC_ArmorReDo_Troll);
};
//******************************************************************************************************
//--------------------***************---------------------------------
func void SKINANDARMOR_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SkinAndArmor;
		AI_ProcessInfos(hero);
	};	
};

