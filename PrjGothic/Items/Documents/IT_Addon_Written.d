
instance ITWr_Addon_Health_04(C_Item)
{
	name = "������ ��������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "������ ��������";
	text[2] = "��� ������������� ����� �������� �����";
	text[3] = "���������� ������ ������� ��������� ��������.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Heilrezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"����� ���������� ����� 1 ������� ����� � 3 �������� ��������.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ��������� �����:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��������� ���� ������� ����� � ��� �������� ��������.");
	Doc_PrintLines(nDocID,0,"���������� � ������ �������� ������� ��������� ��������.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� ����� ������� ������ �������, ������� ������ ��������� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Mana_04(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = "������ ����";
	text[2] = "��� ������������� ����� �������� �����";
	text[3] = "���������� ������ ������� �������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Manarezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"����� ���������� ����� 1 ������� ����� � 3 �������� ����.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ����� ����:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��������� ���� ������� ����� � ��� �������� ����.");
	Doc_PrintLines(nDocID,0,"���������� � ������ �������� ������� �������� ����.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� ����� ������� ������ �������, ������� ������ �������� ����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Joint_01(C_Item)
{
	name = "������� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[0] = "� ������� �������";
};
func void Use_Joint_Rezept_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"������� ���������");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(...) ������ ����� �������� ������, �� � �������� ������ ��� ���������� ��� �� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� � ������ �������� ���� �������� ���� � ������� ������� �����, ��������� ����� � �������� �������� ����������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������� ��������� �������� �� ����� ���� � ����������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name = "������ ������ ��";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 70;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[0] = "������ ������ ��";
	text[4] = Name_Value;
	count[4] = value;
};
func void UseLouRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"������ ������ ��");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����������� ��� ������������� ������:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ������� ����, ��� ������ � ������� �������� �����.");
	Doc_PrintLines(nDocID,0,"�������� ����������� ��� �������� �����.");
	Doc_PrintLines(nDocID,0,"��������� ��� � �������, �������� ���� � ����������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������, ������������ ��� ���� ������, ������������, ��� ����� �� ������ ����������� ����� �����!");
	Doc_Show(nDocID);
	if(C_ds_Knows_Lou_Rezept == FALSE)
	{ C_ds_Knows_Lou_Rezept = TRUE;
	};
};

instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "������ �������� ������ ��";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[0] = "������ �������� ������ ��";
	text[4] = Name_Value;
	count[4] = value;
};
func void UseLouRezept2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"������� ����� ��");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ����� �� � ���������� ��� ��� ���.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ������� �������� ����������� ������ ����� ������� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� �� ��� ��������� ��������, �� ������� ��������� � ���� �������� �����.");
	Doc_Show(nDocID);
	if(C_ds_Knows_Lou_Rezept2 == FALSE)
	{ C_ds_Knows_Lou_Rezept2 = TRUE;
	};
};

instance ITWr_Addon_Piratentod(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[0] = "������ ������� �������.";
	text[4] = Name_Value;
	count[4] = value;
};
func void UseRezeptPiratentod()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"������� �������");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����� ��� ��������� ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ������, ���������� ������� ����. �������� ������� ���� � ������ ����.");
	Doc_PrintLines(nDocID,0,"��� ������ �������� ������ ������, ������ ���� � �������� �����");
	Doc_PrintLines(nDocID,0,"�������������� �������-�����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���������! ��� ����� �������� ����� ������� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
	if(C_ds_Knows_Piratentod == FALSE)
	{ C_ds_Knows_Piratentod = TRUE;
	};
};

instance Fakescroll_Addon(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "���������� ������������ ����������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[0] = "���������� ������������ ������� ������� ������.";
};
func void UseAxtAnleitung()
{
	var int nDocID;
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		Knows_Banditenaxt = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"���������� �����");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"���������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ����� ����� �������� �����, �������� � �������� ���������� ����.");
	Doc_PrintLines(nDocID,0,"���������� ��� ����� ����������� ����� �����.");
	Doc_PrintLines(nDocID,0,"���� ����� ���� � ��� ���� �����, �������� ��� ��������� �� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"��������� ���� � ���� ������ �� ������ �� ����������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����� ����� ����� ����� � ������� ������������ ����.");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};

