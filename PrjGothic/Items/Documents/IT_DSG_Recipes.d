/**************************************************************************

							������� �����
   
  ������ � ����� � ���������. ���-�� ����� ����������� �� ������� ������.
  
  ���� �� ������ ����� ��� ��������� ���� �����.
  ����� �������������� � �������� �������. ������� ����������� � �����
����� � ���������. 3 ����� � ������.
  
 //* NS - ���. 2013
  
***************************************************************************/

const int Value_Recipe_Health_01	= 100;
const int Value_Recipe_Health_02	= 200;
const int Value_Recipe_Health_03	= 400;
const int Value_Recipe_Mana_01		= 100;
const int Value_Recipe_Mana_02		= 200;
const int Value_Recipe_Mana_03		= 400;
const int Value_Recipe_Speed		= 300;

const int Value_Recipe_Perm_Dex		= 2000;
const int Value_Recipe_Perm_Str		= 2000;
const int Value_Recipe_Perm_Health	= 2000;
const int Value_Recipe_Perm_Mana	= 2000;

const int Value_Recipe_TinkturDex_wenig		= 600;
const int Value_Recipe_TinkturDex_besondere	= 900;
const int Value_Recipe_TinkturStr_wenig		= 600;
const int Value_Recipe_TinkturStr_besondere	= 900;

const int Value_Textbook_Botje_01	= 250;
const int Value_Textbook_Botje_02	= 250;
const int Value_TextBook_TinkturStr_wenig	= 200;

const int Value_Recipe_Booze_BullSeed	= 100;
const int Value_Recipe_Booze_GobboSmile	= 100;
const int Value_Recipe_Booze_Berserker	= 100;
const int Value_Recipe_Booze_TrollBooze	= 100;
const int Value_Recipe_Booze_MagicGrog	= 100;
const int Value_Recipe_Booze_Kamikaze	= 100;


// �������� =============================================

prototype P_ITWr_DSG_Recipe(C_Item)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	text[5] = NAME_Value;
};

