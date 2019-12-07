
instance ITAR_DS_PRISONER(C_Item)			//Одежда каторжника - полностью оформлены по тексту
{
	name = "Одежда каторжника";	visual = "ItAr_Prisoner.3ds";	visual_change = "ARMOR_DARKSAGA_PRISONER_01.ASC";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 15;	protection[PROT_BLUNT] = 15;	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = 50;	
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;	count[5] = value;
};
//**************************************************
//Доспехи наёмников орков
//**************************************************
instance ITAR_Armor_SldOrks_01(C_Item)	//Легкие доспехи наемника орков - полностью оформлены по тексту
{
	name = "Легкие доспехи наемника орков";	visual = "OrcMers_M_Armor_01.ASC";	visual_change = "OrcMers_M_Armor_01.ASC";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 30;	protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = 200;	
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;	count[5] = value;
};
instance ITAR_Armor_SldOrks_02(C_Item)	//Укрепленные доспехи наемника орков - полностью оформлены по тексту
{
	name = "Укрепленные доспехи наемника орков";	visual = "OrcMers_H_Armor_01.ASC";	visual_change = "OrcMers_H_Armor_01.ASC";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = 400;	
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;	count[5] = value;
};
instance ITAR_Armor_SldOrks_03(C_Item)	//Усиленные доспехи наемника орков - полностью оформлены по тексту
{
	name = "Усиленные доспехи наемника орков";	visual = "OrcMers_VH_Armor_01.ASC";	visual_change = "OrcMers_VH_Armor_01.ASC";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 65;	protection[PROT_BLUNT] = 65;	protection[PROT_POINT] = 65;
	protection[PROT_MAGIC] = 10;	protection[PROT_FIRE] = 10;	
	value = 500;	
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[5] = NAME_Value;	count[5] = value;
};
//-----------------КОНЕЦ ДОСПЕХОВ НАЕМНИКА ОРКОВ-----------------
//---------------
// Пиратские одежки от Рентгарса

const int VALUE_ITAR_PIR_LL_Addon = 500;
const int VALUE_ITAR_PIR_L_DS = 600;
const int VALUE_ITAR_PIR_M_DS = 1200;
const int VALUE_ITAR_PIR_H_Addon = 1500;

func void Equip_ITAR_PIR_DS()
{
	if(self.id == 0)
	{
		PIR_DS_Armor_Equipped = TRUE;
		if(PIR_DS_Belt_ALI_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_PIR_DS()
{
	if(self.id == 0)
	{
		PIR_DS_Armor_Equipped = FALSE;
		if(PIR_DS_Belt_ALI_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -BA_Bonus01);
		};
	};
};
instance ITAR_PIR_BABE4_DS(C_Item)		//Одежда пиратки - полностью оформлены по тексту
{
	name = "Одежда пиратки";	visual = "ITAR_PIR_L_Addon.3ds";	visual_change = "PIRAT_BABE_Armor_V1.ASC";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 55;	protection[PROT_BLUNT] = 55;	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_PIR_LL_Addon;
	on_equip = Equip_ITAR_PIR_DS;
	on_unequip = UnEquip_ITAR_PIR_DS;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;	count[5] = value;
};
instance ITAR_PIR_LL_DS(C_Item)		//Одежда пирата - полностью оформлены по тексту
{
	name = "Одежда пирата";	visual = "ITAR_PIR_L_Addon.3ds";	visual_change = "Armor_DS_Pir_LL.ASC";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 55;	protection[PROT_BLUNT] = 55;	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_PIR_LL_Addon;
	on_equip = Equip_ITAR_PIR_DS;
	on_unequip = UnEquip_ITAR_PIR_DS;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;	count[5] = value;
};
instance ITAR_PIR_L_DS(C_Item)		//Легкие доспехи пирата - полностью оформлены по тексту
{
	name = "Легкие доспехи пирата";	visual = "ITAR_PIR_L_Addon.3ds";	visual_change = "Armor_Pir_L_Addon.ASC";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 60;	protection[PROT_BLUNT] = 60;	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 10;	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_PIR_L_DS;	
	on_equip = Equip_ITAR_PIR_DS;
	on_unequip = UnEquip_ITAR_PIR_DS;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];
	text[5] = NAME_Value;	count[5] = value;
};
instance ITAR_PIR_M_DS(C_Item)		//Усиленные доспехи пирата - полностью оформлены по тексту
{
	name = "Усиленные доспехи пирата";	visual = "ItAr_PIR_M_ADDON.3ds";	visual_change = "Armor_PIR_M_ADDON.asc";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	value = VALUE_ITAR_PIR_M_DS;
	on_equip = Equip_ITAR_PIR_DS;
	on_unequip = UnEquip_ITAR_PIR_DS;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];	
	text[5] = NAME_Value;	count[5] = value;
};
instance ITAR_PIR_H_Addon(C_Item)
{
	name = "Одежда капитана";	visual = "ItAr_PIR_H_ADDON.3ds";	visual_change = "Armor_PIR_H_ADDON.asc";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 60;	protection[PROT_BLUNT] = 60;	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_PIR_H_Addon;	
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];	
	text[5] = NAME_Value;	count[5] = value;
};
instance ITAR_PIR_H_NOHEAD(C_Item)
{
	name = "Одежда капитана";	visual = "ItAr_PIR_H_ADDON.3ds";	visual_change = "Armor_PIR_H_NOHEAD.asc";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 60;	protection[PROT_BLUNT] = 60;	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_PIR_H_Addon;	
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];	
	text[5] = NAME_Value;	count[5] = value;
};
instance ITAR_PIR_H_Retex(C_Item)
{
	name = "Одежда капитана";	visual = "ItAr_PIR_H_ADDON.3ds";	visual_change = "ARMOR_PIR_H_RETEX.ASC";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 60;	protection[PROT_BLUNT] = 60;	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_PIR_H_Addon;	
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];	
	text[5] = NAME_Value;	count[5] = value;
};

