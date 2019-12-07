instance ItMi_Nugget(C_Item)
{
	name = "Кусок магической руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Nugget.3ds";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance ItMi_Sulfur(C_Item)
{
	name = "Сера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sulfur;
	visual = "ItMi_Sulfur.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_Quartz(C_Item)
{
	name = "Горный кварц";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Quartz;
	visual = "ItMi_Quartz.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ItMi_Pitch(C_Item)
{
	name = "Смола";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pitch;
	visual = "ItMi_Pitch.3DS";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Rockcrystal(C_Item)
{
	name = "Горный хрусталь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rockcrystal;
	visual = "ItMi_Rockcrystal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Aquamarine(C_Item)
{
	name = "Аквамарин";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Aquamarine;
	visual = "ItMi_Aquamarine.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
instance ItMi_Coal(C_Item)
{
	name = "Уголь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Coal;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_DarkPearl(C_Item)
{
	name = "Черный жемчуг";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DarkPearl;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
// Железная руда

instance ItMi_IronOre(C_Item)
{
	name = "Кусок железной руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 20;
	visual = "ItMi_IronOre.3ds";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

//Топазы и аметисты
//Поменять модели и текстуры
instance ItMi_DS_Almaz(C_Item)
{
	name = "Алмаз";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "Jewels_meshes_01.3DS";
	material = MAT_STONE;
	description = name;
	text[1] = "Один из самых твердых";
	text[2] = "драгоценных камней.";
	text[3] = "Торговцы дадут за него";
	text[4] = "приличную сумму.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_DS_Topaz(C_Item)
{
	name = "Топаз";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "Jewels_meshes_04.3DS";
	material = MAT_STONE;
	description = name;
	text[1] = "Драгоценный камень,";
	text[2] = "приносящий удачу.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
instance ItMi_DS_Ametist(C_Item)
{
	name = "Аметист";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 150;
	visual = "Jewels_meshes_03.3DS";
	material = MAT_STONE;
	description = name;
	text[1] = "Драгоценный камень,";
	text[2] = "символ миролюбия и искренности.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
instance ItMi_DS_Izumrud(C_Item)
{
	name = "Изумруд";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Aquamarine;
	visual = "Jewels_meshes_02.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
instance ItMi_DS_Opal(C_Item)
{
	name = "Опал";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Aquamarine;
	visual = "Jewels_meshes_05.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

const int Value_Goldnugget = 18;
const int Value_WhitePearl = 120;

instance ItMi_GoldNugget_Addon(C_Item)
{
	name = "Золотой самородок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Goldnugget;
	visual = "ItMi_GoldNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_Addon_WhitePearl(C_Item)
{
	name = "Жемчужина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WhitePearl;
	visual = "ItMi_WhitePearl_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
instance ItMi_BlackOreNugget(C_Item)
{
	name = "Черная руда";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Zeitspalt_Addon.3DS";
	scemeName = "MAPSEALED";
	on_state[0] = Use_Zeitspalt_Addon;
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[3] = "Эффект неизвестен.";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
func void Use_Zeitspalt_Addon()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		Wld_StopEffect("SLOW_MOTION");
		Wld_PlayEffect("SLOW_MOTION",self,self,0,0,0,FALSE);
	};
};
instance ITMI_DS2P_NUGGET_MID(C_Item)
{
	name = "Кусок руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "nugget_mid.3ds";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Большой кусок руды";
	text[1] = "Магическая руда";
	text[2] = "Достаточно большой кусок.";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_DS2P_NUGGET_BIG(C_Item)
{
	name = "Кусок руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "nugget_big.3ds";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Очень большой кусок руды";
	text[1] = "Магическая руда";
	text[2] = "Кусок внушительных размеров.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ITMI_SilverOre_Nugget(C_Item)
{
	name = "Серебряный самородок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_OreSilver.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	text[5] = NAME_Value;
	count[5] = value;
};
