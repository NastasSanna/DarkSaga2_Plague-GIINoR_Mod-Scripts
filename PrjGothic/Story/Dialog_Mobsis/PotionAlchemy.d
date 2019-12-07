/**************************************************************************

								АЛХИМИЯ
   
  Результат зависит от ловкости ГГ и навыка алхимии (псевдослучайно).
  
 //* NS - 31/01/2013
 
   Проставить цвета эффектов новых зелий!
  
***************************************************************************/

// =====================================================================
// NS: Внешнее

//указания цветов спецэффектов
const int EFFECTS_None		= 0;
const int EFFECTS_Red		= 1;
const int EFFECTS_Green		= 2;
const int EFFECTS_Blue		= 3;
const int EFFECTS_Purple	= 4;
const int EFFECTS_White		= 5;

// ПЕРЕМЕННЫЕ и КОНСТАНТЫ ================================================

// текущая ветка диалога (порядок веток в диалоге)
var int DIA_PotionAlchemy_Choice;
	const int DIA_PotionAlchemy_None		= 0;	//главное меню
	const int DIA_PotionAlchemy_Mana		= 1;	//зелья маны
	const int DIA_PotionAlchemy_Health		= 2;	//лечебные зелья
	const int DIA_PotionAlchemy_Perm		= 3;	//перманенты
	const int DIA_PotionAlchemy_Time		= 4;	//временные
	/*
	const int DIA_PotionAlchemy_Poison		= 5;	//яды
	const int DIA_PotionAlchemy_Booze		= 6;	//алкоголь
	const int DIA_PotionAlchemy_Tabak		= 7;	//табак
	//*/
	const int DIA_PotionAlchemy_Chaos		= 8;	//артефакты Хаоса

// сложность зелий
const int CL_Essence	= 1;
const int CL_Extract	= 3;
const int CL_Elixir		= 5;
const int CL_Perm		= 10;
const int CL_Speed		= 5;
const int CL_Wenig		= 7;
const int CL_Besondere	= 9;
const int CL_Botje_wenig		= 8;
const int CL_Botje_besondere	= 10;
/*
const int CL_Alcohol	= 0;
//*/


// MOB ===================================================================

func void potionalchemy_s1()
{
	if(Npc_IsPlayer(self) || (self.id == 0))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PotionAlchemy;
		AI_ProcessInfos(self);
	};
};

// ======================================================================
//   NS: Результат изготовления зелья
// ======================================================================

// повысить навык алхимии на val
func void B_DSG_SKL_Alchemy_Up(var int val)
{
	SKL_Alchemy += val;
	// сообщение
	var string msg;
	msg = ConcatStrings(PRINT_SKL_Alchemy_Up, IntToString(val));
	Print_DSG_OnMob(msg, FONT_ScreenSmall_HI, 1);
};

// ----------------------------------------------------------------------

