
//NS - 26/10/13 добавлены нужные, убраны лишние, упорядочено

// ================= СТРЕЛЫ =========================
instance ItRw_Arrow(C_Item)
{
	name = "Стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = Value_Pfeil;
	visual = "ItRw_Arrow.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_arrow;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_arrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(ItRw_Arrow);
	};
};
instance ITRW_SILVEROREARROW(C_Item)
{
	name = "Серебряная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_INNOSRETRIBUTIONARROW";
	value = 5;
	visual = "itmi_arrow_03.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_silverorearrow;
	//* NS - 29/01/2013
	text[2] = "Только серебро может нанести урон";
	text[3] = "бесплотному призраку";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_silverorearrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_silverorearrow);
	};
};

instance ITRW_INNOSRETRIBUTIONARROW(C_Item)
{
	name = "Зачарованная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ICEARROW";
	value = 20;
	visual = "itmi_arrow_05.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_innosretributionarrow;
	//* NS - 29/01/2013
	text[1] = "Трансформирует ману";
	text[2] = "в дополнительный урон магией";
	text[3] = "Наконечник выполнен из";
	text[4] = "сплава магической и серебряной руды.";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_innosretributionarrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_innosretributionarrow);
	};
};


instance ITRW_ADDON_MAGICOREARROW(C_Item)
{
	name = "Стрела с наконечником из магической руды";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MAGICOREARROW";
	value = 5;
	visual = "itmi_arrow_04.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_magicorearrow;
	//* NS - 29/01/2013
	text[2] = "Трансформирует ману";
	text[3] = "в дополнительный урон магией";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_magicorearrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_magicorearrow);
	};
};

instance ITRW_ADDON_BLACKOREARROW(C_Item)
{
	name = "Стрела с наконечником из черной руды";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BLACKOREARROW";
	value = 5;
	visual = "itmi_arrow_02.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_blackorearrow;
	//* NS - 29/01/2013
	text[2] = "Трансформирует ману";
	text[3] = "в усиленный урон магией";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_blackorearrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_blackorearrow);
	};
};


instance ItRw_Addon_MagicArrow(C_Item)
{
	name = "Магическая стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ARROW";
	value = 5;
	visual = "ItRw_Arrow.3ds";
	scemeName = "MAP";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_magicarrow;
	//* NS - 29/01/2013
	text[2] = "Трансформирует ману";
	text[3] = "в дополнительный урон магией";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_magicarrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(ItRw_Addon_MagicArrow);
	};
};

// ------------------ НЕ РЕАЛИЗОВАНО -------------------------
instance ITRW_ADDON_VAMPIRARROW(C_Item)
{
	name = "Стрела похитителя душ";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_VAMPIRARROW";
	value = 5;
	visual = "ItRw_Arrow.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_vampirarrow;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_vampirarrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_vampirarrow);
	};
};
instance ItRw_Addon_FireArrow(C_Item)
{
	name = "Огненная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREARROW";
	//effect = "SPELLFX_EXPLOSIVEARROW";
	value = 5;
	visual = "ItRw_Arrow.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_firearrow;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_firearrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(ItRw_Addon_FireArrow);
	};
};
instance ITRW_ADDON_KILLERARROW(C_Item)
{
	name = "Стрела убийцы";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = 5;
	visual = "ItRw_Arrow.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_killerarrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_EXPLOSIVEARROW";
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_killerarrow()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_killerarrow);
	};
};

//++++++++++++++++++++++----------------------------------------
//-----------------------------БОЛТЫ--------БОЛТЫ---------------
//--------------------------------------------------------------
instance ItRw_Bolt_01(C_Item)
{
	name = "Болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = Value_Bolzen;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_bolt;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_bolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(ItRw_Bolt_01);
	};
};

