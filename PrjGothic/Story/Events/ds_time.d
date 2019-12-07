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
	//Обсчитываем ситуацию с Джеком: "Если в течение двух суток мы не пообщались с Джеком, и он не ушел с корабля, то он тоже впадает в кому."
	if(CURRENTLEVEL == DSG_PROLOG_ZEN)
	{
		if(Wld_GetDay() > (DayNumber_LastTalkWithJack + 2))
		{
			if(C_Npc_GetDistToWP(none_11_Jack,"",1000,Less))	{	B_StartOtherRoutine(none_11_Jack,"SleepDeep");	};
		};
	};
	
	//NS - 27/06/13 
	//По квесту "Старая мельница": через 2 дня после начала ремонта мельница начинает работать
	if(CURRENTLEVEL == DSG_PROLOG_ZEN)
	{
		if((Wld_GetDay() >= Joseph_RepairMill_Day) && (Joseph_RepairMill_Done == FALSE))
		{
			// UNFINISHED вписать триггер для включения мельницы
			//Wld_SendTrigger("");
			Joseph_RepairMill_Done = TRUE;
		};
	};	
	
	//NS - 18/07/13 
	// Квест "Внук рыбака", если Гарон сбегает в лес
	if ((MIS_DS2P_GrandsonOfFisherman == LOG_Running)
		&& (Garon_Choice == Garon_Choice_GoForest) && (Garon_DeadInForest_HeroKnows == FALSE))
	{
		var C_NPC Garon;	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
		// Гарон погибает, как только ГГ отойдет подальше
		if (!Npc_IsDead(Garon))
		{
			if (Npc_GetDistToPlayer(Garon) > MEM_ReadInt(SPAWN_REMOVERANGE_Address))
			{
				B_KillNpc(Garon);
				//монстр, который его сожрал
				Wld_InsertNpc(Warg, "");	//UNFINISHED вписть WP для монстра
				//В карманах немного мяса, трав, палка с шипами, драконий корень
				CreateInvItems(Garon, ItFoMuttonRaw, 4);
				CreateInvItems(Garon, ItMW_Ds_Stick_01, 1);
				Npc_RemoveInvItems(Garon, ItMw_1h_Bau_Mace, 1);
				CreateInvItems(Garon, ItPl_Strength_Herb_01, 1);
			};
		}
		// ГГ нашел труп Гарона
		else
		{
			if ((Npc_GetDistToPlayer(Garon) < PERC_DIST_DIALOG) && Npc_CanSeeNpc(hero,Garon))
			{
				Garon_DeadInForest_HeroKnows = TRUE;
			};
		};
	};
	
	// Запись в дневник о том, что после разговора со Сью прошло 24 часа
	if ((SueBaby_WaitTimeQuest < Wld_GetPassedTime(0)) && (SueBaby_WaitingIsOver == FALSE)) // Если прошло более 24 часов
	{
		SueBaby_WaitingIsOver = TRUE;
		B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_ReturnToSue);
	};
	// Если ГГ убил мракорисов до истечения 6 часов, то к нему подбегает Серая Борода
	if ((Npc_HasItems(hero,ItAt_DS2P_ShadowHorn_Competition) >= 3)
		 && (GB_CompetitionTime_01 < Wld_GetPassedTime(0))
		 && (GB_CompetitionState == 1) && (GG_KilledShadowbeasts == FALSE)) // Если прошло меньше 6 часов
	{
		AI_SetWalkMode(GrayBeard,NPC_RUN);
		AI_GotoNpc(GrayBeard,hero);
		GG_KilledShadowbeasts = TRUE;
	};
	// Если ГГ не успел убить мракорисов до истечения 6 часов
	if ((GB_CompetitionTime_01 >= Wld_GetPassedTime(0)) && (GB_CompetitionState == 1)) // Если прошло больше 6 часов
	{
		B_StartOtherRoutine(GrayBeard,"GB_COMP_GOTOCAMP");
		var C_NPC sb_01;
		var C_NPC sb_02;
		var C_NPC sb_03;
		// Забираем у мракорисов рога, чтобы ГГ не смог их забрать
		Npc_RemoveInvItems(sb_01,ItAt_DS2P_ShadowHorn_Competition,1);
		Npc_RemoveInvItems(sb_02,ItAt_DS2P_ShadowHorn_Competition,1);
		Npc_RemoveInvItems(sb_03,ItAt_DS2P_ShadowHorn_Competition,1);
		// Убиваем мракорисов
		B_KillNpc(ShadowBeast_GB_Competition_01);
		B_KillNpc(ShadowBeast_GB_Competition_02);
		B_KillNpc(ShadowBeast_GB_Competition_03);
		// Даем Серой Бороде рога мракорисов
		CreateInvItems(Graybeard,ItAt_DS2P_ShadowHorn_Competition,3);
		B_DSG_Log_OpenClose(TOPIC_DS2P_TeachGrayBeard,LOG_MISSION,LOG_Running,TOPIC_DS2P_TeachGrayBeard_Comp_10);
		GB_CompetitionState = 4;
	};
	// Если Серая Борода убил мракорисов, и дошел до лагеря
	if ((GB_CompetitionState == 4) && Hlp_StrCmp(Npc_GetNearestWP(GrayBeard),"TEST_WP")) // UNFINISHED - Надо вписать вейпоинт входа в лагерь
	{
		B_StartOtherRoutine(GrayBeard,"START");
		// Забираем рога у Серой Бороды, чтобы ГГ не смог его побить в лагере
		Npc_RemoveInvItems(GrayBeard,ItAt_DS2P_ShadowHorn_Competition,3);
		GB_CompetitionState = 7;
	};
	// Если у ГГ есть все ингредиенты по квесту "Особый топор для Джозефа"
	if ((MIS_DS2P_SpecialAxe4Joseph == Log_Running) && (Npc_HasItems(hero,ItMi_Nugget) >= 20)
		 && (Npc_HasItems(hero,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(hero,ItAt_DS2P_BlackTrollBone) >= 1)
		 && (SpecialAxe_FindAllIngr == FALSE))
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_SpecialAxe4Joseph,LOG_MISSION,LOG_Running,TOPIC_DS2P_SpecialAxe4Joseph_FindAllIngredients);
		SpecialAxe_FindAllIngr = TRUE;
	};
	// Если прошло больше 2 дней с тех пор, как ГГ принес Джозефу все ингредиенты. "Специальный топор для Джозефа"
	if (((Joseph_ReadyAxeTime - Wld_GetDay()) >= 2) && (Joseph_ReadyAxe == FALSE))
	{
		// Создаем топор
		CreateInvItems(Joseph,ItMw_DS2P_2H_JosephAxe,1);
		AI_EquipBestMeleeWeapon(Joseph);
		Joseph_ReadyAxe = TRUE;
	};
	// Если убедили 5 человек участвовать в квесте "Заговор"
	if (MIS_DS2P_Conspiracy == Log_Running)
	{
		if ((Symon_InConspiracy == TRUE) && (SueBaby_InConspiracy == TRUE)
			 && (Joseph_InConspiracy == TRUE) && (Vales_InConspiracy == TRUE) && (Zedd_InConspiracy == TRUE))
		{
			B_DSG_Log_OpenClose(TOPIC_DS2P_Conspiracy,LOG_MISSION,LOG_Running,TOPIC_DS2P_Conspiracy_AllIn);
		};
	};
	// Если Грег поговорил с Валесом и Скипом после собрания
	if (MIS_DS2P_Conspiracy == Log_Success)
	{
		if (!Npc_IsDead(Vales))
		{
			if (MIS_DS2P_FromPiratesToPeasants == Log_Success)
			{
				if (!Npc_IsDead(Skip))
				{
					if (MIS_DS2P_OldAcquaintance == Log_Success)
					{
						B_StartOtherRoutine(Greg,"START");
					};
				}
				else
				{
					B_StartOtherRoutine(Greg,"START");
				};
			};
		}
		else
		{
			B_StartOtherRoutine(Greg,"START");
		};
	};


	//NS - 24/05/16 
	// Квест "Ушлый вор"
	if (MIS_DS2P_QuirkyThief == LOG_Running) {
		// не успели дойти до деревни до утра
		if (Wld_IsTime(3,0,22,0) && (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_GoTo)) {
			MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_Late;
			B_StartOtherRoutine(Gobbo_DS2P_JaAfFar,"START");
			Gobbo_DS2P_JaAfFar.aivar[AIV_NoFightParker] = FALSE;
			Gobbo_DS2P_JaAfFar.aivar[AIV_EnemyOverride] = FALSE;
			Gobbo_DS2P_JaAfFar.aivar[AIV_PARTYMEMBER] = FALSE;
		};
		// не успели отвлечь охранника до утра
		if (Wld_IsTime(4,0,22,0) && (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_CameTo)) {
			MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_Late;
			B_StartOtherRoutine(Gobbo_DS2P_JaAfFar,"START");
			Gobbo_DS2P_JaAfFar.aivar[AIV_NoFightParker] = FALSE;
			Gobbo_DS2P_JaAfFar.aivar[AIV_EnemyOverride] = FALSE;
			Gobbo_DS2P_JaAfFar.aivar[AIV_PARTYMEMBER] = FALSE;
		};
		
		//сняли охранника в нужное время - Джа-Аф-Фар крадет муку
		if (Wld_IsTime(22,0,4,0) && (MIS_DS2P_QuirkyThief_FlourSteal_Stage == MIS_DS2P_QuirkyThief_FlourSteal_CameTo)
			&& C_NpcIsDown(PIR_223_DS2P_GuardMill)) {
			//UNFINISHED добавить условие - охранник далеко от мельницы
			MIS_DS2P_QuirkyThief_FlourSteal_Stage = MIS_DS2P_QuirkyThief_FlourSteal_GotIt;
			B_DSG_Log_OpenClose(TOPIC_DS2P_QuirkyThief,LOG_MISSION,LOG_Running,TOPIC_DS2P_QuirkyThief_GuardDown);
			//UNFINISHED добавить в инвентарь гоблина муку
		};
	};

	//есть что полезное?
	B_DS2P_CheckHeroHasItems();
	
	//Exit_FromPidorHands();
	Wld_SendTrigger("TIME");
};


