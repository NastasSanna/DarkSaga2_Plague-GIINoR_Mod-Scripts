

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
/*----������� � DS2----*/
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

// ������ �� ���, ��������
var int Apple_Bonus;
var int Dunkelpilz_Bonus;
var int Mandibles_Bonus;
var int Knows_Bloodfly;
var int Bloodfly_Bonus;


var int CurrentLevel;


// ***************** ����� ��� ���� *************************
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

//������ ������� �����
var int Orks_Level_Weapon_01;
var int Orks_Level_Weapon_02;

var int Read_StormPosohONCE;

//������ ������
var int GETTAINIK;
var int BONUSUSINGDAY;
var int WISPISCHARGED;
var int gettainikWISP;

var int Teach_2x2_Level1;				//�� �������� 1-�� ������ ������ "��� ������" -> � ZS_TALK_END 
var int Read_DS_Traktat;				//�� �������� �������

//�����
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

var int Second_Melee_Weapon_Equipped; //�� ���������� ������� 2-� ����
var int C_ds_Knows_Lou_Rezept;		//�� ����� ��� ������ ����� ��
var int C_ds_Knows_Lou_Rezept2;		//�� ����� ��� ������ ������� ����� ��
var int C_ds_Knows_Piratentod;		//�� ����� ��� ������ ������� �������

var int Equip_DS_Arrow;			//��������� ��� ������ ������ �� - ������;
var int Equip_DS_Bolt;			//��������� ��� ������ ������ �� - �����;

var int ShowTimeOnScreen;

var int pos_y_ds_log;

var int BOOMBOOM;						//�������� � �����

var int Time_Color;

var int DS_drinkBloodOfGhoul_havedrankGG;

//�����
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
//������� ��������
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

//�����������
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
//������� �����
var int stage;

var int telFireGol;

var int HERO_TALENT_SHIELD;	//NS - 10/03/16 �������� ����� ���� ��, ��� ������ ����

/*--------------------------------------------------------------*/
/*-----------DARKSAGA 2-----------------------------------------*/
/*--------------------------------------------------------------*/

const string CONST_str_TOPIC_MOD = "TOPIC_DS2P_";
const string CONST_str_MIS_MOD = "MIS_DS2P_";

/*---------------------������---------------------------------------------------------------/

// ��� ��������� ���������� ��������� �� ������� � LOG_MIS_..., ������ ��� ��������

/*---------------------�����_������---------------------------------------------------------*/

//���������� ��������
var int DSG_abholen_Time_str;				//����� ������� ����
var int DSG_abholen_Time_dex;				//����� ������� ��������
var int DSG_abholen_Time_hpmax;			//����� ������� ����.�����
//����� ��� ���������
var int DSG_abholen_atr_str;				//�������� ���������� ���� (int)
var int DSG_abholen_atr_dex;				//�������� ���������� �������� (int)
var int DSG_abholen_atr_hp;					//�������� ���������� ����� (int)

var int SKL_Alchemy;	//����� ��������
//* ����-������ ��������, ����� ������� �� ����� ������
//����� ����� ���� ��������� ������
const int RESULT_Fail_IngrSaved		= -1;	// ����� �� ����������, �� ����������� ��������
const int RESULT_Fail_IngrLost		= 0;	// ��� �������
const int RESULT_Success_1			= 1;	// ���������� ����� I ��.
const int RESULT_Success_2			= 2;	// ���������� ����� II ��.
const int RESULT_Success_3			= 3;	// ���������� ����� III ��.

//���������� ��� �������� ������� ��� ����������� �������� ������� � �������� � ������ �������
var int TEST_DIA_XXX;

var int DayNumber_LastTalkWithJack;	//����� ���, ����� ��������� ��� ���������� � ������.
var int Jack_GiveFish_Day;		//����, ����� ���� ��� ����.

var int Tamir_ScavengersDie_Count; //������� ������ ����������� �� ������ "����� ������"
var int Tamir_WargsDie_Count;	//������� ������ ������ �� ������ "����� ������"
var int Tamir_Trade_Snare;	//����� ������ �����.

