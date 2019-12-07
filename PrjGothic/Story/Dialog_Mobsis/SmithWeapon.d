
var int SmithWeaponDarkSaga;
var int SmithBowDarkSaga;

instance PC_SmithWeapon_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_SmithWeapon_End_Condition;
	information = PC_SmithWeapon_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int PC_SmithWeapon_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == FALSE) && (SmithBowDarkSaga == FALSE))
	{
		return TRUE;
	};
};
func void PC_SmithWeapon_End_Info()
{
	CreateInvItems(hero,ItMiSwordraw,1);
	b_endproductiondialog();
	SmithWeaponDarkSaga = False;
	SmithBowDarkSaga = False;
};

instance PC_Common_Weapon(C_Info)
{
	npc = PC_Hero;
	condition = PC_Common_Weapon_Condition;
	information = PC_Common_Weapon_Info;
	permanent = TRUE;
	description = "Выковать оружие ближнего боя";
};
func int PC_Common_Weapon_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == FALSE) && (SmithBowDarkSaga == FALSE))
	{
		return TRUE;
	};
};
func void PC_Common_Weapon_Info()
{
	SmithWeaponDarkSaga = TRUE;
};

instance PC_Common_Bow(C_Info)
{
	npc = PC_Hero;
	condition = PC_Common_Bow_Condition;
	information = PC_Common_Bow_Info;
	permanent = TRUE;
	description = "Выковать оружие дальнего боя";
};
func int PC_Common_Bow_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == FALSE) && (SmithBowDarkSaga == FALSE))
	{
		return TRUE;
	};
};
func void PC_Common_Bow_Info()
{
	SmithBowDarkSaga = TRUE;
};

instance PC_CommonWeaponBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_CommonWeaponBACK_Condition;
	information = PC_CommonWeaponBACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};
func int PC_CommonWeaponBACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (SmithBowDarkSaga == FALSE))
	{
		return TRUE;
	};
};
func void PC_CommonWeaponBACK_Info()
{
	SmithWeaponDarkSaga = FALSE;
};

instance PC_CommonBowBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_CommonBowBACK_Condition;
	information = PC_CommonBowBACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};
func int PC_CommonBowBACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == FALSE) && (SmithBowDarkSaga == TRUE))
	{
		return TRUE;
	};
};
func void PC_CommonBowBACK_Info()
{
	SmithBowDarkSaga = FALSE;
};

//-----------************ОРУЖИЕ в ШАХТЕ+++++++++++++++++++++++++
// Палка с шипами