// �������� =============================================

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Health_01(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Health_01;
	on_state[0] = Use_Recipe_Health_01;
	description = "�������� ��������";
	count[5] = value;
};
func void Use_Recipe_Health_01()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� �������� �������� ��������� 2 �������� ����� � 1 ������� �����. �������� ��������� ����� �����������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"   �������� ��������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�����������:");
	Doc_PrintLines(nDocID,0,"2 �������� �����");
	Doc_PrintLines(nDocID,0,"1 ������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������������ ����� ����������� � ����� � ������������ �� ��������� ���� �� ��������� ����-�������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Health_02(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Health_02;
	on_state[0] = Use_Recipe_Health_02;
	description = "�������� ��������";
	count[5] = value;
};
func void Use_Recipe_Health_02()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� ��������� ��������� ��������� 2 �������� �������� � 1 ������� �����. �������� ��������� ����� �������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,70,1);
	Doc_PrintLine(nDocID,0,"   �������� ��������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�����������:");
	Doc_PrintLines(nDocID,0,"2 �������� ��������");
	Doc_PrintLines(nDocID,0,"1 ������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ����� ����������� � ������� �������. ����� ������ ����� ����-������� �������.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Health_03(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Health_03;
	on_state[0] = Use_Recipe_Health_03;
	description = "�������� �������";
	count[5] = value;
};
func void Use_Recipe_Health_03()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� ��������� �������� ��������� 2 �������� ����� � 1 ������� �����. ������� ��������� ����� ���������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_PrintLine(nDocID,0,"    �������� �������");
	Doc_PrintLine(nDocID,0,"    ----------------------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�����������:");
	Doc_PrintLines(nDocID,0,"2 �������� �����");
	Doc_PrintLines(nDocID,0,"1 ������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������� �������� � ������� ��������� ��������� �� ��������� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Mana_01(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Mana_01;
	on_state[0] = Use_Recipe_Mana_01;
	description = "�������� ����";
	count[5] = value;
};
func void Use_Recipe_Mana_01()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� �������� ���� ��������� 2 �������� ������� � 1 ������� �����. �������� ��������� ����� �����������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_PrintLine(nDocID,0,"      ~ �������� ���� ~");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�����������:");
	Doc_PrintLines(nDocID,0,"2 �������� �������");
	Doc_PrintLines(nDocID,0,"1 ������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������������� ������� ���������� �� ��������� ���� �� ��������� ����������� ������ ������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Mana_02(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Mana_02;
	on_state[0] = Use_Recipe_Mana_02;
	description = "�������� ����";
	count[5] = value;
};
func void Use_Recipe_Mana_02()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� ��������� ���� ��������� 2 �������� ����� � 1 ������� �����. �������� ��������� ����� �������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,80,80,80,80,1);
	Doc_PrintLine(nDocID,0,"     �������� ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�����������:");
	Doc_PrintLine(nDocID,0,"2 �������� �����");
	Doc_PrintLine(nDocID,0,"1 ������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"~~~~~~~~~~~~~~~~~~~~~~~");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� �������� ����� ������� �� ��������� �������� ������������ ������ �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Mana_03(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Mana_03;
	on_state[0] = Use_Recipe_Mana_03;
	description = "������� ����";
	count[5] = value;
};
func void Use_Recipe_Mana_03()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� �������� ���� ��������� 2 �������� ����� � 1 ������� �����. ������� ��������� ����� ���������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_PrintLine(nDocID,0,"      ������� ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�����������:");
	Doc_PrintLines(nDocID,0,"2 �������� �����");
	Doc_PrintLines(nDocID,0,"1 ������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����������� �� ������������ ��������� � ���������� �� ����� ���������� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Speed(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Speed;
	on_state[0] = Use_Recipe_Speed;
	description = "����� ���������";
	count[5] = value;
};
func void Use_Recipe_Speed()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"����� ��������� �������� �������� ��������. �����������: 1 �������-�����, 1 ������� �����. ��������� ����� �������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,60,70,60,70,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� �� ������ �������-����� ��������� �� ��������� ����� �������� �������� ��������. ����������������� ������� �� ������ ������������ ����������� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"��������!");
	Doc_PrintLines(nDocID,0,"����� ����� ����������� ������ ����� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������-����� ��������� �� ������ � ����� ����� �������, ���� ������� ����� ���������� � �������� �����. ����� ��������� ��� ������ ����������� � ����� �� ��������. ������� ����� ���������� ������� � ������� �� ����� ��������.");
	Doc_Show(nDocID);
};

// ���������� ===========================================

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Perm_Dex(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Perm_Dex;
	on_state[0] = Use_Recipe_Perm_Dex;
	description = "����� ��������";
	count[5] = value;
};
func void Use_Recipe_Perm_Dex()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� ����� �������� ��������� 1 ����� ������� � 1 ������� ������. ���������� �����, ��� ���������� ������� ������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_Perm_Dex.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_BigBlob.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Big);
	Doc_SetMargins(nDocID,-1,90,60,80,70,1);
	Doc_PrintLine(nDocID,0,"     ����� ��������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�����������:");
	Doc_PrintLines(nDocID,0,"1 ����� �������");
	Doc_PrintLines(nDocID,0,"1 ������� ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����������� ������� ������ � ������ ������� �����. ����� ������� ������� �������� ����� ������� � ������ ����������. ����� ������� ��������� ����� ����� �����������.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Perm_Str(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Perm_Str;
	on_state[0] = Use_Recipe_Perm_Str;
	description = "����� ����";
	count[5] = value;
};
func void Use_Recipe_Perm_Str()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� ����� ���� ��������� 1 �������� ������ � 1 ������� ������. ���������� �����, ��� ���������� ������� ������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_Perm_Str.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_White.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Big);
	Doc_SetMargins(nDocID,-1,70,70,70,70,1);
	Doc_PrintLine(nDocID,0,"         ����� ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���������� ���� ����� ��������� �� ����� �������� ������ � ����� ���������� �����. ������� ������ �������������� ��� ������. �������� ������ ������� ������ �������. �������� �� ����������. ������� ����� ��������� �������������.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Perm_Health(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Perm_Health;
	on_state[0] = Use_Recipe_Perm_Health;
	description = "����� �����";
	count[5] = value;
};
func void Use_Recipe_Perm_Health()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� ����� ����� ��������� 1 �������� ������ � 1 ������� ������. ���������� �����, ��� ���������� ������� ������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_Perm_Health.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_Perm_Health.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Big);
	Doc_SetMargins(nDocID,-1,90,70,80,60,1);
	Doc_PrintLine(nDocID,0,"       ����� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"      ������� ������");
	Doc_PrintLine(nDocID,0,"      �������� ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������������ ������� ������ ��������� � �������� ������ � ������ ���������� �� ������� ����. ����� � ���� ��� ��������� ������ ���������.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_Perm_Mana(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_Perm_Mana;
	on_state[0] = Use_Recipe_Perm_Mana;
	description = "����� ����";
	count[5] = value;
};
func void Use_Recipe_Perm_Mana()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"��� ������������� ����� ���� ��������� 1 �������� ������ � 1 ������� ������. ���������� �����, ��� ���������� ������� ������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_Perm_Mana.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_BlueBottom.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Big);
	Doc_SetMargins(nDocID,-1,85,100,85,100,1);
	Doc_PrintLine(nDocID,0,"       ����� ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����������� 1 ������� ������. �������� ������ ������ �������, ����� �� ������� ���. ��������� � ������� �� �������. ����� �������������� ����.");
	Doc_PrintLines(nDocID,0,"����� �� ������ ���� ������!");
	Doc_Show(nDocID);
};

