
var int bonuswisp;
var int bonuswisparmor;
var int bonuswisparmor01;
var int bonuswisparmor02;
var int bonuswisparmor03;
var int bonuswispregenerationmana;
var int bonuswispregenerationhp;
var int bonuswispattack;
var int bonuswispattack01;
var int bonuswispattack02;
var int bonuswispattack03;
var int bonuswisplight;
var int bonuswispfinding;
var int poison;
const int SQ_NONE = 0;
const int SQ_NONE_SECOND = 1;
const int SQ_DENY = 2;
const int SQ_AGREE = 3;
const int SQ_DENYANDWON = 4;
const int SQ_DENYANDLOST = 5;
const int AIV_LastFightAgainstPlayer = 0;
const int FIGHT_NONE = 0;
const int FIGHT_LOST = 1;
const int FIGHT_WON = 2;
const int FIGHT_CANCEL = 3;

const int AIV_NpcSawPlayerCommit = 1;
const int CRIME_NONE = 0;
const int CRIME_SHEEPKILLER = 1;
const int CRIME_ATTACK = 2;
const int CRIME_THEFT = 3;
const int CRIME_MURDER = 4;

const int AIV_NpcSawPlayerCommitDay = 2;
const int AIV_NpcStartedTalk = 3;
const int AIV_INVINCIBLE = 4;
const int AIV_TalkedToPlayer = 5;
const int AIV_PlayerHasPickedMyPocket = 6;
const int AIV_LASTTARGET = 7;
const int AIV_PursuitEnd = 8;

const int AIV_ATTACKREASON = 9;
const int AR_NONE = 0;
const int AR_LeftPortalRoom = 1;
const int AR_ClearRoom = 2;
const int AR_GuardCalledToRoom = 3;
const int AR_MonsterVsHuman = 4;
const int AR_MonsterMurderedHuman = 5;
const int AR_SheepKiller = 6;
const int AR_Theft = 7;
const int AR_UseMob = 8;
const int AR_GuardCalledToThief = 9;
const int AR_ReactToWeapon = 10;
const int AR_ReactToDamage = 11;
const int AR_GuardStopsFight = 12;
const int AR_GuardCalledToKill = 13;
const int AR_GuildEnemy = 14;
const int AR_HumanMurderedHuman = 15;
const int AR_MonsterCloseToGate = 16;
const int AR_GuardStopsIntruder = 17;
const int AR_SuddenEnemyInferno = 18;
const int AR_KILL = 19;
const int AR_SQUEEZY = 20;			//Redleha:��������������

const int AIV_RANSACKED = 10;
const int AIV_DeathInvGiven = 11;

const int AIV_Guardpassage_Status = 12;
const int GP_NONE = 0;
const int GP_FirstWarnGiven = 1;
const int GP_SecondWarnGiven = 2;

const int AIV_LastDistToWP = 13;
const int AIV_PASSGATE = 14;
const int AIV_PARTYMEMBER = 15;
const int AIV_VictoryXPGiven = 16;

const int AIV_Gender = 17;
const int MALE = 0;
const int FEMALE = 1;

const int AIV_Food = 18;
const int FOOD_Apple = 0;
const int FOOD_Cheese = 1;
const int FOOD_Bacon = 2;
const int FOOD_Bread = 3;

const int AIV_TAPOSITION = 19;
const int ISINPOS = 0;
const int NOTINPOS = 1;
const int NOTINPOS_WALK = 2;

const int AIV_SelectSpell = 20;
const int AIV_SeenLeftRoom = 21;
var int Player_SneakerComment;
var int Player_LeftRoomComment;
var int Player_DrawWeaponComment;
var int Player_GetOutOfMyBedComment;

const int AIV_HitByOtherNpc = 22;
const int AIV_WaitBeforeAttack = 23;
const int AIV_LastAbsolutionLevel = 24;
const int AIV_ToughGuyNewsOverride = 25;
const int AIV_MM_ThreatenBeforeAttack = 26;

const int AIV_MM_FollowTime = 27;
const int FOLLOWTIME_SHORT = 5;
const int FOLLOWTIME_MEDIUM = 10;
const int FOLLOWTIME_LONG = 20;

