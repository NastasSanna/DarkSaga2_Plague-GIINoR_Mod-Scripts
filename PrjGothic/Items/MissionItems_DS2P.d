/*------------------------------------------------------------------*/
// СОЛЬ. 		Требуется крестьянину ^Харок^ по квесту: "Рыбное дело"
/*------------------------------------------------------------------*/
const int Value_Salt = 5;
instance ITMI_DS2P_Salt(C_Item)
{
	name = "Соль";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Salt;
	visual = "dsg_salt_01.3DS";
	material = MAT_STONE;
	description = "Кучка соли";
	text[5] = NAME_Value;	count[5] = value;
};
/*-----------------------------------------------------------------------------*/
// БОЧКА С РЫБОЙ.	Даёт кр-нин ^Харок^ для кр-ки ^Мария^ по квесту: "Рыбное дело"
/*-----------------------------------------------------------------------------*/
const int Value_FishBarrel = 100;
instance ITMI_DS2P_FishBarrel(C_Item)
{
	name = "Бочка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FishBarrel;
	visual = "dsg_fishbarrel_01.3DS";
	material = MAT_WOOD;
	description = "Бочка с рыбой";
	text[5] = NAME_Value;	count[5] = value;
};
/*---------------------------------------------------------------------------*/
// ПРОКЛЯТЫЙ АЛМАЗ. Требуется пирату ^Лан-скелет^ по квесту: "Проклятый моряк"
/*---------------------------------------------------------------------------*/
const int Value_CursedDiamond = 100;
instance ITMI_DS2P_CursedDiamond(C_Item)
{
	name = "Проклятый алмаз";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_CursedDiamond;
	visual = "dsg_curse_diamond_01.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;	count[5] = value;
};
/*----------------------------------------------------------------------------------*/
// СИЛКИ. 
// Даются(пустые) и требуются(полные) крестьянином ^Барок^ по квесту: "Опасная охота"
/*----------------------------------------------------------------------------------*/
const int Value_SnaresForHunting_Empty = 100;
const int Value_SnaresForHunting_Full = 200;
instance ITMI_DS2P_SnaresForHunting_Empty(C_Item)
{
	name = "Силки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SnaresForHunting_Empty;
	visual = "dsg_silok_empty.3DS";
	material = MAT_LEATHER;
	description = "Силки для охоты на кроликов";
	text[1] = "Внутри пусто";
	text[5] = NAME_Value;	count[5] = value;
};
instance ITMI_DS2P_SnaresForHunting_Full(C_Item)
{
	name = "Силки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SnaresForHunting_Full;
	visual = "dsg_silok_full.3DS";
	material = MAT_LEATHER;
	description = "Силки для охоты на кроликов";
	text[1] = "Внутри кто-то барахтается";
	text[5] = NAME_Value;	count[5] = value;
};
/*--------------------------------------------------------------------*/
// Амулет ищущего огонька. 
// Даётся в награду крестьянином ^Барок^ по квесту: "Опасная охота"
/*--------------------------------------------------------------------*/
const int Value_WispDetector = 1000;
instance ItAm_DS2P_WispDetector(C_Item)
{
	name = "Амулет ищущего огонька";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_WispDetector;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	visual_skin = 0;
	material = MAT_METAL;
	description = "Рудный амулет блуждающего огонька";
	text[1] = "Тусклый. Видимо, испорчен.";
	text[5] = NAME_Value;	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
/*--------------------------------------------------------------------------*/
// УХО ГОБЛИНА. Требуется (3 штуки) пирату ^Йорн^ по квесту: "Хитрые гоблины"
/*--------------------------------------------------------------------------*/
const int Value_GoblinEar = 100;
instance ITMI_DS2P_GoblinEar(C_Item)
{
	name = "Ухо гоблина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoblinEar;
	visual = "DSG_goblin_ear.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;	count[5] = value;
};
/*--------------------------------------------------------------------------*/
// CТАТУЭТКА ГОБЛИНА. 
// Требуется (2 штуки) гоблину ^Ба-Ба-По^ по квесту: "Статуэтки Гуруна"
/*--------------------------------------------------------------------------*/
const int Value_GobStatue_Emerald = 300;
const int Value_GobStatue_Gold = 200;
const int Value_GobStatue_Silver = 100;
instance ITMI_DS2P_GobStatue_Emerald(C_Item)	//Изумрудная статуэтка гоблина: находится у Йорна
{
	name = "Cтатуэтка гоблина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GobStatue_Emerald;
	visual = "dsg_gobstatue_emerald.3DS";
	material = MAT_STONE;
	description = "Изумрудная статуэтка гоблина";
	text[5] = NAME_Value;	count[5] = value;
};
instance ITMI_DS2P_GobStatue_Gold(C_Item)
{
	name = "Cтатуэтка гоблина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GobStatue_Gold;
	visual = "dsg_gobstatue_gold.3DS";
	material = MAT_METAL;
	description = "Золотая статуэтка гоблина";
	text[5] = NAME_Value;	count[5] = value;
};
instance ITMI_DS2P_GobStatue_Silver(C_Item)
{
	name = "Cтатуэтка гоблина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GobStatue_Silver;
	visual = "dsg_gobstatue_silver.3DS";
	material = MAT_METAL;
	description = "Серебряная статуэтка гоблина";
	text[5] = NAME_Value;	count[5] = value;
};
/*--------------------------------------------------------------------------*/
// СТАРИННАЯ МОНЕТА. 
// Требуется (15 штук) пирату ^Адо^ по квесту "В поисках сокровищ"
/*--------------------------------------------------------------------------*/
const int Value_OldCoin = 20;
instance ItMi_OldCoin(C_Item)
{
	name = "Старинная монета";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_OldCoin;
	visual = "ItMi_OldCoin.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
/*--------------------------------------------------------------------------*/
// КОЛОДА КАРТ. 
// Даёт пират ^Зедд^ по квесту "Азартный игрок"
/*--------------------------------------------------------------------------*/
const int Value_Shulers_Colode = 50;
const int Value_Shulers_Cart = 2;
instance ITMI_DS2P_Shulers_Colode(C_Item)
{
	name = "Колода карт";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Shulers_Colode;
	visual = "dsg_shulers_colode.3DS";
	material = MAT_LEATHER;
	description = "Колода игральных карт";
	text[1] = "Игральные карты. Свиду некрапленые.";
	text[2] = "Колода полная. Даже пара джокеров есть.";
	text[5] = NAME_Value;	count[5] = value;
};
instance ITMI_DS2P_Shulers_Cart_TuzTref(C_Item)
{
	name = "Игральная карта";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Shulers_Cart;
	visual = "dsg_shulers_cards_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Туз треф";
	text[5] = NAME_Value;	count[5] = value;
};
instance ITMI_DS2P_Shulers_Cart_ValetTref(C_Item)
{
	name = "Игральная карта";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Shulers_Cart;
	visual = "dsg_shulers_cards_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Валет треф";
	text[5] = NAME_Value;	count[5] = value;
};
instance ITMI_DS2P_Shulers_Cart_DamaPik(C_Item)
{
	name = "Игральная карта";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Shulers_Cart;
	visual = "dsg_shulers_cards_03.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Пиковая Дама";
	text[5] = NAME_Value;	count[5] = value;
};
instance ITMI_DS2P_Shulers_Cart_KingTref(C_Item)
{
	name = "Игральная карта";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Shulers_Cart;
	visual = "dsg_shulers_cards_04.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Король треф";
	text[5] = NAME_Value;	count[5] = value;
};
/*--------------------------------------------------------------------------*/
// КУЗНЕЧНЫЕ МЕХА. 
// Даёт пират ^Джозеф^ для пирата ^Зедд^ по квесту "Азартный игрок"
/*--------------------------------------------------------------------------*/
const int Value_ForgeBellows = 100;
instance ITMI_DS2P_ForgeBellows(C_Item)
{
	name = "Кузнечные меха";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ForgeBellows;
	visual = "dsg_forge_fur.3DS";
	material = MAT_WOOD;
	description = name;
	text[1] = "Подходят для небольшой кузницы";
	text[5] = NAME_Value;	count[5] = value;
};
/*----------------------------------------------------------------------*/
// КУСОК ЖЕЛЕЗНОЙ РУДЫ.
// Требуется пирату ^Джозеф^ (2/3 штук) по квесту "Кто украл мое железо?"
/*----------------------------------------------------------------------*/
const int Value_IRONORE_NUGGET_BIG = 100;
instance ITMI_DS2P_IRONORE_NUGGET_BIG(C_Item)
{
	name = "Кусок железной руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IRONORE_NUGGET_BIG;
	visual = "dsg_iron_ore.3DS";
	material = MAT_STONE;
	description = "Очень большой кусок руды";
	text[1] = "Железная руда";
	text[2] = "Кусок внушительных размеров";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
/*----------------------------------------------------------------------*/
// КОЛЬЦО СТАЛЬНОЙ КОЖИ.
// Находим в желудке варга по квесту "Выбор Тамира" с крест-ном ^Тамир^
/*----------------------------------------------------------------------*/
const int Value_Ri_DS2P_ProtEdgPoi_01 = 100;
const int Ri_DS2P_ProtEdge_01 = 10;
instance ItRi_DS2P_ProtEdgPoi_01(ItRi_Proto)
{
	value = Value_Ri_DS2P_ProtEdgPoi_01;
	visual = "ItRi_Prot_Edge_01.3ds";
	on_equip = Equip_ItRi_DS2P_ProtEdgPoi_01;
	on_unequip = UnEquip_ItRi_DS2P_ProtEdgPoi_01;
	description = "Кольцо стальной кожи";
	text[2] = NAME_DS_Prot_EdgeAndPoint;
	count[2] = Ri_DS2P_ProtEdge_01;
	count[5] = value;
};
func void Equip_ItRi_DS2P_ProtEdgPoi_01()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, Ri_DS2P_ProtEdge_01);
};
func void UnEquip_ItRi_DS2P_ProtEdgPoi_01()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -Ri_DS2P_ProtEdge_01);
};
/*--------------------------------------------------------*/
// КОЛЬЦО ОТЦА КОЛО.
// Находим в сундуке ^Никки^ по квесту "Да ты Ведьма!"
/*----------------------------------------------------------*/
const int Ri_DS2P_Kolo_Bonus1H2H = 5;
instance ItRi_DS2P_Kolo(ItRi_Proto)
{
	value = Value_Ri_ProtFire;
	visual = "ItRi_Prot_Fire_01.3ds";
	on_equip = Equip_ItRi_DS2P_Kolo;
	on_unequip = UnEquip_ItRi_DS2P_Kolo;
	description = "Кольцо моряка";
	text[1] = "На кольце нанесена гравировка в виде якоря.";
	text[2] = "Скорей всего, это кольцо мореплавателя или пирата.";
	text[4] = NAME_DS_Bonus_MW_HitChance;
	count[4] = Ri_DS2P_Kolo_Bonus1H2H;
	count[5] = value;
};
func void Equip_ItRi_DS2P_Kolo()
{
	B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_1H | NPC_DS_TALENT_2H, Ri_DS2P_Kolo_Bonus1H2H);
};
func void UnEquip_ItRi_DS2P_Kolo()
{
	B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_1H | NPC_DS_TALENT_2H, -Ri_DS2P_Kolo_Bonus1H2H);
};
/*----------------------------------------------------------------*/
// ПОЯС ЛУЧНИКА.
// Даёт в награду крест-нин ^Тамир^ по квесту "Да ты Ведьма!"
/*----------------------------------------------------------------*/
const int Value_Be_DS2P_Sniper = 500;
const int Bonus_DEX_Be_DS2P_Sniper = 10;
instance ItBe_DS2P_Sniper(C_Item)
{
	name = NAME_Addon_Belt;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = Value_Be_DS2P_Sniper;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_ItBe_DS2P_Sniper;
	on_unequip = unequip_ItBe_DS2P_Sniper;
	description = "Пояс лучника";
	text[1] = NAME_Bonus_Dex;
	count[1] = Bonus_DEX_Be_DS2P_Sniper;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};
