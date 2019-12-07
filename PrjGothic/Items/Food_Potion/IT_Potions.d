
const int Value_HpEssenz = 60;
const int HP_Essenz = 25;
const int Value_HpExtrakt = 120;
const int HP_Extrakt = 50;
const int Value_HpElixier = 240;
const int HP_Elixier = 100;
const int Value_ManaEssenz = 70;
const int Mana_Essenz = 25;
const int Value_ManaExtrakt = 140;
const int Mana_Extrakt = 50;
const int Value_ManaElixier = 280;
const int Mana_Elixier = 100;
const int Value_StrElixier = 1500;
const int STR_Elixier = 3;
const int Value_DexElixier = 1500;
const int DEX_Elixier = 3;
const int Value_HpMaxElixier = 1200;
const int HPMax_Elixier = 20;
const int Value_ManaMaxElixier = 1200;
const int ManaMax_Elixier = 5;
const int Value_Speed = 200;
const int Time_Speed = 300000;
const int Value_ManaTrunk = 200;
const int Value_HpTrunk = 150;

//Эссенция маны
prototype ItPo_Mana_Proto(C_Item)
{
	name 			= NAME_Trank;
	mainflag 	= ITEM_KAT_POTIONS;
	flags 		= ITEM_MULTI;
	material 	= MAT_GLAS;
	wear 			= WEAR_EFFECT;
	effect 		= "SPELLFX_MANAPOTION";
	text[1] 	= NAME_Bonus_Mana_DS;
	text[5] 	= NAME_Value;
};
instance ItPo_Mana_01(ItPo_Mana_Proto)
{
	visual 		= "ItPo_Mana_01.3ds";
	scemeName = "POTIONMANA1";
	description = "Эссенция маны";
	value 		= Value_ManaEssenz;
	on_state[0] = UseItPo_Mana_01;	
	count[1] 	= Mana_Essenz;
	count[5] 	= value;
};
func void UseItPo_Mana_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX] / 4);
	Npc_RemoveinvItem(self,ItPo_Mana_01);
};
instance ItPo_Mana_02(ItPo_Mana_Proto)
{
	visual 		= "ItPo_Mana_02.3ds";
	scemeName = "POTIONMANA2";
	description = "Экстракт маны";
	value 		= Value_ManaExtrakt;
	on_state[0] = UseItPo_Mana_02;	
	count[1] 	= Mana_Extrakt;
	count[5] 	= value;
};
func void UseItPo_Mana_02()
{
	Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX] / 2);
	Npc_RemoveinvItem(self,ItPo_Mana_02);
};
instance ItPo_Mana_03(ItPo_Mana_Proto)
{
	visual 		= "ItPo_Mana_03.3ds";
	scemeName = "POTIONMANA3";
	description = "Эликсир маны";
	value 		= Value_ManaElixier;
	on_state[0] = UseItPo_Mana_03;	
	count[1] 	= Mana_Elixier;
	count[5] 	= value;
};
func void UseItPo_Mana_03()
{
	Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX]);
	Npc_RemoveinvItem(self,ItPo_Mana_03);
};

prototype ItPo_Potion_Empty(C_Item)
{
	name 			= "Бутылка из-под зелья";
	mainflag 	= ITEM_KAT_POTIONS;
	flags 		= ITEM_MULTI;
	material 	= MAT_GLAS;
	description = name;
	scemeName = "ROMSEALED";
	value 		= 0;
	text[5] 	= NAME_Value;
	count[5] 	= value;
	on_state[0] = UseItPo_Empty;
};
instance ItPo_Mana_01_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Mana_01.3ds";
	text[4] 	= "В ней была эссенция маны.";
};
instance ItPo_Mana_02_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Mana_02.3ds";
	text[4] 	= "В ней был экстракт маны.";
};
instance ItPo_Mana_03_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Mana_03.3ds";
	text[4] 	= "В ней был эликсир маны.";
};
instance ItPo_Health_01_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Health_01.3ds";
	text[4] 	= "В ней была лечебная эссенция.";
};
instance ItPo_Health_02_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Health_02.3ds";
	text[4] 	= "В ней был лечебный экстракт.";
};
instance ItPo_Health_03_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Health_03.3ds";
	text[4] 	= "В ней был лечебный эликсир.";
};
instance ItPo_Perm_Str_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Perm_STR.3ds";
	text[4] 	= "В ней была лечебная эссенция.";
};
instance ItPo_Perm_Dex_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Perm_DEX.3ds";
	text[4] 	= "В ней был лечебный экстракт.";
};
instance ItPo_Perm_Mana_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Perm_Health.3ds";
	text[4] 	= "В ней был лечебный эликсир.";
};
instance ItPo_Perm_Health_Empty(ItPo_Potion_Empty)
{
	visual 		= "ItPo_Perm_Mana.3ds";
	text[4] 	= "В ней был лечебный эликсир.";
};
func void UseItPo_Empty()
{
	if(Npc_IsPlayer(self))
	{
		Print("Пустая бутылка, зачем она мне?");
	};
};