const int AIV_MM_FollowInWater = 28;

const int AIV_MM_PRIORITY = 29;
const int PRIO_EAT = 0;
const int PRIO_ATTACK = 1;

//REDLEHA/10.12.2013
//���� ���������, ����� ���������� �� �����. AIV_MM_*[START|END] START=0;END=1;
const int AIV_MM_SleepStart = 30;
const int AIV_MM_SleepEnd = 31;
const int AIV_MM_RestStart = 32;
const int AIV_MM_RestEnd = 33;
const int AIV_MM_RoamStart = 34;
const int AIV_MM_RoamEnd = 35;
const int AIV_MM_EatGroundStart = 36;
const int AIV_MM_EatGroundEnd = 37;
const int AIV_MM_WuselStart = 38;
const int AIV_MM_WuselEnd = 39;
const int AIV_MM_OrcSitStart = 40;
const int AIV_MM_OrcSitEnd = 41;
const int OnlyRoutine = -1;

const int AIV_MM_ShrinkState = 42;

const int AIV_MM_REAL_ID = 43;
const int ID_MEATBUG = 1;
const int ID_SHEEP = 2;
const int ID_GOBBO_GREEN = 3;
const int ID_GOBBO_BLACK = 4;
const int ID_GOBBO_SKELETON = 5;
const int ID_SUMMONED_GOBBO_SKELETON = 6;
const int ID_SCAVENGER = 7;
const int ID_SCAVENGER_DEMON = 8;
const int ID_Giant_Rat = 8;
const int ID_GIANT_BUG = 9;
const int ID_BLOODFLY = 10;
const int ID_WARAN = 11;
const int ID_FIREWARAN = 12;
const int ID_WOLF = 13;
const int ID_WARG = 14;
const int ID_SUMMONED_WOLF = 15;
const int ID_MINECRAWLER = 16;
const int ID_MINECRAWLERWARRIOR = 17;
const int ID_LURKER = 18;
const int ID_SKELETON = 19;
const int ID_SUMMONED_SKELETON = 20;
const int ID_SKELETON_MAGE = 21;
const int ID_ZOMBIE = 22;
const int ID_SNAPPER = 23;
const int ID_DRAGONSNAPPER = 24;
const int ID_SHADOWBEAST = 25;
const int ID_SHADOWBEAST_SKELETON = 26;
const int ID_HARPY = 27;
const int ID_STONEGOLEM = 28;
const int ID_FIREGOLEM = 29;
const int ID_ICEGOLEM = 30;
const int ID_SUMMONED_GOLEM = 31;
const int ID_DEMON = 32;
const int ID_SUMMONED_DEMON = 33;
const int ID_DEMON_LORD = 34;
const int ID_TROLL = 35;
const int ID_TROLL_BLACK = 36;
const int ID_SWAMPSHARK = 37;
const int ID_DRAGON_FIRE = 38;
const int ID_DRAGON_ICE = 39;
const int ID_DRAGON_ROCK = 40;
const int ID_DRAGON_SWAMP = 41;
const int ID_DRAGON_UNDEAD = 42;
const int ID_MOLERAT = 43;
const int ID_ORCWARRIOR = 44;
const int ID_ORCSHAMAN = 45;
const int ID_ORCELITE = 46;
const int ID_UNDEADORCWARRIOR = 47;
const int ID_DRACONIAN = 48;
const int ID_ORCTOWER = 49;
const int ID_Alligator = 50;
const int ID_Swampgolem = 51;
const int ID_Stoneguardian = 52;
const int ID_Gargoyle = 53;
const int ID_Bloodhound = 54;
const int ID_Icewolf = 55;
const int ID_OrcBiter = 56;
const int ID_Razor = 57;
const int ID_Swarm = 58;
const int ID_Swamprat = 59;
const int ID_BLATTCRAWLER = 60;
const int ID_SummonedGuardian = 61;
const int ID_SummonedZombie = 62;
const int ID_Keiler = 63;
const int ID_SWAMPDRONE = 64;
//Redleha:����� ��������----
const int ID_NEW_MONSTER = 65; //������ ����
const int ID_GOBBO_MAGE = 66;	//������-�����
const int ID_SKELETON_MILAR = 67;
const int ID_FRIENDLY_WOLF = 68;
const int ID_DRAKE = 69;
const int ID_KARAKUS = 70;
const int ID_GOBBO_BERSERK = 71;
const int ID_SLEEPKEEPER = 72;	//������
const int ID_GNORE = 73;		//��������
const int ID_MINECRAWLER_QUEEN = 74;
const int ID_WOLF_UNDEAD = 75;
const int ID_STORMGOLEM = 76;
const int ID_PIRANHA = 77;
const int ID_RABBIT = 78;
const int ID_DSG_LARVA = 79;
const int ID_WISP = 80;	//NS - � ������ ��� �� ����?
//--------------------------
const int AIV_LASTBODY = 44;

