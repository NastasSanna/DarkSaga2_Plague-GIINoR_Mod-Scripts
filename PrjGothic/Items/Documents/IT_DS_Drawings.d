//„ертежи
//-------------------------------јрбалеты---------------------------готовы
instance ItWr_DS_Drawing_Crossbow_01(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Crossbow_01;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_CBOW;
	text[1] = "Фѕоражающий цельФ";
	text[2] = NAME_Damage;
	count[2] = 50;
	text[3] = NAME_Str_needed;
	count[3] = 45;
	text[4] = NAME_ADDON_BONUS_CROSSBOW;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_ItWr_DS_Drawing_Crossbow_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_CrossBow_2.TGA",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Crossbow_02(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 450;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Crossbow_02;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_CBOW;
	text[1] = "Ф”дача тролл€Ф";
	text[2] = NAME_Damage;
	count[2] = 70;
	text[3] = NAME_Str_needed;
	count[3] = 60;
	text[4] = NAME_ADDON_BONUS_CROSSBOW;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_ItWr_DS_Drawing_Crossbow_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_CrossBow_3.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_Crossbow_03(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 700;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Crossbow_03;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_CBOW;
	text[0] = "Ф–ассветФ";
	text[1] 	= NAME_Dam_Point;
	count[1] 	= 100;
	text[2] 	= NAME_Dam_Magic;
	count[2] 	= 5;
	text[3] 	= NAME_Str_needed;
	count[3] 	= 85;
	text[4] 	= NAME_ADDON_BONUS_CROSSBOW;
	count[4] 	= 7;
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
func void Use_ItWr_DS_Drawing_Crossbow_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_CrossBow_1.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_Crossbow_04(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 2000;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Crossbow_04;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_CBOW;
	text[0] = "Фѕеснь звездыФ";
	text[1] 	= NAME_Dam_Point;
	count[1] 	= 140;
	text[2] 	= NAME_Dam_Magic;
	count[2] 	= 10;
	text[3] 	= NAME_Str_needed;
	count[3] 	= 120;
	text[4] 	= NAME_ADDON_BONUS_CROSSBOW;
	count[4] 	= 10;
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
func void Use_ItWr_DS_Drawing_Crossbow_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_CrossBow_4.TGA",1);
	Doc_Show(nDocID);
};

//-------------------------------Ћуки---------------------------готовы

instance ItWr_DS_Drawing_Bow_01(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Bow_01;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_BOW;
	text[1] = "ФЋук охотникаФ";
	text[2] = NAME_Damage;
	count[2] = 45;
	text[3] = NAME_Dex_needed;
	count[3] = 35;
	text[4] = NAME_ADDON_BONUS_BOW;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_ItWr_DS_Drawing_Bow_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Bow-0.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_Bow_02(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 400;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Bow_02;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_BOW;
	text[1] = "Ф–ассекающий ветерФ";
	text[2] = NAME_Damage;
	count[2] = 65;
	text[3] = NAME_Dex_needed;
	count[3] = 65;
	text[4] = NAME_ADDON_BONUS_BOW;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_ItWr_DS_Drawing_Bow_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Bow-1.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_Bow_03(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 500;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Bow_03;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_BOW;
	text[0] = "ФѕорывФ";
	text[1] 	= NAME_Dam_Point;
	count[1] 	= 80;
	text[2] 	= NAME_Dam_Magic;
	count[2] 	= 5;
	text[3] 	= NAME_Dex_needed;
	count[3] 	= 70;
	text[4] 	= NAME_ADDON_BONUS_BOW;
	count[4] 	= 7;
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
func void Use_ItWr_DS_Drawing_Bow_03()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Bow-2.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_Bow_04(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 700;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Bow_04;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_BOW;
	text[0] = "Фћудрость охотникаФ";
	text[1] 	= NAME_Dam_Point;
	count[1] 	= 100;
	text[2] 	= NAME_Dam_Magic;
	count[2] 	= 10;
	text[3] 	= NAME_Dex_needed;
	count[3] 	= 85;
	text[4] 	= NAME_ADDON_BONUS_BOW;
	count[4] 	= 8;
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
func void Use_ItWr_DS_Drawing_Bow_04()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Bow-6.TGA",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Bow_05(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 900;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Bow_05;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_BOW;
	text[0] = "Ф”тренн€€ зар€Ф";
	text[1] 	= NAME_Dam_Point;
	count[1] 	= 120;
	text[2] 	= NAME_Dam_Magic;
	count[2] 	= 15;
	text[3] 	= NAME_Dex_needed;
	count[3] 	= 100;
	text[4] 	= NAME_ADDON_BONUS_BOW;
	count[4] 	= 10;
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
func void Use_ItWr_DS_Drawing_Bow_05()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Bow-4.TGA",1);
	Doc_Show(nDocID);
};
//-------------------------------ќружие в шахте---------------------------
instance ItWr_DS_Drawing_Prad_1(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Prad_1;
	scemeName = "MAP";
	description = "„ертеж оружи€";
	text[1] = "Фѕалка с шипамиФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 20;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 15;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;

};
func void Use_ItWr_DS_Drawing_Prad_1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Prad_1.tga",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Prad_2(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Prad_2;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_SWD;
	text[1] = "Ф«уб волкаФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 25;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 15;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Prad_2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Prad_2.tga",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Prad_3(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Prad_3;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_SWD;
	text[1] = "Ф ровопускательФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 35;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 20;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Prad_3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Prad_3.tga",1);
	Doc_Show(nDocID);
};

//*************************-----ќ–”∆»≈ “ќЅ»ј—ј - охотники---------------------------------------------------------
instance ItWr_DS_Drawing_Tobias_1(C_Item)
{
	name 				= NAME_DS_DRAWING;
	mainflag 		= ITEM_KAT_DOCS;
	flags 			= 0;
	value 			= 400;
	visual 			= "ItWr_Scroll_02.3DS";
	material 		= MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Tobias_1;
	scemeName 	= "MAP";
	description = NAME_DS_DRAWING_SWD;
	text[1] 		= "Ф«вездаФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 75;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 60;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Tobias_1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Tobias_1.TGA",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Tobias_2(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 500;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Tobias_2;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_SWD;
	text[1] = "ФѕокорительФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 85;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 70;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Tobias_2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Tobias_2.TGA",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Tobias_3(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Tobias_3;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_SWD;
	text[1] = "Ф¬озмездиеФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 120;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 115;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 6;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Tobias_3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Tobias_3.TGA",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Tobias_4(C_Item)
{
	name 				= NAME_DS_DRAWING;
	mainflag 		= ITEM_KAT_DOCS;
	flags 			= 0;
	value 			= 2500;
	visual 			= "ItWr_Scroll_02.3DS";
	material 		= MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Tobias_4;
	scemeName 	= "MAP";
	description = "„ертеж молота";
	text[1] 		= "Ф рушительФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 140;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 140;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 10;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Tobias_4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Tobias_4.TGA",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Tobias_5(C_Item)
{
	name 				= NAME_DS_DRAWING;
	mainflag 		= ITEM_KAT_DOCS;
	flags 			= 0;
	value 			= 200;
	visual 			= "ItWr_Scroll_02.3DS";
	material 		= MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Tobias_5;
	scemeName 	= "MAP";
	description = "„ертеж булавы";
	text[1] 		= "Ф”бийца орковФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 65;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 40;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 10;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Tobias_5()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Tobias_5.TGA",1);
	Doc_Show(nDocID);
};
//******************************++++ѕ»–ј“џ____________**************************************************

instance ItWr_DS_Drawing_Hans_1(C_Item)
{
	name 				= NAME_DS_DRAWING;
	mainflag 		= ITEM_KAT_DOCS;
	flags 			= 0;
	value 			= 250;
	visual 			= "ItWr_Scroll_02.3DS";
	material 		= MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Hans_1;
	scemeName 	= "MAP";
	description = "„ертеж сабли";
	text[1] 		= "Фћесть пиратаФ";
	text[2] 		= NAME_Damage;
	count[2] 		= Damage_ds_RevengePirates;
	text[3] 		= NAME_Dex_needed;
	count[3] 		= Condition_ds_RevengePirates;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 10;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Hans_1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Hans_1.TGA",1);
	Doc_Show(nDocID);
};

instance ItWr_DS_Drawing_Hans_2(C_Item)
{
	name 				= NAME_DS_DRAWING;
	mainflag 		= ITEM_KAT_DOCS;
	flags 			= 0;
	value 			= 300;
	visual 			= "ItWr_Scroll_02.3DS";
	material 		= MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Hans_2;
	scemeName 	= "MAP";
	description = NAME_DS_DRAWING_SWD;
	text[1] 		= "Ф линок мастераФ";
	text[2] 		= NAME_Damage;
	count[2] 		= Damage_ds_SwordMaster;
	text[3] 		= NAME_Dex_needed;
	count[3] 		= Condition_ds_SwordMaster;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 10;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Hans_2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Hans_2.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_Hans_3(C_Item)
{
	name 				= NAME_DS_DRAWING;
	mainflag 		= ITEM_KAT_DOCS;
	flags 			= 0;
	value 			= 450;
	visual 			= "ItWr_Scroll_02.3DS";
	material 		= MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Hans_3;
	scemeName 	= "MAP";
	description = NAME_DS_DRAWING_SWD;
	text[1] 		= "Ф¬олнорезФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 90;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 75;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Hans_3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Hans_3.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_Hans_4(C_Item)
{
	name 				= NAME_DS_DRAWING;
	mainflag 		= ITEM_KAT_DOCS;
	flags 			= 0;
	value 			= 550;
	visual 			= "ItWr_Scroll_02.3DS";
	material 		= MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_Hans_4;
	scemeName 	= "MAP";
	description = "„ертеж булавы";
	text[1] 		= "Ф”бийца нежитиФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 80;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 65;
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_Hans_4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Hans_4.TGA",1);
	Doc_Show(nDocID);
};

//**************************ќ–ќ„№» “ќѕќ–џ*****************************************

instance ItWr_DS_Drawing_OrcAxe_1(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 600;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_OrcAxe_1;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_AXE;
	text[1] = "Ф раш јгарФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 95;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 80;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_OrcAxe_1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_OrcAxe_01.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_OrcAxe_2(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 650;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_OrcAxe_2;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_AXE;
	text[1] = "Ф раш ƒарготФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 100;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 85;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_OrcAxe_2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_OrcAxe_02.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_OrcAxe_3(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 700;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_OrcAxe_3;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_AXE;
	text[1] = "Ф√нев оркаФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 110;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 95;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 5;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_OrcAxe_3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_OrcAxe_03.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_OrcAxe_4(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 2000;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_OrcAxe_4;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_AXE;
	text[1] = "Фќко ЅелиараФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 130;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 130;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 7;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_OrcAxe_4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_OrcAxe_04.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_OrcAxe_5(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 3000;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_OrcAxe_5;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_AXE;
	text[1] = "Ф–удный покорительФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 145;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 145;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 10;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_OrcAxe_5()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_OrcAxe_05.TGA",1);
	Doc_Show(nDocID);
};
instance ItWr_DS_Drawing_OrcAxe_6(C_Item)
{
	name = NAME_DS_DRAWING;
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DS_Drawing_OrcAxe_6;
	scemeName = "MAP";
	description = NAME_DS_DRAWING_AXE;
	text[1] = "ФЌесущий смертьФ";
	text[2] 		= NAME_Damage;
	count[2] 		= 165;
	text[3] 		= NAME_Str_needed;
	count[3] 		= 200;
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= 10;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void Use_ItWr_DS_Drawing_OrcAxe_6()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_OrcAxe_06.TGA",1);
	Doc_Show(nDocID);
};

