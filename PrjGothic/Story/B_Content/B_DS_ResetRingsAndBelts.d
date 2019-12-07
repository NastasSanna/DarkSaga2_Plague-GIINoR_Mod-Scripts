
func void B_ds_ResetBelts(var C_NPC her)
{
	var int x;
	x = 0;
	if(Npc_HasItems(her,ItBe_DS_TotalProt))
	{
		x = Npc_HasItems(her,ItBe_DS_TotalProt);
		Npc_RemoveAndCreateInvItems(her,ItBe_DS_TotalProt,x);
	};
	if(Npc_HasItems(her,ItBe_DS_AncientGuard))
	{
		x = Npc_HasItems(her,ItBe_DS_AncientGuard);
		Npc_RemoveAndCreateInvItems(her,ItBe_DS_AncientGuard,x);
	};
	if(Npc_HasItems(her,ItBe_DS_AncientMight))
	{
		x = Npc_HasItems(her,ItBe_DS_AncientMight);
		Npc_RemoveAndCreateInvItems(her,ItBe_DS_AncientMight,x);		
	};
	if(Npc_HasItems(her,ItBe_DS_BeltDarkMage))
	{
		x = Npc_HasItems(her,ItBe_DS_BeltDarkMage);
		Npc_RemoveAndCreateInvItems(her,ItBe_DS_BeltDarkMage,x);
	};
	if(Npc_HasItems(her,ItBe_DS_Artefact_DarkWarrior_03))
	{
		x = Npc_HasItems(her,ItBe_DS_Artefact_DarkWarrior_03);
		Npc_RemoveAndCreateInvItems(her,ItBe_DS_Artefact_DarkWarrior_03,x);
	};	
	if(Npc_HasItems(her,ItBE_Addon_Leather_01))
	{
		x = Npc_HasItems(her,ItBE_Addon_Leather_01);
		Npc_RemoveAndCreateInvItems(her,ItBE_Addon_Leather_01,x);
	};
	if(Npc_HasItems(her,ItBE_Addon_SLD_01))
	{
		x = Npc_HasItems(her,ItBE_Addon_SLD_01);
		Npc_RemoveAndCreateInvItems(her,ItBE_Addon_SLD_01,x);
	};
	if(Npc_HasItems(her,ItBE_Addon_NOV_01))
	{
		x = Npc_HasItems(her,ItBE_Addon_NOV_01);
		Npc_RemoveAndCreateInvItems(her,ItBE_Addon_NOV_01,x);
	};
	if(Npc_HasItems(her,ItBE_Addon_MIL_01))
	{
		x = Npc_HasItems(her,ItBE_Addon_MIL_01);
		Npc_RemoveAndCreateInvItems(her,ItBE_Addon_MIL_01,x);
	};	
	if(Npc_HasItems(her,ItBE_Addon_KDF_01))
	{
		x = Npc_HasItems(her,ItBE_Addon_KDF_01);
		Npc_RemoveAndCreateInvItems(her,ItBE_Addon_KDF_01,x);
	};
	if(Npc_HasItems(her,ItBE_Addon_MC))
	{
		x = Npc_HasItems(her,ItBE_Addon_MC);
		Npc_RemoveAndCreateInvItems(her,ItBE_Addon_MC,x);
	};
	if(Npc_HasItems(her,ItBe_Addon_STR_5))
	{
		x = Npc_HasItems(her,ItBe_Addon_STR_5);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_STR_5,x);
	};
	if(Npc_HasItems(her,ItBe_Addon_STR_10))
	{
		x = Npc_HasItems(her,ItBe_Addon_STR_10);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_STR_10,x);
	};	
	if(Npc_HasItems(her,ItBe_Addon_DEX_5))
	{
		x = Npc_HasItems(her,ItBe_Addon_DEX_5);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_DEX_5,x);
	};
	if(Npc_HasItems(her,ItBe_Addon_DEX_10))
	{
		x = Npc_HasItems(her,ItBe_Addon_DEX_10);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_DEX_10,x);
	};
	if(Npc_HasItems(her,ItBe_Addon_Prot_EDGE))
	{
		x = Npc_HasItems(her,ItBe_Addon_Prot_EDGE);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_Prot_EDGE,x);
	};	
	if(Npc_HasItems(her,ItBe_Addon_Prot_Point))
	{
		x = Npc_HasItems(her,ItBe_Addon_Prot_Point);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_Prot_Point,x);
	};
	if(Npc_HasItems(her,ItBe_Addon_Prot_MAGIC))
	{
		x = Npc_HasItems(her,ItBe_Addon_Prot_MAGIC);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_Prot_MAGIC,x);
	};	
	if(Npc_HasItems(her,ItBe_Addon_Prot_FIRE))
	{
		x = Npc_HasItems(her,ItBe_Addon_Prot_FIRE);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_Prot_FIRE,x);
	};
	if(Npc_HasItems(her,ItBe_Addon_Prot_EdgPoi))
	{
		x = Npc_HasItems(her,ItBe_Addon_Prot_EdgPoi);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_Prot_EdgPoi,x);
	};
	if(Npc_HasItems(her,ItBe_Addon_Prot_TOTAL))
	{
		x = Npc_HasItems(her,ItBe_Addon_Prot_TOTAL);
		Npc_RemoveAndCreateInvItems(her,ItBe_Addon_Prot_TOTAL,x);
	};
	if(Npc_HasItems(her,ItBe_DS2P_PIR))
	{
		x = Npc_HasItems(her,ItBe_DS2P_PIR);
		Npc_RemoveAndCreateInvItems(her,ItBe_DS2P_PIR,x);
	};	
};
func void B_ds_ResetRings(var C_NPC her)
{
	var int x;	x = 0;
	if(Npc_HasItems(her,ItRi_EternalMana))
	{
		x = Npc_HasItems(her,ItRi_EternalMana);
		Npc_RemoveAndCreateInvItems(her,ItRi_EternalMana,x);
	};
	if(Npc_HasItems(her,ItRi_EternalLife))
	{
		x = Npc_HasItems(her,ItRi_EternalLife);
		Npc_RemoveAndCreateInvItems(her,ItRi_EternalLife,x);
	};
	if(Npc_HasItems(her,ItRi_DS_Artefact_Necroman_01))
	{
		x = Npc_HasItems(her,ItRi_DS_Artefact_Necroman_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_DS_Artefact_Necroman_01,x);
	};
	if(Npc_HasItems(her,ItRi_DS_Artefact_Necroman_02))
	{
		x = Npc_HasItems(her,ItRi_DS_Artefact_Necroman_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_DS_Artefact_Necroman_02,x);
	};
	if(Npc_HasItems(her,ItRi_DS_Artefact_DarkWarrior_01))
	{
		x = Npc_HasItems(her,ItRi_DS_Artefact_DarkWarrior_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_DS_Artefact_DarkWarrior_01,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Fire_01))
	{
		x = Npc_HasItems(her,ItRi_Prot_Fire_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Fire_01,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Fire_02))
	{
		x = Npc_HasItems(her,ItRi_Prot_Fire_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Fire_02,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Point_01))
	{
		x = Npc_HasItems(her,ItRi_Prot_Point_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Point_01,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Point_02))
	{
		x = Npc_HasItems(her,ItRi_Prot_Point_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Point_02,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Edge_01))
	{
		x = Npc_HasItems(her,ItRi_Prot_Edge_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Edge_01,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Edge_02))
	{
		x = Npc_HasItems(her,ItRi_Prot_Edge_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Edge_02,x);
	};	
	if(Npc_HasItems(her,ItRi_Prot_Mage_01))
	{
		x = Npc_HasItems(her,ItRi_Prot_Mage_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Mage_01,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Mage_02))
	{
		x = Npc_HasItems(her,ItRi_Prot_Mage_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Mage_02,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Total_01))
	{
		x = Npc_HasItems(her,ItRi_Prot_Total_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Total_01,x);
	};
	if(Npc_HasItems(her,ItRi_Prot_Total_02))
	{
		x = Npc_HasItems(her,ItRi_Prot_Total_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Prot_Total_02,x);
	};
	if(Npc_HasItems(her,ItRi_Dex_01))
	{
		x = Npc_HasItems(her,ItRi_Dex_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Dex_01,x);
	};
	if(Npc_HasItems(her,ItRi_Dex_02))
	{
		x = Npc_HasItems(her,ItRi_Dex_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Dex_02,x);
	};
	if(Npc_HasItems(her,ItRi_HP_01))
	{
		x = Npc_HasItems(her,ItRi_HP_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_HP_01,x);
	};
	if(Npc_HasItems(her,ItRi_Hp_02))
	{
		x = Npc_HasItems(her,ItRi_Hp_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Hp_02,x);
	};
	if(Npc_HasItems(her,ItRi_Str_01))
	{
		x = Npc_HasItems(her,ItRi_Str_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Str_01,x);
	};
	if(Npc_HasItems(her,ItRi_Str_02))
	{
		x = Npc_HasItems(her,ItRi_Str_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Str_02,x);
	};
	if(Npc_HasItems(her,ItRi_Mana_01))
	{
		x = Npc_HasItems(her,ItRi_Mana_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Mana_01,x);
	};
	if(Npc_HasItems(her,ItRi_Mana_02))
	{
		x = Npc_HasItems(her,ItRi_Mana_02);
		Npc_RemoveAndCreateInvItems(her,ItRi_Mana_02,x);
	};
	if(Npc_HasItems(her,ItRi_Hp_Mana_01))
	{
		x = Npc_HasItems(her,ItRi_Hp_Mana_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Hp_Mana_01,x);
	};
	if(Npc_HasItems(her,ItRi_Dex_Strg_01))
	{
		x = Npc_HasItems(her,ItRi_Dex_Strg_01);
		Npc_RemoveAndCreateInvItems(her,ItRi_Dex_Strg_01,x);
	};
	if(Npc_HasItems(her,ITRI_TROLLSTR))
	{
		x = Npc_HasItems(her,ITRI_TROLLSTR);
		Npc_RemoveAndCreateInvItems(her,ITRI_TROLLSTR,x);
	};
	if(Npc_HasItems(her,ITRI_IMMORTAL_01))
	{
		x = Npc_HasItems(her,ITRI_IMMORTAL_01);
		Npc_RemoveAndCreateInvItems(her,ITRI_IMMORTAL_01,x);
	};
};
func void B_ds_ResetRingsAndBelts(var C_NPC her)
{
	B_ds_ResetRings(her);
	B_ds_ResetBelts(her);
};
