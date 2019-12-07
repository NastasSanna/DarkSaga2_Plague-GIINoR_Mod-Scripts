
instance ItSe_ErzFisch(C_Item)
{
	name = "Рыба-шар";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ErzFisch;
	description = name;
	text[2] = Text_InThisFish;
};
func void Use_ErzFisch()
{
	B_PlayerFindItem(ItMi_Nugget,1);
};
instance ItSe_GoldFisch(C_Item)
{
	name = "Тяжелая рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_GoldFisch;
	description = name;
	text[2] = Text_InThisFish;
};
func void Use_GoldFisch()
{
	B_PlayerFindItem(ItMi_Gold,50);
};
instance ItSe_Ringfisch(C_Item)
{
	name = "Маленькая рыбка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Ringfisch;
	description = name;
	text[2] = Text_InThisFish;
};
func void Use_Ringfisch()
{
	B_PlayerFindItem(ItRi_Prot_Fire_01,1);
};
instance ItSe_LockpickFisch(C_Item)
{
	name = "Легкая рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_LockpickFisch;
	description = name;
	text[2] = Text_InThisFish;
};
func void Use_LockpickFisch()
{
	B_PlayerFindItem(ItKE_lockpick,3);
};
instance ItSe_GoldPocket25(C_Item)
{
	name = Name_LeatherPurse;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket25;
	description = Name_DS_SkinBag;
	text[2] = "Внутри позванивает несколько монет.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void GoldPocket25()
{
	B_PlayerFindItem(ItMi_Gold,25);
};
instance ItSe_GoldPocket50(C_Item)
{
	name = Name_LeatherPurse;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket50;
	description = Name_DS_SkinBag;
	text[2] = "Этот кошелек полон монет.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void GoldPocket50()
{
	B_PlayerFindItem(ItMi_Gold,50);
};

instance ItSe_GoldPocket100(C_Item)
{
	name = Name_LeatherPurse;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = GoldPocket100;
	description = Name_DS_SkinBag;
	text[2] = "Тяжелый мешочек,";
	text[3] = "полный золотых монет.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void GoldPocket100()
{
	B_PlayerFindItem(ItMi_Gold,100);
};

const int Value_Shell_01 = 30;
const int Value_Shell_02 = 60;
var int Shell_Opener;

func void B_OpenShell()
{
	var int shellomizer;
	shellomizer = Hlp_Random(100);
	Shell_Opener += 1;
	if(Shell_Opener == 1)
	{
		B_PlayerFindItem(ItMi_Addon_WhitePearl,1);
	}
	else if(Shell_Opener == 25)
	{
		B_PlayerFindItem(ItMi_DarkPearl,1);
	}
	else if(shellomizer >= 80)
	{
		B_PlayerFindItem(ItMi_Addon_WhitePearl,1);
	}
	else if(shellomizer >= 55)
	{
		B_PlayerFindItem(ItFo_Addon_Shellflesh,1);
	}
	else if(shellomizer >= 50)
	{
		B_PlayerFindItem(ItMi_Aquamarine,1);
	}
	else if(shellomizer >= 40)
	{
		B_PlayerFindItem(ItMi_Quartz,1);
	}
	else if(shellomizer >= 35)
	{
		B_PlayerFindItem(ItMi_Rockcrystal,1);
	}
	else if(shellomizer >= 25)
	{
		B_PlayerFindItem(ItMi_Sulfur,1);
	}
	else
	{
		B_Say_Overlay(self,self,"$NOTHINGTOGET02");
		AI_PrintScreen(PRINT_NOTHINGTOGET02,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	};
};


instance ItMi_Addon_Shell_01(C_Item)
{
	name = "Створчатый моллюск";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shell_01;
	visual = "ItMi_Shell_01.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Shell_01;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
func void Use_Shell_01()
{
	B_OpenShell();
};
instance ItMi_Addon_Shell_02(C_Item)
{
	name = "Спиральный моллюск";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shell_02;
	visual = "ItMi_Shell_02.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Shell_02;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
func void Use_Shell_02()
{
	B_OpenShell();
};

instance ItMi_DS_Shell_Vaal(C_Item)
{
	name = "Шкатулка-раковина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1000;
	visual = "ItMi_Shell_01.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_Shell_Vaal;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
func void Use_Shell_Vaal()
{
	Snd_Play("Geldbeutel"); 
	AI_PrintScreen("В шкатулке лежала руна...",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	CreateInvItem(self,ItRu_Skull);
	
};