// ����� ����� ==========================================

// ------------------------------------------------------
instance ITWr_DSG_Recipe_TinkturDex_wenig(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_TinkturDex_wenig;
	on_state[0] = Use_Recipe_TinkturDex_wenig;
	description = "�������� ��������";
	count[5] = value;
};
func void Use_Recipe_TinkturDex_wenig()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_wenig] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_wenig] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"�������� �������� �������� �������� ��������. �����������: 1 ������ ���� � 1 ���������. ��������� ����� �������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_TinkturDex_wenig.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_Wave.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,50,40,60,40,1);
	Doc_PrintLine(nDocID,0,"    �������� ��������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ����, �������� ��� �� ����, ������������ ��� ���������� ��� ������������� ��������� ��������. �� ������� ����� ���������� �������������� ��������� ����������. ��������� �������������� �������, ������� ������������ �������� � �������� ����. ������ ���� ��������� �������, �������� ��������� � ������ ����������� � ������� 5-10 �����. ����� ���� ��������� � ��������. ������������ ��� ������ ���� ����������, � �� � ���� ������ �� ������. ��������� ��������, ��� �� ����� �� ��� ��������� �������������.");
	Doc_PrintLines(nDocID,0,"���������� �������� ������������ � �������� ����������, ��������� ��������� �� ��������� ����� �������� ��������.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_TinkturDex_besondere(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_TinkturDex_besondere;
	on_state[0] = Use_Recipe_TinkturDex_besondere;
	description = "������ �������� ��������";
	count[5] = value;
};
func void Use_Recipe_TinkturDex_besondere()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_besondere] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturDex_besondere] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"������ �������� �������� �������� �������� ��������. �����������: 1 �������� ������, 1 ���������. ��������� ����� �������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_TinkturDex_besondere.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_Scroll.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,40,70,40,1);
	Doc_PrintLines(nDocID,0," ������� �������� ��������� ��������� �� ��������� ������ ������� ����������� �������� �������� ��������. �������� ��������� �� ��������� �����, ������ � ��������� ������������ � ������ ����. ��� ������������� �������� �������� ������ ���������� ������ � �����������. ����� ������ ��������� (�� ������ ����������� � ����� ������), ��� ����� �������� � ������. ");
	Doc_PrintLines(nDocID,0," �������� ������ �������� ����� �� ����� ���������� �������, ������, � ����� ���������� � �� �������. ��� ������ ��������� ����� ������������� �������� ��� ����������, ����� �� ���������� �������� �� ������� ��� �������� ����� ��������.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_TinkturStr_wenig(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_TinkturStr_wenig;
	on_state[0] = Use_Recipe_TinkturStr_wenig;
	description = "�������� �����";
	count[5] = value;
};
func void Use_Recipe_TinkturStr_wenig()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_wenig] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_wenig] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"�������� ����� �������� �������� ����. �����������: 1 ��������� ���, 1 ���������. ��������� ����� �������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_TinkturStr_wenig.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_Half.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Small);
	Doc_SetMargins(nDocID,-1,70,70,70,60,1);
	Doc_PrintLine(nDocID,0,"            �������� �����");
	Doc_PrintLines(nDocID,0,"������ ��� ���������� ��������� ��� ��������� � ������������ ��������� ���������� � ������ ������ ���������� �����. �������� ����������������� �����, ������� ����������� ����� � ��������� �����. ��������� ������ ����� ��� ��������� ���������� �������.");
	Doc_Show(nDocID);
};