// удалось ли изготовить зелье сложности CL (Effects для спецэффектов)
func int B_DSG_PotionAlchemy_Result(var int CL, var int Effects)
{
	var int rnd;
	
	//* проверка ЛОВКОСТИ ------------------------
	rnd = C_Random(100);
	var int DEX; DEX = self.attribute[ATR_DEXTERITY];
	var int p_dex;	p_dex = 100 / (1 + DEX / 5 * DEX / 5);
	// разбили - больше ничего проверять не надо
	if (rnd < p_dex)
	{
		// сообщение
		Snd_Play("PSILAB_GETBOTTLE");
		Print_DSG_OnMob(PRINT_AlchemyFlaskBroken, FONT_ScreenSmall_Red_HI, 2);
		// ингредиенты?
		if (C_Random(10) < 5)	//50%50 что сохранили
		{
			return RESULT_Fail_IngrSaved;
		};
		return RESULT_Fail_IngrLost;
	};
	//* проверка НАВЫКА ----------------------------
	// навык алхимии не нужен
	if (CL <= 0)
	{	
		// ! нужное сообщение вывести вне функции
		return RESULT_Success_1;
	};
	// вероятности
	rnd = C_Random(100);
	var int SKL_CL;	SKL_CL = SKL_Alchemy / CL;
	var int p1;		p1 = 100 - 75  / (1 + SKL_CL * SKL_CL / 10);
	var int p2;		p2 = 100 - 95  / (1 + SKL_CL * SKL_CL * SKL_CL * SKL_CL / 5000);
	var int p3;		p3 = 100 - 100 / (1 + SKL_CL * SKL_CL * SKL_CL * SKL_CL * SKL_CL * SKL_CL / 10000000);
	/* DEBUG INFO
	PrintScreen(IntTOString(rnd), 1, 8, FONT_ScreenSmall_HI, 4);
	PrintScreen(IntTOString(p1), 1, 10, FONT_ScreenSmall_HI, 4);
	PrintScreen(IntTOString(p2), 1, 12, FONT_ScreenSmall_HI, 4);
	PrintScreen(IntTOString(p3), 1, 14, FONT_ScreenSmall_HI, 4);
	PrintScreen(IntTOString(p1*p2*p3), 1, 17, FONT_ScreenSmall_HI, 4);
	//*/
	// получено зелье III уровня
	if (rnd * 10000 < p1 * p2 * p3)
	{
		Print_DSG_OnMob(PRINT_AlchemySuccess_3,FONT_ScreenSmall_Green_HI,0);
		B_DSG_SKL_Alchemy_Up(CL);
		return RESULT_Success_3;
	};
	// получено зелье II уровня
	if (rnd * 100 < p1 * p2)
	{
		Print_DSG_OnMob(PRINT_AlchemySuccess_2,FONT_ScreenSmall_Green_HI,0);
		B_DSG_SKL_Alchemy_Up(CL);
		return RESULT_Success_2;
	};
	// получено зелье I уровня
	if (rnd < p1)
	{
		Print_DSG_OnMob(PRINT_AlchemySuccess_1,FONT_ScreenSmall_Green_HI,0);
		B_DSG_SKL_Alchemy_Up(CL);
		return RESULT_Success_1;
	};
	// иначе - провал
	Print_DSG_OnMob(PRINT_AlchemyFail,FONT_ScreenSmall_Red_HI,0);
	// спецэффекты, если они есть
	if (Effects > Effects_None)
	{
		rnd = C_Random(100);
		// небольшой взрыв (шанс 30%)
		if (rnd < 30)	
		{
			AI_Wait(self, 1);
			Snd_Play("MFX_FIRESTORM_COLLIDE");
			Wld_PlayEffect("spellFX_InstantFireball_FIRECLOUD", ItMi_Flask,ItMi_Flask,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_InstantFireball_FIRECLOUD", ItMi_Flask,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_InstantFireball_FIRECLOUD", self,self,0,0,0,FALSE);
			var int dam;	dam = 10 + self.attribute[ATR_HITPOINTS_MAX] / 4;	//полученный урон (10HP + 25%HP_MAX)
			if (self.attribute[ATR_HITPOINTS] <= dam)	// летальный исход - откл.
			{
				dam = self.attribute[ATR_HITPOINTS] - 1;
			};
			AI_StandUpQuick(self);
			AI_Wait(self, 1);
			Npc_ChangeAttribute(self, ATR_HITPOINTS, -dam);	
//			Wld_PlayEffect("spellFX_INCOVATION_WHITE", self,self,0,0,0,FALSE);
		}
		// или безвредные разноцветные всполохи (шанс 50%)
		else if (rnd < 50)
		{
			AI_Wait(self, 1);
			if (Effects == EFFECTS_Red)
			{	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);	}
			else if (Effects == EFFECTS_Blue)
			{	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);	}
			else if (Effects == EFFECTS_Green)
			{	Wld_PlayEffect("spellFX_INCOVATION_GREEN",self,self,0,0,0,FALSE);	}
			else if (Effects == EFFECTS_Purple)
			{	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);	}
			else
			{	Wld_PlayEffect("SPELLFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);	};
		};
		// еще 20% что ничего страшного не произойдет
	};
	// на ошибках учатся, но не всегда
	if (C_Random(100) < 40)
	{
		B_DSG_SKL_Alchemy_Up(CL * 3); 
		AI_PlayAni(self, "R_SCRATCHHEAD");
	};
	return RESULT_Fail_IngrLost;
};

// ВЫХОД ==================================================================

instance PC_PotionAlchemy_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PotionAlchemy_End_Condition;
	information = PC_PotionAlchemy_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_PotionAlchemy_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
	{
		return TRUE;
	};
};

func void PC_PotionAlchemy_End_Info()
{
	CreateInvItems(self,ItMi_Flask,1);
	b_endproductiondialog();
};

// НАЗАД ==================================================================

instance PC_PotionAlchemy_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_PotionAlchemy_BACK_Condition;
	information = PC_PotionAlchemy_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_PotionAlchemy_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice != DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_PotionAlchemy_BACK_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_None;
};

// НАВЫК ===================================================================

instance PC_PotionAlchemy_Chance(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_PotionAlchemy_Chance_Condition;
	information = PC_PotionAlchemy_Chance_Info;
	permanent = TRUE;
	description = PRINT_SKL_Alchemy_Check;
};


func int PC_PotionAlchemy_Chance_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_PotionAlchemy_Chance_Info()
{
	var string msg;
	msg = ConcatStrings(PRINT_SKL_Alchemy, IntToString(SKL_Alchemy));
	Print_DSG_OnMob(msg, FONT_ScreenSmall_HI, 0);
};

// ЗЕЛЬЯ МАНЫ =============================================================

instance PC_Mana_Start(C_Info)
{
	npc = PC_Hero;
	nr = DIA_PotionAlchemy_Mana;
	condition = PC_Mana_Start_Condition;
	information = PC_Mana_Start_Info;
	permanent = TRUE;
	description = "Изготовить зелье маны";
};


func int PC_Mana_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_Mana_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Mana;
};

// -----------------------------------------------------------------

instance PC_ItPo_Mana_01(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_01_Condition;
	information = PC_ItPo_Mana_01_Info;
	permanent = TRUE;
	description = "Эссенция маны (2 огненных крапивы и 1 луговой горец)";
};


func int PC_ItPo_Mana_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Essence] == TRUE)		// умеем готовить
		&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)		// и знаем рецепт
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Mana))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_01_Info()
{
	// есть ли ингредиенты?
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Mana_Herb_01,2,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Essence, Effects_Blue);
		// потрачены ли ингредиенты?
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Mana_Herb_01,2);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			// что получилось?
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_Mana_low_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_Mana_low_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_Mana_low_01,1);	};
		};
		b_endproductiondialog();
	}
	else	//нету ингредиентов
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Mana_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_02_Condition;
	information = PC_ItPo_Mana_02_Info;
	permanent = TRUE;
	description = "Экстракт маны (2 огненных травы и 1 луговой горец) ";
};