var int Maria_GiveStew_Day;		//����, ����� ����� ��� ���.
var int Maria_ClothesReady_Day;		//����, ����� ����� ������ �������
var int Maria_MadeClothes;		//����� ������� �������

var int Gard_ChestForced;	//�� ������ ������ �����

var int Lan_BecameHuman;	//��� ���� ���������

var int Hero_KnowsDoorPassword;	//�� ����� ���������� ������ �� ����� � ������

var int Joseph_Busy;		//������ ���-�� ����, ����� ������ ���� ����� �� �����
var int Joseph_ReadyTime;	//����� ����� ����� �����
var int Joseph_WorksOn;		//��� �������� (ID ��������, -1 - �� ������ "����������� ��� ����")
var int Joseph_Tools4Huno_Got;		//������� � ������� ����������� ��� ����
var int Joseph_Fight;		//����������� � ��������
var int Joseph_ReturnIron_Day;	//����, ����� ������� ������� ������
var int Bauers_AboutIron_Count;	//������� �������� �������� �� ������ ����������� ������
	const int Bauers_AboutIron_Max = 4;	//������� ���� ��������
var int Joseph_RepairMill_Day;	//����, ����� ���������� ��������
var int Joseph_RepairMill_Done;	//�������, ��� �������� ��������
var int Joseph_GaveForgeBellows;	//������ ��� ��������� ����

var int Zedd_Competition;	//����� ������������� � ������� � ������
var int Zedd_Competition_NextDay;	//���� ���������� ������������
var int Zedd_Competition_Cnt;		//������� ������
var int Zedd_Recipes;		//����� ����� ��������� �������
//����� ������� ��� �������
	var int Zedd_Recipe_Booze_BullSeed_Once;
	var int Zedd_Recipe_Booze_GobboSmile_Once;
	var int Zedd_Recipe_Booze_Berserker_Once;
	var int Zedd_Recipe_Booze_TrollBooze_Once;
	var int Zedd_Recipe_Booze_MagicGrog_Once;
	var int Zedd_Recipe_Booze_Kamikaze_Once;
	
var int Viola_SuppliesGiven;	//������ �������� ����� �� ������ "�������� ��������"

var int Narev_GaveKey;		//����� ������� ���� �� �������

var int Kadar_KnowsKaraDead_Day;	//����, ����� ����� ����� � ������ ����


var int DIA_Tamir_WithRegardToNikki_CHOICE;		//����� �� � �������: ������, ��� ����� ����� ���� ��� ��� "�������"
const int NIKKI_IS_BAD_WOMAN = 1;	//����� ������
const int NIKKI_IS_GOOD_WOMAN = 2;	//����� �������
var int BAD_SUCCESS_MIS_DS2P_BrokenHeart;

var int Garon_Choice;		// ����� ������ ������� ��� ������
	const int Garon_Choice_Pirate	= 1;	//����� �������
	const int Garon_Choice_GoHome	= 2;	//���� �����
	const int Garon_Choice_GoForest	= 3;	//���� �����: ���������� � ����
var int Garon_FightPirates;	//�������� ����� � �������� �� ������ "���� ������"
	const int Garon_FightPirates_Started	= 1;	//��������
	const int Garon_FightPirates_Finished	= 2;	//����������� (�������� ����� �������)
	const int Garon_FightPirates_Canceled	= 3;	//�� ������
var int Garon_DeadInForest_HeroKnows;	//�� ����� ���� ������ � ����
	

var int Harok_FishGetDay;	//����� ����� ����� ����� ���� � ������
var int Harok_GaronDeadDay;	//����� ����� �����, ��� ����� ����� (���� �� ����� �������������)

var int Symon_Fight;	//��������� � �������� �� ������ "��� ���� ������!"
var int Symon_Gold500;		//������ ������� 500 �������
var int Symon_Gold1000;		//������ ������� 1000 �������
var int Symon_Gold_Day;		//����� ����������
var int Symon_Gold_TalkDay;	//����� ����� ��� ���������� �� ��� ������

var int JaAfFar_Waits;//���-��-��� ���� �� ���, ��� ��� ��������

var int Joined_Gobbos_Tribe;//�� ������������� � ������� ��������

