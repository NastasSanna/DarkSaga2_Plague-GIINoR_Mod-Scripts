

var int MagicOreTruemmer_Count;
var int SilverOreTruemmer_Count;
var int Knows_magicOreTruemmerSchlag;
var int Hero_MagicOreHackChance;
var int Learn_DS_MagicOre_By_Doing;
var int MagicOreCounter;
var int MagicOreFirstAttempt;

const int T_MEGA = 300;
const int T_MAX = 200;
const int T_HIGH = 120;
const int T_MED = 90;
const int T_LOW = 60;
/*----ВВЕДЕНЫ В DS2----*/
const int T_HP_MEGA = 600;
const int T_HP_MAX = 500;
const int T_HP_HIGH = 400;
const int T_HP_MED = 300;
const int T_HP_LOW  = 200;
const int T_MANA_MEGA = 300;
const int T_MANA_MAX = 250;
const int T_MANA_HIGH = 200;
const int T_MANA_MED = 150;
const int T_MANA_LOW  = 100;
/*---------------------*/

var int HP_Ring_1_Equipped;
var int HP_Ring_2_Equipped;
var int HP_Amulett_Equipped;
var int HP_Artefakt_Effekt;
var int MA_Ring_1_Equipped;
var int MA_Ring_2_Equipped;
var int MA_Amulett_Equipped;
var int MA_Artefakt_Effekt;
var int STR_Ring_1_Equipped;
var int STR_Ring_2_Equipped;
var int STR_Amulett_Equipped;
var int STR_Artefakt_Effekt;
var int LeatherArmor_Equipped;
var int SLDArmor_Equipped;
var int NOVArmor_Equipped;
var int KDFArmor_Equipped;
var int MILArmor_Equipped;
var int MCArmor_Equipped;
var int KDF01_Equipped;
var int KDF02_Equipped;
var int KDF03_Equipped;
var int MIL01_Equipped;
var int MIL02_Equipped;
var int MIL03_Equipped;
var int NOV01_Equipped;
var int SLD01_Equipped;
var int SLD02_Equipped;
var int SLD03_Equipped;
var int PIR_DS_Belt_ALI_Equipped;
var int PIR_DS_Armor_Equipped;
var int Leather01_Equipped;
var int Leather02_Equipped;
var int MC_Equipped;
var int wispskill_level;

var int MadKillerCount;
var int SCUsed_TELEPORTER;
var int StPl_nDocID;
var int BeliarsWeaponSpecialDamage;
var int BeliarDamageChance;
var int SC_FailedToEquipBeliarsWeapon;
var int BeliarsWeaponUpgrated;
var int Hero_HackChance;
var int SC_MadeStunt;
var int Knows_Banditenaxt;
var int StuntBonus_Once;
var int Kapitel;

const int Theftdiff = 10;
var int TheftDexGlob;
var int TheftGoldGlob;

// БОНУСЫ от еды, растений
var int Apple_Bonus;
var int Dunkelpilz_Bonus;
var int Mandibles_Bonus;
var int Knows_Bloodfly;
var int Bloodfly_Bonus;


var int CurrentLevel;


// ***************** Перем для книг *************************
var int	Read_OreEarth;
var int Read_OreMagi;
var int Read_KeepLight;
var int Read_LogGard;
var int Read_TeachSeek;
var int Read_InnosWindow;
var int	Read_Sorn;
var int	Read_BaseMagi;
var int	Read_WayLight;
var int Read_Artef;
var int Read_ClearForce;
var int Read_FireCup;
var int Read_OrcLegend;
var int Read_LogRunner;

//Боевая система орков
var int Orks_Level_Weapon_01;
var int Orks_Level_Weapon_02;

var int Read_StormPosohONCE;

//ищущий огонек
var int GETTAINIK;
var int BONUSUSINGDAY;
var int WISPISCHARGED;
var int gettainikWISP;

var int Teach_2x2_Level1;				//ГГ обучился 1-му уровню навыка "Два Клинка" -> в ZS_TALK_END 
var int Read_DS_Traktat;				//ГГ прочитал трактат