instance PC_ItMW_Ds_Stick_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_Stick_01_Condition;
	information = PC_ItMW_Ds_Stick_01_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_Stick_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_Stick == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_Stick_01_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItMw_1H_Mace_L_03,1,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Prad_1,1,YPos_5,true))
	{
		Npc_RemoveInvItems(hero,ItMw_1H_Mace_L_03,1);
		CreateInvItems(hero,ItMW_Ds_Stick_01,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;
};

// Зуб Волка

instance PC_ItMW_Ds_ToothWolf(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_ToothWolf_Condition;
	information = PC_ItMW_Ds_ToothWolf_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_ToothWolf_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_ToothWolf == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_ToothWolf_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,1,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Prad_2,1,YPos_5,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,1);
		CreateInvItems(hero,ItMW_Ds_ToothWolf,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();	
	SmithWeaponDarkSaga = FALSE;
};

// Кровопускатель

instance PC_ItMW_Ds_BloodSword(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_BloodSword_Condition;
	information = PC_ItMW_Ds_BloodSword_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_BloodSword_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_BloodSword == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_BloodSword_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,1,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,3,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Prad_3,1,YPos_7,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,3);
		CreateInvItems(hero,ItMW_Ds_BloodSword,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};
//----------------------++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Звезда

instance PC_ItMW_Ds_Star(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_Star_Condition;
	information = PC_ItMW_Ds_Star_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_Star_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_Star == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_Star_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,3,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_GoldNugget_Addon,3,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Tobias_1,1,YPos_7,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,3);
		Npc_RemoveInvItems(hero,ItMi_GoldNugget_Addon,3);
		CreateInvItems(hero,ItMW_Ds_Star,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;
};

// Покоритель

instance PC_ItMW_Ds_Subjugator(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_Subjugator_Condition;
	information = PC_ItMW_Ds_Subjugator_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_Subjugator_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_Subjugator == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_Subjugator_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,3,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_SkeletonBone,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_GoldNugget_Addon,5,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Tobias_2,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,3);
		Npc_RemoveInvItems(hero,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		CreateInvItems(hero,ItMW_Ds_Subjugator,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();	
	SmithWeaponDarkSaga = FALSE;	
};

// Возмездие

instance PC_ItMW_Ds_Punishment(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_Punishment_Condition;
	information = PC_ItMW_Ds_Punishment_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_Punishment_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_Punishment == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_Punishment_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,3,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_DrgSnapperHorn,1,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,6,YPos_9,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Tobias_3,1,YPos_11,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,3);
		Npc_RemoveInvItems(hero,ItAt_DrgSnapperHorn,1);
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,6);
		CreateInvItems(hero,ItMW_Ds_Punishment,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Крушитель

instance PC_ItMW_Ds_Destruction(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_Destruction_Condition;
	information = PC_ItMW_Ds_Destruction_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_Destruction_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_Destruction == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_Destruction_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,4,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,3,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Rockcrystal,2,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,3,YPos_9,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Tobias_4,1,YPos_11,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,4);
		Npc_RemoveInvItems(hero,ItMi_Rockcrystal,2);
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,3);
		Npc_RemoveInvItems(hero,ItMi_Nugget,3);
		CreateInvItems(hero,ItMW_Ds_Destruction,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Убийца орков

instance PC_ItMW_Ds_KillOrks(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_KillOrks_Condition;
	information = PC_ItMW_Ds_KillOrks_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_KillOrks_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_KillOrks == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_KillOrks_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,2,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_GoldNugget_Addon,3,YPos_5,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_Claw,1,YPos_7,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Tobias_5,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,2);
		Npc_RemoveInvItems(hero,ItMi_GoldNugget_Addon,3);
		Npc_RemoveInvItems(hero,ItAt_Claw,1);
		CreateInvItems(hero,ItMW_Ds_KillOrks,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};
//++++++++++++++++++++++++++++++++ПИРАТЫ - ГАНС++++++++++++++++++++++++++++++++
// Месть пирата

instance PC_ItMW_Ds_RevengePirates(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_RevengePirates_Condition;
	information = PC_ItMW_Ds_RevengePirates_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_RevengePirates_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_RevengePirates == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_RevengePirates_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,1,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_IronOre,2,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_Teeth,1,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Hans_1,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,1);
		Npc_RemoveInvItems(hero,ItMi_IronOre,2);
		Npc_RemoveInvItems(hero,ItAt_Teeth,1);
		CreateInvItems(hero,ItMW_Ds_RevengePirates,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Клинок Мастера

instance PC_ItMW_Ds_SwordMaster(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_SwordMaster_Condition;
	information = PC_ItMW_Ds_SwordMaster_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_SwordMaster_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_SwordMaster == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_SwordMaster_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,1,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_IronOre,3,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_Teeth,1,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Hans_2,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,1);
		Npc_RemoveInvItems(hero,ItMi_IronOre,3);
		Npc_RemoveInvItems(hero,ItAt_Teeth,1);
		CreateInvItems(hero,ItMW_Ds_SwordMaster,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Волнорез

instance PC_ItMW_Ds_Volnorez(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_Volnorez_Condition;
	information = PC_ItMW_Ds_Volnorez_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_Volnorez_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_Volnorez == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_Volnorez_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,2,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,3,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_GoldNugget_Addon,3,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Hans_3,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,2);
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,3);
		Npc_RemoveInvItems(hero,ItMi_GoldNugget_Addon,3);
		CreateInvItems(hero,ItMW_Ds_Volnorez,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;
};

// Убийца нежити

instance PC_ItMW_Ds_KillZombie(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_KillZombie_Condition;
	information = PC_ItMW_Ds_KillZombie_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_KillZombie_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_KillZombie == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_KillZombie_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,4,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,2,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_ShadowHorn,1,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Hans_4,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,4);
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,2);
		Npc_RemoveInvItems(hero,ItAt_ShadowHorn,1);
		CreateInvItems(hero,ItMW_Ds_KillZombie,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;
};
//***********************************ОРКИ++++++++++++++++++++++++++++++++++++++++++
// Краш Агар

instance PC_ItMW_Ds_KrashAgar(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_KrashAgar_Condition;
	information = PC_ItMW_Ds_KrashAgar_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_KrashAgar_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_KrashAgar == True))
	{
		return TRUE;
	};
};

