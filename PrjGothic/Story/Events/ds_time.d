func void b_Reset_FightState()
{
	if(Npc_HasReadiedRangedWeapon(hero) == TRUE)
	{
		AI_RemoveWeapon(hero);
		AI_ReadyRangedWeapon(hero); 
	};
};

//------------------------------------
/*
var int zTrigger_del;
func void Pidorr()
{
	if(UserName_IsPidor)
	{
		Pidor_Counter -= 1;
		var string pidr;
		Clear();
		pidr = ConcatStrings("Выход из игры через: ",IntTostring(Pidor_Counter));
		PrintScreen(pidr,-1,-1,FONT_Screen_HI,2);
	};
	if(Pidor_Counter <= 0)
	{
		ExitSession();
		ExitGame();
	};	
};

func void Exit_FromPidorHands()
{
	zTrigger_del += 1;
	if(zTrigger_del <= 10)
	{
		Wld_SendTrigger("OCTS_ENGINE");
	}
	else
	{
		Wld_SendUnTrigger("OCTS_ENGINE");
		Ext_DeleteVobByName("OCTS_ENGINE");
	};	
	Pidorr();
};
*/
func void b_DS_choice_Munition()
{
	var C_Item rangedWeapon;
	var int munit;	
	if((Npc_HasEquippedRangedWeapon(hero) == TRUE) && (Npc_HasReadiedRangedWeapon(hero) == FALSE))
	{
		rangedWeapon = Npc_GetEquippedRangedWeapon(hero);
		if((rangedWeapon.flags & ITEM_BOW) == ITEM_BOW)
		{
			if((Equip_DS_Arrow == 1) && Npc_HasItems(hero,ItRw_Addon_MagicArrow))
			{ rangedWeapon.munition = ItRw_Addon_MagicArrow;			}
			else if((Equip_DS_Arrow == 2) && Npc_HasItems(hero,ITRW_INNOSRETRIBUTIONARROW))
			{	rangedWeapon.munition = ITRW_INNOSRETRIBUTIONARROW;	}
			else if((Equip_DS_Arrow == 3) && Npc_HasItems(hero,ITRW_SILVEROREARROW))
			{	rangedWeapon.munition = ITRW_SILVEROREARROW;				}
			else if((Equip_DS_Arrow == 4) && Npc_HasItems(hero,ITRW_ADDON_MAGICOREARROW))
			{	rangedWeapon.munition = ITRW_ADDON_MAGICOREARROW;		}
			else if((Equip_DS_Arrow == 5) && Npc_HasItems(hero,ITRW_ADDON_BLACKOREARROW))
			{	rangedWeapon.munition = ITRW_ADDON_BLACKOREARROW;		}
			else if((Equip_DS_Arrow == 6) && Npc_HasItems(hero,ITRW_ADDON_VAMPIRARROW))
			{	rangedWeapon.munition = ITRW_ADDON_VAMPIRARROW;			}
			else if((Equip_DS_Arrow == 7) && Npc_HasItems(hero,ItRw_Arrow))
			{	rangedWeapon.munition = ItRw_Arrow;									}
			else if((Equip_DS_Arrow == 8) && Npc_HasItems(hero,ItRw_Addon_FireArrow))
			{	rangedWeapon.munition = ItRw_Addon_FireArrow;				}
			else if((Equip_DS_Arrow == 9) && Npc_HasItems(hero,ITRW_ADDON_KILLERARROW))
			{	rangedWeapon.munition = ITRW_ADDON_KILLERARROW;			}
			else
			{ rangedWeapon.munition = ItRw_Arrow;};
		}
		else if((rangedWeapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW)
		{
			if((Equip_DS_Bolt == 1) && Npc_HasItems(hero,ItRw_Bolt_01))
			{ rangedWeapon.munition = ItRw_Bolt_01;			}
			else if((Equip_DS_Bolt == 2) && Npc_HasItems(hero,ItRw_Addon_MagicBolt))
			{	rangedWeapon.munition = ItRw_Addon_MagicBolt;	}
			else if((Equip_DS_Bolt == 3) && Npc_HasItems(hero,ITRW_ADDON_SILVEROREBOLT))
			{	rangedWeapon.munition = ITRW_ADDON_SILVEROREBOLT;				}
			else if((Equip_DS_Bolt == 4) && Npc_HasItems(hero,ITRW_ADDON_MAGICOREBOLT))
			{	rangedWeapon.munition = ITRW_ADDON_MAGICOREBOLT;		}
			else if((Equip_DS_Bolt == 5) && Npc_HasItems(hero,ITRW_ADDON_BLACKOREBOLT))
			{	rangedWeapon.munition = ITRW_ADDON_BLACKOREBOLT;		}
			else if((Equip_DS_Bolt == 6) && Npc_HasItems(hero,ITRW_ADDON_VAMPIRBOLT))
			{	rangedWeapon.munition = ITRW_ADDON_VAMPIRBOLT;			}
			else if((Equip_DS_Bolt == 7) && Npc_HasItems(hero,ITRW_ADDON_FIREBOLT))
			{	rangedWeapon.munition = ITRW_ADDON_FIREBOLT;									}
			else if((Equip_DS_Bolt == 8) && Npc_HasItems(hero,ITRW_ADDON_TROLLKILLERBOLT))
			{	rangedWeapon.munition = ITRW_ADDON_TROLLKILLERBOLT;				}
			else
			{ rangedWeapon.munition = ItRw_Bolt_01;};
		};
	};	
};

//{Skeleton_Ghost_Lord, Shadowbeast_Ghost_VioletFire, Skeleton_ds_Ghost_Shield_01, Skeleton_Ghost_Mage}
///
func void b_ds_regenerate()
{
	if(varTime_to_RegenMana)
	{
		time_to_regenMana += 1;
		if(time_to_regenMana >= varTime_to_RegenMana)
		{
			if(hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
			{	hero.attribute[ATR_MANA] += 1;
			};
			time_to_regenMana = 0;
		};
	};
	if(varTime_to_RegenHP)
	{
		time_to_regenHP += 1;
		if(time_to_regenHP >= varTime_to_RegenHP)
		{
			if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
			{	hero.attribute[ATR_HITPOINTS] += 1;
			};
			time_to_regenHP = 0;
		};
	};
};
func void GGG()
{
	const int KEY_SHARP = KEY_G;
	var int keyG;		keyG = MEM_KeyState(KEY_SHARP);

	//В(ы)ключаем деблокировочный ключ, который активирует все диалоги у НПС.
	if(hero.aivar[AIV_INVINCIBLE] == TRUE)
	{
		//if(keyG == KEY_PRESSED)
		//{
			//Itm_ChangeBetter(hero);
			if(MEM_MessageBox("abc","edf",MB_YESNO)==IDYES)
			{
				Inv_ChangeCols(4);
				Inv_ChangeRows(8);
			};
			//};
		//};
	};
};
var int SC_DS_FirstDialog_ComplexityLevel;
var int BS_HIT_COUNTER;
var int temp_ccc;
func void DS_TIME()
{
	b_ds_regenerate();	
	//**************
	//Redleha: удаление ненужных итемок
//	B_DS2P_DeblockAllInfos();
	
	/*const int KEY_SHARP = KEY_G;
	var int keyG;		keyG = MEM_KeyState(KEY_SHARP);

	//В(ы)ключаем деблокировочный ключ, который активирует все диалоги у НПС.
	if(hero.aivar[AIV_INVINCIBLE] == TRUE)
	{
		if(keyG == KEY_PRESSED))
		{
			//Itm_ChangeBetter(hero);
			if(MEM_MessageBox("abc","edf",MB_YESNO)==IDYES)
			{
				Inv_ChangeCols(4);
				Inv_ChangeRows(8);
			};
		};
	};
	*/
	
	if(C_BodyStateContains(hero,BS_HIT))
	{
		BS_HIT_COUNTER += 1;
		//Print(IntToString(BS_HIT_COUNTER));
		if(BS_HIT_COUNTER >= 5)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",24);
		};
		if(BS_HIT_COUNTER >= 10)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",23);
		};
		if(BS_HIT_COUNTER >= 15)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",22);
		};
		if(BS_HIT_COUNTER >= 20)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",21);
		};
		if(BS_HIT_COUNTER >= 25)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",20);
		};
		if(BS_HIT_COUNTER >= 30)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",19);
		};
		if(BS_HIT_COUNTER >= 35)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",18);
		};
		if(BS_HIT_COUNTER >= 40)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",17);
		};
		if(BS_HIT_COUNTER >= 45)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",16);
		};
		if(BS_HIT_COUNTER >= 50)
		{
			Npc_SetAniVelocity(hero,"S_1HATTACK",15);
		};
	};
	
	if(hero.aivar[AIV_INVINCIBLE] == FALSE)
	{
		if(!C_BodyStateContains(hero,BS_MOBINTERACT_INTERRUPT))
		{
			if(Npc_HasItems(hero,ItMw_2H_Axe_L_02))
			{
				Npc_RemoveInvItems(hero,ItMw_2H_Axe_L_02,Npc_HasItems(hero,ItMw_2H_Axe_L_02));
			};
			if(Npc_HasItems(hero,Itmi_Chest_Treasure_01))
			{
				Npc_RemoveInvItems(hero,Itmi_Chest_Treasure_01,Npc_HasItems(hero,Itmi_Chest_Treasure_01));
			};
		};
		if(Npc_HasItems(hero,ItMw_DS_VakKastet))
		{
			Npc_RemoveInvItems(hero,ItMw_DS_VakKastet,Npc_HasItems(hero,ItMw_DS_VakKastet));
		};	
		if(Npc_HasItems(hero,ItMw_DS_MonWeapon))
		{
			Npc_RemoveInvItems(hero,ItMw_DS_MonWeapon,Npc_HasItems(hero,ItMw_DS_MonWeapon));
		};
		if(Npc_HasItems(hero,ItMw_DS_MW_Karakus))
		{
			Npc_RemoveInvItems(hero,ItMw_DS_MW_Karakus,Npc_HasItems(hero,ItMw_DS_MW_Karakus));
		};		
	};
	//Redleha: наполнение склянки Упыря
	if(DS_drinkBloodOfGhoul_havedrankGG == true)
	{
		Snd_Play("SVM_15_Dead");
		AI_PlayAni(hero,"T_DEAD");
		hero.attribute[ATR_HITPOINTS] = 0;
		AI_StartState(hero,ZS_Dead,0,"");
		DS_drinkBloodOfGhoul_havedrankGG = false;
	};
	//Redleha: автоназначение выбранного типа заряда
	b_DS_choice_Munition();
	//Redleha: 'показ/отключение показа' времени
	if(ShowTimeOnScreen == TRUE)
	{
		PrintScreen_DS_Time();
	};
	//Обсчёт действия временных зелий
	B_DSG_TimePotions_Effect();
	//Redleha: выбор уровня сложности
	if(CURRENTLEVEL == DSG_PREPROLOG_ZEN)
	{
		if(SC_DS_FirstDialog_ComplexityLevel == FALSE)
		{
			hero.aivar[AIV_INVINCIBLE] = TRUE;
			PLAYER_MOBSI_PRODUCTION = MOBSI_ComplexityLevel;
			AI_ProcessInfos(hero);
			SC_DS_FirstDialog_ComplexityLevel = TRUE;
		};
	};
	
	//есть что полезное?
	B_DS2P_CheckHeroHasItems();
	
	//Exit_FromPidorHands();
	Wld_SendTrigger("TIME");
};


