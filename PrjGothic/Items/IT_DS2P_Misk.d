

//������
instance ItMi_FishingRod(C_Item)
{
	name 			= "������";description = name;
	mainflag 	= ITEM_KAT_NONE;	flags 		= ITEM_MULTI;
	value 		= 10;
	visual 		= "FishingRod_DSG.3ds";
	material 	= MAT_WOOD;	
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
instance ItMi_DS2P_FakeAmulet(C_Item)		//���� �������
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
	name 		= "�����";
	mainflag 	= ITEM_KAT_NONE;
	visual = "ItMi_Flask.3ds";
	material = MAT_METAL;
	description = "����� �������";
	text[1] = "������� ����������� � ��� ����";
};
instance ItMi_DS2P_HuntersHead(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS"; //UNFINISHED - ��������
	material = MAT_LEATHER;
	description = name;
	text[1] = "������������ ������ �� ���������";
	text[2] = "������ ��� � �� ���������, ���� ������";
};
instance ItMi_DS2P_HuntersHead_SelfMade(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS"; //UNFINISHED - ��������
	material = MAT_LEATHER;
	description = name;
	text[1] = "������������ ������ �� ���������";
	text[2] = "��������";
};
instance ItMi_DS2P_HuntersHead_SelfMade_Illusion(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS"; //UNFINISHED - ��������
	material = MAT_LEATHER;
	description = name;
	text[1] = "������������ ������ �� ���������";
	text[2] = "��������, ������ ������� �� ��� �������";
};
instance ItMi_DS2P_JinnsColorChest(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_JeweleryChest;
	visual = "ItMi_JeweleryChest.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "����� ��������� ��������� ��������";
};
/*----------------------------------------------------------------------*/
// ������� ��� ����� (�� ������������)
// ��� ������ "���������� �����"
/*----------------------------------------------------------------------*/
instance ItMi_DS2P_SamogonForJorn(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	description = "������� �� ������������";
	text[1] = "���� ���� ���, ��� ������ ���,";
	text[2] = "����� �������� ����� �������.";
};
/*----------------------------------------------------------------------*/
// ���� ����
// ��� ������ "������� �������"
/*----------------------------------------------------------------------*/
instance ItMi_DS2P_TomHorn(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Broom;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_METAL;
	scemeName = "HORN";
	on_state[0] = Use_TomHorn;
	description = "���� ����";
	text[1] = "� ������� ����� ���� ����� �������� ��������.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_TomHorn()
{
	//UNFINISHED
};