func int PC_ItPo_Mana_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Extract] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Mana))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_02_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Mana_Herb_02,2,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Extract, Effects_Blue);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,2);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_Mana_Mittel_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_Mana_Mittel_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_Mana_Mittel_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Mana_03(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_03_Condition;
	information = PC_ItPo_Mana_03_Info;
	permanent = TRUE;
	description = "Эликсир маны (2 огненных корня и 1 луговой горец)";
};


func int PC_ItPo_Mana_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Mana))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_03_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Mana_Herb_03,2,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Elixir, Effects_Blue);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,2);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_Mana_hight_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_Mana_hight_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_Mana_hight_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

/* ОТКЛЮЧЕНО
instance PC_ItPo_Mana_04(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Mana_04_Condition;
	information = PC_ItPo_Mana_04_Info;
	permanent = TRUE;
	description = "Чистая мана (3 эссенции маны, 1 луговой горец)";
};


func int PC_ItPo_Mana_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Mana))
	{
		return TRUE;
	};
};

func void PC_ItPo_Mana_04_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPo_Mana_01,3,1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Elixir, Effects_Blue);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPo_Mana_01,3);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_Mana_Addon_04,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};
//*/

// ЛЕЧЕБНЫЕ ЗЕЛЬЯ =========================================================

instance PC_Health_Start(C_Info)
{
	npc = PC_Hero;
	nr = DIA_PotionAlchemy_Health;
	condition = PC_Health_Start_Condition;
	information = PC_Health_Start_Info;
	permanent = TRUE;
	description = "Изготовить лечебное зелье";
};


func int PC_Health_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_Health_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Health;
};

// -----------------------------------------------------------------

instance PC_ItPo_Health_01(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_Health_01_Condition;
	information = PC_ItPo_Health_01_Info;
	permanent = TRUE;
	description = "Лечебная эссенция (2 лечебные травы и 1 луговой горец)";
};


func int PC_ItPo_Health_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Essence] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Health))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_01_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Health_Herb_01,2,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Essence, Effects_Red);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,2);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_Health_low_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_Health_low_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_Health_low_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Health_02(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Health_02_Condition;
	information = PC_ItPo_Health_02_Info;
	permanent = TRUE;
	description = "Лечебный экстракт (2 лечебных растения и 1 луговой горец)";
};


func int PC_ItPo_Health_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Extract] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Health))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_02_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Health_Herb_02,2,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Extract, Effects_Red);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,2);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_Health_Mittel_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_Health_Mittel_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_Health_Mittel_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Health_03(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Health_03_Condition;
	information = PC_ItPo_Health_03_Info;
	permanent = TRUE;
	description = "Лечебный эликсир (2 лечебных корня и 1 луговой горец)";
};


func int PC_ItPo_Health_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Health))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_03_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Health_Herb_03,2,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Elixir, Effects_Red);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,2);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_Health_hight_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_Health_hight_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_Health_hight_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

/* EXLUDED
instance PC_ItPo_Health_04(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_Health_04_Condition;
	information = PC_ItPo_Health_04_Info;
	permanent = TRUE;
	description = "Чистое здоровье (3 лечебные эссенции, 1 луговой горец)";
};


func int PC_ItPo_Health_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Health_04] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Health))
	{
		return TRUE;
	};
};

func void PC_ItPo_Health_04_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPo_Health_01,3,1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Elixir, Effects_Red);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPo_Health_01,3);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_Health_Addon_04,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};
//*/

// ПЕРМАНЕНТЫ ===============================================================

instance PC_Perm_Start(C_Info)
{
	npc = PC_Hero;
	nr = DIA_PotionAlchemy_Perm;
	condition = PC_Perm_Start_Condition;
	information = PC_Perm_Start_Info;
	permanent = TRUE;
	description = "Изготовить зелье постоянного эффекта";
};

func int PC_Perm_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_Perm_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Perm;
};

// -----------------------------------------------------------------

instance PC_ItPo_Perm_Health(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Health_Condition;
	information = PC_ItPo_Perm_Health_Info;
	permanent = TRUE;
	description = "Зелье жизни (1 лечебный корень и 1 царский щавель)";
};


func int PC_ItPo_Perm_Health_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
//		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Perm] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Perm))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_Health_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Health_Herb_03,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Perm_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Perm, Effects_Red);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
			Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_Perm_Health_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_Perm_Health_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_Perm_Health_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Perm_Mana(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Perm_Mana_Condition;
	information = PC_ItPo_Perm_Mana_Info;
	permanent = TRUE;
	description = "Зелье духа (1 огненный корень и 1 царский щавель)";
};


func int PC_ItPo_Perm_Mana_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
//		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Perm] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Perm))
	{
		return TRUE;
	};
};

func void PC_ItPo_Perm_Mana_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Mana_Herb_03,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Perm_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Perm, Effects_Blue);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1);
			Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_Perm_Mana_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_Perm_Mana_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_Perm_Mana_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Dex(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Dex_Condition;
	information = PC_ItPo_Dex_Info;
	permanent = TRUE;
	description = "Зелье ловкости (1 гоблинские ягоды и 1 царский щавель.)";
};


func int PC_ItPo_Dex_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
//		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Perm] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Perm))
	{
		return TRUE;
	};
};