func void equip_ItBe_DS2P_Sniper()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Bonus_DEX_Be_DS2P_Sniper);
};
func void unequip_ItBe_DS2P_Sniper()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Bonus_DEX_Be_DS2P_Sniper);
};
/*---------------------------------------------------------------*/
// ЛУК ТАМИРА.
// Даёт в награду крест-нин ^Тамир^ по квесту "Да ты Ведьма!"
/*---------------------------------------------------------------*/
const int Value_DS2P_Bow_Tamir = 500;
const int Damage_DS2P_Bow_Tamir = 60;
const int Cond_DS2P_Bow_Tamir__DEX = 50;
const int Bonus_DS2P_Bow_Tamir__BOW = 5;
instance ItRw_DS2P_Bow_Tamir(C_Item)		//Лук Тамира
{
	name = "Лук Тамира";description = name;
	mainflag = ITEM_KAT_FF;	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_DS2P_Bow_Tamir;
	damagetype = DAM_POINT;
	damageTotal = Damage_DS2P_Bow_Tamir;	
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Cond_DS2P_Bow_Tamir__DEX;
	on_equip = Equip_DS2P_Bow_Tamir;
	on_unequip = UnEquip_DS2P_Bow_Tamir;
	visual = "ItRw_Bow_L_02.mms";	
	text[1] = BowClassIsBattle;
	text[2] = NAME_Damage;	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOW; count[4] = Bonus_DS2P_Bow_Tamir__BOW;
	text[5] = NAME_Value;	count[5] = value;
};
func void Equip_DS2P_Bow_Tamir()		{	B_AddFightSkill(self,NPC_TALENT_BOW,Bonus_DS2P_Bow_Tamir__BOW);		};
func void UnEquip_DS2P_Bow_Tamir()	{	B_AddFightSkill(self,NPC_TALENT_BOW,-Bonus_DS2P_Bow_Tamir__BOW);	};
/*-----------------------------------------------------*/
// ГОБЛИНСКАЯ ПРЫТЬ.
// Дает гоблин ^Ба-Ба-По^ по квесту "Хитрые гоблины"
/*-----------------------------------------------------*/
const int Ri_DS2P_BaBaPo_BonusDex = 15;
const int Value_Ri_DS2P_BaBaPo = 2000;
instance ItRi_DS2P_BaBaPo(ItRi_Proto)
{
	value = Value_Ri_DS2P_BaBaPo;
	visual = "ItRi_Dex_01.3ds";
	on_equip = Equip_ItRi_DS2P_BaBaPo;
	on_unequip = UnEquip_ItRi_DS2P_BaBaPo;
	description = "Гоблинская прыть";
	//text[1] = "";
	//text[2] = "";
	text[4] = NAME_Bonus_Dex;
	count[4] = Ri_DS2P_BaBaPo_BonusDex;
	count[5] = value;
};
func void Equip_ItRi_DS2P_BaBaPo()		{	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_DS2P_BaBaPo_BonusDex);};
func void UnEquip_ItRi_DS2P_BaBaPo(){	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_DS2P_BaBaPo_BonusDex);};
/*-----------------------------------------------------*/
// КАРТА СОКРОВИЩ ЛАНА.
// Дает пират ^Лан^ по квесту "Проклятый моряк"
/*-----------------------------------------------------*/
instance ItWr_DS2P_Map_LanTreasure(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_DS2P_Map_LanTreasure;
	description = "Карта сокровищ";
	text[0] = "Эту карту составил пират Лан.";
	text[1] = "На ней указано место, где он спрятал сокровища.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_DS2P_Map_LanTreasure()
{
	var int Document;
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_DS2P_Map_LanTreasure);
	};
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"MAP_DS2P_LAN_TREASURE.tga",TRUE);
	Doc_SetLevel(Document,"World_DS2_Prolog.zen");
	Doc_SetLevelCoords(Document,-17687,31000,74157,-37000);
	Doc_Show(Document);
};
/*-------------------------------------------------------*/
// ПОСЛАНИЕ крест-ки ^Мария^ крест-ну ^Густав^.
// Дает крест-ка ^Мария^ по квесту "Кто украл мое железо?"
/*-------------------------------------------------------*/
instance ItWr_DS2P_Message_Maria2Gustav(C_Item)
{
	name = "Послание"; description = name;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Message_Maria2Gustav;
	scemeName = "MAP";	
	text[1] = "Это послание дала крестьянка Мария.";
	text[2] = "Адресовано крестьянину Густаву.";
};
func void Use_Message_Maria2Gustav()
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
	Doc_PrintLine(nDocID,0,"Том, Джин, Фарт, а также мой любимый Густав! ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Передаю с этим человеком немного продуктов.");
	Doc_PrintLines(nDocID,0,"Этот незнакомец совсем недавно прибыл на остров,");
	Doc_PrintLines(nDocID,0," и не имеет отношения к пиратам. ");
	Doc_PrintLines(nDocID,0,"Ему можно доверять. ");
	Doc_PrintLines(nDocID,0,"Положитесь на его опыт, я надеюсь, что он нам поможет!");
	Doc_PrintLine(nDocID,0,"         Да хранит вас Иннос!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                                                  Мария");
	Doc_Show(nDocID);
};
/*-------------------------------------------------------*/
// СВЕРТОК ПРОДУКТОВ крест-ки ^Мария^ крест-ну ^Густав^.
// Дает крест-ка ^Мария^ по квесту "Кто украл мое железо?"
/*-------------------------------------------------------*/
instance ItMi_DS2P_ProductsPacket_Maria(C_Item)
{
	name = "Сверток"; description = "Сверток с продуктами";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3DS";
	material = MAT_LEATHER;
	text[1] = "Продукты от Марии";
	text[2] = "для крестьян, скрывающихся в лесу.";
};
/*-------------------------------------------------------*/
// СВЕРТОК ПРОДУКТОВ для пленных.
// Дает крест-ка ^Мария^ по квесту "Доставка припасов"
/*-------------------------------------------------------*/
instance ItMi_DS2P_Packet_ProductSupplies(C_Item)
{
	name = "Сверток"; description = "Сверток с продуктами";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3DS";
	material = MAT_LEATHER;
	text[1] = "Еда для пленных";
};
/*-------------------------------------------------------*/
// ЧЕРТЕЖИ пирата ^Джозеф^.
// Добываем по квесту "Потерянные чертежи"
/*-------------------------------------------------------*/
const int Value_ItWr_DS2P_Drawing__Q_proto = 500;
prototype ItWr_DS2P_Drawing__Q_proto(C_ITEM)
{
	name = NAME_DS_DRAWING;	description = NAME_DS_DRAWING_CBOW;
	mainflag = ITEM_KAT_DOCS;	flags = 0;
	value = Value_ItWr_DS2P_Drawing__Q_proto;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	//on_state[0] = Use_ItWr_DS2P_Drawing__Q_proto;
	scemeName = "MAP";	
	text[5] = NAME_Value;
	count[5] = value;
};
/* UNFINISHED
func void Use_ItWr_DS2P_Drawing__Q_proto()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Drawing_DS2P_CrossBow_1.TGA",1);
	Doc_Show(nDocID);
};
*/
instance ItWr_DS2P_Drawing_01__Q(ItWr_DS2P_Drawing__Q_proto){};
instance ItWr_DS2P_Drawing_02__Q(ItWr_DS2P_Drawing__Q_proto){};
instance ItWr_DS2P_Drawing_03__Q(ItWr_DS2P_Drawing__Q_proto){};
instance ItWr_DS2P_Drawing_04__Q(ItWr_DS2P_Drawing__Q_proto){};
instance ItWr_DS2P_Drawing_05__Q(ItWr_DS2P_Drawing__Q_proto){};
/*-------------------------------------------------------*/
// ОТРЕЗВИТЕЛЬНОЕ ЗЕЛЬЕ, выглядит как выпивка
// Дает алхимик ^Цимм^ по квесту "Белая горячка"
/*-------------------------------------------------------*/
instance ItMi_DS2P_SoberingPotion(C_Item)
{
	name = "Отрезвительное зелье"; description = name;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Rum_02.3DS";
	material = MAT_LEATHER;
	text[1] = "Мгновенно очищает организм от алкоголя.";
	text[2] = "Лучше не испытывать на себе.";
};
/*-------------------------------------------------------*/
// КОСТЮМЫ (сверток, не надеваюся - еще без рож)
// Дает крест-ка ^Мария^ по квесту "Азартный игрок"
/*-------------------------------------------------------*/
instance ItMi_DS2P_Packet_WhiteClothes(C_Item)
{
	name = "Сверток"; description = "Сверток с костюмами";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3DS";
	material = MAT_LEATHER;
	text[1] = "В этом свертке";
	text[2] = "два костюма из белой ткани";
};
/*-------------------------------------------------------*/
// Письмо от крест-на ^Тома^ для крест-ки ^Лулу^
// По квесту "Письмо"
/*-------------------------------------------------------*/
instance ITWr_DS2P_LylyWriting(C_ITEM)
{
	name = "Письмо Лулу";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ITWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DS2P_LylyWriting;
	scemeName = "MAP";
	description = name;
	text[0] = "От охотника Тома";
};