func void PC_ItMW_Ds_KrashAgar_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,1,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,2,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_IronOre,3,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_OrcAxe_1,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,1);
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,2);
		Npc_RemoveInvItems(hero,ItMi_IronOre,3);
		CreateInvItems(hero,ItMW_Ds_KrashAgar,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Краш Даргот

instance PC_ItMW_Ds_KrashDargot(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_KrashDargot_Condition;
	information = PC_ItMW_Ds_KrashDargot_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_KrashDargot_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_KrashDargot == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_KrashDargot_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,2,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,3,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_IronOre,3,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_OrcAxe_2,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,2);
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,3);
		Npc_RemoveInvItems(hero,ItMi_IronOre,3);
		CreateInvItems(hero,ItMW_Ds_KrashDargot,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Гнев орка

instance PC_ItMW_Ds_AngerOrk(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_AngerOrk_Condition;
	information = PC_ItMW_Ds_AngerOrk_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_AngerOrk_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_AngerOrk == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_AngerOrk_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,4,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,4,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_IronOre,5,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Quartz,1,YPos_9,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_OrcAxe_3,1,YPos_11,true))
	{
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,4);
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,4);
		Npc_RemoveInvItems(hero,ItMi_IronOre,5);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		CreateInvItems(hero,ItMW_Ds_AngerOrk,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Око белиара

instance PC_ItMW_Ds_OkoBeliar(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_OkoBeliar_Condition;
	information = PC_ItMW_Ds_OkoBeliar_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_OkoBeliar_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_OkoBeliar == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_OkoBeliar_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,5,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,4,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_IronOre,5,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Quartz,3,YPos_9,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_OrcAxe_4,1,YPos_11,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,4);
		Npc_RemoveInvItems(hero,ItMi_IronOre,5);
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		Npc_RemoveInvItems(hero,ItMi_Quartz,3);
		CreateInvItems(hero,ItMW_Ds_OkoBeliar,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Рудный покоритель

instance PC_ItMW_Ds_NuggetSubjugator(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_NuggetSubjugator_Condition;
	information = PC_ItMW_Ds_NuggetSubjugator_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_NuggetSubjugator_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_NuggetSubjugator == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_NuggetSubjugator_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,6,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,4,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_IronOre,6,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_ShadowHorn,1,YPos_9,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_DarkPearl,1,YPos_11,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_OrcAxe_5,1,YPos_13,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,4);
		Npc_RemoveInvItems(hero,ItMi_Nugget,6);
		Npc_RemoveInvItems(hero,ItMi_IronOre,6);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(hero,ItAt_ShadowHorn,1);
		CreateInvItems(hero,ItMW_Ds_NuggetSubjugator,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;		
};

// Несущий смерть

instance PC_ItMW_Ds_BearingDeath(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_Ds_BearingDeath_Condition;
	information = PC_ItMW_Ds_BearingDeath_Info;
	permanent = TRUE;
};
func int PC_ItMW_Ds_BearingDeath_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Weapon_Ds_BearingDeath == True))
	{
		return TRUE;
	};
};
func void PC_ItMW_Ds_BearingDeath_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,10,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,4,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_IronOre,10,YPos_7,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_ShadowHorn,2,YPos_9,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_DarkPearl,1,YPos_11,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_OrcAxe_6,1,YPos_13,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,4);
		Npc_RemoveInvItems(hero,ItMi_Nugget,10);
		Npc_RemoveInvItems(hero,ItMi_IronOre,10);
		Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
		Npc_RemoveInvItems(hero,ItAt_ShadowHorn,2);
		CreateInvItems(hero,ItMW_Ds_BearingDeath,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithWeaponDarkSaga = FALSE;	
};

//************++++++++++++++++++++++++ЛУКИ+++++++++++++++++++++**************************

// Лук охотника

instance PC_ItRw_Ds_Bow_Hunter(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_Bow_Hunter_Condition;
	information = PC_ItRw_Ds_Bow_Hunter_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_Bow_Hunter_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_BowHunter == True))
	{
		return TRUE;
	};
};
func void PC_ItRw_Ds_Bow_Hunter_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,2,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Bow_01,1,YPos_7,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,2);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		CreateInvItems(hero,ItRw_Ds_Bow_Hunter,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;		
};

// Рассекающий ветер

instance PC_ItRw_Ds_Bow_Wind(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_Bow_Wind_Condition;
	information = PC_ItRw_Ds_Bow_Wind_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_Bow_Wind_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_BowWind == True))
	{
		return TRUE;
	};
};
func void PC_ItRw_Ds_Bow_Wind_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,2,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Bow_02,1,YPos_7,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,2);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		CreateInvItems(hero,ItRw_Ds_Bow_Wind,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;		
};

// Порыв

instance PC_ItRw_Ds_Bow_Rush(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_Bow_Rush_Condition;
	information = PC_ItRw_Ds_Bow_Rush_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_Bow_Rush_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_BowRush == True))
	{
		return TRUE;
	};
};
func void PC_ItRw_Ds_Bow_Rush_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,3,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,1,YPos_7,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Bow_03,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,3);
		Npc_RemoveInvItems(hero,ItMi_Nugget,1);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		CreateInvItems(hero,ItRw_Ds_Bow_Rush,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;	
};

// Мудрость охотника

instance PC_ItRw_Ds_Bow_HunterWisdom(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_Bow_HunterWisdom_Condition;
	information = PC_ItRw_Ds_Bow_HunterWisdom_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_Bow_HunterWisdom_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_BowHunterWisdom == True))
	{
		return TRUE;
	};
};
func void PC_ItRw_Ds_Bow_HunterWisdom_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,3,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,2,YPos_7,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Bow_04,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,3);
		Npc_RemoveInvItems(hero,ItMi_Nugget,2);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		CreateInvItems(hero,ItRw_Ds_Bow_HunterWisdom,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;		
};

// Утренняя заря

instance PC_ItRw_Ds_Bow_MorningDawn(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_Bow_MorningDawn_Condition;
	information = PC_ItRw_Ds_Bow_MorningDawn_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_Bow_MorningDawn_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_BowMorningDawn == True))
	{
		return TRUE;
	};
};
func void PC_ItRw_Ds_Bow_MorningDawn_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,3,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,3,YPos_7,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_GoldNugget_Addon,3,YPos_9,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Bow_05,1,YPos_11,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,3);
		Npc_RemoveInvItems(hero,ItMi_Nugget,3);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		Npc_RemoveInvItems(hero,ItMi_GoldNugget_Addon,3);
		CreateInvItems(hero,ItRw_Ds_Bow_MorningDawn,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;		
};

// Поражающий цель

