
instance TRADER_Zedd(TRADER_Proto); 

func void B_GivetTradeInv_DSG_Zedd(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Zedd))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_Zedd,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	B_TradeSwap(slf, TRADER_Zedd);
	B_ClearJunkTradeInv(slf);

	// UNFINISHED
	// ѕродает все типы алкогол€
	/* NS - ƒумаю, сделать обновл€емым, со случайным кол-вом выпивки
	//*/
	CreateInvItems(slf,ItFo_Beer,1);
	CreateInvItems(slf,ItFo_Booze,1);
	CreateInvItems(slf,ItFo_Wine,1);
	CreateInvItems(slf,ItFo_Addon_Rum,1);
	CreateInvItems(slf,ItFo_Addon_Grog,1);
	CreateInvItems(slf,ITFO_SAMOGON,1);
};

func void B_GiveTradeInv_DSG_Zedd_CreateItems(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Zedd))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_Zedd,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	CreateInvItems(TRADER_Zedd,ItemInst,amount);
};