func void PC_ItPo_Dex_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Dex_Herb_01,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Perm_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Perm, Effects_Green);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Dex_Herb_01,1);
			Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ITPO_DSG_Dex_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ITPO_DSG_Dex_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ITPO_DSG_Dex_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Strg(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Strg_Condition;
	information = PC_ItPo_Strg_Info;
	permanent = TRUE;
	description = "Зелье силы (1 драконий корень и 1 царский щавель.)";
};


func int PC_ItPo_Strg_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
//		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Elixir] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Perm] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Perm))
	{
		return TRUE;
	};
};

func void PC_ItPo_Strg_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Strength_Herb_01,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Perm_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Perm, Effects_Purple);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Strength_Herb_01,1);
			Npc_RemoveInvItems(hero,ItPl_Perm_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ITPO_DSG_Str_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ITPO_DSG_Str_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ITPO_DSG_Str_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// ВРЕМЕННЫЕ ======================================================

instance PC_Time_Start(C_Info)
{
	npc = PC_Hero;
	nr = DIA_PotionAlchemy_Time;
	condition = PC_Time_Start_Condition;
	information = PC_Time_Start_Info;
	permanent = TRUE;
	description = "Изготовить зелье с временным эффектом";
};


func int PC_Time_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};

func void PC_Time_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Time;
};

// -----------------------------------------------------------------

instance PC_ItPo_Speed(C_Info)
{
	nr = 3;
	npc = PC_Hero;
	condition = PC_ItPo_Speed_Condition;
	information = PC_ItPo_Speed_Info;
	permanent = TRUE;
	description = "Зелье ускорения (1 снеппер-трава и 1 луговой горец)";
};


func int PC_ItPo_Speed_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Time] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Time))
	{
		return TRUE;
	};
};

func void PC_ItPo_Speed_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Speed_Herb_01,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Perm_Herb,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Speed, Effects_White);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Speed_Herb_01,1);
			Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_Speed_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_Speed_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_Speed_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_DSG_TinkturStr_wenig(C_Info)
{
	nr = 4;
	npc = PC_Hero;
	condition = PC_ItPo_DSG_TinkturStr_wenig_Condition;
	information = PC_ItPo_DSG_TinkturStr_wenig_Info;
	permanent = TRUE;
	description = "Настойка воина (1 древесный мох и 1 пустырник)";
};


func int PC_ItPo_DSG_TinkturStr_wenig_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Time] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_wenig] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Time))
	{
		return TRUE;
	};
};

func void PC_ItPo_DSG_TinkturStr_wenig_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Baummoos,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Motherwort,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Wenig, EFFECTS_White);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_DSG_Baummoos,1);
			Npc_RemoveInvItems(hero,ItPl_DSG_Motherwort,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_TinkturStr_wenig_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_TinkturStr_wenig_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_TinkturStr_wenig_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_DSG_TinkturStr_besondere(C_Info)
{
	nr = 5;
	npc = PC_Hero;
	condition = PC_ItPo_DSG_TinkturStr_besondere_Condition;
	information = PC_ItPo_DSG_TinkturStr_besondere_Info;
	permanent = TRUE;
	description = "Особая настойка воина (2 таириса и 1 пустырник)";
};


func int PC_ItPo_DSG_TinkturStr_besondere_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Time] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_besondere] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Time))
	{
		return TRUE;
	};
};

func void PC_ItPo_DSG_TinkturStr_besondere_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Tairis,2,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Motherwort,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_besondere, EFFECTS_White);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_DSG_Tairis,2);
			Npc_RemoveInvItems(hero,ItPl_DSG_Motherwort,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_TinkturStr_besondere_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_TinkturStr_besondere_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_TinkturStr_besondere_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_DSG_TinkturDex_wenig(C_Info)
{
	nr = 6;
	npc = PC_Hero;
	condition = PC_ItPo_DSG_TinkturDex_wenig_Condition;
	information = PC_ItPo_DSG_TinkturDex_wenig_Info;
	permanent = TRUE;
	description = "Настойка охотника (1 еловый гриб и 1 пустырник)";
};


func int PC_ItPo_DSG_TinkturDex_wenig_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Time] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_wenig] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Time))
	{
		return TRUE;
	};
};

func void PC_ItPo_DSG_TinkturDex_wenig_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_FichtePilz,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Motherwort,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Wenig, EFFECTS_White);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_DSG_FichtePilz,1);
			Npc_RemoveInvItems(hero,ItPl_DSG_Motherwort,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_TinkturDex_wenig_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_TinkturDex_wenig_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_TinkturDex_wenig_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_DSG_TinkturDex_besondere(C_Info)
{
	nr = 7;
	npc = PC_Hero;
	condition = PC_ItPo_DSG_TinkturDex_besondere_Condition;
	information = PC_ItPo_DSG_TinkturDex_besondere_Info;
	permanent = TRUE;
	description = "Особая настойка охотника (2 каменных корня и 1 пустырник)";
};


func int PC_ItPo_DSG_TinkturDex_besondere_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Time] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_besondere] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Time))
	{
		return TRUE;
	};
};

func void PC_ItPo_DSG_TinkturDex_besondere_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_SteinRoot,2,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Motherwort,1,YPos_3,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_besondere, EFFECTS_White);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_DSG_SteinRoot,2);
			Npc_RemoveInvItems(hero,ItPl_DSG_Motherwort,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_TinkturDex_besondere_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_TinkturDex_besondere_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_TinkturDex_besondere_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_DSG_TinkturBotje_wenig(C_Info)
{
	nr = 8;
	npc = PC_Hero;
	condition = PC_ItPo_DSG_TinkturBotje_wenig_Condition;
	information = PC_ItPo_DSG_TinkturBotje_wenig_Info;
	permanent = TRUE;
	description = "Настойка Ботье (1 часть крови варга, 1 древесный мох, 1 еловый гриб, 1 пустырник)";
};


func int PC_ItPo_DSG_TinkturBotje_wenig_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Time] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_wenig] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Time))
	{
		return TRUE;
	};
};