// ------------------------------------------------------
instance ITWr_DSG_Recipe_TinkturStr_besondere(P_ITWr_DSG_Recipe)
{
	value = Value_Recipe_TinkturStr_besondere;
	on_state[0] = Use_Recipe_TinkturStr_besondere;
	description = "������ �������� �����";
	count[5] = value;
};
func void Use_Recipe_TinkturStr_besondere()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_besondere] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturStr_besondere] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"������ �������� ����� �������� �������� ����. �����������: 1 ������, 1 ���������. ��������� ����� �������.");
	};
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
//	Doc_SetPage(nDocID,0,"Recipe_TinkturStr_besondere.TGA",0);
	Doc_SetPage(nDocID,0,"Recipe_Blank_SmallBlob.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,100,80,100,70,1);
	Doc_PrintLine(nDocID,0,"  ������ �������� �����");
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0," ������ � �������� ��������� ���������� ������, ���������� ������� �������� ������, ���������� ���� ����� ������� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0," ��� �� ������������� ������������ �������� ������, � ����� ���������. �� ������ �������� ������������ � ����� ���� � ������������ � ����� � ������ � ���������� �����. ��� ���� �������� � ����, ��� ����� ��������� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0," ������� ����� �������� ����� ������� ������.");
	Doc_Show(nDocID);
};

// ����� � ��������� ====================================

// ������ ����� ����� �������� 1 ������
prototype P_ITWr_DSG_Textbook_Botje(C_ITEM)
{
	name = "�������� �������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	visual = "ItWr_Book_02_03.3ds";	//������� �����
	material = MAT_LEATHER;
	scemeName = "MAP";
	text[2] = "����� ��������� �������.";
	text[5] = NAME_Value;
};

// ------------------------------------------------------
instance ITWr_DSG_Textbook_Botje_01(P_ITWr_DSG_Textbook_Botje)
{
	value = Value_Textbook_Botje_01;
	on_state[0] = Use_Textbook_Botje_01;
	description = "�������� �������� ����� (������)";
	text[3] = "������ �������� ���.";
	count[5] = value;
};
func void Use_Textbook_Botje_01()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/* BOOK PICTURE
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"TextBook_Botje_part1.TGA",0);
	Doc_Show(nDocID);
	/*/
	Read_Book = Read_Book_Botje_01;
	Read_Book_Page = 0;
	Read_Book_nDocID = Doc_Create();
	Doc_Show(Read_Book_nDocID);
	AI_ProcessInfos(self);
	//*/
};

// ------------------------------------------------------
instance ITWr_DSG_Textbook_Botje_02(P_ITWr_DSG_Textbook_Botje)
{
	value = Value_Textbook_Botje_02;
	on_state[0] = Use_Textbook_Botje_02;
	description = "�������� �������� ����� (�����)";
	text[3] = "������ �������� ���.";
	count[5] = value;
};
func void Use_Textbook_Botje_02()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/* BOOK PICTURE
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"TextBook_Botje_part2.TGA",0);
	Doc_Show(nDocID);
	/*/
	Read_Book = Read_Book_Botje_02;
	Read_Book_Page = 0;
	Read_Book_nDocID = Doc_Create();
	Doc_Show(Read_Book_nDocID);
	AI_ProcessInfos(self);
	//*/
};

