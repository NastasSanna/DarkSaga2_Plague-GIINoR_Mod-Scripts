
instance TRADER_Kula(TRADER_Proto); 

func void B_GivetTradeInv_DSG_Kula(var C_Npc slf)
{
	if (!Hlp_IsValidNpc(TRADER_Kula))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_Kula,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	B_TradeSwap(slf, TRADER_Kula);
	B_ClearJunkTradeInv(slf);

	/* Товары у него самые разнообразные, от мелких трофеев (крылья кровавых мух, клыки, когти) 
	до разных растений (есть даже пару ягод гоблина) и 
	откровенного хлама (кости, жир кротокрыса и и другой разнообразный мусор, практически не нужный).
	//*/
	//Мелкие трофеи
	CreateInvItems(slf,ItAt_Teeth,12);
	CreateInvItems(slf,ItAt_Claw,9);
	CreateInvItems(slf,ItAt_BugMandibles,3);
	CreateInvItems(slf,ItAt_Wing,5);
	CreateInvItems(slf,ItAt_GoblinBone,4);
	CreateInvItems(slf,ItAt_SkeletonBone,1);
	CreateInvItems(slf,ItAt_Meatbugflesh,21);
	//Шкуры
	CreateInvItems(slf,ItAt_WolfFur,2);
	CreateInvItems(slf,ItAt_SharkSkin,1);
	//Растения
	CreateInvItems(slf,ItPl_Blueplant,4);
	CreateInvItems(slf,ItPl_Dex_Herb_01,2);
	CreateInvItems(slf,ItPl_Forestberry,10);
	CreateInvItems(slf,ItPl_Mushroom_01,7);
	CreateInvItems(slf,ItPl_Speed_Herb_01,6);
	CreateInvItems(slf,ItPl_Mana_Herb_01,7);
	CreateInvItems(slf,ItPl_Mana_Herb_02,4);
	CreateInvItems(slf,ItPl_Health_Herb_01,9);
	CreateInvItems(slf,ItPl_Health_Herb_02,4);
	//Хлам
	CreateInvItems(slf,ItMi_MoleratLubric,2);
	CreateInvItems(slf,ItMi_DS_Opal,1);
	CreateInvItems(slf,ItMi_Addon_Shell_01,3);
	CreateInvItems(slf,ItMi_Addon_Shell_02,4);
	CreateInvItems(slf,ItMi_Coal,2);
	CreateInvItems(slf,ItMi_Skull,1);
}; 

func void B_GiveTradeInv_DSG_Kula_CreateItems(var int ItemInst, var int amount)
{
	if (!Hlp_IsValidNpc(TRADER_Kula))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_Kula,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	CreateInvItems(TRADER_Kula,ItemInst,amount);
};
