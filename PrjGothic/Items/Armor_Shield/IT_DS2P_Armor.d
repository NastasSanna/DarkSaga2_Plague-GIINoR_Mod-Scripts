//-----------------------------------------------------
/*-----------ПИРАТСКИЕ ДОСПЕХИ-----------------------*/
//-----------------------------------------------------

instance ITAR_PIR_DS2P_BABE(ITAR_DS_Proto)		//Одежда пиратки (для Сью)
{
	name = "Одежда пиратки";	visual = "ITAR_PIR_L_Addon.3ds";	visual_change = "PIRAT_BABE_REDLEHA.ASC";
	description = name;
	protection[PROT_EDGE] = 55;	protection[PROT_BLUNT] = 55;	protection[PROT_POINT] = 55;
	value = VALUE_ITAR_PIR_LL_Addon;
	on_equip = Equip_ITAR_PIR_DS;
	on_unequip = UnEquip_ITAR_PIR_DS;
	count[1] = protection[PROT_EDGE]; count[2] = protection[PROT_POINT]; 
	count[3] = protection[PROT_FIRE]; count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

//-----------------------------------------------------
/*-----------ДОСПЕХИ ФЕРМЕРОВ------------------------*/
//-----------------------------------------------------

instance ITAR_BAU_DS2P_BABE(ITAR_DS_Proto)		//Одежда крестьянки (юбка) для Никки
{
	name = "Одежда крестьянки";	visual = "ItAr_VLKBabe.3DS";	visual_change = "BAU_BABE_ARMOR_V2.ASC";
	description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	value = VALUE_ITAR_VlkBabe_L;
	count[1] = protection[PROT_EDGE]; count[2] = protection[PROT_POINT]; 
	count[3] = protection[PROT_FIRE]; count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
//-----------------------------------------------------
/*-----------ДОСПЕХИ ИЗМАРА и ЭКОРА-------------------*/
//-----------------------------------------------------
instance ITAR_DS2P_Ekor(ITAR_DS_Proto)		//Одежда Экора (отшельника)
{
	name = "Одежда отшельника";	visual = "ItAr_CorAngar.3DS";	visual_change = "ARMOR_DS_FER_MAGE.ASC";
	description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_VlkBabe_L;
	count[1] = protection[PROT_EDGE]; count[2] = protection[PROT_POINT]; 
	count[3] = protection[PROT_FIRE]; count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_DS2P_Izmar(ITAR_DS_Proto)		//Одежда колдуна Измара (/*Redleha: надо что-то новое*/)
{
	name = "Одежда колдуна";	visual = "ItAr_Governor.3DS";	visual_change = "ARMOR_DS_DARKMAG_PRIEST.ASC";
	description = name;
	protection[PROT_EDGE] = 80;	protection[PROT_BLUNT] = 80;	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 100;	protection[PROT_MAGIC] = 100;
	value = VALUE_ITAR_VlkBabe_L;
	count[1] = protection[PROT_EDGE]; count[2] = protection[PROT_POINT]; 
	count[3] = protection[PROT_FIRE]; count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
//-----------------------------------------------------
/*-----------ДОСПЕХИ ДОПОЛНИТЕЛЬНЫЕ-------------------*/
//-----------------------------------------------------
//Текстура: Hum_Dht_Armor_V0.TGA; Модель: отредактированная HUM_GRDS_ARMOR.ASC;

instance ITAR_DS2P_New_1(ITAR_DS_Proto)		//Сделал сам
{
	name = "Броня воина Хаоса";	visual = "ItAr_Sld_M.3DS";	visual_change = "ARMOR_DSG_CHAOS_WAR.ASC";
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 80;	protection[PROT_MAGIC] = 80;
	value = VALUE_ITAR_VlkBabe_L;
	count[1] = protection[PROT_EDGE]; count[2] = protection[PROT_POINT]; 
	count[3] = protection[PROT_FIRE]; count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

//-----------------------------------------------------
/*-----------КОСТЮМЫ ПРИЗРАКОВ-----------------------*/
//-----------------------------------------------------
// UNFINISHED 3DS (необязательно, в инвентаре ГГ никогда не появится по сюжету) 
instance ITAR_DS2P_GHOST(C_ITEM)		//Для квеста "Азартный игрок"
{
	name = "Костюм призрака";	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;
	wear = WEAR_TORSO;	material = MAT_LEATHER;	visual_skin = 0;
	visual = "ItAr_Xardas.3ds";	visual_change = "ARMOR_DSG_GHOST.ASC";
	value = 0;
	text[1] = "Костюм призрака из белой ткани";
};
