
instance ItMi_HerbPaket(C_Item)
{
	name = "Тюк травы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Тяжелый, липкий тюк,";
	text[3] = "пахнущий болотной травой.";
	text[5] = NAME_Value;
	count[5] = 200;
};

instance Holy_Hammer_MIS(C_Item)
{
	name = "Священный молот";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_HolyHammer;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "Урон:                   ??";
	text[3] = "Необходима сила:          ??";
	text[4] = "Двуручное оружие";
	text[5] = "Цена:  невозможно определить";
};

const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_Item)
{
	name = "Старые рыцарские доспехи";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name = "Камень знаний";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ItWr_Bloody_MIS(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBloodMIS;
	scemeName = "MAP";
	description = "Яд кровавых мух";
};
func void UseBloodMIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Жало кровавых мух содержит смертельный яд, и ни один человек в здравом уме не возьмет его в руки.");
	Doc_PrintLines(nDocID,0,"Если только он не владеет искусством извлечения жала и его обработки.");
	Doc_PrintLines(nDocID,0,"Жало необходимо аккуратно разрезать острым ножом от кончика до основания.");
	Doc_PrintLines(nDocID,0,"Верхний слой удаляется. Затем разрезается ткань вокруг желез.");
	Doc_PrintLines(nDocID,0,"Выделяющийся при разрезе сок обладает лечебными свойствами.");
	Doc_PrintLines(nDocID,0,"Однако, со временем человеческий становится невосприимчивым к этому лечебному зелью.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дамарок");
	Doc_Show(nDocID);
	if(Knows_Bloodfly == FALSE)
	{
		Knows_Bloodfly = TRUE;
		B_DSG_Log_OpenClose(Topic_Bonus,LOG_NOTE,-1,"Теперь я знаю, что необходимо сделать, чтобы добыть целебный сок из жала кровавой мухи.");
		B_GivePlayerXP(XP_Ambient);
	};
};