//Ковка
var int Weapon_Ds_CrossBowPurpose;
var int Weapon_Ds_CrossBowLucklyTroll;
var int Weapon_Ds_CrossBowDawn;
var int Weapon_Ds_CrossBowStarSong;
var int Weapon_Ds_Arrow;
var int Weapon_Ds_Bolt;

var int hero_talent_1H;
var int hero_talent_2H;
var int hero_talent_bow;
var int hero_talent_crossbow;

var string Description_marvin;

var int Second_Melee_Weapon_Equipped; //ГГ экипирован оружием 2-й руки
var int C_ds_Knows_Lou_Rezept;		//ГГ знает как варить Молот Лу
var int C_ds_Knows_Lou_Rezept2;		//ГГ знает как варить Двойной Молот Лу
var int C_ds_Knows_Piratentod;		//ГГ знает как варить Быструю Селедку

var int Equip_DS_Arrow;			//Выбранный тип заряда оружия ДБ - стрелы;
var int Equip_DS_Bolt;			//Выбранный тип заряда оружия ДБ - болты;

var int ShowTimeOnScreen;

var int pos_y_ds_log;

var int BOOMBOOM;						//постучал в дверь

var int Time_Color;

var int DS_drinkBloodOfGhoul_havedrankGG;

//Ковка
var int Weapon_Ds_Star;
var int Weapon_Ds_Subjugator;
var int Weapon_Ds_Punishment;
var int Weapon_Ds_Destruction;
var int Weapon_Ds_KillOrks;
var int Weapon_Ds_BowHunter;
var int Weapon_Ds_BowWind;
var int Weapon_Ds_BowRush;
var int Weapon_Ds_BowHunterWisdom;
var int Weapon_Ds_BowMorningDawn;

var int Weapon_Ds_RevengePirates;
var int Weapon_Ds_SwordMaster;
var int Weapon_Ds_Volnorez;
var int Weapon_Ds_KillZombie;

var int Weapon_Ds_KrashAgar;
var int Weapon_Ds_KrashDargot;
var int Weapon_Ds_AngerOrk;
var int Weapon_Ds_OkoBeliar;
var int Weapon_Ds_NuggetSubjugator;
var int Weapon_Ds_BearingDeath;

var int Weapon_Ds_Stick;
var int Weapon_Ds_ToothWolf;
var int Weapon_Ds_BloodSword;
//
//Времена эффектов
const int conTime_BlackCharDown = 90;
const int conTime_STRDrained = 90;
const int conTime_BlackLifeDown = 90;
const int conTime_DexUp = 120;
const int conTime_SpeedUp = 150;
const int conTime_SWORDPCON = 120;
const int conTime_CharUp = 120;
var int Time_BlackCharDown;
var int Time_STRDrained;
var int Time_BlackLifeDown;
var int Time_DexUp;
var int Time_SpeedUp;
var int Time_SWORDPCON;
var int Time_CharUp;

//Регенерация
var int RegenMana_from_Ring;
var int RegenMana_from_Amulet;
var int RegenMana_from_Armor;
//var int RegenMana_from_2Item;
//var int RegenMana_from_3Item;
var int RegenHP_from_Ring;
var int RegenHP_from_Amulet;
var int RegenHP_from_Armor;
//var int RegenHP_from_2Item;
//var int RegenHP_from_3Item;
var int time_to_regenMana;
var int varTime_to_RegenMana;
var int time_to_regenHP;
var int varTime_to_RegenHP;
//счетчик цикла
var int stage;

var int telFireGol;

var int HERO_TALENT_SHIELD;	//NS - 10/03/16 реальный навык щита ГГ, для кольца щита

/*--------------------------------------------------------------*/
/*-----------DARKSAGA 2-----------------------------------------*/
/*--------------------------------------------------------------*/

const string CONST_str_TOPIC_MOD = "TOPIC_DS2P_";
const string CONST_str_MIS_MOD = "MIS_DS2P_";

