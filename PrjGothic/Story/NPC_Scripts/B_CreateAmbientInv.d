
func void B_CreateAmbientInv_BAU(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Blueplant,1);
		CreateInvItems(self,ItFo_Water,2);
		CreateInvItems(self,ItKE_lockpick,1);
		CreateInvItems(self,ItMi_Gold,3);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItPl_Mushroom_01,2);
		CreateInvItems(self,ItMi_Nugget,1);
		CreateInvItems(self,ItLsTorch,1);
		CreateInvItems(self,ItMi_Gold,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItMi_Nugget,1);
		CreateInvItems(self,ItLsTorch,1);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItMi_Gold,1);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItLsTorch,1);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItPl_Health_Herb_02,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItFo_Water,1);
		CreateInvItems(self,ItMi_Gold,2);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Water,2);
		CreateInvItems(self,ItFo_Bread,1);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItMi_Nugget,1);
		CreateInvItems(self,ItPl_Mushroom_01,2);
		CreateInvItems(self,ItPl_Blueplant,2);
		CreateInvItems(self,ItLsTorch,1);
	};
};

func void B_CreateAmbientInv_HUN(var int InventorySet)
{
	// TO DO UNFINISHED
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItFoMutton,1);
		CreateInvItems(self,ItPl_Mushroom_01,1);
		CreateInvItems(self,ItMi_Gold,17);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPl_Health_Herb_01,1);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItFo_Sausage,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItMi_Joint,2);
		CreateInvItems(self,ItMi_Gold,16);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Stew,1);
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItMi_Gold,15);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Sausage,1);
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMi_Gold,11);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItFo_FishSoup,1);
		CreateInvItems(self,ItMi_Gold,19);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItPl_Mushroom_02,3);
		CreateInvItems(self,ItFo_Booze,1);
		CreateInvItems(self,ItMi_Gold,10);
		CreateInvItems(self,ItFoMutton,2);
	};
};

func void B_CreateAmbientInv_DMT(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPo_Mana_01,1);
		CreateInvItems(self,ItMi_Pitch,1);
		CreateInvItems(self,ItMi_Gold,42);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItPo_Mana_02,1);
		CreateInvItems(self,ItMi_Gold,35);
		CreateInvItems(self,ItMi_Aquamarine,1);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItMi_Sulfur,1);
		CreateInvItems(self,ItMi_Gold,23);
		CreateInvItems(self,ItPo_Mana_01,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_Gold,46);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItMi_Quartz,1);
		CreateInvItems(self,ItMi_Gold,43);
		CreateInvItems(self,ItPo_Health_02,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItPo_Speed,1);
		CreateInvItems(self,ItMi_Coal,1);
		CreateInvItems(self,ItMi_Gold,37);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItMi_Rockcrystal,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_Gold,40);
	};
};

func void B_CreateAmbientInv_PIR(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItMw_1h_Vlk_Sword,1);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Addon_Grog,2);
		CreateInvItems(self,ItMi_Gold,12);
		CreateInvItems(self,ItMi_Joint,3);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_GoldRing,1);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItFo_Addon_Grog,2);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Joint,1);
		CreateInvItems(self,ItMi_Gold,9);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		CreateInvItems(self,ItFo_Addon_Pfeffer_01,1);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItMi_Gold,23);
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItMw_1h_Vlk_Sword,1);
	}
	else if(InventorySet == 0)
	{
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItFo_Bread,1);
	};
};

func void B_CreateAmbientInv_BDT(var int InventorySet)
{
	if(InventorySet == 1)
	{
		CreateInvItems(self,ItPl_Planeberry,1);
		CreateInvItems(self,ItMw_1h_Vlk_Sword,1);
		CreateInvItems(self,ItKE_lockpick,2);
		CreateInvItems(self,ItPl_Health_Herb_02,1);
	}
	else if(InventorySet == 2)
	{
		CreateInvItems(self,ItFo_Apple,1);
		CreateInvItems(self,ItFo_Booze,2);
		CreateInvItems(self,ItMi_GoldNugget_Addon,1);
		CreateInvItems(self,ItMi_Joint,3);
	}
	else if(InventorySet == 3)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItPo_Health_01,1);
		CreateInvItems(self,ItMi_SilverRing,1);
		CreateInvItems(self,ItFo_Beer,2);
	}
	else if(InventorySet == 4)
	{
		CreateInvItems(self,ItKE_lockpick,1);
		CreateInvItems(self,ItFo_Cheese,1);
		CreateInvItems(self,ItMi_Joint,1);
		CreateInvItems(self,ItMi_GoldNugget_Addon,1);
	}
	else if(InventorySet == 5)
	{
		CreateInvItems(self,ItFo_Beer,1);
		CreateInvItems(self,ItFo_Addon_Rum,1);
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItMi_GoldNugget_Addon,2);
	}
	else if(InventorySet == 6)
	{
		CreateInvItems(self,ItMi_Gold,23);
		CreateInvItems(self,ItPl_Forestberry,1);
		CreateInvItems(self,ItMw_1h_Vlk_Sword,1);
	}
	else
	{
		CreateInvItems(self,ItFo_Fish,1);
		CreateInvItems(self,ItFo_Addon_Grog,1);
		CreateInvItems(self,ItFo_Bread,1);
		CreateInvItems(self,ItKE_lockpick,3);
	};
};

func void B_CreateAmbientInv(var C_Npc slf)
{
	var int zufall;
	zufall = Hlp_Random(7);
	if(slf.guild == GIL_BAU)
	{
		B_CreateAmbientInv_BAU(zufall);
	}
	else if(slf.guild == GIL_HUN)
	{
		B_CreateAmbientInv_HUN(zufall);
	}
	else if(slf.guild == GIL_PIR || slf.guild == GIL_PIR2)
	{
		B_CreateAmbientInv_PIR(zufall);
	}
	else if(slf.guild == GIL_BDT)
	{
		B_CreateAmbientInv_BDT(zufall);
	}
	else if(slf.guild == GIL_DMT)
	{
		B_CreateAmbientInv_DMT(zufall);
	}
	else
	{
		B_CreateAmbientInv_BAU(zufall);
	};
};

