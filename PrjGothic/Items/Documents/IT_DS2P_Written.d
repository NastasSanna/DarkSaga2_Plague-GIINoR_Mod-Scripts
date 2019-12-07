/*����� ������� (�������� � ������� � ��������)*/
instance ItWr_DS2P_Map_Bauer(C_Item)
{
  name = "�����";
  mainflag = ITEM_KAT_DOCS;
  flags = ITEM_MULTI;
  value = 500;
  visual = "ItWr_Map_01.3DS";
  material = MAT_LEATHER;
  scemeName = "MAP";
  on_state[0] = Use_DS2P_Map_Bauer;
  description = "����� �������";
  text[0] = "��� ����� ���������";
	text[1] = "� ������ ��������.";
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
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_DS2P_Map_Tamir;
	description = "����� �������";
	text[1] = "��� ����� ��� ��� �����.";
	text[2] = "�� ��� �������� ����� �������� ������� ������.";
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
// ����� � ��������������� ������� ����� �� ������ "��������� �� �����"
instance ItWr_DS2P_ZeddCompromise_Map(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_DS2P_ZeddCompromise_Map;
	description = "����� �������";
	text[1] = "��� ����� � ����� � �����.";
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
	Doc_SetPage(Document,0,"MAP_DS2P_TAMIR.tga",TRUE); // UNFINISHED - ���� �����
	Doc_SetLevel(Document,"World_DS2_Prolog.zen");
	Doc_SetLevelCoords(Document,-17687,31000,74157,-37000);
	Doc_Show(Document);
};
//����� �������� ����-�������
instance ItWr_DS2P_Map_LanSkeleton(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_DS2P_Map_LanSkeleton;
	description = "����� ��������";
	text[1] = "����� ����-�������.";
	text[2] = "�� ��� ��������, ��� ��� ������� ������� ������.";
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
//������ ���������� ��� ����� � ����� � ������
instance ItWr_DS2P_List_Joseph(C_Item)
{
	name = "������"; 
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION; 
	value = 0; 
	visual = "ItWr_Scroll_01.3DS"; 
	material = MAT_LEATHER;
	on_state[0] = Use_DS2P_List_Joseph;
	scemeName = "MAP";
	description = "������ ����������";
	text[1] = "��������� � ���� ��� �����";
	text[2] = "����������� ������ � �������";
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
	Doc_PrintLine(nDocID,0,"������ ���������� � ���");
	Doc_PrintLine(nDocID,0,"��� ����� ����������� ������");
	/* UNFINISHED
	Doc_PrintLine(nDocID,0,"...");
	//*/
	Doc_Show(nDocID);
};
//������� ������� � ������
instance ItWr_DS2P_VatrasNotes(C_Item)
{
	name = "������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "����� ������� ������� �������.";
	text[2] = "� ������� �������� � ����� ������.";
};

//������ ���� ��� ������������� �������������
instance ItWr_DS2P_CimmsIngredients(C_Item)
{
	name = "������"; 
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION; 
	value = 0; 
	visual = "ItWr_Scroll_01.3DS"; 
	material = MAT_LEATHER;
	on_state[0] = Use_DS2P_CimmsIngredients;
	scemeName = "MAP";
	description = "������ ����";
	text[1] = "��� ������������� �������������";
	text[2] = "�� �����.";
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
	Doc_PrintLine(nDocID,0,"3 �������� �������");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"2 �������� �����");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"2 ������ ���");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"1 ������ ����");
	Doc_Show(nDocID);
};
