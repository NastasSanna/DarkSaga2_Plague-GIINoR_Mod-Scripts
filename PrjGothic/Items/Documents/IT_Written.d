
instance StandardBrief(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseStandardBrief;
	scemeName = "MAP";
	description = "StandardLetter";
};
func void UseStandardBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"StandardLetter");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(nDocID);
};

instance StandardBuch(C_Item)
{
	name = "StandardBook";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "StandardBook";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseStandardBuch;
};
func void UseStandardBuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"StandardBook Page 1");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,0,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bBla blaBla blaBla blaBlaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"StandardBook Page 2");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
	Doc_Show(nDocID);
};

var int Lerne_Einhand;
var int Lerne_Zweihand;

instance ItWr_EinhandBuch(C_Item)
{
	name = "��������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "����� ��������� �������";
	text[2] = "�����, ����������� ���������";
	text[3] = "�������� ���������� �������.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseEinhandBuch;
};
func void UseEinhandBuch()
{
	var int nDocID;
	if(Lerne_Einhand == FALSE)
	{
		B_RaiseFightTalent(self,NPC_TALENT_1H,5);
		Print(PRINT_Learn1H);
		Lerne_Einhand = TRUE;
		Snd_Play("Levelup");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ��������� �������");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ������ ���������� �� ������ ���������� ����, ������ ��������, � ������ ������������ ��������. � ������� ������� ����� ������ ��� ������������ ������ ������ �������, ����������� ��������� ����� ��������. ����� �������, ����� ����������� ����� ���, ��������������   ������������ �� ����, � �������� �������� ��. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��������, ����� ��������� �����, ������������ ������� - ��� ���� ���������� ������� � ��� �����. ��� ����� ��������� ����� �������� ��������� ���� � � �� �� ����� ������ ������������ ������, �� ������� ����� �������� ����������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

instance ItWr_ZweihandBuch(C_Item)
{
	name = "������� ���";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 5000;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������� �����";
	text[2] = "�����, ����������� ���������";
	text[3] = "�������� ��������� �������.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseZweihandBuch;
};
func void UseZweihandBuch()
{
	var int nDocID;
	if(Lerne_Zweihand == FALSE)
	{
		B_RaiseFightTalent(self,NPC_TALENT_2H,5);
		Print(PRINT_Learn2H);
		Lerne_Zweihand = TRUE;
		Snd_Play("Levelup");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������� �����");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���������� ���������� ������ ��� ������ ���������� ������ - �����, ������������ �������� �������, ����������� ���������� ����� � ��������� ���������� �������� ���� ����������. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_BookHeadline);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"����������� ������ ����� ������ �������� ��������� ����������, ��� ���� ����������� ����������� ���������� � ������� ��������� ����� ����������� ����������� �������.    ");
	Doc_Show(nDocID);
};

//**************************************** �����  ****************
var int open_once_ITWR_1book;
var int open_once_ITWR_2book;
var int open_once_ITWR_3book;
var int open_once_ITWR_4book;
var int open_once_ITWR_5book;
var int open_once_ITWR_6book;
var int open_once_ITWR_7book;
var int open_once_ITWR_8book;
var int open_once_ITWR_9book;
var int open_once_ITWR_10book;
var int open_once_ITWR_11book;
var int open_once_ITWR_12book;
var int open_once_ITWR_13book;
var int open_once_ITWR_14book;
//1
instance ITWR_1book(C_Item)
{
	name = "� ����� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "(�� ����������� ������� ���������� �����)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use1book;
};

func void Use1book()
{
	if(open_once_ITWR_1book == FALSE)
	{
		B_GivePlayerXP(200);
		open_once_ITWR_1book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_1_ORudah.TGA",1);
	Doc_Show(nDocID);
};

//2
instance ITWR_2book(C_Item)
{
	name = "���� ����������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "(�� ����������� ������� ���������� �����)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use2book;
};
func void Use2book()
{
	if(open_once_ITWR_2book == FALSE)
	{
		B_GivePlayerXP(300);
		open_once_ITWR_2book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_02_RudaMag.TGA",1);
	Doc_Show(nDocID);
};
//3
instance ITWR_3book(C_Item)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "��� ����� � ��������� � ������.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use3book;
};
func void Use3book()
{
	if(open_once_ITWR_3book == FALSE)
	{
		B_GivePlayerXP(300);
		open_once_ITWR_3book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_03_Hran.TGA",1);
	Doc_Show(nDocID);
};

//4
instance ITWR_4book(C_Item)
{
	name = "������� �������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPNEW";
	description = name;
	text[3] = "���������� �������:";
	count[3] = 2;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use4book_00;
	on_state[1] = Use4book_01;
};
var int Gard_nDocID;
func void Use4book_00()
{
	if(open_once_ITWR_4book == FALSE)
	{
		B_GivePlayerXP(150);
		open_once_ITWR_4book = TRUE;
	};
	Gard_nDocID = Doc_Create();
	Doc_SetPages(Gard_nDocID,1);
	Doc_SetPage(Gard_nDocID,0,"RedBook_DS_04_01_Gard.TGA",1);
	Doc_Show(Gard_nDocID);
};
func void Use4book_01()
{
	Doc_SetPages(Gard_nDocID,1);
	Doc_SetPage(Gard_nDocID,0,"RedBook_DS_04_02_Gard.TGA",1);
};
//5
instance ITWR_5book(C_Item)
{
	name = "�� �������� ���������, ������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use5book;
	inv_rotx = -90;
};
func void Use5book()
{
	if(open_once_ITWR_5book == FALSE)
	{
		B_GivePlayerXP(400);
		open_once_ITWR_5book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_05_Shirsh.TGA",1);
	Doc_Show(nDocID);
};
//6
instance ITWR_6book(C_Item)
{
	name = "��� ���� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[1] = "(�������������� �������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use6book;
};
func void Use6book()
{
	if(open_once_ITWR_6book == FALSE)
	{
		B_GivePlayerXP(300);
		open_once_ITWR_6book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_06_OkoInnos.TGA",1);
	Doc_Show(nDocID);
};

//7
instance ITWR_7book(C_Item)
{
	name = "�������� � �������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "(������� ���������� ������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use7book;
};
func void Use7book()
{
	if(open_once_ITWR_7book == FALSE)
	{
		B_GivePlayerXP(300);
		open_once_ITWR_7book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_07_Gotfrid.TGA",1);
	Doc_Show(nDocID);
};

//8
instance ITWR_8book(C_Item)
{
	name = "���� ������ ����� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �����";
	text[3] = "(������� ��� ����������� ����� ����)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use8book;
};
func void Use8book()
{
	if(open_once_ITWR_8book == FALSE)
	{
		B_GivePlayerXP(300);
		open_once_ITWR_8book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_08_OsnoviMagii.TGA",1);
	Doc_Show(nDocID);
};

//9
instance ITWR_9book(C_Item)
{
	name = "���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "(������� ��� ���������� ����� ����� ����)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use9book;
};
func void Use9book()
{
	if(open_once_ITWR_9book == FALSE)
	{
		B_GivePlayerXP(400);
		open_once_ITWR_9book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_09_PutSveta.TGA",1);
	Doc_Show(nDocID);

};

//10
instance ITWR_10book(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "(������� ��� ����������� ����� ����� ����)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use10book;
};
func void Use10book()
{
	if(open_once_ITWR_10book == FALSE)
	{
		B_GivePlayerXP(500);
		open_once_ITWR_10book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_10_Artefacts.TGA",1);
	Doc_Show(nDocID);
};

//11
instance ITWR_11book(C_Item)
{
	name = "������ � ������ ����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "(������� ��� ������ ����� ����� ����)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use11book;
};
func void Use11book()
{
	if(open_once_ITWR_11book == FALSE)
	{
		B_GivePlayerXP(600);
		open_once_ITWR_11book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_11_Obryad.TGA",1);
	Doc_Show(nDocID);
};

//12
instance ITWR_12book(C_Item)
{
	name = "��������� �������� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPNEW";
	description = name;
	text[1] = "(���������� �� ������������ ����������)";
	text[3] = "���������� �������:";
	count[3] = 2;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use12book;
	on_state[1] = Use12book_01;
};
var int Book12_ID;
func void Use12book()
{
	if(open_once_ITWR_12book == FALSE)
	{
		B_GivePlayerXP(250);
		open_once_ITWR_12book = TRUE;
	};
	Book12_ID = Doc_Create();
	Doc_SetPages(Book12_ID,1);
	Doc_SetPage(Book12_ID,0,"RedBook_DS_12_Manuscript.TGA",1);
	Doc_Show(Book12_ID);
};
func void Use12book_01()
{
	Doc_SetPages(Book12_ID,1);
	Doc_SetPage(Book12_ID,0,"RedBook_DS_12_Manuscript_02.TGA",1);
};
//13
instance ITWR_13book(C_Item)
{
	name = "����-��� ������, ��� ������ ����-����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[3] = "(������ �������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use13book;
};
func void Use13book()
{
	if(open_once_ITWR_13book == FALSE)
	{
		B_GivePlayerXP(250);
		open_once_ITWR_13book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_13_KorNak.TGA",1);
	Doc_Show(nDocID);
};

//14
instance ITWR_14book(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use14book;
};
func void Use14book()
{
	if(open_once_ITWR_14book == FALSE)
	{
		B_GivePlayerXP(150);
		open_once_ITWR_14book = TRUE;
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_14_Beglets.TGA",1);
	Doc_Show(nDocID);
};

// �������� ����� ���� - ��� - �������� �� ������ !!! ******************

instance ITWr_palfromhunt(C_Item)
{
	name = "�������� ��������� �� ���������"; 
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION; 
	value = 0; 
	visual = "ItWr_Scroll_01.3DS"; 
	material = MAT_LEATHER;
	on_state[0] = Use_palfromhunt;
	scemeName = "MAP";
	description = name;
};
func void Use_palfromhunt()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters_new.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"  ����� ������, �������� �����, �,");
	Doc_PrintLine(nDocID,0,"  ���������� ����� �����, ��������� �");
	Doc_PrintLine(nDocID,0,"  ���: ��������� ���� ����, ���� ");
	Doc_PrintLine(nDocID,0,"  ������ �� ����� ��������� � ��������");
	Doc_PrintLine(nDocID,0,"  ����������� ������ �������, �������");
	Doc_PrintLine(nDocID,0,"  �����! ������� ����� � �����, ���");
	Doc_PrintLine(nDocID,0,"  ���� ���������� ������ �� ����������� �");
	Doc_PrintLine(nDocID,0,"  ����  � �������� ������� � ");
	Doc_PrintLine(nDocID,0,"  ���� ���������� ��������. ");
	Doc_PrintLine(nDocID,0,"  ���� ����� �� ����������, ��� �����");
	Doc_PrintLine(nDocID,0,"  ����������� �� ���� �������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  ������, ���������� ����� �����");	
	Doc_Show(nDocID);
};

// �������� �� ����� ���������

instance ITWr_todorfromtimon(C_Item)
{
	name = "�������� ���������"; 
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION; 
	value = 0; 
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_todorfromtimon;
	scemeName = "MAP";
	description = name;
};
func void Use_todorfromtimon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters_new.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"�� ������ �������� � ���� ������� ����������");
	Doc_PrintLine(nDocID,0,"�������� �� ������ � ������. ������ ��");
	Doc_PrintLine(nDocID,0,"������ ������� ����� � �������� ���� ������");
	Doc_PrintLine(nDocID,0,"�� ��� ��������� �����! ��� ����������� �");
	Doc_PrintLine(nDocID,0,"��������� ����� �������� � ��� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������� ��������� �����");	
	Doc_Show(nDocID);
};

// ������ ��������� �� ����� (����������)
instance ITWR_FAKEPALADIN(C_Item)
{
	name = "������������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_FAKEPALADIN;
	scemeName = "MAP";
	description = "���������� �������� ���������";
	text[2] = "��� ������ �����������.";
};
func void use_itwr_FAKEPALADIN()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"dragon_letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     ");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"     xx   ");
	Doc_PrintLine(nDocID,0,"        ");
	Doc_PrintLine(nDocID,0,"        ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"        ");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWr_grassnote(C_Item)
{
	name = "������ ����"; 
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION; 
	value = 0; 
	visual = "ItWr_Scroll_01.3DS"; 
	material = MAT_LEATHER;
	on_state[0] = Use_grassnote;
	scemeName = "MAP";
	description = name;
};
func void Use_grassnote()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"������ ������������ (���������������)");
	Doc_PrintLine(nDocID,0,"1 �������� ������");
	Doc_PrintLine(nDocID,0,"4 ������� �����");
	Doc_PrintLine(nDocID,0,"1 ����� �������");
	Doc_PrintLine(nDocID,0,"6 ������ ������");
	Doc_PrintLine(nDocID,0,"2 ����� ����");
	Doc_PrintLine(nDocID,0,"3 ������ ���������");	
	Doc_Show(nDocID);
};

//16   � ������ ����������
instance ITWR_16book(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "����� ���������� ����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use16book;
};

func void Use16book()
{
	Read_DS_Traktat = TRUE;
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_16_Posoh.TGA",1);
	Doc_Show(nDocID);	
};

// ����� ��

instance ItWr_Angry_Soul(C_Item)
{
	name = "������ �������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_Angry_Soul;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
};
func void Use_Angry_Soul()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ������ �� ����, � ������ �������� �����, � ������ ������ ���������� ������� ������� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
}; 

instance ItWr_Smile_Lot(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Smile_Lot;
	scemeName = "MAP";
	description = name;
};
func void Use_Smile_Lot()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters_new.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ������ ������,");
	Doc_PrintLines(nDocID,0,"�������� ��� ���.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

//������������� �������(1)

instance ITWR_Bloodbook_01(C_Item)
{
	name = "������������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_06.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseBloodbook_01;
};
func void UseBloodbook_01()
{	
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_100_Bloodbook_01.TGA",1);
	Doc_Show(nDocID);
};

//������������� �������(2)

instance ITWR_Bloodbook_02(C_Item)
{
	name = "������������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_06.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseBloodbook_02;
};
func void UseBloodbook_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"RedBook_DS_100_Bloodbook_02.TGA",1);
	Doc_Show(nDocID);
};

instance ItWr_KarAKam_UluMulu(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_KarAKam_UluMulu;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ���-����";
};
func void Use_KarAKam_UluMulu()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"��� ���-����");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ��������:");
	Doc_PrintLines(nDocID,0,"��� �������� ������� �����");
	Doc_PrintLines(nDocID,0,"� ��� ��� ������ �����");
	Doc_PrintLines(nDocID,0,"���� �������� ������� - 6");
	Doc_PrintLines(nDocID,0,"���� �������� ������");
	Doc_PrintLine(nDocID,0,"� �������� ������� ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};