instance ITRW_ADDON_SILVEROREBOLT(C_Item)
{
	name = "Болт с наконечником из серебряной руды";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_INNOSRETRIBUTIONBOLT";
	value = 5;
	visual = "itmi_bolt_03.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_ITRW_ADDON_SILVEROREBOLT;
	//* NS - 29/01/2013
	text[2] = "Только серебро может нанести урон";
	text[3] = "бесплотному призраку";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_ITRW_ADDON_SILVEROREBOLT()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(ITRW_ADDON_SILVEROREBOLT);
	};
};
instance ITRW_ADDON_MAGICOREBOLT(C_Item)
{
	name = "Болт с наконечником из магической руды";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MAGICOREBOLT";
	value = 5;
	visual = "itmi_bolt_04.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_magicorebolt;
	//* NS - 29/01/2013
	text[2] = "Трансформирует ману";
	text[3] = "в дополнительный урон магией";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_magicorebolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_magicorebolt);
	};
};
instance ITRW_ADDON_BLACKOREBOLT(C_Item)
{
	name = "Болт с наконечником из черной руды";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BLACKOREBOLT";
	value = 5;
	visual = "itmi_bolt_02.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_blackorebolt;
	//* NS - 29/01/2013
	text[2] = "Трансформирует ману";
	text[3] = "в усиленный урон магией";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_blackorebolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_blackorebolt);
	};
};

// ------------------ НЕ РЕАЛИЗОВАНО -------------------------
instance ItRw_Addon_MagicBolt(C_Item)
{
	name = "Магический болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOLT";
	value = 5;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_magicbolt;
	//* NS - 29/01/2013
	text[2] = "Трансформирует ману";
	text[3] = "в дополнительный урон магией";
	//*/
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_magicbolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(ItRw_Addon_MagicBolt);
	};
};
/*
instance ITRW_INNOSRETRIBUTIONBOLT(C_Item)
{
	name = "Болт возмездия Инноса";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_INNOSRETRIBUTIONBOLT";
	value = Value_Bolzen;
	visual = "itmi_bolt_05.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_innosretributionbolt;
	text[2] = MAGICCBOWNEEDED;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[1];
	text[4] = NAME_Dex_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_innosretributionbolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_magicarrow(itrw_innosretributionbolt);
	};
};
*/
instance ITRW_ADDON_VAMPIRBOLT(C_Item)
{
	name = "Болт Вампира";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_VAMPIRBOLT";
	value = 5;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_vampirbolt;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_vampirbolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_vampirbolt);
	};
};
/*
instance ITRW_ADDON_POISONBOLT(C_Item)
{
	name = "Отравленный болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_POISONBOLT";
	value = Value_Bolzen;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_poisonbolt;
	text[2] = BATTLECBOWNEEDED;
	text[4] = NAME_Dex_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_poisonbolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_poisonbolt);
	};
};
*/
instance ITRW_ADDON_FIREBOLT(C_Item)
{
	name = "Огненный болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREBOLT1";
	value = 5;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_firebolt;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_firebolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_firebolt);
	};
};
/*
instance ITRW_ADDON_ARMOURPIERCINGBOLT(C_Item)
{
	name = "Бронебойный болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = Value_Bolzen;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_armourpiercingbolt;
	text[2] = BATTLECBOWNEEDED;
	text[4] = NAME_Dex_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_armourpiercingbolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_armourpiercingbolt);
	};
};

instance ITRW_ADDON_EXPLOSIVEBOLT(C_Item)
{
	name = "Взрывной болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_EXPLOSIVEBOLT";
	value = Value_Bolzen;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_explosivebolt;
	text[2] = BATTLECBOWNEEDED;
	text[4] = NAME_Dex_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_explosivebolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_explosivebolt);
	};
};
*/
instance ITRW_ADDON_TROLLKILLERBOLT(C_Item)
{
	name = "Болт убийцы тролля";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = 5;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
	on_state[0] = use_itrw_addon_trollkillerbolt;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_itrw_addon_trollkillerbolt()
{
	if(Npc_IsPlayer(self))
	{
		equip_battlearrow(itrw_addon_trollkillerbolt);
	};
};



// для щитов
instance ITRW_DS_FAKEBOLT(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = 0;
	visual = "ItRw_Bolt.3ds";
	scemeName = "ROM";
	material = MAT_WOOD;
	description = name;
};
