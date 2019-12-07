

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

var int DayNumber_LastTalkWithJack;	//Номер дня, когда последний раз поговорили с Джеком.
var int Jack_GiveFish_Day;		//День, когда Джек дал рыбу.

var int Tamir_ScavengersDie_Count; //Счётчик убитых падальщиков по квесту "Выбор Тамира"
var int Tamir_WargsDie_Count;	//Счётчик убитых варгов по квесту "Выбор Тамира"
var int Tamir_Trade_Snare;	//Тамир продаёт силки.

var int Maria_GiveStew_Day;		//День, когда Мария даёт суп.
var int Maria_ClothesReady_Day;		//День, когда Мария сошьет костюмы
var int Maria_MadeClothes;		//Мария сделала костюмы

var int Gard_ChestForced;	//ГГ вскрыл сундук Гарда

var int Lan_BecameHuman;	//Лан стал человеком

var int Hero_KnowsDoorPassword;	//ГГ узнал правильный пароль от двери в пещеру

var int Joseph_Busy;		//Джозеф что-то кует, новые заказы пока брать не будет
var int Joseph_ReadyTime;	//Когда заказ будет готов
var int Joseph_WorksOn;		//Что заказали (ID предмета, -1 - по квесту "Инструменты для Хуно")
var int Joseph_Tools4Huno_Got;		//Забрали у Джозефа инструменты для Хуно
var int Joseph_Fight;		//Разминаемся с Джозефом
var int Joseph_ReturnIron_Day;	//День, когда вернули Джозефу железо
var int Bauers_AboutIron_Count;	//сколько крестьян опросили по поводу украденного железа
	const int Bauers_AboutIron_Max = 4;	//сколько надо опросить
var int Joseph_RepairMill_Day;	//День, когда заработает мельница
var int Joseph_RepairMill_Done;	//Отметка, что мельницу включили
var int Joseph_GaveForgeBellows;	//Джозеф дал кузнечные меха

var int Zedd_Competition;	//Можно соревноваться в выпивке с Зеддом
var int Zedd_Competition_NextDay;	//День следующего соревнования
var int Zedd_Competition_Cnt;		//Сколько выпили
var int Zedd_Recipes;		//Зедду можно продавать рецепты
//какие рецепты уже продали
	var int Zedd_Recipe_Booze_BullSeed_Once;
	var int Zedd_Recipe_Booze_GobboSmile_Once;
	var int Zedd_Recipe_Booze_Berserker_Once;
	var int Zedd_Recipe_Booze_TrollBooze_Once;
	var int Zedd_Recipe_Booze_MagicGrog_Once;
	var int Zedd_Recipe_Booze_Kamikaze_Once;
	
var int Viola_SuppliesGiven;	//Отдали продукты Виоле по квесту "Доставка припасов"

var int Narev_GaveKey;		//Нарев передал ключ от сундука

var int Kadar_KnowsKaraDead_Day;	//День, когда Кадар узнал о смерти Кары


var int DIA_Tamir_WithRegardToNikki_CHOICE;		//Выбор ГГ в диалоге: решить, что Никки убила Коло или она "хорошая"
const int NIKKI_IS_BAD_WOMAN = 1;	//Никки плохая
const int NIKKI_IS_GOOD_WOMAN = 2;	//Никки хорошая
var int BAD_SUCCESS_MIS_DS2P_BrokenHeart;

var int Garon_Choice;		// какую судьбу выбрали для Гарона
	const int Garon_Choice_Pirate	= 1;	//стать пиратом
	const int Garon_Choice_GoHome	= 2;	//идти домой
	const int Garon_Choice_GoForest	= 3;	//свой выбор: спрятаться в лесу
var int Garon_FightPirates;	//началась драка с пиратами по квесту "Внук рыбака"
	const int Garon_FightPirates_Started	= 1;	//началась
	const int Garon_FightPirates_Finished	= 2;	//закончилась (вырубили обоих пиратов)
	const int Garon_FightPirates_Canceled	= 3;	//ГГ сбежал
var int Garon_DeadInForest_HeroKnows;	//ГГ нашел труп Гарона в лесу
	

