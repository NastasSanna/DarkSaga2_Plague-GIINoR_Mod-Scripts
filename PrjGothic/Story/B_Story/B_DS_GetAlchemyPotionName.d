func string B_DS_GetAlchemyPotionName(var int potion)
{
	var string PotionName;
	if(potion == POTION_Health_01)
	{
		PotionName = TXT_DS_POTIONS_0;		//здесь 0 = POTION_Health_01 из Constants.d ; ниже всё по аналогии...
	}
	else if(potion == POTION_Health_02)
	{
		PotionName = TXT_DS_POTIONS_1;
	}
	else if(potion == POTION_Health_03 )
	{
		PotionName = TXT_DS_POTIONS_2;
	}
	else if(potion == POTION_Mana_01 )
	{
		PotionName = TXT_DS_POTIONS_3;
	}
	else if(potion == POTION_Mana_02 )
	{
		PotionName = TXT_DS_POTIONS_4;
	}
	else if(potion ==  POTION_Mana_03)
	{
		PotionName = TXT_DS_POTIONS_5;
	}
	else if(potion ==  POTION_Speed)
	{
		PotionName = TXT_DS_POTIONS_6;
	}
	else if(potion ==  POTION_Perm_STR)
	{
		PotionName = TXT_DS_POTIONS_7;
	}
	else if(potion ==  POTION_Perm_DEX)
	{
		PotionName = TXT_DS_POTIONS_8;
	}
	else if(potion ==  POTION_Perm_Mana)
	{
		PotionName = TXT_DS_POTIONS_9;
	}
	else if(potion ==  POTION_Perm_Health)
	{
		PotionName = TXT_DS_POTIONS_10;
	}
	else if(potion ==  POTION_MegaDrink)
	{
		PotionName = TXT_DS_POTIONS_11;
	}
	else if(potion == CHARGE_Innoseye )
	{
		PotionName = TXT_DS_POTIONS_12;
	}
	else if(potion == POTION_Mana_04 )
	{
		PotionName = TXT_DS_POTIONS_13;
	}
	else if(potion ==  POTION_Health_04)
	{
		PotionName = TXT_DS_POTIONS_14;
	}
	else if(potion ==  CHARGE_WISP)
	{
		PotionName = TXT_DS_POTIONS_15;
	};
	return PotionName;
};
