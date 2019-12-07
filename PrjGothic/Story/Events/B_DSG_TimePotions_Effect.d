var int zufall_str; //счётчик по Силе
var int zufall_dex;	//счётчик по Силе
var int zufall_hpmax;	////счётчик по макс.жизни
/*----------------------------------------------------------------------*/
/*Redleha: функция деэкипировки оружия по окончании действия зелья*/
/*----------------------------------------------------------------------*/
func void DSG_GetAndUnEquipWeapons()
{
	var C_ITEM slfRangedWeapon; var C_ITEM slfMeleeWeapon;
	if(Npc_HasEquippedRangedWeapon(hero))
	{
		slfRangedWeapon = Npc_GetEquippedRangedWeapon(hero);
	}
	else if(Npc_HasReadiedRangedWeapon(hero))
	{
		slfRangedWeapon = Npc_GetReadiedWeapon(hero);
	};
	if(Npc_HasEquippedMeleeWeapon(hero))
	{
		slfMeleeWeapon = Npc_GetEquippedMeleeWeapon(hero);
	}
	else if(Npc_HasReadiedMeleeWeapon(hero))
	{
		slfMeleeWeapon = Npc_GetReadiedWeapon(hero);
	};

	//*****Деэкипировка оружий после окончания действия зелий временного эффекта****/
	if(
	/*Если необходимое условие наличия силы для ношения оружия меньше реальной силы ГГ*/
		((slfMeleeWeapon.cond_atr[0] == ATR_STRENGTH) && (hero.attribute[ATR_STRENGTH] < slfMeleeWeapon.cond_value[0]))
	|| ((slfMeleeWeapon.cond_atr[1] == ATR_STRENGTH) && (hero.attribute[ATR_STRENGTH] < slfMeleeWeapon.cond_value[1]))
	|| ((slfMeleeWeapon.cond_atr[2] == ATR_STRENGTH) && (hero.attribute[ATR_STRENGTH] < slfMeleeWeapon.cond_value[2]))
	/*или необходимое условие наличия ловкости для ношения оружия меньше реальной ловкости ГГ*/
	||
		((slfMeleeWeapon.cond_atr[0] == ATR_DEXTERITY) && (hero.attribute[ATR_DEXTERITY] < slfMeleeWeapon.cond_value[0]))
	|| ((slfMeleeWeapon.cond_atr[1] == ATR_DEXTERITY) && (hero.attribute[ATR_DEXTERITY] < slfMeleeWeapon.cond_value[1]))
	|| ((slfMeleeWeapon.cond_atr[2] == ATR_DEXTERITY) && (hero.attribute[ATR_DEXTERITY] < slfMeleeWeapon.cond_value[2]))
	)
	{
		/*Функция деэкипировки оружия ББ*/
		/*Пока временно:*/
		AI_RemoveWeapon(hero);
		//AI_UnEquipWeapons(hero);
		Npc_UnequipItemByFlag(hero,ITEM_KAT_NF);
	};
	if(
	/*Если необходимое условие наличия силы для ношения оружия меньше реальной силы ГГ*/
		((slfRangedWeapon.cond_atr[0] == ATR_STRENGTH) && (hero.attribute[ATR_STRENGTH] < slfRangedWeapon.cond_value[0]))
	|| ((slfRangedWeapon.cond_atr[1] == ATR_STRENGTH) && (hero.attribute[ATR_STRENGTH] < slfRangedWeapon.cond_value[1]))
	|| ((slfRangedWeapon.cond_atr[2] == ATR_STRENGTH) && (hero.attribute[ATR_STRENGTH] < slfRangedWeapon.cond_value[2]))
	/*или необходимое условие наличия ловкости для ношения оружия меньше реальной ловкости ГГ*/
	||
		((slfRangedWeapon.cond_atr[0] == ATR_DEXTERITY) && (hero.attribute[ATR_DEXTERITY] < slfRangedWeapon.cond_value[0]))
	|| ((slfRangedWeapon.cond_atr[1] == ATR_DEXTERITY) && (hero.attribute[ATR_DEXTERITY] < slfRangedWeapon.cond_value[1]))
	|| ((slfRangedWeapon.cond_atr[2] == ATR_DEXTERITY) && (hero.attribute[ATR_DEXTERITY] < slfRangedWeapon.cond_value[2]))
	)
	{
		/*Функция деэкипировки оружия ДБ*/
		/*Пока временно:*/
		AI_RemoveWeapon(hero);
		//AI_UnEquipWeapons(hero);
		Npc_UnequipItemByFlag(hero,ITEM_KAT_FF);
	};
	/*А пока временно AI_UnEquipWeapons(hero);*/	
};
/*----------------------------------------------------------------------*/
/*Redleha: функция сброса эффекта -> DS_TIME (глобальный триггер-скрипт)*/
/*----------------------------------------------------------------------*/
FUNC VOID B_DSG_TimePotions_Effect()
{
	var string concatText_zeigen; concatText_zeigen = "";
	if(DSG_abholen_atr_str > 0)
	{	
		zufall_str += 1;
		if(zufall_str >= DSG_abholen_Time_str)
		{
			concatText_zeigen = "";
			concatText_zeigen = ConcatStrings(PRINT_DSG_LearnSTR_Minus, IntToString(DSG_abholen_atr_str));
			PrintScreen(concatText_zeigen, -1, DSG_posY_StrUp, FONT_SCREEN, 3);
			hero.attribute[ATR_STRENGTH] -= DSG_abholen_atr_str;			
			DSG_abholen_atr_str = 0;
			DSG_abholen_Time_str = 0;
			DSG_GetAndUnEquipWeapons();
			zufall_str = 0;
		};
	};
	if(DSG_abholen_atr_dex > 0)
	{	
		zufall_dex += 1;
		if(zufall_dex >= DSG_abholen_Time_dex)
		{
			concatText_zeigen = "";
			concatText_zeigen = ConcatStrings(PRINT_DSG_LearnDEX_Minus, IntToString(DSG_abholen_atr_dex));
			PrintScreen	(concatText_zeigen, -1, DSG_posY_DexUp, FONT_SCREEN, 3);
			hero.attribute[ATR_DEXTERITY] -= DSG_abholen_atr_dex;			
			DSG_abholen_atr_dex = 0;
			DSG_abholen_Time_dex = 0;
			DSG_GetAndUnEquipWeapons();
			zufall_dex = 0;
		};
	};		
	if(DSG_abholen_atr_hp > 0)
	{
		zufall_hpmax += 1;
		if(zufall_hpmax >= DSG_abholen_Time_hpmax)
		{
			concatText_zeigen = "";
			hero.attribute[ATR_HITPOINTS_MAX] -= DSG_abholen_atr_hp;
			concatText_zeigen = ConcatStrings(PRINT_DSG_LearnHPMax_Minus, IntToString(DSG_abholen_atr_hp));
			PrintScreen	(concatText_zeigen, -1, DSG_posY_HpMaxUp, FONT_SCREEN, 3);
			if (hero.attribute [ATR_HITPOINTS] > (DSG_abholen_atr_hp +1))	{	hero.attribute[ATR_HITPOINTS] -= DSG_abholen_atr_hp;	}
			else																															{	hero.attribute[ATR_HITPOINTS] = 2;	};	
			DSG_abholen_atr_hp = 0;
			DSG_abholen_Time_hpmax = 0;
			zufall_hpmax = 0;
		};
	};
};