//**-------------КОНЕЦ ПИРАТCКИХ ДОСПЕХОВ**--------------------
//---------
//******************доспехи от Тобиаса *************
func void Equip_AncientKnight()
{
	if(self.id == 0)
	{
		self.attribute[ATR_STRENGTH] += 5;
		self.attribute[ATR_DEXTERITY] += 5;
		PrintScreen("Вы чувствуете себя более",-1,15,FONT_Screen,2);
		PrintScreen("сильным и ловким",-1,18,FONT_Screen,2);
	};
};
func void UnEquip_AncientKnight()
{
	if(self.id == 0)
	{
		self.attribute[ATR_STRENGTH] -= 5;
		self.attribute[ATR_DEXTERITY] -= 5;
		PrintScreen("Сила надетых доспехов",-1,15,FONT_Screen,2);
		PrintScreen("покидает вас",-1,18,FONT_Screen,2);
	};
};
instance ITAR_AncientKnight_DS(C_Item)		//Доспехи Древнего рыцаря - полностью оформлены по тексту
{
	name = "Доспехи Древнего рыцаря";	visual = "ItAr_Raven_ADDON.3ds";	visual_change = "Fer_VH_Armor_01.ASC";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 10;	protection[PROT_MAGIC] = 10;
	on_equip = Equip_AncientKnight;
	on_unequip = UnEquip_AncientKnight;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 60;
	value = 1000;	
	text[0] = NAME_Prot_Edge;							count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;						count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];
	text[3] = NAME_DS_Bonus_StrAndDex;		count[3] = 5;
	text[4] = Name_Str_Needed;						count[4] = cond_value[1];
	text[5] = NAME_Value;									count[5] = value;
};
//--------------------Древняя мантия жрецов--------------------------------------
func void Equip_RobePriest()
{
	if(self.id == 0)
	{
		RegenMana_from_Armor = TRUE;
		c_time_RegenerateMana();
		Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",self,self,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession"); 
		PrintScreen("Магическая энергия исходит от этой мантии",-1,5,FONT_Screen,2);
	};
};
func void UnEquip_RobePriest()
{
	if(self.id == 0)
	{
		RegenMana_from_Armor = FALSE;
		c_time_RegenerateMana();
		Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",self,self,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession"); 
	};
}; 

instance ItAr_RobePriest_Var2(C_Item)	//НЕ используется (броня мага огня с текстурой Ксардаса)
{
	name = "Древняя мантия жрецов (вар.2)";
	visual = "ItAr_Xardas.3ds";
	visual_change = "ARMOR_DS_DARKMAG_03.ASC";
}; 
instance ItAr_RobePriest(C_Item)	//(броня мага огня с текстурой судьи)
{
	name = "Древняя мантия жрецов";	effect = "SPELLFX_ITEMGLIMMER";	visual = "ItAr_Governor.3ds";	visual_change = "ARMOR_DS_DARKMAG_PRIEST.ASC";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO | WEAR_EFFECT;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	protection[PROT_EDGE] = 40;	protection[PROT_BLUNT] = 40;	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;	protection[PROT_MAGIC] = 40;
	value = 2500;
	on_equip = Equip_RobePriest;
	on_unequip = UnEquip_RobePriest;	
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];
	text[3] = Name_Bonus_RegenMana;
	text[5] = NAME_Value;	count[5] = value;
}; 
///-------------------------------------------------------------------------
func void Equip_ArmorGuard()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_2H,10); 
		PrintScreen("Доспехи восстанавливают ваше здоровье",-1,5,FONT_Screen,2);
		RegenHP_from_Armor = TRUE;
		c_time_RegenerateHP();
	};
};
func void UnEquip_ArmorGuard()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-10); 
		RegenHP_from_Armor = FALSE;
		c_time_RegenerateHP();
	};
}; 
instance ItAr_ArmorGuard(C_Item)		//Древний доспех стражей - полностью оформлен по тексту
{
	name = "Древний доспех стражей";	visual = "Armor_DS_Fer_Warior_H_1.ASC";	visual_change = "Armor_DS_Fer_Warior_H_1.ASC";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 55;	protection[PROT_BLUNT] = 55;	protection[PROT_POINT] = 55;	
	protection[PROT_FIRE] = 55;	protection[PROT_MAGIC] = 55;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 25;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 25;
	on_equip = Equip_ArmorGuard;
	on_unequip = UnEquip_ArmorGuard;
	value = 2500;
	text[0] = NAME_DS_Prot_EdgeAndPoint;	count[0] = protection[PROT_EDGE];
	text[1] = NAME_DS_Prot_MagicAndFire;	count[1] = protection[PROT_FIRE];
	text[2] = NAME_DS_StrAndDex_needed;		count[2] = cond_value[1];
	text[3] = NAME_ADDON_BONUS_2H;				count[3] = 10;	
	text[4] = Name_Bonus_RegenHP;
	text[5] = NAME_Value;		count[5] = value;
};
//-------------------------------------------------------------------------------
func void Equip_RobeNecrom()
{
	if(self.id == 0)
	{
		Equip_Bonus_Mana(70);
		Equip_Bonus_HP(100);
	};
};
func void UnEquip_RobeNecrom()
{
	if(self.id == 0)
	{
		UnEquip_Bonus_HP(100);
		UnEquip_Bonus_Mana(70);
	};
}; 

