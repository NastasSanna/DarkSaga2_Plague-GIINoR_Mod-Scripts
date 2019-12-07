
func void B_FollowMe_Wisp()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_FollowMe_Wisp_15_00");	//Следуй за мной.
};

instance DIA_Addon_WispDetector_EXIT(C_Info)
{
	npc = Wisp_Detector;
	nr = 999;
	condition = DIA_Addon_WispDetector_EXIT_Condition;
	information = DIA_Addon_WispDetector_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Addon_WispDetector_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_EXIT_Info()
{
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

var int itemrandy;
var int itemmount;
var int itemmount1;
var int findyes;

instance DIA_ADDON_WISPDETECTOR_FIND(C_Info)
{
	npc = Wisp_Detector;
	nr = 6;
	condition = dia_addon_wispdetector_find_condition;
	information = dia_addon_wispdetector_find_info;
	permanent = TRUE;
	description = "Показывай,что нашел!";
};

func int dia_addon_wispdetector_find_condition()
{
	if(GETTAINIK == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_wispdetector_find_info()
{
	FINDYES = Hlp_Random(5);
	if(FINDYES == 0)
	{
		AI_Output(other,self,"DIA_WispDetector_FindingHidingPlace_AfterFinding_15_00");	//Показывай, что... как, совсем ничего?
		B_IrrlichtBeep();
	}
	else
	{
		ITEMRANDY = Hlp_Random(100);
		AI_Output(other,self,"DIA_WispDetector_FindingHidingPlace_AfterFinding_15_01");	//Показывай, что нашел!
		if(ITEMRANDY <= 5)
		{
			ITEMMOUNT = Hlp_Random(500);
			CreateInvItems(self,ItMi_Gold,ITEMMOUNT);
			B_GiveInvItems(self,other,ItMi_Gold,ITEMMOUNT);
		}
		else if(ITEMRANDY <= 10)
		{
			CreateInvItem(self,ItRi_Prot_Fire_01);
			B_GiveInvItems(self,other,ItRi_Prot_Fire_01,1);
		}
		else if(ITEMRANDY <= 20)
		{
			CreateInvItem(self,ItMw_1h_Bau_Axe);
			B_GiveInvItems(self,other,ItMw_1h_Bau_Axe,1);
		}
		else if(ITEMRANDY <= 30)
		{
			CreateInvItem(self,ItRw_Sld_Bow);
			B_GiveInvItems(self,other,ItRw_Sld_Bow,1);
		}
		else if(ITEMRANDY <= 40)
		{
			CreateInvItem(self,ItSc_Light);
			B_GiveInvItems(self,other,ItSc_Light,1);
		}
		else if(ITEMRANDY <= 50)
		{
			ITEMMOUNT = Hlp_Random(200);
			ITEMMOUNT1 = Hlp_Random(200);
			CreateInvItems(self,ItRw_Arrow,ITEMMOUNT);
			CreateInvItems(self,ItRw_Bolt_01,ITEMMOUNT1);
			B_GiveInvItem_red(self,other,ItRw_Arrow,ITEMMOUNT,34);
			B_GiveInvItem_red(self,other,ItRw_Bolt_01,ITEMMOUNT1,37);
		}
		else if(ITEMRANDY <= 60)
		{
			ITEMMOUNT = Hlp_Random(11);
			CreateInvItems(self,ItLsTorch,ITEMMOUNT);
			B_GiveInvItems(self,other,ItLsTorch,ITEMMOUNT);
		}
		else if(ITEMRANDY <= 70)
		{
			ITEMMOUNT = Hlp_Random(4);
			ITEMMOUNT1 = Hlp_Random(3);
			CreateInvItems(self,ItPo_Health_01,ITEMMOUNT);
			CreateInvItems(self,ItPo_Mana_01,ITEMMOUNT1);
			B_GiveInvItem_red(self,other,ItPo_Health_01,ITEMMOUNT,34);
			B_GiveInvItem_red(self,other,ItPo_Mana_01,ITEMMOUNT1,37);
		};
	};
	BONUSWISP = FALSE;
	BONUSWISPFINDING = FALSE;
	GETTAINIK = FALSE;
	Info_ClearChoices(dia_addon_wispdetector_find);
	Info_AddChoice(dia_addon_wispdetector_find,Dialog_Back,dia_addon_wispdetector_find_back);
};

func void dia_addon_wispdetector_find_back()
{
	Info_ClearChoices(dia_addon_wispdetector_find);
	AI_StopProcessInfos(self);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	AI_StopProcessInfos(other);
};

instance DIA_ADDON_WISPDETECTOR_SPECIALSKILLS(C_Info)
{
	npc = Wisp_Detector;
	nr = 6;
	condition = dia_addon_wispdetector_specialskills_condition;
	information = dia_addon_wispdetector_specialskills_info;
	permanent = TRUE;
	description = "Специальные навыки";
};

func int dia_addon_wispdetector_specialskills_condition()
{
	if((BONUSWISP == FALSE) && (WISPISCHARGED == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_wispdetector_specialskills_info()
{
	Info_ClearChoices(dia_addon_wispdetector_specialskills);
	Info_AddChoice(dia_addon_wispdetector_specialskills,Dialog_Back,dia_addon_wispdetector_specialskills_back);
	if(PLAYER_TALENT_WISPDETECTOR[16] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_FINDING,dia_addon_wispdetector_specialskills_findinghidingplace);
	};
	if(PLAYER_TALENT_WISPDETECTOR[9] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_BONUSARMOR03,dia_addon_wispdetector_specialskills_bonusarmor03);
	}
	else if(PLAYER_TALENT_WISPDETECTOR[8] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_BONUSARMOR02,dia_addon_wispdetector_specialskills_bonusarmor02);
	}
	else if(PLAYER_TALENT_WISPDETECTOR[7] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_BONUSARMOR01,dia_addon_wispdetector_specialskills_bonusarmor01);
	};
	if(PLAYER_TALENT_WISPDETECTOR[12] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_BONUSATTACK03,dia_addon_wispdetector_specialskills_wispattack03);
	}
	else if(PLAYER_TALENT_WISPDETECTOR[11] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_BONUSATTACK02,dia_addon_wispdetector_specialskills_wispattack02);
	}
	else if(PLAYER_TALENT_WISPDETECTOR[10] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_BONUSATTACK01,dia_addon_wispdetector_specialskills_wispattack01);
	};
	if(PLAYER_TALENT_WISPDETECTOR[13] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_MANAREGENERATION,dia_addon_wispdetector_specialskills_manaregeneration);
	};
	if(PLAYER_TALENT_WISPDETECTOR[14] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_HPREGENERATION,dia_addon_wispdetector_specialskills_hpregeneration);
	};
	if(PLAYER_TALENT_WISPDETECTOR[15] == TRUE)
	{
		Info_AddChoice(dia_addon_wispdetector_specialskills,NAME_ADDON_WISPSKILL_LIGHTWISP,dia_addon_wispdetector_specialskills_lightwisp);
	};
};