instance ItMi_MoleratLubric(C_Item)
{
	name = "Жир кротокрыса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pitch;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItWr_Astronomy_Mis(C_Item)
{
	name = "Божественная сила звезд";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Astronomy;
};
var int Astronomy_once;
func void Use_Astronomy()
{
	var int nDocID;
	if(Astronomy_once == FALSE)
	{
		B_RaiseAttribute(self,ATR_MANA_MAX,2);
		Print(Print_ReadAstronomy);
		Astronomy_once = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... но когда сила быка объединяется с началом воина, нужно опасаться грядущих событий.");
	Doc_PrintLines(nDocID,0,"Высвободившаяся сила быка и настойчивость воина могут нарушить древний баланс сил. Космическая граница между измерениями становится слабой - столь слабой, что теневые твари Белиара получают возможность проникнуть в наш мир.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Что может произойти вследствие этого, известно нам из истории войн древних времен, когда связь между мирами была еще сильна. Эти отродья зла несли смерть и разрушения нашему миру, и благодаря Избранному и Инносу мир был избавлен от этого зла.");
	Doc_PrintLines(nDocID,1,"Если такая угроза когда-либо возникнет опять, то да поможет нам Иннос, ибо мир не видел Избранного Инноса уже многие сотни лет.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


const int Value_Dragonegg = 200;
const int Value_OrcEliteRing = 130;

instance ItAt_DragonEgg_MIS(C_Item)
{
	name = "Драконье яйцо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Dragonegg;
	visual = "ItAt_DragonEgg.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Это яйцо теплое, и изнутри";
	text[1] = "доносится скребущийся звук.";
	text[5] = NAME_Value;
	count[5] = value;
};

prototype EffectItemPrototype_Addon(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};
instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};
instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};
instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_01(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_02(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_03(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_04(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_05(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_06(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_07(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_08(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_09(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_10(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_11(EffectItemPrototype_Addon)
{
};
instance ItMi_DS_Effect_12(EffectItemPrototype_Addon)
{
};

instance ItMi_Rake(C_Item)
{
	name = "Мотыга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rake;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemeName = "RAKE";
	on_state[1] = Use_Rake;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Use_Rake()
{
};

instance ItMi_Focus(C_Item)
{
	name = "Фокусирующий камень";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
};

instance ItMI_Addon_Kompass_Mis(C_Item)
{
	name = "Золотой компас";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
};


prototype ITWR_DS_SWORDBLADEDRAWING(C_Item)
{
	name = "Чертеж клинка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Чертеж";
	text[2] = "На чертеже расписан метод";
	text[3] = "изготовления очень редкого клинка.";
	text[4] = "Разобраться в этих формулах";
	text[5] = "может только очень опытный кузнец.";
};
instance ITWR_DS_SWORDBLADEDRAWING01_MIS(ITWR_DS_SWORDBLADEDRAWING)
{
	on_state[0] = use_swordbladedrawing1;
};
instance ITWR_DS_SWORDBLADEDRAWING02_MIS(ITWR_DS_SWORDBLADEDRAWING)
{
	on_state[0] = use_swordbladedrawing2;
};
instance ITWR_DS_SWORDBLADEDRAWING03_MIS(ITWR_DS_SWORDBLADEDRAWING)
{
	on_state[0] = use_swordbladedrawing3;
};

func void use_swordbladedrawing1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Sword_1.TGA",1);
	Doc_Show(nDocID);
};
func void use_swordbladedrawing2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Sword_2.TGA",1);
	Doc_Show(nDocID);
};
func void use_swordbladedrawing3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS_Sword_10.TGA",1);
	Doc_Show(nDocID);
};

instance ITMI_BLACKNUGGET(C_Item)
{
	name = "Кусок руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_Zeitspalt_Addon.3ds";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Руда с черными вкраплениями";
	text[1] = "Достаточно редкий экземпляр.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_DS_IDOLON(C_Item)
{
	name = "Идолон";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Sulfur.3DS";
	material = MAT_WOOD;
	description = name;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	text[0] = "Магическая призрачная";
	text[1] = "субстанция.";
	text[2] = "Обладает рядом";
	text[3] = "алхимических свойств.";
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_StoneGer(C_Item)
{
	name = "Камень Стихий";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
};

instance ItMw_Stamp_Gegard(C_Item)
{
	name = "Печать";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD; 
};

instance ItMw_Secret_Sword(C_Item)
{
	name = "”Убийца-из-пещер”";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 50;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 110;
	on_equip = Equip_2H_07;
	on_unequip = UnEquip_2H_07;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[1] = NAME_ADDON_BONUS_2H;
	count[1] = 7;
	text[2] = NAME_Dam_Magic;
	count[2] = 45; 
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Posoh_Zreca(C_Item)
{
	name = "”Посох жреца”";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 50;
	damageTotal = 20;
	damagetype = DAM_BLUNT;
	range = 70;
	on_equip = Equip_2H_10;
	on_unequip = UnEquip_2H_10;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 40;
	visual = "ItMw_025_2h_Staff_02.3DS";
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[1] = NAME_ADDON_BONUS_2H;
	count[1] = 10;
	text[2] = NAME_Dam_Magic;
	count[2] = 50;
	text[3] = NAME_Mana_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Posoh_StudentZreca(C_Item)
{
	name = "Посох ученика темного мага";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 50;
	visual = "ItMw_025_2h_Staff_02.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[1] = NAME_Mana_needed;
	count[1] = 50;
	text[2] = NAME_Dam_Magic;
	count[2] = 10; 
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_Posoh_Necromanta(C_Item)
{
	name 				= "Посох некроманта";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_2HD_AXE;
	material 		= MAT_METAL;
	value 			= 2000;
	damageTotal = 90;
	damagetype 	= DAM_BLUNT;
	range 			= 70;
	on_equip 		= Equip_2H_15;
	on_unequip 	= UnEquip_2H_15;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 150;
	visual 			= "ItMw_025_2h_Staff_02.3DS";
	effect = "SPELLFX_MAGESTAFF5";
	description = name;
	text[0] 		= NAME_Damage;
	count[0] 		= damageTotal;
	text[1] 		= Name_Mana_Needed;
	count[1] 		= cond_value[2];
	text[2] 		= NAME_Dam_Magic;
	count[2] 		= 15; 
	text[3] 		= NAME_ADDON_BONUS_2H;
	count[3] 		= 15;
	text[4] 		= NAME_TwoHanded;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};

instance ItMw_Dark_Blade(C_Item)
{
	name = "Темное Лезвие";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 70;
	on_equip = Equip_2H_20;
	on_unequip = UnEquip_2H_20;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 200;
	visual = "ItMw_025_2h_Staff_02.3DS";
	description = name;
	text[0] = NAME_Damage;
	count[0] = damageTotal;
	text[1] = NAME_Mana_needed;
	count[1] = cond_value[2];
	text[2] = NAME_Dam_Magic;
	count[2] = 50; 
	text[3] = NAME_ADDON_BONUS_2H;
	count[3] = 20;
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItBe_DS_BeltDarkMage(C_Item)
{
	name = "Пояс Темного Мага";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 5000;
	visual = "ItMI_Belt_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItBe_BeltDarkMage;
	on_unequip = UnEquip_ItBe_BeltDarkMage;
	description = name;
	text[1] = NAME_DS_Bonus_AtrAll;
	count[1] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};
func void Equip_ItBe_BeltDarkMage()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,10); 
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10); 
	Npc_ChangeAttribute(self,ATR_MANA_MAX,10); 
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,10); 
};
func void UnEquip_ItBe_BeltDarkMage()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-10); 
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10); 
	Npc_ChangeAttribute(self,ATR_MANA_MAX,-10); 
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-10); 
};
instance ItMi_OrcWood(C_Item)
{
	name = "Тут орочья древесина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	visual = "OC_Firewood_V1.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Как раз для посоха кусочек...";
};