instance ItAr_RobeNecrom(C_Item)	//Облачение некроманта (бр.Ксардаса с текс. бр. демен-ра) - полностью оформлен по тексту
{
	name = "Облачение некроманта";	effect = "SPELLFX_ITEMGLIMMER";	visual = "ItAr_Xardas.3ds";	visual_change = "ARMOR_DS_DARKMAG_02.asc";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO | WEAR_EFFECT;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 70;	protection[PROT_MAGIC] = 70;
	value = 3000;	
	on_equip = Equip_RobeNecrom;
	on_unequip = UnEquip_RobeNecrom;	
	text[0] = NAME_DS_Prot_EdgeAndPoint;	count[0] = protection[PROT_EDGE];
	text[1] = NAME_DS_Prot_MagicAndFire;	count[1] = protection[PROT_FIRE];
	text[3] = NAME_Bonus_HP;							count[3] = 100;
	text[4] = NAME_Bonus_Mana;						count[4] = 70;	
	text[5] = NAME_Value;									count[5] = value;
};
func void Equip_RobeOfDarkMage()
{
	if(self.id == 0)
	{
		Equip_Bonus_Mana(100);
		Equip_Bonus_HP(150);
	};
};
func void UnEquip_RobeOfDarkMage()
{
	if(self.id == 0)
	{
		UnEquip_Bonus_HP(150);
		UnEquip_Bonus_Mana(100);
	};
}; 

instance ItAr_RobeOfDarkMage_Var2(C_Item)	//Мантия Темного Мага (броня мага огня с текстурой брони дементора)
{
	name = "Мантия Темного Мага (вар.2)";	
};

instance ItAr_RobeOfDarkMage(C_Item)	//Мантия Темного Мага (броня Ксардаса)
{
	name = "Мантия Темного Мага";	effect = "SPELLFX_ITEMGLIMMER";	visual = "ItAr_Xardas.3ds";	visual_change = "Armor_Xardas.asc";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO | WEAR_EFFECT;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 60;	protection[PROT_BLUNT] = 60;	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 80;	protection[PROT_MAGIC] = 80;
	value = 3500;	
	cond_atr[1] = ATR_MANA_MAX;	cond_value[1] = 100;
	on_equip = Equip_RobeOfDarkMage;
	on_unequip = UnEquip_RobeOfDarkMage;	
	text[0] = NAME_DS_Prot_EdgeAndPoint;	count[0] = protection[PROT_EDGE];
	text[1] = NAME_DS_Prot_MagicAndFire;	count[1] = protection[PROT_FIRE];
	text[3] = NAME_Bonus_HP;				count[3] = 150;
	text[4] = NAME_Bonus_Mana;			count[4] = 100;	
	text[5] = NAME_Value;						count[5] = value;
};
func void Equip_RobeStudentOfPriest()
{
	if(self.id == 0)
	{
		Equip_Bonus_Mana(50);
		Equip_Bonus_HP(50);
	};
};
func void UnEquip_RobeStudentOfPriest()
{
	if(self.id == 0)
	{
		UnEquip_Bonus_HP(50);
		UnEquip_Bonus_Mana(50);
	};
}; 

instance ItAr_RobeStudentOfPriest(C_Item)	//Мантия ученика темного мага - полностью оформлен по тексту
{
	name = "Мантия ученика темного мага";	effect = "SPELLFX_ITEMGLIMMER";	visual = "ItAr_Xardas.3ds";	visual_change = "ARMOR_DS_DARKNOV_L02.asc";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO | WEAR_EFFECT;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 40;	protection[PROT_BLUNT] = 40;	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 45;	protection[PROT_MAGIC] = 45;
	value = 2500;
	on_equip = Equip_RobestudentofPriest;
	on_unequip = UnEquip_RobestudentofPriest;
	text[0] = NAME_DS_Prot_EdgeAndPoint;	count[0] = protection[PROT_EDGE];
	text[1] = NAME_DS_Prot_MagicAndFire;	count[1] = protection[PROT_FIRE];
	text[3] = NAME_Bonus_HP;				count[3] = 50;
	text[4] = NAME_Bonus_Mana;			count[4] = 50;	
	text[5] = NAME_Value;						count[5] = value;
};
// сломанные латы Френсиса
func void Equip_ArmorFRENSIS()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,10); 
		PrintScreen("Доспехи восстанавливают ваше здоровье",-1,5,FONT_Screen,2);
		RegenHP_from_Armor = TRUE;
		c_time_RegenerateHP();
	};
};
func void UnEquip_ArmorFRENSIS()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-10); 
		RegenHP_from_Armor = FALSE;
		c_time_RegenerateHP();
	};
}; 