instance PC_ItRw_Ds_CrossBow_Purpose(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_CrossBow_Purpose_Condition;
	information = PC_ItRw_Ds_CrossBow_Purpose_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_CrossBow_Purpose_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_CrossBowPurpose == True))
	{
		return TRUE;
	};
};
func void PC_ItRw_Ds_CrossBow_Purpose_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,3,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,1,YPos_7,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Crossbow_01,1,YPos_9,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,3);
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,1);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		CreateInvItems(hero,ItRw_Ds_CrossBow_Purpose,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;		
};

// Удача тролля

instance PC_ItRw_Ds_CrossBow_LucklyTroll(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_CrossBow_LucklyTroll_Condition;
	information = PC_ItRw_Ds_CrossBow_LucklyTroll_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_CrossBow_LucklyTroll_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_CrossBowLucklyTroll == True))
	{
		return TRUE;
	};
};
func void PC_ItRw_Ds_CrossBow_LucklyTroll_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,3,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,1,YPos_7,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_GoldNugget_Addon,3,YPos_9,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Crossbow_02,1,YPos_11,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,3);
		Npc_RemoveInvItems(hero,ItMi_GoldNugget_Addon,3);
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,1);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		CreateInvItems(hero,ItRw_Ds_CrossBow_LucklyTroll,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;		
};

// Рассвет

instance PC_ItRw_Ds_CrossBow_Dawn(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_CrossBow_Dawn_Condition;
	information = PC_ItRw_Ds_CrossBow_Dawn_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_CrossBow_Dawn_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_CrossBowDawn == True))
	{
		return TRUE;
	};
};

func void PC_ItRw_Ds_CrossBow_Dawn_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,4,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,2,YPos_7,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,3,YPos_9,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Crossbow_03,1,YPos_11,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,4);
		Npc_RemoveInvItems(hero,ItMi_Nugget,3);
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,2);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		CreateInvItems(hero,ItRw_Ds_CrossBow_Dawn,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;		
};

// Песнь звезды