var int GLOBAL_DSG_KEY_DIALOG; //
var int GLOBAL_DSG_KEY_DISDIALOG; //

const int GrayBeard_AboutGard = 1; // ��� ����������� ����� ������ � ����� �������� � �������� �����
var int GrayBeard_AboutGard_Ended; // �������� �� ������� ����� ������ � �������� � �������� �����

var int SueBaby_GrayBeard_Fight_End; //����������� �� ����� ����� ���, �� � ����� �������
const int SueBaby_GrayBeard_Fight = 0; // ������ ����� ����� ���, �� � ����� �������
/*
		0 - ����� �� ������
		1 - ����� ������
		2 - ���� ����� ������ ���� ��� �������� ����
		3 - ���� ����� ������ � �� ����� ��� ��������
		4 - ���� ����� ������ � ��� ����� ��� ��������
		5 - ���� ��� � �� ����� ��� ��������
		6 - ��������� ���� ��
		7 - ���������� ���� ���
*/

var int SueBaby_DecilineQuestTime; //����� ��� ���������� ��������� �� ��
var int SueBaby_IsKnownContinue; // ����� �� �� � ���, ��� ���� ��������� 24 ����
var int SueBaby_AboutGrayBeardSolution; // ����� �� �� � ������� �������� � ����� �������

var int GrayBeard_AttackIsOver; //��������� �� ����� ����� �� � ����� �������
const int GrayBeard_AttackWinner = 0; //��������, ��� ������� � ����� ����� �� � ����� �������
const int GrayBeard_AttackNum = 0; //������� �� ����� ��� ����� ����� ������� � ��
const int GB_CompetitionState = 0; // ������ �� ������������ ����� �� � ����� �������, � ��� ���������

/*
		0 - �� ������
		1 - ������
		2 - �� ���� ���������� �� 6 �����
		3 - �� ���� ���������� �� 6 �����, � ����� ������ ��� ����� � ������ ����
		4 - �� �� ����� �� 6 �����, � ����� ������ ���� ����������
		5 - ����� ������ ���� ����������, � �� ����� ��� � ������ ����
		6 - �� ���� ���������� �� 6 �����, � ����� ������ �� ���� ��� ������
		7 - �� �� ����� �� 6 �����, � ����� ������ ��� � ������
		8 - ����� ������ ���� ����������, � �� �� ���� ������ ���
*/

var int GB_CompetitionTime_01; // ������ ������� �� ��������� ������� ��������� (6 �����)
const int GB_Comp_01_Winner = 0; // ���������� ������� ���������
const int GB_Comp_02_Winner = 0; // ���������� ������� ���������
const int GB_Comp_03_Winner = 0; // ���������� �������� ���������
const int GrayBeard_Fallen = 40; // ���� ����, ��� ����� ������ ������
const int GG_Fallen = 40; // ���� ����, ��� �� ������
const int GB_DrinkCompetition = 0; // ������� ������ �������
var int GG_KilledShadowbeasts; // ���� �� �� ���������� �� 6 �����

var int Maria_KnowAboutDress; // ������ �� ����� ������� ������ ��
var int Nikki_KnowAboutDress; // ������ �� ����� ������� ������ ��

var int Lan_TalkDay; // ����� ���, ����� ��� ���� ���������
var int Vatras_NightmaresPotionTime; // ������ �������, ����� ������ ������ �����
var int LansDream_CageIsOpen; // ���������, ������� �� ������ �� ��� ����

var int Jorn_LastTalkDay; // ����� ���, ����� ������ ����� ������� �� ������������
const int AlternativeSamogon_FightAdo = 0; // ��� ������� � ������� � ���, ����� �� ��� ��� ������������

var int Joseph_CharmedBolts; // ����������� �����, ����� ������ ������� ���������� �����
var int Joseph_CharmedBoltsCreated; // ������ �� ������ ���������� �����

var int Hunters_IsNotKilled; // ����� �� �������� �� ������ "����� ��������� ���������"
var int EscapedHunters_QuestComplete; // ����� ��� �������� ����� "����� ��������� ���������"

