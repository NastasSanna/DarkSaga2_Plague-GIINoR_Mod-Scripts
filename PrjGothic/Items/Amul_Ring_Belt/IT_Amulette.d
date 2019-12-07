
const int Value_Am_ProtFire = 600;
const int Am_ProtFire = 10;
const int Value_Am_ProtEdge = 800;
const int Am_ProtEdge = 10;
const int Value_Am_ProtMage = 700;
const int Am_ProtMage = 10;
const int Value_Am_ProtPoint = 500;
const int Am_ProtPoint = 10;
const int Value_Am_ProtTotal = 1000;
const int Am_TProtFire = 8;
const int AM_TProtEdge = 8;
const int Am_TProtMage = 8;
const int Am_TProtPoint = 8;
const int Value_Am_Dex = 1000;
const int Am_Dex = 10;
const int Value_Am_Mana = 1000;
const int Am_Mana = 10;
const int Value_Am_Strg = 1000;
const int Am_Strg = 10;
const int Value_Am_Hp = 400;
const int Am_Hp = 40;
const int Value_Am_HpMana = 1300;
const int Am_HpMana_Hp = 30;
const int Am_HpMana_Mana = 10;
const int Value_Am_DexStrg = 1600;
const int Am_DexStrg_Dex = 8;
const int Am_DexStrg_Strg = 8;

instance ItAm_Prot_Fire_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtFire;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Fire_01;
	on_unequip = UnEquip_ItAm_Prot_Fire_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет огня";
	text[2] = NAME_Prot_Fire;
	count[2] = Am_ProtFire;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Prot_Fire_01()
{
	B_GiveBonusProt(self,PROT_FIRE,Am_ProtFire);
};
func void UnEquip_ItAm_Prot_Fire_01()
{
	B_GiveBonusProt(self,PROT_FIRE,-Am_ProtFire);
};

instance ItAm_Prot_Edge_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtEdge;
	visual = "ItAm_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Edge_01;
	on_unequip = UnEquip_ItAm_Prot_Edge_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет упряжи";
	text[2] = NAME_Prot_Edge;
	count[2] = Am_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Prot_Edge_01()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT, Am_ProtEdge);
};
func void UnEquip_ItAm_Prot_Edge_01()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT, -Am_ProtEdge);
};

instance ItAm_Prot_Point_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtPoint;
	visual = "ItAm_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Point_01;
	on_unequip = UnEquip_ItAm_Prot_Point_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет дубовой кожи";
	text[2] = NAME_Prot_Point;
	count[2] = Am_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Prot_Point_01()
{
	B_GiveBonusProt(self,PROT_POINT,Am_ProtPoint);
};
func void UnEquip_ItAm_Prot_Point_01()
{
	B_GiveBonusProt(self,PROT_POINT,-Am_ProtPoint);
};

instance ItAm_Prot_Mage_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtMage;
	visual = "ItAm_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Prot_Mage_01;
	on_unequip = UnEquip_ItAm_Prot_Mage_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет духовной силы";
	text[2] = NAME_Prot_Magic;
	count[2] = Am_ProtMage;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Prot_Mage_01()
{
	B_GiveBonusProt(self,PROT_MAGIC,Am_ProtMage);
};
func void UnEquip_ItAm_Prot_Mage_01()
{
	B_GiveBonusProt(self,PROT_MAGIC,-Am_ProtMage);
};

instance ItAm_Prot_Total_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtTotal;
	visual = "ItAm_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Value_Am_ProtTotal;
	on_unequip = UnEquip_Value_Am_ProtTotal;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет металлической кожи";
	text[1] = NAME_DS_Prot_EdgeAndPointAndMagicAndFire;
	count[1] = AM_TProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_Value_Am_ProtTotal()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, AM_TProtEdge);
};
func void UnEquip_Value_Am_ProtTotal()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -AM_TProtEdge);
};

instance ItAm_Dex_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Dex;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Dex_01;
	on_unequip = UnEquip_ItAm_Dex_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет ловкости";
	text[2] = NAME_Bonus_Dex;
	count[2] = Am_Dex;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Am_Dex);
};
func void UnEquip_ItAm_Dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Am_Dex);
};