instance PC_ItRw_Ds_CrossBow_StarSong(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItRw_Ds_CrossBow_StarSong_Condition;
	information = PC_ItRw_Ds_CrossBow_StarSong_Info;
	permanent = TRUE;
};
func int PC_ItRw_Ds_CrossBow_StarSong_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_CrossBowStarSong == True))
	{
		return TRUE;
	};
};
func void PC_ItRw_Ds_CrossBow_StarSong_Info()
{      
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_WoodRaw,4,YPos_3,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_VeinLizard,1,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItMiSwordrawhot,3,YPos_7,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,4,YPos_9,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItMi_Quartz,1,YPos_11,true)
	&& C_Npc_DS_HasItems_Scr(hero,ItWr_DS_Drawing_Crossbow_04,1,YPos_13,true))
	{
		Npc_RemoveInvItems(hero,ItMi_WoodRaw,4);
		Npc_RemoveInvItems(hero,ItMi_Nugget,4);
		Npc_RemoveInvItems(hero,ItMiSwordrawhot,3);
		Npc_RemoveInvItems(hero,ItAt_VeinLizard,1);
		Npc_RemoveInvItems(hero,ItMi_Quartz,1);
		CreateInvItems(hero,ItRw_Ds_CrossBow_StarSong,1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();
	SmithBowDarkSaga = FALSE;	
};

// ============================ СТРЕЛЫ/БОЛТЫ =====================================
//NS - Сделала по образу и подобию чеканки
// теперь можно изготовить все возможные стрелы/болты
// раньше из некоторых наконечников изготовить было нельзя

var int SMITH_Munition_Choise;
	const int SMITH_Munition_Choise_Head = 1;
	const int SMITH_Munition_Choise_Amount = 2;
	const int SMITH_Munition_Choise_Finish = 3;

var int SMITH_Munition_Result;
	const int SMITH_Munition_Result_Arrow = 1;
	const int SMITH_Munition_Result_Bolt = 2;
var int SMITH_Head;
	const int SMITH_Head_Iron = 1;
	const int SMITH_Head_Silver = 2;
	const int SMITH_Head_MagicOre = 3;
	const int SMITH_Head_BlackOre = 4;
	const int SMITH_Head_SpellBoundOre = 5;
var int SMITH_Munition_Amount;


const int XPOS_SMITH = 40;
const int YPOS_SMITH = 35;


//================================================================================
//сообщение про результат (и только!)
// длинное, выводим в три строчки
//                Изготовлено:
//                SMITH_Munition_Amount SMITH_Result-ов с наконечником/ами
//                из SMITH_Head
func void B_SMITH_Munition_PrintResultString()
{
	AI_PrintScreen(PRINT_Made_Result,XPOS_SMITH,YPOS_SMITH - 2,FONT_ScreenSmall,2);
	// сколько и чего
	var string txt;	txt = IntToString(SMITH_Munition_Amount);
	var int RusEndingType;	RusEndingType = C_GetRusEnding(SMITH_Munition_Amount);
	if (SMITH_Munition_Result == SMITH_Munition_Result_Arrow)
	{
		if (RusEndingType == 1)			{	txt = ConcatStrings(txt, " стрела");	}
		else if (RusEndingType == 2)	{	txt = ConcatStrings(txt, " стрелы");	}
		else							{	txt = ConcatStrings(txt, " стрел");	};
	}
	else if (SMITH_Munition_Result == SMITH_Munition_Result_Bolt)
	{
		if (RusEndingType == 1)			{	txt = ConcatStrings(txt, " болт");	}
		else if (RusEndingType == 2)	{	txt = ConcatStrings(txt, " болта");	}
		else							{	txt = ConcatStrings(txt, " болтов");	};
	};
	if (RusEndingType == 1)			{	txt = ConcatStrings(txt, " с наконечником");	}
	else							{	txt = ConcatStrings(txt, " с наконечниками");	};
	AI_PrintScreen(txt,XPOS_SMITH,YPOS_SMITH,FONT_ScreenSmall,2);	
	//из чего
	if (SMITH_Head == SMITH_Head_Iron)					{	txt = PRINT_MadeFrom_Iron;	}
	else if (SMITH_Head == SMITH_Head_Silver)			{	txt = PRINT_MadeFrom_Silver;	}
	else if (SMITH_Head == SMITH_Head_MagicOre)			{	txt = PRINT_MadeFrom_MagicOre;	}
	else if (SMITH_Head == SMITH_Head_BlackOre)			{	txt = PRINT_MadeFrom_BlackOre;	}
	else if (SMITH_Head == SMITH_Head_SpellBoundOre)	{	txt = PRINT_MadeFrom_SpellBoundOre;	};
	AI_PrintScreen(txt,XPOS_SMITH,YPOS_SMITH + 2,FONT_ScreenSmall,2);	
};

//сколько есть выбранных наконечников
func int C_SMITH_GetProperHeadAmount()
{
	// стрелы
	if (SMITH_Munition_Result == SMITH_Munition_Result_Arrow)	{
		if (SMITH_Head ==	 	SMITH_Head_Iron)	{
			return Npc_HasItems(self,		ItMi_IronArrowHead);
		}
		else if (SMITH_Head == 	SMITH_Head_Silver)	{
			return Npc_HasItems(self,		ItMi_SilverArrowHead);
		}
		else if (SMITH_Head == 	SMITH_Head_MagicOre)	{
			return Npc_HasItems(self,		ItMi_MagicArrowHead);
		}
		else if (SMITH_Head == 	SMITH_Head_SpellBoundOre)	{
			return Npc_HasItems(self,		ItMi_SpellBoundArrowHead);
		}
		else if (SMITH_Head == 	SMITH_Head_BlackOre)	{
			return Npc_HasItems(self,		ItMi_BlackArrowHead);
		};
	};
	// болты
	if (SMITH_Munition_Result == SMITH_Munition_Result_Bolt)	{
		if (SMITH_Head ==		SMITH_Head_Iron)	{
			return Npc_HasItems(self,		ItMi_IronBoltHead);
		}
		else if (SMITH_Head == 	SMITH_Head_Silver)	{
			return Npc_HasItems(self,		ItMi_SilverBoltHead);
		}
		else if (SMITH_Head == 	SMITH_Head_MagicOre)	{
			return Npc_HasItems(self,		ItMi_MagicBoltHead);
		}
		else if (SMITH_Head == 	SMITH_Head_BlackOre)	{
			return Npc_HasItems(self,		ItMi_BlackBoltHead);
		};
	};
	return 0;
};

//изготовить стрелы/болты: удаляет наконечники и древки, создает стрелы/болты, выводит сообщение
//ничего не проверяет, при неправильном сочетании ничего не сделает
func void B_SMITH_Munition_DoIt()
{
	// стрелы
	if (SMITH_Munition_Result == SMITH_Munition_Result_Arrow)	{
		Npc_RemoveInvItems(self, ItMi_ArrowRaw,SMITH_Munition_Amount);
		if (SMITH_Head ==	 	SMITH_Head_Iron)
		{
			Npc_RemoveInvItems(self,		ItMi_IronArrowHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ItRw_Arrow,SMITH_Munition_Amount);
		}
		else if (SMITH_Head == 	SMITH_Head_Silver)
		{
			Npc_RemoveInvItems(self,		ItMi_SilverArrowHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ITRW_SILVEROREARROW,SMITH_Munition_Amount);
		}
		else if (SMITH_Head == 	SMITH_Head_MagicOre)
		{
			Npc_RemoveInvItems(self,		ItMi_MagicArrowHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ITRW_ADDON_MAGICOREARROW,SMITH_Munition_Amount);
		}
		else if (SMITH_Head == 	SMITH_Head_SpellBoundOre)
		{
			Npc_RemoveInvItems(self,		ItMi_SpellBoundArrowHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ITRW_INNOSRETRIBUTIONARROW,SMITH_Munition_Amount);
		}
		else if (SMITH_Head == 	SMITH_Head_BlackOre)
		{
			Npc_RemoveInvItems(self,		ItMi_BlackArrowHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ITRW_ADDON_BLACKOREARROW,SMITH_Munition_Amount);
		};
	};
	// болты
	if (SMITH_Munition_Result == SMITH_Munition_Result_Bolt)	{
		Npc_RemoveInvItems(self, ItMi_BoltRaw,SMITH_Munition_Amount);
		if (SMITH_Head ==		SMITH_Head_Iron)
		{
			Npc_RemoveInvItems(self,		ItMi_IronBoltHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ItRw_Bolt_01,SMITH_Munition_Amount);
		}
		else if (SMITH_Head == 	SMITH_Head_Silver)
		{
			Npc_RemoveInvItems(self,		ItMi_SilverBoltHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ITRW_ADDON_SILVEROREBOLT,SMITH_Munition_Amount);
		}
		else if (SMITH_Head == 	SMITH_Head_MagicOre)
		{
			Npc_RemoveInvItems(self,		ItMi_MagicBoltHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ITRW_ADDON_MAGICOREBOLT,SMITH_Munition_Amount);
		}
		else if (SMITH_Head == 	SMITH_Head_BlackOre)
		{
			Npc_RemoveInvItems(self,		ItMi_BlackBoltHead,SMITH_Munition_Amount);
			CreateInvItems(self,			ITRW_ADDON_BLACKOREBOLT,SMITH_Munition_Amount);
		};
	};
	B_SMITH_Munition_PrintResultString();
};

//============================ ВЫБОР ============================

// ЗАГОТОВКА -------------------------------------------
func void PC_SMITH_Arrow_Choise_Head()
{
	SMITH_Head = 0;
	Info_ClearChoices(PC_SMITH_Arrow);
	Info_AddChoice(PC_SMITH_Arrow, Dialog_Back, PC_SMITH_Munition_Back);
	if (Npc_HasItems(self,			ItMi_BlackArrowHead))
		{	Info_AddChoice(PC_SMITH_Arrow,		PRINT_MadeFrom_BlackOre, 		PC_SMITH_BlackOre); };
	if (Npc_HasItems(self,			ItMi_SpellBoundArrowHead))
		{	Info_AddChoice(PC_SMITH_Arrow,		PRINT_MadeFrom_SpellBoundOre, 	PC_SMITH_SpellBoundOre); };
	if (Npc_HasItems(self,			ItMi_MagicArrowHead))
		{	Info_AddChoice(PC_SMITH_Arrow,		PRINT_MadeFrom_MagicOre, 		PC_SMITH_MagicOre); };
	if (Npc_HasItems(self,			ItMi_SilverArrowHead))
		{	Info_AddChoice(PC_SMITH_Arrow,		PRINT_MadeFrom_Silver, 			PC_SMITH_Silver); };
	if (Npc_HasItems(self,			ItMi_IronArrowHead))
		{	Info_AddChoice(PC_SMITH_Arrow,		PRINT_MadeFrom_Iron, 			PC_SMITH_Iron); };
};
func void PC_SMITH_Bolt_Choise_Head()
{
	SMITH_Head = 0;
	Info_ClearChoices(PC_SMITH_Bolt);
	Info_AddChoice(PC_SMITH_Bolt, Dialog_Back, PC_SMITH_Munition_Back);
	if (Npc_HasItems(self,			ItMi_BlackBoltHead))
		{	Info_AddChoice(PC_SMITH_Bolt,		PRINT_MadeFrom_BlackOre, 		PC_SMITH_BlackOre); };
	if (Npc_HasItems(self,			ItMi_MagicBoltHead))
		{	Info_AddChoice(PC_SMITH_Bolt,		PRINT_MadeFrom_MagicOre, 		PC_SMITH_MagicOre); };
	if (Npc_HasItems(self,			ItMi_SilverBoltHead))
		{	Info_AddChoice(PC_SMITH_Bolt,		PRINT_MadeFrom_Silver, 			PC_SMITH_Silver); };
	if (Npc_HasItems(self,			ItMi_IronBoltHead))
		{	Info_AddChoice(PC_SMITH_Bolt,		PRINT_MadeFrom_Iron, 			PC_SMITH_Iron); };
};
// СКОЛЬКО -------------------------------------------
func void PC_SMITH_Arrow_Choise_Amount()
{
	SMITH_Munition_Amount = 0;
	Info_ClearChoices(PC_SMITH_Arrow);
	Info_AddChoice(PC_SMITH_Arrow, Dialog_Back,PC_SMITH_Munition_Back);
	var int maxAmount;	maxAmount = C_SMITH_GetProperHeadAmount();
	if (maxAmount > 1)	{
		Info_AddChoice(PC_SMITH_Arrow, "Максимальное количество стрел",PC_SMITH_Munition_Amount_All);
	};
	if (maxAmount >= 100)	{
		Info_AddChoice(PC_SMITH_Arrow, "100 стрел",PC_SMITH_Munition_Amount_100);
	};
	if (maxAmount >= 50)	{
		Info_AddChoice(PC_SMITH_Arrow, "50 стрел",PC_SMITH_Munition_Amount_50);
	};
	if (maxAmount >= 10)	{
		Info_AddChoice(PC_SMITH_Arrow, "10 стрел",PC_SMITH_Munition_Amount_10);
	};
		Info_AddChoice(PC_SMITH_Arrow, "1 стрелу",PC_SMITH_Munition_Amount_1);
};
func void PC_SMITH_Bolt_Choise_Amount()
{
	SMITH_Munition_Amount = 0;
	Info_ClearChoices(PC_SMITH_Bolt);
	Info_AddChoice(PC_SMITH_Bolt, Dialog_Back,PC_SMITH_Munition_Back);
	var int maxAmount;	maxAmount = C_SMITH_GetProperHeadAmount();
	if (maxAmount > 1)	{
		Info_AddChoice(PC_SMITH_Bolt, "Максимальное количество болтов",PC_SMITH_Munition_Amount_All);
	};
	if (maxAmount >= 100)	{
		Info_AddChoice(PC_SMITH_Bolt, "100 болтов",PC_SMITH_Munition_Amount_100);
	};
	if (maxAmount >= 50)	{
		Info_AddChoice(PC_SMITH_Bolt, "50 болтов",PC_SMITH_Munition_Amount_50);
	};
	if (maxAmount >= 10)	{
		Info_AddChoice(PC_SMITH_Bolt, "10 болтов",PC_SMITH_Munition_Amount_10);
	};
		Info_AddChoice(PC_SMITH_Bolt, "1 болт",PC_SMITH_Munition_Amount_1);
};
// ПЕРЕХОДЫ ------------------------------------------
func void PC_SMITH_Munition_Next()
{
	SMITH_Munition_Choise += 1;
	if (SMITH_Munition_Result == SMITH_Munition_Result_Arrow)	{
		Info_ClearChoices(PC_SMITH_Arrow);
		if (SMITH_Munition_Choise == SMITH_Munition_Choise_Head)	{PC_SMITH_Arrow_Choise_Head();}	else
		if (SMITH_Munition_Choise == SMITH_Munition_Choise_Amount)	{PC_SMITH_Arrow_Choise_Amount();} else
		if (SMITH_Munition_Choise == SMITH_Munition_Choise_Finish)	{B_SMITH_Munition_DoIt();};
	}
	else if (SMITH_Munition_Result == SMITH_Munition_Result_Bolt)	{
		Info_ClearChoices(PC_SMITH_Bolt);
		if (SMITH_Munition_Choise == SMITH_Munition_Choise_Head)	{PC_SMITH_Bolt_Choise_Head();}	else
		if (SMITH_Munition_Choise == SMITH_Munition_Choise_Amount)	{PC_SMITH_Bolt_Choise_Amount();} else
		if (SMITH_Munition_Choise == SMITH_Munition_Choise_Finish)	{B_SMITH_Munition_DoIt();};
	};
};
func void PC_SMITH_Munition_Back()
{
	SMITH_Munition_Choise -= 2;
	PC_SMITH_Munition_Next();
};

//============================ ВАРИАНТЫ ============================

// ЗАГОТОВКА -------------------------------------------
func void PC_SMITH_Iron()
{
	SMITH_Head = SMITH_Head_Iron;
	PC_SMITH_Munition_Next();
};
func void PC_SMITH_Silver()
{
	SMITH_Head = SMITH_Head_Silver;
	PC_SMITH_Munition_Next();
};
func void PC_SMITH_MagicOre()
{
	SMITH_Head = SMITH_Head_MagicOre;
	PC_SMITH_Munition_Next();
};
func void PC_SMITH_BlackOre()
{
	SMITH_Head = SMITH_Head_BlackOre;
	PC_SMITH_Munition_Next();
};
func void PC_SMITH_SpellBoundOre()
{
	SMITH_Head = SMITH_Head_SpellBoundOre;
	PC_SMITH_Munition_Next();
};
// СКОЛЬКО -------------------------------------------
func void PC_SMITH_Munition_Amount_1()
{
	SMITH_Munition_Amount = 1;
	PC_SMITH_Munition_Next();
};
func void PC_SMITH_Munition_Amount_10()
{
	SMITH_Munition_Amount = 10;
	PC_SMITH_Munition_Next();
};
func void PC_SMITH_Munition_Amount_50()
{
	SMITH_Munition_Amount = 50;
	PC_SMITH_Munition_Next();
};
func void PC_SMITH_Munition_Amount_100()
{
	SMITH_Munition_Amount = 100;
	PC_SMITH_Munition_Next();
};
func void PC_SMITH_Munition_Amount_All()
{
	SMITH_Munition_Amount = C_SMITH_GetProperHeadAmount();
	PC_SMITH_Munition_Next();
};


// ========================== ДИАЛОГИ =====================================

instance PC_SMITH_Arrow(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 1;
	condition 	= PC_SMITH_Arrow_Condition;
	information = PC_SMITH_Arrow_Info;
	permanent 	= TRUE;
	description = "Изготовить стрелы";
};
func int PC_SMITH_Arrow_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_Arrow == True))
	{
		return TRUE;
	};
};
func void PC_SMITH_Arrow_Info()
{
	SMITH_Munition_Result = SMITH_Munition_Result_Arrow;
	PC_SMITH_Munition_Next();
};