////////////////////////////////////////////////////////////////////
prototype ItPo_Health_Proto(C_Item)
{
	name 			= NAME_Trank;
	mainflag 	= ITEM_KAT_POTIONS;
	flags 		= ITEM_MULTI;
	material 	= MAT_GLAS;
	wear 			= WEAR_EFFECT;
	effect 		= "SPELLFX_HEALTHPOTION";
	text[1] 	= NAME_Bonus_HP_DS;
	text[5] 	= NAME_Value;
};
instance ItPo_Health_01(ItPo_Health_Proto)
{
	visual 		= "ItPo_Health_01.3ds";
	scemeName = "POTIONHEALTH1";
	description = "Лечебная эссенция";
	value 		= Value_HpEssenz;
	on_state[0] = UseItPo_Health_01;	
	count[1] 	= HP_Essenz;
	count[5] 	= value;
};
func void UseItPo_Health_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX] / 4);
	Npc_RemoveinvItem(self,ItPo_Health_01);
};
instance ItPo_Health_02(ItPo_Health_Proto)
{
	visual 		= "ItPo_Health_02.3ds";
	scemeName = "POTIONHEALTH2";
	description = "Лечебный экстракт";
	value 		= Value_HpExtrakt;
	on_state[0] = UseItPo_Health_02;	
	count[1] 	= HP_Extrakt;
	count[5] 	= value;
};
func void UseItPo_Health_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX] / 2);
	Npc_RemoveinvItem(self,ItPo_Health_02);
};
instance ItPo_Health_03(ItPo_Health_Proto)
{
	visual 		= "ItPo_Health_03.3ds";
	scemeName = "POTIONHEALTH3";
	description = "Лечебный эликсир";
	value 		= Value_HpElixier;
	on_state[0] = UseItPo_Health_03;	
	count[1] 	= HP_Elixier;
	count[5] 	= value;
};
func void UseItPo_Health_03()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	Npc_RemoveinvItem(self,ItPo_Health_03);
};

///////////////////////////////////////////////////////////

prototype ItPo_Perm_Proto(C_Item)
{
	name 			= NAME_Trank;
	mainflag 	= ITEM_KAT_POTIONS;
	flags 		= ITEM_MULTI;
	material 	= MAT_GLAS;
	wear 			= WEAR_EFFECT;
	effect 		= "SPELLFX_ITEMGLIMMER";
	text[5] 	= NAME_Value;
};
instance ItPo_Perm_STR(ItPo_Perm_Proto)
{
	visual 			= "ItPo_Perm_STR.3ds";
	scemeName 	= "POTIONPERMSTR";
	description = "Эликсир силы";
	value 			= Value_StrElixier;	
	on_state[0] = UseItPo_Perm_STR;	
	text[1] 		= NAME_Bonus_Str;
	count[1] 		= STR_Elixier;
	count[5] 		= Value_StrElixier;
};
func void UseItPo_Perm_STR()
{
	B_RaiseAttribute(self,ATR_STRENGTH,STR_Elixier);
	Npc_RemoveInvItem(self,ItPo_Perm_STR);
};

instance ItPo_Perm_DEX(ItPo_Perm_Proto)
{
	visual 			= "ItPo_Perm_DEX.3ds";
	scemeName 	= "POTIONPERMDEX";
	description = "Эликсир ловкости";
	value 			= Value_DexElixier;
	on_state[0] = UseItPo_Perm_DEX;
	text[1] 		= NAME_Bonus_Dex;
	count[1] 		= DEX_Elixier;
	count[5] 		= Value_DexElixier;
};
func void UseItPo_Perm_DEX()
{
	B_RaiseAttribute(self,ATR_DEXTERITY,DEX_Elixier);
	Npc_RemoveInvItem(self,ItPo_Perm_DEX);
};

instance ItPo_Perm_Health(ItPo_Perm_Proto)
{
	visual 			= "ItPo_Perm_Health.3ds";
	scemeName 	= "POTIONPERMHEALTH";
	effect 			= "SPELLFX_HEALTHPOTION";
	description = "Эликсир жизни";
	on_state[0] = UseItPo_Perm_Health;
	value 			= Value_HpMaxElixier;
	text[1] 		= NAME_Bonus_HpMax;
	count[1] 		= HPMax_Elixier;
	count[5] 		= Value_HpMaxElixier;
};
func void UseItPo_Perm_Health()
{
	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,HPMax_Elixier);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMax_Elixier);
	Npc_RemoveInvItem(self,ItPo_Perm_Health);
};

