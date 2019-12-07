
// ”ƒ¿À»“‹ !!!

func void b_givetradeinv_ds_gerard(var C_Npc slf)
{
	CreateInvItems(slf,ItMi_Gold,800);
	CreateInvItems(slf,ItPo_Mana_01,9);
	CreateInvItems(slf,ItPo_Health_01,5);
	CreateInvItems(slf,ItPo_Health_02,6);
	CreateInvItems(slf,ItPo_Health_03,2);
	CreateInvItems(slf,ItPo_Perm_Mana,1);
	CreateInvItems(slf,ItPo_Perm_Health,2);
	CreateInvItems(slf,ItPl_Temp_Herb,10);
	if(kapitel == 3)
	{
		CreateInvItems(slf,ItPo_Perm_Health,1);
		CreateInvItems(slf,ItPo_Perm_Mana,1);
		CreateInvItems(slf,ItPo_Speed,3);
		CreateInvItems(slf,ItPo_Mana_02,12);
		CreateInvItems(slf,ItPo_Mana_03,10);
		CreateInvItems(slf,ItPo_Health_01,12);
		CreateInvItems(slf,ItPo_Health_02,15);
		CreateInvItems(slf,ItPo_Health_03,10);
		CreateInvItems(slf,ItMi_Flask,25);
		CreateInvItems(slf,ItPl_Strength_Herb_01,1);
		CreateInvItems(slf,ItPl_Speed_Herb_01,1);
		CreateInvItems(slf,ItPl_Perm_Herb,1);
		CreateInvItems(slf,ItPl_Temp_Herb,10);
	};
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
	CreateInvItems(slf,ItMi_DarkPearl,6);
	CreateInvItems(slf,ItRu_Light,1);
	CreateInvItems(slf,ItRi_Prot_Fire_02,1);
	CreateInvItems(slf,ItRi_Mana_02,1);
	CreateInvItems(slf,ItBe_Addon_Prot_FIRE,1);
	CreateInvItems(slf,ItPl_Mana_Herb_03,34);
	CreateInvItems(slf,ItAt_GoblinBone,1);
	CreateInvItems(slf,ItPl_Strength_Herb_01,1);
	CreateInvItems(slf,ItPl_Speed_Herb_01,5);
	CreateInvItems(slf,ItPl_Perm_Herb,2);
	
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC1,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC2,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC3,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC4,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC5,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDF_CIRC6,1);
	
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDW_CIRC1,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDW_CIRC2,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDW_CIRC3,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDW_CIRC4,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDW_CIRC5,1);
	CreateInvItems(slf,ITWR_Addon_Runemaking_KDW_CIRC6,1);
	if(Read_StormPosohONCE == true)
	{
		CreateInvItems(slf,ItAt_Wing,10);
	};
};

