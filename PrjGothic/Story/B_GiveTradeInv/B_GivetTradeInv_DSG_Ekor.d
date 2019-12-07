
instance TRADER_Ekor(TRADER_Proto); 

func void B_GivetTradeInv_DSG_Ekor(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Ekor))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_Ekor,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	B_TradeSwap(slf, TRADER_Ekor);
	B_ClearJunkTradeInv(slf);

	CreateInvItems(slf,ItMi_Gold,800);
	//Напитки
		CreateInvItems(slf,ItPo_Mana_01,9);
		CreateInvItems(slf,ItPo_Health_01,5);
		CreateInvItems(slf,ItPo_Health_02,6);
		CreateInvItems(slf,ItPo_Health_03,2);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		CreateInvItems(slf,ItPo_Perm_Health,2);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItPo_Speed,3);
		CreateInvItems(slf,ItPo_Mana_02,12);
		CreateInvItems(slf,ItPo_Mana_03,10);
	//Растения
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItPl_Speed_Herb_01,1);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
		CreateInvItems(slf,ItPl_Mana_Herb_03,34);
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItPl_Speed_Herb_01,5);
		CreateInvItems(slf,ItPl_Perm_Herb,2);
	//Остальное
	CreateInvItems(slf,ItMi_Flask,72);
	CreateInvItems(slf,ItMi_RuneBlank,33);
	CreateInvItems(slf,ItMi_Pliers,3);
	CreateInvItems(slf,ItMi_Joint,9);
	CreateInvItems(slf,ItMi_Sulfur,23);
	CreateInvItems(slf,ItMi_Quartz,17);
	CreateInvItems(slf,ItMi_Pitch,18);
	CreateInvItems(slf,ItMi_Rockcrystal,14);
	CreateInvItems(slf,ItMi_Aquamarine,9);
	CreateInvItems(slf,ItMi_HolyWater,3);
	CreateInvItems(slf,ItMi_Coal,29);	
	CreateInvItems(slf,ItAt_GoblinBone,1);
}; 

func void B_GiveTradeInv_DSG_Ekor_CreateItems(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Ekor))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_Ekor,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	CreateInvItems(TRADER_Ekor,ItemInst,amount);
};
