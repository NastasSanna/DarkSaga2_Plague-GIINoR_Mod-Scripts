

//Удочка
instance ItMi_FishingRod(C_Item)
{
	name 			= "Удочка";description = name;
	mainflag 	= ITEM_KAT_NONE;	flags 		= ITEM_MULTI;
	value 		= 10;
	visual 		= "FishingRod_DSG.3ds";
	material 	= MAT_WOOD;	
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
instance ItMi_DS2P_FakeAmulet(C_Item)		//Фейк амулета
{
	name 		= NAME_Amulett;
	mainflag 	= ITEM_KAT_NONE;
	visual = "ItAm_Prot_Fire_01.3ds";
	effect = "SPELLFX_ITEMGLIMMER";
	material = MAT_METAL;
	scemeName 	= "ROMSEALED";
	description = name;
};
instance ItMi_DS2P_LanNightmaresPotion(C_ITEM)
{
	name 		= "Зелье";
	mainflag 	= ITEM_KAT_NONE;
	visual = "ItMi_Flask.3ds";
	material = MAT_METAL;
	description = "Зелье Ватраса";
	text[1] = "Поможет перенестись в сон Лана";
};
instance ItMi_DS2P_HuntersHead(C_Item)
{
	name = "Голова";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS"; //UNFINISHED - визуалка
	material = MAT_LEATHER;
	description = name;
	text[1] = "Принадлежала одному из охотников";
	text[2] = "Сейчас уже и не разберешь, кому именно";
};
instance ItMi_DS2P_HuntersHead_SelfMade(C_Item)
{
	name = "Голова";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS"; //UNFINISHED - визуалка
	material = MAT_LEATHER;
	description = name;
	text[1] = "Принадлежала одному из охотников";
	text[2] = "Подделка";
};
instance ItMi_DS2P_HuntersHead_SelfMade_Illusion(C_Item)
{
	name = "Голова";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS"; //UNFINISHED - визуалка
	material = MAT_LEATHER;
	description = name;
	text[1] = "Принадлежала одному из охотников";
	text[2] = "Подделка, Ватрас наложил на нее иллюзию";
};
instance ItMi_DS2P_JinnsColorChest(C_Item)
{
	name = "Шкатулка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_JeweleryChest;
	visual = "ItMi_JeweleryChest.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "Сбоку виднеется небольшая царапина";
};
/*----------------------------------------------------------------------*/
// Самогон для Йорна (со слабительным)
// Для квеста "Подставить Йорна"
/*----------------------------------------------------------------------*/
instance ItMi_DS2P_SamogonForJorn(C_Item)
{
	name = "Самогон";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	description = "Самогон со слабительным";
	text[1] = "Пару дней тот, кто выпьет это,";
	text[2] = "будет мучиться диким поносом.";
};
/*----------------------------------------------------------------------*/
// Горн Тома
// Для квеста "Патруль пиратов"
/*----------------------------------------------------------------------*/
instance ItMi_DS2P_TomHorn(C_Item)
{
	name = "Горн";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Broom;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_METAL;
	scemeName = "HORN";
	on_state[0] = Use_TomHorn;
	description = "Горн Тома";
	text[1] = "С помощью этого рога можно загонять хищников.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_TomHorn()
{
	//UNFINISHED
};