instance ItAr_ArmorFRENSIS(C_Item)	//Священные латы паладина - полностью оформлен по тексту
{
	name = "Священные латы паладина";	visual = "ItAr_Raven_ADDON.3ds";	visual_change = "Armor_Pal_Skeleton.asc";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	material = MAT_METAL;	visual_skin = 0;
	description = name;
	protection[PROT_EDGE] = 80;	protection[PROT_BLUNT] = 80;	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 50;	protection[PROT_MAGIC] = 50;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 80;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 40;
	cond_atr[0] = ATR_MANA_MAX;		cond_value[0] = 999;
	on_equip = Equip_ArmorFRENSIS;
	on_unequip = UnEquip_ArmorFRENSIS;
	value = 3000;
	text[0] = NAME_DS_Prot_EdgeAndPoint;	count[0] = protection[PROT_EDGE];
	text[1] = NAME_DS_Prot_MagicAndFire;	count[1] = protection[PROT_FIRE];
	text[2] = NAME_Str_needed;			count[2] = cond_value[1];
	text[3] = NAME_ADDON_BONUS_1H;	count[3] = 10;
	text[4] = Name_Bonus_RegenHP;	
	text[5] = NAME_Value;						count[5] = value;
};
instance ItAr_ArmorFRENSIS1(C_Item)
{
	name = "Разбитые латы паладина";	visual = "ItAr_Raven_ADDON.3ds";	visual_change = "Armor_Pal_Skeleton.asc";
	description = name;
	mainflag = ITEM_KAT_NONE;		flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_METAL;
	protection[PROT_EDGE] = 90;	protection[PROT_BLUNT] = 90;	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 90;	protection[PROT_MAGIC] = 90;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 90;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 90;
	value = 0;
	text[0] = "После битвы с демоном эти латы";
	text[1] = "окончательно развалились.";
	text[3] = NAME_DS_Prot_EdgeAndPoint;	count[3] = protection[PROT_EDGE];
	text[4] = NAME_DS_Prot_MagicAndFire;	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Value;									count[5] = value;
};

// доспехи каракама

var int onceWearedMagicarmorbykarakam;

func void Equip_Magicarmorbykarakam()
{
	if(self.id == 0)
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		self.attribute[ATR_HITPOINTS] = 10;
		PrintScreen("Вы не можете надеть это",-1,5,FONT_Screen,2);
		AI_UnequipArmor(self); 
	};
};
func void UnEquip_Magicarmorbykarakam()
{
	if(self.id == 0)
	{
	};
}; 
instance ITAR_MagicArmorByKarakam_DS(C_Item)
{
	name = "Магические доспехи";	visual = "ItAr_Raven_ADDON.3ds";	visual_change = "Armor_MayaZombie_Addon.asc";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = ITEM_MISSION;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_METAL;
	protection[PROT_EDGE] 	= 0;	protection[PROT_BLUNT] 	= 0;	protection[PROT_POINT] 	= 0;
	protection[PROT_FIRE] 	= 0;	protection[PROT_MAGIC] 	= 0;
	on_equip = Equip_Magicarmorbykarakam;
	on_unequip = UnEquip_Magicarmorbykarakam;
	value = 0;
};
//**
func void Equip_MagicarmorbykarakamINNOS()
{
	if(self.id == 0)
	{
		Equip_Bonus_Mana(50);
		Equip_Bonus_HP(100);
		PrintScreen("Вы чувствуете, как жизненные",-1,15,FONT_Screen,2);
		PrintScreen("и магические силы наполняют вас",-1,18,FONT_Screen,2);
	};
};
func void UnEquip_MagicarmorbykarakamINNOS()
{
	if(self.id == 0)
	{
		UnEquip_Bonus_HP(100);
		UnEquip_Bonus_Mana(50);	
		PrintScreen("Сила надетых доспехов",-1,5,FONT_Screen,2);
		PrintScreen("покидает вас",-1,7,FONT_Screen,2);
	};
}; 

instance ITAR_KarAKam_INNOS_DS(C_Item)	//Доспехи Инноса - полностью оформлен по тексту
{
	name = "Доспехи Инноса";	visual = "ItAr_Raven_ADDON.3ds";	visual_change = "ARMOR_INNOS_ADDON.ASC";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 60;	protection[PROT_BLUNT] = 60;	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;	protection[PROT_MAGIC] = 50;
	on_equip = Equip_MagicarmorbykarakamINNOS;
	on_unequip = UnEquip_MagicarmorbykarakamINNOS;
	value = 4500;
	text[0] = NAME_Prot_Edge;		count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;	count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Bonus_HpMax;		count[3] = 100;
	text[4] = NAME_Bonus_ManaMax;	count[4] = 50;
	text[5] = NAME_Value;					count[5] = value;
};
//**
func void Equip_MagicarmorbykarakamBELIAR()
{
	if(self.id == 0)
	{
		hero.attribute[ATR_STRENGTH] += 10;
		hero.attribute[ATR_DEXTERITY] += 10;
		PrintScreen("Вы чувствуете, как ярость",-1,5,FONT_Screen,2);
		PrintScreen("Белиара овладевает вами",-1,7,FONT_Screen,2);
	};
};

func void UnEquip_MagicarmorbykarakamBELIAR()
{
	if(self.id == 0)
	{
		hero.attribute[ATR_STRENGTH] -= 10;
		hero.attribute[ATR_DEXTERITY] -= 10;
		PrintScreen("Ярость Белиара",-1,5,FONT_Screen,2);
		PrintScreen("покидает вас",-1,7,FONT_Screen,2);
	};
}; 