//----------------------------------

instance PC_SMITH_Bolt(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 1;
	condition 	= PC_SMITH_Bolt_Condition;
	information = PC_SMITH_Bolt_Info;
	permanent 	= TRUE;
	description = "Изготовить стрелы";
};
func int PC_SMITH_Bolt_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithBowDarkSaga == TRUE) && (Weapon_Ds_Bolt == True))
	{
		return TRUE;
	};
};
func void PC_SMITH_Bolt_Info()
{
	SMITH_Munition_Result = SMITH_Munition_Result_Bolt;
	PC_SMITH_Munition_Next();
};
//Посох
instance PC_ItMW_DrainStaff(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMW_DrainStaff_Condition;
	information = PC_ItMW_DrainStaff_Info;
	permanent = TRUE;
};
func int PC_ItMW_DrainStaff_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SmithWeaponDarkSaga == TRUE) && (Read_StormPosohONCE == true))
	{
		return TRUE;
	};
};
func void PC_ItMW_DrainStaff_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItMi_OrcWood,1,YPos_3,true) && C_Npc_DS_HasItems_Scr(hero,ItMi_Nugget,3,YPos_5,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_Wing,4,YPos_7,true) && C_Npc_DS_HasItems_Scr(hero,ItMi_Rockcrystal,1,YPos_9,true) 
	&& C_Npc_DS_HasItems_Scr(hero,ItAt_CrawlerMandibles,1,YPos_11,true) && C_Npc_DS_HasItems_Scr(hero,ItAt_Spider_Crawler,1,YPos_13,true) )
	{
		Npc_RemoveInvItems(hero,ItMi_OrcWood,1);
		Npc_RemoveInvItems(hero,ITWR_FAKEPALADIN,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,3);
		Npc_RemoveInvItems(hero,ItAt_Wing,4);
		Npc_RemoveInvItems(hero,ItMi_Rockcrystal,1);
		Npc_RemoveInvItems(hero,ItAt_CrawlerMandibles,1);
		CreateInvItems(hero,ItMW_DrainStaff,1);
		Print(PRINT_DS_StormPosohSuccess);		
	}
	else
	{
		Print(PRINT_ProdSmithItemsMissing);
		CreateInvItems(hero,ItMiSwordraw,1);
	};
	b_endproductiondialog();	
	SmithWeaponDarkSaga = FALSE;	
};