func void PC_ItPo_DSG_TinkturBotje_wenig_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItAt_DS2P_Blood_Warg,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Baummoos,1,YPos_3,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_FichtePilz,1,YPos_5,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Motherwort,1,YPos_7,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Botje_wenig, EFFECTS_White);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItAt_DS2P_Blood_Warg,1);
			Npc_RemoveInvItems(hero,ItPl_DSG_Baummoos,1);
			Npc_RemoveInvItems(hero,ItPl_DSG_FichtePilz,1);
			Npc_RemoveInvItems(hero,ItPl_DSG_Motherwort,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_TinkturBotje_wenig_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_TinkturBotje_wenig_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_TinkturBotje_wenig_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_DSG_TinkturBotje_besondere(C_Info)
{
	nr = 9;
	npc = PC_Hero;
	condition = PC_ItPo_DSG_TinkturBotje_besondere_Condition;
	information = PC_ItPo_DSG_TinkturBotje_besondere_Info;
	permanent = TRUE;
	description = "Настойка могущества (1 часть крови мракориса, 1 таирис, 1 каменный корень, 1 пустырник)";
};
func int PC_ItPo_DSG_TinkturBotje_besondere_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY_BASICS[ALCHEMY_Time] == TRUE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_besondere] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Time))
	{
		return TRUE;
	};
};
func void PC_ItPo_DSG_TinkturBotje_besondere_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItAt_DS2P_Blood_Shadowbeast,1,YPos_1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Tairis,1,YPos_3,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_SteinRoot,1,YPos_5,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_DSG_Motherwort,1,YPos_7,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Botje_besondere, EFFECTS_White);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItAt_DS2P_Blood_Shadowbeast,1);
			Npc_RemoveInvItems(hero,ItPl_DSG_Tairis,1);
			Npc_RemoveInvItems(hero,ItPl_DSG_SteinRoot,1);
			Npc_RemoveInvItems(hero,ItPl_DSG_Motherwort,1);
			if (Result == 3)
			{	CreateInvItems(hero,ItPo_DSG_TinkturBotje_besondere_03,1);	}
			else if (Result == 2)
			{	CreateInvItems(hero,ItPo_DSG_TinkturBotje_besondere_02,1);	}
			else if (Result == 1)
			{	CreateInvItems(hero,ItPo_DSG_TinkturBotje_besondere_01,1);	};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// АРТЕФАКТЫ ХАОСА ========================================================

