/*Карта острова (возможно в продаже у крестьян)*/
instance ItWr_DS2P_Map_Bauer(C_Item)
{
  name = "Карта";
  mainflag = ITEM_KAT_DOCS;
  flags = ITEM_MULTI;
  value = 500;
  visual = "ItWr_Map_01.3DS";
  material = MAT_LEATHER;
  scemeName = "MAP";
  on_state[0] = Use_DS2P_Map_Bauer;
  description = "Карта острова";
  text[0] = "Эту карту составили";
	text[1] = "в лагере фермеров.";
  text[5] = NAME_Value;
  count[5] = value;
};
func void Use_DS2P_Map_Bauer()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_DS2P_Map_Bauer);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"MAP_DS2P_BAUERS.tga",TRUE);
	Doc_SetLevel(Document,"World_DS2_Prolog.zen");
	Doc_SetLevelCoords(Document,-17687,31000,74157,-37000);
	Doc_Show(Document);
};
instance ItWr_DS2P_Map_Tamir(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_DS2P_Map_Tamir;
	description = "Карта острова";
	text[1] = "Эту карту дал мне Тамир.";
	text[2] = "На ней отмечено место обитания черного тролля.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_DS2P_Map_Tamir()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_DS2P_Map_Tamir);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"MAP_DS2P_TAMIR.tga",TRUE);
	Doc_SetLevel(Document,"World_DS2_Prolog.zen");
	Doc_SetLevelCoords(Document,-17687,31000,74157,-37000);
	Doc_Show(Document);
};
// Карта с местоположением сундука Зедда по квесту "Компромат на Зедда"
instance ItWr_DS2P_ZeddCompromise_Map(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_DS2P_ZeddCompromise_Map;
	description = "Карта острова";
	text[1] = "Эту карту я украл у Зедда.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_DS2P_ZeddCompromise_Map()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_DS2P_ZeddCompromise_Map);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"MAP_DS2P_TAMIR.tga",TRUE); // UNFINISHED - сама карта
	Doc_SetLevel(Document,"World_DS2_Prolog.zen");
	Doc_SetLevelCoords(Document,-17687,31000,74157,-37000);
	Doc_Show(Document);
};
//Карта сокровищ Лана-скелета
instance ItWr_DS2P_Map_LanSkeleton(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_DS2P_Map_LanSkeleton;
	description = "Карта сокровищ";
	text[1] = "Карта Лана-скелета.";
	text[2] = "На ней отмечено, где Лан спрятал древние монеты.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_DS2P_Map_LanSkeleton()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_DS2P_Map_LanSkeleton);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"MAP_DS2P_LANSKELETON.tga",TRUE);
	Doc_SetLevel(Document,"World_DS2_Prolog.zen");
	Doc_SetLevelCoords(Document,-17687,31000,74157,-37000);
	Doc_Show(Document);
};
//Список материалов для ковки с ценой в золоте
instance ItWr_DS2P_List_Joseph(C_Item)
{
	name = "Список"; 
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION; 
	value = 0; 
	visual = "ItWr_Scroll_01.3DS"; 
	material = MAT_LEATHER;
	on_state[0] = Use_DS2P_List_Joseph;
	scemeName = "MAP";
	description = "Список материалов";
	text[1] = "Материалы и цены для ковки";
	text[2] = "магического оружия у Джозефа";
};
func void Use_DS2P_List_Joseph()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Список материалов и цен");
	Doc_PrintLine(nDocID,0,"для ковки магического оружия");
	/* UNFINISHED
	Doc_PrintLine(nDocID,0,"...");
	//*/
	Doc_Show(nDocID);
};
//Записки Ватраса о Зодчих
instance ItWr_DS2P_VatrasNotes(C_Item)
{
	name = "Записи Ватраса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Здесь собраны заметки Ватраса.";
	text[2] = "о древней культуре и языке Зодчих.";
};

//Список трав для приготовления слабительного
instance ItWr_DS2P_CimmsIngredients(C_Item)
{
	name = "Список"; 
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION; 
	value = 0; 
	visual = "ItWr_Scroll_01.3DS"; 
	material = MAT_LEATHER;
	on_state[0] = Use_DS2P_CimmsIngredients;
	scemeName = "MAP";
	description = "Список трав";
	text[1] = "для приготовления слабительного";
	text[2] = "от Цимма.";
};
func void Use_DS2P_CimmsIngredients()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"3 огненные крапивы");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"2 болотные травы");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"2 горных мха");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"1 темный гриб");
	Doc_Show(nDocID);
};