var int Harok_FishGetDay;	//когда можно будет взять рыбу у Харока
var int Harok_GaronDeadDay;	//когда Харок узнал, что Гарон мертв (день не будет разговаривать)

var int Symon_Fight;	//подрались с Саймоном по квесту "Мой друг Саймон!"
var int Symon_Gold500;		//Саймон требует 500 золотых
var int Symon_Gold1000;		//Саймон требует 1000 золотых
var int Symon_Gold_Day;		//когда потребовал
var int Symon_Gold_TalkDay;	//когда будет сам напоминать ГГ про должок

var int JaAfFar_Waits;//Джа-Аф-Фар ждет ГГ там, где его оставили

var int Joined_Gobbos_Tribe;//ГГ присоединился к племени гоблинов

var int GLOBAL_DSG_KEY_DIALOG; //
var int GLOBAL_DSG_KEY_DISDIALOG; //

const int GrayBeard_AboutGard = 1; // Где остановился Серая Борода в своем рассказе о капитане Гарде
var int GrayBeard_AboutGard_Ended; // Прервана ли история Серой Бороды в рассказе о капитане Гарде

var int SueBaby_GrayBeard_Fight_End; //Закончилась ли битва между Сью, ГГ и Серой Бородой
const int SueBaby_GrayBeard_Fight = 0; // Статус битвы между Сью, ГГ и Серой бородой
/*
		0 - битва не начата
		1 - битва начата
		2 - если Серая Борода упал без сознания один
		3 - если Серая Борода и ГГ упали без сознания
		4 - если Серая Борода и Сью упали без сознания
		5 - если Сью и ГГ упали без сознания
		6 - вырубился один ГГ
		7 - вырубилась одна Сью
*/

var int SueBaby_DecilineQuestTime; //Когда Сью перестанет обижаться на ГГ
var int SueBaby_IsKnownContinue; // Знает ли ГГ о том, что надо подождать 24 часа
var int SueBaby_AboutGrayBeardSolution; // Знает ли ГГ о решение ситуации с Серой Бородой

var int GrayBeard_AttackIsOver; //Закончена ли драка между ГГ и Серой Бородой
const int GrayBeard_AttackWinner = 0; //Проверка, кто победит в драке между ГГ и Серой Бородой
const int GrayBeard_AttackNum = 0; //Который по счету бой между Серой Бородой и ГГ
const int GB_CompetitionState = 0; // Начато ли соревнование между ГГ и Серой Бородой, и его состояние

/*
		0 - не начато
		1 - начато
		2 - ГГ убил мракорисов до 6 часов
		3 - ГГ убил мракорисов до 6 часов, а Серая Борода его побил и забрал рога
		4 - ГГ не успел до 6 часов, и Серая Борода убил мракорисов
		5 - Серая Борода убил мракорисов, а ГГ побил его и забрал рога
		6 - ГГ убил мракорисов до 6 часов, и Серая Борода не смог его побить
		7 - ГГ не успел до 6 часов, и Серая Борода уже в лагере
		8 - Серая Борода убил мракорисов, а ГГ не смог побить его
*/

var int GB_CompetitionTime_01; // Отсчет времени до окончания первого испытания (6 часов)
const int GB_Comp_01_Winner = 0; // Победитель первого испытания
const int GB_Comp_02_Winner = 0; // Победитель второго испытания
const int GB_Comp_03_Winner = 0; // Победитель третьего испытания
const int GrayBeard_Fallen = 40; // Шанс того, что Серая Борода упадет
const int GG_Fallen = 40; // Шанс того, что ГГ упадет
const int GB_DrinkCompetition = 0; // Сколько выпито бутылок
var int GG_KilledShadowbeasts; // Убил ли ГГ мракорисов за 6 часов

var int Maria_KnowAboutDress; // Готова ли Мария продать платье ГГ
var int Nikki_KnowAboutDress; // Готова ли Никки продать платье ГГ

var int Lan_TalkDay; // Номер дня, когда Лан стал человеком
var int Vatras_NightmaresPotionTime; // Отсчет времени, когда Ватрас сварит зелье
var int LansDream_CageIsOpen; // Проверяем, открыта ли клетка во сне Лана

