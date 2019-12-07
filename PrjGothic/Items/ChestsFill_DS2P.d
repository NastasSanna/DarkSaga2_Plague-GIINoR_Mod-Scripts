/*Здесь указывается наполнение сундуков*/
func void _fill_MOBCHEST_LAN_TREASURE_01()	//готов
{
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_01",ItMi_OldCoin,4);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_01",ItMi_Nugget,2);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_01",ItMi_GoldChest,3);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_01",ItMi_GoldNugget_Addon,10);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_01",ItAm_DS2P_InnosGift,1);
};
func void _fill_MOBCHEST_LAN_TREASURE_02()	//готов
{
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_02",ItMi_OldCoin,5);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_02",ItMi_Addon_WhitePearl,10);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_02",ItMi_Gold,200);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_02",ItBe_DS2P_GoodShot,1);
};
func void _fill_MOBCHEST_LAN_TREASURE_03()	//готов
{
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_03",ItMi_OldCoin,6);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_03",ItMi_GoldCup,5);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_03",ItMi_GoldChest,4);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_03",ItMi_GoldCandleHolder,3);
};
func void _fill_MOBCHEST_LAN_TREASURE_04()	//готов
{
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_04",ItMi_OldCoin,5);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_04",ItMi_Nugget,6);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_04",ItMi_Gold,300);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_04",ItMw_DS2P_BeliarHorror,1);
};
func void _fill_MOBCHEST_LAN_TREASURE_05()	//готов
{
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_05",ItMi_DarkPearl,1);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_05",ItMi_DS_Ametist,5);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_05",ItMi_DS_Izumrud,5);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_05",ItMi_DS_Almaz,3);
	Mob_CreateItems("MOBCHEST_LAN_TREASURE_05",ItAm_DS2P_AdanosGift,1);
};
/*Сундук на разбитом корабле по квесту: "Потерянные чертежи"*/
func void _fill_MOBCHEST_QUEST_LOSTDRAWINGS()	//готов
{
	Mob_CreateItems("MOBCHEST_QUEST_LOSTDRAWINGS",ItMi_Gold,300);
	Mob_CreateItems("MOBCHEST_QUEST_LOSTDRAWINGS",ItMi_IronOre,3);
	Mob_CreateItems("MOBCHEST_QUEST_LOSTDRAWINGS",ItWr_DS2P_Drawing_01__Q,1);
	Mob_CreateItems("MOBCHEST_QUEST_LOSTDRAWINGS",ItWr_DS2P_Drawing_02__Q,1);
	Mob_CreateItems("MOBCHEST_QUEST_LOSTDRAWINGS",ItWr_DS2P_Drawing_03__Q,1);
	Mob_CreateItems("MOBCHEST_QUEST_LOSTDRAWINGS",ItWr_DS2P_Drawing_04__Q,1);
	Mob_CreateItems("MOBCHEST_QUEST_LOSTDRAWINGS",ItWr_DS2P_Drawing_05__Q,1);
};
/*Сундук Хуно по квесту: "Оружие для борьбы"*/
func void _fill_MOBCHEST_HUNO()	//готов
{
	Mob_CreateItems("MOBCHEST_HUNO",ItMi_Gold, 50 + Hlp_Random(100));
	Mob_CreateItems("MOBCHEST_HUNO",ITMI_DS2P_IRONORE_NUGGET_BIG, 1);
	Mob_CreateItems("MOBCHEST_HUNO",ItMiSwordraw, 1 + Hlp_Random(3));
};
/*Сундук Барока по квесту: "Оружие для борьбы"*/
func void _fill_MOBCHEST_BAROK()	//готов
{
	Mob_CreateItems("MOBCHEST_BAROK",ItMi_Gold, 50 + Hlp_Random(100)); //???
	Mob_CreateItems("MOBCHEST_BAROK",ITMI_DS2P_IRONORE_NUGGET_BIG, 1);	//???
	Mob_CreateItems("MOBCHEST_BAROK",ItMiSwordraw, 1 + Hlp_Random(3));	//???
};
/*Сундук АЛАСТЕРА*/
func void _fill_MOBCHEST_ALASTER()	//готов
{
	Mob_CreateItems("MOBCHEST_ALASTER",ItMi_Gold, 50 + Hlp_Random(100)); 
	Mob_CreateItems("MOBCHEST_ALASTER",ITAR_HUN_BLACKTROLL, 1);
};