/*---------------------КВЕСТЫ---------------------------------------------------------------/

// ВСЕ квестовые переменные раскидать по квестам в LOG_MIS_..., нечего тут мусорить

/*---------------------КОНЕЦ_КВЕСТЫ---------------------------------------------------------*/

//объявление таймеров
var int DSG_abholen_Time_str;				//время эффекта силы
var int DSG_abholen_Time_dex;				//время эффекта ловкости
var int DSG_abholen_Time_hpmax;			//время эффекта макс.жизни
//флаги для атрибутов
var int DSG_abholen_atr_str;				//значение повышенной силы (int)
var int DSG_abholen_atr_dex;				//значение повышенной ловкости (int)
var int DSG_abholen_atr_hp;					//значение повышенной жизни (int)

var int SKL_Alchemy;	//навык алхимика
//* куда-нибудь отдельно, можно отнести ко всему крафту
//какой может быть результат крафта
const int RESULT_Fail_IngrSaved		= -1;	// зелье не получилось, но ингредиенты остались
const int RESULT_Fail_IngrLost		= 0;	// все погибло
const int RESULT_Success_1			= 1;	// получилось зелье I ур.
const int RESULT_Success_2			= 2;	// получилось зелье II ур.
const int RESULT_Success_3			= 3;	// получилось зелье III ур.

//Переменные для закрытия квестов или продолжения сюжетной линейки в диалогах в случае косяков
var int TEST_DIA_XXX;
var int GLOBAL_DSG_KEY_DIALOG;

var int ShowClip;

var int temp_dsg_for_zamikaniya;


var int All_Pirat_Killed;	//Все пираты мертвы. Остров не в осаде. Квест закрыт
var int PiratKillCount;	//NS счетчик убитых пиратов. не используется?
var int PiratMainKillCount;	//NS счетчик убитых квестовых пиратов
var int GGKillPirat_self_inVillage;	//NS счетчик убитых ГГ пиратов

var int Windmill_Enabled; // починили мельницу и она должна крутиться

//+++++++++++++++++++++++++ ПРЕСТУПЛЕНИЯ +++++++++++++++++++++++++++

var int CRIME_GG_KillPirat_self_inVillage_once;	//Факт первого убийства героем любого пирата. Для первого предупреждения от Гарда.
var int CRIME_GG_KillPirat_Cnt_now;	//Кол-во убитых пиратов на момент диалога с Гардом - ему в память.
var int CRIME_PiratesKilled_Cnt;	//сколько убито пиратов
var int CRIME_PiratesKilled_Paid;	//сколько смертей пиратов оплачено
var int GG_Dolg_PeredGardom_ZaKillPirat;	//Факт, что ГГ должен Гарду за убийство пирата. Нужен для памяти всех пиратов.
var int WAR_HAS_COME;	//Пираты ненавидят ГГ и их уже надо убивать.

//+++++++++++++++++++++++++ ОБУЧЕНИЕ И ТОРГОВЛЯ +++++++++++++++++++++++++++
// вкл/выкл диалоги
var int TEACH_Joseph_Smith;
var int TEACH_Joseph_Str;
var int TEACH_Maria_Theft;
var int TEACH_Ado_Theft;
var int TEACH_Ado_Dex;
var int TEACH_Symon_2H;
var int TEACH_RakTarak;
var int TEACH_KuLa;
var int TEACH_RaDaPo;
var int TEACH_Ekor;
var int TEACH_JaAfFar;
var int TEACH_Cimm;
var int TEACH_Tamir;

var int TRADE_Joseph;
var int TRADE_Zedd;
var int TRADE_KuLa;

var int MADE_Weapon_Joseph;

//++++++++++++++++++++++++++ ТЕЛЕПОРТЫ ++++++++++++++++++++++++++++++++++
var int SCUsed_TELEPORTER_TOWN;
var int SCUsed_TELEPORTER_CAMPCAVE;
var int SCUsed_TELEPORTER_RUINS;
var int SCUsed_TELEPORTER_SWAMP;
var int SCUsed_TELEPORTER_LIBRARY;