func void dia_addon_wispdetector_specialskills_back()
{
	Info_ClearChoices(dia_addon_wispdetector_specialskills);
};

func void dia_addon_wispdetector_specialskills_findinghidingplace()
{
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	B_IrrlichtBeep();
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
//	b_gettainik();
	var string wp;
	wp = Npc_GetNextWP(self);
	AI_GotoWP(self,wp);
	AI_StopProcessInfos(self);
	gettainikWISP = true;
	BONUSWISP = TRUE;
	BONUSWISPFINDING = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_bonusarmor01()
{
	AI_StopProcessInfos(self);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,hero.attribute[ATR_HITPOINTS_MAX] / 10);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,hero.attribute[ATR_HITPOINTS_MAX] / 10);
	B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, 1);
	BONUSWISP = TRUE;
	BONUSWISPARMOR = TRUE;
	BONUSWISPARMOR01 = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_bonusarmor02()
{
	AI_StopProcessInfos(self);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,hero.attribute[ATR_HITPOINTS_MAX] / 5);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,hero.attribute[ATR_HITPOINTS_MAX] / 5);
	B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, 2);
	BONUSWISP = TRUE;
	BONUSWISPARMOR = TRUE;
	BONUSWISPARMOR02 = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_bonusarmor03()
{
	AI_StopProcessInfos(self);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,hero.attribute[ATR_HITPOINTS_MAX] / 4);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,hero.attribute[ATR_HITPOINTS_MAX] / 4);
	B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, 4);
	BONUSWISP = TRUE;
	BONUSWISPARMOR = TRUE;
	BONUSWISPARMOR03 = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_manaregeneration()
{
	AI_StopProcessInfos(self);
//	Npc_ChangeAttribute(hero,ATR_REGENERATEMANA,5);
	BONUSWISP = TRUE;
	BONUSWISPREGENERATIONMANA = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_hpregeneration()
{
	AI_StopProcessInfos(self);
	Npc_ChangeAttribute(hero,ATR_REGENERATEHP,5);
	BONUSWISP = TRUE;
	BONUSWISPREGENERATIONHP = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_wispattack01()
{
	AI_StopProcessInfos(self);
	Npc_ChangeAttribute(self,ATR_STRENGTH,5);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,5);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
	self.flags = NPC_FLAG_IMMORTAL;
	BONUSWISP = TRUE;
	BONUSWISPATTACK = TRUE;
	BONUSWISPATTACK01 = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_wispattack02()
{
	AI_StopProcessInfos(self);
	Npc_ChangeAttribute(self,ATR_STRENGTH,10);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,20);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,20);
	self.flags = NPC_FLAG_IMMORTAL;
	BONUSWISP = TRUE;
	BONUSWISPATTACK = TRUE;
	BONUSWISPATTACK02 = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_wispattack03()
{
	AI_StopProcessInfos(self);
	Npc_ChangeAttribute(self,ATR_STRENGTH,40);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,40);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,80);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,80);
	self.flags = NPC_FLAG_IMMORTAL;
	BONUSWISP = TRUE;
	BONUSWISPATTACK = TRUE;
	BONUSWISPATTACK03 = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

