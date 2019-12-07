
var int PrayDay;

var string concatDonation;
var int SC_IsObsessed;
var int Shrine_STR_Bonus;
var int Shrine_DEX_Bonus;
var int Shrine_MANA_Bonus;
var int SpecialBless;
var int ShrineIsObsessed;
var int shrinehealing;
var int ShrinesHealed;
var int ShrineIsObsessed_SW_QEST_INNOS_ALTAR_01;
var int ShrineIsObsessed_SW_QEST_INNOS_ALTAR_02;
var int ShrineIsObsessed_SW_QEST_INNOS_ALTAR_03;
var int ShrineIsObsessed_SW_QEST_INNOS_ALTAR_04;
var int ShrineIsObsessed_SW_QEST_INNOS_ALTAR_05;
var int ShrineIsObsessed_SW_QEST_INNOS_ALTAR_06;
var int ShrineIsObsessed_SW_QEST_INNOS_ALTAR_07;
var int AngrySpirit;

func void C_IsShrineObsessed(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
	{
		ShrineIsObsessed = TRUE;
		if((Npc_GetDistToWP(hero,"SW_QEST_INNOS_ALTAR_01") < 2000) && (ShrineIsObsessed_SW_QEST_INNOS_ALTAR_01 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SW_QEST_INNOS_ALTAR_01 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"SW_QEST_INNOS_ALTAR_02") < 2000) && (ShrineIsObsessed_SW_QEST_INNOS_ALTAR_02 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SW_QEST_INNOS_ALTAR_02 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"SW_QEST_INNOS_ALTAR_03") < 2000) && (ShrineIsObsessed_SW_QEST_INNOS_ALTAR_03 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SW_QEST_INNOS_ALTAR_03 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"SW_QEST_INNOS_ALTAR_04") < 2000) && (ShrineIsObsessed_SW_QEST_INNOS_ALTAR_04 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SW_QEST_INNOS_ALTAR_04 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"SW_QEST_INNOS_ALTAR_05") < 2000) && (ShrineIsObsessed_SW_QEST_INNOS_ALTAR_05 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SW_QEST_INNOS_ALTAR_05 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"SW_QEST_INNOS_ALTAR_06") < 2000) && (ShrineIsObsessed_SW_QEST_INNOS_ALTAR_06 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SW_QEST_INNOS_ALTAR_06 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"SW_QEST_INNOS_ALTAR_07") < 2000) && (ShrineIsObsessed_SW_QEST_INNOS_ALTAR_07 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SW_QEST_INNOS_ALTAR_07 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else
		{
			ShrineIsObsessed = FALSE;
		};
	};
};


func void PrayShrine_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		C_IsShrineObsessed(self);
		if(ShrineIsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PrayShrine;
		AI_ProcessInfos(hero);
	};
};

instance PC_PrayShrine_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PrayShrine_End_Condition;
	information = PC_PrayShrine_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int PC_PrayShrine_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};
func void PC_PrayShrine_End_Info()
{
	b_endproductiondialog();
};