func void SMITHWEAPON_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SmithWeapon;
		AI_ProcessInfos(hero);
	};
	PC_ItMW_Ds_Stick_01.description = ConcatStrings("Палка с шипами","");
	PC_ItMW_Ds_ToothWolf.description = ConcatStrings("Зуб волка","");
	PC_ItMW_Ds_BloodSword.description = ConcatStrings("Кровопускатель","");
	PC_ItMW_Ds_KillOrks.description = ConcatStrings("Убийца орков","");
	PC_ItMW_Ds_RevengePirates.description = ConcatStrings("Месть пирата","");
	PC_ItMW_Ds_SwordMaster.description = ConcatStrings("Клинок мастера","");
	PC_ItMW_Ds_Star.description = ConcatStrings("Звезда","");
	PC_ItMW_Ds_KillZombie.description = ConcatStrings("Убийца нежити","");
	PC_ItMW_Ds_Subjugator.description = ConcatStrings("Покоритель","");
	PC_ItMW_Ds_Volnorez.description = ConcatStrings("Волнорез","");
	PC_ItMW_Ds_KrashAgar.description = ConcatStrings("Краш Агар","");
	PC_ItMW_Ds_KrashDargot.description = ConcatStrings("Краш Даргот","");
	PC_ItMW_Ds_AngerOrk.description = ConcatStrings("Гнев Орка","");
	PC_ItMW_Ds_Punishment.description = ConcatStrings("Возмездие","");
	PC_ItMW_Ds_OkoBeliar.description = ConcatStrings("Око Белиара","");
	PC_ItMW_Ds_Destruction.description = ConcatStrings("Крушитель","");
	PC_ItMW_Ds_NuggetSubjugator.description = ConcatStrings("Рудный покоритель","");
	PC_ItMW_Ds_BearingDeath.description = ConcatStrings("Несущий смерть","");
	PC_ItRw_Ds_Bow_Hunter.description = ConcatStrings("Лук охотника","");
	PC_ItRw_Ds_Bow_Wind.description = ConcatStrings("Рассекающий ветер","");
	PC_ItRw_Ds_Bow_Rush.description = ConcatStrings("Порыв","");
	PC_ItRw_Ds_Bow_HunterWisdom.description = ConcatStrings("Мудрость охотника","");
	PC_ItRw_Ds_Bow_MorningDawn.description = ConcatStrings("Утренняя заря","");
	PC_ItRw_Ds_CrossBow_Purpose.description = ConcatStrings("Поражающий цель","");
	PC_ItRw_Ds_CrossBow_LucklyTroll.description = ConcatStrings("Удача тролля","");
	PC_ItRw_Ds_CrossBow_Dawn.description = ConcatStrings("Рассвет","");
	PC_ItRw_Ds_CrossBow_StarSong.description = ConcatStrings("Песнь звезды","");
	//PC_ItRw_Arrow.description = ConcatStrings("Изготовить стрелы","");
	//PC_ItRw_Bolt.description = ConcatStrings("Изготовить болты","");
	PC_ItMW_DrainStaff.description = ConcatStrings("”Собрать посох поглощения”","");
};