func void dia_addon_wispdetector_specialskills_lightwisp()
{
	Wld_PlayEffect("SPELLFX_LIGHT",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	AI_StopProcessInfos(self);
	BONUSWISP = TRUE;
	BONUSWISPLIGHT = TRUE;
	BONUSUSINGDAY = Wld_GetDay();
};

instance DIA_Addon_WispDetector_DetectItems(C_Info)
{
	npc = Wisp_Detector;
	nr = 5;
	condition = DIA_Addon_WispDetector_DetectItems_Condition;
	information = DIA_Addon_WispDetector_DetectItems_Info;
	permanent = TRUE;
	description = "Начинай поиски!";
};

func int DIA_Addon_WispDetector_DetectItems_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_DetectItems_Info()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_15_00");	//Начинай поиски!
	Info_ClearChoices(DIA_Addon_WispDetector_DetectItems);
	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Следуй за мной.",DIA_Addon_WispDetector_DetectItems_Follow);
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Ищи руны и свитки.",DIA_Addon_WispDetector_DetectItems_RUNE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Ищи золото, ключи и прочую утварь.",DIA_Addon_WispDetector_DetectItems_NONE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Ищи оружие дальнего боя и боеприпасы.",DIA_Addon_WispDetector_DetectItems_FF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Ищи оружие ближнего боя.",DIA_Addon_WispDetector_DetectItems_NF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Ищи еду и растения.",DIA_Addon_WispDetector_DetectItems_FOOD);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Ищи кольца и амулеты.",DIA_Addon_WispDetector_DetectItems_MAGIC);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Ищи любые зелья.",DIA_Addon_WispDetector_DetectItems_POTIONS);
	};
	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"Ищи все, что можешь найти!",DIA_Addon_WispDetector_DetectItems_ALL);
};
func void DIA_Addon_WispDetector_DetectItems_Follow()
{
	B_FollowMe_Wisp();
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
	WispSearching = WispSearch_Follow;
};
func void DIA_Addon_WispDetector_DetectItems_ALL()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_ALL_15_00");	//Ищи все, что можешь найти!
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
func void DIA_Addon_WispDetector_DetectItems_POTIONS()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_POTIONS_15_00");	//Ищи любые зелья.
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
func void DIA_Addon_WispDetector_DetectItems_MAGIC()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_MAGIC_15_00");	//Ищи кольца и амулеты.
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
func void DIA_Addon_WispDetector_DetectItems_FOOD()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FOOD_15_00");	//Ищи еду и растения.
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
func void DIA_Addon_WispDetector_DetectItems_NF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NF_15_00");	//Ищи оружие ближнего боя.
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
func void DIA_Addon_WispDetector_DetectItems_FF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FF_15_00");	//Ищи оружие дальнего боя и боеприпасы.
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
func void DIA_Addon_WispDetector_DetectItems_NONE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NONE_15_00");	//Ищи золото, ключи и прочую утварь.
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
func void DIA_Addon_WispDetector_DetectItems_RUNE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_RUNE_15_00");	//Ищи руны и свитки.
	WispSearching = WispSearch_RUNE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

instance DIA_Addon_WispDetector_Follow(C_Info)
{
	npc = Wisp_Detector;
	nr = 5;
	condition = DIA_Addon_WispDetector_Follow_Condition;
	information = DIA_Addon_WispDetector_Follow_Info;
	permanent = TRUE;
	description = "Следуй за мной.";
};
func int DIA_Addon_WispDetector_Follow_Condition()
{
	return TRUE;
};
func void DIA_Addon_WispDetector_Follow_Info()
{
	B_FollowMe_Wisp();
	WispSearching = WispSearch_Follow;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