instance PC_PrayShrine_Pray(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayShrine_Pray_Condition;
	information = PC_PrayShrine_Pray_Info;
	permanent = TRUE;
	description = "Помолиться";
};
func int PC_PrayShrine_Pray_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};
func void PC_PrayShrine_Pray_Info()
{
	if(ShrineIsObsessed == TRUE)
	{
		//SC_IsObsessed = TRUE;
		PrintScreen("Иннос не слышит тебя.",-1,-1,FONT_Screen,2);
		Snd_Play("DEM_Die");
	}
	else
	{
		Info_ClearChoices(PC_PrayShrine_Pray);
		Info_AddChoice(PC_PrayShrine_Pray,Dialog_Back,PC_PrayShrine_Pray_Back);
		Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 0 золотых монет.",PC_PrayShrine_Pray_NoPay);
		if(Npc_HasItems(hero,ItMi_Gold) >= 10)
		{
			Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 10 золотых монет.",PC_PrayShrine_Pray_SmallPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 50)
		{
			Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 50 золотых монет.",PC_PrayShrine_Pray_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 100)
		{
			Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 100 золотых монет.",PC_PrayShrine_Pray_BigPay);
		};
	};
};
func void PC_PrayShrine_Pray_Back()
{
	Info_ClearChoices(PC_PrayShrine_Pray);
};
func void PC_PrayShrine_Pray_NoPay()
{
	var int zufall;
	zufall = Hlp_Random(100);
	if(PrayDay == Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else if(zufall < 5)
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,1);
	}
	else
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	};
	PrayDay = Wld_GetDay();
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_SmallPay()
{
	Npc_RemoveInvItems(hero,ItMi_Gold,10);
	if(PrayDay == Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,1);
	};
	PrayDay = Wld_GetDay();
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_MediumPay()
{
	Npc_RemoveInvItems(hero,ItMi_Gold,50);
	if(PrayDay == Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,2);
	};
	PrayDay = Wld_GetDay();
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_BigPay()
{
	var int zufall;
	zufall = Hlp_Random(100);
	Npc_RemoveInvItems(hero,ItMi_Gold,100);
	if(PrayDay == Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else if((Shrine_STR_Bonus < 10) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (zufall < 50))
	{
		B_BlessAttribute(hero,ATR_STRENGTH,1);
		Shrine_STR_Bonus += 1;
	}
	else if((Shrine_DEX_Bonus < 10) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (zufall >= 50))
	{
		B_BlessAttribute(hero,ATR_DEXTERITY,1);
		Shrine_DEX_Bonus += 1;
	}
	else if((Shrine_MANA_Bonus < 20) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		B_BlessAttribute(hero,ATR_MANA_MAX,1);
		Shrine_MANA_Bonus += 1;
	}
	else
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,2);
	};
	PrayDay = Wld_GetDay();
	Info_ClearChoices(PC_PrayShrine_Pray);
};

instance PC_PrayShrine_PlusHeal(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = PC_PrayShrine_PlusHeal_Condition;
	information = PC_PrayShrine_PlusHeal_Info;
	permanent = TRUE;
	description = "Повысить жизненную силу";
};
func int PC_PrayShrine_PlusHeal_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};
func void PC_PrayShrine_PlusHeal_Info()
{
	Info_ClearChoices(PC_PrayShrine_PlusHeal);
	Info_AddChoice(PC_PrayShrine_PlusHeal,Dialog_Back,PC_PrayShrine_PlusHeal_Back);
	Info_AddChoice(PC_PrayShrine_PlusHeal,"Увеличить жизненную силу +5 (1 LP)",PC_PrayShrine_PlusHeal_PlusFiive);
	Info_AddChoice(PC_PrayShrine_PlusHeal,"Увеличить жизненную силу +25 (5 LP)",PC_PrayShrine_PlusHeal_PlusTwentyFive);
	Info_AddChoice(PC_PrayShrine_PlusHeal,"Увеличить жизненную силу +50 (10 LP)",PC_PrayShrine_PlusHeal_PlusFifty);
};
func void PC_PrayShrine_PlusHeal_Back()
{
	Info_ClearChoices(PC_PrayShrine_PlusHeal);
};
func void PC_PrayShrine_PlusHeal_PlusFiive()
{
	if(hero.lp >= 1)
	{	
		hero.lp = hero.lp - 1;	
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,5);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,5);	
	}
	else
	{	
		AI_PrintScreen(PRINT_NotEnoughLP,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);	
		Info_ClearChoices(PC_PrayShrine_PlusHeal);
	};
};
func void PC_PrayShrine_PlusHeal_PlusTwentyFive()
{
	if(hero.lp >= 5)
	{	
		hero.lp = hero.lp - 5;	
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,25);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,25);	
	}
	else
	{	
		AI_PrintScreen(PRINT_NotEnoughLP,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);	
		Info_ClearChoices(PC_PrayShrine_PlusHeal);
	};
};
func void PC_PrayShrine_PlusHeal_PlusFifty()
{
	if(hero.lp >= 10)
	{	
		hero.lp = hero.lp - 10;	
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,50);
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,50);	
	}
	else
	{	
		AI_PrintScreen(PRINT_NotEnoughLP,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);	
		Info_ClearChoices(PC_PrayShrine_PlusHeal);
	};
};