// -----------------------------------------------------------------
//выполнить зачарование
var int Charge_ArtefactInst;	//что зачаровываем
func void DoCharge_ChargeArtefact()
{
	//накладываем случайный эффект
	B_DSG_SetRandomChaosEffect(Charge_ArtefactInst);
};
// -----------------------------------------------------------------
//какой кровью зачаровываем
func void PC_Charge_ChaosArtefact_Menu()
{
	Info_ClearChoices(PC_Charge_ChaosArtefacts);
	Info_AddChoice(PC_Charge_ChaosArtefacts,Dialog_Back,PC_Charge_ChaosArtefact_Back);
	if (Npc_HasItems(self,ItAt_HarpyBlood))	{
		Info_AddChoice(PC_Charge_ChaosArtefacts,"...кровью гарпии",PC_Charge_ChaosArtefact_HarpyBlood);
	};
	if (Npc_HasItems(self,ItAt_IcewolfBlood))	{
		Info_AddChoice(PC_Charge_ChaosArtefacts,"...кровью ледяного волка",PC_Charge_ChaosArtefact_IceWolfBlood);
	};
	if (Npc_HasItems(self,ItAt_FireshadBlood))	{
		Info_AddChoice(PC_Charge_ChaosArtefacts,"...кровью огненного мракориса",PC_Charge_ChaosArtefact_FireshadBlood);
	};
	if (Npc_HasItems(self,ItAt_DSG_AnimalBlood))	{
		Info_AddChoice(PC_Charge_ChaosArtefacts,"...кровью обычного животного",PC_Charge_ChaosArtefact_AnimalBlood);
	};
};
func void PC_Charge_ChaosArtefact_Back()
{
	Info_ClearChoices(PC_Charge_ChaosArtefacts);
};
func void PC_Charge_ChaosArtefact_HarpyBlood()
{
	Npc_RemoveInvItem(self,ItAt_HarpyBlood);
	DoCharge_ChargeArtefact();
	B_EndProductionDialog();
};
func void PC_Charge_ChaosArtefact_IceWolfBlood()
{
	Npc_RemoveInvItem(self,ItAt_IcewolfBlood);
	DoCharge_ChargeArtefact();
	B_EndProductionDialog();
};
func void PC_Charge_ChaosArtefact_FireshadBlood()
{
	Npc_RemoveInvItem(self,ItAt_FireshadBlood);
	DoCharge_ChargeArtefact();
	B_EndProductionDialog();
};
func void PC_Charge_ChaosArtefact_AnimalBlood()
{
	Npc_RemoveInvItem(self,ItAt_DSG_AnimalBlood);
	DoCharge_ChargeArtefact();
	B_EndProductionDialog();
};
// -----------------------------------------------------------------
// Диалог зачарования
instance PC_Charge_ChaosArtefacts(C_Info)
{
	nr = DIA_PotionAlchemy_Chaos;
	npc = PC_Hero;
	condition = PC_Charge_ChaosArtefacts_Condition;
	information = PC_Charge_ChaosArtefacts_Info;
	permanent = TRUE;
	description = "Зарядить артефакты Хаоса";
};
func int PC_Charge_ChaosArtefacts_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY[CHARGE_DSG_ChaosArtefacts] == TRUE)
		&& ((Npc_HasItems(self,ItAm_DSG_Chaos_Discharged) > 0)
			|| (Npc_HasItems(self,ItAm_DSG_Chaos_Charged) > 0)
			|| (Npc_HasItems(self,ItRi_DSG_Chaos1_Discharged) > 0)
			|| (Npc_HasItems(self,ItRi_DSG_Chaos1_Charged) > 0)
			|| (Npc_HasItems(self,ItRi_DSG_Chaos2_Discharged) > 0)
			|| (Npc_HasItems(self,ItRi_DSG_Chaos2_Charged) > 0))
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};
func void PC_Charge_ChaosArtefacts_Info()
{
	//DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Chaos;
	Info_ClearChoices(PC_Charge_ChaosArtefacts);
	Info_AddChoice(PC_Charge_ChaosArtefacts,Dialog_Back,PC_Charge_ChaosArtefact_Back);
	if((Npc_HasItems(self,ItRi_DSG_Chaos2_Discharged) > 0)
		|| (Npc_HasItems(self,ItRi_DSG_Chaos2_Charged) > 0))
	{
		Info_AddChoice(PC_Charge_ChaosArtefacts,"Зарядить сапфировое кольцо Хаоса...",PC_Charge_ChaosArtefacts_Ri2);
	};
	if((Npc_HasItems(self,ItRi_DSG_Chaos1_Discharged) > 0)
		|| (Npc_HasItems(self,ItRi_DSG_Chaos1_Charged) > 0))
	{
		Info_AddChoice(PC_Charge_ChaosArtefacts,"Зарядить алмазное кольцо Хаоса...",PC_Charge_ChaosArtefacts_Ri1);
	};
	if((Npc_HasItems(self,ItAm_DSG_Chaos_Discharged) > 0)
		|| (Npc_HasItems(self,ItAm_DSG_Chaos_Charged) > 0))
	{
		Info_AddChoice(PC_Charge_ChaosArtefacts,"Зарядить амулет Хаоса...",PC_Charge_ChaosArtefacts_Am);
	};
};
// АМУЛЕТ ----------------------------------------------------------
func void PC_Charge_ChaosArtefacts_Am()
{
	if (Npc_HasItems(self,ItAm_DSG_Chaos_Discharged) > 0)
	{
		Npc_RemoveInvItem(self,ItAm_DSG_Chaos_Discharged);
	}
	else
	{
		Npc_RemoveInvItem(self,ItAm_DSG_Chaos_Charged);
	};
	CreateInvItem(self,ItAm_DSG_Chaos_Charged);
	Charge_ArtefactInst = Hlp_GetInstanceID(ItAm_DSG_Chaos_Charged);
	PC_Charge_ChaosArtefact_Menu();
};
// КОЛЬЦО С АЛМАЗОМ ------------------------------------------------
func void PC_Charge_ChaosArtefacts_Ri1()
{
	if (Npc_HasItems(self,ItRi_DSG_Chaos1_Discharged) > 0)
	{
		Npc_RemoveInvItem(self,ItRi_DSG_Chaos1_Discharged);
	}
	else
	{
		Npc_RemoveInvItem(self,ItRi_DSG_Chaos1_Charged);
	};
	CreateInvItem(self,ItRi_DSG_Chaos1_Charged);
	Charge_ArtefactInst = Hlp_GetInstanceID(ItRi_DSG_Chaos1_Charged);
	PC_Charge_ChaosArtefact_Menu();
};
// КОЛЬЦО С САПФИРОМ -----------------------------------------------
func void PC_Charge_ChaosArtefacts_Ri2()
{
	if (Npc_HasItems(self,ItRi_DSG_Chaos2_Discharged) > 0)
	{
		Npc_RemoveInvItem(self,ItRi_DSG_Chaos2_Discharged);
	}
	else
	{
		Npc_RemoveInvItem(self,ItRi_DSG_Chaos2_Charged);
	};
	CreateInvItem(self,ItRi_DSG_Chaos2_Charged);
	Charge_ArtefactInst = Hlp_GetInstanceID(ItRi_DSG_Chaos2_Charged);
	PC_Charge_ChaosArtefact_Menu();
};