const int AIV_ArenaFight = 45;
const int AF_NONE = 0;
const int AF_RUNNING = 1;
const int AF_AFTER = 2;
const int AF_AFTER_PLUS_DAMAGE = 3;

const int AIV_CrimeAbsolutionLevel = 46;
const int AIV_LastPlayerAR = 47;
const int AIV_DuelLost = 48; // �� ���.
const int AIV_ChapterInv = 49;
const int AIV_MM_Packhunter = 50;

const int AIV_MagicUser = 51;
const int MAGIC_NEVER = 0;
const int MAGIC_ALWAYS = 1;

const int AIV_DropDeadAndKill = 52;
const int AIV_FreezeStateTime = 53;
const int AIV_IGNORE_Murder = 54;
const int AIV_IGNORE_Theft = 55;
const int AIV_IGNORE_Sheepkiller = 56;
const int AIV_ToughGuy = 57;
const int AIV_NewsOverride = 58;
const int AIV_MaxDistToWp = 59;
const int AIV_OriginalFightTactic = 60;
const int AIV_EnemyOverride = 61;
const int AIV_SummonTime = 62;
const int AIV_FightDistCancel = 63;
const int AIV_LastFightComment = 64;
const int AIV_LOADGAME = 65;
const int AIV_DefeatedByPlayer = 66;
const int AIV_KilledByPlayer = 67;
const int AIV_StateTime = 68;
const int AIV_Dist = 69;
const int AIV_IgnoresFakeGuild = 70;
const int AIV_NoFightParker = 71;
const int AIV_NPCIsRanger = 72;
const int AIV_IgnoresArmor = 73;

//��� ��� ������ ����� ������������
const int AIV_StoryFlags = 74; //NS - 08/03/16 ��������� ��������� �����, ����� ����� ���������. ��������� ����� HasFlag
	const int AIV_StoryFlag_SwampGoblin = 1; //������ � ������
const int AIV_StoryBandit_Esteban = 75;

const int AIV_WhirlwindStateTime = 76;
const int AIV_InflateStateTime = 76;
const int AIV_SwarmStateTime = 76;
const int AIV_SuckEnergyStateTime = 76;
const int AIV_FollowDist = 77;

const int REAL_HITPOINTS_MAX = 80;
const int REAL_STRENGTH = 81;
const int REAL_DEXTERITY = 82;
const int REAL_MANA_MAX = 83;
const int REAL_TALENT_1H = 84;
const int REAL_TALENT_2H = 85;
const int REAL_TALENT_BOW = 86;
const int REAL_TALENT_CROSSBOW = 87;
const int AIV_SpellLevel = 88;
//Redleha: ����������� ���� aivar-�
const int AIV_TALKBREAKTIME = 89;
const int AIV_SECURITY = 90;
const int AIV_TIME_UNCONSCIOUS = 91;
const int AIV_Spell_4_Uncon = 92;
const int AIV_Name = 93;
const int AIV_ShieldEquipped = 94;
//const int AIV_TALENT_INDEX = 95; //--> � LeGo !�� �����
const int AIV_TALK_TRIA = 99;	//NS: ������� ��� LeGo