func void Use_DS2P_LylyWriting()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дорогая Лулу");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Дорогая Лулу, извини, что так долго не мог передать тебе весточку – возможность представилась только сейчас.");
	Doc_PrintLines(nDocID,0,"Со мной все в порядке, я и остальные парни скрываемся, пока не появится возможность раз и навсегда избавиться от пиратов.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Все будет хорошо. Даст Иннос, скоро свидимся.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Целую, твой Том.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};
/*-------------------------------------------------------*/
// Письмо от крест-на ^Цимма^ для отшельника ^Экора^
// По квесту "Чума"
/*-------------------------------------------------------*/
instance ITWr_DS2P_Letter_fCimm_tEkor(C_ITEM)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ITWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DS2P_Letter_fCimm_tEkor;
	scemeName = "MAP";
	description = name;
	text[0] = "Цимм передал его для Экора";
};

func void Use_DS2P_Letter_fCimm_tEkor()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Приветствую, уважаемый Экор!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот юноша пришел к тебе с добрыми намерениями.");
	Doc_PrintLines(nDocID,0,"Будь добр, не откажи ему в его просьбе.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Твой давний знакомый, Цимм.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};
/*-------------------------------------------------------*/
// Список от отшельника ^Экора^
// По квесту "Чума"
/*-------------------------------------------------------*/
instance ItWr_DS2P_EkorSpisok(C_ITEM)
{
	name = "Листок";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ITWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DS2P_EkorSpisok;
	scemeName = "MAP";
	description = name;
	text[0] = "Список необходимого для Экора";
};

func void Use_DS2P_EkorSpisok()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"1 царский щавель");
	Doc_PrintLine(nDocID,0,"5 лечебных корней");
	Doc_PrintLine(nDocID,0,"5 листов огненной крапивы");
	Doc_PrintLine(nDocID,0,"3 листа синей бузины");
	Doc_PrintLine(nDocID,0,"5 бутылок вина");
	Doc_PrintLine(nDocID,0,"2 колбасы");
	Doc_PrintLine(nDocID,0,"1 сыр");
	Doc_PrintLine(nDocID,0,"");
	// TO DO
	//if(!Ekor_StartDialogChoice)
	//{
	//	Doc_PrintLine(nDocID,0,"1000 золотых монет");
	//};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};