// благословение рун
func string b_build_BlessRunes_string(var C_ITEM itemRune)
{
	var string concatString;
	var string itemDescription;
	concatString = "";
	itemDescription = itemRune.description;
	concatString = ConcatStrings("Благословить руну ”",itemDescription);
	concatString = ConcatStrings(concatString,"” (пожертвовать ");
	concatString = ConcatStrings(concatString,IntToString(500 * itemRune.mag_circle));
	concatString = ConcatStrings(concatString," золота)");
	return concatString;
};

instance PC_PrayShrine_BlessRunes(C_Info)
{
	npc = PC_Hero;
	nr = 15;
	condition = PC_PrayShrine_BlessRunes_Condition;
	information = PC_PrayShrine_BlessRunes_Info;
	permanent = true;
	description = "Благословить руну заклинания.";
};
func int PC_PrayShrine_BlessRunes_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) || (PLAYER_MOBSI_PRODUCTION == MOBSI_PrayIdol))
	{
		return TRUE;
	};
};
func void PC_PrayShrine_BlessRunes_Info()
{
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
	Info_AddChoice(PC_PrayShrine_BlessRunes,Dialog_Back,PC_PrayShrine_BlessRunes_Back);
	if(Npc_HasItems(hero,ItRu_fLight) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fLight),PC_PrayShrine_BlessRunes_fLight);
	};
	if(Npc_HasItems(hero,ItRu_fFireBolt) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fFireBolt),PC_PrayShrine_BlessRunes_fFireBolt);
	};
	if(Npc_HasItems(hero,ItRu_fZap) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fZap),PC_PrayShrine_BlessRunes_fZap);
	};
	if(Npc_HasItems(hero,ItRu_fLightHeal) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fLightHeal),PC_PrayShrine_BlessRunes_fLightHeal);
	};
	if(Npc_HasItems(hero,ItRu_fSumGobSkel) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fSumGobSkel),PC_PrayShrine_BlessRunes_fSumGobSkel);
	};
	if(Npc_HasItems(hero,ItRu_fInstantFireball) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fInstantFireball),PC_PrayShrine_BlessRunes_fInstantFireball);
	};
	if(Npc_HasItems(hero,ItRu_fIcebolt) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fIcebolt),PC_PrayShrine_BlessRunes_fIcebolt);
	};
	if(Npc_HasItems(hero,ItRu_fSumWolf) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fSumWolf),PC_PrayShrine_BlessRunes_fSumWolf);
	};
	if(Npc_HasItems(hero,ItRu_fWindfist) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fWindfist),PC_PrayShrine_BlessRunes_fWindfist);
	};
	if(Npc_HasItems(hero,ItRu_fSleep) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fSleep),PC_PrayShrine_BlessRunes_fSleep);
	};
	if(Npc_HasItems(hero,ItRu_fMediumHeal) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fMediumHeal),PC_PrayShrine_BlessRunes_fMediumHeal);
	};
	if(Npc_HasItems(hero,ItRu_fLightningFlash) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fLightningFlash),PC_PrayShrine_BlessRunes_fLightningFlash);
	};
	if(Npc_HasItems(hero,ItRu_fChargeFireball) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fChargeFireball),PC_PrayShrine_BlessRunes_fChargeFireball);
	};
	if(Npc_HasItems(hero,ItRu_fSumSkel) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fSumSkel),PC_PrayShrine_BlessRunes_fSumSkel);
	};
	if(Npc_HasItems(hero,ItRu_fFear) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fFear),PC_PrayShrine_BlessRunes_fFear);
	};
	if(Npc_HasItems(hero,ItRu_fIceCube) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fIceCube),PC_PrayShrine_BlessRunes_fIceCube);
	};
	if(Npc_HasItems(hero,ItRu_fThunderBall) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fThunderBall),PC_PrayShrine_BlessRunes_fThunderBall);
	};
	if(Npc_HasItems(hero,ItRu_fSumGol) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fSumGol),PC_PrayShrine_BlessRunes_fSumGol);
	};
	if(Npc_HasItems(hero,ItRu_fHarmUndead) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fHarmUndead),PC_PrayShrine_BlessRunes_fHarmUndead);
	};
	if(Npc_HasItems(hero,ItRu_fPyrokinesis) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fPyrokinesis),PC_PrayShrine_BlessRunes_fPyrokinesis);
	};
	if(Npc_HasItems(hero,ItRu_fFirestorm) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fFirestorm),PC_PrayShrine_BlessRunes_fFirestorm);
	};
	if(Npc_HasItems(hero,ItRu_fIceWave) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fIceWave),PC_PrayShrine_BlessRunes_fIceWave);
	};
	if(Npc_HasItems(hero,ItRu_fSumDemon) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fSumDemon),PC_PrayShrine_BlessRunes_fSumDemon);
	};
	if(Npc_HasItems(hero,ItRu_fFullHeal) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fFullHeal),PC_PrayShrine_BlessRunes_fFullHeal);
	};
	if(Npc_HasItems(hero,ItRu_fFirerain) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fFirerain),PC_PrayShrine_BlessRunes_fFirerain);
	};
	if(Npc_HasItems(hero,ItRu_fBreathOfDeath) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fBreathOfDeath),PC_PrayShrine_BlessRunes_fBreathOfDeath);
	};
	if(Npc_HasItems(hero,ItRu_fMassDeath) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fMassDeath),PC_PrayShrine_BlessRunes_fMassDeath);
	};
	if(Npc_HasItems(hero,ItRu_fArmyOfDarkness) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fArmyOfDarkness),PC_PrayShrine_BlessRunes_fArmyOfDarkness);
	};
	if(Npc_HasItems(hero,ItRu_fShrink) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fShrink),PC_PrayShrine_BlessRunes_fShrink);
	};
	if(Npc_HasItems(hero,ItRu_fThunderstorm) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fThunderstorm),PC_PrayShrine_BlessRunes_fThunderstorm);
	};
	if(Npc_HasItems(hero,ItRu_fWhirlwind) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fWhirlwind),PC_PrayShrine_BlessRunes_fWhirlwind);
	};
	if(Npc_HasItems(hero,ItRu_fGeyser) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fGeyser),PC_PrayShrine_BlessRunes_fGeyser);
	};
	if(Npc_HasItems(hero,ItRu_fWaterfist) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fWaterfist),PC_PrayShrine_BlessRunes_fWaterfist);
	};
	if(Npc_HasItems(hero,ItRu_fIcelance) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fIcelance),PC_PrayShrine_BlessRunes_fIcelance);
	};
	if(Npc_HasItems(hero,ItRu_fTelekinesis) > 0)
	{
		Info_AddChoice(PC_PrayShrine_BlessRunes,b_build_BlessRunes_string(ItRu_fTelekinesis),PC_PrayShrine_BlessRunes_fTelekinesis);
	};
};