instance ItPo_Perm_Mana(ItPo_Perm_Proto)
{
	visual 			= "ItPo_Perm_Mana.3ds";
	scemeName 	= "POTIONPERMMANA";
	effect 			= "SPELLFX_MANAPOTION";
	description = "Эликсир духа";
	value 			= Value_ManaMaxElixier;
	on_state[0] = UseItPo_Perm_Mana;
	text[1] 		= NAME_Bonus_ManaMax;
	count[1] 		= ManaMax_Elixier;
	count[5] 		= Value_ManaMaxElixier;
};
func void UseItPo_Perm_Mana()
{
	B_RaiseAttribute(self,ATR_MANA_MAX,ManaMax_Elixier);
	Npc_ChangeAttribute(self,ATR_MANA,ManaMax_Elixier);
	Npc_RemoveInvItem(self,ItPo_Perm_Mana);
};

instance ItPo_Speed(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_Speed;
	visual = "ItPo_Speed.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Speed;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Зелье ускорения";
	text[1] = "Временно повышает скорость.";
	text[3] = NAME_Duration;
	count[3] = Time_Speed / 60000;
	text[5] = NAME_Value;
	count[5] = value;
};
func void UseItPo_Speed()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",Time_Speed);
};

// Для Саги фейковые бутылки - пустые.
prototype ItMi_PotionFlask_Empty(C_Item)
{
	name 			= "Пустая бутылка";
	mainflag 	= ITEM_KAT_NONE;
	flags 		= ITEM_MULTI;
	scemeName = "ROMSEALED";
	visual 		= "Potions_empty_small.3ds";
	material 	= MAT_GLAS;
	description = name;
	value 		= 0;
	text[1] 	= "Здесь, видимо, был какой-то напиток.";
	text[5] 	= NAME_Value;
	count[5] 	= 0;
};
instance ItPo_Potion_01_Empty(ItMi_PotionFlask_Empty)
{
};
instance ItPo_Potion_02_Empty(ItMi_PotionFlask_Empty)
{
	visual 		= "Potions_empty_mid.3ds";
};
instance ItPo_Potion_03_Empty(ItMi_PotionFlask_Empty)
{
	visual 		= "Potions_empty_big.3ds";
};
instance ItPo_Potion_Perm_Empty(ItMi_PotionFlask_Empty)
{
	visual 		= "Potions_empty_perm.3ds";
};

//-------------------------------------------------------------
//-------------------ИЗ ФАЙЛА по АДДОНУ------------------------

instance ItPo_Health_Addon_04(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_HpTrunk;
	visual = "ItPo_Health_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Health_04;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_HEALTHPOTION";
	description = "Чистое здоровье";
	text[2] = "Полное восстановление здоровья";
	text[5] = NAME_Value;
	count[5] = Value_HpTrunk;
};
func void UseItPo_Health_04()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
};

instance ItPo_Mana_Addon_04(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ManaTrunk;
	visual = "ItPo_Mana_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_Mana_04;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Чистая мана";
	text[2] = "Полное восстановление маны";
	text[5] = NAME_Value;
	count[5] = Value_ManaTrunk;
};
func void UseItPo_Mana_04()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
};

//Склянка упыря
func void UseItPo_DS_GhoulGlass()
{
	hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS];
	Mdl_SetVisualBody(hero,"Zom_Body",0,0,"Zom_Head",0,DEFAULT,-1);
};

prototype ItPo_DS_GhoulGlass_Proto(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "DS_SKLA_VAMPIRE.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_DS_GhoulGlass;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Склянка Упыря";
	text[1] = "Склянка пуста.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotx = 0;
	inv_roty = -90;
	inv_rotz = 0;
};
instance ItPo_DS_GhoulGlass(ItPo_DS_GhoulGlass_Proto)
{
};
instance ItPo_DS_GhoulGlass50(ItPo_DS_GhoulGlass_Proto)
{
	text[1] = "Склянка полна на 50 очков жизни.";
};
instance ItPo_DS_GhoulGlass100(ItPo_DS_GhoulGlass_Proto)
{
	text[1] = "Склянка полна на 100 очков жизни.";
};
instance ItPo_DS_GhoulGlass150(ItPo_DS_GhoulGlass_Proto)
{
	text[1] = "Склянка полна на 150 очков жизни.";
};
instance ItPo_DS_GhoulGlass200(ItPo_DS_GhoulGlass_Proto)
{
	text[1] = "Склянка полна на 200 очков жизни.";
};
instance ItPo_DS_GhoulGlass250(ItPo_DS_GhoulGlass_Proto)
{
	text[1] = "Склянка полна на 250 очков жизни.";
};
instance ItPo_DS_GhoulGlass300(ItPo_DS_GhoulGlass_Proto)
{
	text[1] = "Склянка полна на 300 очков жизни.";
};
instance ItPo_DS_GhoulGlass350(ItPo_DS_GhoulGlass_Proto)
{
	text[1] = "Склянка полна на 350 очков жизни.";
};