// ------------------------------------------------------
// �� ����� �������� ������ � �������� �����
instance ITWr_DSG_TextBook_TinkturStr_wenig(C_ITEM)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = Value_TextBook_TinkturStr_wenig;
	visual = "ItWr_Book_02_02.3ds";	//���������� �����
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_TextBook_TinkturStr_wenig;
	description = "������� ��������";
	text[5] = NAME_Value;			count[5] = value;
};

var int TinkturStr_wenig_GivenOnce;
func void Use_TextBook_TinkturStr_wenig()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	if(TinkturStr_wenig_GivenOnce == FALSE)
	{
		TinkturStr_wenig_GivenOnce = TRUE;
		Snd_Play("LogEntry");
		B_PlayerFindItem(ITWr_DSG_Recipe_TinkturStr_wenig, 1);
	};
	/* BOOK PICTURE
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,-1,"TextBook_TinkturStr_wenig.TGA",0);
	Doc_Show(nDocID);
	/*/
	Read_Book = Read_Book_TinkturStr_wenig;
	Read_Book_Page = 0;
	Read_Book_nDocID = Doc_Create();
	Doc_Show(Read_Book_nDocID);
	AI_ProcessInfos(self);
	//*/
};


// ������� ������� ======================================
// UNFINISHED
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_BullSeed(P_ITWr_DSG_Recipe)
{
	description = "����� ����";
	value = Value_Recipe_Booze_BullSeed;
	on_state[0] = Use_Recipe_Booze_BullSeed;
	count[5] = value;
};
func void Use_Recipe_Booze_BullSeed()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_BullSeed] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_BullSeed] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"����� ����");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_GobboSmile(P_ITWr_DSG_Recipe)
{
	description = "������ �������";
	value = Value_Recipe_Booze_GobboSmile;
	on_state[0] = Use_Recipe_Booze_GobboSmile;
	count[5] = value;
};
func void Use_Recipe_Booze_GobboSmile()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_GobboSmile] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_GobboSmile] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"������ �������");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_Berserker(P_ITWr_DSG_Recipe)
{
	description = "���������";
	value = Value_Recipe_Booze_Berserker;
	on_state[0] = Use_Recipe_Booze_Berserker;
	count[5] = value;
};
func void Use_Recipe_Booze_Berserker()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_Berserker] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_Berserker] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"���������");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_TrollBooze(P_ITWr_DSG_Recipe)
{
	description = "��������� �����";
	value = Value_Recipe_Booze_TrollBooze;
	on_state[0] = Use_Recipe_Booze_TrollBooze;
	count[5] = value;
};
func void Use_Recipe_Booze_TrollBooze()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_TrollBooze] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_TrollBooze] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"��������� �����");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_MagicGrog(P_ITWr_DSG_Recipe)
{
	description = "���������� ����";
	value = Value_Recipe_Booze_MagicGrog;
	on_state[0] = Use_Recipe_Booze_MagicGrog;
	count[5] = value;
};
func void Use_Recipe_Booze_MagicGrog()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_MagicGrog] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_MagicGrog] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"���������� ����");
	Doc_Show(nDocID);
};
// ------------------------------------------------------
instance ITWr_DSG_Recipe_Booze_Kamikaze(P_ITWr_DSG_Recipe)
{
	description = "���������";
	value = Value_Recipe_Booze_Kamikaze;
	on_state[0] = Use_Recipe_Booze_Kamikaze;
	count[5] = value;
};
func void Use_Recipe_Booze_Kamikaze()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	/*
	if(PLAYER_TALENT_ALCHEMY[POTION_Booze_Kamikaze] == FALSE)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Booze_Kamikaze] = TRUE;
		Snd_Play("LevelUP");
		B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"");
	};
	//*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_DSG_Handwrite_Medium);
	Doc_SetMargins(nDocID,-1,70,80,70,80,1);
	Doc_PrintLine(nDocID,0,"���������");
	Doc_Show(nDocID);
};