var int Jorn_LastTalkDay; // Номер дня, когда отдали Йорну самогон со слабительным
const int AlternativeSamogon_FightAdo = 0; // Кто победил в схватке с Адо, когда ГГ дал ему слабительное

var int Joseph_CharmedBolts; // Отсчитываем время, когда Джозеф создаст магические болты
var int Joseph_CharmedBoltsCreated; // Создал ли Джозеф магические болты

var int Hunters_IsNotKilled; // Убиты ли охотники по квесту "Найти сбежавших охотников"
var int EscapedHunters_QuestComplete; // Когда был выполнен квест "Найти сбежавших охотников"

var int GrayBeardSituation_IsOver; //Доложил ли Сью о поражении от Серой Бороды

var int SpecialAxe_FindAllIngr; // Нашел ли ГГ все ингредиенты по квесту "Специальный топор для Джозефа"
var int Joseph_ReadyAxeTime; // Когда будет готов топор
var int Joseph_ReadyAxe; // Готов ли топор

var int Joseph_InConspiracy; // Согласился ли Джозеф на участие в заговоре
var int Vales_InConspiracy; // Согласился ли Валес на участие в заговоре
var int Zedd_InConspiracy; // Согласился ли Зедд на участие в заговоре
var int Symon_InConspiracy; // Согласился ли Саймон на участие в заговоре
var int SueBaby_InConspiracy; // Согласилась ли Малышка Сью на участие в заговоре
var int Skip_InConspiracy; // Согласился ли Скип участвовать в заговоре

var int Skip_GregFight; // Запоминает макс. хп Скипа
var int Skip_IsGregFight; // Побил ли Грег Скипа

const int Conspiracy_Mode = 0; // Какой выбор прохождения выбрал игрок квеста "Заговор"

/*
		0 - диалога с Гардом не было
		1 - ГГ выбрал сторону Грега
		2 - ГГ выбрал сторону Гарда
*/

var int Conspiracy_IsStarted; // Началось ли общее собрание пиратов

var int Conspiracy_Alternative; // Убил ли Гард Грега по квесту "Заговор"

var int Zedd_IsDrunken_Conspiracy; // Дали ли Выпивку Зедду по квесту "Заговор"
var int Hero_IsReadZeddDiary; // Прочел ли ГГ учетную книгу по квесту "Компромат на Зедда"

var int Vales_IsHeal; // Вылечился ли Валес от заикания

var int Cimm_CookSamogon;//Цимм приготовил самогон для Йорна

var int ShowClip;

var int temp_dsg_for_zamikaniya;


var int All_Pirat_Killed;	//Все пираты мертвы. Остров не в осаде. Квест закрыт
var int Symon_IsNot_Problem_4Cimm;	//Саймон не беспокоит Цимма по квесту "Несчастный целитель".
var int Cimm_HelpDay; //Цимм сказал зайти через денёк-другой по поводу поиска решений чумы.
var int EkorStartDialogChoice;	//Какой выбрал диалог с Экором, чтоб получить список ингредиентов.
var int PiratKillCount;	//NS счетчик убитых пиратов. не используется?
var int PiratMainKillCount;	//NS счетчик убитых квестовых пиратов
var int GGKillPirat_self_inVillage;	//NS счетчик убитых ГГ пиратов

var int DIA_Talan_DopDialog;	//Вызывает диалог с драконом, если его ударить.

var int PiratePatrol_Success; //ГГ и Том подошли ближе к пиратам
var int Jinns_CreatingHeads; //когда Джин начал делать головы
var int Jinns_CreatedHeads; //Джин сделал головы

var int SueBaby_WaitTimeQuest;	//когда Сью придумает, как быть с Серой Бородой
var int SueBaby_WaitingIsOver;	//дождались, когда Сью придумает, как быть с Серой Бородой

var int Hero_Knows_Gurun;	//ГГ услышал от кого-то о Гуруне
var int Hero_Knows_OdDiOn;	//ГГ узнал об Од-Ди-Оне (Экор у гобилнов)

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

var int TRADE_Joseph;
var int TRADE_Zedd;
var int TRADE_KuLa;

var int MADE_Weapon_Joseph;