//*/
/* ГЛАЗ ИННОСА ============================================================

instance PC_Charge_InnosEye(C_Info)
{
	nr = 1;
	npc = PC_Hero;
	condition = PC_Charge_InnosEye_Condition;
	information = PC_Charge_InnosEye_Info;
	permanent = TRUE;
	description = "Зарядить Глаз Инноса";
};
func int PC_Charge_InnosEye_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] == TRUE)
		&& (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};
func void PC_Charge_InnosEye_Info()
{
	if(((Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1)
			|| (Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1)
			|| (Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1) 
			|| (Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1))
		&& (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1))
	{
		if(Npc_HasItems(hero,ItAt_SwampdragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_SwampdragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_RockdragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_RockdragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_FiredragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_FiredragonHeart,1);
		}
		else if(Npc_HasItems(hero,ItAt_IcedragonHeart) >= 1)
		{
			Npc_RemoveInvItems(hero,ItAt_IcedragonHeart,1);
		};
		Npc_RemoveInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
		CreateInvItems(hero,ItMi_InnosEye_MIS,1);
		Print(PRINT_AlchemySuccessInnoseye);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self,ItMi_Flask,1);
	};
	b_endproductiondialog();
};
//*/

/* РАЗНОЕ ================================================================

instance PC_ItPo_MegaDrink(C_Info)
{
	nr = 2;
	npc = PC_Hero;
	condition = PC_ItPo_MegaDrink_Condition;
	information = PC_ItPo_MegaDrink_Info;
	permanent = TRUE;
	description = "Зелье из драконьих яиц (10 драконьих яиц, 1 черная жемчужина, 1 сера)";
};
func int PC_ItPo_MegaDrink_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};
func void PC_ItPo_MegaDrink_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItAt_DragonEgg_MIS,10,1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItMi_DarkPearl,1,3,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItMi_Sulfur,1,5,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Perm, Effects_White);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItAt_DragonEgg_MIS,10);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			if (Result > 0)
			{
				CreateInvItems(hero,ItPo_MegaDrink,1);
			};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItPo_Addon_Geist(C_Info)
{
	nr = 9;
	npc = PC_Hero;
	condition = PC_ItPo_Addon_Geist_Condition;
	information = PC_ItPo_Addon_Geist_Info;
	permanent = TRUE;
	description = "Эликсир изменения сознания";
};
func int PC_ItPo_Addon_Geist_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (Knows_MCELIXIER == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Special))
	{
		return TRUE;
	};
};
func void PC_ItPo_Addon_Geist_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItAt_Sting,2,1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPo_Mana_02,1,3,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPo_Health_01,1,5,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItFo_Addon_Pfeffer_01,1,7,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Perm, Effects_Red);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItAt_Sting,2);
			Npc_RemoveInvItems(hero,ItPo_Mana_02,1);
			Npc_RemoveInvItems(hero,ItPo_Health_01,1);
			Npc_RemoveInvItems(hero,ItFo_Addon_Pfeffer_01,1);
			if (Result > 0)
			{
				if(Knows_Bloodfly == TRUE)
				{
					CreateInvItems(hero,ItPo_Addon_Geist_02,1);
				}
				else
				{
					CreateInvItems(hero,ItPo_Addon_Geist_01,1);
				};
			};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};
//*/

/* АЛКОГОЛЬ ===============================================================

instance PC_Booze_Start(C_Info)
{
	npc = PC_Hero;
	nr = 10;
	condition = PC_Booze_Start_Condition;
	information = PC_Booze_Start_Info;
	permanent = TRUE;
	description = "Перегнать алкоголь";
};
func int PC_Booze_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};
func void PC_Booze_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Booze;
};

// -----------------------------------------------------------------

instance PC_Booze_Lou(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_Booze_Lou_Condition;
	information = PC_Booze_Lou_Info;
	permanent = TRUE;
	description = "Попробовать сделать 'Молот Лу'";
};
func int PC_Booze_Lou_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (Knows_LousHammer == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Booze))
	{
		return TRUE;
	};
};
func void PC_Booze_Lou_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_SwampHerb,1,1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Beet,2,3,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItAt_SharkTeeth,1,5,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItFo_Addon_Rum,1,7,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Alcohol, Effects_None);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItPl_Beet,2);
			Npc_RemoveInvItems(hero,ItAt_SharkTeeth,1);
			Npc_RemoveInvItems(hero,ItFo_Addon_Rum,1);
			if (Result > 0)
			{
				CreateInvItems(hero,ItFo_Addon_LousHammer,1);
			};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_Booze_Schlaf(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = PC_Booze_Schlaf_Condition;
	information = PC_Booze_Schlaf_Info;
	permanent = TRUE;
	description = "Молот Лу с двойным ромом";
};
func int PC_Booze_Schlaf_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (Knows_Schlafhammer == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Booze))
	{
		return TRUE;
	};
};
func void PC_Booze_Schlaf_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_SwampHerb,1,1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Beet,2,3,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItAt_SharkTeeth,1,5,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItFo_Addon_Rum,2,7,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Alcohol, Effects_None);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
			Npc_RemoveInvItems(hero,ItPl_Beet,2);
			Npc_RemoveInvItems(hero,ItAt_SharkTeeth,1);
			Npc_RemoveInvItems(hero,ItFo_Addon_Rum,2);
			if (Result > 0)
			{
				CreateInvItems(hero,ItFo_Addon_SchlafHammer,1);
			};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_Booze_SchnellerHering(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_Booze_SchnellerHering_Condition;
	information = PC_Booze_SchnellerHering_Info;
	permanent = TRUE;
	description = "Сделать 'Быструю селедку'";
};
func int PC_Booze_SchnellerHering_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)
		&& (Knows_SchnellerHering == TRUE)
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Booze))
	{
		return TRUE;
	};
};
func void PC_Booze_SchnellerHering_Info()
{
	if(C_Npc_DS_HasItems_Scr(hero,ItPl_Speed_Herb_01,1,1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItFo_Fish,1,3,true)
			&& C_Npc_DS_HasItems_Scr(hero,ItFo_Addon_Rum,1,5,true))
	{
		var int Result;	Result = B_DSG_PotionAlchemy_Result(CL_Alcohol, Effects_None);
		if (Result >= 0)
		{
			Npc_RemoveInvItems(hero,ItPl_Speed_Herb_01,1);
			Npc_RemoveInvItems(hero,ItFo_Fish,1);
			Npc_RemoveInvItems(hero,ItFo_Addon_Rum,1);
			if (Result > 0)
			{
				CreateInvItems(hero,ItFo_Addon_SchnellerHering,1);
			};
		};
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};
//*/

