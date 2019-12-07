
var int hartbonus[9];
var int hart_openbookpower;

func int C_DS_NpcHasBookForHart(var C_Npc her)
{
	if((Npc_HasItems(her,ITWR_1book) > 0) || (Npc_HasItems(her,ITWR_2book) > 0) 
	|| (Npc_HasItems(her,ITWR_3book) > 0) || (Npc_HasItems(her,ITWR_4book) > 0) 
	|| (Npc_HasItems(her,ITWR_5book) > 0) || (Npc_HasItems(her,ITWR_6book) > 0) 
	|| (Npc_HasItems(her,ITWR_7book) > 0) || (Npc_HasItems(her,ITWR_8book) > 0) 
	|| (Npc_HasItems(her,ITWR_9book) > 0) || (Npc_HasItems(her,ITWR_10book) > 0) 
	|| (Npc_HasItems(her,ITWR_11book) > 0)|| (Npc_HasItems(her,ITWR_12book) > 0) 
	|| (Npc_HasItems(her,ITWR_13book) > 0)|| (Npc_HasItems(her,ITWR_14book) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_DS_NpcHasBookForHart_Bonus(var C_Npc her)
{
	if((Npc_HasItems(her,ITWR_1book) > 0) 
	|| (Npc_HasItems(her,ITWR_3book) > 0) 
	|| (Npc_HasItems(her,ITWR_6book) > 0) 
	|| (Npc_HasItems(her,ITWR_8book) > 0) 
	|| (Npc_HasItems(her,ITWR_9book) > 0) 
	|| (Npc_HasItems(her,ITWR_10book) > 0) 
	|| (Npc_HasItems(her,ITWR_11book) > 0) 
	|| (Npc_HasItems(her,ITWR_12book) > 0) 
	|| (Npc_HasItems(her,ITWR_13book) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_DS_NpcHasBookForHart_NoBonus(var C_Npc her)
{
	if((Npc_HasItems(her,ITWR_2book) > 0) 
	|| (Npc_HasItems(her,ITWR_4book) > 0) 
	|| (Npc_HasItems(her,ITWR_5book) > 0) 
	|| (Npc_HasItems(her,ITWR_7book) > 0) 
	|| (Npc_HasItems(her,ITWR_14book) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_TransferToHartBook_Bonus(var C_Npc her,var C_Npc oth)
{
	var string concatText;
	var int transfer_bonus;
	var string itemname;
	if(Npc_HasItems(her,ITWR_1book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_1book);
		transfer_bonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 1,FONT_ScreenSmall,3);
		HARTBONUS[0] = TRUE;
	};
	if(Npc_HasItems(her,ITWR_3book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_3book);
		transfer_bonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 2,FONT_ScreenSmall,3);
		HARTBONUS[1] = TRUE;
	};
	if(Npc_HasItems(her,ITWR_6book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_6book);
		transfer_bonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 3,FONT_ScreenSmall,3);
		HARTBONUS[2] = TRUE;
	};
	if(Npc_HasItems(her,ITWR_8book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_8book);
		transfer_bonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 4,FONT_ScreenSmall,3);
		HARTBONUS[3] = TRUE;
	};
	if(Npc_HasItems(her,ITWR_9book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_9book);
		transfer_bonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 5,FONT_ScreenSmall,3);
		HARTBONUS[4] = TRUE;
	};
	if(Npc_HasItems(her,ITWR_10book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_10book);
		transfer_bonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 6,FONT_ScreenSmall,3);
		HARTBONUS[5] = TRUE;
	};
	if(Npc_HasItems(her,ITWR_11book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_11book);
		transfer_bonus = transfer_bonus + 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 7,FONT_ScreenSmall,3);
		HARTBONUS[6] = TRUE;
	};
	if(Npc_HasItems(her,ITWR_12book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_12book);
		transfer_bonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 8,FONT_ScreenSmall,3);
		HARTBONUS[7] = TRUE;
	};
	if(Npc_HasItems(her,ITWR_13book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_13book);
		transfer_bonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 9,FONT_ScreenSmall,3);
		HARTBONUS[8] = TRUE;
	};
	if(transfer_bonus == 1)
	{
		concatText = ConcatStrings(IntToString(transfer_bonus),PRINT_DS_BOOKGEGEBEN);
	}
	else if(transfer_bonus > 1)
	{
		concatText = ConcatStrings(IntToString(transfer_bonus),PRINT_DS_BOOKSGEGEBEN);
	};
	AI_PrintScreen(concatText,-1,YPOS_ItemGiven - 1,FONT_ScreenSmall,3);
};

func void B_TransferToHartBook_NoBonus(var C_Npc her,var C_Npc oth)
{
	var string concatText;
	var int transfer_nobonus;
	var string itemname;
	if(Npc_HasItems(her,ITWR_2book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_2book);
		transfer_nobonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 1,FONT_ScreenSmall,3);
	};
	if(Npc_HasItems(her,ITWR_4book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_4book);
		transfer_nobonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 2,FONT_ScreenSmall,3);
	};
	if(Npc_HasItems(her,ITWR_5book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_5book);
		transfer_nobonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 3,FONT_ScreenSmall,3);
	};
	if(Npc_HasItems(her,ITWR_7book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_7book);
		transfer_nobonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 4,FONT_ScreenSmall,3);
	};
	if(Npc_HasItems(her,ITWR_14book) > 0)
	{
		Npc_RemoveInvItem(her,ITWR_14book);
		transfer_nobonus += 1;
		itemname = item.name;
		AI_PrintScreen(itemname,-1,YPOS_ItemGiven + 5,FONT_ScreenSmall,3);
	};
	if(transfer_nobonus == 1)
	{
		concatText = ConcatStrings(IntToString(transfer_nobonus),PRINT_DS_BOOKGEGEBEN);
	}
	else if(transfer_nobonus > 1)
	{
		concatText = ConcatStrings(IntToString(transfer_nobonus),PRINT_DS_BOOKSGEGEBEN);
	};
	AI_PrintScreen(concatText,-1,YPOS_ItemGiven - 1,FONT_ScreenSmall,3);
};

func void B_GiveBonusFromBooks()
{
	if(HARTBONUS[0] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_STRENGTH,2);
		HARTBONUS[0] = FALSE;
	};
	if(HARTBONUS[1] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,20);
		HARTBONUS[1] = FALSE;
	};
	if(HARTBONUS[2] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,10);
		HARTBONUS[2] = FALSE;
	};
	if(HARTBONUS[3] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_MANA_MAX,5);
		HARTBONUS[3] = FALSE;
	};
	if(HARTBONUS[4] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_MANA_MAX,10);
		HARTBONUS[4] = FALSE;
	};
	if(HARTBONUS[5] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_MANA_MAX,15);
		HARTBONUS[5] = FALSE;
	};
	if(HARTBONUS[6] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_MANA_MAX,20);
		HARTBONUS[6] = FALSE;
	};
	if(HARTBONUS[7] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,20);
		HARTBONUS[7] = FALSE;
	};
	if(HARTBONUS[8] == TRUE)
	{
		B_RaiseAttribute(hero,ATR_DEXTERITY,2);
		HARTBONUS[8] = FALSE;
	};
};

