
instance TRADER_Joseph(TRADER_Proto); 

var int Give_Joseph_Weapon;
var int Give_Joseph_Weapon_once;

func void B_GivetTradeInv_DSG_Joseph(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Joseph))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_Joseph,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	B_TradeSwap(slf, TRADER_Joseph);
	B_ClearJunkTradeInv(slf);
	
	// UNFINISHED
	// чертежи клинков, луков и арбалетов
	//CreateInvItems(slf,ItWr_DSG_Drawing_...,1);
	if((Give_Joseph_Weapon == TRUE) && (Give_Joseph_Weapon_once == FALSE))
	{
		//В продаже 4-5 клинков
		//CreateInvItems(slf,ItMw_...,1);
		Give_Joseph_Weapon_once = TRUE;
	};
};

func void B_GiveTradeInv_DSG_Joseph_CreateItems(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Joseph))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_Joseph,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	CreateInvItems(TRADER_Joseph,ItemInst,amount);
};
