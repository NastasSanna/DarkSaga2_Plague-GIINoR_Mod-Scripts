/*
const int VALUE_ITMI_BATTLEKOLCHAN = 50;
const int VALUE_ITMI_HUNTERKOLCHAN = 50;
const int VALUE_ITMI_MAGICKOLCHAN = 50;
const int VALUE_ITMI_BATTLEBOLTKOLCHAN = 50;
const int VALUE_ITMI_MAGICBOLTKOLCHAN = 50;

instance ITMI_BATTLEKOLCHAN(C_Item)
{
	name = "Колчан боевых стрел";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_MULTI;
	value = value_itmi_battlekolchan;
	visual = "ItMi_Pocket.3ds";
	scemeName = "ROM";
	material = MAT_LEATHER;
	description = name;
	on_state[0] = use_battlekolchan;
	text[2] = "Пустой";
	text[5] = NAME_Value;
	count[5] = value;
};


var int battlekolchanisfull;
const int ARROW = 0;
const int POISONARROW = 1;
const int FIREARROW = 2;
const int ARMOURPIERCINGARROW = 3;
const int EXPLOSIVEARROW = 6;
const int KILLERARROW = 7;

var int arrowmount[8];

func void use_battlekolchan()
{
	var C_Item rangedWeapon;
	if(BATTLEKOLCHANISFULL == FALSE)
	{
		if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
		{
			rangedWeapon = Npc_GetEquippedRangedWeapon(hero);
		};
		if(Npc_HasItems(self,ItRw_Arrow) > 0)
		{
			ARROWMOUNT[0] = Npc_HasItems(self,ItRw_Arrow);
			Npc_RemoveInvItems(self,ItRw_Arrow,ARROWMOUNT);
		};
		if(Npc_HasItems(self,itrw_addon_poisonarrow) > 0)
		{
			ARROWMOUNT[1] = Npc_HasItems(self,itrw_addon_poisonarrow);
			Npc_RemoveInvItems(self,itrw_addon_poisonarrow,ARROWMOUNT[1]);
		};
		if(Npc_HasItems(self,ItRw_Addon_FireArrow) > 0)
		{
			ARROWMOUNT[2] = Npc_HasItems(self,ItRw_Addon_FireArrow);
			Npc_RemoveInvItems(self,ItRw_Addon_FireArrow,ARROWMOUNT[2]);
		};
		if(Npc_HasItems(self,itrw_addon_armourpiercingarrow) > 0)
		{
			ARROWMOUNT[3] = Npc_HasItems(self,itrw_addon_armourpiercingarrow);
			Npc_RemoveInvItems(self,itrw_addon_armourpiercingarrow,ARROWMOUNT[3]);
		};
		if(Npc_HasItems(self,itrw_addon_explosivearrow) > 0)
		{
			ARROWMOUNT[6] = Npc_HasItems(self,itrw_addon_explosivearrow);
			Npc_RemoveInvItems(self,itrw_addon_explosivearrow,ARROWMOUNT[6]);
		};
		if(Npc_HasItems(self,itrw_addon_killerarrow) > 0)
		{
			ARROWMOUNT[7] = Npc_HasItems(self,itrw_addon_killerarrow);
			Npc_RemoveInvItems(self,itrw_addon_killerarrow,ARROWMOUNT[7]);
		};
		BATTLEKOLCHANISFULL = TRUE;
		itmi_battlekolchan.text[2] = "Колчан полон стрел";
		AI_PrintScreen("Боевые стрелы убраны",20,70,FONT_Screen,2);
	}
	else
	{
		CreateInvItems(self,ItRw_Arrow,ARROWMOUNT);
		CreateInvItems(self,itrw_addon_poisonarrow,ARROWMOUNT[1]);
		CreateInvItems(self,ItRw_Addon_FireArrow,ARROWMOUNT[2]);
		CreateInvItems(self,itrw_addon_armourpiercingarrow,ARROWMOUNT[3]);
		CreateInvItems(self,itrw_addon_explosivearrow,ARROWMOUNT[6]);
		CreateInvItems(self,itrw_addon_killerarrow,ARROWMOUNT[7]);
		BATTLEKOLCHANISFULL = FALSE;
		itmi_battlekolchan.text[2] = "Колчан пуст";
	};
};


instance ITMI_HUNTERKOLCHAN(C_Item)
{
	name = "Колчан охотничьих стрел";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_MULTI;
	value = value_itmi_hunterkolchan;
	visual = "ItMi_Pocket.3ds";
	scemeName = "ROM";
	material = MAT_LEATHER;
	description = name;
	on_state[0] = use_hunterkolchan;
	text[2] = "Пустой";
	text[5] = NAME_Value;
	count[5] = value;
};


var int hunterkolchanisfull;
const int HUNTERARROW = 0;
const int REPTILEARROW = 1;
const int BIGBEASTARROW = 2;
const int TROLLARROW = 3;

var int hunterarrowmount[7];

func void use_hunterkolchan()
{
	var C_Item rangedWeapon;
	if(HUNTERKOLCHANISFULL == FALSE)
	{
		if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
		{
			rangedWeapon = Npc_GetEquippedRangedWeapon(hero);
		};
		if(Npc_HasItems(self,itrw_hunterarrow) > 0)
		{
			HUNTERARROWMOUNT[0] = Npc_HasItems(self,itrw_hunterarrow);
			Npc_RemoveInvItems(self,itrw_hunterarrow,HUNTERARROWMOUNT);
		};
		if(Npc_HasItems(self,itrw_reptilearrow) > 0)
		{
			HUNTERARROWMOUNT[1] = Npc_HasItems(self,itrw_reptilearrow);
			Npc_RemoveInvItems(self,itrw_reptilearrow,HUNTERARROWMOUNT[1]);
		};
		if(Npc_HasItems(self,itrw_bigbeastarrow) > 0)
		{
			HUNTERARROWMOUNT[2] = Npc_HasItems(self,itrw_bigbeastarrow);
			Npc_RemoveInvItems(self,itrw_bigbeastarrow,HUNTERARROWMOUNT[2]);
		};
		if(Npc_HasItems(self,itrw_trollarrow) > 0)
		{
			HUNTERARROWMOUNT[3] = Npc_HasItems(self,itrw_trollarrow);
			Npc_RemoveInvItems(self,itrw_trollarrow,HUNTERARROWMOUNT[3]);
		};
		HUNTERKOLCHANISFULL = TRUE;
		itmi_hunterkolchan.text[2] = "Колчан полон стрел";
		AI_PrintScreen("Охотничьи стрелы убраны",20,70,FONT_Screen,2);
	}
	else
	{
		CreateInvItems(self,itrw_hunterarrow,HUNTERARROWMOUNT);
		CreateInvItems(self,itrw_reptilearrow,HUNTERARROWMOUNT[1]);
		CreateInvItems(self,itrw_bigbeastarrow,HUNTERARROWMOUNT[2]);
		CreateInvItems(self,itrw_trollarrow,HUNTERARROWMOUNT[3]);
		HUNTERKOLCHANISFULL = FALSE;
		itmi_hunterkolchan.text[2] = "Колчан пуст";
	};
};


instance ITMI_MAGICKOLCHAN(C_Item)
{
	name = "Колчан магических стрел";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_MULTI;
	value = value_itmi_magickolchan;
	visual = "ItMi_Pocket.3ds";
	scemeName = "ROM";
	material = MAT_LEATHER;
	description = name;
	on_state[0] = use_magickolchan;
	text[2] = "Пустой";
	text[5] = NAME_Value;
	count[5] = value;
};


var int magickolchanisfull;
const int MAGICARROW = 0;
const int INNOSRETRIBUTIONARROW = 1;
const int VAMPIRARROW = 2;
const int MAGICOREARROW = 4;
const int BLACKOREARROW = 5;
const int ICEARROW = 6;

var int magicarrowmount[7];

func void use_magickolchan()
{
	var C_Item rangedWeapon;
	if(MAGICKOLCHANISFULL == FALSE)
	{
		if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
		{
			rangedWeapon = Npc_GetEquippedRangedWeapon(hero);
		};
		if(Npc_HasItems(self,ItRw_Addon_MagicArrow) > 0)
		{
			MAGICARROWMOUNT[0] = Npc_HasItems(self,ItRw_Addon_MagicArrow);
			Npc_RemoveInvItems(self,ItRw_Addon_MagicArrow,MAGICARROWMOUNT);
		};
		if(Npc_HasItems(self,itrw_innosretributionarrow) > 0)
		{
			MAGICARROWMOUNT[1] = Npc_HasItems(self,itrw_innosretributionarrow);
			Npc_RemoveInvItems(self,itrw_innosretributionarrow,MAGICARROWMOUNT[1]);
		};
		if(Npc_HasItems(self,itrw_addon_vampirarrow) > 0)
		{
			MAGICARROWMOUNT[2] = Npc_HasItems(self,itrw_addon_vampirarrow);
			Npc_RemoveInvItems(self,itrw_addon_vampirarrow,MAGICARROWMOUNT[2]);
		};
		if(Npc_HasItems(self,itrw_addon_magicorearrow) > 0)
		{
			MAGICARROWMOUNT[4] = Npc_HasItems(self,itrw_addon_magicorearrow);
			Npc_RemoveInvItems(self,itrw_addon_magicorearrow,MAGICARROWMOUNT[4]);
		};
		if(Npc_HasItems(self,itrw_addon_blackorearrow) > 0)
		{
			MAGICARROWMOUNT[5] = Npc_HasItems(self,itrw_addon_blackorearrow);
			Npc_RemoveInvItems(self,itrw_addon_blackorearrow,MAGICARROWMOUNT[5]);
		};
		if(Npc_HasItems(self,itrw_addon_icearrow) > 0)
		{
			MAGICARROWMOUNT[6] = Npc_HasItems(self,itrw_addon_icearrow);
			Npc_RemoveInvItems(self,itrw_addon_icearrow,MAGICARROWMOUNT[6]);
		};
		MAGICKOLCHANISFULL = TRUE;
		itmi_magickolchan.text[2] = "Колчан полон стрел";
		AI_PrintScreen("Магические стрелы убраны",20,70,FONT_Screen,2);
	}
	else
	{
		CreateInvItems(self,ItRw_Addon_MagicArrow,MAGICARROWMOUNT);
		CreateInvItems(self,itrw_innosretributionarrow,MAGICARROWMOUNT[1]);
		CreateInvItems(self,itrw_addon_vampirarrow,MAGICARROWMOUNT[2]);
		CreateInvItems(self,itrw_addon_magicorearrow,MAGICARROWMOUNT[4]);
		CreateInvItems(self,itrw_addon_blackorearrow,MAGICARROWMOUNT[5]);
		CreateInvItems(self,itrw_addon_icearrow,MAGICARROWMOUNT[6]);
		MAGICKOLCHANISFULL = FALSE;
		itmi_magickolchan.text[2] = "Колчан пуст";
	};
};


instance ITMI_BATTLEBOLTKOLCHAN(C_Item)
{
	name = "Колчан боевых болтов";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_MULTI;
	value = value_itmi_battleboltkolchan;
	visual = "ItMi_Pocket.3ds";
	scemeName = "ROM";
	material = MAT_LEATHER;
	description = name;
	on_state[0] = use_battleboltkolchan;
	text[2] = "Пустой";
	text[5] = NAME_Value;
	count[5] = value;
};


var int battleboltkolchanisfull;
const int BOLT = 0;
const int POISONBOLT = 1;
const int FIREBOLT = 2;
const int ARMOURPIERCINGBOLT = 3;
const int EXPLOSIVEBOLT = 4;
const int TROLLBOLT = 5;

var int boltmount[6];

func void use_battleboltkolchan()
{
	var C_Item rangedWeapon;
	if(BATTLEBOLTKOLCHANISFULL == FALSE)
	{
		if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
		{
			rangedWeapon = Npc_GetEquippedRangedWeapon(hero);
		};
		if(Npc_HasItems(self,ItRw_Bolt) > 0)
		{
			BOLTMOUNT[0] = Npc_HasItems(self,ItRw_Bolt);
			Npc_RemoveInvItems(self,ItRw_Bolt,BOLTMOUNT);
		};
		if(Npc_HasItems(self,itrw_addon_poisonbolt) > 0)
		{
			BOLTMOUNT[1] = Npc_HasItems(self,itrw_addon_poisonbolt);
			Npc_RemoveInvItems(self,itrw_addon_poisonbolt,BOLTMOUNT[1]);
		};
		if(Npc_HasItems(self,itrw_addon_firebolt) > 0)
		{
			BOLTMOUNT[2] = Npc_HasItems(self,itrw_addon_firebolt);
			Npc_RemoveInvItems(self,itrw_addon_firebolt,BOLTMOUNT[2]);
		};
		if(Npc_HasItems(self,itrw_addon_armourpiercingbolt) > 0)
		{
			BOLTMOUNT[3] = Npc_HasItems(self,itrw_addon_armourpiercingbolt);
			Npc_RemoveInvItems(self,itrw_addon_armourpiercingbolt,BOLTMOUNT[3]);
		};
		if(Npc_HasItems(self,itrw_addon_explosivebolt) > 0)
		{
			BOLTMOUNT[4] = Npc_HasItems(self,itrw_addon_explosivebolt);
			Npc_RemoveInvItems(self,itrw_addon_explosivebolt,BOLTMOUNT[4]);
		};
		if(Npc_HasItems(self,itrw_addon_trollkillerbolt) > 0)
		{
			ARROWMOUNT[5] = Npc_HasItems(self,itrw_addon_trollkillerbolt);
			Npc_RemoveInvItems(self,itrw_addon_trollkillerbolt,BOLTMOUNT[5]);
		};
		BATTLEBOLTKOLCHANISFULL = TRUE;
		itmi_battleboltkolchan.text[2] = "Колчан полон болтов";
		AI_PrintScreen("Боевые болты убраны",20,70,FONT_Screen,2);
	}
	else
	{
		CreateInvItems(self,ItRw_Bolt,BOLTMOUNT);
		CreateInvItems(self,itrw_addon_poisonbolt,BOLTMOUNT[1]);
		CreateInvItems(self,itrw_addon_firebolt,BOLTMOUNT[2]);
		CreateInvItems(self,itrw_addon_armourpiercingbolt,BOLTMOUNT[3]);
		CreateInvItems(self,itrw_addon_explosivebolt,BOLTMOUNT[4]);
		CreateInvItems(self,itrw_addon_trollkillerbolt,BOLTMOUNT[5]);
		BATTLEBOLTKOLCHANISFULL = FALSE;
		itmi_battleboltkolchan.text[2] = "Колчан пуст";
	};
};


instance ITMI_MAGICBOLTKOLCHAN(C_Item)
{
	name = "Колчан магических болтов";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_MULTI;
	value = value_itmi_magicboltkolchan;
	visual = "ItMi_Pocket.3ds";
	scemeName = "ROM";
	material = MAT_LEATHER;
	description = name;
	on_state[0] = use_magicboltkolchan;
	text[2] = "Пустой";
	text[5] = NAME_Value;
	count[5] = value;
};


var int magicboltkolchanisfull;
const int MAGICBOLT = 0;
const int INNOSRETRIBUTIONBOLT = 1;
const int VAMPIRBOLT = 2;
const int MAGICOREBOLT = 4;
const int BLACKOREBOLT = 5;
const int ICEBOLT = 6;

var int magicboltmount[7];

func void use_magicboltkolchan()
{
	var C_Item rangedWeapon;
	if(MAGICBOLTKOLCHANISFULL == FALSE)
	{
		if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
		{
			rangedWeapon = Npc_GetEquippedRangedWeapon(hero);
		};
		if(Npc_HasItems(self,ItRw_Addon_MagicBolt) > 0)
		{
			MAGICBOLTMOUNT[0] = Npc_HasItems(self,ItRw_Addon_MagicBolt);
			Npc_RemoveInvItems(self,ItRw_Addon_MagicBolt,MAGICBOLTMOUNT);
		};
		if(Npc_HasItems(self,itrw_innosretributionbolt) > 0)
		{
			MAGICBOLTMOUNT[1] = Npc_HasItems(self,itrw_innosretributionbolt);
			Npc_RemoveInvItems(self,itrw_innosretributionbolt,MAGICBOLTMOUNT[1]);
		};
		if(Npc_HasItems(self,itrw_addon_vampirbolt) > 0)
		{
			MAGICBOLTMOUNT[2] = Npc_HasItems(self,itrw_addon_vampirbolt);
			Npc_RemoveInvItems(self,itrw_addon_vampirbolt,MAGICBOLTMOUNT[2]);
		};
		if(Npc_HasItems(self,itrw_addon_magicorebolt) > 0)
		{
			MAGICBOLTMOUNT[4] = Npc_HasItems(self,itrw_addon_magicorebolt);
			Npc_RemoveInvItems(self,itrw_addon_magicorebolt,MAGICBOLTMOUNT[4]);
		};
		if(Npc_HasItems(self,itrw_addon_blackorebolt) > 0)
		{
			MAGICBOLTMOUNT[5] = Npc_HasItems(self,itrw_addon_blackorebolt);
			Npc_RemoveInvItems(self,itrw_addon_blackorebolt,MAGICBOLTMOUNT[5]);
		};
		MAGICBOLTKOLCHANISFULL = TRUE;
		itmi_magicboltkolchan.text[2] = "Колчан полон болтов";
		AI_PrintScreen("Магические болты убраны",20,70,FONT_Screen,2);
	}
	else
	{
		CreateInvItems(self,ItRw_Addon_MagicBolt,MAGICBOLTMOUNT);
		CreateInvItems(self,itrw_innosretributionbolt,MAGICBOLTMOUNT[1]);
		CreateInvItems(self,itrw_addon_vampirbolt,MAGICBOLTMOUNT[2]);
		CreateInvItems(self,itrw_addon_magicorebolt,MAGICBOLTMOUNT[4]);
		CreateInvItems(self,itrw_addon_blackorebolt,MAGICBOLTMOUNT[5]);
		MAGICBOLTKOLCHANISFULL = FALSE;
		itmi_magicboltkolchan.text[2] = "Колчан пуст";
	};
};
*/