const int AIV_WeaponChoosePrio = 96;
const int WCR_1H = 1;
const int WCR_1H_SHIELD = 2;
const int WCR_1H_TWOHANDS = 3;
const int WCR_2H = 4;
const int WCR_2H_ORCWEAPON = 5;
//----------------------------------
var int ABSOLUTIONLEVEL_pir;
var int ABSOLUTIONLEVEL_BAU;
var int ABSOLUTIONLEVEL_PAL;
var int petzcounter_pir_murder;
var int petzcounter_pir_theft;
var int petzcounter_pir_attack;
var int PETZCOUNTER_BAU_MURDER;
var int PETZCOUNTER_BAU_Theft;
var int PETZCOUNTER_BAU_Attack;
var int PETZCOUNTER_BAU_SheepKiller;
var int PETZCOUNTER_PAL_MURDER;
var int PETZCOUNTER_PAL_Theft;
var int PETZCOUNTER_PAL_Attack;

const int LOC_NONE = 0;
const int LOC_PIR = 1;
const int LOC_BAU = 2;
const int LOC_PAL = 3;
const int LOC_ALL = 10;

const int Q_KASERNE = 1;
const int Q_GALGEN = 2;
const int Q_MARKT = 3;
const int Q_TEMPEL = 4;
const int Q_UNTERSTADT = 5;
const int Q_HAFEN = 6;
const int Q_OBERSTADT = 7;

const int PERC_DIST_SUMMONED_ACTIVE_MAX = 2000;
const int PERC_DIST_MONSTER_ACTIVE_MAX = 1500;
const int PERC_DIST_MONSTER_ACTIVE_MIN = 1000;
const int PERC_DIST_ORC_ACTIVE_MAX = 2500;
const int PERC_DIST_DRAGON_ACTIVE_MAX = 3500;
const int FIGHT_DIST_MONSTER_ATTACKRANGE = 700;
const int FIGHT_DIST_MONSTER_FLEE = 300;
const int FIGHT_DIST_DRAGON_MAGIC = 700;
const int MONSTER_THREATEN_TIME = 4;
const int MONSTER_SUMMON_TIME = 60;
const int TA_DIST_SELFWP_MAX = 500;
const int PERC_DIST_ACTIVE_MAX = 2000;
const int PERC_DIST_INTERMEDIAT = 1000;
const int PERC_DIST_DIALOG = 500;
const int PERC_DIST_DIALOG_DS = 700;
const int PERC_DIST_HEIGHT = 1000;
const int PERC_DIST_INDOOR_HEIGHT = 250;
const int FIGHT_DIST_MELEE = 600;
const int FIGHT_DIST_RANGED_INNER = 900;
const int FIGHT_DIST_RANGED_OUTER = 1000;
const int FIGHT_DIST_CANCEL = 3500;
const int WATCHFIGHT_DIST_MIN = 300;
const int WATCHFIGHT_DIST_MAX = 2000;
const int ZivilAnquatschDist = 400;

const float RANGED_CHANCE_MINDIST = 1500;
const float RANGED_CHANCE_MAXDIST = 4500;