var int GrayBeardSituation_IsOver; //������� �� ��� � ��������� �� ����� ������

var int SpecialAxe_FindAllIngr; // ����� �� �� ��� ����������� �� ������ "����������� ����� ��� �������"
var int Joseph_ReadyAxeTime; // ����� ����� ����� �����
var int Joseph_ReadyAxe; // ����� �� �����

var int Joseph_InConspiracy; // ���������� �� ������ �� ������� � ��������
var int Vales_InConspiracy; // ���������� �� ����� �� ������� � ��������
var int Zedd_InConspiracy; // ���������� �� ���� �� ������� � ��������
var int Symon_InConspiracy; // ���������� �� ������ �� ������� � ��������
var int SueBaby_InConspiracy; // ����������� �� ������� ��� �� ������� � ��������
var int Skip_InConspiracy; // ���������� �� ���� ����������� � ��������

var int Skip_GregFight; // ���������� ����. �� �����
var int Skip_IsGregFight; // ����� �� ���� �����

const int Conspiracy_Mode = 0; // ����� ����� ����������� ������ ����� ������ "�������"

/*
		0 - ������� � ������ �� ����
		1 - �� ������ ������� �����
		2 - �� ������ ������� �����
*/

var int Conspiracy_IsStarted; // �������� �� ����� �������� �������

var int Conspiracy_Alternative; // ���� �� ���� ����� �� ������ "�������"

var int Zedd_IsDrunken_Conspiracy; // ���� �� ������� ����� �� ������ "�������"
var int Hero_IsReadZeddDiary; // ������ �� �� ������� ����� �� ������ "��������� �� �����"

var int Vales_IsHeal; // ��������� �� ����� �� ��������

var int Cimm_CookSamogon;//���� ���������� ������� ��� �����

var int ShowClip;

var int temp_dsg_for_zamikaniya;


var int All_Pirat_Killed;	//��� ������ ������. ������ �� � �����. ����� ������
var int Symon_IsNot_Problem_4Cimm;	//������ �� ��������� ����� �� ������ "���������� ��������".
var int Cimm_HelpDay; //���� ������ ����� ����� ����-������ �� ������ ������ ������� ����.
var int EkorStartDialogChoice;	//����� ������ ������ � ������, ���� �������� ������ ������������.
var int PiratKillCount;	//NS ������� ������ �������. �� ������������?
var int PiratMainKillCount;	//NS ������� ������ ��������� �������
var int GGKillPirat_self_inVillage;	//NS ������� ������ �� �������

var int DIA_Talan_DopDialog;	//�������� ������ � ��������, ���� ��� �������.

var int PiratePatrol_Success; //�� � ��� ������� ����� � �������
var int Jinns_CreatingHeads; //����� ���� ����� ������ ������
var int Jinns_CreatedHeads; //���� ������ ������

var int SueBaby_WaitTimeQuest;	//����� ��� ���������, ��� ���� � ����� �������
var int SueBaby_WaitingIsOver;	//���������, ����� ��� ���������, ��� ���� � ����� �������

var int Hero_Knows_Gurun;	//�� ������� �� ����-�� � ������
var int Hero_Knows_OdDiOn;	//�� ����� �� ��-��-��� (���� � ��������)

//+++++++++++++++++++++++++ ������������ +++++++++++++++++++++++++++

var int CRIME_GG_KillPirat_self_inVillage_once;	//���� ������� �������� ������ ������ ������. ��� ������� �������������� �� �����.
var int CRIME_GG_KillPirat_Cnt_now;	//���-�� ������ ������� �� ������ ������� � ������ - ��� � ������.
var int CRIME_PiratesKilled_Cnt;	//������� ����� �������
var int CRIME_PiratesKilled_Paid;	//������� ������� ������� ��������
var int GG_Dolg_PeredGardom_ZaKillPirat;	//����, ��� �� ������ ����� �� �������� ������. ����� ��� ������ ���� �������.
var int WAR_HAS_COME;	//������ ��������� �� � �� ��� ���� �������.

//+++++++++++++++++++++++++ �������� � �������� +++++++++++++++++++++++++++
// ���/���� �������
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