instance ITAR_KarAKam_BELIAR_DS(C_Item)
{
	name = "Доспехи Белиара";	visual = "ItAr_Raven_ADDON.3ds";	visual_change = "Armor_MayaZombie_Addon.asc";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_METAL;	
	description = name;
	protection[PROT_EDGE] = 40;	protection[PROT_BLUNT] = 40;	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;	protection[PROT_MAGIC] = 30;
	on_equip = Equip_MagicarmorbykarakamBELIAR;
	on_unequip = UnEquip_MagicarmorbykarakamBELIAR;
	value = 4500;	
	text[1] = NAME_Prot_Edge;							count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;						count[2] = protection[PROT_POINT];
	text[3] = NAME_DS_Prot_MagicAndFire;	count[3] = protection[PROT_FIRE];
	text[4] = NAME_DS_Bonus_StrAndDex;		count[4] = 10;
	text[5] = NAME_Value;									count[5] = value;
};
// ** ** ** ** **
INSTANCE ITAR_Ingmar_Helm_01(C_Item)
{
	name =	"Ингмар";	visual = "ARMOR_HELMFER.3ds";
	mainflag =	ITEM_KAT_ARMOR;	flags =	0;	wear =	WEAR_HEAD;	visual_skin = 0;	material = MAT_LEATHER;
	description	= name;
	protection[PROT_EDGE]	=	10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 30;
	value =	100;
	on_equip = Equip_ITAR_Ingmar_Helm_01;
	on_unequip = UnEquip_ITAR_Ingmar_Helm_01;
	TEXT[1]	= NAME_Prot_Edge;		COUNT[1] = protection	[PROT_EDGE];
	TEXT[2]	= NAME_Prot_Point;	COUNT[2] = protection	[PROT_POINT];
	TEXT[3] = NAME_Prot_Fire;		COUNT[3] = protection	[PROT_FIRE];
	TEXT[4]	= NAME_Prot_Magic;	COUNT[4] = protection	[PROT_MAGIC];
	TEXT[5]	= NAME_Value;				COUNT[5] = value;
};
func void Equip_ITAR_Ingmar_Helm_01()
{
	//Ingmar_Helm_IsEquiped_byHero = TRUE;
};
func void UnEquip_ITAR_Ingmar_Helm_01()
{
	//Ingmar_Helm_IsEquiped_byHero = FALSE;
	if(Npc_GetDistToWP(self,"DC_KOGON_STAY_01") < 600)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		AI_PlayAni(self,"T_DEADB");
	};
};

// -************ фальшивый шлем ********************** !!!!!!!!!!11
INSTANCE ITAR_Ingmar_Helm_0F(C_Item)
{
	name =	"Ингмар";	visual = "ARMOR_HELMFER.3ds";
	mainflag =	ITEM_KAT_NONE;	flags =	0;	wear =	WEAR_HEAD;	visual_skin = 0;	material = MAT_LEATHER;
	description	= name;
	protection [PROT_EDGE]	= 10;	protection [PROT_BLUNT] = 10;	protection [PROT_POINT] = 10;
	protection [PROT_FIRE] 	= 0;	protection [PROT_MAGIC] = 30;
	value =	100;
	TEXT[1]	= NAME_Prot_Edge;		COUNT[1] = protection	[PROT_EDGE];
	TEXT[2]	= NAME_Prot_Point;	COUNT[2] = protection	[PROT_POINT];
	TEXT[3] = NAME_Prot_Fire;		COUNT[3] = protection	[PROT_FIRE];
	TEXT[4]	= NAME_Prot_Magic;	COUNT[4] = protection	[PROT_MAGIC];
	TEXT[5]	= NAME_Value;				COUNT[5] = value;
};
INSTANCE ITAR_ds_Santa(C_Item)
{
	name =	"";
	mainflag =	ITEM_KAT_ARMOR;
	wear =	WEAR_HEAD;
	visual = "DS_NewYear_Hat.3ds";
	material = MAT_LEATHER;
	description	= name;
};

//-***************************************************************************
// Доспехи Охотников
INSTANCE ITAR_Hunter_Helm_01(C_Item)	//Не используется
{
	name =	"Шлем 1";	visual = "ARMOR_HELMFER.3ds";
	mainflag =	ITEM_KAT_ARMOR;	flags =	0;	wear =	WEAR_HEAD;	visual_skin = 0;	material = MAT_LEATHER;
	description	= name;
	protection [PROT_EDGE]	= 20;	protection [PROT_BLUNT] = 20;	protection [PROT_POINT] = 20;
	protection [PROT_FIRE] 	= 0;	protection [PROT_MAGIC] = 0;
	value =	100;
	TEXT[1]	= NAME_Prot_Edge;		COUNT[1] = protection	[PROT_EDGE];
	TEXT[2]	= NAME_Prot_Point;	COUNT[2] = protection	[PROT_POINT];
	TEXT[3] = NAME_Prot_Fire;		COUNT[3] = protection	[PROT_FIRE];
	TEXT[4]	= NAME_Prot_Magic;	COUNT[4] = protection	[PROT_MAGIC];
	TEXT[5]	= NAME_Value;				COUNT[5] = value;
};
INSTANCE ITAR_Hunter_Helm_02(C_Item)	//Не используется
{
	name =	"Шлем 2";	visual = "ARMOR_HELMFER_V2.3ds";
	mainflag =	ITEM_KAT_ARMOR;	flags =	0;	wear =	WEAR_HEAD;	visual_skin = 0;	material = MAT_LEATHER;
	description	= name;
	protection [PROT_EDGE]	= 20;	protection [PROT_BLUNT] = 20;	protection [PROT_POINT] = 20;	
	protection [PROT_FIRE] 	= 0;	protection [PROT_MAGIC] = 0;
	value =	100;
	TEXT[1]	= NAME_Prot_Edge;		COUNT[1] = protection	[PROT_EDGE];
	TEXT[2]	= NAME_Prot_Point;	COUNT[2] = protection	[PROT_POINT];
	TEXT[3] = NAME_Prot_Fire;		COUNT[3] = protection	[PROT_FIRE];
	TEXT[4]	= NAME_Prot_Magic;	COUNT[4] = protection	[PROT_MAGIC];
	TEXT[5]	= NAME_Value;				COUNT[5] = value;
};