const int NPC_ANGRY_TIME = 120;
const int LLAI_TIME_UNCONSCIOUS = 2;
const int LAI_TIME_UNCONSCIOUS = 8;
const int MAI_TIME_UNCONSCIOUS = 14;
const int HAI_TIME_UNCONSCIOUS = 20;
const int NPC_TIME_FOLLOW = 10;
const int NPC_MINIMAL_DAMAGE = 5;
const int NPC_MINIMAL_PERCENT = 10;
const int FAI_HUMAN_COWARD = 2;
const int FAI_HUMAN_NORMAL = 42;
const int FAI_HUMAN_STRONG = 3;
const int FAI_HUMAN_MASTER = 4;
const int FAI_MONSTER_COWARD = 10;
const int FAI_NAILED = 1;
const int FAI_GOBBO = 7;
const int FAI_SCAVENGER = 15;
const int FAI_GIANT_RAT = 11;
const int FAI_GIANT_BUG = 31;
const int FAI_BLOODFLY = 24;
const int FAI_WARAN = 21;
const int FAI_WOLF = 22;
const int FAI_MINECRAWLER = 5;
const int FAI_LURKER = 9;
const int FAI_ZOMBIE = 23;
const int FAI_SNAPPER = 18;
const int FAI_SHADOWBEAST = 16;
const int FAI_HARPY = 36;
const int FAI_STONEGOLEM = 8;
const int FAI_DEMON = 6;
const int FAI_TROLL = 20;
const int FAI_SWAMPSHARK = 19;
const int FAI_DRAGON = 39;
const int FAI_MOLERAT = 40;
const int FAI_ORC = 12;
const int FAI_DRACONIAN = 41;
const int FAI_Alligator = 43;
const int FAI_Gargoyle = 44;
const int FAI_Bear = 45;
const int FAI_Stoneguardian = 46;
const int FAI_ORC_BERSERC = 47;
const int TRUE = 1;
const int FALSE = 0;
const int LOOP_CONTINUE = 0;
const int LOOP_END = 1;
const int DEFAULT = 0;
const int LP_PER_LEVEL = 10;
const int HP_PER_LEVEL = 12;
const int XP_PER_VICTORY = 10;
//���� ��� - ������������ ��������������
const int NPCTYPE_AMBIENT = 0;
const int NPCTYPE_MAIN = 1;
const int NPCTYPE_FRIEND = 2;
const int NPCTYPE_PIR_MAIN = 3;
const int NPCTYPE_PIR_AMBIENT = 4;
const int NPCTYPE_BAU_MAIN = 5;
const int NPCTYPE_BAU_AMBIENT = 6;

const int NPCTYPE_Skel = 11;
const int NPCTYPE_TAL_AMBIENT = 12;
//�����-�������
const int MOBSI_NONE = 0;
const int MOBSI_SmithWeapon = 1;
const int MOBSI_SleepAbit = 2;
const int MOBSI_MakeRune = 3;
const int MOBSI_PotionAlchemy = 4;
const int MOBSI_PrayShrine = 5;
const int MOBSI_GOLDHACKEN = 6;
const int MOBSI_PRAYIDOL = 7;
const int MOBSI_MAGICOREHACKEN = 8;
const int MOBSI_SILVEROREHACKEN = 9;
const int MOBSI_FUSING = 10;
const int MOBSI_DESTROYSWORD = 11;
const int MOBSI_DRINKMAGICSPRING = 12;
const int MOBSI_PrayDark = 13;
const int MOBSI_OBV_BLACK_SWORD = 14;
const int MOBSI_IRONOREHACKEN = 15;
const int MOBSI_BRILLIANTHACKEN = 16;
const int MOBSI_SkinAndArmor = 17;
const int MOBSI_COININGMONEY = 18;
const int MOBSI_WOODCUTTING = 19;
const int MOBSI_ARROWRAW = 20;
const int MOBSI_teleportsagaworld = 21;
const int MOBSI_BOOMDOOR = 22;
const int MOBSI_ComplexityLevel = 23;
const int MOBSI_SpeakingDoor	= 24;
const int MOBSI_Sharpening	= 25;
var int player_mobsi_production;