instance ItAm_Strg_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Strg;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Strg_01;
	on_unequip = UnEquip_ItAm_Strg_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет силы";
	text[2] = NAME_Bonus_Str;
	count[2] = Am_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Am_Strg);
};
func void UnEquip_ItAm_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Am_Strg);
};

instance ItAm_Hp_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Hp;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Hp_01;
	on_unequip = UnEquip_ItAm_Hp_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет жизни";
	text[2] = NAME_Bonus_HP;
	count[2] = Am_Hp;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Hp_01()
{
	Equip_Bonus_HP(Am_Hp);
};
func void UnEquip_ItAm_Hp_01()
{
	UnEquip_Bonus_HP(Am_Hp);
};

instance ItAm_Mana_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Mana;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Mana_01;
	on_unequip = UnEquip_ItAm_Mana_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет магии";
	text[2] = NAME_Bonus_Mana;
	count[2] = Am_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Mana_01()
{
	Equip_Bonus_Mana(Am_Mana);
};
func void UnEquip_ItAm_Mana_01()
{
	UnEquip_Bonus_Mana(Am_Mana);
};

instance ItAm_Dex_Strg_01(C_Item)
{
	name = "Амулет мощи";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_DexStrg;
	visual = "ItAm_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Dex_Strg_01;
	on_unequip = UnEquip_ItAm_Dex_Strg_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет мощи";
	text[2] = NAME_Bonus_Dex;
	count[2] = Am_DexStrg_Dex;
	text[3] = NAME_Bonus_Str;
	count[3] = Am_DexStrg_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Am_DexStrg_Dex);
	Npc_ChangeAttribute(self,ATR_STRENGTH,Am_DexStrg_Strg);
};
func void UnEquip_ItAm_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Am_DexStrg_Dex);
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Am_DexStrg_Strg);
};

instance ItAm_Hp_Mana_01(C_Item)
{
	name = "Амулет просвещения";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_HpMana;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Hp_Mana_01;
	on_unequip = UnEquip_ItAm_Hp_Mana_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет просвещения";
	text[2] = NAME_Bonus_HP;
	count[2] = Am_HpMana_Hp;
	text[3] = NAME_Bonus_Mana;
	count[3] = Am_HpMana_Mana;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Hp_Mana_01()
{
	Equip_Bonus_Mana(Am_HpMana_Mana);
	Equip_Bonus_HP(Am_HpMana_Hp);
};
func void UnEquip_ItAm_Hp_Mana_01()
{
	UnEquip_Bonus_HP(Am_HpMana_Hp);
	UnEquip_Bonus_Mana(Am_HpMana_Mana);
};

instance ITAM_IMMORTAL_01(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_Strg;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_immortal_01;
	on_unequip = unequip_itam_immortal_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет бессмертия";
	text[2] = NAME_Bonus_Str;
	count[2] = Am_Strg;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void equip_itam_immortal_01()
{
	self.flags = NPC_FLAG_IMMORTAL;
};
func void unequip_itam_immortal_01()
{
	self.flags = 0;
};

//DarkSaga
//Амулет Мидара

instance ItAm_Amulet_Midar(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = Value_Am_ProtPoint;
	visual = "ItAm_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_Amulet_Midar;
	on_unequip = UnEquip_ItAm_Amulet_Midar;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Амулет Мидара";
	text[2] = NAME_DS_Prot_EdgeAndPoint;
	count[2] = Am_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_Amulet_Midar()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, Am_ProtPoint);
};
func void UnEquip_ItAm_Amulet_Midar()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -Am_ProtPoint);
};

//Амулет для разрушение меча

const int AM_DS_STRANGE_BONUSPROTFIRE = 10;

instance ITAM_DS_STRANGE(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_NONE;
  flags = ITEM_MULTI;
	value = 1000;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	//on_equip = equip_itam_ds_strange;
	//on_unequip = unequip_itam_ds_strange;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Странный амулет";
	text[2] = NAME_Prot_Fire;
	count[2] = AM_DS_STRANGE_BONUSPROTFIRE;
	text[4] = "Видимо, он неисправен.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