//Новые доспехи Ферокийцев

instance ITAR_HUN_CLOTHES_01(C_Item)	//"Одежда охотника"
{
	name = "Одежда охотника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;	protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = 500;
	wear = WEAR_TORSO;
	visual = "FER_CLOTHES_A01.ASC";
	visual_change = "FER_CLOTHES_A01.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_DS_Prot_EdgeAndPoint;
	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;
	count[5] = value;
};
instance ITAR_HUN_CLOTHES_02(C_Item)	//"Одежда охотника"
{
	name = "Одежда охотника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;	protection[PROT_BLUNT] = 35;	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = 550;
	wear = WEAR_TORSO;
	visual = "FER_CLOTHES_A2.ASC";
	visual_change = "FER_CLOTHES_A2.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_DS_Prot_EdgeAndPoint;
	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITAR_HUN_L(C_Item)			//"Легкий доспех охотника" - полностью оформлен по тексту
{
	name = "Легкая броня охотника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;	protection[PROT_BLUNT] = 60;	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 10;	protection[PROT_MAGIC] = 10;
	value = 800;
	wear = WEAR_TORSO;
	visual = "FER_L_ARMOR_01.ASC";
	visual_change = "FER_L_ARMOR_01.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;							count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;						count[2] = protection[PROT_POINT];
	text[3] = NAME_DS_Prot_MagicAndFire;	count[3] = protection[PROT_MAGIC];
	text[5] = NAME_Value;									count[5] = value;
};
instance ITAR_HUN_L_FIX(C_Item)	//"Укрепл. Легкий доспех охотника" - полностью оформлен по тексту
{
	name = "Легкая броня охотника";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;	protection[PROT_BLUNT] = 65;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	value = 950;
	wear = WEAR_TORSO;
	visual = "FER_L_ARMOR_02.ASC";
	visual_change = "FER_L_ARMOR_02.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = ConcatStrings(name," (укреплена)");
	text[1] = NAME_Prot_Edge;							count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;						count[2] = protection[PROT_POINT];
	text[3] = NAME_DS_Prot_MagicAndFire;	count[3] = protection[PROT_MAGIC];
	text[5] = NAME_Value;									count[5] = value;
};
//--++++++++++++++----ИЗ ВОЛКА------------------------
//из волка, на голове - башка волчья						- ДЛЯ АТАКИ НА ОРКОВ
instance ITAR_HUN_M01(C_Item)		//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	visual = "FER_M_ARMOR_01.ASC";
	visual_change = "FER_M_ARMOR_01.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;						count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;					count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;					count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;					count[4] = cond_value[2];
	text[5] = NAME_Value;								count[5] = value;
};
//из волка, на левом плече - башка волчья
instance ITAR_HUN_M02(C_Item)		//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	visual = "FER_M_ARMOR_02.ASC";
	visual_change = "FER_M_ARMOR_02.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;				count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;			count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;			count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;			count[4] = cond_value[2];
	text[5] = NAME_Value;						count[5] = value;
};
//из волка, на голове и плечах - башка волчья		- ДЛЯ АТАКИ НА ОРКОВ
instance ITAR_HUN_M03(C_Item)		//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "FER_M_ARMOR_03.ASC";	visual_change = "FER_M_ARMOR_03.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;			count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;		count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;		count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;		count[4] = cond_value[2];
	text[5] = NAME_Value;					count[5] = value;
};
//из волка - чистый
instance ITAR_HUN_M04(C_Item)		//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_M_Armor_01_no_helm.ASC";	visual_change = "Fer_M_Armor_01_no_helm.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;			count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;		count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;		count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;		count[4] = cond_value[2];
	text[5] = NAME_Value;					count[5] = value;
};
//из волка - на плечах - бошки варгов
instance ITAR_HUN_M05(C_Item)		//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_M_Armor_03_no_helm.ASC";
	visual_change = "Fer_M_Armor_03_no_helm.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;					count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;				count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;				count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;				count[4] = cond_value[2];
	text[5] = NAME_Value;							count[5] = value;
};
//--++++++++++++++----ИЗ ВАРГА------------------------
//из варга, на голове - башка варга								- ДЛЯ АТАКИ НА ОРКОВ
instance ITAR_HUN_BLACK_M01(C_Item)						//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника"; visual = "Fer_M_Black_Armor_01.ASC";	visual_change = "Fer_M_Black_Armor_01.ASC";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;			count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;		count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;		count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;		count[4] = cond_value[2];
	text[5] = NAME_Value;					count[5] = value;
};
//из варга, на левом плече - башка варга
instance ITAR_HUN_BLACK_M02(C_Item)						//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_M_Black_Armor_02.ASC";
	visual_change = "Fer_M_Black_Armor_02.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;			count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;		count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;		count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;		count[4] = cond_value[2];
	text[5] = NAME_Value;					count[5] = value;
};
//из варга, на голове и плечах - башка варга			- ДЛЯ АТАКИ НА ОРКОВ
instance ITAR_HUN_BLACK_M03(C_Item)						//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	visual = "Fer_M_Black_Armor_03.ASC";
	visual_change = "Fer_M_Black_Armor_03.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;		count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;	count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;	count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;	count[4] = cond_value[2];
	text[5] = NAME_Value;				count[5] = value;
};
//из варга - чистый
instance ITAR_HUN_BLACK_M04(C_Item)						//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	visual = "Fer_M_Black_Armor_01_no_helm.ASC";
	visual_change = "Fer_M_Black_Armor_01_no_helm.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;			count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;		count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;		count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;		count[4] = cond_value[2];
	text[5] = NAME_Value;					count[5] = value;
};
//из варга, на плечах - бошки варгов
instance ITAR_HUN_BLACK_M04_FIX(C_Item)				//"Укрепл. Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	visual = "Fer_M_Black_Armor_03_no_helm.ASC";
	visual_change = "Fer_M_Black_Armor_03_no_helm.ASC";
	protection[PROT_EDGE] = 80;	protection[PROT_BLUNT] = 80;	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 20;	protection[PROT_MAGIC] = 20;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1350;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = ConcatStrings(name," (укреплена)");
	text[0] = NAME_Prot_Edge;				count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;			count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;			count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;			count[4] = cond_value[2];
	text[5] = NAME_Value;						count[5] = value;
};
//из варга, на плечах - бошки варгов
instance ITAR_HUN_BLACK_M05(C_Item)						//"Средний доспех охотника" - полностью оформлен по тексту
{
	name = "Средняя броня охотника";	
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_M_Black_Armor_03_no_helm.ASC";
	visual_change = "Fer_M_Black_Armor_03_no_helm.ASC";
	protection[PROT_EDGE] = 75;	protection[PROT_BLUNT] = 75;	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 15;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 50;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 15;
	value = 1200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;			count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;		count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;		count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;		count[4] = cond_value[2];
	text[5] = NAME_Value;					count[5] = value;
};
instance ITAR_HUN_H(C_Item) 			//"Усиленные доспехи охотника" - полностью оформлен по тексту
{
	name = "Усиленная броня охотника";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_H_Armor_01.ASC";
	visual_change = "Fer_H_Armor_01.ASC";
	protection[PROT_EDGE] = 90;	protection[PROT_BLUNT] = 90;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 20;	protection[PROT_MAGIC] = 20;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 55;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 20;
	value = 2000;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;				count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;			count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;			count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;			count[4] = cond_value[2];
	text[5] = NAME_Value;						count[5] = value;
};
instance ITAR_HUN_H_FIX(C_Item) 	//"Укрепл. Усиленные доспехи охотника" - полностью оформлен по тексту
{
	name = "Усиленная броня охотника";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_H_Armor_01.ASC";
	visual_change = "Fer_H_Armor_01.ASC";
	protection[PROT_EDGE] = 95;	protection[PROT_BLUNT] = 95;	protection[PROT_POINT] = 105;
	protection[PROT_FIRE] = 25;	protection[PROT_MAGIC] = 25;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 55;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 20;
	value = 2200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = ConcatStrings(name," (укреплена)");
	text[0] = NAME_Prot_Edge;				count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;			count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_MAGIC];
	text[3] = NAME_Str_Needed;			count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;			count[4] = cond_value[2];
	text[5] = NAME_Value;						count[5] = value;
};