const int BodyTex_P = 0;
const int BodyTex_N = 1;
const int BodyTex_L = 2;
const int BodyTex_B = 3;
const int BodyTexBabe_P = 4;
const int BodyTexBabe_N = 5;
const int BodyTexBabe_L = 6;
const int BodyTexBabe_B = 7;
const int BodyTex_Player = 8;
const int BodyTex_T = 10;
const int BodyTexBabe_F = 11;
const int BodyTexBabe_S = 12;
const int NO_ARMOR = -1;
const int Face_N_Gomez = 0;
const int Face_N_Scar = 1;
const int Face_N_Raven = 2;
const int Face_N_Bullit = 3;
const int Face_B_Thorus = 4;
const int Face_N_Corristo = 5;
const int Face_N_Milten = 6;
const int Face_N_Bloodwyn = 7;
const int Face_L_Scatty = 8;
const int Face_N_YBerion = 9;
const int Face_N_CoolPock = 10;
const int Face_B_CorAngar = 11;
const int Face_B_Saturas = 12;
const int Face_N_Xardas = 13;
const int Face_N_Lares = 14;
const int Face_L_Ratford = 15;
const int Face_N_Drax = 16;
const int Face_B_Gorn = 17;
const int Face_N_Player = 18;
const int Face_P_Lester = 19;
const int Face_N_Lee = 20;
const int Face_N_Torlof = 21;
const int Face_N_Mud = 22;
const int Face_N_Ricelord = 23;
const int Face_N_Horatio = 24;
const int Face_N_Richter = 25;
const int Face_N_Cipher_neu = 26;
const int Face_N_Homer = 27;
const int Face_B_Cavalorn = 28;
const int Face_L_Ian = 29;
const int Face_L_Diego = 30;
const int Face_N_MadPsi = 31;
const int Face_N_Bartholo = 32;
const int Face_N_Snaf = 33;
const int Face_N_Mordrag = 34;
const int Face_N_Lefty = 35;
const int Face_N_Wolf = 36;
const int Face_N_Fingers = 37;
const int Face_N_Whistler = 38;
const int Face_P_Gilbert = 39;
const int Face_L_Jackal = 40;
const int Face_P_ToughBald = 41;
const int Face_P_Tough_Drago = 42;
const int Face_P_Tough_Torrez = 43;
const int Face_P_Tough_Rodriguez = 44;
const int Face_P_ToughBald_Nek = 45;
const int Face_P_NormalBald = 46;
const int Face_P_Normal01 = 47;
const int Face_P_Normal02 = 48;
const int Face_P_Normal_Fletcher = 49;
const int Face_P_Normal03 = 50;
const int Face_P_NormalBart01 = 51;
const int Face_P_NormalBart_Cronos = 52;
const int Face_P_NormalBart_Nefarius = 53;
const int Face_P_NormalBart_Riordian = 54;
const int Face_P_OldMan_Gravo = 55;
const int Face_P_Weak_Cutter = 56;
const int Face_P_Weak_Ulf_Wohlers = 57;
const int Face_N_Important_Arto = 58;
const int Face_N_ImportantGrey = 59;
const int Face_N_ImportantOld = 60;
const int Face_N_Tough_Lee_ghnlich = 61;
const int Face_N_Tough_Skip = 62;
const int Face_N_ToughBart01 = 63;
const int Face_N_Tough_Okyl = 64;
const int Face_N_Normal01 = 65;
const int Face_N_Normal_Cord = 66;
const int Face_N_Normal_Olli_Kahn = 67;
const int Face_N_Normal02 = 68;
const int Face_N_Normal_Spassvogel = 69;
const int Face_N_Normal03 = 70;
const int Face_N_Normal04 = 71;
const int Face_N_Normal05 = 72;
const int Face_N_Normal_Stone = 73;
const int Face_N_Normal06 = 74;
const int Face_N_Normal_Erpresser = 75;
const int Face_N_Normal07 = 76;
const int Face_N_Normal_Blade = 77;
const int Face_N_Normal08 = 78;
const int Face_N_Normal14 = 79;
const int Face_N_Normal_Sly = 80;
const int Face_N_Normal16 = 81;
const int Face_N_Normal17 = 82;
const int Face_N_Normal18 = 83;
const int Face_N_Normal19 = 84;
const int Face_N_Normal20 = 85;
const int Face_N_NormalBart01 = 86;
const int Face_N_NormalBart02 = 87;
const int Face_N_NormalBart03 = 88;
const int Face_N_NormalBart04 = 89;
const int Face_N_NormalBart05 = 90;
const int Face_N_NormalBart06 = 91;
const int Face_N_NormalBart_Senyan = 92;
const int Face_N_NormalBart08 = 93;
const int Face_N_NormalBart09 = 94;
const int Face_N_NormalBart10 = 95;
const int Face_N_NormalBart11 = 96;
const int Face_N_NormalBart12 = 97;
const int Face_N_NormalBart_Dexter = 98;
const int Face_N_NormalBart_Graham = 99;
const int Face_N_NormalBart_Dusty = 100;
const int Face_N_NormalBart16 = 101;
const int Face_N_NormalBart17 = 102;
const int Face_N_NormalBart_Huno = 103;
const int Face_N_NormalBart_Grim = 104;
const int Face_N_NormalBart20 = 105;
const int Face_N_NormalBart21 = 106;
const int Face_N_NormalBart22 = 107;
const int Face_N_OldBald_Jeremiah = 108;
const int Face_N_Weak_Ulbert = 109;
const int Face_N_Weak_BaalNetbek = 110;
const int Face_N_Weak_Herek = 111;
const int Face_N_Weak04 = 112;
const int Face_N_Weak05 = 113;
const int Face_N_Weak_Orry = 114;
const int Face_N_Weak_Asghan = 115;
const int Face_N_Weak_Markus_Kark = 116;
const int Face_N_Weak_Cipher_alt = 117;
const int Face_N_NormalBart_Swiney = 118;
const int Face_N_Weak12 = 119;
const int Face_L_ToughBald01 = 120;
const int Face_L_Tough01 = 121;
const int Face_L_Tough02 = 122;
const int Face_L_Tough_Santino = 123;
const int Face_L_ToughBart_Quentin = 124;
const int Face_L_Normal_GorNaBar = 125;
const int Face_L_NormalBart01 = 126;
const int Face_L_NormalBart02 = 127;
const int Face_L_NormalBart_Rufus = 128;
const int Face_B_ToughBald = 129;
const int Face_B_Tough_Pacho = 130;
const int Face_B_Tough_Silas = 131;
const int Face_B_Normal01 = 132;
const int Face_B_Normal_Kirgo = 133;
const int Face_B_Normal_Sharky = 134;
const int Face_B_Normal_Orik = 135;
const int Face_B_Normal_Kharim = 136;
const int FaceBabe_N_BlackHair = 137;	
const int FaceBabe_N_Blondie = 138;		
const int FaceBabe_N_BlondTattoo = 139;
const int FaceBabe_N_PinkHair = 140;	
const int FaceBabe_L_Charlotte = 141;	
const int FaceBabe_B_RedLocks = 142;
const int FaceBabe_N_HairAndCloth = 143;
const int FaceBabe_N_WhiteCloth = 144;	
const int FaceBabe_N_GreyCloth = 145;
const int FaceBabe_N_Brown = 146;
const int FaceBabe_N_VlkBlonde = 147;
const int FaceBabe_N_BauBlonde = 148;
const int FaceBabe_N_YoungBlonde = 149;
const int FaceBabe_N_OldBlonde = 150;
const int FaceBabe_P_MidBlonde = 151;
const int FaceBabe_N_MidBauBlonde = 152;
const int FaceBabe_N_OldBrown = 153;
const int FaceBabe_N_Lilo = 154;
const int FaceBabe_N_Hure = 155;
const int FaceBabe_N_Anne = 156;
const int FaceBabe_B_RedLocks2 = 157;
const int FaceBabe_L_Charlotte2 = 158;
const int Face_N_Fortuno = 159;
const int Face_P_Greg = 160;
const int Face_N_Pirat01 = 161;
const int Face_N_ZombieMud = 162;
//163-175 - ���� ����������� � ��������� � ���.
const int Face_Fer_1 = 163;
const int Face_Fer_2 = 164;
const int Face_Fer_3 = 165;
const int Face_Fer_4 = 166;
const int Face_Fer_5 = 167;
const int Face_Fer_6 = 168;
const int Face_Fer_7 = 169;
const int Face_Fer_8 = 170;
const int Face_Fer_9 = 171;
const int Face_Fer_10 = 172;
const int Face_Fer_11 = 173;
const int Face_Fer_12 = 174;
const int Face_Fer_13 = 175;
//�����, ���, ���������.
const int Face_N_Pirat_DS_02 = 176;
const int Face_N_Pirat_DS_03 = 177;
const int Face_B_Pirat_DS_04 = 178;
const int Face_N_Pirat_DS_05 = 179;
const int Face_N_Pirat_DS_06 = 180;