/*-------------------------------------------------------*/
// Список от ^Ватраса^
// По квесту "Чума"
/*-------------------------------------------------------*/
instance ItWr_DS2P_VatrasSpisok_4MagicSword(C_ITEM)
{
	name = "Листок";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ITWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DS2P_VatrasSpisok_4MagicSword;
	scemeName = "MAP";
	description = name;
	text[0] = "Список необходимого для Ватраса";
};

func void Use_DS2P_VatrasSpisok_4MagicSword()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	/*//Это надо обсудить*/// TO DO
	Doc_PrintLine(nDocID,0,"3 куска магической руды");	
	Doc_PrintLine(nDocID,0,"1 жир крысокрота");
	Doc_PrintLine(nDocID,0,"1 язык огненной ящерицы");
	Doc_PrintLine(nDocID,0,"2 клыка краура");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};
/*-------------------------------------------------------*/
// Клинок от ^Ватраса^ для ранения дракона
// По квесту "Чума"
/*-------------------------------------------------------*/
instance ItMw_DS2P_Sword_4DRAGON(ItMw_1H_Sword)
{
	name = "Клинок";
	value = 50;
	damageTotal = 65;
	range = 75;
	cond_value[2] = 65;
	visual = "ItMw_DS_Sword_03.3DS";
	description = name;
	count[2] = damageTotal;
	count[3] = cond_value[2];
	count[5] = value;
};
/*-------------------------------------------------------*/
// Солнечное алоэ из Г2А
// По квесту "Разгневанные предки"
// Спаунится в пещере черного тролля после взятия квеста
/*-------------------------------------------------------*/
instance ItPl_DS2P_SunAloe(C_Item)
{
	name = "Солнечное алоэ";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_WOOD;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Strength_Herb_01;
};