instance ITAR_HUN_TROLL(C_Item)			//"Защита Тролля" - полностью оформлен по тексту
{
	name = "Защита Тролля";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_Troll_Armor_01.ASC";
	visual_change = "Fer_Troll_Armor_01.ASC";
	protection[PROT_EDGE] = 110;	protection[PROT_BLUNT] = 110;	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 30;	protection[PROT_MAGIC] = 30;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 95;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 30;
	value = 3000;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;				count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;			count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Str_Needed;			count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;			count[4] = cond_value[2];
	text[5] = NAME_Value;						count[5] = value;
};
instance ITAR_HUN_TROLL_H(C_Item)		//"Укрепленная Защита Тролля - полностью оформлен по тексту
{
	name = "Защита Тролля";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_Troll_Armor_H01.ASC";
	visual_change = "Fer_Troll_Armor_H01.ASC";
	protection[PROT_EDGE] = 115;	protection[PROT_BLUNT] = 115;	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 35;		protection[PROT_MAGIC] = 35;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 100;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 30;
	value = 3200;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = ConcatStrings(name," (укреплена)");
	text[0] = NAME_Prot_Edge;				count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;			count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Str_Needed;			count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;			count[4] = cond_value[2];
	text[5] = NAME_Value;						count[5] = value;
};
instance ITAR_HUN_BLACKTROLL(C_Item)	//"Защита Черного Тролля" - полностью оформлен по тексту
{
	name = "Защита Черного Тролля";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	visual = "Fer_BlackTroll_Armor_01.ASC";
	visual_change = "Fer_BlackTroll_Armor_01.ASC";
	protection[PROT_EDGE] = 125;	protection[PROT_BLUNT] = 125;	protection[PROT_POINT] = 135;
	protection[PROT_FIRE] = 45;		protection[PROT_MAGIC] = 45;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 110;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 40;
	value = 3600;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = name;
	text[0] = NAME_Prot_Edge;			count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;		count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Str_Needed;		count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;		count[4] = cond_value[2];
	text[5] = NAME_Value;					count[5] = value;
};
instance ITAR_HUN_BLACKTROLL_H(C_Item) //"Укрепленная Защита Черного Тролля" - полностью оформлен по тексту
{
	name = "Защита Черного Тролля";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	visual = "Fer_BlackTroll_Armor_H01.ASC";
	visual_change = "Fer_BlackTroll_Armor_H01.ASC";
	protection[PROT_EDGE] = 130;	protection[PROT_BLUNT] = 130;	protection[PROT_POINT] = 140;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 50;
	cond_atr[1] = ATR_STRENGTH;		cond_value[1] = 110;
	cond_atr[2] = ATR_DEXTERITY;	cond_value[2] = 40;
	value = 3800;
	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	description = ConcatStrings(name," (укреплена)");
	text[0] = NAME_Prot_Edge;				count[0] = protection[PROT_EDGE];
	text[1] = NAME_Prot_Point;			count[1] = protection[PROT_POINT];
	text[2] = NAME_DS_Prot_MagicAndFire;	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Str_Needed;			count[3] = cond_value[1];
	text[4] = NAME_Dex_Needed;			count[4] = cond_value[2];
	text[5] = NAME_Value;						count[5] = value;
};