func int b_ds_print_InnosBlessRunes(var int itemRune)
{
	var string concatString;		concatString = "";
	var int itemRune_magCircle; itemRune_magCircle = 0;
	var string itemRune_description; itemRune_description = "";
	CreateInvItem(hero,itemRune);
	Npc_RemoveInvItem(hero,itemRune);
	itemRune_magCircle = item.mag_circle;
	itemRune_description = item.description;	
	
	If(C_Npc_DS_HasItems_Scr(hero,ItMi_Gold,500 * itemRune_magCircle,YPos_5,true))
	{
		if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
		{
			PrintScreen("Иннос освятил руну",-1,33,FONT_ScreenSmall,3);
			if((ShrinesHealed < 7))
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS]/2;
			};
		}
		else if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayIdol)
		{
			PrintScreen("Белиар освятил руну",-1,33,FONT_ScreenSmall,3);
			if((ShrinesHealed > 6))
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
				hero.attribute[ATR_HITPOINTS_MAX] -= hero.attribute[ATR_HITPOINTS]/4;
			};
		};
		concatString = concatStrings("Руна ”",itemRune_description);
		concatString = concatStrings(concatString,"” получена");
		PrintScreen(concatString,-1,36,FONT_ScreenSmall,4);
		Npc_RemoveInvItems(hero,itemRune,1);
		Npc_RemoveInvItems(hero,ItMi_Gold,500 * itemRune_magCircle);
		return TRUE;
	}
	else
	{
		PrintScreen("Ваша мольба неискренняя",-1,33,FONT_ScreenSmall,3);
		return FALSE;
	};
	return FALSE;
	//Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_Back()
{
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fLight()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fLight))
	{		CreateInvItems(hero,ItRu_Light,1);	};
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fFireBolt()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fFireBolt))
	{ CreateInvItems(hero,ItRu_FireBolt,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fZap()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fZap))
	{ CreateInvItems(hero,ItRu_Zap,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fLightHeal()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fLightHeal))
	{ CreateInvItems(hero,ItRu_LightHeal,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fSumGobSkel()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fSumGobSkel))
	{ CreateInvItems(hero,ItRu_SumGobSkel,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fInstantFireball()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fInstantFireball))
	{ CreateInvItems(hero,ItRu_InstantFireball,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fIcebolt()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fIcebolt))
	{ CreateInvItems(hero,ItRu_Icebolt,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fSumWolf()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fSumWolf))
	{ CreateInvItems(hero,ItRu_SumWolf,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fWindfist()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fWindfist))
	{ CreateInvItems(hero,ItRu_Windfist,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fSleep()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fSleep))
	{ CreateInvItems(hero,ItRu_Sleep,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fMediumHeal()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fMediumHeal))
	{ CreateInvItems(hero,ItRu_MediumHeal,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fLightningFlash()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fLightningFlash))
	{ CreateInvItems(hero,ItRu_LightningFlash,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fChargeFireball()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fChargeFireball))
	{ CreateInvItems(hero,ItRu_ChargeFireball,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fSumSkel()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fSumSkel))
	{ CreateInvItems(hero,ItRu_SumSkel,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fFear()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fFear))
	{ CreateInvItems(hero,ItRu_Fear,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fIceCube()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fIceCube))
	{ CreateInvItems(hero,ItRu_IceCube,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fThunderBall()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fThunderBall))
	{ CreateInvItems(hero,ItRu_ThunderBall,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fSumGol()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fSumGol))
	{ CreateInvItems(hero,ItRu_SumGol,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fHarmUndead()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fHarmUndead))
	{ CreateInvItems(hero,ItRu_HarmUndead,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fPyrokinesis()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fPyrokinesis))
	{ CreateInvItems(hero,ItRu_Pyrokinesis,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fFirestorm()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fFirestorm))
	{ CreateInvItems(hero,ItRu_Firestorm,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fIceWave()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fIceWave))
	{ CreateInvItems(hero,ItRu_IceWave,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fSumDemon()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fSumDemon))
	{ CreateInvItems(hero,ItRu_SumDemon,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fFullHeal()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fFullHeal))
	{ CreateInvItems(hero,ItRu_FullHeal,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fFirerain()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fFirerain))
	{ CreateInvItems(hero,ItRu_Firerain,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fBreathOfDeath()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fBreathOfDeath))
	{ CreateInvItems(hero,ItRu_BreathOfDeath,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fMassDeath()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fMassDeath))
	{ CreateInvItems(hero,ItRu_MassDeath,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fArmyOfDarkness()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fArmyOfDarkness))
	{ CreateInvItems(hero,ItRu_ArmyOfDarkness,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fShrink()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fShrink))
	{ CreateInvItems(hero,ItRu_Shrink,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fThunderstorm()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fThunderstorm))
	{ CreateInvItems(hero,ItRu_Thunderstorm,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fWhirlwind()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fWhirlwind))
	{ CreateInvItems(hero,ItRu_Whirlwind,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fGeyser()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fGeyser))
	{ CreateInvItems(hero,ItRu_Geyser,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fWaterfist()
{ 
	if(b_ds_print_InnosBlessRunes(ItRu_fWaterfist))
	{ CreateInvItems(hero,ItRu_Waterfist,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fIcelance()
{
	if(b_ds_print_InnosBlessRunes(ItRu_fIcelance))
	{ CreateInvItems(hero,ItRu_Icelance,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};
func void PC_PrayShrine_BlessRunes_fTelekinesis()
{
	if(b_ds_print_InnosBlessRunes(ItRu_fTelekinesis))
	{ CreateInvItems(hero,ItRu_Telekinesis,1); };
	Info_ClearChoices(PC_PrayShrine_BlessRunes);
};

// Повысить ману

instance PC_PrayShrine_PlusMana(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = PC_PrayShrine_PlusMana_Condition;
	information = PC_PrayShrine_PlusMana_Info;
	permanent = TRUE;
	description = "Повысить магическую силу";
};
func int PC_PrayShrine_PlusMana_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};
func void PC_PrayShrine_PlusMana_Info()
{
	Info_ClearChoices(PC_PrayShrine_PlusMana);
	Info_AddChoice(PC_PrayShrine_PlusMana,Dialog_Back,PC_PrayShrine_PlusMana_Back);
	Info_AddChoice(PC_PrayShrine_PlusMana,B_BuildLearnString("Увеличить магическую силу +1",B_GetLearnCostAttribute(hero,ATR_MANA_MAX,1)),PC_PrayShrine_PlusMana_PlusOne);
	Info_AddChoice(PC_PrayShrine_PlusMana,B_BuildLearnString("Увеличить магическую силу +5",B_GetLearnCostAttribute(hero,ATR_MANA_MAX,5)),PC_PrayShrine_PlusMana_PlusFive);
	Info_AddChoice(PC_PrayShrine_PlusMana,B_BuildLearnString("Увеличить магическую силу +10",B_GetLearnCostAttribute(hero,ATR_MANA_MAX,10)),PC_PrayShrine_PlusMana_PlusTen);
};
func void PC_PrayShrine_PlusMana_Back()
{
	Info_ClearChoices(PC_PrayShrine_PlusMana);
};
func void PC_PrayShrine_PlusMana_PlusOne()
{
	var int x;
	x = B_GetLearnCostAttribute(hero,ATR_MANA_MAX,1);
	if(hero.lp >= x)
	{	
		hero.lp = hero.lp - x;	
		B_RaiseAttribute(hero,ATR_MANA_MAX,1);
		Npc_ChangeAttribute(hero,ATR_MANA,1);
	}
	else
	{	
		AI_PrintScreen(PRINT_NotEnoughLP,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);	
	};
	PC_PrayShrine_PlusMana_Info();
};
func void PC_PrayShrine_PlusMana_PlusFive()
{
	var int x;
	x = B_GetLearnCostAttribute(hero,ATR_MANA_MAX,5);
	if(hero.lp >= x)
	{	
		hero.lp = hero.lp - x;	
		B_RaiseAttribute(hero,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(hero,ATR_MANA,5);
	}
	else
	{	
		AI_PrintScreen(PRINT_NotEnoughLP,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);	
	};
	PC_PrayShrine_PlusMana_Info();
};

func void PC_PrayShrine_PlusMana_PlusTen()
{
	var int x;
	x = B_GetLearnCostAttribute(hero,ATR_MANA_MAX,10);
	if(hero.lp >= x)
	{	
		hero.lp = hero.lp - x;	
		B_RaiseAttribute(hero,ATR_MANA_MAX,10);
		Npc_ChangeAttribute(hero,ATR_MANA,10);	
	}
	else
	{	
		AI_PrintScreen(PRINT_NotEnoughLP,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);	
	};
	PC_PrayShrine_PlusMana_Info();
};