/* ТАБАК ==================================================================

instance PC_Tabak_Start(C_Info)
{
	npc = PC_Hero;
	nr = 11;
	condition = PC_Tabak_Start_Condition;
	information = PC_Tabak_Start_Info;
	permanent = TRUE;
	description = "Смешать табак или свернуть косяк";
};
func int PC_Tabak_Start_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) 
		&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_None))
	{
		return TRUE;
	};
};
func void PC_Tabak_Start_Info()
{
	DIA_PotionAlchemy_Choice = DIA_PotionAlchemy_Tabak;
};

// -----------------------------------------------------------------

instance PC_ItMi_Joint(C_Info)
{
	nr = 10;
	npc = PC_Hero;
	condition = PC_ItMi_Joint_Condition;
	information = PC_ItMi_Joint_Info;
	permanent = TRUE;
	description = "Обработать болотную траву (1 косяк)";
};
func int PC_ItMi_Joint_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)	&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Tabak))
	{
		return TRUE;
	};
};
func void PC_ItMi_Joint_Info()
{
	ifC_Npc_DS_HasItems_Scr(hero,ItPl_SwampHerb,1,1,true))
	{
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,1);
		CreateInvItems(hero,ItMi_Joint,1);
		Print_DSG_OnMob(PRINT_JointSuccess, FONT_ScreenSmall_Green_HI, 0);
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItMi_Addon_Joint_01(C_Info)
{
	nr = 11;
	npc = PC_Hero;
	condition = PC_ItMi_Addon_Joint_01_Condition;
	information = PC_ItMi_Addon_Joint_01_Info;
	permanent = TRUE;
	description = "Изготовить 'Зеленого послушника' (1 косяк)";
};
func int PC_ItMi_Addon_Joint_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy)	&& (DIA_PotionAlchemy_Choice == DIA_PotionAlchemy_Tabak)
		&& (Green_Extrem == TRUE))
	{
		return TRUE;
	};
};
func void PC_ItMi_Addon_Joint_01_Info()
{
	ifC_Npc_DS_HasItems_Scr(hero,ItPl_SwampHerb,2,1,true)
		&& C_Npc_DS_HasItems_Scr(hero,ItPl_Temp_Herb,1,1,true))
	{
		Npc_RemoveInvItems(hero,ItPl_SwampHerb,2);
		Npc_RemoveInvItems(hero,ItPl_Temp_Herb,1);
		CreateInvItems(hero,ItMi_Addon_Joint_01,1);
		Print_DSG_OnMob(PRINT_JointSuccess, FONT_ScreenSmall_Green_HI, 0);
		b_endproductiondialog();
	}
	else
	{
		Print_DSG_OnMob(PRINT_ProdItemsMissing, FONT_ScreenSmall_Red_HI,0);
	};
};

// -----------------------------------------------------------------

instance PC_ItMi_Tabak(C_Info)
{
	nr = 10;
	npc = PC_Hero;
	condition = PC_ItMi_Tabak_Condition;
	information = PC_ItMi_Tabak_Info;
	permanent = TRUE;
	description = "Смешать табак ...";
};
func int PC_ItMi_Tabak_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PotionAlchemy) && (Npc_HasItems(hero,ItMi_ApfelTabak) >= 1) && (TabakStart == TRUE))
	{
		return TRUE;
	};
};
func void PC_ItMi_Tabak_Info()
{
	Npc_RemoveInvItems(hero,ItMi_ApfelTabak,1);
	Info_ClearChoices(PC_ItMi_Tabak);
	Info_AddChoice(PC_ItMi_Tabak,Dialog_Back,PC_ItMi_Tabak_BACK);
	if(Npc_HasItems(hero,ItFo_Honey) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с медом",PC_ItMi_Tabak_Honey);
	};
	if(Npc_HasItems(hero,ItPl_SwampHerb) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с болотной травой",PC_ItMi_Tabak_Swampherb);
	};
	if(Npc_HasItems(hero,ItPl_Mushroom_01) >= 1)
	{
		Info_AddChoice(PC_ItMi_Tabak,"... с черным грибом",PC_ItMi_Tabak_Mushroom_01);
	};
};
func void PC_ItMi_Tabak_BACK()
{
	Info_ClearChoices(PC_ItMi_Tabak);
};
func void PC_ItMi_Tabak_Honey()
{
	CreateInvItems(hero,ItMi_Honigtabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};
func void PC_ItMi_Tabak_Swampherb()
{
	CreateInvItems(hero,ItMi_SumpfTabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};
func void PC_ItMi_Tabak_Mushroom_01()
{
	CreateInvItems(hero,ItMi_PilzTabak,1);
	Print(PRINT_TabakSuccess);
	b_endproductiondialog();
};
//*/