//*************КОНЕЦ БРОНЕК ХАНТОВ*-------------------------------

//***********------------------------------------------------------------------
instance ITAR_HUN_MAGE(C_Item)	//"Доспехи для безголовых НПС"
{
	name = "Накидка";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	material = MAT_LEATHER;	visual_skin = 0;
	protection[PROT_EDGE] 	= 50;	protection[PROT_BLUNT] 	= 50;	protection[PROT_POINT] 	= 50;
	protection[PROT_FIRE] 	= 10;	protection[PROT_MAGIC] 	= 10;
	value 		= VALUE_ITAR_Governor;
	visual 		= "ARMOR_DS_FER_MAGE.ASC";
	visual_change = "ARMOR_DS_FER_MAGE.ASC";
	description = "Накидка слуги некроманта";
	text[2] 	= NAME_Prot_Edge;			count[2]	= protection[PROT_EDGE];
	text[3] 	= NAME_Prot_Point;		count[3] 	= protection[PROT_POINT];
	text[4] 	= NAME_DS_Prot_MagicAndFire;	count[4] 	= protection[PROT_FIRE];
	text[5] 	= NAME_Value;					count[5] 	= value;
};
instance ITAR_Pal_ObnoskiSH(C_Item)	//Поношенные доспехи паладина (по квесту с Шардом)-полностью оформлен по тексту
{
	name = "Поношенные доспехи паладина";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_METAL;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 30;	protection[PROT_MAGIC] = 30;
	value = 2000;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "Armor_Pal_M.asc";
	description = name;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[4] = NAME_DS_Prot_MagicAndFire;	count[4] 	= protection[PROT_FIRE];
	text[5] = NAME_Value;									count[5] = value;
};
instance ITAR_Armor_Skeleton_Sailor(C_Item)
{
	name = "Доспех мертвого пирата";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	visual_skin = 0;	material = MAT_LEATHER;	wear = WEAR_TORSO;
	protection[PROT_EDGE] = 80;	protection[PROT_BLUNT] = 80;	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_M;
	visual = "ITAR_PIR_L_DS.3ds";
	visual_change = "Ske_PirSail_Body.asc";
	description = name;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;		count[5] = value;
};
instance ITAR_Armor_Skeleton_Shard(C_Item)
{
	name = "Доспех Шарда";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;

	protection[PROT_EDGE] = 80;	protection[PROT_BLUNT] = 80;	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_M;
	visual = "ITAR_PIR_L_DS.3ds";
	visual_change = "Ske_PirCap_Body.asc";
	description = name;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;				count[5] = value;
};
//************Доспехи Женщин**********************

instance ITAR_Armor_Babe_Hun_01(C_Item)
{
	name = "Доспехи";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	visual_skin = 0;	material = MAT_LEATHER;	wear = WEAR_TORSO;
	protection[PROT_EDGE] = 30;	protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_L;
	visual = "FER_BABE_Armor_V1.ASC";
	visual_change = "FER_BABE_Armor_V1.ASC";	
	description = name;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;		count[5] = value;
};
instance ITAR_Armor_Babe_Hun_02(C_Item)
{
	name = "Доспехи";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 30;	protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_L;	
	visual = "FER_BABE_Armor_V2.ASC";
	visual_change = "FER_BABE_Armor_V2.ASC";
	description = name;
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;		count[5] = value;
};
instance ITAR_Armor_Babe_Hun_03(C_Item)
{
	name = "Доспехи";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	material = MAT_LEATHER;	visual_skin = 0;
	protection[PROT_EDGE] = 30;	protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_L;	
	visual = "FER_BABE_Armor_V3.ASC";
	visual_change = "FER_BABE_Armor_V3.ASC";
	text[1] = NAME_DS_Prot_EdgeAndPoint;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;			count[5] = value;
};
instance ITAR_BauBabe_Angry(C_Item)
{
	name = "Одеяние Девы Гнева";
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	visual_skin = 0;	material = MAT_LEATHER;	wear = WEAR_TORSO | WEAR_EFFECT;
	protection[PROT_EDGE] = 0;	protection[PROT_BLUNT] = 0;	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BauBabe_M;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_M.asc";
	effect = "SPELLFX_FIREARMOR";
	description = name;
	text[1] = NAME_Prot_Edge;	count[1] = protection[PROT_EDGE];
	text[5] = NAME_Value;			count[5] = value;
};
